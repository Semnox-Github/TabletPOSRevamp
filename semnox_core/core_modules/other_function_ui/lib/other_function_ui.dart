library other_function_ui;

import 'dart:convert';
import 'dart:developer';

import 'package:attendance_data/attendance_data_bl.dart';
import 'package:attendance_data/model/attendanceForDay/attendance_for_day.dart';
import 'package:attendance_ui/attendance_ui.dart';
import 'package:customer_ui/utils/AppColors.dart';
import 'package:customer_ui/utils/styles.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:intl/intl.dart';
import 'package:login_data/models/login_response.dart';
import 'package:login_ui/authenticate_user_pop_up.dart';
import 'package:login_ui/manager_login_popup.dart';
import 'package:login_ui/utils/common_widgets.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/task_types_container/task_type_container_dto.dart';
import 'package:master_data/models/user_role_container/management_form_access_container_dto.dart';
import 'package:master_data/models/user_role_container/user_role_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:orders_data/builder.dart';
import 'package:orders_ui/OrdersPage.dart';
import 'package:other_function_ui/other_function_item.dart';
import 'package:other_function_ui/screens/balance_transfer.dart';
import 'package:other_function_ui/screens/exchange_entitlements/exchnage_entitlements_screen.dart';
import 'package:other_function_ui/screens/load_bonus/load_bonus.dart';
import 'package:other_function_ui/screens/static_menu_screens/static_menu_dashboard.dart';
import 'package:other_function_ui/widgets/colors.dart';
import 'package:other_function_ui/widgets/feature_not_implemented/feature_not_implemented.dart';
import 'package:other_function_ui/widgets/ofContent/consolidate_cards.dart';
import 'package:other_function_ui/widgets/ofContent/deactivate_cards_dialog.dart';
import 'package:other_function_ui/widgets/ofContent/exchange_token_content.dart';
import 'package:other_function_ui/widgets/ofContent/hold_entitlements.dart';
import 'package:other_function_ui/widgets/ofContent/link_cards_dialog.dart';
import 'package:other_function_ui/widgets/ofContent/master_card_content.dart';
import 'package:other_function_ui/widgets/ofContent/real_etoken_body.dart';
import 'package:other_function_ui/widgets/ofContent/redeem_bonus_content.dart';
import 'package:other_function_ui/widgets/ofContent/redeem_loyalty_points.dart';
import 'package:other_function_ui/widgets/ofContent/redeem_ticket_content.dart';
import 'package:other_function_ui/widgets/ofContent/redeem_virtual_loyalty_points.dart';
import 'package:other_function_ui/widgets/ofContent/refund_card_dialog.dart';
import 'package:other_function_ui/widgets/ofContent/transfer_card.dart';
import 'package:other_function_ui/widgets/of_content_widgets/pause_time/pause_time.dart';
import 'package:other_function_ui/widgets/of_item_pop_up.dart';
import 'package:other_function_ui/widgets/text_style.dart';
import 'package:payment_ui/cubits/payment_settlement/settle_screen_cubit.dart';
import 'package:payment_ui/screens/payment_settlement/payment_settlement_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shift_tracking/widgets/bluetooth_printer_discovery_status_dialog.dart';
import 'package:shift_tracking/widgets/no_printers_dialog.dart';
import 'package:shift_tracking/cashdrawer_assignment_dialog.dart';
import 'package:shift_tracking/cubit/remot_cashdrawer_cubit.dart';
import 'package:shift_tracking/remote_cashdrawer_assignment_dialogue.dart';
import 'package:shift_tracking_data/builder.dart';
import 'package:shift_tracking_data/models/shift_dto/shift_dto.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/models/printer_state_model.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'dart:io';
import 'bloc/other_function_bloc.dart';
import 'extensions/grid_builder_extension.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
class OtherFunctionsUi extends StatefulWidget {
  const OtherFunctionsUi(
      {super.key,
      this.onSuccessShowNotification,
      this.onFailureShowNotification,
      required this.printerStateModel});
  final Function? onSuccessShowNotification;
  final Function? onFailureShowNotification;
  final PrinterStateModel printerStateModel;
  @override
  State<OtherFunctionsUi> createState() => _OtherFunctionsUiState();
}

class _OtherFunctionsUiState extends State<OtherFunctionsUi> {
  TextEditingController searchController = TextEditingController();
  ValueNotifier<bool> isSearchEnabled = ValueNotifier(false);
  List<String> breadCrumbList = ['Menu'];
  List<TaskTypeContainerDto> _taskTypeContainerList = [];
  final List<TaskTypeContainerDto> _filteredTaskType = [];
  List<TaskTypeContainerDto> _otherFunctionsTasks = [];
  final List<TaskTypeContainerDto> _allOfTaks = [];
  var _execContextBL;
  var _execContext;
  var _otherFunctionBL;
  var _masterDataBl;
  late UserRoleContainerDTO _userRoleContainerDTO;
  final _scrollController = ScrollController();
  final _tasksScrollController = ScrollController();
  late SemnoxTheme _theme;
  bool _isCurrentUserManager = false;
  bool _isEnabledButton = true;
  NotificationBar? notificationBar;
  AttendanceForDay? attendanceForDay;
  late AttendanceDataBLContract attendanceBl;
  var _isFacilityEmpty = false;
  bool isRemoteCashDrawerEnabled = false;

