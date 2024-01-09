// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:application_prefs_data/builder.dart';
import 'package:attendance_data/attendance_data_bl.dart';
import 'package:attendance_data/builder.dart';
import 'package:attendance_data/model/attendanceForDay/attendance_for_day.dart';
import 'package:attendance_data/model/receipt/receipt_content_response.dart';
import 'package:attendance_data/model/recordAttendance/attendance_request.dart';
import 'package:attendance_data/model/shiftConfig/shift_config_model.dart';
import 'package:attendance_data/model/template_header_container/receipt_template_header_container_dto.dart';
import 'package:attendance_ui/attendance_ui.dart';
import 'package:attendance_ui/bloc/bloc/attendance_bloc.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:instant/instant.dart';
import 'package:intl/intl.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:login_data/models/login_response.dart';
import 'package:login_ui/authenticate_user_pop_up.dart';
import 'package:login_ui/change_site_popup.dart';
import 'package:login_ui/manager_login_popup.dart';
import 'package:login_ui/utils/common_widgets.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/pos_machines_container/pos_machine_container_dto.dart';
import 'package:master_data/models/sites/site_dto.dart';
import 'package:master_data/models/task_types_container/task_type_container_dto.dart';
import 'package:master_data/models/user_role_container/management_form_access_container_dto.dart';
import 'package:master_data/models/user_role_container/user_role_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:network_module/builder.dart';
import 'package:network_module/core/network/error_interceptor.dart';
import 'package:nfc/nfc.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:orders_data/builder.dart';
import 'package:orders_data/models/transactions/transaction_data.dart';
import 'package:orders_ui/OrdersPage.dart';
import 'package:other_function_ui/other_function_ui.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:payment_ui/cubits/payment_summary/payment_screen_cubit.dart';
import 'package:product_menu_data/builder.dart';
import 'package:semnox_tablet_pos/AppStyle.dart';
import 'package:semnox_tablet_pos/SalesScreen.dart';
import 'package:semnox_tablet_pos/SplashScreen.dart';
import 'package:semnox_tablet_pos/config/application.dart';
import 'package:semnox_tablet_pos/config/constants.dart';
import 'package:semnox_tablet_pos/developer_settings_screen.dart';
import 'package:semnox_tablet_pos/lock_screen_controller.dart';
import 'package:semnox_tablet_pos/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shift_tracking/cashdrawer_assignment_dialog.dart';
import 'package:shift_tracking_data/builder.dart';
import 'package:shift_tracking_data/models/shift_dto/shift_dto.dart';
import 'package:system_user_login_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/builder.dart';
import 'package:transaction_data/models/user_container/user_container_response.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:widgets_library/models/printer_state_model.dart';
import 'package:widgets_library/generic_dialog.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:widgets_library/utils/time_zones.dart';
import 'AppColors.dart';
import 'bluetooth_printers/bluetooth_printer_discovery_status_dialog.dart';
import 'bluetooth_printers/no_printers_dialog.dart';
import 'customer_screen.dart';
import 'feature_not_implemented_view.dart';
import 'pos_setup/pos_setup_screen.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:http/http.dart' as http;

typedef OnLoadingStatusUpdate = Function(bool isLoading);


class DashboardLHS extends StatefulWidget {
  final bool isFromBreak;
  ValueNotifier lhsScreen;
  final BuildContext context;
  final NotificationBar notificationBar;
  final OnLoadingStatusUpdate onLoadingStatusUpdate;
  final Function(String, bool) onShowMessage;
  final List<TaskTypeContainerDto> tasksList;
  final List<TaskTypeContainerDto> settingTask;

  DashboardLHS(
      {super.key,
      required this.settingTask,
      required this.context,
      required this.notificationBar,
      required this.onLoadingStatusUpdate,
      required this.onShowMessage,
      required this.isFromBreak,
      required this.lhsScreen,
      required this.tasksList});

  @override
  State<DashboardLHS> createState() => _DashboardLHSState();
}

class _DashboardLHSState extends State<DashboardLHS> {
  bool _splashImgDownloaded = false;
  String? _brandImagePath;
  String? _siteName;
  String? _posMachineName;
  String? _userName;
  String? _userRole;
  SiteDTO? _selectedSite;
  String? _counterName;
  String? _defaultPaymentMode;
  String _lastClockInTime = '';
  String _dateTimeFormat = 'dd-MMM-yyyy h:mm:ss tt';
  POSMachineContainerDTO? posMachineContainerDTO;
  late AttendanceDataBLContract attendanceBl;
  AttendanceForDay? attendanceForDay;
  final _siteList = <SiteDTO>[];
  final _scrollController = ScrollController();
  UserRoleContainerDTO? userRoleDTO;
  late SemnoxTheme _theme;
  late UserContainerResponse userContainerResponse;
  var _execContextBL;
  var _execContext;
  var _masterDataBl;
  late UserRoleContainerDTO _userRoleContainerDTO;
  UserRoleContainerDTO? _userRoleContainer;
  bool _isCurrentUserManager = false;
  bool _isEnabledButton = true;
  Timer? timer;
  ShiftConfigResponseModel? shiftConfigList;
  ShiftConfigurationsContainerDtoList? shiftConfigurationsContainerDtoList;
  OverlayEntry? overlayEntry;
  OverlayEntry? loaderEntry;
  int? shiftTrackPrompTime, shiftEndTime;
  DateTime? firstClockIn;
  AttendanceLogDTOList? attendanceLogDTOList;
  String? shiftStaus;
  static const deviceMethodChannel = MethodChannel("semnox.tablet.pos/device");
  static const printingMethodChannel = MethodChannel("semnox.tablet.pos/printing");
  bool _isEnableEndOfDay = true;
  bool _isEODchecked = false;
  var _isFacilityEmpty = false;
  String posZreceipt = '';
  late SharedPreferences preferences;
  ReceiptContentResponse? receiptContentResponse;
  late NotificationBar notificationBar;

