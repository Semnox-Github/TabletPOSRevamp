library attendance_ui;
import 'package:master_data/models/user_role_container/user_role_container_dto.dart';
import 'package:shift_tracking/cashdrawer_assignment_dialog.dart';
import 'dart:io';
import 'package:attendance_data/builder.dart';
import 'package:attendance_data/model/attendanceForDay/attendance_for_day.dart';
import 'package:attendance_data/model/receipt/receipt_content_response.dart';
import 'package:attendance_data/model/recordAttendance/attendance_request.dart';
import 'package:attendance_data/model/template_header_container/receipt_template_header_container_dto.dart';
import 'package:attendance_ui/bloc/bloc/attendance_bloc.dart';
import 'package:attendance_ui/utilities/colors.dart';
import 'package:attendance_ui/utilities/text_style.dart';
import 'package:attendance_ui/widgets/attendance_form.dart';
import 'package:attendance_ui/widgets/attendance_recorded_pop_up.dart';
import 'package:attendance_ui/widgets/on_break_lock_screen_controller.dart';
import 'package:attendance_ui/widgets/pop_up_header.dart';
import 'package:execution_context/builder.dart';
import 'package:execution_context/execution_context_bl.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_data/models/login_data.dart';
import 'package:login_data/models/login_response.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:login_ui/manager_login_popup.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:semnox_tablet_pos/bluetooth_printers/bluetooth_printer_discovery_status_dialog.dart';
import 'package:semnox_tablet_pos/bluetooth_printers/no_printers_dialog.dart';
import 'package:semnox_tablet_pos/config/application.dart';
import 'package:semnox_tablet_pos/config/constants.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AttendancePopUp extends StatefulWidget {
  final Function onSuccess;
  final Function(String)? onFailureShowNotification;
  final VoidCallback? onCancelClicked;
  final bool? isFromBreak;
  final LoginResponse? loginResponse;

  const AttendancePopUp(
      {super.key,
      this.loginResponse,
      this.onFailureShowNotification,
      this.isFromBreak,
      this.onCancelClicked,
      required this.onSuccess});

  @override
  State<AttendancePopUp> createState() => _AttendancePopUpState();
}

class _AttendancePopUpState extends State<AttendancePopUp> {
  late NotificationBar _notificationBar;
  Size? _screenSize;
  String action = '';
  bool isOnBreak = false;
  LoginResponse? loginResponse;
  ExecutionContextBLContract? execContextBL;
  ExecutionContextDTO? execContextDTO;
  var _execContextBL;
  var _execContext;
  var _masterDataBl;
  late UserRoleContainerDTO _userRoleContainerDTO;
  UserRoleContainerDTO? _userRoleContainer;
  bool _isCurrentUserManager = false;