  String posZreceipt = '';
  static const deviceMethodChannel = MethodChannel("semnox.tablet.pos/device");
  static const printingMethodChannel = MethodChannel("semnox.tablet.pos/printing");
  late SharedPreferences preferences;
  final connectedPrinterMacAddress = "connected_printer_mac_address";
  _setInitialList() async {
    // ofItemList = ofItemModelList;
    _execContextBL = await ExecutionContextBuilder.build();
    _execContext = _execContextBL.getExecutionContext();
    _masterDataBl = await MasterDataBuilder.build(_execContext!);
    _taskTypeContainerList = await _masterDataBl.getTaskTypeContainerList();
    _otherFunctionsTasks.clear();
    _allOfTaks.clear();
    for (TaskTypeContainerDto taskElement in _taskTypeContainerList) {
      if (taskElement.category == "OTHERFUNCTIONS" &&
          taskElement.displayInPos == "Y") {
        _otherFunctionsTasks.add(taskElement);
      }
    }
    _otherFunctionsTasks
        .sort((a, b) => a.sortOrder ?? -1.compareTo(b.sortOrder ?? -1));
    refreshUI();

    for (TaskTypeContainerDto task in _otherFunctionsTasks) {
      _allOfTaks.addAll(_taskTypeContainerList
          .where((allTask) =>
              (allTask.category ?? '').toLowerCase() ==
              (task.taskType ?? '').toLowerCase())
          .toList());
    }
    _allOfTaks.removeWhere((e) =>
        (e.taskType ?? "").toLowerCase() == "ITEMMANAGEMENT".toLowerCase() &&
        (e.category ?? '').toLowerCase() == "STAFFFUNCTIONS".toLowerCase());
    final staticMenuTask = _getFilteredTaskType(
        taskTypeList: _taskTypeContainerList,
        category: "ITEMMANAGEMENT",
        taskType: "STATICMENUSETUP");
    if (staticMenuTask.isNotEmpty) {
      _allOfTaks.add(staticMenuTask.first);
    }
  }

  List<TaskTypeContainerDto> _getFilteredTaskType(
      {required List<TaskTypeContainerDto> taskTypeList,
      required String category,
      required String taskType})  {
    _filteredTaskType.clear();
    for (TaskTypeContainerDto taskElement in taskTypeList) {
      if ((taskElement.category ?? '').toLowerCase() ==
              category.toLowerCase() &&
          (taskElement.taskType ?? '').toLowerCase() ==
              taskType.toLowerCase()) {
        _filteredTaskType.add(taskElement);
      }
    }
    return _filteredTaskType;
  }