  @override
  void initState() {
    super.initState();

    isShiftOpenOrClosed.value = '';
    Future.microtask(()=> _checkFacilities());
    Future.microtask(() => _checkCurrentUserPrivileges());
    Future.microtask(() => _deleteCacheDir());
    Future.microtask(() => {
          /// start local session (expires in 5 minutes)
          Application.sessionStateStream.sink.add(SessionState.startListening)
        });
    Future.microtask(() => {_updateSplashImage()});
    Future.microtask(() => {_getUiInfo(showShiftTracking: !widget.isFromBreak)});
    Future.microtask(() => {
          _setUpErrorStreamListener(onConnectivityError: () {
            Future.microtask(() => Application.navKey.currentState?.pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) => const LoginController()), (route) => false));
          })
        });
    Future.microtask(() => {getOpenShiftDetails()});
    Future.microtask(() async {
      if (!mounted) return;
      if(Platform.isAndroid) {
        preferences = await SharedPreferences.getInstance();
        if(Application.deviceManufacturer == null) {
          deviceMethodChannel.setMethodCallHandler(nativeMethodHandler);
          deviceMethodChannel.invokeMethod("getDeviceManufacturer");
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if(Platform.isAndroid) {
        deviceMethodChannel.setMethodCallHandler(nativeMethodHandler);
        deviceMethodChannel.invokeMethod("requestBluetoothAndLocationPermission");
      }
    });
    notificationBar = NotificationBar(showHideSideBar: false);
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
          loader.hideLoaderDialog(context);
          widget.notificationBar.showMessage(
              MessagesProvider.get("Pos-Z Receipt has been printed out."), AppColors.notificationBGLightBlueColor);
          if (Platform.isAndroid)
          {SystemNavigator.pop();}
          else if (Platform.isIOS)
          {exit(0);}
        }
        break;
      case "PRINTER FOUND" :
        {
          var isPrinterMatchFound = false;
          if(preferences.getString(connectedPrinterMacAddress) != null) {
            if(preferences.getString(connectedPrinterMacAddress) == methodCall.arguments.toString()) {
              loader.hideLoaderDialog(context);
              loader.showLoaderDialog(context, MessagesProvider.get('Connecting to the Bluetooth Printer...'));
              printingMethodChannel.invokeMethod(
                  "connectToBluetoothPrinter",
                  {"printerAddress": methodCall.arguments.toString(),
                    "type": "ZEBRA",
                    "receipt": posZreceipt,
                    "receiptType": "POSREPORT",
                    "isBitmap": true});
            } else {
              loader.hideLoaderDialog(context);
              widget.notificationBar.showMessage(
                  MessagesProvider.get("No Active Bluetooth Printers Found.."),
                  semnoxTheme.footerBG5!);

            }
          } else {
            Application.activePrinters?.forEach((printerData) {
              if(!isPrinterMatchFound) {
                if (methodCall.arguments.toString() == printerData.ipAddress ) {
                  isPrinterMatchFound = true;
                  preferences.setString(connectedPrinterMacAddress, methodCall.arguments.toString());
                  loader.hideLoaderDialog(context);
                  loader.showLoaderDialog(context, MessagesProvider.get('Connecting to the Bluetooth Printer...'));
                  printingMethodChannel.invokeMethod(
                      "connectToBluetoothPrinter",
                      {"printerAddress": methodCall.arguments.toString(),
                        "type": "ZEBRA",
                        "receipt": posZreceipt,
                        "receiptType": "POSREPORT",
                        "isBitmap": true});
                }
              }
            });

            if(!isPrinterMatchFound) {
              loader.hideLoaderDialog(context);
              widget.notificationBar.showMessage(
                  MessagesProvider.get("No Active Bluetooth Printers Found.."),
                  semnoxTheme.footerBG5!);
             // _recordAttendance(action, isFromClockOut: _isFromClockOut);
            }
          }
        }
        break;
      case "BLUETOOTH NOT SUPPORTED" :
        {
          loader.hideLoaderDialog(context);
          widget.notificationBar.showMessage(
              MessagesProvider.get(""
                  "Unable to print the pos-z receipt as the bluetooth permission is denied."), AppColors.notificationBGLightBlueColor);
        }
        break;
      case "BLUETOOTH PERMISSION DENIED" :
        {
          loader.hideLoaderDialog(context);
          widget.notificationBar.showMessage(
              MessagesProvider.get("Unable to print the pos-z receipt as the bluetooth permission was denied."),
              semnoxTheme.footerBG5!);;
        }
        break;
      case "LOCATION PERMISSION DENIED" :
        {
          loader.hideLoaderDialog(context);
          widget.notificationBar.showMessage(
              MessagesProvider.get("Unable to print the pos-z receipt as the location permission was denied."),
              semnoxTheme.footerBG5!);
        }
        break;
      case "BLUETOOTH TURNED OFF" :
        {
          loader.hideLoaderDialog(context);
          widget.notificationBar.showMessage(
              MessagesProvider.get("Unable to print the pos-z receipt as the bluetooth is turned off."),
              semnoxTheme.footerBG5!);
        }
        break;
      case "LOCATION TURNED OFF" :
        {
          loader.hideLoaderDialog(context);
          widget.notificationBar.showMessage(
              MessagesProvider.get(""
                  "Unable to print the pos-z receipt as the location is turned off."), AppColors.notificationBGLightBlueColor);
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
                    printingMethodChannel.setMethodCallHandler(nativeMethodHandler);
                    printingMethodChannel.invokeMethod("printReceipt", {
                      "type": "ZEBRA",
                      "receipt": posZreceipt,
                      "receiptType": "POSREPORT",
                      "isBitmap": true
                    });
                  },
                  onCancelTapped: () {
                  },
                  content: methodCall.arguments.toString(),
                );
              });
        }
        break;
      case "BLUETOOTH PRINTER CONNECT FAILED" :
        {
          loader.hideLoaderDialog(context);
          widget.notificationBar.showMessage(
              MessagesProvider.get("Unable to connect to the printer...."),
              semnoxTheme.footerBG5!);
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
                      printingMethodChannel.setMethodCallHandler(nativeMethodHandler);
                      printingMethodChannel.invokeMethod("printReceipt", {
                        "type": "ZEBRA",
                        "receipt": posZreceipt,
                        "receiptType": "POSREPORT",
                        "isBitmap": true
                      });
                    },
                    onCancelTapped: () {
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
                        loader.hideLoaderDialog(context);
                        print("SUNMI PRINTER FAILED");
                        // widget.notificationBar.showMessage(
                        //     MessagesProvider.get("Completed transaction successfully."), AppColors.notificationBGLightBlueColor);
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
                        loader.hideLoaderDialog(context);
                       // widget.notificationBar.showMessage(
                       //      MessagesProvider.get("Completed transaction successfully."), AppColors.notificationBGLightBlueColor);
                       print("SUNMI BLUETOOTH FAILED");
                      },
                      content: methodCall.arguments.toString());
                });
          });
        }
        break;
      case "SUNMI PRINTING SUCCESS" :
         {
           loader.hideLoaderDialog(context);
           print("SUNMI PRINTING SUCCESS");
           if (Platform.isAndroid)
           {SystemNavigator.pop();}
           else if (Platform.isIOS)
           {exit(0);}
        //   Future.microtask(() => context.read<AttendanceBloc>().add(HideLoading()));
        //   _recordAttendance(action, isFromClockOut: _isFromClockOut);
        //   _isFromClockOut = false;
         }
        break;
    }
  }


  loaderOverlay(BuildContext context, [String? message]) {
    loaderEntry = OverlayEntry(
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(children: [
            const SizedBox(width: 8),
            const CircularProgressIndicator(),
            const SizedBox(width: 24),
            Text(message ?? "Loading..."),
          ]),
        );
      },
    );
    Overlay.of(context).insert(loaderEntry!);
  }

  void showOverlay(execContextDTO) {
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: BlocListener<AttendanceBloc, AttendanceState>(
            listener: (context, state) {
              if (state is LoadingState) {
                loaderOverlay(context);
              } else if (state is AttendanceRecorded) {
                Future.microtask(() => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginController(isFromDashBoard: true)),
                    (route) => false));
                loaderEntry?.remove();
                overlayEntry?.remove();
              }
            },
            child: AlertDialog(
              backgroundColor: _theme.primaryColor,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  MessagesProvider.get('attendance').toUpperCase(),
                  style: _theme.heading5?.copyWith(fontSize: SizeConfig.getSize(26)),
                  textAlign: TextAlign.center,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              //insetPadding: EdgeInsets.symmetric(vertical: 100),
              insetPadding: EdgeInsets.zero,
              content: SizedBox(
                width: SizeConfig.getSize(700),
                height: SizeConfig.getHeight(100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 1,
                      color: _theme.dialogHeaderInnerShadow,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      MessagesProvider.get(
                          'Your shift is over. Manager approval is required to work overtime. Do you want to continue?'),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: SizeConfig.getFontSize(22)),
                    ),
                    Container(
                      height: 1,
                      color: _theme.dialogHeaderInnerShadow,
                    )
                  ],
                ),
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      context.read<AttendanceBloc>().setAttendanceBL(attendanceBl);
                      context.read<AttendanceBloc>().setAttendanceRequest(AttendanceRequest(
                            type: 'Clock Out',
                            isAutoClockInOut: true,
                            tipValue: 0,
                            status: 'Clock Out',
                            attendanceRoleId: execContextDTO?.userRoleId ?? 0,
                            // approvedBy: 'semnox',
                            attendanceRoleApproverId: execContextDTO?.userPKId ?? 0,
                          ));
                      context.read<AttendanceBloc>().add(AutoClockOut(execContextDTO?.userPKId ?? 0));
                      // await attendanceBl.recordAttendance(
                      //     AttendanceRequest(
                      //       type: 'Clock Out',
                      //       isAutoClockInOut: true,
                      //       tipValue: 0,
                      //       status: 'Clock Out',
                      //       attendanceRoleId: execContextDTO?.userRoleId ?? 0,
                      //       // approvedBy: 'semnox',
                      //       attendanceRoleApproverId:
                      //           execContextDTO?.userPKId ?? 0,
                      //     ),
                      //     userId: execContextDTO?.userPKId ?? 0);
                      // Future.microtask(() => Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             const LoginController(isFromDashBoard: true)),
                      //     (route) => false));
                      // overlayEntry?.remove();
                    },
                    style: ElevatedButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      maximumSize: Size(SizeConfig.getSize(100), SizeConfig.getSize(42)),
                      minimumSize: Size(SizeConfig.getSize(100), SizeConfig.getSize(42)),
                      backgroundColor: _theme.button1BG1!,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                    ),
                    child: Text(MessagesProvider.get("NO"),
                        style: _theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(19))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      overlayEntry?.remove();

                      _showManagerLoginPopup(
                        cancelBtn: (dialogcontext) {
                          showDialog(
                              context: dialogcontext,
                              barrierDismissible: false,
                              builder: (dialogcontext) {
                                return showManagerRequiredOverLay();
                              });
                        },
                        onAuthSuccess: (LoginResponse response) async {
                          var execContextBL = await ExecutionContextBuilder.build();
                          var execContextDTO = execContextBL.getExecutionContext();
                          await attendanceBl.recordAttendance(
                              AttendanceRequest(
                                type: 'Clock In',
                                isAutoClockInOut: true,
                                tipValue: 0,
                                status: 'Clock In',
                                approvedBy: response.data?.userId,
                                attendanceRoleId: execContextDTO?.userRoleId ?? 0,
                                attendanceRoleApproverId: response.data?.userPKId ?? 0,
                              ),
                              userId: execContextDTO?.userPKId ?? 0);
                          attendanceForDay = await attendanceBl.getAttendanceDetails(userId: execContextDTO?.userPKId ?? 0);
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _theme.button2InnerShadow1!,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      maximumSize: Size(SizeConfig.getSize(100), SizeConfig.getSize(42)),
                      minimumSize: Size(SizeConfig.getSize(100), SizeConfig.getSize(42)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                    ),
                    child: Text(MessagesProvider.get("YES"),
                        style: _theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(19), color: _theme.light1!)),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(overlayEntry!);
  }

  showManagerRequiredOverLay() {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: AlertDialog(
          backgroundColor: _theme.primaryColor,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              MessagesProvider.get('attendance').toUpperCase(),
              style: _theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(26)),
              textAlign: TextAlign.center,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          //insetPadding: EdgeInsets.symmetric(vertical: 100),
          insetPadding: EdgeInsets.zero,
          content: SizedBox(
            width: SizeConfig.getSize(700),
            height: SizeConfig.getHeight(100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 1,
                  color: _theme.dialogHeaderInnerShadow,
                ),
                const SizedBox(height: 20),
                Text(
                  MessagesProvider.get('Manager Approval is required to work Overtime'),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 1,
                  color: _theme.dialogHeaderInnerShadow,
                )
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _showManagerLoginPopup(
                    cancelBtn: (dialogcontext) {
                      showDialog(
                          context: dialogcontext,
                          barrierDismissible: false,
                          builder: (dialogcontext) {
                            return showManagerRequiredOverLay();
                          });
                    },
                    onAuthSuccess: (LoginResponse response) async {
                      var execContextBL = await ExecutionContextBuilder.build();
                      var execContextDTO = execContextBL.getExecutionContext();
                      await attendanceBl.recordAttendance(
                          AttendanceRequest(
                              type: 'Clock Out',
                              isAutoClockInOut: true,
                              tipValue: 0,
                              status: 'Clock Out',
                              attendanceRoleId: execContextDTO?.userRoleId ?? 0,
                              attendanceRoleApproverId: response.data?.userPKId ?? 0,
                              approvedBy: response.data?.userId),
                          userId: execContextDTO?.userPKId ?? 0);
                      await attendanceBl.recordAttendance(
                          AttendanceRequest(
                            type: 'Clock In',
                            isAutoClockInOut: true,
                            tipValue: 0,
                            status: 'Clock In',
                            approvedBy: response.data?.userId,
                            attendanceRoleId: execContextDTO?.userRoleId ?? 0,
                            attendanceRoleApproverId: response.data?.userPKId ?? 0,
                          ),
                          userId: execContextDTO?.userPKId ?? 0);
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _theme.button1BG1!,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  maximumSize: Size(SizeConfig.getSize(100), SizeConfig.getSize(42)),
                  minimumSize: Size(SizeConfig.getSize(100), SizeConfig.getSize(42)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                ),
                child: Text(MessagesProvider.get("OK"), style: _theme.heading5?.copyWith(fontSize: SizeConfig.getSize(19))),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showShiftOverOverlay() {
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: AlertDialog(
            backgroundColor: _theme.primaryColor,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                MessagesProvider.get('attendance').toUpperCase(),
                style: _theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(26)),
                textAlign: TextAlign.center,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            //insetPadding: EdgeInsets.symmetric(vertical: 100),
            insetPadding: EdgeInsets.zero,
            content: SizedBox(
              width: SizeConfig.getSize(700),
              height: SizeConfig.getHeight(100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 1,
                    color: _theme.dialogHeaderInnerShadow,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    MessagesProvider.get('Your shift is over.'),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 1,
                    color: _theme.dialogHeaderInnerShadow,
                  )
                ],
              ),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    overlayEntry?.remove();
                    Future.microtask(() => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginController(isFromDashBoard: true)),
                        (route) => false));
                  },
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    maximumSize: Size(SizeConfig.getSize(100), SizeConfig.getSize(42)),
                    minimumSize: Size(SizeConfig.getSize(100), SizeConfig.getSize(42)),
                    backgroundColor: _theme.button1BG1!,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                  ),
                  child:
                      Text(MessagesProvider.get("OK"), style: _theme.heading5?.copyWith(fontSize: SizeConfig.getSize(19))),
                ),
              )
            ],
          ),
        );
      },
    );

    Overlay.of(context).insert(overlayEntry!);
  }

  Future<void> _deleteCacheDir() async {
    var tempDir = await getTemporaryDirectory();

    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  }

  Future<void> _checkCurrentUserPrivileges() async {
    _execContextBL = await ExecutionContextBuilder.build();
    _execContext = _execContextBL.getExecutionContext();
    _masterDataBl = await MasterDataBuilder.build(_execContext!);
    _userRoleContainerDTO = await _masterDataBl.getUserRoleById(_execContext.userRoleId ?? -1);
    _isCurrentUserManager = _userRoleContainerDTO.selfApprovalAllowed == true;
    // refreshUI();
  }

  Future<bool> _isEnabledTask(String category, String taskTypeName) async {
    _isEnabledButton = false;
    if (taskTypeName.toLowerCase() == "PERFORM EOD".toLowerCase() ||
        taskTypeName.toLowerCase() == "LOG OUT".toLowerCase() ||
        taskTypeName.toLowerCase() == "LOCK SCREEN".toLowerCase()) {
      return _isEnabledButton = true;
    } else {
      if (_masterDataBl != null) {
        for (ManagementFormAccessContainerDTO mangerDto
            in (_userRoleContainerDTO.managementFormAccessContainerDTOList ?? [])) {
          if (mangerDto.mainMenu.toLowerCase() == category.toLowerCase() &&
              mangerDto.formName.toLowerCase() == taskTypeName.toLowerCase()) {
            _isEnabledButton = true;
          }
        }

        return _isEnabledButton;
      } else {
        _execContextBL = await ExecutionContextBuilder.build();
        _execContext = _execContextBL.getExecutionContext();
        _masterDataBl = await MasterDataBuilder.build(_execContext!);
        _userRoleContainerDTO = await _masterDataBl.getUserRoleById(_execContext.userRoleId ?? -1);
        for (ManagementFormAccessContainerDTO mangerDto
            in (_userRoleContainerDTO.managementFormAccessContainerDTOList ?? [])) {
          if (mangerDto.mainMenu.toLowerCase() == category.toLowerCase() &&
              mangerDto.formName.toLowerCase() == taskTypeName.toLowerCase()) {
            _isEnabledButton = true;
          }
        }
        return _isEnabledButton;
      }
    }
  }

  Future<void> _showLogoutWarningDialogMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
          child: WillPopScope(
            onWillPop: () async => false,
            child: SizedBox(
              height: 220,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    MessagesProvider.get("UPDATE CONFIGURATION!"),
                    style: _theme.heading2?.copyWith(fontSize: SizeConfig.getFontSize(30)),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
                    child: Text(
                      MessagesProvider.get("You will be logged out. Do you want to continue?"),
                      style: _theme.title2?.copyWith(fontSize: SizeConfig.getFontSize(26)),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: SizeConfig.getSize(65),
                        width: SizeConfig.getSize(115),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // <-- Radius
                                ),
                                backgroundColor: _theme.button1BG1),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(MessagesProvider.get("no").toUpperCase(),
                                style: _theme.heading5?.copyWith(fontSize: SizeConfig.getSize(24))),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: SizeConfig.getSize(65),
                        width: SizeConfig.getSize(115),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8), // <-- Radius
                              ),
                              backgroundColor: _theme.button2BG1),
                          onPressed: () async {
                            widget.onLoadingStatusUpdate(true);

                            // final executionContextBL =
                            //     await ExecutionContextBuilder.build();
                            // final executionContextDTO =
                            //     executionContextBL
                            //         .getExecutionContext();
                            // final masterDataBL =
                            //     await MasterDataBuilder.build(
                            //         executionContextDTO!);
                            // final productMenuDataBL =
                            //     await MasterDataBuilder.build(
                            //         executionContextDTO);
                            //
                            // //clear session
                            // // masterDataBL.clear();
                            // // productMenuDataBL.clear();
                            // await executionContextBL
                            //     .clearExecutionContext();
                            final sharedPreferences = await SharedPreferences.getInstance();
                            await sharedPreferences.setBool(shouldRefreshLocalData, true);
                            await sharedPreferences.setBool(isPosSetUpDone, false);

                            widget.onLoadingStatusUpdate(false);
                            if (mounted) {
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) => const SplashScreenPage()), (route) => false);
                            }
                          },
                          child: Text(
                            MessagesProvider.get("Yes").toUpperCase(),
                            style: _theme.headingLight5!.copyWith(color: Colors.white, fontSize: SizeConfig.getFontSize(24)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    _theme = Theme.of(context).extension<SemnoxTheme>()!;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: _theme.backGroundColor,
      body: Scroller(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 8, 40, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: (_splashImgDownloaded)
                            ? Image.file(
                                File(_brandImagePath!),
                                width: SizeConfig.getSize(70),
                                height: SizeConfig.getSize(70),
                              )
                            : Image.asset(
                                'assets/SemnoxLogo.png',
                                width: SizeConfig.getSize(70),
                                height: SizeConfig.getSize(70),
                              ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${MessagesProvider.get('Site')}: ${_siteName ?? ''}',
                            style: _theme.heading4?.copyWith(fontSize: SizeConfig.getFontSize(26)),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${MessagesProvider.get('POS')}: ${_posMachineName ?? ''}',
                            style: _theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(20)),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${MessagesProvider.get('Counter')}: ${_counterName ?? ''}',
                            style: _theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(20)),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${MessagesProvider.get('Devices')}: 0',
                            style: _theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(20)),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    widget.settingTask.isNotEmpty
                        ? FutureBuilder<bool>(
                            future: _isEnabledTask(
                                widget.settingTask.first.category ?? '', widget.settingTask.first.taskTypeName ?? ''),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Opacity(
                                  opacity: (snapshot.data ?? true) ? 1 : 0.4,
                                  child: InkWell(
                                    onTap: (snapshot.data ?? true)
                                        ? () {
                                            if (widget.settingTask.first.requiresManagerApproval == "Y" &&
                                                !_isCurrentUserManager) {
                                              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                                                _showLogoutWarningDialogMyDialog();
                                              });
                                            } else {
                                              _showLogoutWarningDialogMyDialog();
                                            }
                                          }
                                        : null,
                                    child: SizedBox(
                                        height: SizeConfig.getSize(40),
                                        width: SizeConfig.getSize(40),
                                        child: Center(
                                            child: Image.asset("assets/ic_settings.png", color: _theme.secondaryColor))),
                                  ),
                                );
                              } else {
                                return InkWell(
                                  onTap: () {
                                    _showLogoutWarningDialogMyDialog();
                                  },
                                  child: SizedBox(
                                      height: SizeConfig.getSize(40),
                                      width: SizeConfig.getSize(40),
                                      child: Center(
                                          child: Image.asset("assets/ic_settings.png", color: _theme.secondaryColor))),
                                );
                              }
                            })
                        : const SizedBox()
                  ],
                ),
              ),
              Container(
                height: 1,
                color: _theme.button1BG1,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, top: 5,right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${MessagesProvider.get('User')}: ${_userName ?? ''}',
                        style: _theme.heading4?.copyWith(fontSize: SizeConfig.getFontSize(26)),
                      ),
                      Text(
                        '${MessagesProvider.get('Role')}: ${_userRole ?? ''}',
                        style: _theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(20)),
                      ),
                      Text(
                        '${MessagesProvider.get('Last Clock-In Time')}: ${_lastClockInTime.isNotEmpty ? DateFormat(_getDateTimeFormat(_dateTimeFormat)).format(DateTime.parse(_lastClockInTime)) : ''}',
                        style: _theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(20)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 1,
                color: _theme.button1BG1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 13, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: _theme.button1BG1,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  height: SizeConfig.getSize(60),
                  width: SizeConfig.getSize(576),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: IntrinsicHeight(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                MessagesProvider.get('Default Payment Mode: '),
                                style: _theme.title3?.copyWith(fontSize: SizeConfig.getFontSize(24)),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                '${(_defaultPaymentMode ?? '').isNotEmpty ? _defaultPaymentMode : MessagesProvider.get('None')}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: _theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(24)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,right: 20,left: 13),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: widget.tasksList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 16 / 9,
                    crossAxisSpacing: SizeConfig.getSize(8),
                    mainAxisSpacing: SizeConfig.getSize(12),
                    mainAxisExtent: SizeConfig.getSize(50),
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return FutureBuilder<bool>(
                        future: _isEnabledTask(
                            widget.tasksList[index].category ?? '', widget.tasksList[index].taskTypeName ?? ''),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if ((widget.tasksList[index].taskType ?? '')
                                    .toLowerCase() ==
                                "PERFORMEOD".toLowerCase()) {
                              _checkEnabledEndOfDay();
                              return Opacity(
                                  opacity: (snapshot.data ?? true) ? 1 : 0.4,
                                  child: _lhsTaskButton(
                                      notificationBar: widget.notificationBar,
                                      //  isEnabled:
                                      isEnabled: (snapshot.data ?? true) &&
                                          _isEnableEndOfDay,
                                      // return (widget.tasksList[index].taskType ?? '').toLowerCase() == "PERFORMEOD".toLowerCase() ? _checkEnabledEndOfDay() : true,

                                      buttonTitle: MessagesProvider.get(widget
                                              .tasksList[index]
                                              .taskTypeName ??
                                          ''),
                                      taskType:
                                          (widget.tasksList[index].taskType ??
                                                  '')
                                              .toLowerCase(),
                                      isManagerApproval: widget
                                              .tasksList[index]
                                              .requiresManagerApproval ??
                                          'Y'));
                            }
                            return Opacity(
                                opacity: (snapshot.data ?? true) ? 1 : 0.4,
                                child: _lhsTaskButton(
                                    notificationBar: widget.notificationBar,
                                    isEnabled: (snapshot.data ?? true),
                                    buttonTitle: MessagesProvider.get(widget.tasksList[index].taskTypeName ?? ''),
                                    taskType: (widget.tasksList[index].taskType ?? '').toLowerCase(),
                                    isManagerApproval: widget.tasksList[index].requiresManagerApproval ?? 'Y'));
                          } else {
                            // return const SizedBox();
                            return _lhsTaskButton(
                                notificationBar: widget.notificationBar,
                                isEnabled: true,
                                buttonTitle: widget.tasksList[index].taskTypeName ?? '',
                                taskType: (widget.tasksList[index].taskType ?? '').toLowerCase(),
                                isManagerApproval: widget.tasksList[index].requiresManagerApproval ?? 'N');
                          }
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFeatureNotImplementedDialog(String title) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return FeatureNotImplementedView(title);
        });
  }

  void _showManagerLoginPopup({required Function onAuthSuccess, Function? cancelBtn}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: SizeConfig.getSize(220)),
            child: ManagerLoginView(
              onLoginSuccess: (LoginResponse response) {
                onAuthSuccess(response);
              },
              onLoginError: (err) {},
              cancelBtn: (context) {
                if (cancelBtn != null) {
                  cancelBtn(context);
                }
              },
            ),
          );
        });
  }

  Widget _lhsTaskButton(
      {required bool isEnabled,
      required NotificationBar notificationBar,
      required String buttonTitle,
      required String taskType,
      required String isManagerApproval}) {
    return ElevatedButton.icon(
      // _theme.button1BG1,
      icon: taskType == "OTHERFUNCTIONS".toLowerCase()
          ? Icon(
              size: 15,
              Icons.storage_rounded,
              color: widget.lhsScreen.value == DashboardRhsScreen.otherFunctions ? Colors.white : _theme.secondaryColor,
            )
          : const SizedBox(),
      onPressed: isEnabled
          ? () async {
              if (taskType == "RECONNECTREADER".toLowerCase()) {
                if (isManagerApproval == "Y" && !_isCurrentUserManager) {
                  _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                    _showFeatureNotImplementedDialog(buttonTitle);
                  });
                } else {
                  _showFeatureNotImplementedDialog(buttonTitle);
                }
              }
              if (taskType == "REFRESHCONTAINERS".toLowerCase()) {
                widget.onLoadingStatusUpdate(true);
                widget.onShowMessage(MessagesProvider.get('Refreshing Containers...'), false);
                var executionContextBL = await ExecutionContextBuilder.build();
                var executionContextDTO = executionContextBL.getExecutionContext();
                var masterDataBL = await MasterDataBuilder.build(executionContextDTO!);
                var productMenuDataBL = await ProductMenuDataBuilder.build(executionContextDTO);

                final sharedPreferences = await SharedPreferences.getInstance();

                //clear caches
                try {
                  await sharedPreferences.setBool(shouldRefreshLocalData, true);
                  await sharedPreferences.setBool(shouldRefreshServer, true);
                  masterDataBL.clear();
                  productMenuDataBL.clear();
                  await masterDataBL.sync(shouldCallPostLoginApis: true);
                  await productMenuDataBL.sync();

                  widget.onLoadingStatusUpdate(false);
                  widget.onShowMessage(MessagesProvider.get('Completed Refreshing Containers...'), false);
                  await sharedPreferences.setBool(shouldRefreshLocalData, false);
                  await sharedPreferences.setBool(shouldRefreshServer, false);
                  Future.microtask(() => {_getUiInfo(shouldShowAttendancePopup: false)});
                } on DioError catch (error) {
                  var errorString = error.response?.data['data'] as String?;
                  await sharedPreferences.setBool(shouldRefreshLocalData, false);
                  await sharedPreferences.setBool(shouldRefreshServer, false);

                  widget.onShowMessage(errorString ?? '', true);

                  ///show error if needed.
                  widget.onLoadingStatusUpdate(false);
                }
              }
              if (taskType == "OTHERFUNCTIONS".toLowerCase()) {
                if (isManagerApproval == "Y" && !_isCurrentUserManager) {
                  _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                    if (widget.lhsScreen.value == DashboardRhsScreen.otherFunctions) {
                      widget.lhsScreen.value = DashboardRhsScreen.defaultlhs;
                    } else {
                      widget.lhsScreen.value = DashboardRhsScreen.otherFunctions;
                    }
                    setState(() {});
                  });
                } else {
                  notificationBar.showMessage("", _theme.primaryColor!);
                  if (widget.lhsScreen.value == DashboardRhsScreen.otherFunctions) {
                    widget.lhsScreen.value = DashboardRhsScreen.defaultlhs;
                  } else {
                    widget.lhsScreen.value = DashboardRhsScreen.otherFunctions;
                  }
                  setState(() {});
                }
              }
              if (taskType == "OPENCASHDRAWER".toLowerCase()) {
                _showFeatureNotImplementedDialog(buttonTitle);
              }
              if (taskType == "CHANGESITE".toLowerCase()) {
                if (isManagerApproval == "Y" && !_isCurrentUserManager) {
                  _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) async {
                    final isNfcAvailable = await NFCManager().isNfcAvailable();
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.getWidth(220),
                                vertical:
                                    isNfcAvailable ? SizeConfig.blockSizeVertical * 7 : SizeConfig.blockSizeVertical * 9),
                            child: ClipRRect(
                              clipBehavior: Clip.antiAlias,
                              borderRadius: BorderRadius.circular(8),
                              child: ChangeSiteView(
                                onLoginSuccess: () async {
                                  await _getUiInfo(shouldShowAttendancePopup: false);
                                },
                                selectedSite: _selectedSite,
                                siteList: _siteList,
                              ),
                            ),
                          );
                        });
                  });
                } else {
                  final isNfcAvailable = await NFCManager().isNfcAvailable();
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.getWidth(240),
                              vertical:
                                  isNfcAvailable ? SizeConfig.blockSizeVertical * 7 : SizeConfig.blockSizeVertical * 9),
                          child: ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(8),
                            child: ChangeSiteView(
                              onLoginSuccess: () async {
                                await _getUiInfo(shouldShowAttendancePopup: false);
                              },
                              selectedSite: _selectedSite,
                              siteList: _siteList,
                            ),
                          ),
                        );
                      });
                }
              }
              if (taskType == "RECORDATTENDANCE".toLowerCase()) {
                if ((_userRoleContainer?.managementFormAccessContainerDTOList ?? [])
                    .any((element) => element.mainMenu == "ATTENDANCEMANAGEMENT")) {
                  if (isManagerApproval == "Y" && !_isCurrentUserManager) {
                    _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AuthenticateUserView(
                          onAuthenticationError: (error) {},
                          onTapAuthenticateSuccess: (loginResponse) async {
                            Navigator.of(context).pop();
                            final userRoleContainerDTO = await _masterDataBl.getUserRoleById(loginResponse.data?.userRoleId ?? -1);
                            if(!userRoleContainerDTO.enablePosClockIn) {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext ctx) {
                                    return GenericDialog(
                                      onTapOk: () {},
                                      isSingleBtnMode: true,
                                      onTapYes: () {},
                                      onTapNo: () {},
                                      title: MessagesProvider.get('Attendance').toUpperCase(),
                                      msg: MessagesProvider.get('POS attendance is disabled at the Role level'),
                                    );
                                  });
                              return;
                            }
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return AttendancePopUp(
                                  onFailureShowNotification: (msg) {
                                    notificationBar.showMessage('', _theme.footerBG3!);
                                  },
                                  onSuccess: () async {
                                    var execContextBL = await ExecutionContextBuilder.build();
                                    var execContextDTO = execContextBL.getExecutionContext();
                                    attendanceForDay = await attendanceBl.getAttendanceDetails(userId: execContextDTO?.userPKId ?? 0);
                                  },
                                  loginResponse: loginResponse,
                                );
                              },
                            ).then((value) {
                              showPrinterTypeNotSetMessage();
                            });
                          },
                          onAuthenticationSuccess: (loginResponse) async {
                            final userRoleContainerDTO = await _masterDataBl.getUserRoleById(loginResponse.data?.userRoleId ?? -1);
                            if(!userRoleContainerDTO.enablePosClockIn) {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext ctx) {
                                    return GenericDialog(
                                      onTapOk: () {},
                                      isSingleBtnMode: true,
                                      onTapYes: () {},
                                      onTapNo: () {},
                                      title: MessagesProvider.get('Attendance').toUpperCase(),
                                      msg: MessagesProvider.get('POS attendance is disabled at the Role level'),
                                    );
                                  });
                              return;
                            }
                            _userRoleContainer = await _masterDataBl.getUserRoleById(loginResponse.data?.userRoleId ?? -1);
                            if (!(_userRoleContainer?.managementFormAccessContainerDTOList ?? [])
                                .any((element) => element.mainMenu == "ATTENDANCEMANAGEMENT")) {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            } else {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();

                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return AttendancePopUp(
                                    onFailureShowNotification: (msg) {
                                      widget.notificationBar.showMessage(msg, _theme.footerBG3!);
                                    },
                                    onSuccess: () async {
                                      var execContextBL = await ExecutionContextBuilder.build();
                                      var execContextDTO = execContextBL.getExecutionContext();
                                      attendanceForDay =
                                          await attendanceBl.getAttendanceDetails(userId: execContextDTO?.userPKId ?? 0);
                                    },
                                    loginResponse: loginResponse,
                                  );
                                },
                              ).then((value) {
                                showPrinterTypeNotSetMessage();
                              });
                            }
                          },
                        ),
                      );
                    });
                  } else {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => AuthenticateUserView(
                        onAuthenticationError: (error) {},
                        onTapAuthenticateSuccess: (loginResponse) async {
                          Navigator.of(context).pop();
                          final userRoleContainerDTO = await _masterDataBl.getUserRoleById(loginResponse.data?.userRoleId ?? -1);
                          if(!userRoleContainerDTO.enablePosClockIn) {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext ctx) {
                                  return GenericDialog(
                                    onTapOk: () {},
                                    isSingleBtnMode: true,
                                    onTapYes: () {},
                                    onTapNo: () {},
                                    title: MessagesProvider.get('Attendance').toUpperCase(),
                                    msg: MessagesProvider.get('POS attendance is disabled at the Role level'),
                                  );
                                });
                            return;
                          }
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return AttendancePopUp(
                                onFailureShowNotification: (msg) {
                                  notificationBar.showMessage(msg, _theme.footerBG3!);
                                },
                                onSuccess: () async {
                                  var execContextBL = await ExecutionContextBuilder.build();
                                  var execContextDTO = execContextBL.getExecutionContext();
                                  attendanceForDay =
                                      await attendanceBl.getAttendanceDetails(userId: execContextDTO?.userPKId ?? 0);
                                },
                                loginResponse: loginResponse,
                              );
                            },
                          ).then((value) {
                            showPrinterTypeNotSetMessage();
                          });
                        },
                        onAuthenticationSuccess: (loginResponse) async {
                          final userRoleContainerDTO = await _masterDataBl.getUserRoleById(loginResponse.data?.userRoleId ?? -1);
                          if(!userRoleContainerDTO.enablePosClockIn) {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext ctx) {
                                  return GenericDialog(
                                    onTapOk: () {},
                                    isSingleBtnMode: true,
                                    onTapYes: () {},
                                    onTapNo: () {},
                                    title: MessagesProvider.get('Attendance').toUpperCase(),
                                    msg: MessagesProvider.get('POS attendance is disabled at the Role level'),
                                  );
                                });
                            return;
                          }
                          await _getUiInfo(shouldShowAttendancePopup: false, showShiftTracking: false);
                          if (!(_userRoleContainer?.managementFormAccessContainerDTOList ?? [])
                              .any((element) => element.mainMenu == "ATTENDANCEMANAGEMENT")) {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          } else {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();

                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return AttendancePopUp(
                                  onFailureShowNotification: (msg) {
                                    widget.notificationBar.showMessage(msg, _theme.footerBG3!);
                                  },
                                  onSuccess: () async {
                                    var execContextBL = await ExecutionContextBuilder.build();
                                    var execContextDTO = execContextBL.getExecutionContext();
                                    attendanceForDay =
                                        await attendanceBl.getAttendanceDetails(userId: execContextDTO?.userPKId ?? 0);
                                  },
                                  loginResponse: loginResponse,
                                );
                              },
                            ).then((value) {
                              showPrinterTypeNotSetMessage();
                            });
                          }
                        },
                      ),
                    );
                  }
                } else {
                  notificationBar.showMessage(
                      MessagesProvider.get("User ${_execContext.userId} is not authorized to access 'Record Attendance'"),
                      Colors.yellow);
                }
              }
              if (taskType == "LOGOUT".toLowerCase()) {
                if (attendanceForDay?.data?.attendanceLogDTOList?.last.status == "Back from Break" ||
                    attendanceForDay?.data?.attendanceLogDTOList?.last.status == "Clock In") {
                  if (userRoleDTO?.enablePosClockIn ?? false) {
                    if (!_isCurrentUserManager) {
                      loader.showLoaderDialog(context,"Getting current user shift details");
                      final isCurrentUserHasOpenShift = await getOpenShiftDetailsOfCurrentUser();
                      print('isCurrentUserHasOpenShift==>$isCurrentUserHasOpenShift');
                      loader.hideLoaderDialog(context);
                      if(isCurrentUserHasOpenShift){
                        showDialog(
                            context: _scaffoldKey.currentContext!,
                            barrierDismissible: false,
                            barrierColor: Colors.black45,
                            builder: (context) {
                            final printerStateModel =  PrinterStateModel(printerType: Application.printerType,
                          isBluetoothSupported: Application.isBluetoothSupported,
                          isBluetoothPrinterConnectionDone: Application.isBluetoothPrinterConnectionDone,
                          isBluetoothPermissionGranted: Application.isBluetoothPermissionGranted,
                          isBluetoothAvailable: Application.isBluetoothAvailable,
                          deviceManufacturer: Application.deviceManufacturer,
                          activePrinters: Application.activePrinters);
                            return CashDrawerAssignmentDialog(fromPage: 'OtherFunctions',printerStateModel: printerStateModel,);
                            }).whenComplete(() async {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext dialogContext) {
                              return AttendancePopUp(
                                onCancelClicked: () {
                                  Future.microtask(() => Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) => const LoginController(isFromDashBoard: true)),
                                          (route) => false));
                                },
                                onFailureShowNotification: (msg) {
                                  notificationBar.showMessage(msg, _theme.footerBG3!);
                                },
                                onSuccess: () async {
                                  Future.delayed(const Duration(milliseconds: 300), () {
                                    Future.microtask(() => Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => const LoginController(isFromDashBoard: true)),
                                            (route) => false));
                                  });
                                  // final executionContextBL =
                                  //     await ExecutionContextBuilder
                                  //         .build();
                                  // final executionContextDTO =
                                  //     executionContextBL
                                  //         .getExecutionContext();
                                  // attendanceForDay = await attendanceBl
                                  //     .getAttendanceDetails(
                                  //         userId: executionContextDTO
                                  //                 ?.userPKId ??
                                  //             0);
                                },
                              );
                            },
                          ).whenComplete((){
                            if(isShiftOpenOrClosed.value == 'CLOSED'){
                              //checkTemplateAndPrintReceipt('Clock Out');
                            }
                          }).then((value) {
                            showPrinterTypeNotSetMessage();
                          });
                        });
                      }else{
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext dialogContext) {
                            return AttendancePopUp(
                              onCancelClicked: () {
                                Future.microtask(() => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => const LoginController(isFromDashBoard: true)),
                                        (route) => false));
                              },
                              onFailureShowNotification: (msg) {
                                notificationBar.showMessage(msg, _theme.footerBG3!);
                              },
                              onSuccess: () async {
                                Future.microtask(() => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => const LoginController(isFromDashBoard: true)),
                                        (route) => false));
                                // final executionContextBL =
                                //     await ExecutionContextBuilder
                                //         .build();
                                // final executionContextDTO =
                                //     executionContextBL
                                //         .getExecutionContext();
                                // attendanceForDay = await attendanceBl
                                //     .getAttendanceDetails(
                                //         userId: executionContextDTO
                                //                 ?.userPKId ??
                                //             0);
                              },
                            );
                          },
                        ).then((value) {
                          showPrinterTypeNotSetMessage();
                        });
                      }

                    } else {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext dialogContext) {
                          return AttendancePopUp(
                            onCancelClicked: () {
                              Future.microtask(() => Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LoginController(isFromDashBoard: true)),
                                      (route) => false));
                            },
                            onFailureShowNotification: (msg) {
                              notificationBar.showMessage(msg, _theme.footerBG3!);
                            },
                            onSuccess: () async {
                              Future.delayed(const Duration(milliseconds: 300), () {
                                Future.microtask(() => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => const LoginController(isFromDashBoard: true)),
                                        (route) => false));
                              });
                              // final executionContextBL =
                              //     await ExecutionContextBuilder
                              //         .build();
                              // final executionContextDTO =
                              //     executionContextBL
                              //         .getExecutionContext();
                              // attendanceForDay = await attendanceBl
                              //     .getAttendanceDetails(
                              //         userId: executionContextDTO
                              //                 ?.userPKId ??
                              //             0);
                            },
                          );
                        },
                      ).then((value) {
                        showPrinterTypeNotSetMessage();
                      });
                    }
                  } else {
                    _showLogoutDialog(
                      context,
                      onLogoutClick: () {
                        Future.microtask(() => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginController(isFromDashBoard: true)),
                                (route) => false));
                      },
                    );
                  }
                } else {
                  _showLogoutDialog(
                    context,
                    onLogoutClick: () {
                      Future.microtask(() => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginController(isFromDashBoard: true)),
                          (route) => false));
                    },
                  );
                }
              }
              if (taskType == "LOCKSCREEN".toLowerCase()) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LockScreenController()),
                    (route) => false);
              }
              if (taskType == "PERFORMEOD".toLowerCase()) {
                final is_enabled_manager_approve_end_of_day =
                    await _masterDataBl.getDefaultValuesByName(
                        defaultValueName:
                            "ENABLE_MANAGER_APPROVAL_FOR_END_OF_DAY");
                if (!_isCurrentUserManager &&
                    is_enabled_manager_approve_end_of_day == 'Y') {
                  _showManagerLoginPopup(
                      onAuthSuccess: (LoginResponse response) async {
                    // final isNfcAvailable = await NFCManager().isNfcAvailable();
                    _showPerformEODDialog();
                  });
                } else {
                  _showPerformEODDialog();
                }
              }
            }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: taskType == "OTHERFUNCTIONS".toLowerCase()
            ? widget.lhsScreen.value == DashboardRhsScreen.otherFunctions
                ? _theme.button2InnerShadow1
                : _theme.button1BG1
            : _theme.button1BG1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        minimumSize: SizeConfig.isBigDevice()
            ? Size(SizeConfig.getSize(300), SizeConfig.getSize(60))
            : Size(SizeConfig.getSize(284), SizeConfig.getSize(40)),
        maximumSize: SizeConfig.isBigDevice()
            ? Size(SizeConfig.getSize(300), SizeConfig.getSize(60))
            : Size(SizeConfig.getSize(284), SizeConfig.getSize(40)),
      ),
      label: Text(
        buttonTitle.toUpperCase(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: taskType == "OTHERFUNCTIONS".toLowerCase()
            ? widget.lhsScreen.value == DashboardRhsScreen.otherFunctions
                ? _theme.subtitleLight3!.copyWith(color: _theme.light1, fontSize: SizeConfig.getFontSize(18))
                : _theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(18))
            : _theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(18)),
      ),
    );
  }

  void showPrinterTypeNotSetMessage() {
    final printerTypeNotSetMessage = context.read<AttendanceBloc>().printerTypeNotSetMessage;
    if(printerTypeNotSetMessage != '') {
      widget.notificationBar.showMessage(
          MessagesProvider.get(printerTypeNotSetMessage),
          AppColors.notificationBGLightBlueColor);
    }else {
      widget.notificationBar.showMessage(
          MessagesProvider.get(printerTypeNotSetMessage),
          _theme.footerBG2!);
    }
    context.read<AttendanceBloc>().clearPrinterTypeNotSetMessage();
  }

  _getDateTimeFormat(dateFormatString) {
    if (dateFormatString.contains("tt")) {
      final newModifiedString = dateFormatString.replaceAll("tt", "a");
      return newModifiedString;
    } else {
      return dateFormatString;
    }
  }

  attendanceController() async {
    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    attendanceBl = await AttendanceDataBuilder.build(execContextDTO!);
    attendanceForDay = await attendanceBl.getAttendanceDetails(userId: execContextDTO.userPKId ?? 0);
  }

  _checkAndNavigate() async {
    _splashImgDownloaded = true;
    var appPrefsDataBL = await ApplicationPrefsBuilder.build();
    var executionContextBL = await ExecutionContextBuilder.build();
    var executionContext = executionContextBL.getExecutionContext();
    var systemUserLoginBL = await SystemUserLoginDataBuilder.build();
    var machineName = appPrefsDataBL.getMachineName();
    if (machineName != null) {
      if (executionContext == null) {
        final machineId = await FlutterUdid.udid;
        var result = await systemUserLoginBL.login(machineName: machineId.toUpperCase(), siteId: appPrefsDataBL.getDefaultSiteId());

        var execContext = executionContextBL.getExecutionContext();
        var masterDataBL = await MasterDataBuilder.build(execContext!);
        var masterDataSyncResult = await masterDataBL.sync();
      } else {
        var executionContext = executionContextBL.getExecutionContext();
        var masterDataBL = await MasterDataBuilder.build(executionContext!);
        var isSyncDone = await masterDataBL.sync();
      }
    } else {
      _navigateToPOSConfig();
    }
  }

  _navigateToPOSConfig() async {
    var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => const POSSetupScreen()));
    if (result == true) {
      _checkAndNavigate();
    } else {

    }
  }

  get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  _showLogoutDialog(BuildContext context, {required VoidCallback onLogoutClick}) {
    showDialog(
        context: context,
        builder: (_) => WillPopScope(
          onWillPop: () async => false,
          child: CupertinoAlertDialog(
                title: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    MessagesProvider.get('LOG OUT'),
                    style: _theme.heading2,
                  ),
                ),
                content: Text(
                  MessagesProvider.get('Are you sure want to logout?'),
                  style: _theme.title2,
                ),
                actions: [
                  CupertinoDialogAction(
                    child: Text(
                      MessagesProvider.get('No'),
                      style: _theme.heading2,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text(
                      MessagesProvider.get('Yes'),
                      style: _theme.heading2,
                    ),
                    onPressed: () {
                      onLogoutClick();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
        ),
        barrierDismissible: false);
  }

  _updateSplashImage() async {
    var localPath = await _localPath;
    _brandImagePath = '$localPath/images/splash.jpg';
    bool isImageAvailable = await File(_brandImagePath!).exists();
    setState(() {
      _splashImgDownloaded = isImageAvailable;
    });
  }

  Future<void> _getUiInfo({shouldShowAttendancePopup = true, showShiftTracking = true}) async {
    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    var masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    final transactionBL = await TransactionDataBuilder.build(_execContext);
    _userRoleContainer = await masterDataBL.getUserRoleById(execContextDTO.userRoleId ?? -1);
    attendanceBl = await AttendanceDataBuilder.build(execContextDTO);
    attendanceForDay = await attendanceBl.getAttendanceDetails(userId: execContextDTO.userPKId ?? 0);
    var sites = await masterDataBL.getSites();
    String? siteName, timeZoneName;
    DateTime? currentDateTime;
    var item = sites?.data?.siteContainerDTOList.where((element) => element.siteId == execContextDTO.siteId);
    _siteList.clear();
    if (sites?.data?.siteContainerDTOList.isNotEmpty == true) {
      _siteList.addAll(sites!.data!.siteContainerDTOList.toList());
    }
    if (item?.isNotEmpty == true) {
      siteName = item?.first.siteName;
      _selectedSite = item?.first;
    }
    _siteName = siteName;
    _posMachineName = execContextDTO.posMachineName;
    _userName = execContextDTO.userId;

    if (item?.isNotEmpty == true) {
      final zone = item!.first.timeZoneName;
      timeZoneName = timeZoneMap[zone];
    }
    final currentZone = curDateTimeByZone(zone: timeZoneName ?? 'GMT');
    // String time =
    //     DateFormat("EEEE, dd-MMM-yyyy hh:mm:ss a").format(currentZone);
    // if (time != _currentDateTime) {
    currentDateTime = currentZone;

    userRoleDTO = await masterDataBL.getUserRoleById(execContextDTO.userRoleId!);
    _userRole = userRoleDTO?.role ?? '';
    posMachineContainerDTO = await masterDataBL.getPOSMachineById(machineId: execContextDTO.machineId ?? -1);
    _counterName = posMachineContainerDTO?.posTypeName ?? '';
    final payModeGuid = await masterDataBL.getDefaultValuesByName(defaultValueName: "DEFAULT_PAYMENT_MODE");
    final modes = await masterDataBL.getPaymentModes();
    final selectedMode = modes?.where((element) => element.guid.toUpperCase() == payModeGuid?.toUpperCase());
    if (selectedMode != null && selectedMode.isNotEmpty) {
      _defaultPaymentMode = selectedMode.first.paymentMode;
    } else {
      _defaultPaymentMode = '';
    }

    if (shouldShowAttendancePopup) {
      attendanceForDay = await attendanceBl.getAttendanceDetails(userId: execContextDTO.userPKId ?? 0);
      if (attendanceForDay?.data == null ||
          (attendanceForDay?.data?.attendanceLogDTOList?.last.status == 'Clock Out' &&
                  attendanceForDay?.data?.attendanceLogDTOList?.last.remarks != "Auto clock out") &&
              !((attendanceForDay?.data?.attendanceLogDTOList ?? [])
                  .any((element) => element.remarks == 'Manager approved Overtime'))) {
        if (userRoleDTO?.enablePosClockIn ?? false) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AttendancePopUp(
                onFailureShowNotification: (msg) {},
                onSuccess: () async {
                  attendanceForDay = await attendanceBl.getAttendanceDetails(userId: execContextDTO.userPKId ?? 0);
                  setShiftTracking(execContextDTO, masterDataBL, transactionBL, currentDateTime);
                  if (!_isCurrentUserManager) {
                    print("Wohoooooooo!!!!");
                    //Future.delayed(Duration(seconds: 2),(){
                    showGeneralDialog(
                        context: _scaffoldKey.currentContext!,
                        pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
                          return Dialog(
                            insetPadding: EdgeInsets.symmetric(horizontal: SizeConfig.getSize(220)),
                            child: ManagerLoginView(
                              onLoginSuccess: (response) async {
                                Future.delayed(Duration(seconds: 2),(){
                                print("opening dialog...");
                                showDialog(
                                    context: _scaffoldKey.currentContext!,
                                    barrierDismissible: false,
                                    barrierColor: Colors.black45,
                                    builder: (context) {
                                      final printerStateModel = PrinterStateModel(
                                          activePrinters: Application.activePrinters,
                                          deviceManufacturer:  Application.deviceManufacturer,
                                          isBluetoothAvailable: Application.isBluetoothAvailable,
                                          isBluetoothPermissionGranted: Application.isBluetoothPermissionGranted,
                                          isBluetoothPrinterConnectionDone: Application.isBluetoothPrinterConnectionDone,
                                          isBluetoothSupported: Application.isBluetoothSupported,
                                          printerType:  Application.printerType
                                      );
                                      return CashDrawerAssignmentDialog(printerStateModel: printerStateModel);
                                    }).whenComplete((){
                                  if(isShiftOpenOrClosed.value == 'OPENED'){
                                    checkTemplateAndPrintReceipt('Clock In');
                                  }
                                });
                                });
                              },
                              onLoginError: (err) {

                              },
                            ),
                          );
                        });
                    //});
                  } else {
                    print("Wohoooooooo1234!!!!");
                    //Future.delayed(Duration(seconds: 2),(){
                    // showGeneralDialog(
                    //     context: context,
                    //     barrierDismissible: false,
                    //     barrierColor: Colors.black45,
                    //     transitionDuration: const Duration(milliseconds: 200),
                    //     pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
                    //       return CashDrawerAssignmentDialog();
                    //     });
                    //});
                  }
                },
              );
            },
          ).then((value) {
            showPrinterTypeNotSetMessage();
          });
        }
      }
    }

    if (showShiftTracking) {
      await setShiftTracking(execContextDTO, masterDataBL, transactionBL, currentDateTime);
    }
    // showOverlay(execContextDTO);

    if (attendanceForDay?.data != null) {
      // print("attendnc: ${attendanceForDay?.data?.hourUpdatedTime}");
      _dateTimeFormat =
          await masterDataBL.getDefaultValuesByName(defaultValueName: "DATETIME_FORMAT") ?? 'dd-MMM-yyyy h:mm:ss tt';
      _lastClockInTime = attendanceForDay?.data?.hourUpdatedTime ?? DateTime.now().toIso8601String();
    }

    setState(() {});
  }

  setShiftTracking(execContextDTO, masterDataBL, transactionBL, currentDateTime) async {
    final enableShiftTracking = await masterDataBL.getDefaultValuesByName(defaultValueName: "ENABLE_SHIFT_TRACKING");
    final enabledShifts = await masterDataBL.getDefaultValuesByName(defaultValueName: "ENABLEDSHIFTS");
    final enforceManagerApproval =
        await masterDataBL.getDefaultValuesByName(defaultValueName: 'ENFORCE_MANAGER_APPROVAL_ON_SHIFT_END');
    shiftTrackPrompTime = int.parse(
        await masterDataBL.getDefaultValuesByName(defaultValueName: "PROMPT_SHIFT_ENDING_MESSAGE_BEFORE_X_MINUTES") ?? "-1");
    userContainerResponse = await transactionBL.getUserContainerList();
    shiftConfigList = await attendanceBl.getShiftConfig();
    attendanceLogDTOList = attendanceForDay?.data?.attendanceLogDTOList?.last;

    firstClockIn = attendanceForDay?.data != null
        ? DateTime.parse('${attendanceForDay?.data?.attendanceLogDTOList?.first.timestamp}Z')
        : null;
    if (attendanceLogDTOList != null) {
      int attendanceRoleId = attendanceLogDTOList?.attendanceRoleId ?? 0;
      int shiftConfig = -1;

      if (userContainerResponse.data!.userContainerDtoList.isNotEmpty) {
        if ((userContainerResponse.data?.userContainerDtoList ?? []).any((element) => element.roleId == attendanceRoleId)) {
          shiftConfig = userContainerResponse.data!.userContainerDtoList
                  .firstWhere((element) => element.roleId == attendanceRoleId)
                  .shiftConfigurationId ??
              0;
        }
      }

      if (shiftConfig > -1) {
        shiftConfigurationsContainerDtoList = shiftConfigList?.data?.shiftConfigurationsContainerDtoList
            ?.firstWhere((element) => element.shiftConfigurationId == shiftConfig);
      }

      if (attendanceLogDTOList?.remarks == 'Manager approved Overtime') {
        overlayEntry?.remove();
      } else if (shiftConfigurationsContainerDtoList != null) {
        firstClockIn = firstClockIn?.add(Duration(minutes: shiftConfigurationsContainerDtoList?.shiftMinutes ?? 0));

        if ((firstClockIn?.difference(currentDateTime ?? DateTime.now()).inMinutes ?? 0) < 0 &&
            (shiftConfigurationsContainerDtoList?.overtimeAllowed ?? false) &&
            enforceManagerApproval == "Y" &&
            attendanceLogDTOList?.remarks != 'Auto clock out') {
          shiftStaus = 'show shift ending prompt';
          showOverlay(execContextDTO);
        } else if ((firstClockIn?.difference(currentDateTime ?? DateTime.now()).inMinutes ?? 0) > 0 &&
            (shiftConfigurationsContainerDtoList?.overtimeAllowed ?? false) &&
            enforceManagerApproval == "Y" &&
            attendanceLogDTOList?.remarks != 'Auto clock out') {
          timer = Timer.periodic(const Duration(seconds: 1), (timer) {
            print(
                (firstClockIn?.difference(currentDateTime.add(Duration(seconds: timer.tick)) ?? DateTime.now()))?.inMinutes);
            if ((firstClockIn?.difference(currentDateTime.add(Duration(seconds: timer.tick)) ?? DateTime.now()).inMinutes ??
                    0) <=
                0) {
              showOverlay(execContextDTO);
              timer.cancel();
            }
            // showOverlay();
          });
        } else if ((firstClockIn?.difference(currentDateTime ?? DateTime.now()).inMinutes ?? 0) < 0 &&
            (shiftConfigurationsContainerDtoList?.overtimeAllowed ?? false) &&
            attendanceLogDTOList?.remarks != 'Manager approved Overtime' &&
            attendanceLogDTOList?.remarks != 'Auto clock out') {
          showOverlay(execContextDTO);
        } else if ((firstClockIn?.difference(currentDateTime ?? DateTime.now()).inMinutes ?? 0) < 0 &&
            (shiftConfigurationsContainerDtoList?.overtimeAllowed ?? false) &&
            attendanceLogDTOList?.remarks != 'Manager approved Overtime' &&
            enforceManagerApproval != "Y" &&
            attendanceLogDTOList?.remarks != 'Auto clock out') {
          // showOverlay();
        } else if ((firstClockIn?.difference(currentDateTime ?? DateTime.now()).inMinutes ?? 0) < 0 &&
            !(shiftConfigurationsContainerDtoList?.overtimeAllowed ?? false)) {
          showShiftOverOverlay();
        } else if ((firstClockIn?.difference(currentDateTime ?? DateTime.now()).inMinutes ?? 0) < 0 &&
            (shiftConfigurationsContainerDtoList?.overtimeAllowed ?? false) &&
            attendanceLogDTOList?.remarks == 'Auto clock out') {
          showShiftOverOverlay();
        }
      }
    }
  }

  Future<void> _setUpErrorStreamListener({required VoidCallback onConnectivityError}) async {
    final networkBL = await NetworkModuleBuilder.build();
    networkBL.getApiErrorStream().listen((event) async {
      if (event.name == ApiError.sessionExpired.name) {
        WidgetsBinding.instance.endOfFrame.then(
          (_) {
            if (mounted) {
              _showConfirmationDialog(context, onOkClicked: () async {
                final executionContextBL = await ExecutionContextBuilder.build();
                final executionContextDTO = executionContextBL.getExecutionContext();
                final masterDataBL = await MasterDataBuilder.build(executionContextDTO!);
                final productMenuDataBL = await ProductMenuDataBuilder.build(executionContextDTO);
                if (mounted) {
                  context.read<TransactionCubit>().clear();
                  context.read<PaymentScreenCubit>().clear();
                }
                //clear session
                masterDataBL.clear();
                productMenuDataBL.clear();
                await executionContextBL.clearExecutionContext();
                final sharedPreferences = await SharedPreferences.getInstance();
                await sharedPreferences.setBool(shouldRefreshLocalData, true);

                Application.navKey.currentState?.pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const SplashScreenPage()), (route) => false);
              });
            }
          },
        );
      } else if (event.name == ApiError.connectivityError.name) {
        WidgetsBinding.instance.endOfFrame.then(
          (_) {
            if (mounted) {
              _showConnectivityErrorDialog(context, onOkClicked: () {
                onConnectivityError();
              });
            }
          },
        );
      }
    });
  }

  _showConnectivityErrorDialog(BuildContext context, {required VoidCallback onOkClicked}) {
    showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  MessagesProvider.get('Network Issue'),
                  style: Theme.of(context)
                      .extension<SemnoxTheme>()!
                      .heading5
                      ?.copyWith(fontSize: SizeConfig.getFontSize(32), fontWeight: FontWeight.w400),
                ),
              ),
              content: Text(
                MessagesProvider.get(
                    'Network Issue. Please relogin to continue. Verify status of your last action before performing the action again.'),
                style: Theme.of(context)
                    .extension<SemnoxTheme>()!
                    .heading5
                    ?.copyWith(fontSize: SizeConfig.getFontSize(26), fontWeight: FontWeight.w400),
              ),
              actions: [
                CupertinoDialogAction(
                  child: Text(
                    MessagesProvider.get('OK'),
                    style: Theme.of(context)
                        .extension<SemnoxTheme>()!
                        .heading5
                        ?.copyWith(fontSize: SizeConfig.getFontSize(32), fontWeight: FontWeight.w400),
                  ),
                  onPressed: () {
                    onOkClicked();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
        barrierDismissible: false);
  }

  _showConfirmationDialog(BuildContext context, {required VoidCallback onOkClicked}) {
    showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(MessagesProvider.get('Session Expired'),
                    style: Theme.of(context)
                        .extension<SemnoxTheme>()!
                        .heading5
                        ?.copyWith(fontSize: SizeConfig.getFontSize(32), fontWeight: FontWeight.w400)),
              ),
              content: Text(
                MessagesProvider.get('Please re-login'),
                style: Theme.of(context)
                    .extension<SemnoxTheme>()!
                    .heading5
                    ?.copyWith(fontSize: SizeConfig.getFontSize(26), fontWeight: FontWeight.w400),
              ),
              actions: [
                CupertinoDialogAction(
                  child: Text(
                    MessagesProvider.get('OK'),
                    style: Theme.of(context)
                        .extension<SemnoxTheme>()!
                        .heading5
                        ?.copyWith(fontSize: SizeConfig.getFontSize(32), fontWeight: FontWeight.w400),
                  ),
                  onPressed: () {
                    onOkClicked();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
        barrierDismissible: false);
  }

  void _checkFacilities() async{
    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    var masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    var posMachines = await  masterDataBL.getPosMachines();
    var posId = execContextDTO.machineId!;
    var facilityIdList = [];
    posMachines?.forEach((element) {
      if(element.posMachineId == posId){
        facilityIdList = element.facilityIdList;
      }
    });
    /*  if(facilityIdList.isEmpty){
      _pageList = transactionLookupPageList;
      _selectedPage = AllTransactionScreen();

    }*/
    if(facilityIdList.isEmpty) {
      _isFacilityEmpty = true;
    }else{
      _isFacilityEmpty = false;
    }
  }


  _showCashDrawerAssignmentDialog() {
    final printerStateModel = PrinterStateModel(
      activePrinters: Application.activePrinters,
      deviceManufacturer:  Application.deviceManufacturer,
      isBluetoothAvailable: Application.isBluetoothAvailable,
      isBluetoothPermissionGranted: Application.isBluetoothPermissionGranted,
      isBluetoothPrinterConnectionDone: Application.isBluetoothPrinterConnectionDone,
      isBluetoothSupported: Application.isBluetoothSupported,
      printerType:  Application.printerType
    );
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
          return CashDrawerAssignmentDialog(printerStateModel: printerStateModel,);
        });
  }

  _checkEnabledEndOfDay() async {
    final is_enabled_end_of_day = await _masterDataBl.getDefaultValuesByName(
        defaultValueName: "ENABLE_END_OF_DAY_ON_CLOSE_SHIFT");
    if (!_isEODchecked) {
      setState(() {
        _isEnableEndOfDay = is_enabled_end_of_day == 'Y' ? true : false;
        _isEODchecked = true;
      });
    }
  }

  _showPerformEODDialog() async {
    widget.notificationBar.showMessage(
        "",
        Colors.white);
    Log.printMethodStart('PerformEOD()','DashBoard','Perform EOD');
    loader.showLoaderDialog(context);
    final _cashDrawerDetails = await getOpenOrClosedCashDrawer();
    final openTransactionCount = await getOpenTransactionCount();
    loader.hideLoaderDialog(context);
    if (_cashDrawerDetails != null && _cashDrawerDetails.length > 0) {
      widget.notificationBar.showMessage(
          "Open/PClose Cash Drawer exist for the POS,Cannot perform EOD",
          _theme.footerBG3!);
      return;
    }
    if (openTransactionCount != null && openTransactionCount > 0) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) {
            final theme = Theme.of(context).extension<SemnoxTheme>()!;
            return Dialog(
              child: WillPopScope(
                onWillPop: () async => false,
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.backGroundColor ?? Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.only(
                      top: SizeConfig.getHeight(16),
                      bottom: SizeConfig.getHeight(16)),
                  width: SizeConfig.getWidth(602),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: SizeConfig.getHeight(12)),
                      Text(
                          MessagesProvider.get("Open transaction exists")
                              .toUpperCase(),
                          style: theme.heading5
                              ?.copyWith(fontSize: SizeConfig.getFontSize(34))),
                      SizedBox(height: SizeConfig.getHeight(12)),
                      const Divider(
                        thickness: 1.5,
                      ),
                      SizedBox(height: SizeConfig.getHeight(24)),
                      Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.getWidth(24),
                          right: SizeConfig.getWidth(24),
                        ),
                        child: Text(
                          "Please complete the open transaction before performing end of the day",
                          style: theme.description3
                              ?.copyWith(fontSize: SizeConfig.getFontSize(34)),
                        ),
                      ),
                      SizedBox(height: SizeConfig.getHeight(12)),
                      const Divider(
                        thickness: 1.5,
                      ),
                      SizedBox(height: SizeConfig.getHeight(12)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          containerButton(
                              width: SizeConfig.getWidth(140),
                              height: SizeConfig.getHeight(65),
                              buttonColor: theme.footerBG1 ??
                                  AppColors.buttonBackgrounColor,
                              text: MessagesProvider.get("OK"),
                              textStyle: theme.heading5?.copyWith(
                                      fontSize: SizeConfig.getFontSize(32),
                                      fontWeight: FontWeight.w600) ??
                                  tsS24W70016,
                              onTapped: () {
                                Navigator.pop(context);
                                Future.microtask(() => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OrdersPage(
                                          onTransactionRetrieve: (data) {},
                                          selectedIndex: _isFacilityEmpty ? 1 : 8,
                                          isFacilityEmpty : _isFacilityEmpty
                                        ),
                                      ),
                                    ));
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          });
      return;
    }

    //show EOD popup
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          final theme = Theme.of(context).extension<SemnoxTheme>()!;
          final today = DateTime.now();
          final tomorrow = today.add(const Duration(days: 1));
          String tomorrowDate =
              '${DateFormat.d().format(tomorrow)}-${DateFormat.MMM().format(tomorrow)}-${DateFormat.y().format(tomorrow)}';
          return Dialog(
            child: WillPopScope(
              onWillPop: () async => false,
              child: Container(
                decoration: BoxDecoration(
                  color: theme.backGroundColor ?? Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.only(
                    left: SizeConfig.getWidth(24),
                    right: SizeConfig.getWidth(24),
                    top: SizeConfig.getHeight(16),
                    bottom: SizeConfig.getHeight(16)),
                width: SizeConfig.getWidth(602),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: SizeConfig.getHeight(12)),
                    Text(MessagesProvider.get("End of day close").toUpperCase(),
                        style: theme.heading5
                            ?.copyWith(fontSize: SizeConfig.getFontSize(34))),
                    SizedBox(height: SizeConfig.getHeight(12)),
                    const Divider(
                      thickness: 1.5,
                    ),
                    SizedBox(height: SizeConfig.getHeight(12)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/ic_warning.png'),
                        SizedBox(width: SizeConfig.getWidth(24)),
                        Image.asset('assets/ic_printer_2.png'),
                        SizedBox(width: SizeConfig.getWidth(24)),
                        Image.asset('assets/ic_lock.png'),
                      ],
                    ),
                    SizedBox(height: SizeConfig.getHeight(12)),
                    Text(
                      "Are you sure want to freeze the POS for the day? If you do so then you will not be able to perform any transaction from this POS for the current day.Your next business day starts from:$tomorrowDate 6:00:00 AM",
                      style: theme.description3
                          ?.copyWith(fontSize: SizeConfig.getFontSize(34)),
                    ),
                    SizedBox(height: SizeConfig.getHeight(12)),
                    const Divider(
                      thickness: 1.5,
                    ),
                    SizedBox(height: SizeConfig.getHeight(12)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        containerButton(
                            width: SizeConfig.getWidth(140),
                            height: SizeConfig.getHeight(65),
                            buttonColor: theme.footerBG1 ??
                                AppColors.buttonBackgrounColor,
                            text: MessagesProvider.get("Cancel"),
                            textStyle: theme.heading5?.copyWith(
                                    fontSize: SizeConfig.getFontSize(32),
                                    fontWeight: FontWeight.w600) ??
                                tsS24W70016,
                            onTapped: () {
                              Navigator.pop(context);
                            }),
                        SizedBox(width: SizeConfig.getWidth(24)),
                        containerButton(
                            width: SizeConfig.getWidth(140),
                            height: SizeConfig.getHeight(65),
                            buttonColor:
                                theme.button2InnerShadow1 ?? Colors.black,
                            text: MessagesProvider.get("OK"),
                            textStyle: theme.headingLight5?.copyWith(
                                    fontSize: SizeConfig.getFontSize(32),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white) ??
                                tsS24W70016,
                            onTapped: () async {
                              Navigator.pop(context);
                              showGenerateZPosReportDialogue();
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<int?> getOpenTransactionCount() async {
    var executionContextBL = await ExecutionContextBuilder.build();
    var executionContextDTO = executionContextBL.getExecutionContext();
    final orderDataBL = await OrdersDataBuilder.build(executionContextDTO!);
    var toDate = DateFormat('yyyy-MM-dd T HH:mm:ss').format(DateTime.now());
    var today = DateTime.now();
    today = today.copyWith(
      hour: 6,
      minute: 0,
      second: 0,
    );
    final fromDate = DateFormat('yyyy-MM-dd T HH:mm:ss').format(today);
    try {
      Log.printMethodStart('getOpenTransactionCount()','dashboard','perform EOD');
      var response = await orderDataBL.getTransactionCountOnly(
        fromDate: fromDate,
        toDate: toDate,
        status:
            "BOOKED,CONFIRMED,MERGED,ORDERED,PAID,PENDING_CLOSE,REOPENED,STARTED",
      );
      Log.printMethodEnd('getOpenTransactionCount()','dashboard','perform EOD');
      if (response.exception == null) {
        Log.printMethodReturn('getOpenTransactionCount()-success','dashboard','perform EOD');
        return response.data;
      }
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      print("$errorString");
    }
    return null;
  }

  Future<List<ShiftDTO>?> getOpenOrClosedCashDrawer() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final shiftTrackingBL = await ShiftTrackDataBuilder.build(execContextDTO!);
    print("machine name == > ${execContextDTO.posMachineName}");
    Log.printMethodStart(' getOpenOrClosedCashDrawer()','Dashboard','perform EOD');
    try {
      final response =
          await shiftTrackingBL.getCashDrawerDetails(userID: -1, query: {
        'actionType': "Open,ROpen,PClose",
        'posmachine': execContextDTO.posMachineName,
        'buildSystemNumbers': false,
        'buildChildRecords': false
      });
      Log.printMethodEnd('getOpenOrClosedCashDrawer()','Dashboard','perform EOD');
      if (response.exception == null && response.message == null) {
        Log.printMethodReturn('getOpenOrClosedCashDrawer() - Fetched drawer status','Dashboard','perform EOD');
        return response.data;
      }
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      print("$errorString");
    }
    return null;
  }

  Future<bool> performEndOfDay() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final shiftTrackingBL = await ShiftTrackDataBuilder.build(execContextDTO!);
    var machineId = execContextDTO.machineId;
    try {
      final response = await shiftTrackingBL.setEndOfDayResponse(machineId!);
      Log.printMethodEnd('performEOD()','Dashboard','perform EOD');
      if (response.exception == null && response.message == null) {
        return true;
      }
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      print("$errorString");
    }
    return false;
  }

  showGenerateZPosReportDialogue() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          final theme = Theme.of(context).extension<SemnoxTheme>()!;
          return Dialog(
            child: WillPopScope(
              onWillPop: () async => false,
              child: Container(
                decoration: BoxDecoration(
                  color: theme.backGroundColor ?? Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.only(
                    top: SizeConfig.getHeight(16),
                    bottom: SizeConfig.getHeight(16)),
                width: SizeConfig.getWidth(602),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: SizeConfig.getHeight(12)),
                    Text(MessagesProvider.get("Posz receipt").toUpperCase(),
                        style: theme.heading5
                            ?.copyWith(fontSize: SizeConfig.getFontSize(34))),
                    SizedBox(height: SizeConfig.getHeight(12)),
                    const Divider(
                      thickness: 1.5,
                    ),
                    SizedBox(height: SizeConfig.getHeight(40)),
                    Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.getWidth(24),
                        right: SizeConfig.getWidth(24),
                      ),
                      child: Text(
                        "Generate Z-Report for End of the Day",
                        style: theme.description3
                            ?.copyWith(fontSize: SizeConfig.getFontSize(34)),
                      ),
                    ),
                    SizedBox(height: SizeConfig.getHeight(12)),
                    const Divider(
                      thickness: 1.5,
                    ),
                    SizedBox(height: SizeConfig.getHeight(12)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        containerButton(
                            width: SizeConfig.getWidth(140),
                            height: SizeConfig.getHeight(100),
                            buttonColor: theme.footerBG1 ??
                                AppColors.buttonBackgrounColor,
                            text: MessagesProvider.get("Cancel"),
                            textStyle: theme.heading5?.copyWith(
                                    fontSize: SizeConfig.getFontSize(32),
                                    fontWeight: FontWeight.w600) ??
                                tsS24W70016,
                            onTapped: () async{
                              Navigator.pop(context);
                              await performEndOfDay();

                              if (Platform.isAndroid)
                              {SystemNavigator.pop();}
                              else if (Platform.isIOS)
                              {exit(0);}
                            }),
                        SizedBox(width: SizeConfig.getWidth(24)),
                        containerButton(
                            width: SizeConfig.getWidth(140),
                            height: SizeConfig.getHeight(100),
                            buttonColor:
                                theme.button2InnerShadow1 ?? Colors.black,
                            text: MessagesProvider.get("Print"),
                            textStyle: theme.headingLight5?.copyWith(
                                    fontSize: SizeConfig.getFontSize(32),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white) ??
                                tsS24W70016,
                            onTapped: () async {
                              Navigator.pop(context);
                              await performEndOfDay();
                              final execContextBL = await ExecutionContextBuilder.build();
                              final execContextDTO = execContextBL.getExecutionContext();
                              final shiftTrackingBL = await ShiftTrackDataBuilder.build(execContextDTO!);
                              try{
                                loader.showLoaderDialog(context,"Downloading Pos-Z receipt...");
                                final posZReceiptContentResponse = await shiftTrackingBL.getPosZReceipt(posMachineID: execContextDTO.machineId!);
                                loader.hideLoaderDialog(context);
                                if(posZReceiptContentResponse.data != null){
                                  posZreceipt = posZReceiptContentResponse.data!;
                                  log(posZreceipt);
                                  await checkAndPrintReport();

                                 //
                                 //  if (Platform.isAndroid)
                                 //  {SystemNavigator.pop();}
                                 //  else if (Platform.isIOS)
                                 //  {exit(0);}
                                }
                              }on DioError catch (error) {
                                widget.notificationBar.showMessage(
                                    "Unable to download pos-z report",
                                    AppColors.notoficationBGLightYellowColor);
                                var errorString = error.response?.data['data'] as String?;
                                print("$errorString");
                              }
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<void> checkAndPrintReport()async{
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBl = await MasterDataBuilder.build(execContext!);
    Application.printerType = await masterDataBl.getDefaultValuesByName(defaultValueName: "PRINTER_TYPE");
    loader.showLoaderDialog(context, "Printing Pos-Z receipt...");
    if (Application.printerType == "SUNMI" &&
        Application.deviceManufacturer == "SUNMI") {
      printingMethodChannel.setMethodCallHandler(nativeMethodHandler);
      printingMethodChannel.invokeMethod("printReceipt", {
        "type": "SUNMI",
        "receipt": posZreceipt,
        "receiptType": "POSREPORT",
        "isBitmap": true
      });
    } else if (Application.printerType == "ZEBRA" &&
        Application.isBluetoothSupported == true &&
        Application.deviceManufacturer != "SUNMI") {
      printingMethodChannel.setMethodCallHandler(nativeMethodHandler);
      printingMethodChannel.invokeMethod("printReceipt", {
        "type": "ZEBRA",
        "receipt": posZreceipt,
        "receiptType": "POSREPORT",
        "isBitmap": true
      });
    }
  }

  Future<void> checkTemplateAndPrintReceipt(String action, {bool isFromClockOut = false}) async {
    if (Application.isBluetoothSupported == true) {
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();
      final masterDataBl = await MasterDataBuilder.build(execContext!);

      Future.microtask(() =>
          loader.showLoaderDialog(context,
              MessagesProvider.get("Please wait while we get the shift receipt")));
      final attendanceDataBL = await AttendanceDataBuilder.build(execContext);
      final templateGUID = await masterDataBl.getDefaultValuesByName(defaultValueName: 'SHIFT_PRINT_TEMPLATE');
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
            "isBitmap": true
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
          print("HHHHH");
         // _recordAttendance(action, isFromClockOut: isFromClockOut);
        }
      } else {
        print("IIIII");
        loader.hideLoaderDialog(context);
        //_recordAttendance(action, isFromClockOut: isFromClockOut);
      }
    } else {
      print("JJJJJ");
      //_recordAttendance(action, isFromClockOut: isFromClockOut);
    }
  }


  Future<void> getOpenShiftDetails() async {
  final  execContextBL = await ExecutionContextBuilder.build();
  final  execContext = execContextBL.getExecutionContext();
  final  masterDataBL = await MasterDataBuilder.build(execContext!);
  final appPrefsBL = await ApplicationPrefsBuilder.build();
  final shiftTrackingBL = await ShiftTrackDataBuilder.build(execContext!);
  try {
    final response = await shiftTrackingBL.getOpenShiftDetails(userId: execContext.userPKId!, query:{
      'actionType':'Open,ROpen,PClose',
      'buildSystemNumbers': false,
      'buildChildRecords':false,
    });
    if (response.data != null) {
      print('getOpenShiftDetails()=>${response.data.toString()}');
      if(response.data![0].shiftAction == "PClose"){
        provisionalCloseDialogue(execContext,response.data!);
        return;
       }
    }else{
      print('getOpenShiftDetails()=> ${response.data}');
    }
  } on DioError catch (error) {
    var errorString = error.response?.data['data'] as String?;
    print("$errorString");
  }

  }





  provisionalCloseDialogue(ExecutionContextDTO execContext,List<ShiftDTO> shiftDto) {
    final printerStateModel = PrinterStateModel(
        activePrinters: Application.activePrinters,
        deviceManufacturer:  Application.deviceManufacturer,
        isBluetoothAvailable: Application.isBluetoothAvailable,
        isBluetoothPermissionGranted: Application.isBluetoothPermissionGranted,
        isBluetoothPrinterConnectionDone: Application.isBluetoothPrinterConnectionDone,
        isBluetoothSupported: Application.isBluetoothSupported,
        printerType:  Application.printerType
    );
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          final theme = Theme.of(context).extension<SemnoxTheme>()!;
          return Dialog(
            child: WillPopScope(
              onWillPop: () async => false,
              child: Container(
                decoration: BoxDecoration(
                  color: theme.backGroundColor ?? Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.only(
                    top: SizeConfig.getHeight(16),
                    bottom: SizeConfig.getHeight(16)),
                width: SizeConfig.getWidth(602),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: SizeConfig.getHeight(12)),
                    Text(MessagesProvider.get("CashDrawer").toUpperCase(),
                        style: theme.heading5
                            ?.copyWith(fontSize: SizeConfig.getFontSize(34))),
                    SizedBox(height: SizeConfig.getHeight(12)),
                    const Divider(
                      thickness: 1.5,
                    ),
                    SizedBox(height: SizeConfig.getHeight(40)),
                    Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.getWidth(24),
                        right: SizeConfig.getWidth(24),
                      ),
                      child: Text(
                        "You have a Provisional Close shift on POSMachine ${execContext.posMachineName}.Do you wish to close it?",
                        style: theme.description3
                            ?.copyWith(fontSize: SizeConfig.getFontSize(34)),
                      ),
                    ),
                    SizedBox(height: SizeConfig.getHeight(12)),
                    const Divider(
                      thickness: 1.5,
                    ),
                    SizedBox(height: SizeConfig.getHeight(12)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        containerButton(
                            width: SizeConfig.getWidth(140),
                            height: SizeConfig.getHeight(80),
                            buttonColor: theme.footerBG1 ??
                                AppColors.buttonBackgrounColor,
                            text: MessagesProvider.get("NO"),
                            textStyle: theme.heading5?.copyWith(
                                fontSize: SizeConfig.getFontSize(32),
                                fontWeight: FontWeight.w600) ??
                                tsS24W70016,
                            onTapped: () async{
                              Navigator.pop(context);

                            }),
                        SizedBox(width: SizeConfig.getWidth(24)),
                        containerButton(
                            width: SizeConfig.getWidth(140),
                            height: SizeConfig.getHeight(80),
                            buttonColor:
                            theme.button2InnerShadow1 ?? Colors.black,
                            text: MessagesProvider.get("Yes"),
                            textStyle: theme.headingLight5?.copyWith(
                                fontSize: SizeConfig.getFontSize(32),
                                fontWeight: FontWeight.w600,
                                color: Colors.white) ??
                                tsS24W70016,
                            onTapped: () async {
                              print('Clicked yes in cashdrawer');
                              Navigator.pop(context);
                              showDialog(
                                  context: _scaffoldKey.currentContext!,
                                  barrierDismissible: false,
                                  barrierColor: Colors.black45,
                                  builder: (context) {
                                    return CashDrawerAssignmentDialog(fromPage: 'CASHDRAWER POPUP',shiftDTO: shiftDto,printerStateModel: printerStateModel,);
                                  });
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<bool> getOpenShiftDetailsOfCurrentUser() async {
    final  execContextBL = await ExecutionContextBuilder.build();
    final  execContext = execContextBL.getExecutionContext();
    final  masterDataBL = await MasterDataBuilder.build(execContext!);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final shiftTrackingBL = await ShiftTrackDataBuilder.build(execContext!);
    try {
      final response = await shiftTrackingBL.getOpenShiftDetails(userId: execContext.userPKId!, query:{
        'actionType':'Open',
        'buildSystemNumbers': false,
        'buildChildRecords':false,
      });
      if (response.data != null) {
        print('getOpenShiftDetailsOfCurrentUser()=>${response.data.toString()}');
        if(response.data![0].shiftAction == "Open"){
          return true ;
        }
      }else{
         return false;
       }
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      print("$errorString");
    }
    return false;
  }

}

class DashboardRHS extends StatefulWidget {
  final List<TaskTypeContainerDto> tasksList;

  const DashboardRHS({Key? key, required this.tasksList}) : super(key: key);

  @override
  State<DashboardRHS> createState() => _DashboardRHSState();
}

class _DashboardRHSState extends State<DashboardRHS> {
  String _appName = "";
  String _appVersion = "";

  // Variables for developer settings (invoked on 10 taps)
  var startTap = timeNow;
  var consecutiveTaps = 1;
  static const int tapDurationInMs = 3000;

  var _isFacilityEmpty = false;
  static int get timeNow => DateTime.now().millisecondsSinceEpoch;
  SemnoxTheme? _theme;
  var _execContextBL;
  var _execContext;
  var _masterDataBl;
  UserRoleContainerDTO? _userRoleContainerDTO;
  bool _isCurrentUserManager = false;
  bool _isEnabledButton = true;
  final _rhsScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    // _readPackageInfo();
    _checkCurrentUserPrivileges();
    Future.microtask(()=> _checkFacilities());
    Future.microtask(() => {_readPackageInfo()});
  }

  Future<void> _checkCurrentUserPrivileges() async {
    _execContextBL = await ExecutionContextBuilder.build();
    _execContext = _execContextBL.getExecutionContext();
    _masterDataBl = await MasterDataBuilder.build(_execContext!);
    _userRoleContainerDTO = await _masterDataBl.getUserRoleById(_execContext.userRoleId ?? -1);
    _isCurrentUserManager = _userRoleContainerDTO?.selfApprovalAllowed == true;
    // refreshUI();
  }

  Future<bool> _isEnabledTask(String category, String taskTypeName) async {
    _isEnabledButton = false;
    if (_masterDataBl != null) {
    _userRoleContainerDTO = _userRoleContainerDTO ?? await _masterDataBl.getUserRoleById(_execContext.userRoleId ?? -1);
      for (ManagementFormAccessContainerDTO mangerDto
          in (_userRoleContainerDTO?.managementFormAccessContainerDTOList ?? [])) {
        if (mangerDto.mainMenu.toLowerCase() == category.toLowerCase() &&
            mangerDto.formName.toLowerCase() == taskTypeName.toLowerCase()) {
          _isEnabledButton = true;
        }
      }
      return _isEnabledButton;
    } else {
      _execContextBL = await ExecutionContextBuilder.build();
      _execContext = _execContextBL.getExecutionContext();
      _masterDataBl = await MasterDataBuilder.build(_execContext!);
      _userRoleContainerDTO = await _masterDataBl.getUserRoleById(_execContext.userRoleId ?? -1);
      for (ManagementFormAccessContainerDTO mangerDto
          in (_userRoleContainerDTO?.managementFormAccessContainerDTOList ?? [])) {
        if (mangerDto.mainMenu.toLowerCase() == category.toLowerCase() &&
            mangerDto.formName.toLowerCase() == taskTypeName.toLowerCase()) {
          _isEnabledButton = true;
        }
      }
      return _isEnabledButton;
    }
  }


  void _checkFacilities() async{
    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    var masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    var posMachines = await  masterDataBL.getPosMachines();
    var posId = execContextDTO.machineId!;
    var facilityIdList = [];
    posMachines?.forEach((element) {
      if(element.posMachineId == posId){
        facilityIdList = element.facilityIdList;
      }
    });
    /*  if(facilityIdList.isEmpty){
      _pageList = transactionLookupPageList;
      _selectedPage = AllTransactionScreen();

    }*/
    if(facilityIdList.isEmpty) {
      _isFacilityEmpty = true;
    }else{
      _isFacilityEmpty = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Material(
      color: Colors.black,
      child: Scroller(
        controller: _rhsScrollController,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ListView(
            controller: _rhsScrollController,
            children: [
              const SizedBox(height: 30),
              Text(
                MessagesProvider.get('SEMNOX'),
                style: AppStyle.titleTextDashboard.copyWith(fontSize: SizeConfig.getFontSize(24)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  final now = timeNow;
                  final diff = now - startTap;
                  final userExceededTapDuration = now - startTap > tapDurationInMs;

                  if (userExceededTapDuration) {
                    consecutiveTaps = 1;
                    startTap = now;
                  }
                  if (consecutiveTaps >= 7 && consecutiveTaps < 10) {
                    Fluttertoast.showToast(
                        msg: MessagesProvider.get('Click ${10 - consecutiveTaps} times more to open developer settings'),
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: _theme?.primaryOpposite ?? Colors.black,
                        textColor: _theme?.primaryColor ?? Colors.white,
                        fontSize: 16.0);
                  }

                  if (consecutiveTaps == 10) {
                    Fluttertoast.cancel();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DeveloperSettingsScreen()));
                  }

                  consecutiveTaps++;
                },
                child: Text(
                  _appName,
                  style: AppStyle.dashBoardTitleStyle.copyWith(fontSize: SizeConfig.getFontSize(26)),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                _appVersion,
                style: AppStyle.dashBoardTitleVersionNumberStyle.copyWith(fontSize: SizeConfig.getFontSize(22)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.tasksList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 16 / 9,
                    crossAxisSpacing: SizeConfig.getSize(8),
                    mainAxisSpacing: SizeConfig.getSize(8),
                    mainAxisExtent: SizeConfig.getSize(50),
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return FutureBuilder<bool>(
                      future: _isEnabledTask(widget.tasksList[index].category ?? '', widget.tasksList[index].taskTypeName ?? ''),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Opacity(
                              opacity: (snapshot.data ?? false) ? 1 : 0.4,
                              child: _rhsButtons(
                                  isEnabled: (snapshot.data ?? false),
                                  buttonTitle: MessagesProvider.get(widget.tasksList[index].taskTypeName ?? ''),
                                  taskType: (widget.tasksList[index].taskType ?? '').toLowerCase(),
                                  isMangerApproval: (widget.tasksList[index].requiresManagerApproval ?? 'Y')));
                        } else {
                          // return SizedBox();
                          return _rhsButtons(
                              isEnabled: true,
                              buttonTitle: MessagesProvider.get(widget.tasksList[index].taskTypeName ?? ''),
                              taskType: (widget.tasksList[index].taskType ?? '').toLowerCase(),
                              isMangerApproval: (widget.tasksList[index].requiresManagerApproval ?? 'N'));
                        }
                      },
                    );
                  },
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.all(0),
              //   child: SizedBox(
              //     width: double.infinity,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         SizedBox(
              //           height: 55,
              //           width: MediaQuery.of(context).size.width / 4 - 25,
              //           child: ElevatedButton(
              //             style: ElevatedButton.styleFrom(
              //               backgroundColor: Colors.black,
              //               shape: RoundedRectangleBorder(
              //                 side: const BorderSide(
              //                   color: Colors.white,
              //                   width: 1,
              //                   style: BorderStyle.solid,
              //                 ),
              //                 borderRadius: BorderRadius.circular(5),
              //               ),
              //             ),
              //             onPressed: () {
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (context) => SalesScreen(),
              //                 ),
              //               );
              //             },
              //             child: Text(
              //               'SALES',
              //               style: AppStyle.titleTextDashboard,
              //             ),
              //           ),
              //         ),
              //         const SizedBox(width: 10),
              //         SizedBox(
              //           height: 55,
              //           width: MediaQuery.of(context).size.width / 4 - 11,
              //           child: ElevatedButton(
              //             style: ElevatedButton.styleFrom(
              //               backgroundColor: Colors.black,
              //               shape: RoundedRectangleBorder(
              //                 side: const BorderSide(
              //                   color: Colors.white,
              //                   width: 1,
              //                   style: BorderStyle.solid,
              //                 ),
              //                 borderRadius: BorderRadius.circular(5),
              //               ),
              //             ),
              //             onPressed: () {
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (context) => OrdersPage(
              //                     onTransactionRetrieve: (data) {
              //                       print("received data $data");
              //                       /*Navigator.push(
              //                       context,
              //                       MaterialPageRoute(
              //                         builder: (context) => SalesScreen(transactionRetrieveData: data,),
              //                       ),
              //                     );*/
              //                     },
              //                   ),
              //                 ),
              //               );
              //             },
              //             child: Text(
              //               'ORDERS',
              //               style: AppStyle.titleTextDashboard,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  _rhsButtons(
      {required bool isEnabled, required String buttonTitle, required String taskType, required String isMangerApproval}) {
    return SizedBox(
      height: SizeConfig.getSize(55),
      width: MediaQuery.of(context).size.width / 4 - SizeConfig.getSize(30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.white,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: isEnabled
            ? () {
                if (taskType == "SALES".toLowerCase()) {
                  if (isMangerApproval == "Y" && !_isCurrentUserManager) {
                    _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                      Future.microtask(() => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SalesScreen(),
                            ),
                          ));
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SalesScreen(),
                      ),
                    );
                  }
                }
                if (taskType == "ORDERS".toLowerCase()) {
                  if (isMangerApproval == "Y" && !_isCurrentUserManager) {
                    _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                      Future.microtask(() => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrdersPage(
                                onTransactionRetrieve: (data) {},
                                  isFacilityEmpty : _isFacilityEmpty
                              ),
                            ),
                          ));
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrdersPage(
                          onTransactionRetrieve: (data) {},
                          isFacilityEmpty : _isFacilityEmpty
                        ),
                      ),
                    );
                  }
                }
                if (taskType == "CUSTOMERS".toLowerCase()) {
                  if (isMangerApproval == "Y" && !_isCurrentUserManager) {
                    _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                      Future.microtask(() => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CustomerScreen(),
                            ),
                          ));
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CustomerScreen(),
                      ),
                    );
                  }
                }
              }
            : null,
        child: Text(
          buttonTitle.toUpperCase(),
          style: _theme!.heading6!.copyWith(color: Colors.white, fontSize: SizeConfig.getFontSize(20)),
        ),
      ),
    );
  }

  void _showManagerLoginPopup({required Function onAuthSuccess}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: SizeConfig.getSize(220)),
            child: ManagerLoginView(
              onLoginSuccess: (LoginResponse response) {
                onAuthSuccess(response);
              },
              onLoginError: (err) {},
            ),
          );
        });
  }

  _readPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appName = packageInfo.appName;
      _appVersion = "${packageInfo.version}+${packageInfo.buildNumber}";
    });
  }
}