  static const printingMethodChannel = MethodChannel("semnox.tablet.pos/printing");
  static const deviceMethodChannel = MethodChannel("semnox.tablet.pos/device");
  bool _isFromClockOut = false;
  ReceiptContentResponse? receiptContentResponse;
  late SharedPreferences preferences;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _notificationBar = NotificationBar(showHideSideBar: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initLoginResponse();
      initBloc();
      _checkCurrentUserPrivileges();
    });

    Future.microtask(() async {
      if (!mounted) return;
      KColor.init(context);
      if(Platform.isAndroid) {
        preferences = await SharedPreferences.getInstance();
        if(Application.deviceManufacturer == null) {
          deviceMethodChannel.setMethodCallHandler(nativeMethodHandler);
          deviceMethodChannel.invokeMethod("getDeviceManufacturer");
        }
      }
    });

    super.initState();
  }

  Future<dynamic> nativeMethodHandler(MethodCall methodCall) async {
    switch(methodCall.method) {
      case "DEVICE MANUFACTURER":
        {
          Application.deviceManufacturer = methodCall.arguments;
        }
        break;
      case "PDA PRINTING SUCCESS" :
        {
          Future.microtask(() => context.read<AttendanceBloc>().add(HideLoading()));
          _recordAttendance(action, isFromClockOut: _isFromClockOut);
          _isFromClockOut = false;
        }
        break;
      case "PRINTER FOUND" :
        {
          var isPrinterMatchFound = false;
          if(preferences.getString(connectedPrinterMacAddress) != null) {
            if(preferences.getString(connectedPrinterMacAddress) == methodCall.arguments.toString()) {
              loader.hideLoaderDialog(context);
              loader.showLoaderDialog(context, MessagesProvider.get('Connecting to the Bluetooth Printer...'));
              Log.printMethodStart("connectToBluetoothPrinter()",'RECORD ATTENDANCE','init');
              printingMethodChannel.invokeMethod(
                  "connectToBluetoothPrinter",
                  {"printerAddress": methodCall.arguments.toString(),
                    "type": "ZEBRA",
                    "receipt": receiptContentResponse?.data![0].data,
                    "receiptType": "ATTENDANCE",
                    "isBitmap": true});
            } else {
              loader.hideLoaderDialog(context);
              _notificationBar.showMessage(
                  MessagesProvider.get("No Active Bluetooth Printers Found.."),
                  semnoxTheme.footerBG5!);
              _recordAttendance(action, isFromClockOut: _isFromClockOut);
            }
          } else {
            if(!isPrinterMatchFound) {
              loader.hideLoaderDialog(context);
              _notificationBar.showMessage(
                  MessagesProvider.get("No Active Bluetooth Printers Found.."),
                  semnoxTheme.footerBG5!);
              _recordAttendance(action, isFromClockOut: _isFromClockOut);
            }
          }
        }
        break;
      case "BLUETOOTH NOT SUPPORTED" :
        {
          loader.hideLoaderDialog(context);
          _recordAttendance(action, isFromClockOut: _isFromClockOut);
        }
        break;
      case "BLUETOOTH PERMISSION DENIED" :
        {
          loader.hideLoaderDialog(context);
          _notificationBar.showMessage(
              MessagesProvider.get("Unable to print the attendance receipt as the bluetooth permission was denied."),
              semnoxTheme.footerBG5!);
          _recordAttendance(action, isFromClockOut: _isFromClockOut);
        }
        break;
      case "LOCATION PERMISSION DENIED" :
        {
          loader.hideLoaderDialog(context);
          _notificationBar.showMessage(
              MessagesProvider.get("Unable to print the attendance receipt as the location permission was denied."),
              semnoxTheme.footerBG5!);
          _recordAttendance(action, isFromClockOut: _isFromClockOut);
        }
        break;
      case "BLUETOOTH TURNED OFF" :
        {
          loader.hideLoaderDialog(context);
          _notificationBar.showMessage(
              MessagesProvider.get("Unable to print the attendance receipt as the bluetooth is turned off."),
              semnoxTheme.footerBG5!);
          _recordAttendance(action, isFromClockOut: _isFromClockOut);
        }
        break;
      case "LOCATION TURNED OFF" :
        {
          loader.hideLoaderDialog(context);
          Future.delayed(const Duration(milliseconds: 300), () {
            showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                barrierColor: Colors.black45,
                transitionDuration: const Duration(milliseconds: 200),
                pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
                  return BluetoothPrinterDiscoveryStatusDialog(
                      onOkTapped: () {
                        _recordAttendance(action, isFromClockOut: _isFromClockOut);
                      },
                      content: methodCall.arguments.toString());
                });
          });
        }
        break;
      case "ERROR" :
        {
          loader.hideLoaderDialog(context);
          showGeneralDialog(
              context: context,
              barrierDismissible: true,
              barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
              barrierColor: Colors.black45,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
                return NoPrintersDialog(
                  onRescanTapped: () {
                    Future.microtask(() {
                      loader.showLoaderDialog(context, MessagesProvider.get("Re-Scanning for available Printers..."));
                    });
                    printingMethodChannel.invokeMethod("searchBluetoothPrinters");
                  },
                  onCancelTapped: () {
                    _recordAttendance(action, isFromClockOut: _isFromClockOut);
                  },
                  content: methodCall.arguments.toString(),
                );
              });
        }
        break;
      case "BLUETOOTH PRINTER CONNECT FAILED" :
        {
          loader.hideLoaderDialog(context);
          _notificationBar.showMessage(
              MessagesProvider.get("Unable to connect to the printer...."),
              semnoxTheme.footerBG5!);
          _recordAttendance(action, isFromClockOut: _isFromClockOut);
        }
        break;
      case "NO BLUETOOTH PRINTERS FOUND" :
        {
          loader.hideLoaderDialog(context);
          showGeneralDialog(
              context: context,
              barrierDismissible: true,
              barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
              barrierColor: Colors.black45,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
                return NoPrintersDialog(
                  onRescanTapped: () {
                    Future.microtask(() {
                      loader.showLoaderDialog(context, MessagesProvider.get("Re-Scanning for available Printers..."));
                    });
                    printingMethodChannel.invokeMethod("searchBluetoothPrinters");
                  },
                  onCancelTapped: () {
                    _recordAttendance(action, isFromClockOut: _isFromClockOut);
                  },
                  content: null
                );
              });
        }
        break;
      case "SUNMI PRINTER FAILED":
        {
          loader.hideLoaderDialog(context);
          Future.delayed(const Duration(milliseconds: 300), () {
            showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                barrierColor: Colors.black45,
                transitionDuration: const Duration(milliseconds: 200),
                pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
                  return BluetoothPrinterDiscoveryStatusDialog(
                      onOkTapped: () {
                        _recordAttendance(action, isFromClockOut: _isFromClockOut);
                      },
                      content: methodCall.arguments.toString());
                });
          });
        }
        break;
      case "SUNMI BLUETOOTH FAILED":
        {
          loader.hideLoaderDialog(context);
          Future.delayed(const Duration(milliseconds: 300), () {
            showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                barrierColor: Colors.black45,
                transitionDuration: const Duration(milliseconds: 200),
                pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
                  return BluetoothPrinterDiscoveryStatusDialog(
                      onOkTapped: () {
                        _recordAttendance(action, isFromClockOut: _isFromClockOut);
                      },
                      content: methodCall.arguments.toString());
                });
          });
        }
        break;
      case "SUNMI PRINTING SUCCESS" :
        {
          Future.microtask(() => context.read<AttendanceBloc>().add(HideLoading()));
          _recordAttendance(action, isFromClockOut: _isFromClockOut);
          _isFromClockOut = false;
        }
        break;
    }
  }

  initLoginResponse() async {
    execContextBL = await ExecutionContextBuilder.build();
    execContextDTO = execContextBL?.getExecutionContext();
    loginResponse = LoginResponse(
      data: LoginData(
        posMachineGuid: execContextDTO!.posMachineGuid!,
        token: execContextDTO?.token,
        webApiToken: execContextDTO?.webApiToken ?? '',
        languageId: execContextDTO?.languageId ?? 0,
        isCorporate: execContextDTO?.isCorporate ?? false,
        userPKId: execContextDTO?.userPKId ?? 0,
        userRoleId: execContextDTO?.userRoleId ?? 0,
        machineId: execContextDTO?.machineId ?? 0,
        siteId: execContextDTO?.siteId ?? 0,
        sitePKId: execContextDTO?.sitePKId ?? 0,
        userId: execContextDTO?.userId ?? '',
        posMachineName: execContextDTO?.posMachineName ?? '',
        languageCode: execContextDTO?.languageCode ?? '',
      ),
    );
    print(loginResponse);
  }

  handleClockIn(String action) async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBl = await MasterDataBuilder.build(execContext!);
    switch (action) {
      case "Clock In":
        {
          final result = await masterDataBl.getDefaultValuesByName(defaultValueName: 'ENABLE_AUTOPRINT_RECEIPT_ON_CLOCKIN');
          final enableAutoPrintOnClockIn = result == 'Y';
          enableAutoPrintOnClockIn
              ? Platform.isAndroid
                  ? await checkTemplateAndPrintReceipt(action)
                  : _recordAttendance(action)
              : _recordAttendance(action);
        }
        break;
      case "Clock Out":
        {
          _isFromClockOut = true;
          final result = await masterDataBl.getDefaultValuesByName(defaultValueName: 'ENABLE_AUTOPRINT_RECEIPT_ON_CLOCKOUT');
          final enableAutoPrintOnClockOut = result == 'Y';
          enableAutoPrintOnClockOut
              ? Platform.isAndroid
                  ? await checkTemplateAndPrintReceipt(action, isFromClockOut: true)
                  : _recordAttendance(action, isFromClockOut: true)
              : _recordAttendance(action, isFromClockOut: true);
        }
        break;
      default :
        {
          _recordAttendance(action);
        }
    }
  }

  _recordAttendance(String action, {bool isFromClockOut = false}) {
    final attendanceRequest = AttendanceRequest(
      type: action,
      tipValue: action == 'Clock Out'
          ? int.parse(context.read<AttendanceBloc>().tipController.text == ""
              ? "0"
              : context.read<AttendanceBloc>().tipController.text)
          : 0,
      status: action,
      attendanceRoleId: widget.loginResponse?.data?.userRoleId ?? execContextDTO?.userRoleId ?? 0,
      attendanceRoleApproverId: widget.loginResponse?.data!.userPKId ?? execContextDTO?.userPKId ?? 0,
    );
    if (action == 'On Break') {
      isOnBreak = true;
    }
    context.read<AttendanceBloc>().setAttendanceRequest(attendanceRequest);
    context
        .read<AttendanceBloc>()
        .add(RecordAttendance(widget.loginResponse?.data?.userPKId ?? execContextDTO?.userPKId ?? 0));
  }

  Future<void> checkTemplateAndPrintReceipt(String action, {bool isFromClockOut = false}) async {
    if (Application.isBluetoothSupported == true) {
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();
      final masterDataBl = await MasterDataBuilder.build(execContext!);

      Future.microtask(() =>
          loader.showLoaderDialog(context,
              MessagesProvider.get("Please wait while we get the attendance receipt")));
      final attendanceDataBL = await AttendanceDataBuilder.build(execContext);
      final templateGUID = await masterDataBl.getDefaultValuesByName(defaultValueName: 'ATTENDANCE_PRINT_TEMPLATE');
      final templates = await attendanceDataBL.getReceiptTemplateContainer({'siteId': execContext.siteId});
      Application.printerType = await masterDataBl.getDefaultValuesByName(defaultValueName: "PRINTER_TYPE");
      ReceiptTemplateHeaderContainerDTO? receiptTemplate;
      for (var element in (templates.data?.receiptPrintTemplateHeaderContainerDTOList ?? <ReceiptTemplateHeaderContainerDTO>[])) {
        if (element.guid.toUpperCase() == templateGUID?.toUpperCase()) {
          receiptTemplate = element;
        }
      }
      if (receiptTemplate != null) {
        Log.printMethodStart("getReceiptContent()",'RECORD ATTENDANCE','init');
        receiptContentResponse = await attendanceDataBL.getReceiptContent(execContext.userPKId ?? -1,
            {'printTemplateId': receiptTemplate.templateId, 'userId': execContext.userPKId ?? -1, 'formats': "Image"});
        Log.printMethodEnd("getReceiptContent()",'RECORD ATTENDANCE','init');
        if(receiptContentResponse?.data == null){
          Log.printMethodReturn("getReceiptContent() - Success",'RECORD ATTENDANCE','init');
        }
        loader.hideLoaderDialog(context);
        if (Application.deviceManufacturer == "SUNMI" && Application.printerType == "SUNMI") {
          Future.microtask(() =>
              loader.showLoaderDialog(context,
                  MessagesProvider.get("Printing the attendance receipt....")));
          printingMethodChannel.setMethodCallHandler(nativeMethodHandler);
          Log.printMethodStart("printReceipt()",'RECORD ATTENDANCE','init');
          printingMethodChannel.invokeMethod("printReceipt", {
            "type": "SUNMI",
            "receipt": receiptContentResponse?.data![0].data,
            "receiptType": "ATTENDANCE",
            "isBitmap": true,
          });
          Log.printMethodEnd("printReceipt()",'RECORD ATTENDANCE','init');
        } else if (Application.printerType == "ZEBRA" && Application.deviceManufacturer != "SUNMI") {
          Future.microtask(() =>
              loader.showLoaderDialog(context,
                  MessagesProvider.get("Searching for the bluetooth printer....")));
          printingMethodChannel.setMethodCallHandler(nativeMethodHandler);
          Log.printMethodStart("printReceipt()",'RECORD ATTENDANCE','init');
          printingMethodChannel.invokeMethod("printReceipt", {
            "type": "ZEBRA",
            "receipt": receiptContentResponse?.data![0].data,
            "receiptType": "ATTENDANCE",
            "isBitmap": true
          });
          Log.printMethodEnd("printReceipt()",'RECORD ATTENDANCE','init');
        } else {
          if(isFromClockOut) {
            context.read<AttendanceBloc>().setPrinterTypeNotSetMessage('Completed the clock-out successfully. Unfortunately print receipt failed as Printer Type is not set up.');
          } else {
            context.read<AttendanceBloc>().setPrinterTypeNotSetMessage('Completed the clock-in successfully. Unfortunately print receipt failed as Printer Type is not set up.');
          }
          _recordAttendance(action, isFromClockOut: isFromClockOut);
        }
      } else {
        loader.hideLoaderDialog(context);
        _recordAttendance(action, isFromClockOut: isFromClockOut);
      }
    } else {
      _recordAttendance(action, isFromClockOut: isFromClockOut);
    }
  }

  setAction(AttendanceForDay response) {
    if (response.data == null ||
        response.data!.attendanceLogDTOList!.isEmpty ||
        response.data!.attendanceLogDTOList!.last.status == 'Clock Out') {
      return 'Clock In';
    } else if (response.data!.attendanceLogDTOList!.last.status == 'On Break') {
      context.read<AttendanceBloc>().breakTimeCal();
      return 'Back from Break';
    }

    return 'Clock Out';
  }

  void initBloc() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();

    if (!mounted) return;
    context.read<AttendanceBloc>().setLoginResponse(widget.loginResponse);
    context.read<AttendanceBloc>().add(
          GetAttendanceDetails(
            widget.loginResponse?.data?.userPKId ??
                execContextDTO?.userPKId ??
                0,
          ),
        );
  }

  Future<void> _checkCurrentUserPrivileges() async {
    _execContextBL = await ExecutionContextBuilder.build();
    _execContext = _execContextBL.getExecutionContext();
    _masterDataBl = await MasterDataBuilder.build(_execContext!);
    _userRoleContainerDTO = await _masterDataBl.getUserRoleById(_execContext.userRoleId ?? -1);
    _isCurrentUserManager = _userRoleContainerDTO.selfApprovalAllowed == true;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    _screenSize = MediaQuery.of(context).size;
    KTextStyle.init(context);
    SizeConfig.init(context);
    double width = _screenSize!.width;
    return WillPopScope(
      onWillPop: () async => false,
      child:Scaffold(
        key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: SizedBox(
        width: width,
        child: Container(
          color: Colors.green,
          child: _notificationBar,
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.getSize(8.0)),
                  child: Column(
                    children: [
                      PopUpHeader(onBackClicked: () {
                        if(widget.onCancelClicked != null) {
                          widget.onCancelClicked!();
                        }
                      }),
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              SizeConfig.getWidth(0),
                              SizeConfig.getHeight(0),
                              SizeConfig.getWidth(0),
                              SizeConfig.getHeight(0)),
                          child: Container(
                            padding: EdgeInsets.only(
                                right: SizeConfig.getWidth(21.0),
                                bottom: SizeConfig.getHeight(3)),
                            decoration: BoxDecoration(
                              color: theme.backGroundColor,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(SizeConfig.getSize(8)),
                                  bottomLeft: Radius.circular(SizeConfig.getSize(8))),
                            ),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
                              child: BlocConsumer<AttendanceBloc, AttendanceState>(
                                listener: (context, state) {
                                  final AttendanceBloc attendanceBloc = context.read<AttendanceBloc>();
                                  if (state is AttendnanceForDayLoaded) {
                                    Future.microtask(() => loader.hideLoaderDialog(context));
                                    // if (attendanceBloc
                                    //             .attendanceForDay
                                    //             ?.data
                                    //             ?.attendanceLogDTOList
                                    //             ?.last
                                    //             .status ==
                                    //         'On Break' &&
                                    //     (widget.isFromBreak ?? false)) {
                                    //   Navigator.of(context).pop();
                                    // }
                                  } else if (state is LoadingState) {
                                    Future.microtask(() => loader.showLoaderDialog(context));
                                  } else if (state is LoadedState) {
                                    Future.microtask(() => loader.hideLoaderDialog(context));
                                  } else if (state is AttendanceRecorded) {
                                    Future.microtask(() => loader.hideLoaderDialog(context));
                                    if (action == "Clock In" || action == 'Back from Break') {
                                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AttendanceRecordedPopUp(
                                              user: widget.loginResponse?.data?.userId ?? execContextDTO?.userId ?? '',
                                              onOkTapped: () {
                                                Navigator.of(context).pop();
                                                widget.onSuccess();
                                              },
                                            );
                                          },
                                        );
                                      });
                                    } else if (action == "Clock Out" && isOnBreak == false) {
                                      // Navigator.of(context).pop();
                                      // Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                      attendanceBloc.tipController.clear();
                                      widget.onSuccess();
                                    } else {
                                      Future.delayed(const Duration(seconds: 1), () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => const LockScreenController(),
                                            ),
                                            (route) => false);
                                      });
                                    }
                                  } else if (state is SiteError) {
                                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                                      widget.onFailureShowNotification!(state.errorString);
                                    });
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  } else if (state is ErrorState) {
                                    WidgetsBinding.instance.addPostFrameCallback((_) {
                                      widget.onFailureShowNotification!(state.errorString);
                                    });
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  }
                                },
                                builder: (context, state) {
                                  final attendanceBloc = context.read<AttendanceBloc>();

                                  if (state is AttendnanceForDayLoaded) {
                                    action = setAction(state.response);
                                    return AttendanceForm(
                                      tipController: attendanceBloc.tipController,
                                      width: width,
                                      data: state.response,
                                      action: action == 'Back from Break' ? attendanceBloc.onBreakString : action,
                                      handleCLockIn: handleClockIn,
                                      dropDown: attendanceBloc.ofValues,
                                      user: widget.loginResponse?.data?.userId ?? execContextDTO?.userId ?? '',
                                      attendanceBloc: attendanceBloc,
                                      onCancelClicked: () {
                                        if(widget.onCancelClicked != null) {
                                          widget.onCancelClicked!();
                                        }
                                      },
                                    );
                                  }
                                  return Container(
                                    color: theme.backGroundColor,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },),
        ),
      ),
    );
  }

  /*Future<void> performBluetoothPrinterConnection(MasterDataBLContract masterDataBL) async {
    var printerTypes = await masterDataBL.getLookUpValuesByName("PRINTER_TYPE");
    var receiptPrinterId = -1;
    if(printerTypes?.isNotEmpty == true) {
      printerTypes?.forEach((printerContainer) {
        if(printerContainer.lookupValue == "ReceiptPrinter") {
          receiptPrinterId = printerContainer.lookupValueId;
        }
      });
    }

    if(receiptPrinterId != -1) {
      //TODO Search for the printer id and then connect to the same.
    }
  }*/
}
