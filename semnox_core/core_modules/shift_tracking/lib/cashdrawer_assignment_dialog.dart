import 'dart:developer';

import 'dart:async';
import 'dart:io';

import 'package:application_prefs_data/builder.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:master_data/builder.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/AppColors.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shift_tracking/drawer_dropdown_view.dart';
import 'package:shift_tracking/header_view.dart';
import 'package:shift_tracking/lines_view.dart';
import 'package:shift_tracking/primary_button.dart';
import 'package:shift_tracking/widgets/bluetooth_printer_discovery_status_dialog.dart';
import 'package:shift_tracking/widgets/no_printers_dialog.dart';
import 'package:widgets_library/models/printer_state_model.dart';
import 'package:shift_tracking_data/models/shift_dto/shift_dto.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:themes_library/themes_library.dart';
import 'package:product_config_ui/widgets/primaryMediumButton.dart';
import 'package:login_ui/utils/common_widgets.dart';
import 'package:semnox_tablet_pos/AppStyle.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:application_prefs_data/application_prefs_data.dart';
import 'package:shift_tracking_data/builder.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:shift_tracking/theme/app_colors.dart' as colors;
import 'package:orders_ui/utils/AppColors.dart' as color;
import 'constants/constants.dart';

var shiftUsername = '';
var shiftAction = '';
var shiftAmount = '';
var shiftCardCount = '';
var shiftGameCardAmount = '';
var shiftCreditCardAmount = '';
var shiftOthersAmount = '';
var shiftCouponsAmount = '';
var shiftTicketsAmount = '';
var shiftRemarks = '';
var cashDrawerAssignedLoginId = '';
var shiftTime = '';
var shiftIsShareable = '';
var shiftPosMachineName = '';
bool showLoading = false;

ValueNotifier<String> cashDrawerEnabled = ValueNotifier('');
ValueNotifier<String> cashDrawerOpenOrNot = ValueNotifier('');
ValueNotifier<String> cashDrawerId = ValueNotifier('');
ValueNotifier<String> cashDrawerName = ValueNotifier('');
ValueNotifier<String> shiftKey = ValueNotifier('');
ValueNotifier<String> shiftLogId = ValueNotifier('');
ValueNotifier<String> cashDrawerStatusId = ValueNotifier('');
ValueNotifier<String> isShiftOpenOrClosed = ValueNotifier('');

ValueNotifier<String> cashCount = ValueNotifier('');
ValueNotifier<String> cardCount = ValueNotifier('');
ValueNotifier<String> gameCardCount = ValueNotifier('');
ValueNotifier<String> creditCardCount = ValueNotifier('');
ValueNotifier<String> othersCount = ValueNotifier('');
ValueNotifier<String> couponsCount = ValueNotifier('');
ValueNotifier<String> ticketsCount = ValueNotifier('');

//{ShiftKey: 89930, ShiftUserName: Semnox, ShiftTime: 2023-10-06T09:12:21.0695816, ShiftUserType: POS, ShiftAction: Open, ShiftAmount: 0.0, CardCount: 0.0, ShiftTicketNumber: 0, ShiftRemarks: null, POSMachine: MLR-LT023, ActualAmount: 0.0, ActualCards: null, ActualTickets: 0.0, GameCardamount: 0.0, CreditCardamount: 0.0, ChequeAmount: 0.0, CouponAmount: 0.0, ActualGameCardamount: 0.0, ActualCreditCardamount: 0.0, ActualChequeAmount: 0.0, ActualCouponAmount: 0.0, ShiftLoginId: Semnox, MasterEntityId: -1, CreatedBy: semnox, CreationDate: 2023-10-06T09:12:21.083, LastUpdatedBy: semnox, LastUpdatedDate: 2023-10-06T09:12:21.083, Guid: b60ed968-47e0-4c99-ada1-baa296b5f26f, SiteId: 1012, SynchStatus: false, ShiftLogDTOList: [{ShiftLogId: 2719, ShiftKey: 89930, ShiftId: 89930, ShiftTime: 2023-10-06T09:12:21.0695816, ShiftAction: Open, ShiftAmount: 0.0, CardCount: 0, ShiftTicketNumber: 0, ShiftRemarks: null, ActualAmount: 0.0, ActualCards: 0, ActualTickets: 0, GameCardAmount: 0.0, CreditCardamount: 0.0, ChequeAmount: 0

class CashDrawerAssignmentDialog extends StatefulWidget {
  const CashDrawerAssignmentDialog({
    super.key,
    this.fromPage,
    required this.printerStateModel,
    this.shiftDTO
  });
  final PrinterStateModel printerStateModel;
  final String? fromPage;
  final List<ShiftDTO>? shiftDTO;

  @override
  State<CashDrawerAssignmentDialog> createState() => _CashDrawerAssignmentDialogState();
}

class _CashDrawerAssignmentDialogState extends State<CashDrawerAssignmentDialog> {
  late SemnoxTheme theme;
  NotificationBar? _notificationBar;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _remarksEditingController = TextEditingController();
  late InputDecoration _textInputDecoration;
  late SharedPreferences preferences;