class DashboardScreen extends StatefulWidget {
  final bool? isFromBreak;

  const DashboardScreen({Key? key, this.isFromBreak}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isLoading = false;
  String _loadingMessage = MessagesProvider.get('Loading');
  late NotificationBar _notificationBar;
  late SemnoxTheme _theme;
  List<TaskTypeContainerDto> _taskTypeContainerList = [];
  List<TaskTypeContainerDto> _leftTaskTypesContainers = [];
  List<TaskTypeContainerDto> _rightTaskTypesContainers = [];
  final List<TaskTypeContainerDto> _filteredTaskType = [];
  List<TaskTypeContainerDto> _cashDrawerTaskType = [];
  List<TaskTypeContainerDto> _changeTaskType = [];
  List<TaskTypeContainerDto> _recordAttendanceTaskType = [];
  List<TaskTypeContainerDto> _settingsTaskType = [];
  String? _showPerformEODString = "N";
  bool _showPerformEOD = false;
  var _execContextBL;
  var _execContext;
  var _masterDataBl;

  ValueNotifier<DashboardRhsScreen> lhsScreen = ValueNotifier(DashboardRhsScreen.defaultlhs);

  @override
  void initState() {
    super.initState();
    _initFunctions();
    _notificationBar = NotificationBar(showHideSideBar: false);
  }

  _initFunctions() async {
    _setDefaultLoading(true, _loadingMessage);
    _execContextBL = await ExecutionContextBuilder.build();
    _execContext = _execContextBL.getExecutionContext();
    _masterDataBl = await MasterDataBuilder.build(_execContext!);
    _taskTypeContainerList = await _masterDataBl.getTaskTypeContainerList();
    _leftTaskTypesContainers.clear();
    _leftTaskTypesContainers = _taskTypeContainerList
        .where((element) =>
            (element.category ?? '').toLowerCase() == "DASHBOARDLEFT".toLowerCase() &&
            (element.displayInPos ?? '').toLowerCase() == "y")
        .toList();
    _cashDrawerTaskType = _getFilteredTaskType(
        taskTypeList: _taskTypeContainerList, category: "CASHDRAWERMANAGEMENT", taskType: "OPENCASHDRAWER");
    if (_cashDrawerTaskType.isNotEmpty) {
      _leftTaskTypesContainers.add(_cashDrawerTaskType.first);
    }

    _showPerformEODString = await _masterDataBl.getDefaultValuesByName(defaultValueName: "ENABLE_END_OF_DAY_ON_CLOSE_SHIFT");
    if (_showPerformEODString?.isNotEmpty == true) {
      if (_showPerformEODString?.toLowerCase() == "n") {
        _showPerformEOD = false;
      } else if (_showPerformEODString?.toLowerCase() == "y") {
        _showPerformEOD = true;
      } else {
        _showPerformEOD = false;
      }
    }
    if (!_showPerformEOD) {
      _changeTaskType =
          _getFilteredTaskType(taskTypeList: _taskTypeContainerList, category: "LOGINFUNCTIONS", taskType: "CHANGESITE");
    }
    if (_changeTaskType.isNotEmpty) {
      _leftTaskTypesContainers.add(_changeTaskType.first);
    }
    _recordAttendanceTaskType = _getFilteredTaskType(
        taskTypeList: _taskTypeContainerList, category: "ATTENDANCEMANAGEMENT", taskType: "RECORDATTENDANCE");
    if (_recordAttendanceTaskType.isNotEmpty) {
      _leftTaskTypesContainers.add(_recordAttendanceTaskType.first);
    }
    _settingsTaskType =
        _getFilteredTaskType(taskTypeList: _taskTypeContainerList, category: "DASHBOARDLEFT", taskType: "SETTINGS");
    if (_settingsTaskType.isNotEmpty) {
      _leftTaskTypesContainers.removeWhere((element) =>
          (element.category ?? '').toLowerCase() == "DASHBOARDLEFT".toLowerCase() &&
          (element.taskType ?? '').toLowerCase() == "SETTINGS".toLowerCase());
    }
    // if (_showPerformEOD) {
    //   _leftTaskTypesContainers.add(_getGenericActionModel(taskTypeName: "PERFORM EOD", taskType: "PERFORMEOD"));
    // }
    _leftTaskTypesContainers.add(_getGenericActionModel(taskTypeName: "LOG OUT", taskType: "LOGOUT"));
    _leftTaskTypesContainers.add(_getGenericActionModel(taskTypeName: "LOCK SCREEN", taskType: "LOCKSCREEN"));
    _leftTaskTypesContainers.toSet().toList();
    // _leftTaskTypesContainers.where((element) => element.displayInPos == "Y")
    //     .toList();
    _leftTaskTypesContainers.sort((a, b) => (a.sortOrder ?? -1).compareTo(b.sortOrder ?? -1));

    _rightTaskTypesContainers = _taskTypeContainerList
        .where((element) =>
            (element.category ?? '').toLowerCase() == "DASHBOARDRIGHT".toLowerCase() &&
            (element.displayInPos ?? '').toLowerCase() == "y")
        .toList();
    _rightTaskTypesContainers.toSet().toList();
    // _rightTaskTypesContainers.where((element) => (element.displayInPos??'').toLowerCase() == "y").toList();
    _rightTaskTypesContainers.sort((a, b) => (a.sortOrder ?? -1).compareTo(b.sortOrder ?? -1));
    _setDefaultLoading(false, '');
    // print("_leftTaskTypesContainers ${_leftTaskTypesContainers.length}");
    // print("_rightTaskTypesContainers ${_rightTaskTypesContainers.length}");
  }

  _getGenericActionModel({
    required String taskTypeName,
    required String taskType,
  }) {
    return TaskTypeContainerDto(
        taskTypeId: -1,
        taskType: taskType,
        requiresManagerApproval: "N",
        displayInPos: "Y",
        taskTypeName: taskTypeName,
        category: "DASHBOARDLEFT",
        sortOrder: -1);
  }

  List<TaskTypeContainerDto> _getFilteredTaskType(
      {required List<TaskTypeContainerDto> taskTypeList, required String category, required String taskType}) {
    _filteredTaskType.clear();
    for (TaskTypeContainerDto taskElement in taskTypeList) {
      if ((taskElement.category ?? '').toLowerCase() == category.toLowerCase() &&
          (taskElement.taskType ?? '').toLowerCase() == taskType.toLowerCase()) {
        _filteredTaskType.add(taskElement);
      }
    }
    return _filteredTaskType;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        bottomNavigationBar: Container(
          child: _notificationBar,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      // height: MediaQuery.of(context).size.height,
                      // width: MediaQuery.of(context).size.width / 2 - 40,
                      color: Colors.greenAccent,
                      child: DashboardLHS(
                        isFromBreak: widget.isFromBreak ?? false,
                        lhsScreen: lhsScreen,
                        notificationBar: _notificationBar,
                        context: context,
                        tasksList: _leftTaskTypesContainers,
                        settingTask: _settingsTaskType,
                        onLoadingStatusUpdate: (bool isLoading) {
                          _setLoadingStatus(isLoading);
                        },
                        onShowMessage: (String message, bool isError) {
                          if (isError) {
                            _onFailureShowNotification(message);
                          } else {
                            _onSuccessShowNotification(message);
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      // height: MediaQuery.of(context).size.height,
                      // width: MediaQuery.of(context).size.width / 2 + 10,
                      color: Colors.black,
                      child: ValueListenableBuilder<DashboardRhsScreen>(
                        valueListenable: lhsScreen,
                        builder: (context, value, child) {
                          return setRhsScreen(value);
                        },
                        child: DashboardRHS(tasksList: _rightTaskTypesContainers),
                      ),
                    ),
                  ),
                ],
              ),
              if (_isLoading)
                const Opacity(
                  opacity: 0.8,
                  child: ModalBarrier(dismissible: false, color: Colors.black),
                ),
              if (_isLoading)
                Center(
                  child: Container(
                    width: 240,
                    height: 80,
                    decoration: BoxDecoration(color: _theme.backGroundColor, borderRadius: BorderRadius.circular(6)),
                    child: DefaultTextStyle(
                      style: _theme.description2!,
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        const SizedBox(width: 16),
                        const CircularProgressIndicator(),
                        const SizedBox(width: 24),
                        Text(
                          _loadingMessage,
                          style: _theme.description2,
                        ),
                      ]),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  setRhsScreen(DashboardRhsScreen value) {
    switch (value) {
      case DashboardRhsScreen.defaultlhs:
        return DashboardRHS(
          tasksList: _rightTaskTypesContainers,
        );
      case DashboardRhsScreen.otherFunctions:
        final printerStateModel = PrinterStateModel(
            activePrinters: Application.activePrinters,
            deviceManufacturer:  Application.deviceManufacturer,
            isBluetoothAvailable: Application.isBluetoothAvailable,
            isBluetoothPermissionGranted: Application.isBluetoothPermissionGranted,
            isBluetoothPrinterConnectionDone: Application.isBluetoothPrinterConnectionDone,
            isBluetoothSupported: Application.isBluetoothSupported,
            printerType:  Application.printerType
        );
        return OtherFunctionsUi(
          onSuccessShowNotification: _onSuccessShowNotification,
          onFailureShowNotification: _onFailureShowNotification,
          printerStateModel: printerStateModel ,
        );
      default:
    }
  }

  _onFailureShowNotification(String? message) {
    _notificationBar.showMessage(message ?? '', _theme.footerBG3!);
  }

  _onSuccessShowNotification(String? message) {
    _notificationBar.showMessage(message ?? '', _theme.footerBG4!);
  }

  void _setLoadingStatus(bool status) {
    setState(() {
      _loadingMessage = MessagesProvider.get("Refreshing Containers...");
      _isLoading = status;
    });
  }

  void _setDefaultLoading(bool status, String message) {
    setState(() {
      _loadingMessage = message;
      _isLoading = status;
    });
  }

}

enum DashboardRhsScreen { defaultlhs, otherFunctions }