  _addBreadCrumb(taskType, taskTypeName, category,
      {LoginResponse? loginResponse}) {
    if (taskType == "EXCHANGECREDITFORTOKEN" && category == "TAGFUNCTIONS") {
      _dialogFunc(
        MessagesProvider.get('Exchange\nCredits > Token'),
        const ExchangeTokenBody(),
        true,
        CreditForToken(),
      );
    } else if (taskType == "EXCHANGETOKENFORCREDIT" &&
        category == "TAGFUNCTIONS") {
      _dialogFunc(
        MessagesProvider.get('Exchange\nTokens > Credits'),
        const ExchangeTokenBody(isChangeToken: true),
        true,
        TokenForCredit(),
      );
    } else if (taskType == "REALETICKET" && category == "TAGFUNCTIONS") {
      _dialogFunc(
        MessagesProvider.get('Real / e-Ticket'),
        const RealeToken(),
        true,
        RealEToken(),
      );
    } else if (taskType == "REDEEMLOYALTY" && category == "TAGFUNCTIONS") {
      _dialogFunc(
        MessagesProvider.get('Redeem\nPoints'),
        const RedeemLoyaltyPoints(),
        true,
        RedeemPoints(managerId: loginResponse?.data?.userPKId),
      );
    } else if (taskType == "REDEEMVIRTUALPOINTS" &&
        category == "TAGFUNCTIONS") {
      _dialogFunc(
        MessagesProvider.get('Redeem\nPoints'),
        const RedeemVirtualLoyaltyPoints(),
        true,
        RedeemPoints(managerId: loginResponse?.data?.userPKId),
      );
    } else if (taskType == "HOLDENTITLEMENTS" && category == "TAGFUNCTIONS") {
      _holdEntitlementsDialog(loginResponse: loginResponse);
    } else if (taskType == "BALANCETRANSFER" && category == "TAGFUNCTIONS") {
      _balanceTransferDialog(loginResponse: loginResponse);
    } else if (taskType == "STATICMENUSETUP" && category == "ITEMMANAGEMENT") {
      _staticMenuSetupPage();
    } else if (taskType == "COMPLETECREDITCARDTRANSACTIONS" &&
        category == "TRANSACTIONFUNCTIONS") {
      _creditCardTransactionsPage();
    } else if (taskType == "TRANSFERCARD" && category == "TAGFUNCTIONS") {
      _transferCardDialog();
    } else if (taskType == "REDEEMBONUSFORTICKET" &&
        category == "TAGFUNCTIONS") {
      _dialogFunc(
        MessagesProvider.get('REDEEM\nBonus > Tickets'),
        const RedeemBonus(),
        true,
        RedeemBonusT(),
      );
    } else if (taskType == "REDEEMTICKETSFORBONUS" &&
        category == "TAGFUNCTIONS") {
      _dialogFunc(
        MessagesProvider.get('Redeem Tickets'),
        const RedeemTicket(),
        true,
        RedeemTickets(managerId: loginResponse?.data?.userPKId),
      );
    } else if (taskType == "PAUSETIMEENTITLEMENT" &&
        category == "TAGFUNCTIONS") {
      _dialogFunc(
        MessagesProvider.get('Pause Time'),
        const PauseTime(),
        true,
        PauseTimeEvent(),
      );
    } else if (taskType == "EXCHANGETIMEFORCREDIT" &&
        category == "TAGFUNCTIONS") {
      _exchangeEntitlementsDialog('TTC', loginResponse: loginResponse);
    } else if (taskType == "EXCHANGECREDITFORTIME" &&
        category == "TAGFUNCTIONS") {
      _exchangeEntitlementsDialog('CTT', loginResponse: loginResponse);
    } else if (taskType == "LOADBONUS" && category == "TAGFUNCTIONS") {
      _loadBonusDialog(loginResponse: loginResponse);
    } else if (taskType == "MASTERCARDS" && category == "TAGFUNCTIONS") {
      _showFeatureNotImplementedDialog(taskTypeName);
    } else if (taskType == "LINKCARDS" && category == "TAGFUNCTIONS") {
      _linkCardDialog();
    } else if (taskType == "DEACTIVATECARDS" && category == "TAGFUNCTIONS") {
      _deactivateCardsDialog();
    } else if (taskType == "CONSOLIDATE" && category == "TAGFUNCTIONS") {
      _consolidateCardsDialog(loginResponse: loginResponse);
    } else if (taskType == "REFUNDCARD" && category == "TAGFUNCTIONS") {
      _refundCard();
    } else if (taskType == "RECORDATTENDANCE" &&
        category == "ATTENDANCEMANAGEMENT") {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => WillPopScope(
          onWillPop: () async => false,
          child: AuthenticateUserView(
            onAuthenticationError: (String) {},
            onTapAuthenticateSuccess: (LoginResonse) {
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (context) {
                  return WillPopScope(
                    onWillPop: () async => false,
                    child: AttendancePopUp(
                      onFailureShowNotification: (msg) {
                        notificationBar?.showMessage('', _theme.footerBG3!);
                      },
                      onSuccess: () async {
                        var execContextBL = await ExecutionContextBuilder.build();
                        var execContextDTO = execContextBL.getExecutionContext();
                        attendanceForDay = await attendanceBl.getAttendanceDetails(
                            userId: execContextDTO?.userPKId ?? 0);
                      },
                      loginResponse: LoginResonse,
                    ),
                  );
                },
              );
            },
            onAuthenticationSuccess: (LoginResponse) {
              Navigator.of(context).pop();
              Navigator.of(context).pop();

              showDialog(
                context: context,
                builder: (context) {
                  return WillPopScope(
                    onWillPop: () async => false,
                    child: AttendancePopUp(
                      onFailureShowNotification: (msg) {
                        notificationBar?.showMessage(msg, _theme.footerBG3!);
                      },
                      onSuccess: () async {
                        var execContextBL = await ExecutionContextBuilder.build();
                        var execContextDTO = execContextBL.getExecutionContext();
                        attendanceForDay = await attendanceBl.getAttendanceDetails(
                            userId: execContextDTO?.userPKId ?? 0);
                      },
                      loginResponse: LoginResponse,
                    ),
                  );
                },
              );
            },
          ),
        ),
      );
    }
    // these below features does not exists...
    else if (taskType == "INVENTORYFUNCTIONS" && category == "OTHERFUNCTIONS") {
      _showFeatureNotImplementedDialog(taskTypeName);
    } else if (taskType == "REPORTS" && category == "OTHERFUNCTIONS") {
      _showFeatureNotImplementedDialog(taskTypeName);
    } else if (taskType == "LOADTICKETS" && category == "TAGFUNCTIONS") {
      _showFeatureNotImplementedDialog(taskTypeName);
    } else if (taskType == "NOTIFICATIONDEVICE" && category == "TAGFUNCTIONS") {
      _showFeatureNotImplementedDialog(taskTypeName);
    } else if (taskType == "MANAGESTAFFCARDS" && category == "TAGFUNCTIONS") {
      _showFeatureNotImplementedDialog(taskTypeName);
    } else if (taskType == "VIEWCARDTASKS" && category == "TAGFUNCTIONS") {
      _showFeatureNotImplementedDialog(taskTypeName);
    } else if (taskType == "LEGACYCARDTRANSFER" && category == "TAGFUNCTIONS") {
      _showFeatureNotImplementedDialog(taskTypeName);
    } else if (taskType == "GAMEMANAGEMENT" && category == "STAFFFUNCTIONS") {
      _showFeatureNotImplementedDialog(taskTypeName);
    } else if (taskType == "CASHDRAWERMANAGEMENT" &&
        category == "STAFFFUNCTIONS") {

      if (isRemoteCashDrawerEnabled){
        widget.onFailureShowNotification!("Unable to perform Remote cash drawer management for current user");
        return ;
      }
      /*
      *      showDialog(
          context: context,
          barrierDismissible: false,
          barrierColor: Colors.black45,
          builder: (context) {
            final printerStateModel = PrinterStateModel();
            return CashDrawerAssignmentDialog(fromPage: 'OtherFunctions',printerStateModel: printerStateModel,);
          });*/
      showDialog(
          context: context,
          barrierDismissible: false,
          barrierColor: Colors.black45,
          builder: (context) {
            return BlocProvider(
               create: (context) => RemoteCashDrawerCubit(),
               child: RemoteCashDrawerAssignment(),
             );
          });
    } else if (taskType == "LOGINFUNCTIONS" && category == "STAFFFUNCTIONS") {
      _showFeatureNotImplementedDialog(taskTypeName);
    } else if (taskType == "FINGERPRINTENROLLORDEACTIVATE" &&
        category == "ATTENDANCEMANAGEMENT") {
      _showFeatureNotImplementedDialog(taskTypeName);
    } else if (taskType == "MANAGEATTENDANCE" &&
        category == "ATTENDANCEMANAGEMENT") {
      _showFeatureNotImplementedDialog(taskTypeName);
    }
    // else if (taskType == "ATTENDANCEMANAGEMENT" &&
    //     category == "STAFFFUNCTIONS") {
    //   _showFeatureNotImplementedDialog(taskTypeName);
    // }
    else if (taskType == "REMOTEENDOFDAY" && category == "STAFFFUNCTIONS") {
      _showPerformEODDialog();
    //  _showFeatureNotImplementedDialog(taskTypeName);
    } else if (taskType == "ACCESSCONTROL" &&
        category == "TRANSACTIONFUNCTIONS") {
      _showFeatureNotImplementedDialog(taskTypeName);
    } else if (taskType == "FORCEUNLOCKTRANSACTION" &&
        category == "TRANSACTIONFUNCTIONS") {
      _showFeatureNotImplementedDialog(taskTypeName);
    } else if (taskType == "COUPONSTATUS" &&
        category == "TRANSACTIONFUNCTIONS") {
      _showFeatureNotImplementedDialog(taskTypeName);
    } else if (taskType == "LOCKERMANAGEMENT" &&
        category == "TRANSACTIONFUNCTIONS") {
      _showFeatureNotImplementedDialog(taskTypeName);
    } else if (taskType == "CHECKINCHECKOUTDETAILS" &&
        category == "TRANSACTIONFUNCTIONS") {
      _showFeatureNotImplementedDialog(taskTypeName);
    } else if (taskType == "ACHIEVEMENTS" &&
        category == "TRANSACTIONFUNCTIONS") {
      _showFeatureNotImplementedDialog(taskTypeName);
    } else if (taskType == "SIGNEDWAIVERS" &&
        category == "TRANSACTIONFUNCTIONS") {
      _showFeatureNotImplementedDialog(taskTypeName);
    } else if (taskType == "SUBSCRIPTIONDETAILS" &&
        category == "TRANSACTIONFUNCTIONS") {
      _showFeatureNotImplementedDialog(taskTypeName);
    } else if (taskType == "PRODUCTSAVAILABILITY" &&
        category == "ITEMMANAGEMENT") {
      _showFeatureNotImplementedDialog(taskTypeName);
    } else {
      _otherFunctionsTasks.clear();
      for (TaskTypeContainerDto taskElement in _taskTypeContainerList) {
        if (taskElement.category == taskType &&
            taskElement.displayInPos == "Y") {
          _otherFunctionsTasks.add(taskElement);
        }
      }
      _otherFunctionsTasks
          .sort((a, b) => a.sortOrder ?? -1.compareTo(b.sortOrder ?? -1));
      breadCrumbList.add(taskTypeName);
      refreshUI();
    }
  }

  _refundCard() {
    return showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: RefundCardDialog(
            onFailureShowNotification: widget.onFailureShowNotification,
            onSuccessShowNotification: widget.onSuccessShowNotification,
          ),
        );
      },
    );
  }

  _consolidateCardsDialog({LoginResponse? loginResponse}) {
    return showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
            onWillPop: () async => false,
            child: const ConsolidateCards());
      },
    );
  }

  _deactivateCardsDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
            onWillPop: () async => false,
            child: const DeactivateCardsDialog());
      },
    );
  }

  _linkCardDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
            onWillPop: () async => false,
            child: const LinkCardDialog());
      },
    );
  }

  _masterCardDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
            onWillPop: () async => false,
            child: const MasterCardContent());
      },
    );
  }

  _loadBonusDialog({LoginResponse? loginResponse}) {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: LoadBonusScreen(
              approverId: loginResponse?.data?.userPKId,
              onSuccessShowNotification: widget.onSuccessShowNotification,
              onFailureShowNotification: widget.onFailureShowNotification),
        );
      },
    );
  }

  _exchangeEntitlementsDialog(exchangeType, {LoginResponse? loginResponse}) {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: ExchangeEntitlementScreen(
              approverId: loginResponse?.data?.userPKId,
              exchangeType: exchangeType,
              onSuccessShowNotification: widget.onSuccessShowNotification,
              onFailureShowNotification: widget.onFailureShowNotification),
        );
      },
    );
  }

  _transferCardDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: TransferCard(
            onFailureShowNotification: widget.onFailureShowNotification,
            onSuccessShowNotification: widget.onSuccessShowNotification,
          ),
        );
      },
    );
  }

  _staticMenuSetupPage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const StaticMenuDashBoard()));
  }

  _creditCardTransactionsPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider<SettleScreenCubit>(
                create: (context) => SettleScreenCubit(),
                child: const PaymentSettlementScreen())));
  }

  _balanceTransferDialog({LoginResponse? loginResponse}) {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: BalanceTransferDialog(
            loginResponse: loginResponse,
            onFailureShowNotification: widget.onFailureShowNotification,
            onSuccessShowNotification: widget.onSuccessShowNotification,
          ),
        );
      },
    );
  }

  _holdEntitlementsDialog({LoginResponse? loginResponse}) {
    return showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: HoldEntitlementDialog(
            onFailureShowNotification: widget.onFailureShowNotification,
            onSuccessShowNotification: widget.onSuccessShowNotification,
          ),
        );
      },
    );
  }

  _dialogFunc(
    String header,
    Widget content,
    bool isHeader,
    OtherFunctionEvent event,
  ) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: OfItemPopUp(
            onFailureShowNotification: widget.onFailureShowNotification,
            onSuccessShowNotification: widget.onSuccessShowNotification,
            event: event,
            contentWidget: content,
            height: height,
            width: width,
            header: header,
            isHeader: isHeader,
          ),
        );
      },
    );
  }

  _setItemList(int index, String taskTypeName) {
    if (index == 0) {
      _setInitialList();
    } else {
      _otherFunctionsTasks.clear();
      List<TaskTypeContainerDto> filteredTasks = [];
      // print('taskTypeName $taskTypeName');
      for (TaskTypeContainerDto task in _taskTypeContainerList) {
        if (task.taskTypeName?.toLowerCase() == taskTypeName.toLowerCase()) {
          filteredTasks.add(task);
        }
      }
      // print("_filteredTasksLength ${filteredTasks.length}");
      if (filteredTasks.isNotEmpty) {
        // print("_filteredTasks ${filteredTasks[0].taskTypeName}");
        for (TaskTypeContainerDto taskElement in _taskTypeContainerList) {
          if (taskElement.category == filteredTasks[0].taskType &&
              taskElement.displayInPos == "Y") {
            _otherFunctionsTasks.add(taskElement);
          }
        }
        _otherFunctionsTasks
            .sort((a, b) => a.sortOrder?.compareTo(b.sortOrder ?? -1) ?? -1);
        breadCrumbList.add(taskTypeName);
        refreshUI();
      }
    }
  }

  void refreshUI() {
    try {
      setState(() {});
    } catch (e) {
      // print(e);
    }
  }
  Future<dynamic> nativeMethodHandler(MethodCall methodCall) async {
    switch(methodCall.method) {
      case "DEVICE MANUFACTURER":
        {
          widget.printerStateModel.deviceManufacturer = methodCall.arguments;
        }
        break;
      case "PDA PRINTING SUCCESS" :
        {
          loader.hideLoaderDialog(context);
          notificationBar!.showMessage(
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
              notificationBar!.showMessage(
                  MessagesProvider.get("No Active Bluetooth Printers Found.."),
                  semnoxTheme.footerBG5!);

            }
          } else {
            widget.printerStateModel.activePrinters?.forEach((printerData) {
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
              notificationBar!.showMessage(
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
          notificationBar!.showMessage(
              MessagesProvider.get(""
                  "Unable to print the pos-z receipt as the bluetooth permission is denied."), AppColors.notificationBGLightBlueColor);
        }
        break;
      case "BLUETOOTH PERMISSION DENIED" :
        {
          loader.hideLoaderDialog(context);
          notificationBar!.showMessage(
              MessagesProvider.get("Unable to print the pos-z receipt as the bluetooth permission was denied."),
              semnoxTheme.footerBG5!);;
        }
        break;
      case "LOCATION PERMISSION DENIED" :
        {
          loader.hideLoaderDialog(context);
          notificationBar!.showMessage(
              MessagesProvider.get("Unable to print the pos-z receipt as the location permission was denied."),
              semnoxTheme.footerBG5!);
        }
        break;
      case "BLUETOOTH TURNED OFF" :
        {
          loader.hideLoaderDialog(context);
          notificationBar!.showMessage(
              MessagesProvider.get("Unable to print the pos-z receipt as the bluetooth is turned off."),
              semnoxTheme.footerBG5!);
        }
        break;
      case "LOCATION TURNED OFF" :
        {
          loader.hideLoaderDialog(context);
          notificationBar!.showMessage(
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
          notificationBar!.showMessage(
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


  @override
  void initState() {
    _setInitialList();
    _checkCurrentUserPrivileges();
    Future.microtask(()=> _checkFacilities());
    notificationBar = NotificationBar(showHideSideBar: false);
    Future.microtask(() {
      checkEnabledRemoteCashDrawerManagement();
    });
    Future.microtask(() async {
      if (!mounted) return;
      if(Platform.isAndroid) {
        preferences = await SharedPreferences.getInstance();
        if(widget.printerStateModel.deviceManufacturer == null) {
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
    super.initState();
  }

  Future<void> _checkCurrentUserPrivileges() async {
    _execContextBL = await ExecutionContextBuilder.build();
    _execContext = _execContextBL.getExecutionContext();
    _masterDataBl = await MasterDataBuilder.build(_execContext!);
    _userRoleContainerDTO =
        await _masterDataBl.getUserRoleById(_execContext.userRoleId ?? -1);
    _isCurrentUserManager = _userRoleContainerDTO.selfApprovalAllowed == true;
    // refreshUI();
  }

  Future<bool> _isEnabledTask(String category, String taskTypeName) async {
    _isEnabledButton = false;
    if (_masterDataBl != null) {
      for (ManagementFormAccessContainerDTO mangerDto
          in (_userRoleContainerDTO.managementFormAccessContainerDTOList ??
              [])) {
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
      _userRoleContainerDTO =
          await _masterDataBl.getUserRoleById(_execContext.userRoleId ?? -1);
      for (ManagementFormAccessContainerDTO mangerDto
          in (_userRoleContainerDTO.managementFormAccessContainerDTOList ??
              [])) {
        if (mangerDto.mainMenu.toLowerCase() == category.toLowerCase() &&
            mangerDto.formName.toLowerCase() == taskTypeName.toLowerCase()) {
          _isEnabledButton = true;
        }
      }

      return _isEnabledButton;
    }
  }

  void _showManagerLoginPopup(
      {required BuildContext newContext, required Function onAuthSuccess}) {
    showDialog(
        context: newContext,
        builder: (ctx) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: SizeConfig.getSize(220)),
            child: WillPopScope(
              onWillPop: () async => false,
              child: ManagerLoginView(
                onLoginSuccess: (LoginResponse response) {
                  onAuthSuccess(response);
                },
                onLoginError: (err) {},
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    KColor.init(context);
    KTextStyle.init(context);
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: SizeConfig.getSize(8)),
              child: SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ValueListenableBuilder<bool>(
                      valueListenable: isSearchEnabled,
                      builder: (context, value, child) {
                        return (value)
                            ? Expanded(
                                child: Padding(
                                  padding:  EdgeInsets.only(left: SizeConfig.getSize(10),right: SizeConfig.getSize(10)),
                                  child: SizedBox(
                                    height: SizeConfig.getSize(58),
                                    child: TextFormField(
                                      controller: searchController,
                                      onChanged: (text) {
                                        setState(() {
                                          _otherFunctionsTasks.clear();
                                          _otherFunctionsTasks = _allOfTaks
                                              .where((e) => (e.taskTypeName ?? '')
                                                  .toLowerCase()
                                                  .contains(text.toLowerCase()))
                                              .toList();
                                        });
                                      },
                                      style: SizeConfig.isBigDevice()?_theme.description2!.copyWith(fontSize:SizeConfig.getSize(20)):_theme.description2!,
                                      decoration: InputDecoration(
                                        hintText: MessagesProvider.get(
                                            'Search Task Type Name'),
                                        hintStyle: _theme.textFieldHintStyle!
                                            .copyWith(
                                                fontSize: SizeConfig.getSize(20)),
                                        contentPadding: EdgeInsets.only(
                                          top: 0,
                                          bottom: 0,
                                          right: SizeConfig.getSize(10),
                                          left: SizeConfig.getSize(10),
                                        ),
                                        constraints: BoxConstraints(
                                            maxHeight: SizeConfig.getSize(58),
                                            minHeight: SizeConfig.getSize(58)),
                                        border: InputBorder.none,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: _theme.secondaryColor!),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: _theme.secondaryColor!),
                                        ),
                                        suffixIcon: searchController
                                                .text.isNotEmpty
                                            ? IconButton(
                                              alignment: Alignment.centerRight,
                                              padding: EdgeInsets.only(right: SizeConfig.getSize(5)),
                                                onPressed: () {
                                                  setState(() {
                                                    searchController.clear();
                                                    _otherFunctionsTasks.clear();
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.cancel,
                                                  size: SizeConfig.isBigDevice()?SizeConfig.getSize(48):SizeConfig.getSize(58),
                                                  color: _theme.secondaryColor!,
                                                ),
                                              )
                                            : null,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Expanded(
                                child: SizedBox(
                                  height: SizeConfig.getSize(58),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: SizeConfig.getSize(6), right: 2),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              SizeConfig.getSize(8))),
                                      child: Scrollbar(
                                        // interactive: true,
                                        radius: Radius.circular(
                                            SizeConfig.getSize(8)),
                                        thumbVisibility: true,
                                        controller: _scrollController,
                                        child: SingleChildScrollView(
                                          controller: _scrollController,
                                          scrollDirection: Axis.horizontal,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical:
                                                    SizeConfig.getSize(4)),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.arrow_right,
                                                  size: SizeConfig.getSize(25),
                                                ),
                                                BreadCrumb.builder(
                                                  itemCount:
                                                      breadCrumbList.length,
                                                  builder: (index) {
                                                    return BreadCrumbItem(
                                                      padding: EdgeInsets.zero,
                                                      margin: EdgeInsets.zero,
                                                      content: GestureDetector(
                                                        onTap: () {
                                                          if (index !=
                                                              breadCrumbList
                                                                      .length -
                                                                  1) {
                                                            _setItemList(
                                                                index,
                                                                breadCrumbList[
                                                                    index]);
                                                            breadCrumbList
                                                                .removeRange(
                                                                    index + 1,
                                                                    breadCrumbList
                                                                        .length);
                                                            refreshUI();
                                                          }
                                                        },
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color: _theme.button1BG1,
                                                              borderRadius: BorderRadius.all(
                                                                  Radius.circular(
                                                                      SizeConfig
                                                                          .getSize(
                                                                              4)))),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .all(SizeConfig
                                                                    .getSize(
                                                                        4)),
                                                            child: Text(
                                                              breadCrumbList[
                                                                  index],
                                                              style: _theme
                                                                  .heading1!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          SizeConfig.getFontSize(
                                                                              32)),
                                                              maxLines: 2,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  divider: Icon(
                                                      Icons.arrow_right,
                                                      size: SizeConfig.getSize(
                                                          25)),
                                                  overflow: ScrollableOverflow(
                                                    keepLastDivider: false,
                                                    reverse: false,
                                                    direction: Axis.horizontal,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                      },
                    ),
                    InkWell(
                      onTap: () {
                        // _showFeatureNotImplementedDialog("Search");

                        isSearchEnabled.value = !isSearchEnabled.value;
                        if (isSearchEnabled.value == false) {
                          if (FocusScope.of(context).hasFocus) {
                            FocusScope.of(context).unfocus();
                          }
                          _otherFunctionsTasks.clear();
                          _setInitialList();
                          _allOfTaks.clear();
                          searchController.clear();
                          breadCrumbList.clear();
                          breadCrumbList.add("Menu");
                        } else {
                          setState(() {
                            _otherFunctionsTasks.clear();
                          });
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.getSize(4)),
                        child: Container(
                          height: SizeConfig.getSize(58),
                          width: SizeConfig.getSize(58),
                          decoration: BoxDecoration(
                              color: _theme.button1BG1!,
                              borderRadius:
                                  BorderRadius.circular(SizeConfig.getSize(8))),
                          child: ValueListenableBuilder<bool>(
                            valueListenable: isSearchEnabled,
                            builder: (context, value, _) {
                              return (value)
                                  ? Icon(Icons.close,
                                      size: SizeConfig.getSize(25),
                                      color: _theme.secondaryColor!)
                                  : Icon(Icons.search,
                                      size: SizeConfig.getSize(25),
                                      color: _theme.secondaryColor!);
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: LayoutBuilder(builder: (context, constraints) {
                // print("maxWidth ${constraints.maxWidth} ");
                // print("maxHeight ${constraints.maxHeight} ");
                final int maxCount =
                    (constraints.maxWidth / SizeConfig.getSize(145)).truncate();
                return Scroller(
                  controller: _tasksScrollController,
                  child: GridView.builder(
                    controller: _tasksScrollController,
                    padding:
                        EdgeInsets.symmetric(horizontal: SizeConfig.getSize(4)),
                    itemCount: _otherFunctionsTasks.length,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            crossAxisCount: maxCount,
                            height: SizeConfig.getSize(68),
                            width: SizeConfig.getSize(138)),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (newContext, index) {
                      return FutureBuilder<bool>(
                          future: _isEnabledTask(
                              _otherFunctionsTasks[index].category ?? '',
                              _otherFunctionsTasks[index].taskTypeName ?? ''),
                          builder: (newContext, snapshot) {
                            if (snapshot.hasData) {
                              return GestureDetector(
                                onTap: snapshot.data ?? true
                                    ? () {
                                        if (_otherFunctionsTasks[index]
                                                    .requiresManagerApproval ==
                                                'Y' &&
                                            !_isCurrentUserManager) {
                                          return _showManagerLoginPopup(
                                              onAuthSuccess:
                                                  (LoginResponse response) {
                                                Future.microtask(() =>
                                                    _addBreadCrumb(
                                                        _otherFunctionsTasks[
                                                                index]
                                                            .taskType,
                                                        _otherFunctionsTasks[
                                                                index]
                                                            .taskTypeName,
                                                        _otherFunctionsTasks[
                                                                index]
                                                            .category,
                                                        loginResponse:
                                                            response));
                                              },
                                              newContext: newContext);
                                        } else {
                                          _addBreadCrumb(
                                              _otherFunctionsTasks[index]
                                                  .taskType,
                                              _otherFunctionsTasks[index]
                                                  .taskTypeName,
                                              _otherFunctionsTasks[index]
                                                  .category);
                                        }
                                      }
                                    : null,
                                child: OtherFunctionItem(
                                  ofItem: _otherFunctionsTasks[index]
                                          .taskTypeName ??
                                      '',
                                  isEnabled: snapshot.data ?? true,
                                ),
                              );
                            } else {
                              return GestureDetector(
                                onTap: () {
                                  if (_otherFunctionsTasks[index]
                                              .requiresManagerApproval ==
                                          'Y' &&
                                      !_isCurrentUserManager) {
                                    return _showManagerLoginPopup(
                                        onAuthSuccess:
                                            (LoginResponse response) {
                                          Future.microtask(() => _addBreadCrumb(
                                              _otherFunctionsTasks[index]
                                                  .taskType,
                                              _otherFunctionsTasks[index]
                                                  .taskTypeName,
                                              _otherFunctionsTasks[index]
                                                  .category,
                                              loginResponse: response));
                                        },
                                        newContext: newContext);
                                  } else {
                                    _addBreadCrumb(
                                        _otherFunctionsTasks[index].taskType,
                                        _otherFunctionsTasks[index]
                                            .taskTypeName,
                                        _otherFunctionsTasks[index].category);
                                  }
                                },
                                child: OtherFunctionItem(
                                  ofItem: _otherFunctionsTasks[index]
                                          .taskTypeName ??
                                      '',
                                  isEnabled: true,
                                ),
                              );
                            }
                          });
                    },
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  void _showFeatureNotImplementedDialog(String title) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: FeatureNotImplementedView(title));
        });
  }

  _showPerformEODDialog() async {
    notificationBar!.showMessage(
        "",
        Colors.white);
    Log.printMethodStart('PerformEOD()','DashBoard','Perform EOD');
    loader.showLoaderDialog(context);
    final _cashDrawerDetails = await getOpenOrClosedCashDrawer();
    final openTransactionCount = await getOpenTransactionCount();
    loader.hideLoaderDialog(context);
    if (_cashDrawerDetails != null && _cashDrawerDetails.length > 0) {
    notificationBar!.showMessage(
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
      var response = await orderDataBL.getTransactionCountOnly(
        fromDate: fromDate,
        toDate: toDate,
        status:
        "BOOKED,CONFIRMED,MERGED,ORDERED,PAID,PENDING_CLOSE,REOPENED,STARTED",
      );
      if (response.exception == null) {
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
    try{
      Log.printMethodStart(' getOpenOrClosedCashDrawer()','Other Functions','Remote EOD');
      final  response = await shiftTrackingBL.getCashDrawerDetails(userID: -1,query: {
        'actionType':"Open,ROpen,PClose",
        'posmachine': execContextDTO.posMachineName,
        'buildSystemNumbers':false,
        'buildChildRecords':false
      });
      Log.printMethodEnd(' getOpenOrClosedCashDrawer()','Other Functions','Remote EOD');
      if (response.exception == null && response.message == null) {
        Log.printMethodReturn(' getOpenOrClosedCashDrawer()-Success','Other Functions','Remote EOD');
        return response.data;
      }
    } on DioError catch(error){
      var errorString = error.response?.data['data'] as String?;
      print("$errorString");
    }
    return null;
  }


  Future<bool> performEndOfDay()async{
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final shiftTrackingBL = await ShiftTrackDataBuilder.build(execContextDTO!);
    var machineId = execContextDTO.machineId;
    try{
      Log.printMethodStart('performEndOfDay()','Other Functions','OK');
      final  response = await shiftTrackingBL.setEndOfDayResponse(machineId!);
      Log.printMethodEnd('performEndOfDay()','Other Functions','OK');
      if (response.exception == null && response.message == null) {
        return true;
      }
    } on DioError catch(error){
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
                               notificationBar!.showMessage(
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
    widget.printerStateModel.printerType = await masterDataBl.getDefaultValuesByName(defaultValueName: "PRINTER_TYPE");
    loader.showLoaderDialog(context, "Printing Pos-Z receipt...");
    if (widget.printerStateModel.printerType == "SUNMI" &&
        widget.printerStateModel.deviceManufacturer == "SUNMI") {
      printingMethodChannel.setMethodCallHandler(nativeMethodHandler);
      printingMethodChannel.invokeMethod("printReceipt", {
        "type": "SUNMI",
        "receipt": posZreceipt,
        "receiptType": "POSREPORT",
        "isBitmap": true
      });
    } else if (widget.printerStateModel.printerType == "ZEBRA" &&
        widget.printerStateModel.isBluetoothSupported == true &&
        widget.printerStateModel.deviceManufacturer != "SUNMI") {
      printingMethodChannel.setMethodCallHandler(nativeMethodHandler);
      printingMethodChannel.invokeMethod("printReceipt", {
        "type": "ZEBRA",
        "receipt": posZreceipt,
        "receiptType": "POSREPORT",
        "isBitmap": true
      });
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

  checkEnabledRemoteCashDrawerManagement()  async{
    if(_masterDataBl == null) {
      _execContextBL = await ExecutionContextBuilder.build();
      _execContext = _execContextBL.getExecutionContext();
      _masterDataBl = await MasterDataBuilder.build(_execContext!);
    }
    String? isEnabled = await _masterDataBl.getDefaultValuesByName(
        defaultValueName: "ENABLE_REMOTE_SHIFT_OPEN_AND_CLOSE");
    print('checkEnabledRemoteCashDrawerManagement()=>$isEnabled');
    if(isEnabled == 'Y') {
      isRemoteCashDrawerEnabled = true;
    } else{
      isRemoteCashDrawerEnabled = false;
    }
  }

}