  bool isChecked = false;
  var execContextBL;
  var execContext;
  var masterDataBL;
  String posxReceipt = '';
  int shiftId = -1;
  static const deviceMethodChannel = MethodChannel("semnox.tablet.pos/device");
  static const printingMethodChannel = MethodChannel("semnox.tablet.pos/printing");

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
          _notificationBar!.showMessage(
              MessagesProvider.get("Pos-x Receipt has been printed out."), colors.AppColors.notificationBGLightBlueColor);
          delay();
          popScreen();
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
                    "receipt": posxReceipt,
                    "receiptType": "POSREPORT",
                    "isBitmap": true});
            } else {
              loader.hideLoaderDialog(context);
              _notificationBar!.showMessage(
                  MessagesProvider.get("No Active Bluetooth Printers Found.."),
                  semnoxTheme.footerBG5!);
              delay();
              popScreen();
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
                        "receipt": posxReceipt,
                        "receiptType": "POSREPORT",
                        "isBitmap": true});
                }
              }
            });

            if(!isPrinterMatchFound) {
              loader.hideLoaderDialog(context);
              _notificationBar!.showMessage(
                  MessagesProvider.get("No Active Bluetooth Printers Found.."),
                  semnoxTheme.footerBG5!);
              delay();
              popScreen();
            }
          }
        }
        break;
      case "BLUETOOTH NOT SUPPORTED" :
        {
          loader.hideLoaderDialog(context);
          _notificationBar!.showMessage(
              MessagesProvider.get(""
                  "Unable to print the pos-x receipt as the bluetooth permission is denied."), colors.AppColors.notificationBGLightBlueColor);
          delay();
          popScreen();
        }
        break;
      case "BLUETOOTH PERMISSION DENIED" :
        {
          loader.hideLoaderDialog(context);
          _notificationBar!.showMessage(
              MessagesProvider.get("Unable to print the pos-x receipt as the bluetooth permission was denied."),
              semnoxTheme.footerBG5!);
          delay();
          popScreen();
        }
        break;
      case "LOCATION PERMISSION DENIED" :
        {
          loader.hideLoaderDialog(context);
          _notificationBar!.showMessage(
              MessagesProvider.get("Unable to print the pos-x receipt as the location permission was denied."),
              semnoxTheme.footerBG5!);
          delay();
          popScreen();
        }
        break;
      case "BLUETOOTH TURNED OFF" :
        {
          loader.hideLoaderDialog(context);
          _notificationBar!.showMessage(
              MessagesProvider.get("Unable to print the pos-x receipt as the bluetooth is turned off."),
              semnoxTheme.footerBG5!);
          delay();
          popScreen();
        }
        break;
      case "LOCATION TURNED OFF" :
        {
          loader.hideLoaderDialog(context);
          _notificationBar!.showMessage(
              MessagesProvider.get(""
                  "Unable to print the pos-x receipt as the location is turned off."), colors.AppColors.notificationBGLightBlueColor);
          delay();
          popScreen();
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
                      "receipt": posxReceipt,
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
          _notificationBar!.showMessage(
              MessagesProvider.get("Unable to connect to the printer...."),
              semnoxTheme.footerBG5!);
          delay();
          popScreen();
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
                        "receipt": posxReceipt,
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
          _notificationBar!.showMessage(
              MessagesProvider.get("Pos-x Receipt has been printed out."), colors.AppColors.notificationBGLightBlueColor);
          delay();
          popScreen();
        }
        break;
    }
  }

  Future<void> getCashDrawerStatusContainer() async {
    execContextBL = await ExecutionContextBuilder.build();
    execContext = execContextBL.getExecutionContext();
    masterDataBL = await MasterDataBuilder.build(execContext!);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final http.Response response = await http.get(
      Uri.parse(
          "${appPrefsBL.getServerUrl()}/api/Device/CashDrawerStatusContainer?siteId=${execContext
              .siteId}"),
      headers: {
        "Authorization": "${execContext.webApiToken}",
        "Content-Type": "application/json",
      },
    );
    print("PoS Machine Id : " + execContext.machineId.toString());
    print("User Id : " + execContext.userPKId.toString());
    if (response.statusCode != 200) {
      print("Error");
      print("Error");
      print(json.decode(response.body)['data']);
      print("Error");
      print("Error");
    } else {
      print("Success");
      print("Success");
      print(json.decode(response.body)['data']);
      print("Success");
      print("Success");
    }
  }

  Future<void> getOpenCashDrawers() async {
    execContextBL = await ExecutionContextBuilder.build();
    execContext = execContextBL.getExecutionContext();
    masterDataBL = await MasterDataBuilder.build(execContext!);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final http.Response response = await http.get(
      Uri.parse(
          "${appPrefsBL.getServerUrl()}/api/Pos/"
              "${execContext.machineId}/CashDrawerCurrentStatus"),
      headers: {
        "Authorization": "${execContext.webApiToken}",
        "Content-Type": "application/json",
      },
    );
    print("PoS Machine Id : " + execContext.machineId.toString());
    print("User Id : " + execContext.userPKId.toString());
    if (response.statusCode != 200) {
      print("Error");
      print("Error");
      print(json.decode(response.body)['data']);
      print("Error");
      print("Error");
    } else {
      print("Success");
      print("Success");
      log(json.decode(response.body)['data'].toString());
      setState(() {
        if(widget.fromPage == 'CASHDRAWER POPUP'){
          cashDrawerEnabled.value = 'true';
          cashDrawerOpenOrNot.value = 'PClose';
        }else{
          cashDrawerEnabled.value = 'false';
          cashDrawerId.value =
            json.decode(response.body)['data'][0]['CashDrawerId'].toString();
          cashDrawerAssignedLoginId =
            json.decode(response.body)['data'][0]['AssignedLoginId'].toString();
          cashDrawerName.value = json.decode(response.body)['data'][0]['CashDrawerName'].toString();
        }
      });
      print("cashDrawerId : " + cashDrawerId.value);
      //getCashDrawerButtonStatusesAfterOpen();
      print("Success");
      print("Success");
    }
  }

  Future<void> getCashDrawerButtonStatusesAfterOpen() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final http.Response response = await http.get(
      Uri.parse(
          "${appPrefsBL.getServerUrl()}/api/User/"
              "${execContext.userPKId}/CashDrawer?userId=${execContext
              .userPKId}"
              "&actionType=&"
              "posmachine=${execContext.posMachineName}&"
              "buildSystemNumbers=false&"
              "buildChildRecords=false"
      ),
      headers: {
        "Authorization": "${execContext.webApiToken}",
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode != 200) {
      print("Error");
      print("Error");
      print(json.decode(response.body)['data']);
      print("Error");
      print("Error");
    } else {
      print("Success");
      print("Success");
      log(json.decode(response.body)['data'].toString());
      setState(() {
        if(widget.fromPage == 'CASHDRAWER POPUP'){
          cashDrawerEnabled.value = 'true';
          cashDrawerOpenOrNot.value = 'PClose';
        }else{cashDrawerEnabled.value = 'true';cashDrawerStatusId.value =
            json.decode(response.body)['data'][0]['CashdrawerStatusId']
                .toString();

        shiftUsername =
            json.decode(response.body)['data'][0]['ShiftUserName'].toString();
        shiftAction =
            json.decode(response.body)['data'].last['ShiftAction'].toString();
        shiftAmount =
            json.decode(response.body)['data'].last['ShiftAmount'].toString();
        shiftCardCount =
            json.decode(response.body)['data'].last['CardCount'].toString();
        shiftGameCardAmount =
            json.decode(response.body)['data'].last['GameCardamount'].toString();
        shiftCreditCardAmount =
            json.decode(response.body)['data'].last['CreditCardamount']
                .toString();shiftOthersAmount = json.decode(response.body)['data'].last['ChequeAmount'].toString();
          shiftCouponsAmount = json.decode(response.body)['data'].last['CouponAmount'].toString();
          print('ShiftCoupen Amount====>$shiftCouponsAmount');
          shiftTicketsAmount = json.decode(response.body)['data'].last['ShiftTicketNumber'].toString();
          _remarksEditingController.text = json.decode(response.body)['data'].last['ShiftRemarks'].toString();
          shiftTime = json.decode(response.body)['data'][0]['ShiftTime'].toString();
          shiftIsShareable = json.decode(response.body)['data'][0]['IsShareable'].toString();
          shiftPosMachineName = json.decode(response.body)['data'][0]['POSMachine'].toString();
          isChecked = json.decode(response.body)['data'].last['IsShareable'];
          shiftKey.value = json.decode(response.body)['data'].last['ShiftKey'].toString();
        }
      });
      print("cashDrawerStatusId : " + cashDrawerStatusId.value);
      print("shiftAction : "+shiftAction);
      print("Success");
      print("Success");
    }
  }

  Future<void> getCashDrawerButtonStatuses() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final http.Response response = await http.get(
      Uri.parse(
          "${appPrefsBL.getServerUrl()}/api/User/"
              "${execContext.userPKId}/AssignedCashDrawer?userId=${execContext
              .userPKId}"
              "&actionType=&"
              "posmachine&"
              "buildSystemNumbers=false&"
              "buildChildRecords=false"
      ),
      headers: {
        "Authorization": "${execContext.webApiToken}",
        "Content-Type": "application/json",
      },
    );
    if(widget.fromPage == 'OtherFunctions'){
      cashDrawerOpenOrNot.value = 'OPEN';
      getCashDrawerButtonStatusesAfterOpen();
    }else{
      if (response.statusCode != 200) {
        print("Error");
        print("Error");
        print(json.decode(response.body)['data']);
        if (json.decode(response.body)['data'].toString().contains(
          'Cashdrawer is not assigned')) {
          cashDrawerOpenOrNot.value = 'CLOSED';
          //getCashDrawerButtonStatuses();
        } else {
          cashDrawerOpenOrNot.value = 'OPEN';
          getCashDrawerButtonStatusesAfterOpen();
        }
        print("cashDrawerOpenOrNot.value : " + cashDrawerOpenOrNot.value);
        print("Error");
        print("Error");
      } else {
        print("Success");
        print("Success");
        print(json.decode(response.body)['data']);
        if (json.decode(response.body)['data'].toString().contains(
          'Cashdrawer is not assigned')
            || json.decode(response.body)['data'].toString() == '-1') {
          widget.fromPage == 'CASHDRAWER POPUP'? cashDrawerOpenOrNot.value = 'PClose' : cashDrawerOpenOrNot.value = 'CLOSED';
          //getCashDrawerButtonStatuses();
        } else {
          widget.fromPage == 'CASHDRAWER POPUP'? cashDrawerOpenOrNot.value = 'PClose' :  cashDrawerOpenOrNot.value = 'OPEN';
          getCashDrawerButtonStatusesAfterOpen();
        }
        print("cashDrawerOpenOrNot.value : " + cashDrawerOpenOrNot.value);
        print("Success");
        print("Success");
      }
    }
  }

  Future<void> createNewShift() async {
    shiftLogId.value = '';
    print('cash:- ${cashCount.value.toString()}');
    print('Card count:-${cardCount.value.toString()}');
    print('credit card:- ${creditCardCount.value.toString()}');
    print('others:-${othersCount.value.toString()}');
    print('coupons:- ${couponsCount.value.toString()}');
    print('Tickets:-${ticketsCount.value.toString()}');
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final http.Response response = await http.post(
        Uri.parse( //
            "${appPrefsBL.getServerUrl()}/api/Pos/489/User/3485/Shift?"
                "posmachineId=${execContext.machineId
                .toString()}&userId=${execContext.userPKId.toString()}"),
        headers: {
          "Authorization": "${execContext.webApiToken}",
          "Content-Type": "application/json",
        },
        body: json.encode({
          "shiftId": 0,
          "shiftLogId": 0,
          "shiftAction": "Open",
          "shiftAmount": double.parse(cashCount.value.toString()),
          "cardcount": int.parse(cardCount.value.toString()),
          "shiftTicketNumber":ticketsCount.value == '' ? 0 : int.tryParse(ticketsCount.value.toString()),
          "shiftRemarks": _remarksEditingController.text,
          "actualAmount": null,
          "actualCards": null,
          "actualTickets": null,
          "gameCardAmount": null,
          "creditCardamount": creditCardCount.value == '' ? 0 : int.tryParse(creditCardCount.value.toString()),
          "chequeAmount": othersCount.value == '' ? null : int.tryParse(othersCount.value.toString()),
          "couponAmount": couponsCount.value == '' ? null : int.tryParse(couponsCount.value.toString()),
          "actualGameCardamount": null,
          "actualCreditCardamount": null,
          "actualChequeAmount": null,
          "actualCouponAmount": null,
          "shiftReason": null,
          "cashDrawerId": cashDrawerId.value,
          "shiftUserName": execContext.userId,
          "shiftLoginId": execContext.userId,
          "posMachineName": execContext.posMachineName,
          "isShareable": isChecked,
          "cashDrawerStatusId": 10
        })
    );
    print("PoS Machine Id : " + execContext.machineId.toString());
    print("User Id : " + execContext.userPKId.toString());
    if (response.statusCode != 200) {
      print("Error");
      print("Error");
      print(json.decode(response.body));
      print("Error");
      print("Error");
    } else {
      print("Success");
      print("Success");
      Navigator.of(context).pop();
      print(json.decode(response.body)['data']);
      setState(() {
        isShiftOpenOrClosed.value = 'OPENED';
        shiftKey.value = json.decode(response.body)['data']['ShiftKey'].toString();
        shiftLogId.value = json.decode(response.body)['data']['ShiftLogDTOList'][0]['ShiftLogId'].toString();
      });
      print("shiftLogId.value : "+shiftLogId.value);
      print("shiftKey.value : "+shiftKey.value);
      print("Success");
      print("Success");
    }
  }

  Future<bool> closeShift() async {
    print('idees before');
    print("shiftLogId.value : "+shiftLogId.value);
    print("shiftId.value : "+shiftKey.value);
    if(widget.fromPage == 'CASHDRAWER POPUP') {
      shiftKey.value = widget.shiftDTO![0].shiftKey!.toString();
      shiftLogId.value = widget.shiftDTO![0].shiftLoginId!.toString();
      cashDrawerId.value = widget.shiftDTO![0].cashdrawerId.toString();
    }
    print('idees after');
    print("shiftLogId.value : "+shiftLogId.value);
    print("shiftId.value : "+shiftKey.value);
    print('cash:- ${cashCount.value.toString()}');
    print('Card count:-${cardCount.value.toString()}');
    print('credit card:- ${creditCardCount.value.toString()}');
    print('others:-${othersCount.value.toString()}');
    print('coupons:- ${couponsCount.value.toString()}');
    print('Tickets:-${ticketsCount.value.toString()}');
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final http.Response response = await http.post(
        Uri.parse( //
            "${appPrefsBL.getServerUrl()}/api/Shift/${shiftKey.value}/ShiftStatusChange"),
        headers: {
          "Authorization": "${execContext.webApiToken}",
          "Content-Type": "application/json",
        },
        body: json.encode({
          "shiftId":widget.fromPage == 'CASHDRAWER POPUP'? -1 : int.parse(shiftKey.value.toString()),
          "shiftLogId": int.tryParse(shiftLogId.value.toString()),
          "shiftAction": "Close",
          "shiftAmount": double.parse(cashCount.value.toString()),
          "cardcount": int.parse(cardCount.value.toString()),
          "shiftTicketNumber":ticketsCount.value == '' ? 0 : int.tryParse(ticketsCount.value.toString()),
          "shiftRemarks": _remarksEditingController.text,
          "actualAmount":null,
          "actualCards":null,
          "actualTickets":null,
          "gameCardAmount":null,
          "creditCardamount":creditCardCount.value == '' ? 0 : int.parse(creditCardCount.value.toString()),
          "chequeAmount":othersCount.value == '' ? null :int.tryParse(othersCount.value.toString()),
          "couponAmount":couponsCount.value == '' ? null : int.tryParse(couponsCount.value.toString()),
          "actualGameCardamount":null,
          "actualCreditCardamount":null,
          "actualChequeAmount":null,
          "actualCouponAmount":null,
          "shiftReason":null,
          "cashDrawerId": cashDrawerId.value,
          "shiftUserName": execContext.userId,
          "posMachineName": execContext.posMachineName,
          "isShareable":false,
          "cashDrawerStatusId": 12,//cashDrawerStatusId.value,
          if(widget.fromPage == 'CASHDRAWER POPUP') "Mode":null
        })
    );
    print("shiftKey.value : "+shiftKey.value);
    if(response.statusCode != 200){
      print("Error");
      print("Error");
      print(json.decode(response.body));
      print("Error");
      print("Error");
      return false;
    }else{
      print("Success");
      print("Success");
      isShiftOpenOrClosed.value = 'CLOSED';
      Navigator.of(context).pop();
      print(json.decode(response.body)['data']);
      print("Success");
      print("Success");
      return true;
    }
  }

  Future<bool> provisionalCloseShift() async {
    print("shiftLogId.value : "+shiftLogId.value);
    print("shiftId.value : "+shiftKey.value);
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final http.Response response = await http.post(
        Uri.parse(//
            "${appPrefsBL.getServerUrl()}/api/Shift/${shiftKey.value}/ShiftStatusChange"),
        headers: {
          "Authorization" : "${execContext.webApiToken}",
          "Content-Type" : "application/json",
        },
        body: json.encode({
          "shiftId": int.parse(shiftKey.value.toString()),
          "shiftLogId": int.tryParse(shiftLogId.value.toString()),
          "shiftAction": "PClose",
          "shiftAmount": 0.0,//double.parse(cashCount.value.toString()),
          "cardcount": 0,//int.parse(cardCount.value.toString()),
          "shiftTicketNumber": 0,
          "shiftRemarks": null,
          "actualAmount": null,
          "actualCards": null,
          "actualTickets": null,
          "gameCardAmount": null,
          "creditCardamount": null,
          "chequeAmount": null,
          "couponAmount": null,
          "actualGameCardamount": null,
          "actualCreditCardamount": null,
          "actualChequeAmount": null,
          "actualCouponAmount": null,
          "shiftReason": null,
          "cashDrawerId": cashDrawerId.value,
          "shiftUserName": execContext.userId,
          "shiftLoginId": execContext.userId,
          "posMachineName": execContext.posMachineName,
          "isShareable": false,
          "cashDrawerStatusId": 9,//cashDrawerStatusId.value,
        })
    );
    print("shiftKey.value : "+shiftKey.value);
    if (response.statusCode != 200) {
      print("Error");
      print("Error");
      print(json.decode(response.body)['data']);
      print("Error");
      print("Error");
      return false;
    } else {
      print("Success");
      print("Success");
      Navigator.of(context).pop();
      print(json.decode(response.body)['data']);
      print("Success");
      print("Success");
      return true;
    }
  }

  @override
  void initState() {
    _notificationBar = NotificationBar(showHideSideBar: false);
    super.initState();
    setState(() {
      isChecked = false;
      cashDrawerStatusId.value = '';
      shiftRemarks = '';
      shiftIsShareable = '';
      shiftPosMachineName = '';
      shiftTime = '';
      shiftUsername = '';
      shiftAction = '';
      shiftAmount = '';
      shiftCardCount = '';
      shiftGameCardAmount = '';
      shiftCreditCardAmount = '';
      shiftOthersAmount = '';
      shiftCouponsAmount = '';
      shiftTicketsAmount = '';
      cashDrawerAssignedLoginId = '';
      showLoading = false;
    });
    //shiftLogId.value = '';
    cashDrawerEnabled.value = '';
    cashDrawerName.value = '';
    cashDrawerOpenOrNot.value = '';
    cashDrawerId.value = '';
    //shiftKey.value = '';
    cashCount.value = '';
    cardCount.value = '';
    gameCardCount.value = '';
    creditCardCount.value = '';
    othersCount.value = '';
    couponsCount.value = '';
    ticketsCount.value = '';
    getCashDrawerButtonStatuses();
    getOpenCashDrawers();
    if(widget.fromPage == 'CASHDRAWER POPUP') {
      cashDrawerOpenOrNot.value = 'PClose';
      shiftKey.value = widget.shiftDTO![0].shiftKey!.toString();
      cashDrawerEnabled.value == 'true';
      shiftPosMachineName = widget.shiftDTO![0].posMachine!.toString();
      shiftIsShareable = widget.shiftDTO![0].isShareable!.toString();
      shiftUsername = widget.shiftDTO![0].shiftUserName!.toString();
      shiftTime = widget.shiftDTO![0].shiftTime!.toString();
      setValuesFromShiftDTO();
    }
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
  }

  setValuesFromShiftDTO() {
    shiftKey.value = widget.shiftDTO![0].shiftKey!.toString();
    shiftPosMachineName = widget.shiftDTO![0].posMachine!.toString();
    shiftIsShareable = widget.shiftDTO![0].isShareable!.toString();
    shiftUsername = widget.shiftDTO![0].shiftUserName!.toString();
    shiftTime = widget.shiftDTO![0].shiftTime!.toString();
    shiftAmount = widget.shiftDTO![0].shiftAmount!.toString();
    shiftCardCount = widget.shiftDTO![0].cardCount!.toString();
    shiftGameCardAmount = widget.shiftDTO![0].gameCardamount!.toString();
    shiftCreditCardAmount = widget.shiftDTO![0].creditCardamount!.toString();
    shiftOthersAmount = widget.shiftDTO![0].chequeAmount!.toString();
    shiftCouponsAmount = widget.shiftDTO![0].couponAmount!.toString();
    shiftTicketsAmount = widget.shiftDTO![0].shiftTicketNumber!.toString();
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);


      if(widget.fromPage == 'CASHDRAWER POPUP' && widget.shiftDTO != null){
          cashDrawerOpenOrNot.value = 'PClose';
          cashDrawerEnabled.value == 'true';
          setValuesFromShiftDTO();
      }


    _textInputDecoration = InputDecoration(
      fillColor: theme.primaryColor,
      filled: true,
      hintText: MessagesProvider.get("Enter"),
      hintStyle: theme.textFieldHintStyle!.copyWith(
          fontSize: SizeConfig.getFontSize(19)),
      contentPadding: EdgeInsets.only(
          top: SizeConfig.getSize(5),
          bottom: SizeConfig.getSize(5),
          right: SizeConfig.getSize(5),
          left: SizeConfig.getSize(10)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
          borderSide: BorderSide(
            width: SizeConfig.getSize(0.8),
            color: theme.dividerColor!,
          )),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
          borderSide: BorderSide(
            width: SizeConfig.getSize(0.8),
            color: theme.dividerColor!,
          )),
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        color: theme.transparentColor,
        child: Stack(
          children: [
            Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: theme.transparentColor,
                bottomNavigationBar: Container(
                  child: _notificationBar,
                ),
                body: Padding(
                  padding: EdgeInsets.all(SizeConfig.getSize(8.0)),
                  child: ValueListenableBuilder(
                      valueListenable: cardCount,
                      builder: (BuildContext contextPP, String newValue, Widget? child){
                        return ValueListenableBuilder(
                            valueListenable: cashCount,
                            builder: (BuildContext contextPP, String newValue, Widget? child){
                              return ValueListenableBuilder(
                                  valueListenable: cashDrawerOpenOrNot,
                                  builder: (BuildContext contextPP, String newValue, Widget? child){
                                    return ValueListenableBuilder(
                                        valueListenable: shiftLogId,
                                        builder: (BuildContext contextPP, String newValue, Widget? child){
                                          return ValueListenableBuilder(
                                              valueListenable: cashDrawerOpenOrNot,
                                              builder: (BuildContext contextPP, String newValue, Widget? child){
                                                return Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(SizeConfig.getWidth(0), SizeConfig.getHeight(0), SizeConfig.getWidth(0),
                                                          SizeConfig.getHeight(0)),
                                                      child: Container(
                                                        height: SizeConfig.getHeight(64),
                                                        decoration: BoxDecoration(
                                                            color: theme.cartItemCardBG,
                                                            borderRadius: BorderRadius.only(
                                                                topRight: Radius.circular(SizeConfig.getSize(8)),
                                                                topLeft: Radius.circular(SizeConfig.getSize(8)))),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                Navigator.pop(context);
                                                              },
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: theme.button2BG1,
                                                                    borderRadius: BorderRadius.only(
                                                                        bottomRight: Radius.circular(SizeConfig.getSize(8)),
                                                                        topLeft: Radius.circular(SizeConfig.getSize(8)))),
                                                                constraints: const BoxConstraints(
                                                                  minHeight: double.infinity,
                                                                  maxHeight: double.infinity,
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                  EdgeInsets.only(left: SizeConfig.getWidth(21.0), right: SizeConfig.getWidth(20)),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      Icon(
                                                                        Icons.arrow_back_ios,
                                                                        color: Colors.white,
                                                                        size: SizeConfig.getSize(30),
                                                                      ),
                                                                      SizedBox(
                                                                        width: SizeConfig.getWidth(10),
                                                                      ),
                                                                      Text(
                                                                        MessagesProvider.get("CASHDRAWER \nASSIGNMENT"),
                                                                        style: theme.headingLight4
                                                                            ?.copyWith(color: Colors.white, fontSize: SizeConfig.getFontSize(24)),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: SizeConfig.getWidth(8),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                constraints: const BoxConstraints(
                                                                  minHeight: double.infinity,
                                                                  maxHeight: double.infinity,
                                                                ),
                                                                decoration: BoxDecoration(
                                                                    color: theme.tableRow1,
                                                                    borderRadius: BorderRadius.only(
                                                                        topRight: Radius.circular(SizeConfig.getSize(8)),
                                                                        bottomLeft: Radius.circular(SizeConfig.getSize(8)))),
                                                                height: SizeConfig.getHeight(64),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  mainAxisSize: MainAxisSize.max,
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets.all(SizeConfig.getSize(7)),
                                                                      // padding: EdgeInsets.all(SizeConfig.getSize(3)),
                                                                      decoration: BoxDecoration(
                                                                          color: theme.cartItemCardBG,
                                                                          borderRadius: BorderRadius.all(
                                                                            Radius.circular(SizeConfig.getSize(4.0)),
                                                                          )),
                                                                      child: Column(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Text(
                                                                            MessagesProvider.get('Mode') ,
                                                                            style: theme.subtitle2?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(16)),
                                                                            textAlign: TextAlign.center,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsets.only(left: SizeConfig.getSize(7), right: SizeConfig.getSize(7)),
                                                                            child: Text(
                                                                              MessagesProvider.get('LOCAL') ,
                                                                              style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    cashDrawerOpenOrNot.value == '' ? Expanded(
                                                      child: Container(
                                                        color: Colors.white,
                                                        width: double.infinity,
                                                        child: Center(child: CircularProgressIndicator()),
                                                      ),
                                                    ) :
                                                    Expanded(
                                                      child: Container(
                                                        padding: EdgeInsets.only(
                                                          top: SizeConfig.getHeight(10),
                                                          right: SizeConfig.getWidth(5),
                                                        ),
                                                        color: theme.cartItemCardBG,
                                                        child: Row(
                                                          children: [
                                                            _showLeftView(),
                                                            _showRightView(),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: SizeConfig.getSize(1),
                                                      color: theme.dividerColor,
                                                      height: SizeConfig.getHeight(1),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(SizeConfig.getWidth(0), SizeConfig.getHeight(0), SizeConfig.getWidth(0),
                                                          SizeConfig.getHeight(0)),
                                                      child: Container(
                                                        height: SizeConfig.getHeight(55),
                                                        decoration: BoxDecoration(
                                                            color: theme.cartItemCardBG,
                                                            borderRadius: BorderRadius.only(
                                                                bottomRight: Radius.circular(SizeConfig.getSize(8)),
                                                                bottomLeft: Radius.circular(SizeConfig.getSize(8)))),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            cashDrawerOpenOrNot.value == 'CLOSED' ? Container(): cashDrawerOpenOrNot.value == 'PClose' ? Container() : ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                padding: EdgeInsets.all(SizeConfig.getWidth(10)),
                                                                tapTargetSize:
                                                                MaterialTapTargetSize.shrinkWrap,
                                                                maximumSize: Size(SizeConfig.getSize(300),SizeConfig.getSize(42)),
                                                                minimumSize:  Size(SizeConfig.getSize(100),SizeConfig.getSize(42)),
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(
                                                                      SizeConfig.getSize(8)), // <-- Radius
                                                                ),
                                                                backgroundColor:  theme.button2InnerShadow1,
                                                              ),
                                                              onPressed: () {
                                                                provisionalCloseShift();
                                                              },
                                                              child: Text(
                                                                'PROVISIONAL CLOSE',
                                                                maxLines: 2,
                                                                overflow: TextOverflow.ellipsis,
                                                                style:  theme.headingLight5!.copyWith(fontSize:SizeConfig.getFontSize(18),color: Colors.white),
                                                              ),
                                                            ),
                                                            cashDrawerOpenOrNot.value == 'CLOSED' ? Container() : const SizedBox(width: 20,),
                                                            cashDrawerOpenOrNot.value == 'CLOSED' ?  Container() : PrimaryMediumButton(
                                                              onPressed: () async{
                                                             //   getCashDrawerButtonStatusesAfterOpen();
                                                             //    print(cashDrawerStatusId.value);
                                                                if(cashCount.value == ''){
                                                                  _notificationBar!.showMessage(
                                                                      "Please enter closing balance",
                                                                      color.AppColors.notificationBGLightYellowColor);
                                                                }else{
                                                                  _notificationBar!.showMessage(
                                                                      "",
                                                                      Colors.white);
                                                                  print('un assign button press');
                                                                  bool isClosed = await  closeShift();
                                                                  if (isClosed) {
                                                                    final autoPrint = await checkAutoPrintShiftCloseReceipt();
                                                                    shiftId =  int.parse(shiftKey.value);
                                                                    if (autoPrint) {
                                                                      await getPosxReport(shiftId: shiftId);
                                                                    } else {
                                                                      await showGeneratePosXReportDialogue();
                                                                    }
                                                                  }
                                                                }
                                                               },
                                                              text: 'UNASSIGN',
                                                            ),
                                                            cashDrawerAssignedLoginId != 'null' ? const SizedBox(width: 20,) : Container(),
                                                            cashDrawerOpenOrNot.value == 'OPEN' ?  Container() : cashDrawerOpenOrNot.value == 'PClose' ? Container() : PrimaryMediumButton(
                                                              onPressed: () {
                                                                // print("cardCount.value : "+cardCount.value);
                                                                if(cashCount.value == ''){
                                                                  _notificationBar!.showMessage(
                                                                      "Please enter opening balance",
                                                                      color.AppColors.notificationBGLightYellowColor);
                                                                }else{
                                                                  _notificationBar!.showMessage(
                                                                      "",
                                                                      Colors.white);
                                                                  createNewShift();
                                                                }
                                                              },
                                                              text: MessagesProvider.get('ASSIGN'),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }
                                          );
                                        }
                                    );
                                  }
                              );
                            }
                        );
                      }
                  ),
                ))
          ],
        ),
      ),
    );
  }

  _showLeftView() {
    return ValueListenableBuilder(
        valueListenable: cashDrawerEnabled,
        builder: (BuildContext contextPP, String newValue, Widget? child){
          print(' cashDrawerOpenOrNot.value====${ cashDrawerOpenOrNot.value}');
          return Expanded(
      flex: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: IntrinsicWidth(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: SizeConfig.getHeight(
                              7.5)),
                          child: PrimaryButton(
                            onPressed: () {},
                            text: MessagesProvider.get('OPEN'),
                            isEnabled: cashDrawerOpenOrNot.value == 'CLOSED'
                                ? false : cashDrawerOpenOrNot.value == 'PClose' ?false
                                : true,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: SizeConfig.getHeight(
                              7.5)),
                          child: PrimaryButton(
                            onPressed: () {},
                            text: MessagesProvider.get('NOT OPEN'),
                            isEnabled: cashDrawerOpenOrNot.value == 'CLOSED'
                                ? true
                                : false,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: SizeConfig.getHeight(
                              7.5), right: SizeConfig.getHeight(7.5)),
                          child: PrimaryButton(
                            onPressed: () {},
                            text: MessagesProvider.get('PROVISIONAL CLOSE'),
                            isEnabled: cashDrawerOpenOrNot.value == 'PClose' ?  true :false,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.isBigDevice()
                ? SizeConfig.getHeight(73)
                : SizeConfig.getHeight(82),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: SizeConfig.getHeight(
                              7.5), top: SizeConfig.getHeight(7.5)),
                          child: DrawerDropDownView(
                            isUserManager: true,title: MessagesProvider.get("POS Counter"),
                            dropdownValues: const [
                              "Default",
                            ],
                                  //TODO Change the values here. Values used for UI testing purpose.
                            selectedValueCallback: (String value) {},
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: SizeConfig.getHeight(
                              7.5), top: SizeConfig.getHeight(7.5)),
                          child: DrawerDropDownView(isUserManager: true,
                            title: MessagesProvider.get("POS"),
                            dropdownValues: ["${execContext.posMachineName}"],
                            //TODO Change the values here. Values used for UI testing purpose
                            selectedValueCallback: (String value) {},
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(left: SizeConfig.getSize(7.5),
                          bottom: SizeConfig.getHeight(7.5),
                          right: SizeConfig.getSize(7.5)),
                      child: Container(
                        height: SizeConfig.isBigDevice() ? SizeConfig.getHeight(
                            42) : SizeConfig.getHeight(55),
                        width: SizeConfig.isBigDevice() ? SizeConfig.getHeight(
                            42) : SizeConfig.getHeight(55),
                        decoration:
                        BoxDecoration(color: theme.button1BG1!,
                            borderRadius: BorderRadius.circular(SizeConfig
                                .getSize(8))),
                        child: Icon(Icons.search, size: SizeConfig.getWidth(33),
                            color: theme.secondaryColor!),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.getHeight(7.5),
                            top: SizeConfig.getHeight(7.5)),
                        child: DrawerDropDownView(isUserManager: true,
                          title: MessagesProvider.get("User"),
                          dropdownValues: [
                            "${execContext.userId}"
                          ],
                                //TODO Change the values here. Values used for UI testing purpose.
                          selectedValueCallback: (String value) {},
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.getHeight(7.5),
                              top: SizeConfig.getHeight(7.5)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              cashDrawerOpenOrNot.value != 'OPEN'?Padding(
                                padding: EdgeInsets.only(
                                    bottom: SizeConfig.getSize(3)),
                                child: Text(
                                  MessagesProvider.get("Shareable"),
                                  style: theme.subtitle2?.copyWith(
                                      color: theme.secondaryColor,
                                      fontSize: SizeConfig.getFontSize(16)),
                                ),
                              ): SizedBox(),
                              cashDrawerOpenOrNot.value != 'OPEN'?InkWell(
                                  onTap: () {
                                  setState(() {
                                            isChecked = !isChecked;
                                          });
                                        },child: Container(
                                    height: SizeConfig.getSize(40),
                                    width: SizeConfig.getSize(40),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              SizeConfig.getSize(6))),
                                      border: Border.all(
                                          width: SizeConfig.getWidth(1),
                                          color: theme.secondaryColor!),
                                      color: theme.transparentColor,
                                    ),
                                    child: isChecked == true
                                            ? Image.asset(
                                          "assets/check.png",
                                          color: theme.secondaryColor,
                                          width: SizeConfig.getSize(40),
                                          height: SizeConfig.getSize(40),
                                        )
                                            : const SizedBox(),
                                      )) : SizedBox(),
                                    ],
                                  )
                            ),
                          )
                      ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(SizeConfig.getSize(7.5)),
                      child: SizedBox(
                        height: SizeConfig.getSize(58),
                        width: SizeConfig.getSize(58),
                      ),
                    ),
                  ],
                ),
                cashDrawerOpenOrNot.value == 'OPEN' || cashDrawerOpenOrNot.value == 'PClose' ?
            Expanded(
                  child: Container(
                    width: double.maxFinite,
                    margin:  EdgeInsets.all( SizeConfig.getSize(7.5)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(SizeConfig.getSize(5)),
                        border: Border.all(
                          width: SizeConfig.getSize(1),
                          color: theme.dividerColor!,
                        )
                    ),
                        child: Column(
                          children: [
                            SizedBox(height:SizeConfig.getSize(5)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("POS",style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(16),)),
                                Text("CashDrawer",style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(16),)),
                                Text("Shareable",style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(16),)),
                                Text("User",style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(16),)),
                                Text("Shift Time",style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(16),)),
                              ],
                            ),
                            SizedBox(height:SizeConfig.getSize(5)),
                            shiftPosMachineName == '' ? Container() :
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                //height: SizeConfig.getSize(50),
                                margin: EdgeInsets.only(left:SizeConfig.getSize(10) ),
                                decoration: BoxDecoration(
                                    color: theme.tableRow1,
                                    borderRadius: BorderRadius.circular(SizeConfig.getSize(5)),
                                    border: Border.all(
                                      width: SizeConfig.getSize(2),
                                      color: theme.dividerColor!,
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(shiftPosMachineName),
                                      const SizedBox(width: 20,),
                                      Text("SYSTEM-CDR"),
                                      const SizedBox(width: 20,),
                                      Container(
                                        height: SizeConfig.getSize(35),
                                        width: SizeConfig.getSize(35),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(SizeConfig.getSize(6))),
                                          border: Border.all(width: SizeConfig.getWidth(1), color: theme.secondaryColor!),
                                          color: Colors.white,
                                        ),
                                        child: shiftIsShareable == 'true'
                                            ? Image.asset(
                                          "assets/check.png",
                                          color: theme.secondaryColor,
                                          width: SizeConfig.getSize(40),
                                          height: SizeConfig.getSize(40),
                                        )
                                            : const SizedBox(),
                                      ),
                                      const SizedBox(width: 20,),
                                      Text(shiftUsername),
                                      const SizedBox(width: 20,),
                                      Text(shiftTime),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                ) : Expanded(
                  child: Container(
                    margin: EdgeInsets.all(SizeConfig.getSize(8)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(SizeConfig.getSize(5)),
                        border: Border.all(
                          width: SizeConfig.getSize(0.8),
                          color: theme.dividerColor!,
                        )),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.getHeight(7.5),
                            top: SizeConfig.getHeight(10),
                          ),
                          child: Builder(
                            builder: (context) {
                              if(cashDrawerOpenOrNot.value == 'PClose'){
                                cashDrawerEnabled.value == 'true';
                                return Container();
                              }else{
                                return InkWell(
                                  onTap: (){
                                    if(cashDrawerEnabled.value == 'false'){
                                      cashDrawerEnabled.value = 'true';
                                    }else{
                                      //cashDrawerEnabled.value = 'false';
                                    }
                                    print("cashDrawerEnabled.value : "+cashDrawerEnabled.value);
                                  },
                                  child: PrimaryButton(
                                    onPressed: () {
                                      if(cashDrawerEnabled.value == 'false'){
                                        cashDrawerEnabled.value = 'true';
                                      }else{
                                        //cashDrawerEnabled.value = 'false';
                                      }
                                      print("cashDrawerEnabled.value : "+cashDrawerEnabled.value);
                                    },
                                    text: cashDrawerName.value,
                                    isEnabled: cashDrawerEnabled.value == 'false' ? false : true,
                                  ),
                                );
                              }

                            }
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
    );
  }

  _showRightView() {
    print('cashDrawerEnabled==>${cashDrawerEnabled.value}');
    return ValueListenableBuilder(
        valueListenable: cashDrawerEnabled,
        builder: (BuildContext contextPP, String newValue, Widget? child){
          return Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const HeaderView(),
                Expanded(
                  child: Scroller(
                      controller: _scrollController,
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Container(
                          padding: EdgeInsets.only(
                              right: SizeConfig.isBigDevice() ? SizeConfig.getWidth(
                            33.0) : SizeConfig.getWidth(55.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              LinesView(
                                isSystemCDREnabled: cashDrawerEnabled.value == 'true' ? true : false,
                                type: '* Cash',
                                cashier: null,
                                system: shiftAmount == '' ? '0' : cashDrawerOpenOrNot.value == 'OPEN' || cashDrawerOpenOrNot.value == 'PClose' ? shiftAmount : null,
                                netShift: null,
                                buttonText: null,
                              ),
                              LinesView(
                                isSystemCDREnabled: cashDrawerEnabled.value == 'true' ? true : false,
                                type: '* Card Count',
                                cashier: null,
                                system: shiftCardCount == '' ? '0' : cashDrawerOpenOrNot.value == 'OPEN' || cashDrawerOpenOrNot.value == 'PClose'? shiftCardCount : null,
                                netShift: null,
                                buttonText: null,
                              ),
                              LinesView(
                                isSystemCDREnabled: false,
                                type: 'Game Card',
                                cashier: null,
                                system: shiftGameCardAmount == '' ? '0' : cashDrawerOpenOrNot.value == 'OPEN' || cashDrawerOpenOrNot.value == 'PClose'? shiftGameCardAmount : null,
                                netShift: null,
                                buttonText: null,
                              ),
                              LinesView(
                                isSystemCDREnabled: cashDrawerEnabled.value == 'true' ? true : false,
                                type: 'Credit Card',
                                cashier: null,
                                system: shiftCreditCardAmount == '' ? '0' : cashDrawerOpenOrNot.value == 'OPEN' || cashDrawerOpenOrNot.value == 'PClose'? shiftCreditCardAmount : null,
                                netShift: null,
                                buttonText: null,
                              ),
                              LinesView(
                                isSystemCDREnabled: cashDrawerEnabled.value == 'true' ? true : false,
                                type: 'Others',
                                cashier: null,
                                system: shiftOthersAmount == '' ? '0' : cashDrawerOpenOrNot.value == 'OPEN' || cashDrawerOpenOrNot.value == 'PClose'? shiftOthersAmount : null,
                                netShift: null,
                                buttonText: null,
                              ),
                              LinesView(
                                isSystemCDREnabled: cashDrawerEnabled.value == 'true' ? true : false,
                                type: 'Coupons',
                                cashier: null,
                                system: shiftCouponsAmount == '' ? '0' : cashDrawerOpenOrNot.value == 'OPEN' || cashDrawerOpenOrNot.value == 'PClose'? shiftCouponsAmount : null,
                                netShift: null,
                                buttonText: null,
                              ),
                              LinesView(
                                isSystemCDREnabled: cashDrawerEnabled.value == 'true' ? true : false,
                                type: 'Tickets',
                                cashier: null,
                                system: shiftTicketsAmount == '' ? '0' : cashDrawerOpenOrNot.value == 'OPEN'|| cashDrawerOpenOrNot.value == 'PClose' ? shiftTicketsAmount : null,
                                netShift: null,
                                buttonText: null,
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.getWidth(7),
                    left: SizeConfig.getWidth(5),
                    bottom: SizeConfig.getWidth(7)),
                      child: Text(
                        MessagesProvider.get("Remarks"),
                        style: theme.subtitle2?.copyWith(color: theme.secondaryColor,
                      fontSize: SizeConfig.getFontSize(21)),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                      height: SizeConfig.getSize(48),
                      margin: EdgeInsets.only(bottom: SizeConfig.getSize(8)),
                      child: TextFormField(
                          inputFormatters: [LengthLimitingTextInputFormatter(30)],
                          keyboardType: TextInputType.text,
                          controller: _remarksEditingController,
                          style: theme.subtitle2!.copyWith(
                        fontSize: SizeConfig.getFontSize(19)),
                          decoration: _textInputDecoration),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
    );
  }

  showGeneratePosXReportDialogue() {
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
                    Text(MessagesProvider.get("Posx receipt").toUpperCase(),
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
                        "Generate X-Report for End of the Shift",
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
                                AppColors.buttonBackgroundColor,
                            text: MessagesProvider.get("Cancel"),
                            textStyle: theme.heading5?.copyWith(
                                fontSize: SizeConfig.getFontSize(32),
                                fontWeight: FontWeight.w600) ??
                                tsS24W70016,
                            onTapped: () async {
                              Navigator.pop(context);
                              // close cashDrawer assignment popup
                              Navigator.pop(context);
                            }),
                        SizedBox(width: SizeConfig.getWidth(24)),
                        containerButton(
                            width: SizeConfig.getWidth(140),
                            height: SizeConfig.getHeight(65),
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
                              getPosxReport(shiftId: shiftId);
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

  Future<bool> checkAutoPrintShiftCloseReceipt() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    String? autoPrint = await masterDataBL.getDefaultValuesByName(
        defaultValueName: 'AUTO_PRINT_SHIFT_CLOSE_RECEIPT');
    if (autoPrint != null) {
      if (autoPrint == 'Y') {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  Future<void> getPosxReport({required int shiftId}) async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final shiftTrackingBL = await ShiftTrackDataBuilder.build(execContextDTO!);
    print('shiftId===>$shiftId');
    // try {
    //   loader.showLoaderDialog(
    //       context, 'Please wait generating Pos-X report...');
    //   final response = await shiftTrackingBL.getPosXReceipt(shiftID: shiftId);
    //   loader.hideLoaderDialog(context);
    //   if (response.data != null) {
    //     posxReceipt = response.data!;
    //     print('Success getPosxReport');
    //     checkAndPrintReport();
    //   }
    // } catch (e) {
    //   print('Faliure getPosxReport');
    //   loader.hideLoaderDialog(context);
      _notificationBar!.showMessage(
          'Unable to generating Pos-X report', Colors.red);
      //Wait for 3 sec and close the cash drawer popup
     await Future.delayed(const Duration(seconds: 3), () {});
     // Navigator.pop(context);
     // print('error in getPosxReport()=>${e.toString()}');
   // }
  }

  delay({int seconds = 2}){
    Timer(Duration(seconds: seconds), () {});
  }

  popScreen(){
    Navigator.pop(context);
  }

  Future<void> checkAndPrintReport() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBl = await MasterDataBuilder.build(execContext!);
    widget.printerStateModel.printerType =
    await masterDataBl.getDefaultValuesByName(defaultValueName: "PRINTER_TYPE");
    loader.showLoaderDialog(context, "Printing Pos-x receipt...");
    if (widget.printerStateModel.printerType == "SUNMI" &&
        widget.printerStateModel.deviceManufacturer == "SUNMI") {
      printingMethodChannel.setMethodCallHandler(nativeMethodHandler);
      printingMethodChannel.invokeMethod("printReceipt", {
        "type": "SUNMI",
        "receipt": posxReceipt,
        "receiptType": "POSREPORT",
        "isBitmap": true
      });
    } else if (widget.printerStateModel.printerType == "ZEBRA" &&
        widget.printerStateModel.isBluetoothSupported == true &&
        widget.printerStateModel.deviceManufacturer != "SUNMI") {
      printingMethodChannel.setMethodCallHandler(nativeMethodHandler);
      printingMethodChannel.invokeMethod("printReceipt", {
        "type": "ZEBRA",
        "receipt": posxReceipt,
        "receiptType": "POSREPORT",
        "isBitmap": true
      });
    }
  }
}
