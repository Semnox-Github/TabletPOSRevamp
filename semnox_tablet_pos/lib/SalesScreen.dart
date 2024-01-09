import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;
import 'package:intl/intl.dart';
import 'package:master_data/models/payment_modes_container/payment_mode_container_dto.dart';
import 'package:orders_ui/Screens/AllOrdersScreen.dart';
import 'package:orders_ui/Screens/TableSeatLoayoutScreen.dart' as TS;
import 'package:customer_data/builder.dart';
import 'package:customer_data/models/customer_data.dart';
import 'package:customer_ui/CustomerChangeAlert.dart';
import 'package:customer_ui/CustomerDetailHeader.dart';
import 'package:customer_ui/CustomerDetailsPage.dart';
import 'package:customer_ui/customer_idetification_via_card_dialog.dart';
import 'package:customer_ui/providers/SelectedCardDetailsProvider.dart';
import 'package:customer_ui/providers/SelectedCustomerProvider.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant/instant.dart';
import 'package:login_data/models/login_response.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:login_ui/manager_login_popup.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/master_data_bl.dart';
import 'package:master_data/models/configurations/configuration_response.dart';
import 'package:master_data/models/sites/site_response.dart';
import 'package:master_data/models/task_types_container/task_type_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:semnox_tablet_pos/widgets/go_back_confirmation_dialog.dart';
import 'package:semnox_tablet_pos/widgets/product_9999_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:payment_data/models/request/cash_payment/cash_payment_request.dart';
import 'package:transaction_data/models/transaction_receipt/transaction_print_receipt_response.dart';
import 'package:widgets_library/cubits/device_interface_cubit.dart';
import 'package:widgets_library/cubits/device_interface_state.dart';
import 'package:widgets_library/utils/time_zones.dart';
import 'package:payment_ui/cubits/payment_settlement/settle_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/cash_screen/cash_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/payment_screen_cubit.dart';
import 'package:payment_ui/screens/payment_settlement/payment_settlement_screen.dart';
import 'package:payment_ui/screens/payment_summary/payment_summary_screen.dart';
import 'package:payment_ui/screens/payment_summary/tender_screen.dart';
import 'package:product_config_ui/add_product_quantity_dialog.dart';
import 'package:product_config_ui/add_remark_dialog.dart';
import 'package:product_config_ui/cancel_line_alert_dialog.dart';
import 'package:product_config_ui/change_staff_dialog/change_staff_dialog.dart';
import 'package:product_config_ui/change_transaction_date/change_transaction_date_dialog.dart';
import 'package:product_config_ui/mandatory_remark_dialog.dart';
import 'package:product_config_ui/order_transaction_lines_dialog/order_transaction_lines_dialog.dart';
import 'package:product_config_ui/reverse_transaction_transaction_line/reversal_dialog.dart';
import 'package:product_config_ui/reverse_transaction_transaction_line/reversal_reason_data.dart';
import 'package:product_config_ui/reverse_transaction_transaction_line/reverse_obligations_dialog.dart';
import 'package:product_config_ui/search_transaction_line_dialog.dart';
import 'package:product_config_ui/transaction_discount_and_coupon_dialog/add_discount_dialog.dart';
import 'package:product_config_ui/transaction_line_course_dialog/set_course_dialogue.dart';
import 'package:product_config_ui/transaction_line_profile_dialog/transaction_line_profile_dialog.dart';
import 'package:product_config_ui/transaction_line_remark_dialog/add_remark_line_dialog.dart';
import 'package:product_config_ui/transaction_order_details_dialog/transaction_order_details_dialog.dart';
import 'package:product_config_ui/transaction_profile_dialog/transaction_profile_dialog.dart';
import 'package:product_config_ui/update_transaction_line_seat_dialog.dart';
import 'package:product_config_ui/verified_customer_only_dialog/verified_customer_only_dialog.dart';
import 'package:product_config_ui/vip_customer_mandatory/vip_card_identification_dialog.dart';
import 'package:product_config_ui/vip_customer_mandatory/vip_only_dialog.dart';
import 'package:product_menu_data/builder.dart';
import 'package:product_menu_data/models/product_menu_panel_content_container_dto.dart';
import 'package:product_menu_data/models/product_menu_response.dart';
import 'package:product_menu_data/models/product_price_container/modifier_set_container_dto.dart';
import 'package:product_menu_data/models/product_price_container/modifier_set_details_container_dto.dart';
import 'package:product_menu_data/models/product_price_container/product_modifier_container_dto.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';
import 'package:product_menu_data/product_menu_bl.dart';
import 'package:product_menu_ui/cross_sell_products/crosssell_dialog.dart';
import 'package:product_menu_ui/cross_sell_products/crosssell_product_model.dart';
import 'package:product_menu_ui/models/product_grid_item.dart';
import 'package:product_menu_ui/product_details_dialog.dart';
import 'package:product_menu_ui/product_menu_view.dart';
import 'package:product_menu_ui/upsell_products/upsell_dialog.dart';
import 'package:product_menu_ui/upsell_products/upsell_product_model.dart';
import 'package:product_modifiers_ui/models/modifier_customization_model.dart';
import 'package:product_modifiers_ui/models/modifier_dto.dart';
import 'package:product_modifiers_ui/modifier_set_dialog.dart';
import 'package:provider/provider.dart';
import 'package:semnox_tablet_pos/config/application.dart';
import 'package:semnox_tablet_pos/feature_not_implemented_view.dart';
import 'package:semnox_tablet_pos/bluetooth_printers/no_printers_dialog.dart';
import 'package:semnox_tablet_pos/view_logs_screen.dart';
import 'package:sprintf/sprintf.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_card_ui/card_functionality/card_functinality_dialog.dart';
import 'package:transaction_card_ui/card_functionality/cards_data_model.dart';
import 'package:transaction_data/builder.dart';
import 'package:transaction_data/models/create_transaction/transaction_data.dart';
import 'package:transaction_data/models/create_transaction/transaction_line_dto.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';
import 'package:transaction_data/models/request/add_modifier_product/add_modifier_product_request.dart';
// import 'package:transaction_data/models/transaction_functions/task_type_container_dto.dart';
import 'package:transaction_data/transaction_data_bl.dart';
import 'package:transaction_functions/context_menu/context_menu_view.dart';
import 'package:transaction_functions/cubit/transaction_functions_cubit.dart';
import 'package:transaction_functions/iconic_context_menu/help/iconic_context_menu_help_dialog.dart';
import 'package:transaction_functions/iconic_context_menu/iconic_context_menu_view.dart';
import 'package:transaction_functions/iconic_context_menu/theme_item.dart';
import 'package:transaction_functions/transaction_function_dto.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:transaction_ui/cubit/transaction_cubit_state.dart';
import 'package:transaction_ui/models/transaction_lines_group.dart';
import 'package:transaction_ui/transaction_header_view.dart';
import 'package:transaction_ui/transaction_lookup.dart';
import 'package:transaction_ui/transaction_summary_list_ctas.dart';
import 'package:transaction_ui/transaction_view.dart';
import 'package:widgets_library/generic_dialog.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'AppColors.dart';
import 'TransactionSummaryPage.dart';
import 'bluetooth_printers/bluetooth_printer_discovery_status_dialog.dart';
import 'bluetooth_printers/print_receipt_confirmation_dialog.dart';
import 'config/constants.dart';
import 'discard_changes_view.dart';

/*
    STP-50
    Sales screen design
 */
class SalesScreen extends StatefulWidget {
  String? transactionRetrieveData;
  TransactionData? transactionData;
  VoidCallback? onClose;
  bool fromTables;

  SalesScreen({super.key, this.transactionRetrieveData,this.onClose,this.fromTables = false}){
    if(transactionRetrieveData != null){
      transactionData = TransactionData.fromJson(jsonDecode(transactionRetrieveData!));
    }
  }

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> with WidgetsBindingObserver {
  TransactionLinesGroup? _selectedTransactionLinesGroup;
  late NotificationBar _notificationBar;
  late IconicContextMenuView _iconicContextMenuView;
  List<TaskTypeContainerDto> _taskTypeContainerList = [];
  final List<TaskTypeContainerDto> _transactionHeaderFunctions = [];
  final List<TaskTypeContainerDto> _transactionLineFunctions = [];

  List<TransactionFunctionDTO> transactionHeaderLightFunctions = [];
  List<TransactionFunctionDTO> transactionHeaderIconicLightFunctions = [];
  List<TransactionFunctionDTO> transactionLineLightFunctions = [];
  List<TransactionFunctionDTO> transactionLineIconicLightFunctions = [];

  List<TransactionFunctionDTO> transactionHeaderDarkFunctions = [];
  List<TransactionFunctionDTO> transactionHeaderIconicDarkFunctions = [];
  List<TransactionFunctionDTO> transactionLineDarkFunctions = [];
  List<TransactionFunctionDTO> transactionLineIconicDarkFunctions = [];

  late TransactionFunctionDTO? _searchIconFunction;
  TextEditingController nineItemDescription = TextEditingController();
  TextEditingController nineItemPrice = TextEditingController();
  TextEditingController nineItemRemarks = TextEditingController();
  List<TransactionLineDTO> _tobefulFillTransactionList = [];

  ProductMenuResponse? _productMenuResponse;
  late ExecutionContextDTO _execContextDTO;
  late ProductMenuDataBLContract _productMenuDataBL;
  late TransactionDataBLContract _transactionDataBl;
  late MasterDataBLContract _masterDataBl;
  Map<int, ProductContainerDTO>? _productListsMaps;
  Map<int, ModifierSetContainerDTO>? _modifierSetContainerMap;
  var productMenuNotifier = ValueNotifier<ProductMenuResponse?>(null);
  String _remarkValue = '';
  String currency = '';
  String amountFmt = '#,##0.00';
  TransactionCubit? transactionCubit;
  bool _isNFCAvailable = false;
  MasterDataBLContract? masterDataBLContract;
  bool isSeatBasedDetermined = false;
  bool shouldShowProductMenuOnRightSide = false;
  String shouldPrintTransactionReceipt = "";
  String _dateTimeFormat = "";
  String selectedPrinter = 'Bullzip PDF Printer-KOTPrinter';
  String msgAfterPrint = '';
  var searchForPrintersCount = 1;
  bool isCompleted = false;

  static const deviceMethodChannel = MethodChannel("semnox.tablet.pos/device");
  String barcodeReaderType = "";

  ///Variables related to Bluetooth Printer
  static const printingMethodChannel = MethodChannel("semnox.tablet.pos/printing");
  bool isPrinterConnected = false;

  ///Variable related to Barcode Scanning
  static const barcodeScannerMethodChannel = MethodChannel("semnox.tablet.pos/barcode_scanning");

  bool _isCurrentUserManager = true;
  bool _hasGoneToPaymentAfterComplete = false;
  int? _currentUserPkId = -1;
  String? _timeZoneName;
  SiteResponse? _sitesResponse;
  ScrollController popUpScroll = ScrollController();
  bool? isDarkTheme;
  // final sunmiBarcodeScanner = SunmiBarcodeScanner();
  late SharedPreferences preferences;
  PaymentModeContainerDTO? _defaultPaymentMode;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    popUpScroll = ScrollController();
    Future.microtask(() async {
      _getProductMenu();
      _getTransactionFunctions();
      await _checkCurrentUserPrivileges();
      await _shouldShowProductMenuOnRightSide();
      await _shouldPrintTransactionReceipt();
      _isNFCAvailable = await NFCManager().isNfcAvailable();
      preferences = await SharedPreferences.getInstance();
      _getDateTimeFormat();
      _getDefaultPayMode();
      _getSites();
    });

    _hideStatusBar();
    // _clearErrorTransactionString();
    // _resetTransactionLoadingStatus();

    TransactionCubit transactionCubit = context.read<TransactionCubit>();
    _notificationBar = NotificationBar(showHideSideBar: false);

    if (widget.transactionData != null) {
      Future.microtask(() async {
        await _isSeatBased().then((value) => transactionCubit.saveToTransactionResponse(widget.transactionData));
      });
    } else {
      ///
      /// Showing notification "Click on New button to proceed" message as we navigate to the Sales screen
      /// when no transaction has been initiated.
      ///
      Future.microtask(() async {
        await _isSeatBased().then((value) {
          if(transactionCubit.state.transactionData != null) {
            transactionCubit.saveToTransactionResponse(transactionCubit.state.transactionData);
          }
        });
        if (transactionCubit.state.transactionData == null) {
          _notificationBar.showMessage(
              MessagesProvider.get("Click on NEW button to proceed."),
              AppColors.notificationBGLightBlueColor);
        }
      });
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      //Commenting as the bluetooth printer isn't supported in iOS devices.
      // Platform.isIOS ? iosBluetoothStateMethodChannel.setMethodCallHandler(nativeMethodHandler) : null;

      if(Platform.isAndroid) {
        if(Application.deviceManufacturer == null) {
          deviceMethodChannel.setMethodCallHandler(nativeMethodHandler);
          deviceMethodChannel.invokeMethod("getDeviceManufacturer");
        } else {
          _registerBarcodeBroadcast(Application.deviceManufacturer);
        }
      }

    });
  }

  void clearCompletedTransactionFromCubit() {
    if(isCompleted) {
      context.read<TransactionCubit>().clearTransactionData();
      context.read<TransactionCubit>().setIsBluetoothConnectionSession(false);
      context.read<TransactionCubit>().clearPrintReceiptData();
      isCompleted = false;
    }
  }

  Future<dynamic> nativeMethodHandler(MethodCall methodCall) async {
    switch(methodCall.method) {
      case "DEVICE MANUFACTURER":
        {
          Application.deviceManufacturer = methodCall.arguments;
          _registerBarcodeBroadcast(methodCall.arguments);
        }
        break;
      case "SUNMI BARCODE SUCCESS":
        {
          var barcode = methodCall.arguments;
          onBarcodeReaderDataReceived(methodCall.arguments);
          print('Sunmi Received bar code : $barcode');
        }
        break;
      case "SUNMI BARCODE FAILED":
        {
          var error = methodCall.arguments;
          _notificationBar.showMessage(
              MessagesProvider.get("Barcode Reading failed - $error"),
              semnoxTheme.footerBG5!);
          print('Sunmi Received error code : $error');
        }
        break;
      case "PDA BARCODE SUCCESS":
        {
          onBarcodeReaderDataReceived(methodCall.arguments);
        }
        break;
      case "PDA PRINTING SUCCESS" :
        {
          loader.hideLoaderDialog(context);
          Future.microtask(() {
            if(loader.isOpen) {
              loader.hideLoaderDialog(context);
            }
            if(msgAfterPrint == 'Completed transaction successfully.') {
              clearCompletedTransactionFromCubit();
            } else {
              context.read<TransactionCubit>().clearPrintReceiptData();
            }
            if(TS.isTablesScreenOpened.value.toString() == 'YES'){
              Navigator.of(context).pop();
            }
            isCompleted = false;
          });
          _notificationBar.showMessage(
              MessagesProvider.get("Transaction Receipt has been printed out."), AppColors.notificationBGLightBlueColor);
        }
        break;
      case "PRINTER FOUND" :
        {
          if(preferences.getString(connectedPrinterMacAddress) != null) {
              if(preferences.getString(connectedPrinterMacAddress) == methodCall.arguments.toString()) {
                if(loader.isOpen) {
                  loader.hideLoaderDialog(context);
                }
                loader.showLoaderDialog(context, MessagesProvider.get('Connecting to the Bluetooth Printer...'));

              await  printingMethodChannel.invokeMethod(
                    "connectToBluetoothPrinter",
                    {"printerAddress": methodCall.arguments.toString(),
                      "type": "ZEBRA",
                      "receipt": context
                          .read<TransactionCubit>()
                          .state
                          .transactionPrintReceipt
                          ?.data![0].data,
                      "receiptType": "TRANSACTION",
                      "isBitmap": true});
              }
              else {
                if (loader.isOpen) {
                  loader.hideLoaderDialog(context);
                }
                showGeneralDialog(
                    context: context,
                    barrierDismissible: true,
                    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                    barrierColor: Colors.black45,
                    transitionDuration: const Duration(milliseconds: 200),
                    pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
                      return NoPrintersDialog(
                          onRescanTapped: () async {
                            Future.microtask(() {
                              loader.showLoaderDialog(context, MessagesProvider.get("Re-Scanning for available Printers..."));
                            });
                            printingMethodChannel.setMethodCallHandler(nativeMethodHandler);
                            await  printingMethodChannel.invokeMethod(
                                "connectToBluetoothPrinter",
                                {"printerAddress": methodCall.arguments.toString(),
                                  "type": "ZEBRA",
                                  "receipt": context
                                      .read<TransactionCubit>()
                                      .state
                                      .transactionPrintReceipt
                                      ?.data![0].data,
                                  "receiptType": "TRANSACTION",
                                  "isBitmap": true});
                          },
                          onCancelTapped: () {
                            Future.microtask(() => context.read<TransactionCubit>().clearTransactionData(isTransactionReceiptPrintError: true)).then((value) {
                              if(TS.isTablesScreenOpened.value.toString() == 'YES'){
                                Navigator.of(context).pop();
                              }
                            });
                          },
                          content : "No Bluetooth Printers were found"
                      );
                    });
              }
          } else {
            if (loader.isOpen) {
              loader.hideLoaderDialog(context);
            }
            _notificationBar.showMessage(
                  MessagesProvider.get("No Active Bluetooth Printers Found.."),
                  semnoxTheme.footerBG5!);
          }

        }
        break;
      case "BLUETOOTH NOT SUPPORTED" :
        {

        }
        break;
      case "BLUETOOTH PERMISSION DENIED" :
        {
          if(loader.isOpen) {
            loader.hideLoaderDialog(context);
          }
          Future.microtask(() {
            if(loader.isOpen) {
              loader.hideLoaderDialog(context);
            }
            if(msgAfterPrint == 'Completed transaction successfully.') {
              clearCompletedTransactionFromCubit();
            } else {
              context.read<TransactionCubit>().clearPrintReceiptData();
            }
          });
          _notificationBar.showMessage(
              MessagesProvider.get(""
                  "Unable to print the transaction receipt as the bluetooth permission is denied. $msgAfterPrint"), AppColors.notificationBGLightBlueColor);
        }
        break;
      case "BLUETOOTH TURNED OFF" :
        {
          if(loader.isOpen) {
            loader.hideLoaderDialog(context);
          }
          Future.microtask(() {
            if(loader.isOpen) {
              loader.hideLoaderDialog(context);
            }
            if(msgAfterPrint == 'Completed transaction successfully.') {
              clearCompletedTransactionFromCubit();
            } else {
              context.read<TransactionCubit>().clearPrintReceiptData();
            }
          });
          _notificationBar.showMessage(
              MessagesProvider.get(""
                  "Unable to print the transaction receipt as the bluetooth is turned off. $msgAfterPrint"), AppColors.notificationBGLightBlueColor);
        }
        break;
      case "LOCATION TURNED OFF" :
        {
          if(loader.isOpen) {
            loader.hideLoaderDialog(context);
          }
          Future.microtask(() {
            if(loader.isOpen) {
              loader.hideLoaderDialog(context);
            }
            if(msgAfterPrint == 'Completed transaction successfully.') {
              clearCompletedTransactionFromCubit();
            } else {
              context.read<TransactionCubit>().clearPrintReceiptData();
            }
          });
          _notificationBar.showMessage(
              MessagesProvider.get(""
                  "Unable to print the transaction receipt as the location is turned off. $msgAfterPrint"), AppColors.notificationBGLightBlueColor);
        }
        break;
      case "ERROR" :
        {
          if(loader.isOpen) {
            loader.hideLoaderDialog(context);
          }
          printingMethodChannel.invokeMethod('disconnect');
          Future.delayed(const Duration(milliseconds: 300), () {
            showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel: MaterialLocalizations
                    .of(context)
                    .modalBarrierDismissLabel,
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
                          "receipt": context
                              .read<TransactionCubit>()
                              .state
                              .transactionPrintReceipt
                              ?.data![0].data,
                          "receiptType": "TRANSACTION",
                          "isBitmap": true
                        });
                      },
                      onCancelTapped: () {
                        Future.microtask(() {
                          if(msgAfterPrint == 'Completed transaction successfully.') {
                            clearCompletedTransactionFromCubit();
                          } else {
                            context.read<TransactionCubit>().clearPrintReceiptData();
                          }
                          if(TS.isTablesScreenOpened.value.toString() == 'YES'){
                            Navigator.of(context).pop();
                          }
                        });
                      },
                      content: methodCall.arguments.toString()
                  );
                });
          });
        }
        break;
      case "BLUETOOTH PRINTER CONNECT FAILED" :
        {
          loader.hideLoaderDialog(context);
          Future.microtask(() {
            loader.hideLoaderDialog(context);
            if(msgAfterPrint == 'Completed transaction successfully.') {
              clearCompletedTransactionFromCubit();
            } else {
              context.read<TransactionCubit>().clearPrintReceiptData();
            }
          });
          _notificationBar.showMessage(
              MessagesProvider.get(""
                  "Unable to connect to the printer. $msgAfterPrint"), AppColors.notificationBGLightBlueColor);
        }
        break;
      case "NO BLUETOOTH PRINTERS FOUND" :
        {
          if(loader.isOpen) {
            loader.hideLoaderDialog(context);
          }
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
                      "receipt": context.read<TransactionCubit>().state.transactionPrintReceipt?.data![0].data,
                      "receiptType": "TRANSACTION",
                      "isBitmap": true
                    });
                  },
                  onCancelTapped: () {
                    Future.microtask(() {
                      if(msgAfterPrint == 'Completed transaction successfully.') {
                        clearCompletedTransactionFromCubit();
                      } else {
                        context.read<TransactionCubit>().clearPrintReceiptData();
                      }
                      if(TS.isTablesScreenOpened.value.toString() == 'YES'){
                        Navigator.of(context).pop();
                      }
                    });
                  },
                  content : "No Bluetooth Printers were found"
                );
              });
        }
        break;
      case "LOCATION PERMISSION DENIED" :
        {
          loader.hideLoaderDialog(context);
          Future.microtask(() {
            loader.hideLoaderDialog(context);
            if(msgAfterPrint == 'Completed transaction successfully.') {
              clearCompletedTransactionFromCubit();
            } else {
              context.read<TransactionCubit>().clearPrintReceiptData();
            }
          });
          _notificationBar.showMessage(
              MessagesProvider.get(""
                  "Unable to print the transaction receipt as the location permission is denied. $msgAfterPrint"), AppColors.notificationBGLightBlueColor);
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
                        Future.microtask(() {
                          loader.hideLoaderDialog(context);
                          if(msgAfterPrint == 'Completed transaction successfully.') {
                            clearCompletedTransactionFromCubit();
                          } else {
                            context.read<TransactionCubit>().clearPrintReceiptData();
                          }
                        });
                        _notificationBar.showMessage(
                            MessagesProvider.get(msgAfterPrint), AppColors.notificationBGLightBlueColor);
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
                        Future.microtask(() {
                          loader.hideLoaderDialog(context);
                          if(msgAfterPrint == 'Completed transaction successfully.') {
                            clearCompletedTransactionFromCubit();
                          } else {
                            context.read<TransactionCubit>().clearPrintReceiptData();
                          }
                        });
                        _notificationBar.showMessage(
                            MessagesProvider.get(msgAfterPrint), AppColors.notificationBGLightBlueColor);
                      },
                      content: methodCall.arguments.toString());
                });
          });
        }
        break;
      case "SUNMI PRINTING SUCCESS" :
        {
          Future.microtask(() {
            loader.hideLoaderDialog(context);
            if(msgAfterPrint == 'Completed transaction successfully.') {
              clearCompletedTransactionFromCubit();
            } else {
              context.read<TransactionCubit>().clearPrintReceiptData();
            }
          });
          _notificationBar.showMessage(
              MessagesProvider.get("Transaction Receipt has been printed out."), AppColors.notificationBGLightBlueColor);
          if(TS.isTablesScreenOpened.value.toString() == 'YES'){
            Navigator.of(context).pop();
          }
        }
        break;
    }
  }

  Future<dynamic> nativeMethodHandlerForPayment(MethodCall methodCall) async {
    switch(methodCall.method) {
      case "DEVICE MANUFACTURER":
        {
          //log here
          Log.v("PAYPRINT: DEVICE MANUFACTURER");
          Application.deviceManufacturer = methodCall.arguments;
          _registerBarcodeBroadcast(methodCall.arguments);
        }
        break;
      case "SUNMI BARCODE SUCCESS":
        {
          Log.v("PAYPRINT: SUNMI BARCODE SUCCESS");
          var barcode = methodCall.arguments;
          onBarcodeReaderDataReceived(methodCall.arguments);
          print('Sunmi Received bar code : $barcode');
        }
        break;
      case "SUNMI BARCODE FAILED":
        {
          Log.v("PAYPRINT: SUNMI BARCODE FAILED");
          var error = methodCall.arguments;
          _notificationBar.showMessage(
              MessagesProvider.get("Barcode Reading failed - $error"),
              semnoxTheme.footerBG5!);
          print('Sunmi Received error code : $error');
        }
        break;
      case "PDA BARCODE SUCCESS":
        {
          onBarcodeReaderDataReceived(methodCall.arguments);
        }
        break;
      case "PDA PRINTING SUCCESS" :
        {
          Log.v("PAYPRINT: PDA PRINTING SUCCESS");
          context.read<DeviceInterfaceCubit>().setPrinterContent("");
          context.read<DeviceInterfaceCubit>().setPrintOngoingStatus(false);
       /*   _notificationBar.showMessage(
              MessagesProvider.get("Transaction Receipt has been printed out."), AppColors.notificationBGLightBlueColor);
       */ }
        break;
      case "PRINTER FOUND" :
        {
          Log.v("PAYPRINT: PRINTER FOUND");
          var isPrinterMatchFound = false;
          Application.activePrinters?.forEach((printerData) {
            if(!isPrinterMatchFound) {
              if (methodCall.arguments.toString() == printerData.ipAddress ) {
                isPrinterMatchFound = true;
                ///Connect to the Bluetooth Printer
               // loader.hideLoaderDialog(context);
                //loader.showLoaderDialog(context, MessagesProvider.get('Connecting to the Bluetooth Printer...'));
                printingMethodChannel.invokeMethod(
                    "connectToBluetoothPrinter",
                    {"printerAddress": methodCall.arguments.toString(),
                      "type": "ZEBRA",
                      "receipt": context.read<DeviceInterfaceCubit>().state.printContent,
                      "receiptType": "TRANSACTION",
                      "isBitmap": false});
              }
            }
          });

          if(!isPrinterMatchFound) {
            //loader.hideLoaderDialog(context);
        /*    _notificationBar.showMessage(
                MessagesProvider.get("No Active Bluetooth Printers Found.."),
                semnoxTheme.footerBG5!);*/
          }
        }
        break;
      case "BLUETOOTH NOT SUPPORTED" :
        {
          Log.v("PAYPRINT: BLUETOOTH NOT SUPPORTED");
        }
        break;
      case "BLUETOOTH PERMISSION DENIED" :
        {
          Log.v("PAYPRINT: BLUETOOTH PERMISSION DENIED");
         // loader.hideLoaderDialog(context);
          /*
          _notificationBar.showMessage(
              MessagesProvider.get(""
                  "Unable to print the transaction receipt as the bluetooth permission is denied. Completed transaction successfully."), AppColors.notificationBGLightBlueColor);
    */    }
        break;
      case "BLUETOOTH TURNED OFF" :
        {
          Log.v("PAYPRINT: BLUETOOTH TURNED OFF");
       /*   _notificationBar.showMessage(
              MessagesProvider.get(""
                  "Unable to print the transaction receipt as the bluetooth is turned off. Completed transaction successfully."), AppColors.notificationBGLightBlueColor);
     */   }
        break;
      case "LOCATION TURNED OFF" :
        {
          Log.v("PAYPRINT: LOCATION TURNED OFF");
        /*  _notificationBar.showMessage(
              MessagesProvider.get(""
                  "Unable to print the transaction receipt as the location is turned off. Completed transaction successfully."), AppColors.notificationBGLightBlueColor);
    */    }
        break;
      case "ERROR" :
        {
          Log.v("PAYPRINT: BLUETOOTH PRINTER CONNECT FAILED");
          context.read<DeviceInterfaceCubit>().setPrinterContent("");
          context.read<DeviceInterfaceCubit>().setPrintOngoingStatus(false);
         // loader.hideLoaderDialog(context);
          final execContextBL = await ExecutionContextBuilder.build();
          final execContextDTO = execContextBL.getExecutionContext();
          final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
          var isMerchantCopy = (await masterDataBL.getDefaultValuesByName(defaultValueName: 'PRINT_MERCHANT_RECEIPT'));
          var isCustomerCopy = (await masterDataBL.getDefaultValuesByName(defaultValueName: 'PRINT_CUSTOMER_RECEIPT'));
          if(isMerchantCopy == 'Y' || isCustomerCopy == 'Y') {
            Future.delayed(const Duration(milliseconds: 300), () {
              showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations
                      .of(context)
                      .modalBarrierDismissLabel,
                  barrierColor: Colors.black45,
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (BuildContext buildContext, Animation animation,
                      Animation secondaryAnimation) {
                    return BluetoothPrinterDiscoveryStatusDialog(
                        onOkTapped: () {
                          /*Future.microtask(() {
                          loader.hideLoaderDialog(context);
                        });*/
                        },
                        content: methodCall.arguments.toString());
                  });
            });
          }
        }
        break;
      case "BLUETOOTH PRINTER CONNECT FAILED" :
        {
          Log.v("PAYPRINT: BLUETOOTH PRINTER CONNECT FAILED");
          context.read<DeviceInterfaceCubit>().setPrinterContent("");
          context.read<DeviceInterfaceCubit>().setPrintOngoingStatus(false);
       /*   _notificationBar.showMessage(
              MessagesProvider.get(""
                  "Unable to connect to the printer. Completed transaction successfully."), AppColors.notificationBGLightBlueColor);
     */   }
        break;
      case "PAYPRINT: NO BLUETOOTH PRINTERS FOUND" :
        {
          Log.v("PAYPRINT : NO BLUETOOTH PRINTERS FOUND");
          context.read<DeviceInterfaceCubit>().setPrinterContent("");
          context.read<DeviceInterfaceCubit>().setPrintOngoingStatus(false);
          //loader.hideLoaderDialog(context);
         /* showGeneralDialog(
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
                      "receipt": context.read<TransactionCubit>().state.transactionPrintReceipt?.data![0].data,
                      "receiptType": "TRANSACTION",
                      "isBitmap": true
                    });
                  },
                  onCancelTapped: () {
                    //Future.microtask(() => context.read<TransactionCubit>().clearTransactionData(isTransactionReceiptPrintError: true));
                  },
                );
              });*/
        }
        break;
      case "LOCATION PERMISSION DENIED" :
        {
          Log.v("PAYPRINT:  LOCATION PERMISSION DENIED");
        /*  _notificationBar.showMessage(
              MessagesProvider.get(""
                  "Unable to print the transaction receipt as the location permission is denied. Completed transaction successfully."), AppColors.notificationBGLightBlueColor);
  */      }
        break;
      case "SUNMI PRINTER FAILED":
        {
          Log.v("PAYPRINT: SUNMI PRINTER FAILED");
          context.read<DeviceInterfaceCubit>().setPrinterContent("");
          context.read<DeviceInterfaceCubit>().setPrintOngoingStatus(false);
         // loader.hideLoaderDialog(context);
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
                    /*    _notificationBar.showMessage(
                            MessagesProvider.get("Completed transaction successfully."), AppColors.notificationBGLightBlueColor);
                   */   },
                      content: methodCall.arguments.toString());
                });
          });
        }
        break;
      case "SUNMI BLUETOOTH FAILED":
        {
          Log.v("PAYPRINT: SUNMI BLUETOOTH FAILED");
          context.read<DeviceInterfaceCubit>().setPrinterContent("");
          context.read<DeviceInterfaceCubit>().setPrintOngoingStatus(false);
         // loader.hideLoaderDialog(context);
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
                    /*    _notificationBar.showMessage(
                            MessagesProvider.get("Completed transaction successfully."), AppColors.notificationBGLightBlueColor);
                  */    },
                      content: methodCall.arguments.toString());
                });
          });
        }
        break;
      case "SUNMI PRINTING SUCCESS" :
        {
          Log.v("PAYPRINT: SUNMI PRINTING SUCCESS");
          context.read<DeviceInterfaceCubit>().setPrinterContent("");
          context.read<DeviceInterfaceCubit>().setPrintOngoingStatus(false);
          /*  _notificationBar.showMessage(
              MessagesProvider.get("Transaction Receipt has been printed out."), AppColors.notificationBGLightBlueColor);
    */    }
        break;
    }
  }

  onBarcodeReaderDataReceived(String data) async {
    TransactionCubit transactionCubit = context.read<TransactionCubit>();
    final isPaymentScannerEnabled =   context.read<DeviceInterfaceCubit>().state.isPaymentScannerEnabled;
    if(transactionCubit.state.isInProductSearchMode == true || transactionCubit.state.isCardFunctionalityDialogShown == true
    || transactionCubit.state.isCustomerIDDialogShown == true || isPaymentScannerEnabled) {
      transactionCubit.setBarcodeReadData(data);
      context.read<DeviceInterfaceCubit>().setBarCodeResult(data);
    } else {
      _notificationBar.showMessage(
          MessagesProvider.get("Product Read : $data"),
          AppColors.notificationBGLightBlueColor);
      ProductContainerDTO? productContainer = await _productMenuDataBL.getProductContainerDetailsByBarcode(data);
      if(productContainer != null) {
        if(transactionCubit.state.transactionData != null) {
          if(isProductAdditionAllowed()) {
            _onProductSelected(productContainer.productId, 1, "NORMAL");
          }
        } else {
          _onNewTransactionSelected(
              productId: productContainer.productId,
              quantity: 1,
              event: "NORMAL"
          );
        }
      } else {
        _notificationBar.showMessage(
            MessagesProvider.get("Unable to find the product with barcode $data"),
            AppColors.notoficationBGLightYellowColor);
      }
    }
  }

  _registerBarcodeBroadcast(String? deviceManufacturer) async {
    /**
     * Registering the barcode scanner broadcast receiver
     */
    Log.printMethodStart(" RegisterBarcodeReaderBroadcast()",'Sales Screen','Init');
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    Application.printerType ??= await masterDataBL.getDefaultValuesByName(defaultValueName: "PRINTER_TYPE");
    Log.printApiLog('PRINTER_TYPE : ${Application.printerType}');
    barcodeReaderType = (await masterDataBL.getDefaultValuesByName(defaultValueName: "BARCODE_READER_TYPE")) ?? '';
    Log.printApiLog('BARCODE_READER_TYPE : $barcodeReaderType');
    barcodeScannerMethodChannel.setMethodCallHandler(nativeMethodHandler);
    if (barcodeReaderType == deviceManufacturer || barcodeReaderType == "PDA" && deviceManufacturer == "CILICO") {
      barcodeScannerMethodChannel.invokeMethod("registerBarcodeReaderBroadcast", {"type": barcodeReaderType});
      Log.printMethodEnd(" RegisterBarcodeReaderBroadcast()",'Sales Screen','Init');
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    if(widget.onClose != null){
      widget.onClose!();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    final TransactionCubit transactionCubit = context.read<TransactionCubit>();

    if(isDarkTheme == null) {
      isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    } else if(isDarkTheme != (Theme.of(context).brightness == Brightness.dark)) {
      isDarkTheme = (Theme.of(context).brightness == Brightness.dark);
      _loadTransactionFunctionItems(isForTransactionHeaderFunctions:  _selectedTransactionLinesGroup == null);
    }

    ///
    /// Mapping the customer to the Transaction, if the transaction is initiated.
    ///
    if (context.read<SelectedCustomer>().selectedData != null &&
        transactionCubit.state.transactionData != null) {
      if (transactionCubit.state.transactionData?.customerId !=
          (context.read<SelectedCustomer>().selectedData?.id)!) {
        final status = transactionCubit.state.transactionData?.transactionStatus;
        if(status == 'ABANDONED' || status == 'REOPENED' || status == 'PENDING_CLOSE' || status == 'CLOSED'
            || status == 'CANCELLED' || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
          _notificationBar.showMessage(
              MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "SET CUSTOMER"]),
              AppColors.notoficationBGLightYellowColor);
        } else {
          transactionCubit.linkCustomerToTransaction(
              (context.read<SelectedCustomer>().selectedData?.id)!);
        }
      }
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            color: theme.backGroundColor,
            child: Column(
              children: [
                Container(
                  color: theme.backGroundColor,
                  height: SizeConfig.getHeight(64),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          _goBack(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(SizeConfig.getSize(10))),
                            color: theme.sideNavBackground,
                          ),
                          constraints: const BoxConstraints(
                            minHeight: double.infinity,
                            maxHeight: double.infinity,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: SizeConfig.getWidth(21.0), right: SizeConfig.getWidth(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: SizeConfig.getSize(30),
                                ),
                                SizedBox(width: SizeConfig.getWidth(10),),
                                Text(MessagesProvider.get("SALES"),
                                    style: theme.headingLight4?.copyWith(color: theme.light1, fontSize: SizeConfig.getFontSize(24))),
                                SizedBox(width: SizeConfig.getWidth(30),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: SizeConfig.getWidth(15),),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: theme.tableRow1,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(SizeConfig.getSize(10)),
                                  bottomLeft: Radius.circular(SizeConfig.getSize(10)))),
                          child: Consumer2<SelectedCustomer, SelectedCardDetails>(
                            builder: (ctx, customerProvider, cardProvider, _) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Visibility(
                                    visible: (context.read<SelectedCustomer>().selectedData == null &&
                                        context.read<SelectedCardDetails>().selectedData == null)
                                        ? true
                                        : false,
                                    child: Container(
                                      margin: EdgeInsets.all(SizeConfig.getSize(4)),
                                      padding: EdgeInsets.all(SizeConfig.getSize(3)),
                                      decoration: BoxDecoration(
                                          color: theme.cartItemCardBG,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(SizeConfig.getSize(4.0)),
                                          )),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: SizeConfig.getHeight(64),
                                            margin: EdgeInsets.all(SizeConfig.getSize(5)),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(SizeConfig.getSize(4))),
                                                color: theme.cartItemCardBG,
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  color: theme.button2BG1 ?? Colors.black,
                                                  width: SizeConfig.getWidth(1),
                                                )),
                                            child: InkWell(
                                              onTap: () {
                                                context.read<TransactionCubit>().setCustomerIDDialogStatus(true);
                                                showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: (context) {
                                                    return CustomerIdentificationViaCardDialog(
                                                      onLoginViaCardSuccess: () {},
                                                      notificationBar: _notificationBar,
                                                      isNFCAvailable: _isNFCAvailable,
                                                    );
                                                  },
                                                );
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(left: SizeConfig.getWidth(20.0), right: SizeConfig.getWidth(20.0)),
                                                child: Center(
                                                  child: Text(
                                                    _isNFCAvailable ? 'Tap card or Enter card no' : 'Tap here to enter card no',
                                                    style: theme.textFieldHintStyle?.copyWith(fontSize: SizeConfig.getFontSize(14)),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: (context) {
                                                    return CustomerChangeAlert(
                                                      onValidationError: (msg) {
                                                        _notificationBar.showMessage(msg ?? '', AppColors.notoficationBGLightYellowColor);
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(SizeConfig.getSize(2)),
                                                margin: EdgeInsets.only(
                                                  left: SizeConfig.getWidth(2),
                                                  right: SizeConfig.getWidth(2),
                                                ),
                                                child: Center(
                                                  child: Image.asset(
                                                    'assets/ic_customer_profile.png',
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                      visible: context.read<SelectedCustomer>().selectedData != null
                                          ? true
                                          : context.read<SelectedCardDetails>().selectedData != null
                                          ? true
                                          : false,
                                      child: Center(child: CustomerDetailHeader()))
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Row(
                    children: [
                      shouldShowProductMenuOnRightSide
                          ? _showTransactionView(theme)
                          : _showProductMenuView(theme),
                      shouldShowProductMenuOnRightSide
                          ? _showProductMenuView(theme)
                          : _showTransactionView(theme),
                    ],
                  )
                ),
                Container(
                  color: Colors.green,
                  child: _notificationBar,
                ),
                BlocBuilder<TransactionCubit, TransactionCubitState>(
                    builder: (context, transactionState) {
                  if (transactionState.transactionUpdateStatusEnum == TransactionUpdateStatusEnum.loading) {
                    Future.microtask(() => loader.showLoaderDialog(context));
                  } else if (transactionState.transactionUpdateStatusEnum == TransactionUpdateStatusEnum.success) {
                    Future.microtask(() {
                      _notificationBar.showMessage(
                          MessagesProvider.get("Transaction Cleared"),
                          AppColors.notificationBGLightBlueColor);
                      _clearErrorTransactionString(); // clearing error state
                      loader.hideLoaderDialog(context);
                      _resetTransactionLoadingStatus(); // making the enum status init
                    });
                  } else if (transactionState.transactionUpdateStatusEnum == TransactionUpdateStatusEnum.error) {
                    Future.microtask(() {
                      _notificationBar.showMessage(
                          transactionState.transactionErrorString,
                          AppColors.notificationBGRedColor);
                      _clearErrorTransactionString();
                      loader.hideLoaderDialog(context);
                      _resetTransactionLoadingStatus(); // making the enum status init
                    });
                  } else if (transactionState.shouldPopAfterSave == true) {
                    Future.delayed(const Duration(milliseconds: 500), () {
                      // context.read<TransactionCubit>().resetShouldPopAfterSave();
                      print("Navigate pop back disabled");
                      //Navigator.pop(context);
                    });
                  }

                  ///
                  /// Show/Hide the loader
                  ///
                  if (transactionState.loaderStatus?.isLoading == 1) {
                    Future.microtask(() => loader.showLoaderDialog(context, transactionState.loaderStatus?.message));
                  } else if (transactionState.loaderStatus?.isLoading == 0) {
                    Future.microtask(() {
                      loader.hideLoaderDialog(context);
                      context.read<TransactionCubit>().clearLoaderStatus();
                    });
                  }

                  ///
                  /// Handling complete transaction response status
                  ///
                  if (transactionState.completeTransactionStatus?.status == 1) {
                    isCompleted = true;
                    msgAfterPrint = 'Completed transaction successfully.';
                    Future.microtask(() {
                      clearCustomerAndCard();
                    });
                    context.read<TransactionCubit>().setBarcodeReadData(null);
                    Future.microtask(() {
                      _hasGoneToPaymentAfterComplete = false;
                      _notificationBar.showMessage(
                          (transactionState.completeTransactionStatus?.message) ?? '',
                          AppColors.notificationBGLightBlueColor);
                      context.read<TransactionCubit>().clearCompleteTransactionStatus();

                      if (context.read<TransactionCubit>().state.transactionData != null) {
                        switch (shouldPrintTransactionReceipt) {
                          case "N":
                            {
                              ///NO – Don’t Print The transaction receipt
                              Future.microtask(() => context.read<TransactionCubit>().clearTransactionData()).then((value) {
                                isCompleted = false;
                                if(TS.isTablesScreenOpened.value.toString() == 'YES'){
                                  Navigator.of(context).pop();
                                }
                              });
                            }
                            break;
                          case "A":
                            {
                              ///ASK – Ask a confirmation to print receipt with yes and no options on screen
                              Future.microtask(() {
                                showGeneralDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    barrierLabel: MaterialLocalizations
                                        .of(context)
                                        .modalBarrierDismissLabel,
                                    barrierColor: Colors.black45,
                                    transitionDuration: const Duration(milliseconds: 200),
                                    pageBuilder:
                                        (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
                                      return PrintReceiptConfirmationDialog(
                                        onConfirmTapped: () {
                                          Future.microtask(() =>
                                              loader.showLoaderDialog(context, "Printing transaction receipt..."));
                                          if (Application.printerType == "SUNMI" &&
                                              Application.deviceManufacturer == "SUNMI") {
                                            printingMethodChannel.setMethodCallHandler(nativeMethodHandler);
                                            Log.printMethodEnd(" SUNMITransactionPrint()",'Sales Screen','Print');
                                            printingMethodChannel.invokeMethod("printReceipt", {
                                              "type": "SUNMI",
                                              "receipt": context
                                                  .read<TransactionCubit>()
                                                  .state
                                                  .transactionPrintReceipt
                                                  ?.data![0].data,
                                              "receiptType": "TRANSACTION",
                                              "isBitmap": true
                                            });
                                            Log.printMethodEnd(" SUNMITransactionPrint()",'Sales Screen','Print');
                                          } else if (Application.printerType == "ZEBRA" &&
                                              Application.isBluetoothSupported == true &&
                                              Application.deviceManufacturer != "SUNMI") {
                                            printingMethodChannel.setMethodCallHandler(nativeMethodHandler);
                                            Log.printMethodEnd("ZEBRATransactionPrint()",'Sales Screen','Print');
                                            printingMethodChannel.invokeMethod("printReceipt", {
                                              "type": "ZEBRA",
                                              "receipt": context
                                                  .read<TransactionCubit>()
                                                  .state
                                                  .transactionPrintReceipt
                                                  ?.data![0].data,
                                              "receiptType": "TRANSACTION",
                                              "isBitmap": true
                                            });
                                            Log.printMethodEnd("ZEBRATransactionPrint()",'Sales Screen','Print');
                                          } else {
                                            Future.microtask(() async {
                                              await context.read<TransactionCubit>().clearTransactionData();
                                              if(mounted) {
                                                context.read<TransactionCubit>().clearCompleteTransactionStatus();
                                                if(loader.isOpen) {
                                                  loader.hideLoaderDialog(context);
                                                }
                                                _notificationBar.showMessage(
                                                    MessagesProvider.get(""
                                                        "Completed the transaction successfully. Unfortunately print receipt failed as Printer Type is not set up."), AppColors.notificationBGLightBlueColor);
                                                isCompleted = false;
                                                if(TS.isTablesScreenOpened.value.toString() == 'YES'){
                                                  Navigator.of(context).pop();
                                                }
                                              }
                                            });
                                          }
                                        },
                                        onCancelTapped: () {
                                          Future.microtask(() => context.read<TransactionCubit>().clearTransactionData()).then((value) {
                                            isCompleted = false;
                                            if(TS.isTablesScreenOpened.value.toString() == 'YES'){
                                              Navigator.of(context).pop();
                                            }
                                          } );

                                        },
                                      );
                                    });
                              });
                            }
                            break;
                          case "Y":
                            {
                              ///YES  - The app should print the transaction receipt
                              if (Application.printerType == "SUNMI" && Application.deviceManufacturer == "SUNMI") {
                                Future.microtask(() =>
                                    loader.showLoaderDialog(context, "Printing transaction receipt..."));
                                printingMethodChannel.setMethodCallHandler(nativeMethodHandler);
                                printingMethodChannel.invokeMethod("printReceipt", {
                                  "type": "SUNMI",
                                  "receipt": context
                                      .read<TransactionCubit>()
                                      .state
                                      .transactionPrintReceipt
                                      ?.data![0].data,
                                  "receiptType": "TRANSACTION",
                                  "isBitmap": true
                                });
                              } else if (Application.printerType == "ZEBRA" &&
                                  Application.isBluetoothSupported == true &&
                                  Application.deviceManufacturer != "SUNMI") {
                                Future.microtask(() =>
                                    loader.showLoaderDialog(context, "Printing the transaction receipt..."));
                                printingMethodChannel.setMethodCallHandler(nativeMethodHandler);
                                printingMethodChannel.invokeMethod("printReceipt", {
                                  "type": "ZEBRA",
                                  "receipt": context
                                      .read<TransactionCubit>()
                                      .state
                                      .transactionPrintReceipt
                                      ?.data![0].data,
                                  "receiptType": "TRANSACTION",
                                  "isBitmap": true
                                });
                              } else {
                                Future.microtask(() async {
                                  await context.read<TransactionCubit>().clearTransactionData();
                                  if(mounted) {
                                    context.read<TransactionCubit>().clearCompleteTransactionStatus();
                                    if(loader.isOpen) {
                                      loader.hideLoaderDialog(context);
                                    }
                                    _notificationBar.showMessage(
                                        MessagesProvider.get(""
                                            "Completed the transaction successfully. Unfortunately print receipt failed as Printer Type is not set up."), AppColors.notificationBGLightBlueColor);
                                    isCompleted = false;
                                    if(TS.isTablesScreenOpened.value.toString() == 'YES'){
                                      Navigator.of(context).pop();
                                    }
                                  }
                                });
                              }
                              break;
                            }
                        }
                      }
                    });
                  } else if (transactionState.completeTransactionStatus?.status == 0) {
                    Future.microtask(() {
                      context.read<TransactionCubit>().clearCompleteTransactionStatus();
                      final errorMsg = (transactionState.completeTransactionStatus?.message) ?? '';
                      _notificationBar.showMessage(errorMsg, AppColors.notificationBGRedColor);
                      if(!errorMsg.contains('TR_00045')) {
                        context.read<TransactionCubit>().clearCompleteTransactionStatus();
                        return;
                      }
                      final transactionData = context.read<TransactionCubit>().state.transactionData;
                      if(transactionData?.transactionStatus == 'PENDING_CLOSE' || transactionData?.isNonChargeable == true) {
                        if(TS.isTablesScreenOpened.value.toString() == 'YES' || widget.fromTables == true){
                          context.read<TransactionCubit>().completeTransaction(shouldPopAfterSave: true);
                        }else{
                          context.read<TransactionCubit>().completeTransaction(shouldPopAfterSave: (widget.transactionData != null || widget.fromTables));
                        }
                        return;
                      }
                      if(!_hasGoneToPaymentAfterComplete) {
                        _hasGoneToPaymentAfterComplete = true;
                        context.read<DeviceInterfaceCubit>().setBarCodeResult(null);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentSummaryScreen(
                                transactionData: transactionData),
                          ),
                        ).then((value) {
                          context.read<DeviceInterfaceCubit>().setPaymentScannerStatus(false);
                          transactionCubit.setBarcodeReadData(null);
                          final shouldIgnoreCompleteTrx = value as bool?;
                          final trxUpdatedData = context.read<PaymentScreenCubit>().state.transactionResponse;
                          if (trxUpdatedData != null) {
                            final totalPaidAmt = trxUpdatedData.data?.transactionPaymentTotal ?? 0.0;
                            final totalAmt = trxUpdatedData.data?.transactionNetAmount ?? 0.0;
                            if (totalPaidAmt.toInt() == totalAmt.toInt() && totalAmt != 0 && trxUpdatedData.data?.transactionStatus != 'CLOSED') {
                              _notificationBar.showMessage(
                                  MessagesProvider.get('Payment details have been updated.'),
                                  AppColors.notificationBGLightBlueColor);
                            }
                            bool hasAuthorizedPayment = false;
                            if(trxUpdatedData.data != null) {
                              for (var element in trxUpdatedData.data!.transactionPaymentDTOList) {
                                if(element.paymentStatus == 'AUTHORIZED') {
                                  hasAuthorizedPayment = true;
                                  break;
                                }
                              }
                            }
                            context.read<TransactionCubit>().onTransactionDataUpdated(trxUpdatedData.data);
                            if(hasAuthorizedPayment) {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext ctx) {
                                    return GenericDialog(
                                      onTapYes: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => BlocProvider<SettleScreenCubit>(
                                            create: (context) => SettleScreenCubit(),
                                            child: PaymentSettlementScreen(transactionId: trxUpdatedData.data?.transactionId,
                                              transactionData: trxUpdatedData.data,
                                             initialPage: 0,)))).then((value) {
                                          final trxAfterSettle = context.read<PaymentScreenCubit>().state.transactionResponse;
                                          context.read<TransactionCubit>().onTransactionDataUpdated(trxAfterSettle?.data);
                                          if(TS.isTablesScreenOpened.value.toString() == 'YES' || widget.fromTables == true){
                                            context.read<TransactionCubit>().completeTransaction(shouldPopAfterSave: true, hasGoneToPaymentAfterComplete: _hasGoneToPaymentAfterComplete);
                                          }else{
                                            context.read<TransactionCubit>().completeTransaction(shouldPopAfterSave: false, hasGoneToPaymentAfterComplete: _hasGoneToPaymentAfterComplete);
                                          }
                                        });
                                      },
                                      onTapNo: () {
                                        if(shouldIgnoreCompleteTrx == null) {
                                          if(TS.isTablesScreenOpened.value.toString() == 'YES' || widget.fromTables == true){
                                            context.read<TransactionCubit>().completeTransaction(shouldPopAfterSave: true, hasGoneToPaymentAfterComplete: _hasGoneToPaymentAfterComplete);
                                          }else{
                                            context.read<TransactionCubit>().completeTransaction(shouldPopAfterSave: false, hasGoneToPaymentAfterComplete: _hasGoneToPaymentAfterComplete);
                                          }
                                        }
                                      }, title: MessagesProvider.get('Settle Payments'),
                                      msg: MessagesProvider.get('Do you want to continue with settlement?'),
                                    );
                                  });
                            } else {
                              if(shouldIgnoreCompleteTrx == null) {
                                if(TS.isTablesScreenOpened.value.toString() == 'YES' || widget.fromTables == true){
                                  context.read<TransactionCubit>().completeTransaction(shouldPopAfterSave: true, hasGoneToPaymentAfterComplete: _hasGoneToPaymentAfterComplete);
                                }else{
                                  context.read<TransactionCubit>().completeTransaction(shouldPopAfterSave: false, hasGoneToPaymentAfterComplete: _hasGoneToPaymentAfterComplete);
                                }
                              }
                            }
                          }
                          context.read<PaymentScreenCubit>().clear();
                        });
                      } else {
                        if(TS.isTablesScreenOpened.value.toString() == 'YES' || widget.fromTables == true){
                          context.read<TransactionCubit>().completeTransaction(shouldPopAfterSave: true, hasGoneToPaymentAfterComplete: _hasGoneToPaymentAfterComplete);
                        }else{
                          context.read<TransactionCubit>().completeTransaction(shouldPopAfterSave: false, hasGoneToPaymentAfterComplete: _hasGoneToPaymentAfterComplete);
                        }
                        return;
                      }
                    });
                  }

                  if (transactionState.linkCustomerToTransactionError != null) {
                    Future.microtask(() {
                      _notificationBar.showMessage(
                          transactionState.linkCustomerToTransactionError.toString(),
                          AppColors.notificationBGRedColor);
                      context.read<TransactionCubit>().clearCustomerMappingErrorValues();
                    });
                  }

                  if (transactionState.deLinkCustomerFromTransactionError != null) {
                    Future.microtask(() {
                      loader.hideLoaderDialog(context);
                      _notificationBar.showMessage(
                          transactionState.deLinkCustomerFromTransactionError.toString(),
                          AppColors.notificationBGRedColor);
                      context.read<TransactionCubit>().clearCustomerMappingErrorValues();
                    });
                  }

                  if(transactionState.hasCustomerDelinkedFromTransaction == true) {
                    Future.microtask(() {
                      loader.hideLoaderDialog(context);
                      context.read<SelectedCustomer>().updateData(null);
                      context.read<SelectedCardDetails>().updateData(null);
                      context.read<SelectedCardDetails>().updateCardLength(null);
                      context.read<TransactionCubit>().clearCustomerMappingErrorValues();
                    });
                  }

                  return const SizedBox();
                }),
                BlocConsumer<DeviceInterfaceCubit, DeviceInterfaceState>(
                  listener: (context, state) {
                    if((state.printContent != null) &&  (state.printContent != "") && (state.isPrintingOngoing == false)){
                     // Application.printerType = "ZEBRA";
                      print("PAYPRINT ${state.isPrintingOngoing}");
                      print("PAYPRINT ${state.printContent} ");
                      context.read<DeviceInterfaceCubit>().setPrintOngoingStatus(true);
                      Log.printMethodStart('printReceipt()','Sales Screen','init');
                      if (Application.printerType == "SUNMI" &&
                          Application.deviceManufacturer == "SUNMI") {
                        printingMethodChannel.setMethodCallHandler(nativeMethodHandlerForPayment);
                        printingMethodChannel.invokeMethod("printReceipt", {
                          "type": "SUNMI",
                          "receipt": state.printContent,
                          "receiptType": "TRANSACTION",
                          "isBitmap": false
                        });
                      } else if (Application.printerType == "ZEBRA" &&
                          Application.isBluetoothSupported == true &&
                          Application.deviceManufacturer != "SUNMI") {
                        printingMethodChannel.setMethodCallHandler(
                            nativeMethodHandlerForPayment);
                        printingMethodChannel.invokeMethod("printReceipt", {
                          "type": "ZEBRA",
                          "receipt": state.printContent,
                          "receiptType": "TRANSACTION",
                          "isBitmap": false
                        });
                      }
                      Log.printMethodEnd('printReceipt()','Sales Screen','init');
                    }
                    },
                  builder: (context, state) =>  const SizedBox()
                ),
                BlocConsumer<TransactionCubit, TransactionCubitState>(
                  listener: (context, state) {
                    if(state.isLoading && !state.isSuccess && !state.isError) {
                      loader.showLoaderDialog(context, state.messageString);
                    } else if (!state.isLoading && state.isSuccess && !state.isError) {
                      loader.hideLoaderDialog(context);
                      state.messageString != null
                          ? _notificationBar.showMessage((state.messageString!), AppColors.notificationBGLightBlueColor)
                          : null;
                      _loadTransactionFunctionItems();
                    } else if (!state.isLoading && !state.isSuccess && state.isError) {
                      loader.hideLoaderDialog(context);
                      state.messageString != null
                          ? _notificationBar.showMessage((state.messageString!), AppColors.notificationBGRedColor)
                          : null;
                    }
                  },
                    builder: (context, state) {
                      return const SizedBox();
                    }),
                BlocSelector<TransactionCubit, TransactionCubitState, Status>(
                    selector: (state) => state.status ?? Status(LoadingStatus.none, ""),
                    builder: (context, state) {
                      switch (state.loadingStatus) {
                        case LoadingStatus.loading:
                          Future.microtask(() => loader.showLoaderDialog(context, (state.message)));
                          break;
                        case LoadingStatus.success:
                          Future.microtask(() {
                            loader.hideLoaderDialog(context);
                            _notificationBar.showMessage((state.message), AppColors.notificationBGLightBlueColor);
                            _clearStatus();
                          });
                          break;
                        case LoadingStatus.error:
                          Future.microtask(() {
                            loader.hideLoaderDialog(context);
                            _notificationBar.showMessage((state.message), AppColors.notificationBGRedColor);
                            _clearStatus();
                          });
                          break;
                        case LoadingStatus.conditionalError:
                          Future.microtask(() {
                            // loader.hideLoaderDialog(context);
                            _notificationBar.showMessage((state.message), AppColors.notoficationBGLightYellowColor);
                            _clearStatus();
                          });
                          break;
                        case LoadingStatus.none:
                          break;
                        case LoadingStatus.initial:
                          break;
                      }
                      return const SizedBox();
                    }),
                BlocSelector<TransactionCubit, TransactionCubitState, int>(
                    selector: (state) => state.isTransactionLineGroupSelected ?? -1,
                    builder: (context, state) {
                      if (state == 0) {
                        _loadTransactionFunctionItems(isForTransactionHeaderFunctions: true);
                        _selectedTransactionLinesGroup = null;
                        _clearTransactionFunctionsSelection();
                      }
                      if (state == 1) {
                        _loadTransactionFunctionItems(isForTransactionHeaderFunctions: false);
                        _clearTransactionFunctionsSelection();
                      }
                      return const SizedBox();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clearCustomerAndCard() {
    ///unlink customer
    print('before DFG ${context.read<SelectedCustomer>().selectedData}');
    if (context.read<SelectedCustomer>().selectedData != null) {
      context.read<SelectedCustomer>().updateData(null);
    }
    ///unlink card
    if(context.read<SelectedCustomer>().selectedData != null) {
      context.read<SelectedCardDetails>().updateData(null);
      context.read<SelectedCardDetails>().updateCardLength(null);
    }
  }

  bool isProductAdditionAllowed() {
    final status = context.read<TransactionCubit>().state.transactionData?.transactionStatus;
    if(status == 'ABANDONED' || status == 'CANCELLED' || status == 'PENDING_CLOSE' || status == 'CLOSED'
        || status == 'REOPENED' || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "ADD LINE"]),
          AppColors.notoficationBGLightYellowColor);
      return false;
    }
    return true;
  }

  _showProductMenuView(SemnoxTheme theme) {
    final TransactionCubit transactionCubit = context.read<TransactionCubit>();
    return Expanded(
      flex: 6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            // flex: 8,
            child: Container(
                color: theme.backGroundColor,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, right: 10, bottom: 8),
                  child: ValueListenableBuilder(
                      valueListenable: productMenuNotifier,
                      builder: (context, value, _) {
                        if (_productMenuResponse != null) {
                          return ProductMenuView(
                              _productMenuDataBL,
                              _productMenuResponse,
                              (int productId, int quantity, String event) {
                                if (transactionCubit.state.transactionData == null) {
                                  _onNewTransactionSelected(productId: productId, quantity: quantity, event: event);
                                } else {
                                  if(isProductAdditionAllowed()) {
                                    Future.microtask(() => _onProductSelected(productId, quantity, event));
                                  }
                                }
                              },
                              _masterDataBl,
                              () {
                                _notificationBar.showMessage(MessagesProvider.get("Search completed successfully."),
                                    AppColors.notificationBGLightBlueColor);
                              },
                              (GridItem panelItem) {
                                if (transactionCubit.state.transactionData == null) {
                                  _onNewTransactionSelected(productId: panelItem.id, quantity: 0, event: "details_dialog", panelItem: panelItem);
                                } else {
                                  onInfoClicked(panelItem);
                                  //Future.microtask(() => _onProductSelected(productId, quantity, event));
                                }

                                //onInfoClicked(productMenuItem)
                              });
                        } else {
                          return Container();
                        }
                      }), //
                )),
          ),
          Container(
            color: theme.tableRow1,
            height: SizeConfig.getHeight(70),
            margin: EdgeInsets.only(right: SizeConfig.getWidth(5), top: SizeConfig.getHeight(1)),
            padding: EdgeInsets.only(right: SizeConfig.getWidth(3), left: SizeConfig.getWidth(5), top: SizeConfig.getHeight(8)),
            child: _getContextMenuView(),
          )
        ],
      ),
    );
  }

  void onInfoClicked(productMenuItem) async {
    ProductContainerDTO? productPriceContainer = await _productMenuDataBL.getProductDetails(productMenuItem.id);
    // launch product details dialog
    if (productPriceContainer != null) {
      if(mounted) {
        showGeneralDialog(
            context: context,
            barrierDismissible: false,
            barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
            barrierColor: Colors.black45,
            transitionDuration: const Duration(milliseconds: 200),
            pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
              return ProductDetailsDialog(productPriceContainer, (int quantity) async {

                ProductContainerDTO? productPriceContainer =
                await _productMenuDataBL.getProductDetails(productMenuItem.id);
                Log.v("ProductDetailsDialog onConfirm() :: name: ${productMenuItem.title} qty: $quantity");
                if (productPriceContainer?.upsellOffersContainerDTOList != null &&
                    productPriceContainer!.upsellOffersContainerDTOList.isNotEmpty) {
                  List<UpsellProductModel> upsellProducts = [];
                  for (int i = 0; i < productPriceContainer.upsellOffersContainerDTOList.length; i++) {
                    ProductContainerDTO? productPriceContainerData = await _productMenuDataBL
                        .getProductDetails(productPriceContainer.upsellOffersContainerDTOList[i].offerProductId);
                    upsellProducts.add(UpsellProductModel(
                        productPriceContainerData!, productPriceContainer.upsellOffersContainerDTOList[i]));
                  }
                  //showUpsellDialog(productMenuItem, upsellProducts, quantity);
                } else if (productPriceContainer?.crossSellProductsContainerDTOList != null &&
                    productPriceContainer!.crossSellProductsContainerDTOList.isNotEmpty) {
                  List<CrossSellProductModel> crossSellProducts = [];
                  for (int i = 0;
                  i < (productPriceContainer.crossSellProductsContainerDTOList[0].salesOfferGroupContainerDTO!
                      .saleGroupProductMapDTOContainerList?.length ?? 0);
                  i++) {
                    ProductContainerDTO? productPriceContainerData = await _productMenuDataBL.getProductDetails(
                        (productPriceContainer.crossSellProductsContainerDTOList[i].salesOfferGroupContainerDTO!
                            .saleGroupProductMapDTOContainerList?[0].productId ?? 0));
                    crossSellProducts.add(CrossSellProductModel(
                        productPriceContainerData!, productPriceContainer.crossSellProductsContainerDTOList[i]));
                  }

                  bool itemFound = false;
                  if (transactionCubit?.state.transactionData != null) {
                    for (int i = 0; i < (transactionCubit?.state.transactionData!.transactionLineDTOList.length?? 0); i++) {
                      for (int j = 0; j < crossSellProducts.length; j++) {
                        if (transactionCubit?.state.transactionData!.transactionLineDTOList[i].productId ==
                            crossSellProducts[j].productContainerDTO.productId) {
                          itemFound = true;
                        }
                      }
                    }
                  }

                  // add main product first
                  if(isProductAdditionAllowed()) {
                    _onProductSelected(
                        (productMenuItem.dataObject as ProductMenuPanelContentContainerDTO).productId,
                        quantity,
                        "DETAILS_DIALOG");
                  }

                  if (!itemFound) {
                    //showCrossSellDialog(productMenuItem, crossSellProducts);
                  }
                } else {
                  if(isProductAdditionAllowed()) {
                    _onProductSelected(
                        (productMenuItem.dataObject as ProductMenuPanelContentContainerDTO).productId,
                        quantity,
                        "DETAILS_DIALOG");
                  }
                }
              });
            });
      }
    }
  }

  _showTransactionView(SemnoxTheme theme) {
    return Expanded(
      flex: 4,
      child: Container(
        margin: EdgeInsets.only(top: SizeConfig.getHeight(2.5), right: SizeConfig.getWidth(2)),
        decoration: BoxDecoration(
          color: theme.tableRow1,
          borderRadius: BorderRadius.circular(SizeConfig.getSize(4)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.getHeight(5)),
              child: const TransactionHeaderView(),
            ),
            SizedBox(
              height: SizeConfig.getHeight(50),
              child: _getIconicContextMenuView(),
            ),
            Divider(
              thickness: SizeConfig.getSize(1),
              color: theme.dividerColor,
              height: SizeConfig.getHeight(1),
            ),
            Expanded(
              flex: 8,
              child: Container(
                child: _getTransactionView(),
              )
            )
          ],
        ),
      ),
    );
  }

  _cancelProduct(TransactionCubit transactionCubit, int quantity, {int?approverID}) async {
    Log.printMethodStart('_cancelProduct()','SalesScreen','CancelProduct');
    if (_selectedTransactionLinesGroup != null &&
        _selectedTransactionLinesGroup!.transactionLines.isNotEmpty &&
        transactionCubit.state.transactionData != null) {
      List<TransactionLineDTO>? transactionLinesList = _selectedTransactionLinesGroup?.transactionLines.getRange(0, quantity).toList(); // TODO: fet Ranfe should be modified
      List<int> transactionLinesIDs = [];
      transactionLinesList?.forEach((transactionLine) {
        transactionLinesIDs.add(transactionLine.transactionLineId);
      });
      if(_selectedTransactionLinesGroup!.transactionLines.getRange(0, quantity).toList()[0].lineStatus == "FULFILLED" ){
        _notificationBar.showMessage(MessagesProvider.get("Selected transaction line(s) status is FULFILLED. CANCEL operation is not permitted."),AppColors.notoficationBGLightYellowColor );
      }
     else if ( _selectedTransactionLinesGroup!.transactionLines.getRange(0, quantity).toList()[0].lineStatus == "ORDERED") {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return CancelLineAlertDialog(
                notificationBar: _notificationBar,
                  approverID:approverID,
                  onCancel: (value) {
                    _notificationBar.showMessage(value, AppColors.notoficationBGLightYellowColor);
                  },
                  showNotification: (value) {
                    _notificationBar.showMessage(value, AppColors.notificationBGLightBlueColor);
                    _loadTransactionFunctionItems(isForTransactionHeaderFunctions: true); //TODO: temporarily changing the menu state
                  },
                  productName: _selectedTransactionLinesGroup?.productName ?? '',
                  transactionLineIds: transactionLinesIDs);
            });
      } else if (_selectedTransactionLinesGroup!.transactionLines.getRange(0, quantity).toList()[0].lineStatus == "CANCELLED") {
        _showFeatureNotImplementedDialog("Product is already cancelled"); //TODO: shows tha product already got cancelled ...
      } else {
        loader.showLoaderDialog(context, MessagesProvider.get("Please wait while we cancel the transaction line..."));
      try{ var execContextBL = await ExecutionContextBuilder.build();
      var sysExecContext = execContextBL.getExecutionContext();
      var transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      var transactionResponse = await transactionDataBl.removeProductFromLine(
          transactionLineIds: transactionLinesIDs,
          reasonId: -1);
      Log.printMethodEnd('_cancelProduct()','SalesScreen','CancelProduct');
      Log.printMethodReturn('_cancelProduct() - Cancel line successful.','SalesScreen','CancelProduct');
      transactionCubit.onTransactionDataUpdated(transactionResponse.data);
      _notificationBar.showMessage(MessagesProvider.get("Transaction Line Cancelled Successfully."), AppColors.notificationBGLightBlueColor);
      _loadTransactionFunctionItems(isForTransactionHeaderFunctions: true);
      loader.hideLoaderDialog(context);
      }
      on DioError catch (error) {
        var errorString = error.response?.data['data'] as String?;
        _notificationBar.showMessage(errorString.toString(), AppColors.notificationBGRedColor);
        loader.hideLoaderDialog(context);
      }catch(err){
        _notificationBar.showMessage(MessagesProvider.get("Something went Wrong!"), AppColors.notificationBGRedColor);
        loader.hideLoaderDialog(context);
      }
      }
    } else {
      ///
      /// Entering remarks for the transaction, as the transaction line has not been selected.
      ///
      _notificationBar.showMessage(
          MessagesProvider.get("Click on NEW button to proceed."),
          AppColors.notoficationBGLightYellowColor);
    }
  }

  Future<void> onEditClicked({int?approverID}) async {
    clearNotificationBar();
    final lineStatus = _selectedTransactionLinesGroup?.lineStatus;
    if(lineStatus == 'CANCELLED' || lineStatus == 'CLOSED' || lineStatus == 'ABANDONED'
        || lineStatus == 'FULFILLED' || lineStatus == 'REVERSED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Selected transaction line(s) status is &1. &2 operation not permitted.", [lineStatus, "EDIT"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    // condition for items with modifiers
    int? productId = _selectedTransactionLinesGroup?.transactionLines[0].productId;
    if (productId != null) {
      ProductContainerDTO? productPriceContainer = await _productMenuDataBL.getProductDetails(productId);
      if (productPriceContainer?.productModifierContainerDTOList.isNotEmpty == true) {
        _onProductSelected(
            productId,
            (_selectedTransactionLinesGroup?.transactionLines[0].quantity ?? 0).toInt(),
            "EDIT",
            _selectedTransactionLinesGroup?.transactionLines ?? []);
      } else if (productPriceContainer?.productType == "CARDSALE" ||
          productPriceContainer?.productType == "NEW" ||
          productPriceContainer?.productType == "GAMETIME" ||
          productPriceContainer?.productType == "RECHARGE" || productPriceContainer?.productType =='VARIABLECARD') {
        _onCardProductSelectedForEdit(productPriceContainer,approverID:approverID
        );
      }
    }
  }

  _onCardProductSelectedForEdit(ProductContainerDTO? productPriceContainer,{int?approverID}) {
    if ((_selectedTransactionLinesGroup?.transactionLines.length ?? 0) > 1) {
      /// Show the quantity dialog
      /// based on the quantity given extract the transaction line ids and pass it to the dialog.
      ///
      final status = context.read<TransactionCubit>().state.transactionData?.transactionStatus;
      if(status == 'REOPENED' || status == 'ABANDONED' || status == 'PENDING_CLOSE' || status == 'CLOSED'
          || status == 'CANCELLED' || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
        _notificationBar.showMessage(
            MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "CHARGEABLE"]),
            AppColors.notoficationBGLightYellowColor);
        return;
      }
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return ProductQuantityDialog(MessagesProvider.get("Line Quantity"), (quantity) async {
              if (int.parse(quantity) <= (_selectedTransactionLinesGroup?.transactionLines.length ?? 0)) {
                List<TransactionLineDTO>? transactionLinesList = _selectedTransactionLinesGroup?.transactionLines
                        .getRange(0, int.parse(quantity))
                        .toList();
                List<int> transactionLinesIDs = [];
                transactionLinesList?.forEach((transactionLine) {
                  transactionLinesIDs.add(transactionLine.transactionLineId);
                });
                _showCardFunctionalityDialog(
                    approverID: approverID,
                    isSplitCard:(_selectedTransactionLinesGroup?.transactionLines[0].transactionAccountDTOList?.length??0) > 1?true:false,productPriceContainer: productPriceContainer!,
                    quantity: (_selectedTransactionLinesGroup?.transactionLines[0].transactionAccountDTOList?.length??0)>1?(_selectedTransactionLinesGroup?.transactionLines[0].transactionAccountDTOList?.length??0):transactionLinesIDs.length,
                    isEdit: true,
                    isFullfill:false,
                    transactionLines: transactionLinesList);
              } else {
                _notificationBar.showMessage(
                    MessagesProvider.get("Maximum quantity allowed is &1.", [_selectedTransactionLinesGroup?.transactionLines.length]),
                    AppColors.notoficationBGLightYellowColor);
              }
            });
          });
    } else {
      _showCardFunctionalityDialog(
          approverID: approverID,
          isSplitCard:(_selectedTransactionLinesGroup?.transactionLines[0].transactionAccountDTOList?.length??0) > 1?true:false,productPriceContainer: productPriceContainer!,
          quantity: (_selectedTransactionLinesGroup?.transactionLines[0].transactionAccountDTOList?.length??0)>1?(_selectedTransactionLinesGroup?.transactionLines[0].transactionAccountDTOList?.length??0):1,
          isEdit: true,
          isFullfill:false,
          transactionLines: _selectedTransactionLinesGroup?.transactionLines);
    }
  }

  Future<void> alertDialogUpdateUICallback(response, notificationMessage) async {
    // TransactionResponse? response = _transactionDataBl.getCurrentTransaction();
    // _transactionData = response?.data;
    // _transactionView.setTransaction(_transactionData!, await _isSeatBased());
    // _transactionHeaderView.setTransaction(_transactionData);
    if (response?.exception != null) {
      loader.hideLoaderDialog(context);
      _notificationBar.showMessage(MessagesProvider.get("Update Failed"), AppColors.notificationBGRedColor); //TODO Change the text accordingly.
    } else {
      context.read<TransactionCubit>().onTransactionDataUpdated(response?.data);
      loader.hideLoaderDialog(context);
      _notificationBar.showMessage(
          notificationMessage,
          AppColors.notificationBGLightBlueColor); //TODO Change the text accordingly.
    }
  }

  Future<void> _checkCurrentUserPrivileges() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final userRoleDTO = await masterDataBL.getUserRoleById(execContext.userRoleId ?? -1);
    _isCurrentUserManager = userRoleDTO?.selfApprovalAllowed == true;
    _currentUserPkId = execContext.userPKId;
  }

  Future<void> _shouldShowProductMenuOnRightSide() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    shouldShowProductMenuOnRightSide = await masterDataBL.getDefaultValuesByName(defaultValueName: "SHOW_PRODUCT_MENU_ON_RIGHT_SIDE") == "Y";
    setState(() {});
  }

  Future<void> _shouldPrintTransactionReceipt() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    shouldPrintTransactionReceipt = (await masterDataBL.getDefaultValuesByName(defaultValueName: "TRX_AUTO_PRINT_AFTER_SAVE"))!;
  }

  Future<void> _getProductMenu() async {
    var execContextBL = await ExecutionContextBuilder.build();
    var sysExecContext = execContextBL.getExecutionContext();
    _masterDataBl = await MasterDataBuilder.build(sysExecContext!);
    _productMenuDataBL = await ProductMenuDataBuilder.build(sysExecContext);
    _productMenuResponse = _productMenuDataBL.getProductMenu();
    productMenuNotifier.value = _productMenuResponse;
    _productListsMaps = await _productMenuDataBL.getInstantMapOfProductContainerDetails();
    _modifierSetContainerMap = await _productMenuDataBL.getMapOfModifierSetContainerDetails();
  }

  loadModifiersSetData(ProductModifierContainerDTO productModifierContainerDTO) async {
    Log.v("loading ${productModifierContainerDTO.modifierSetContainerDTO?.setName}");

    List<ModifierDTO> modifierDTOs = [];

    for (var modifierSetDetailsContainerDTO
    in productModifierContainerDTO.modifierSetContainerDTO?.modifierSetDetailsContainerDTOList ?? <ModifierSetDetailsContainerDTO>[]) {
      var item = await _productMenuDataBL.getProductDetails(modifierSetDetailsContainerDTO.modifierProductId);
      Log.v(item?.productName);

      if (item != null) {
        int quantity = 0;
        modifierDTOs.add(ModifierDTO(
            modifierSetDetailsContainerDTO.modifierSetId,
            modifierSetDetailsContainerDTO.modifierSetDetailId,
            item.productId,
            item.productName,
            quantity,
            false,
            item.managerApprovalRequired.toLowerCase().contains("y"),
            item.trxRemarksMandatory.toLowerCase().contains("y"),
            0,
            false,
            0
        ));
      }
    }
    return modifierDTOs;
  }

  Future<void> _onProductSelected(int productId, int quantity, String event,
      [List<TransactionLineDTO> editTransactionLinesDTO = const []]) async {

    // data required for edit mode
    List<TransactionLineDTO> transactionLineDtoList = editTransactionLinesDTO.isNotEmpty? editTransactionLinesDTO[0].transactionLineDTOList: [];

    ProductContainerDTO? productPriceContainer = await _productMenuDataBL.getProductDetails(productId);

    print("Selected Product Name : "+productPriceContainer!.productName.toString());
    print("Selected Product ID : "+productId.toString());

    final TransactionCubit transactionCubit = context.read<TransactionCubit>();

    if(productPriceContainer.productName.toString() == "9999"){
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();
      final masterDataBL = await MasterDataBuilder.build(execContext!);
      final printersList = await masterDataBL.getKOTPrinters();
      List<String> printerIdsNames = [];
      printersList?.forEach((element) {
        printerIdsNames.add(element.printerId.toString()+";"+element.printerName.toString());
      });

      print("productId : "+productId.toString());
      print("Entered 9999 if loop");
      SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
      final _formKey = GlobalKey<FormState>();
      if (!mounted) return;
      //loader.showLoaderDialog(context, MessagesProvider.get("Adding product to the transaction..."));
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext contextNew) {
          return Product9999Details(productId:productId,quantity:quantity,add9999ToTransaction:_add9999ToTransaction,);
        },
      ).whenComplete((){
        Future.delayed(const Duration(seconds: 2),(){
          setState(() {
            nineItemDescription.clear();
            nineItemPrice.clear();
            nineItemRemarks.clear();
          });
        });
      });
    }else{
      print("Entered 9999 else loop");
      if (productPriceContainer.upsellOffersContainerDTOList.isNotEmpty) {
        List<UpsellProductModel> upsellProducts = [];
        for (int i = 0; i < productPriceContainer.upsellOffersContainerDTOList.length; i++) {
          ProductContainerDTO? productPriceContainerData = await _productMenuDataBL
              .getProductDetails(productPriceContainer.upsellOffersContainerDTOList[i].offerProductId);
          upsellProducts.add(
              UpsellProductModel(productPriceContainerData!, productPriceContainer.upsellOffersContainerDTOList[i]));
        }
        showUpsellDialog(productContainerDTOToProductItem(productPriceContainer), upsellProducts, 1);
      } else if (productPriceContainer.crossSellProductsContainerDTOList.isNotEmpty) {
        List<CrossSellProductModel> crossSellProducts = [];
        for (int i = 0;
        i <
            (productPriceContainer.crossSellProductsContainerDTOList[0].salesOfferGroupContainerDTO!
                .saleGroupProductMapDTOContainerList?.length ?? 0);
        i++) {
          ProductContainerDTO? productPriceContainerData = await _productMenuDataBL.getProductDetails(
              (productPriceContainer.crossSellProductsContainerDTOList[i].salesOfferGroupContainerDTO!
                  .saleGroupProductMapDTOContainerList?[0].productId ?? 0));
          crossSellProducts.add(CrossSellProductModel(
              productPriceContainerData!, productPriceContainer.crossSellProductsContainerDTOList[i]));
        }

        bool itemFound = false;
        if (transactionCubit.state.transactionData != null) {
          for (int i = 0; i < (transactionCubit.state.transactionData!.transactionLineDTOList.length); i++) {
            for (int j = 0; j < crossSellProducts.length; j++) {
              if (transactionCubit.state.transactionData!.transactionLineDTOList[i].productId ==
                  crossSellProducts[j].productContainerDTO.productId) {
                itemFound = true;
              }
            }
          }
        }

        // add main product first
        //_onProductSelected(productPriceContainer.productId, 1, "DETAILS_DIALOG");
        if (!mounted) return;
        loader.showLoaderDialog(context, MessagesProvider.get("Adding product to the transaction..."));
        await _addProductToTransaction(
          productPriceContainer.productId,
          quantity,
        ).then((value) {
          print("------------------------------- then");
          if (!itemFound) {
            showCrossSellDialog(productContainerDTOToProductItem(productPriceContainer), crossSellProducts);
          }
        });
      } else if (productPriceContainer.productModifierContainerDTOList.isNotEmpty == true) {
        loadDialog(
          ModifierSetDialog(_productListsMaps, _modifierSetContainerMap, productPriceContainer, quantity, (List<ModifierCustomizationModel>modifierCustomizationModels) async {
            await Future.delayed(const Duration(seconds: 1));
            Log.v("---modifierCustomizationModels.length ${modifierCustomizationModels.length}");
            final TransactionCubit transactionCubit = context.read<TransactionCubit>();
            List<AddModifierProductRequest> addModifierProducts =
            modifierCustomizationModels.map((e) => e.toAddModifierProductRequest(
              transactionCubit.state.selectedSeatName,
              transactionCubit.state.selectedSeat,
            )).toList();
            if (event.contains("EDIT")) {
              // compare transactionLineDtoList/_selectedTransactionLinesGroup with addModifierProducts
              // change quantity of items and send data to API

              // _selectedTransactionLinesGroup.transactionLines is nullable̊
              final selectedTransactionLinesGroup = _selectedTransactionLinesGroup;
              if (selectedTransactionLinesGroup != null) {
                List<TransactionLineDTO> transactionLines =
                selectedTransactionLinesGroup.transactionLines.toList(growable: true);
                var currentProduct = transactionLines[0].copyWith(
                  isChanged: true,
                  isChangedRecursive: true
                );
                List<ModifierDTO> qtyItemsList = modifierCustomizationModels[0].qtyItemsList;
                updateLinesRecursively(currentProduct, qtyItemsList);

                List<TransactionLineDTO> request = transactionLines;
                request[0] =
                    request[0].copyWith(
                      isChanged: true,
                      isChangedRecursive: true,
                      transactionLineDTOList: currentProduct.transactionLineDTOList
                    );
                _editModifier(request);
              }
            } else {
              _addModifier(addModifierProducts);
            }
          }, () {
            _notificationBar.showMessage(
                MessagesProvider.get("Product addition is cancelled."), AppColors.notoficationBGLightYellowColor);
          }, transactionLineDtoList),
        );
      } else if (productPriceContainer.quantityPrompt == "N"&& productPriceContainer.productType =="MANUAL") {
        if (productPriceContainer.trxRemarksMandatory == "Y") {
          _showRemarksMandatoryDialog(productPriceContainer.productName, productPriceContainer, quantity, onRemarksInputCallback: (String? data) {  });
        } else if (productPriceContainer.allowPriceOverride == "Y") {
          if(productPriceContainer.minimumUserPrice != -1.0) {
            if (!mounted) return;
            showDialog(
                barrierDismissible: false,
                context: context,
                barrierColor: const Color(0x01000000),
                builder: (BuildContext context) {
                  return NumberPad(
                    initialOffset: const Offset(50, 50),
                    title: MessagesProvider.get("User Price (Min: &1)", [productPriceContainer.minimumUserPrice]),
                    isInitialRequired: true,
                    isDecimalRequired: true,
                    initialDecimalValue: productPriceContainer.price,
                    onOkPressed: (price) {
                      if(price.toDouble() >= productPriceContainer.minimumUserPrice) {
                        loader.showLoaderDialog(context, MessagesProvider.get("Adding product to the transaction..."));
                        _addProductToTransaction(
                          productPriceContainer.productId,
                          quantity,
                          userOverriddenPrice: price.toDouble(),
                        );
                      } else {
                        _notificationBar.showMessage(
                            MessagesProvider.get("Override price cannot be less than &1 ", ["$currency${formatAmount(productPriceContainer.minimumUserPrice)}"]),
                            AppColors.notoficationBGLightYellowColor);
                      }
                    },
                  );
                });
          } else {
            if (!mounted) return;
            showDialog(
                barrierDismissible: false,
                context: context,
                barrierColor: const Color(0x01000000),
                builder: (BuildContext context) {
                  return NumberPad(
                    initialOffset: const Offset(50, 50),
                    title: MessagesProvider.get("User Price"),
                    isInitialRequired: true,
                    isDecimalRequired: true,
                    initialDecimalValue: productPriceContainer.price,
                    onOkPressed: (price) {
                      loader.showLoaderDialog(context, MessagesProvider.get("Adding product to the transaction..."));
                      _addProductToTransaction(
                        productPriceContainer.productId,
                        quantity,
                        userOverriddenPrice: price.toDouble(),
                      );
                    },
                  );
                });
          }
        } else {
          if (productPriceContainer.minimumQuantity != 0) {
            if (!mounted) return;
            showDialog(
                barrierDismissible: false,
                context: context,
                barrierColor: const Color(0x01000000),
                builder: (BuildContext context) {
                  return NumberPad(
                    initialOffset: const Offset(50, 50),
                    title: MessagesProvider.get("Quantity (Min: &1)", [productPriceContainer.minimumQuantity]),
                    onOkPressed: (quantity) {
                      if (quantity >= 2) {
                        loader.showLoaderDialog(context, MessagesProvider.get("Adding product to the transaction..."));
                        _addProductToTransaction(
                          productPriceContainer.productId,
                          quantity,
                        );
                      } else {
                        _notificationBar.showMessage(
                            MessagesProvider.get("Minimum quantity for the Product: Min. Quantity is &1", [productPriceContainer.minimumQuantity]),
                            AppColors.notoficationBGLightYellowColor);
                      }
                    },
                  );
                });
          } else if(productPriceContainer.managerApprovalRequired == "Y") {
            if(!_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(() {
                  loader.showLoaderDialog(context, MessagesProvider.get("Adding product to the transaction..."));
                  _addProductToTransaction(
                      productPriceContainer.productId,
                      quantity,
                      approvedBy: response.data?.userId
                  );
                });
              });
            } else {
              if (!mounted) return;
              loader.showLoaderDialog(context, MessagesProvider.get("Adding product to the transaction..."));
              _addProductToTransaction(
                  productPriceContainer.productId,
                  quantity,
                  approvedBy: _execContextDTO.userId
              );
            }
          } else {
            if (!mounted) return;
            loader.showLoaderDialog(context, MessagesProvider.get("Adding product to the transaction..."));
            _addProductToTransaction(productPriceContainer.productId, quantity);
          }
        }
      } else if (productPriceContainer.quantityPrompt == "Y"&& productPriceContainer.productType =="MANUAL") {
        // show product quantity dialog
        if (!mounted) return;
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return ProductQuantityDialog(MessagesProvider.get("Repeat Product"), (value) async {
                Log.v('IncQnty,' + value);
                if (productPriceContainer.trxRemarksMandatory == "Y") {
                  _showRemarksMandatoryDialog(
                      productPriceContainer.productName,
                      productPriceContainer,
                      quantity, onRemarksInputCallback: (String? data) {  });
                } else {
                  loader.showLoaderDialog(context, MessagesProvider.get("Adding product to the transaction..."));
                  _addProductToTransaction(
                      productPriceContainer.productId,
                      int.parse(value));
                }
              });
            });
      } else if (
          productPriceContainer.onlyForVip == "N" &&
          productPriceContainer.registeredCustomerOnly == "N" &&
          productPriceContainer.autoGenerateCardNumber == "N" &&
          productPriceContainer.invokeCustomerRegistration == false &&
          (productPriceContainer.productType == "CARDSALE" ||
              productPriceContainer.productType == "NEW" ||
              productPriceContainer.productType == "GAMETIME" ||
              productPriceContainer.productType == "RECHARGE")) {
        final item = _sitesResponse?.data?.siteContainerDTOList
            .where((element) => element.siteId == _execContextDTO.siteId);
        if (item?.isNotEmpty == true) {
          final zone = item!.first.timeZoneName;
          _timeZoneName = timeZoneMap[zone];
        }
        final currentDateTimeByZone = curDateTimeByZone(zone: _timeZoneName ?? 'GMT');
        final transactionDate = DateTime.parse(transactionCubit.state.transactionData?.transactionDate??DateTime.now().toIso8601String());
        if(productPriceContainer.quantityPrompt == "Y"){
          if (!mounted) return;
          event == 'DETAILS_DIALOG'?
          // _showCardFunctionalityDialog(isSplitCard:false,productPriceContainer:productPriceContainer,quantity: quantity ,isEdit: false):
          _showCardProductDialog(productPriceContainer: productPriceContainer, quantity: quantity, event:event):
          showDialog(
              context: context,
              barrierDismissible: false,
              barrierColor:const Color(0x01000000),
              builder: (BuildContext context) {
                return   NumberPad(title: MessagesProvider.get('Quantity'),onOkPressed:  (value) async {
                  if(transactionDate.difference(currentDateTimeByZone).inMilliseconds > 0){
                    _showFutureCardDatedDialog(lineDate:transactionDate.toIso8601String(),productPriceContainer:productPriceContainer, quantity: int.parse(value.toString()), event:event);
                  }else{
                    _showCardProductDialog(productPriceContainer: productPriceContainer, quantity:int.parse(value.toString()), event:event);
                  }
                },);
              });
        }else{
          if(transactionDate.difference(currentDateTimeByZone).inMilliseconds > 0){
            _showFutureCardDatedDialog(lineDate:transactionDate.toIso8601String(),productPriceContainer:productPriceContainer, quantity: quantity, event:event);
          }else{
            _showCardProductDialog(productPriceContainer: productPriceContainer, quantity: quantity, event:event);
          }
        }

      } else if(productPriceContainer.quantityPrompt == "N" && productPriceContainer.onlyForVip == "N" && productPriceContainer.registeredCustomerOnly == "N" && productPriceContainer.invokeCustomerRegistration == false && productPriceContainer.autoGenerateCardNumber == "N"&& productPriceContainer.productType == "VARIABLECARD"){
        String? minVariableAmount = await masterDataBLContract?.getDefaultValuesByName(defaultValueName: "MAX_VARIABLE_RECHARGE_AMOUNT") ?? "1";
        if (!mounted) return;
        showDialog(
            barrierDismissible: false,
            context: context,
            barrierColor: const Color(0x01000000),
            builder: (BuildContext context) {
              return NumberPad(
                title: MessagesProvider.get('Price'),
                onOkPressed: ( value) async {
                  if(int.parse(value.toString())>int.parse(minVariableAmount.toString())){
                    _notificationBar.showMessage('${MessagesProvider.get('Maximum allowed amount is')} ${int.parse(minVariableAmount.toString())}', AppColors.notoficationBGLightYellowColor);
                  }else{
                    _showCardFunctionalityDialog(isSplitCard:false,productPriceContainer:productPriceContainer,isFullfill:false,quantity: quantity, variableAmount: double.parse(value.toString()), isEdit:false );
                  }
                },
              );
            });
      } else if (productPriceContainer.onlyForVip == "Y" &&
          productPriceContainer.invokeCustomerRegistration == false &&
          productPriceContainer.registeredCustomerOnly == "N") {
        _onVipMandatoryProductSelected(productPriceContainer, quantity);
      } else if (productPriceContainer.registeredCustomerOnly == "Y" && productPriceContainer.onlyForVip == "N") {
        _onRegisteredCustomerOnlyProductSelected(productPriceContainer, quantity);
      } else if (productPriceContainer.invokeCustomerRegistration == true &&
          productPriceContainer.registeredCustomerOnly == "N" &&
          productPriceContainer.onlyForVip == "N"){
        _onInvokeCustomerRegistrationProductSelect(productPriceContainer, quantity);
      } else {
        if (!mounted) return;
        loader.showLoaderDialog(context, MessagesProvider.get("Adding product to the transaction..."));
        _addProductToTransaction(
          productPriceContainer.productId,
          quantity,
        );
      }
    }
  }

  String formatAmount(double amount) {
    final format = NumberFormat(amountFmt);
    return format.format(amount);
  }

  void updateLinesRecursively(TransactionLineDTO currentProduct, List<ModifierDTO> qtyItemsList) {
    var maxLimit = getDepth(qtyItemsList);
    for(int i = 0; i < currentProduct.transactionLineDTOList.length; i++) {
      currentProduct.transactionLineDTOList[i].isChanged = true;
      currentProduct.transactionLineDTOList[i].isChangedRecursive = true;
    }
    updateLines(0, maxLimit, currentProduct, currentProduct.transactionLineDTOList, qtyItemsList);
  }

  int getDepth(List<ModifierDTO> list) {
    int depth = 0;
    if(list.isNotEmpty) {
      for(var item in list) {
        if(item.level > depth) {
          depth = item.level;
        }
      }
      return ((depth / 2) + 1).toInt();
    } else {
      return 0;
    }
  }

  void updateLines(int level, int maxLevel, TransactionLineDTO currentProduct, List<TransactionLineDTO> childList, List<ModifierDTO> qtyItemsList) {
    if(level < maxLevel) {
      var currentLines = <TransactionLineDTO>[];
      final newLines = <TransactionLineDTO>[];
      final productContainer = _productListsMaps?[currentProduct.productId];
      for (var e in (productContainer?.productModifierContainerDTOList ?? <ProductModifierContainerDTO>[])) {
        for (var element in (e.modifierSetContainerDTO?.modifierSetDetailsContainerDTOList ?? <ModifierSetDetailsContainerDTO>[])) {
          newLines.add(
              createDummyLineFromSet(element)
          );
        }
      }
      for (var element in childList) { // filtering lines based on original lines in trx
        for(var linePdt in newLines) {
          if(element.productId == linePdt.productId) {
            currentLines.add(element);
          }
        }
      }

      final qtyItemIndex = (level) * 2;
      var qtyLines = qtyItemsList.where((element) => element.level == qtyItemIndex).toList();

      if(childList.isEmpty) { // if new nested level is present & there is no nested levels in original lines.
        for(var linePdt in newLines) {
          for(var element in qtyLines) {
            if(element.productId == linePdt.productId) {
              currentLines.add(linePdt);
            }
          }
        }
      }

      var currentLinesCopy = [...currentLines];
      final removedLines = <TransactionLineDTO>[];

      if(currentLines.isNotEmpty) {
        for(var curr in currentLinesCopy) {
          bool isProductFound = false;
          for(var qtyItem in qtyLines) {
            if(qtyItem.productId == curr.productId) {
              isProductFound = true;
            }
          }

          if(!isProductFound) {// removing products from line if user removes a product.
            removedLines.add(curr);
            currentLines.removeWhere((element) => element.transactionLineId == curr.transactionLineId);
          }
        }

        for(int i = 0; i < removedLines.length; i++) {
          currentLines.add(removedLines[i].copyWith(quantity: 0));
        }

        for (var item in qtyLines) {
          var items = currentLines.where((element) => element.productId == item.productId).toList();
          if(items.isEmpty) { // new product
            for(int i = 0; i < item.quantity; i++) {
              currentLines.add(
                  TransactionLineDTO(lineStatusId: -1, processedForLoyalty: false, isActive: true,
                      externalSourceReference: null, systemReference: null, comboProductId: -1, modifierSetId: item.modifierSetId, modifierSetDetailId: item.modifierSetDetailId,
                      isParentModifier: false, isFreeModifier: false, isNonChargeable: false, orderTypeId: -1, isReversed: false,
                      viewGroupingNumber: -1, productSegmentId: -1, onPrintHold: false, is9999Product: false, isCrossSellProduct: false, isUpsellProduct: false,
                      tagNumber: null, accountId: -1, taxName: "", transactionProfileId: -1, priceType: '', basePrice: -1, lineNumber: -1, transactionLineId: -1,
                      categoryId: -1, transactionId: -1, additionalLineInformation: '', discountIdentifier: '', discountIndicator: "", productId: item.productId, quantity: 1,
                      amount: -1, netAmount: -1, discountedAmountPreTax: -1, taxPercentage: -1, taxId: -1, parentTransactionLineId: -1, remarks: '', promotionId: -1, receiptPrinted: false, gamePlayId: -1, kdsSent: false,
                      isWaiverSignRequired: false, originalLineId: -1, synchStatus: false, siteId: 0, masterEntityId: -1, membershipId: -1, isNetAmountChanged: false,
                      membershipRewardsId: -1, isChanged: true, isAmountChanged: false, isChangedRecursive: true, productName: item.productName, creationDate: '0001-01-01T00:00:00', lastUpdateDate: '0001-01-01T00:00:00',
                      transactionLineDTOList: [], transactionAccountDTOList: [], transactionLineKDSOrderEntryMappingDTOList: [], transactionTaxLineDTOList: [])
              );
            }
          } else { // quantity changed
            final updatedCount = item.quantity;
            final currentCount = items.length;
            if(updatedCount > currentCount) { // adding new products for (updatedCount - currentCount) quantity
              for(int i = 0; i < (updatedCount - currentCount); i++) {
                currentLines.add(TransactionLineDTO(lineStatusId: -1, processedForLoyalty: false, isActive: true,
                    externalSourceReference: null, systemReference: null, comboProductId: -1, modifierSetId: item.modifierSetId, modifierSetDetailId: item.modifierSetDetailId,
                    isParentModifier: false, isFreeModifier: false, isNonChargeable: false, orderTypeId: -1, isReversed: false,
                    viewGroupingNumber: -1, productSegmentId: -1, onPrintHold: false, is9999Product: false, isCrossSellProduct: false, isUpsellProduct: false,
                    tagNumber: null, accountId: -1, taxName: "", transactionProfileId: -1, priceType: '', basePrice: -1, lineNumber: -1, transactionLineId: -1,
                    categoryId: -1, transactionId: -1, additionalLineInformation: '', discountIdentifier: '', discountIndicator: "", productId: item.productId, quantity: 1,
                    amount: -1, netAmount: -1, discountedAmountPreTax: -1, taxPercentage: -1, taxId: -1, parentTransactionLineId: -1, remarks: '', promotionId: -1, receiptPrinted: false, gamePlayId: -1, kdsSent: false,
                    isWaiverSignRequired: false, originalLineId: -1, synchStatus: false, siteId: 0, masterEntityId: -1, membershipId: -1, isNetAmountChanged: false,
                    membershipRewardsId: -1, isChanged: true, isAmountChanged: false, isChangedRecursive: true, productName: item.productName, creationDate: '0001-01-01T00:00:00', lastUpdateDate: '0001-01-01T00:00:00',
                    transactionLineDTOList: [], transactionAccountDTOList: [], transactionLineKDSOrderEntryMappingDTOList: [], transactionTaxLineDTOList: []));
              }
            } else if(updatedCount < currentCount) { // removing products by setting quantity zero for (updatedCount) items
              currentLines.removeWhere((element) => element.productId == item.productId);
              for(int i = (currentCount - 1); i > (updatedCount - 1); i--) {
                items[i] = items[i].copyWith(quantity: 0);
              }
              currentLines.addAll(items);
            }
          }
        }
        currentProduct.transactionLineDTOList = currentLines;
        for (var element in currentProduct.transactionLineDTOList) {
          updateLines(level + 1, maxLevel, element, element.transactionLineDTOList, qtyItemsList);
        }
      }
    }
  }

  TransactionLineDTO createDummyLineFromSet(ModifierSetDetailsContainerDTO model) {
    return TransactionLineDTO(lineStatusId: -1, processedForLoyalty: false, isActive: true,
        externalSourceReference: null, systemReference: null, comboProductId: -1, modifierSetId: model.modifierSetId, modifierSetDetailId: model.modifierSetDetailId,
        isParentModifier: false, isFreeModifier: false, isNonChargeable: false, orderTypeId: -1, isReversed: false,
        viewGroupingNumber: -1, productSegmentId: -1, onPrintHold: false, is9999Product: false, isCrossSellProduct: false, isUpsellProduct: false,
        tagNumber: null, accountId: -1, taxName: "", transactionProfileId: -1, priceType: '', basePrice: -1, lineNumber: -1, transactionLineId: -1,
        categoryId: -1, transactionId: -1, additionalLineInformation: '', discountIdentifier: '', productId: model.modifierProductId, quantity: 1,
        amount: -1, netAmount: -1, discountedAmountPreTax: -1, taxPercentage: -1, taxId: -1,
        parentTransactionLineId: -1, remarks: '', promotionId: -1, receiptPrinted: false, gamePlayId: -1, kdsSent: false,
        isWaiverSignRequired: false, originalLineId: -1, synchStatus: false, siteId: 0, masterEntityId: -1, membershipId: -1,
        membershipRewardsId: -1, isChanged: true, isAmountChanged: false, isChangedRecursive: true, productName: "", creationDate: '0001-01-01T00:00:00', lastUpdateDate: '0001-01-01T00:00:00',
        transactionLineDTOList: [], transactionAccountDTOList: [], transactionLineKDSOrderEntryMappingDTOList: [], transactionTaxLineDTOList: []);
  }



  _showCardProductDialog({ProductContainerDTO? productPriceContainer,int? quantity,String? event}){
    if((productPriceContainer?.cardCount??-1) > 1) {// split card: true
      if( event == 'DETAILS_DIALOG'){
        if((quantity??1) > (productPriceContainer?.cardCount??-1)){// split card: true
          _notificationBar.showMessage('${MessagesProvider.get('Max cards')} ${(productPriceContainer?.cardCount??-1)}', AppColors.notoficationBGLightYellowColor);
        }else{
          _showCardFunctionalityDialog(isSplitCard:(productPriceContainer?.cardCount??-1) >1,productPriceContainer:productPriceContainer!,quantity: quantity ,isEdit: false,isFullfill:false);
        }
      } else{
        showDialog(
            context: context,
            barrierDismissible: false,
            barrierColor:const Color(0x01000000),
            builder: (BuildContext context) {
              return   NumberPad(isInitialRequired: true,initialIntValue: (productPriceContainer?.cardCount??1),title: '${MessagesProvider.get('Card Count')} (${MessagesProvider.get('Max')}: ${productPriceContainer?.cardCount??1})',onOkPressed:  (value) async {
                if(int.parse(value.toString()) > (productPriceContainer?.cardCount??-1)){
                  _notificationBar.showMessage('${MessagesProvider.get('Max cards')} ${(productPriceContainer?.cardCount??-1)}', AppColors.notoficationBGLightYellowColor);
                }else{
                  _showCardFunctionalityDialog(isSplitCard:(productPriceContainer?.cardCount??-1) >1,productPriceContainer:productPriceContainer!,quantity: int.parse(value.toString()) ,isEdit: false,isFullfill:false);
                }
              },);
            });
      }
    } else if (productPriceContainer?.verifiedCustomerOnly == "Y") {
      _verifiedCustomerOnly(productPriceContainer!, quantity??1);
    } else if (productPriceContainer?.trxRemarksMandatory == "Y") {
      _showRemarksMandatoryDialog(
          productPriceContainer?.productName?? "",
          productPriceContainer!, quantity??1,
          isCardProduct: true,
          onRemarksInputCallback: (String? remarks) {
            _showCardFunctionalityDialog(
                isSplitCard:false,
                productPriceContainer:productPriceContainer,
                quantity: quantity,
                isEdit: false,
                isFullfill:false,
                remarks: remarks);
          });
    } else {
      _showCardFunctionalityDialog(isSplitCard:false,productPriceContainer:productPriceContainer!,quantity: quantity,isEdit: false,isFullfill:false );
    }
  }

  Future<void> _showFutureCardDatedDialog({String? lineDate, ProductContainerDTO? productPriceContainer,int? quantity,String? event }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
      SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
        return Dialog(
          child: WillPopScope(
            onWillPop: () async => false,
            child: SizedBox(
              height: 220,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: 8,),
                  Text(MessagesProvider.get("confirm").toUpperCase(),style: theme.heading2,),
                  const Divider(thickness: 1,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25,8,25,8),
                    child: Text(MessagesProvider.get("This is for future date, do you want to issue card now?"), style: theme.title2,),
                  ),
                  const Divider(thickness: 1,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 48,
                        width: 100,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8), // <-- Radius
                                ),
                                backgroundColor:
                                theme.button1BG1),
                            onPressed: () {
                              Navigator.pop(context);
                              loader.showLoaderDialog(context, MessagesProvider.get("Adding product to the transaction..."));
                              _addProductToTransaction(
                                productPriceContainer?.productId??-1,
                                quantity??1,
                                lineDate:lineDate,
                              );
                            },
                            child: Text(
                                MessagesProvider.get("no").toUpperCase(),
                                style:  theme.heading5!
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 48,
                        width: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(8), // <-- Radius
                              ),
                              backgroundColor:theme.button2BG1
                          ),
                          onPressed: ()  {
                            Navigator.pop(context);
                            _showCardProductDialog(productPriceContainer: productPriceContainer, quantity: quantity, event:event);
                          },
                          child: Text(
                            MessagesProvider.get("Yes").toUpperCase(),
                            style: theme.headingLight5!.copyWith(color: Colors.white),

                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5,)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showUpsellDialog(GridItem productMenuItem, List<UpsellProductModel> upsellProducts, int quantity) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
          return UpsellDialog(productMenuItem.title, upsellProducts, (UpsellProductModel selectedProduct) async {
            _addProductToTransaction(
              selectedProduct.upsellOffersContainerDTO.offerProductId,
              quantity,
            );
          }, () async {
            // on cancel
            _addProductToTransaction(
                (productMenuItem.dataObject as ProductContainerDTO).productId, quantity);
          });
        });
  }

  void showCrossSellDialog(GridItem productMenuItem, List<CrossSellProductModel> crossSellProducts) {
    // As per discussion with Raghu and Raja on 16 Feb, only 1 cross sell item can be purchased with product
    // If user wants more items, he has to repeat item from transaction line.
    int quantity = 1;
    print("#################################################################### loading");

    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
          return CrossSellDialog(productMenuItem.title, crossSellProducts,
              (CrossSellProductModel selectedProduct) async {
            print("####################################################################");
            print("------ cross selectedProduct $selectedProduct");
            /*widget._productSelectCallback((productMenuItem.dataObject as ProductMenuPanelContentContainerDTO).productId,
                quantity, "DETAILS_DIALOG");*/
            loader.showLoaderDialog(context, MessagesProvider.get("Adding product to the transaction..."));
            _addProductToTransaction((selectedProduct
                .crossSellProductsContainerDTO
                .salesOfferGroupContainerDTO!
                .saleGroupProductMapDTOContainerList?[0]
                .productId ?? 0), quantity);
          }, () {
                print("####################################################################");
                print("-------- cross sell cancelled");
            // on cancel
            /*widget._productSelectCallback((productMenuItem.dataObject as ProductMenuPanelContentContainerDTO).productId,
                quantity, "DETAILS_DIALOG");*/
          });
        });
  }

  _verifiedCustomerOnly(ProductContainerDTO productPriceContainer, int quantity) {
    if (Provider.of<SelectedCustomer>(context, listen: false).selectedData == null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return CustomerChangeAlert(onCancelTapped: () {
            _notificationBar.showMessage(
                MessagesProvider.get("Requires verified customer (&1)", [productPriceContainer.productName]),
                AppColors.notoficationBGLightYellowColor);
          }, onCustomerSet: (CustomerData? customerData) {
            Future.delayed(const Duration(milliseconds: 800), () {
              if(customerData?.verified == true) {
                _showCardFunctionalityDialog(
                    isSplitCard:false,
                    productPriceContainer: productPriceContainer,
                    quantity: quantity,
                    isEdit: false,
                    isFullfill:false);
              } else {
                _showVerifiedCustomerOnlyDialog(
                    productPriceContainer,
                    quantity);
              }
            });
          },
            onValidationError: (msg) {
              _notificationBar.showMessage(msg ?? '', AppColors.notoficationBGLightYellowColor);
            },
            title: MessagesProvider.get("Product: &1 is available for Verified Customers only", [productPriceContainer.productName]),);
        },
      );
    } else {
      if(Provider.of<SelectedCustomer>(context, listen: false).selectedData?.verified == true) {
        _showCardFunctionalityDialog(
            isSplitCard: false,
            productPriceContainer: productPriceContainer,
            quantity: quantity,
            isEdit: false,
            isFullfill:false);
      } else {
        _showVerifiedCustomerOnlyDialog(productPriceContainer, quantity);
      }
    }
  }

  _showVerifiedCustomerOnlyDialog(ProductContainerDTO productPriceContainer, int quantity) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
          return VerifiedCustomerOnlyDialog(
            productName: productPriceContainer.productName,
            onYesTapped: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomerDetailsPage(source: 0,),
                ),
              ).then((value) {
                //TODO Valid if the customer is verified and then proceed.
                //Uncomment the below lines if the customer is being verified in CustomerDetailsPage.

                /*if(customerData?.verified == true) {
                  _showCardFunctionalityDialog(
                      isSplitCard:false,
                      productPriceContainer: productPriceContainer,
                      quantity: quantity,
                      isEdit: false );
                } else {
                  _showVerifiedCustomerOnlyDialog(
                      productPriceContainer,
                      quantity);

                      //OR
                  _notificationBar.showMessage(
                    MessagesProvider.get("Product: &1 is available for Verified Customers only", [productPriceContainer.productName]),
                    AppColors.notoficationBGLightYellowColor);
              });
                }*/

              _notificationBar.showMessage(
                  MessagesProvider.get("Product: &1 is available for Verified Customers only", [productPriceContainer.productName]),
                AppColors.notoficationBGLightYellowColor);
              });
            },
            onNoTapped: () {
              _notificationBar.showMessage(
                  MessagesProvider.get("Product: &1 is available for Verified Customers only", [productPriceContainer.productName]),
                  AppColors.notoficationBGLightYellowColor);
            },
          );
        });
  }

  _onRegisteredCustomerOnlyProductSelected(ProductContainerDTO productPriceContainer, int quantity) {
    if (Provider.of<SelectedCustomer>(context, listen: false).selectedData != null) {
      _showCardFunctionalityDialog(isSplitCard: false, productPriceContainer: productPriceContainer, quantity: quantity, isEdit: false,isFullfill:false);
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return CustomerChangeAlert(onCancelTapped: () {
            _notificationBar.showMessage(
                MessagesProvider.get("Product: &1 is available for Registered Customers only", [productPriceContainer.productName]),
                AppColors.notoficationBGLightYellowColor);
          }, onCustomerSet: (CustomerData? customerData) {
            Future.delayed(const Duration(milliseconds: 800), () {
              _showCardFunctionalityDialog(
                isSplitCard: false,
                productPriceContainer: productPriceContainer,
                quantity: quantity,
                isEdit: false,
                  isFullfill:false
              );
            });
          },
            onValidationError: (msg) {
              _notificationBar.showMessage(msg ?? '', AppColors.notoficationBGLightYellowColor);
            },
            title: MessagesProvider.get("Requires registered customer (&1)", [productPriceContainer.productName]),);
        },
      );
    }
  }

  _onInvokeCustomerRegistrationProductSelect(ProductContainerDTO productPriceContainer, int quantity) async {
    if (Provider.of<SelectedCustomer>(context, listen: false).selectedData != null) {
      _showCardFunctionalityDialog(
        isSplitCard: false,
        productPriceContainer: productPriceContainer,
        quantity: quantity,
        isEdit: false,
          isFullfill:false
      );
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return CustomerChangeAlert(onCancelTapped: () {
            _notificationBar.showMessage(
                MessagesProvider.get("Product: &1 is available for Registered Customers only", [productPriceContainer.productName]),
                AppColors.notoficationBGLightYellowColor);
          }, onCustomerSet: (CustomerData? customerData) {
            Future.delayed(const Duration(milliseconds: 800), () {
              _showCardFunctionalityDialog(
                isSplitCard: false,
                productPriceContainer: productPriceContainer,
                quantity: quantity,
                isEdit: false,
                  isFullfill:false
              );
            });
          },
            onValidationError: (msg) {
              _notificationBar.showMessage(msg ?? '', AppColors.notoficationBGLightYellowColor);
            },
            title: MessagesProvider.get("Requires registered customer (&1)", [productPriceContainer.productName]),);
        },
      );
    }
  }

  _showCardFunctionalityDialog({int?approverID,required bool isSplitCard,required ProductContainerDTO productPriceContainer,required int? quantity,double? variableAmount,required bool isEdit,required bool isFullfill, List<TransactionLineDTO>? transactionLines, String? remarks, List<TransactionLineDTO>? fullFillTransactionLines}){
    transactionCubit = context.read<TransactionCubit>();
    transactionCubit?.setIsCardFunctionalityDialogShown(true);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CardFunctionalityDialog(
              approverID:approverID,
              productContainerDto: productPriceContainer,
              cardType: productPriceContainer.productType,
              selectedSeatName: transactionCubit?.state.selectedSeatName,
              seatNumber: transactionCubit?.state.selectedSeat,
              qnty: quantity ?? 1,
              isEdit: isEdit,
              isSplitCard:isSplitCard,
              isFullfill:isFullfill,
              transactionLines: transactionLines,
              variableAmount: productPriceContainer.productType == "VARIABLECARD" ? variableAmount : 0,
              productName: productPriceContainer.productName,
              remarks: remarks??'',
              onSuccess: (transactionData) {
                transactionCubit?.setIsCardFunctionalityDialogShown(false);
                transactionCubit?.onTransactionDataUpdated(transactionData);
                _loadTransactionFunctionItems(isForTransactionHeaderFunctions: true);
              },
              onFullfillProduct:(List<CardsDataModel> listOfAppliedCards){
                loader.showLoaderDialog(context, MessagesProvider.get("Ordering transaction lines..."));
                 _tobefulFillTransactionList =  fullFillTransactionLines??[];
                 final List<TransactionLineDTO> transList = fullFillTransactionLines??[];
                  for(int i=0;i<transList.length;i++){
                  for(CardsDataModel cardData in listOfAppliedCards){
                    if(transList[i].productName.toLowerCase() == (cardData.productName??'').toLowerCase()){

                      _tobefulFillTransactionList[i] =  _tobefulFillTransactionList[i].copyWith(transactionAccountDTOList: [(_tobefulFillTransactionList[i].transactionAccountDTOList??[])[0].copyWith(tagNumber: cardData.tagNumber??'')]);
                      _tobefulFillTransactionList[i] =  _tobefulFillTransactionList[i].copyWith(tagNumber: cardData.tagNumber??'');

                    }
                  }
                }

                transactionCubit?.orderTransactionLines(_tobefulFillTransactionList,approverID:approverID).then((isSuccess){
                  if(isSuccess){
                    print("success");
                  }
                });
              },
              showNotification: (String? message) {
                _notificationBar.showMessage(message ?? '', AppColors.notificationBGLightBlueColor);
              });
        });
  }

  Future<void> _addProductToTransaction(int productId, int quantity, {double? userOverriddenPrice, String? lineDate, String? approvedBy}) async {
    Log.printMethodStart("_addProductToTransaction()", "Sales Screen", "onTapItem");
    ProductContainerDTO? productPriceContainer = await _productMenuDataBL.getProductDetails(productId);

    final TransactionCubit transactionCubit = context.read<TransactionCubit>();
    final status = transactionCubit.state.transactionData?.transactionStatus;
    if(status == 'ABANDONED' || status == 'CANCELLED' || status == 'PENDING_CLOSE' || status == 'CLOSED'
        || status == 'REOPENED' || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "ADD LINE"]),
          AppColors.notoficationBGLightYellowColor);
    }else{
    try {
      TransactionResponse? transactionResponse = await _transactionDataBl.addProductToLine(
          seatName: transactionCubit.state.selectedSeatName,
          seatNumber: transactionCubit.state.selectedSeat,
          productId: (productPriceContainer?.productId)!,
          quantity: quantity,
          lineDate:lineDate,
          userOverriddenPrice: userOverriddenPrice,
          approvedBy : approvedBy);
      if (transactionResponse.exception != null) {
        if (!mounted) return;
        loader.hideLoaderDialog(context);
        _notificationBar.showMessage(
            MessagesProvider.get("Adding the product to the transaction failed"),
            AppColors.notificationBGRedColor);
      } else {
        if (!mounted) return;
        context.read<TransactionCubit>().onTransactionDataUpdated(transactionResponse.data);
        loader.hideLoaderDialog(context);
        String notification = sprintf(MessagesProvider.get("Newly added product %s, Quantity: %d"), [productPriceContainer?.productName, quantity]);
        Log.printMethodReturn("_addProductToTransaction() - $notification", "Sales Screen", "onTapItem");
        _notificationBar.showMessage(notification, AppColors.notificationBGLightBlueColor);
      }
      Log.printMethodEnd("_addProductToTransaction()", "Sales Screen", "onTapItem");
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      if (!mounted) return;
      loader.hideLoaderDialog(context);
      _notificationBar.showMessage(
          errorString.toString(), AppColors.notoficationBGLightYellowColor);
    } catch (error) {
      // var errorString = error.toString;
      if (!mounted) return;
      loader.hideLoaderDialog(context);
      _notificationBar.showMessage(
          MessagesProvider.get("Something went wrong. Error: &1 ", [error.toString()]), AppColors.notoficationBGLightYellowColor);
    }
    }
  }

  Future<void> _add9999ToTransaction(int productId, String description, double price, int printerId, String remarks, int quantity, int selSeatNo, String seatName,
      {double? userOverriddenPrice, }) async {
    ProductContainerDTO? productPriceContainer = await _productMenuDataBL.getProductDetails(productId);

    final TransactionCubit transactionCubit = context.read<TransactionCubit>();
    final status = transactionCubit.state.transactionData?.transactionStatus;
    if(status == 'ABANDONED' || status == 'CANCELLED' || status == 'PENDING_CLOSE' || status == 'CLOSED'
        || status == 'REOPENED' || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "ADD LINE"]),
          AppColors.notoficationBGLightYellowColor);
    } else {
      try {
        TransactionResponse? transactionResponse = await _transactionDataBl.add9999ProductToLine(
            productId: productId,
            description: description,
            price: price,
            printerId: printerId,
            remarks: remarks,
            seatNo: selSeatNo,
          seatName: seatName,
        );
        if (transactionResponse.exception != null) {if (!mounted) return;
          loader.hideLoaderDialog(context);
          _notificationBar.showMessage(
              MessagesProvider.get("Adding the product to the transaction failed"),
              AppColors.notificationBGRedColor);
        } else {
          if (!mounted) return;
          context.read<TransactionCubit>().onTransactionDataUpdated(transactionResponse.data);
          loader.hideLoaderDialog(context);
          String notification = sprintf(MessagesProvider.get("Newly added product %s, Quantity: %d"), [productPriceContainer?.productName, quantity]);
          _notificationBar.showMessage(notification, AppColors.notificationBGLightBlueColor);
        }
      } on DioError catch (error) {
        var errorString = error.response?.data['data'] as String?;
        if (!mounted) return;
        loader.hideLoaderDialog(context);
        _notificationBar.showMessage(
            errorString.toString(), AppColors.notoficationBGLightYellowColor);
      } catch (error) {
        // var errorString = error.toString;
        if (!mounted) return;
        loader.hideLoaderDialog(context);
        _notificationBar.showMessage(
            MessagesProvider.get("Something went wrong. Error: &1 ", [error.toString()]), AppColors.notoficationBGLightYellowColor);
      }
    }
  }

  Future<void> _addModifier(List<AddModifierProductRequest> addModifierProducts) async {
    Log.printMethodStart("_addModifier()", "Sales Screen -> Customize", "OK");
    final TransactionCubit transactionCubit = context.read<TransactionCubit>();
    final status = transactionCubit.state.transactionData?.transactionStatus;
    if(status == 'ABANDONED' || status == 'CANCELLED' || status == 'PENDING_CLOSE' || status == 'CLOSED'
        || status == 'REOPENED' || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "ADD LINE"]),
          AppColors.notoficationBGLightYellowColor);
    }else {
      try {
        loader.showLoaderDialog(
            context, MessagesProvider.get("Adding product to the transaction..."));
        TransactionResponse? transactionResponse = await _transactionDataBl
            .addModifierProductsToLine(addModifierProducts);
        if (transactionResponse.exception != null) {
          if (!mounted) return;
          loader.hideLoaderDialog(context);
        } else {
          if (!mounted) return;
          context.read<TransactionCubit>().onTransactionDataUpdated(
              transactionResponse.data);
          _loadTransactionFunctionItems(isForTransactionHeaderFunctions: true);
          loader.hideLoaderDialog(context);
          String notification = sprintf(
              MessagesProvider.get("Newly added product %s, Quantity: %d"),
              [
                addModifierProducts[0].productName,
                addModifierProducts[0].quantity.toInt()
              ]);
          Log.printMethodReturn("_addModifier() - $notification", "Sales Screen -> Customize", "OK");
          _notificationBar.showMessage(
              notification, AppColors.notificationBGLightBlueColor);
        }
        Log.printMethodEnd("_addModifier()", "Sales Screen -> Customize", "OK");
      } on DioError catch (error) {
        var errorString = error.response?.data['data'] as String?;
        loader.hideLoaderDialog(context);
        _notificationBar.showMessage(
            errorString.toString(), AppColors.notoficationBGLightYellowColor);
      }
    }
  }

  Future<void> _editModifier(List<TransactionLineDTO> transactionLines) async {
    Log.printMethodStart("_editModifier()", "Sales Screen -> Customize", "OK");
    final status = context.read<TransactionCubit>().state.transactionData?.transactionStatus;
    if(status == 'ABANDONED' || status == 'CANCELLED' || status == 'PENDING_CLOSE' || status == 'CLOSED'
        || status == 'REOPENED' || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "EDIT LINE"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    try {
      loader.showLoaderDialog(context, MessagesProvider.get("Adding product to the transaction..."));
      TransactionResponse? transactionResponse =
          await _transactionDataBl.updateProductToLine(transactionLines);
      if (transactionResponse.exception != null) {
        if (!mounted) return;
        loader.hideLoaderDialog(context);
      } else {
        if (!mounted) return;
        context.read<TransactionCubit>().onTransactionDataUpdated(transactionResponse.data);
        _loadTransactionFunctionItems(isForTransactionHeaderFunctions: true);
        loader.hideLoaderDialog(context);
        String notification = MessagesProvider.get("Updated the details successfully for product &1", [(transactionLines[0].productName)]);
        Log.printMethodReturn("_editModifier() - $notification", "Sales Screen -> Customize", "OK");
        _notificationBar.showMessage(
            notification, AppColors.notificationBGLightBlueColor);
      }
      Log.printMethodEnd("_editModifier()", "Sales Screen -> Customize", "OK");
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      loader.hideLoaderDialog(context);
      _notificationBar.showMessage(
          errorString.toString(), AppColors.notoficationBGLightYellowColor);
    }
  }

  void _showFeatureNotImplementedDialog(String title) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return FeatureNotImplementedView(title);
        });
  }

  Future<bool> _isSeatBased() async {
    Log.printMethodStart('_isSeatBased()','SalesScreen','Init');
    var execContextBL = await ExecutionContextBuilder.build();
    var sysExecContext = execContextBL.getExecutionContext();
    masterDataBLContract = await MasterDataBuilder.build(sysExecContext!);
    Log.printMethodReturn('_isSeatBased()','SalesScreen','Init');
    bool isSeatedEnabled = false;
    bool showOrderCaptureForAllTransactions = false;
    bool showOrderDetailsWhileInitiatingOrder = false;
    var enableSeatBasedOrderingVal = await masterDataBLContract?.getDefaultValuesByName(defaultValueName: "ENABLE_SEAT_BASED_ORDERING");
    var showOrderCaptureForTrxVal = await masterDataBLContract?.getDefaultValuesByName(defaultValueName: "SHOW_ORDER_CAPTURE_FOR_ALL_TRANSACTIONS");
    var showOrderDetailsVal = await masterDataBLContract?.getDefaultValuesByName(defaultValueName: "SHOW_ORDER_DETAILS_WHILE_INITIATING_ORDER");
    isSeatedEnabled = enableSeatBasedOrderingVal == "Y";
    showOrderCaptureForAllTransactions = showOrderCaptureForTrxVal == "Y";
    showOrderDetailsWhileInitiatingOrder = showOrderDetailsVal == "Y";
    if(mounted) {
      context.read<TransactionCubit>().isSeatBased(
          isSeatedEnabled,
          showOrderDetailsWhileInitiatingOrder && showOrderCaptureForAllTransactions
      );
    }
    isSeatBasedDetermined = true;
    Log.printMethodEnd('_isSeatBased()','SalesScreen','Init');
    return Future.value(isSeatedEnabled);
  }

  Future<void> _onNewTransactionSelected({int? productId, int? quantity, String? event,int? approverID, GridItem? panelItem}) async {
    clearNotificationBar();
    final TransactionCubit transactionCubit = context.read<TransactionCubit>();
    _hasGoneToPaymentAfterComplete = false;

    if(isSeatBasedDetermined) {
      ///
      /// Un-linking the added customer
      ///
      if (context.read<SelectedCustomer>().selectedData != null) {
        context.read<SelectedCustomer>().updateData(null);
      }
      ///
      /// Un-linking the added card
      ///
      if(context.read<SelectedCardDetails>().selectedData != null) {
        context.read<SelectedCardDetails>().updateData(null);
        context.read<SelectedCardDetails>().updateCardLength(null);
      }

      if (transactionCubit.state.isSeatBased) {
        if (transactionCubit.state.showOrderDetailsWhileInitiatingOrder) {
          showGeneralDialog(
              context: context,
              barrierDismissible: false,
              barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
              barrierColor: Colors.black45,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
                return TransactionOrderDetailsDialog(
                    approverID:approverID,
                  showNotification: (String? value, Color color) {
                    _notificationBar.showMessage(value ?? '', color);
                  },
                  onComplete: () {
                    if ((event??'NORMAL').contains("details_dialog")) {
                      onInfoClicked(panelItem);
                    } else if (productId != null) {
                      Future.microtask(() => _onProductSelected(productId, quantity!, event!));
                    }
                  },
                  transactionCubit: transactionCubit,
                  isUpdate: false,
                );
              });
        } else {
          _initiateTransaction(1, productId: productId, quantity: quantity, event: event, approverID:approverID);
        }
      } else {
        _initiateTransaction(0, productId: productId, quantity: quantity, event: event,approverID:approverID);
      }
    }
  }

  Future<void> _initiateTransaction(int guestCount, {int? productId, int? quantity, String? event,int?approverID}) async {
    final TransactionCubit transactionCubit = context.read<TransactionCubit>();
    final response = await transactionCubit.initiateTransaction(
        approverID:approverID,
        guestCount: guestCount,
        guestName: "",
        guestContact: "",
        transactionIdentifier: "");
    if (response?.data?.transactionId != 0) {
      if (productId != null) {
        Future.delayed(const Duration(milliseconds: 100), /// delay added to overcome bloc delay in closing loader.
            () => _onProductSelected(productId, quantity!, event!));
      }
    }
  }

  Future<void> _getTransactionFunctions() async {
    loader.showLoaderDialog(context, MessagesProvider.get("Please wait until we fetch the data.."));
    var executionContextBL = await ExecutionContextBuilder.build();
    var executionContext = executionContextBL.getExecutionContext();
    _transactionDataBl = await TransactionDataBuilder.build(executionContext!); // don't comment/Remove this line cause this is getting initialized , is getting used everywhere...
    _masterDataBl = await MasterDataBuilder.build(executionContext);
    currency = await _masterDataBl.getDefaultValuesByName(defaultValueName: 'CURRENCY_SYMBOL') ?? '';
    amountFmt = await _masterDataBl.getDefaultValuesByName(defaultValueName: 'AMOUNT_FORMAT') ?? '#,##0.00';
    _taskTypeContainerList = await _masterDataBl.getTaskTypeContainerList();
    for (TaskTypeContainerDto taskType in _taskTypeContainerList) {
      if((taskType.category??'').toLowerCase() == "TRANSACTION HEADER FUNCTION".toLowerCase()){
        _transactionHeaderFunctions.add(taskType);
      }
      if((taskType.category??'').toLowerCase() == "TRANSACTION LINE FUNCTION".toLowerCase()){
        _transactionLineFunctions.add(taskType);
      }
    }
    _transactionHeaderFunctions.sort((first, second) => (first.sortOrder??-1).compareTo(second.sortOrder??-1));
    _transactionLineFunctions.sort((first, second) => (first.sortOrder??-1).compareTo(second.sortOrder??-1));

    /**
     * Creating Transaction Line and Header Functions for Light Theme.
     */
    transactionHeaderIconicLightFunctions.add(TransactionFunctionDTO(
          0, "HELP", "N", "Y", "Help", "TRANSACTION FUNCTION", isDarkTheme: false));
      _transactionHeaderFunctions.forEach((headerFunction) {
        if (headerFunction.displayInPos == "Y") {
          ThemeItem? isIconicTransactionFunction = TransactionFunctionDTO.isIconicTransactionFunction(headerFunction.taskTypeName, headerFunction.category, false);
          if (isIconicTransactionFunction == null) {
            transactionHeaderLightFunctions.add(TransactionFunctionDTO(
                headerFunction.taskTypeId??-1,
                headerFunction.taskType??'',
                headerFunction.requiresManagerApproval??"N",
                headerFunction.displayInPos??"Y",
                headerFunction.taskTypeName??"",
                headerFunction.category??'',
                isDarkTheme: false));
          } else {
            transactionHeaderIconicLightFunctions.add(TransactionFunctionDTO(
                headerFunction.taskTypeId??-1,
                headerFunction.taskType??'',
                headerFunction.requiresManagerApproval??'N',
                headerFunction.displayInPos??'Y',
                headerFunction.taskTypeName??'',
                headerFunction.category??'',
                isDarkTheme: false
            ));
          }
        }
      });

      transactionLineIconicLightFunctions.add(TransactionFunctionDTO(
          0, "HELP", "N", "Y", "Help", "TRANSACTION FUNCTION", isDarkTheme: false));
      _transactionLineFunctions.forEach((lineFunction) {
        if (lineFunction.displayInPos == "Y") {
          ThemeItem? isIconicTransactionFunction = TransactionFunctionDTO.isIconicTransactionFunction(lineFunction.taskTypeName, lineFunction.category, false);
          if (isIconicTransactionFunction == null) {
            transactionLineLightFunctions.add(TransactionFunctionDTO(
                lineFunction.taskTypeId??-1,
                lineFunction.taskType??'',
                lineFunction.requiresManagerApproval??'N',
                lineFunction.displayInPos??'Y',
                lineFunction.taskTypeName??'',
                lineFunction.category??'',
                isDarkTheme: false));
          } else {
            transactionLineIconicLightFunctions.add(TransactionFunctionDTO(
                lineFunction.taskTypeId??-1,
                lineFunction.taskType??'',
                lineFunction.requiresManagerApproval??'N',
                lineFunction.displayInPos??'Y',
                lineFunction.taskTypeName??'',
                lineFunction.category??'',
                isDarkTheme: false));
          }
        }
      });

    /**
     * Creating Transaction Line and Header Functions for Dark Theme.
     */
    transactionHeaderIconicDarkFunctions.add(TransactionFunctionDTO(
        0, "HELP", "N", "Y", "Help", "TRANSACTION FUNCTION", isDarkTheme: true));
    _transactionHeaderFunctions.forEach((headerFunction) {
      if (headerFunction.displayInPos == "Y") {
        ThemeItem? isIconicTransactionFunction = TransactionFunctionDTO.isIconicTransactionFunction(headerFunction.taskTypeName, headerFunction.category, true);
        if (isIconicTransactionFunction == null) {
          transactionHeaderDarkFunctions.add(TransactionFunctionDTO(
              headerFunction.taskTypeId??-1,
              headerFunction.taskType??'',
              headerFunction.requiresManagerApproval??"N",
              headerFunction.displayInPos??"Y",
              headerFunction.taskTypeName??"",
              headerFunction.category??'',
              isDarkTheme: true));
        } else {
          transactionHeaderIconicDarkFunctions.add(TransactionFunctionDTO(
              headerFunction.taskTypeId??-1,
              headerFunction.taskType??'',
              headerFunction.requiresManagerApproval??'N',
              headerFunction.displayInPos??'Y',
              headerFunction.taskTypeName??'',
              headerFunction.category??'',
              isDarkTheme: true
          ));
        }
      }
    });

    transactionLineIconicDarkFunctions.add(TransactionFunctionDTO(
        0, "HELP", "N", "Y", "Help", "TRANSACTION FUNCTION", isDarkTheme: true));
    _transactionLineFunctions.forEach((lineFunction) {
      if (lineFunction.displayInPos == "Y") {
        ThemeItem? isIconicTransactionFunction = TransactionFunctionDTO.isIconicTransactionFunction(lineFunction.taskTypeName, lineFunction.category, true);
        if (isIconicTransactionFunction == null) {
          transactionLineDarkFunctions.add(TransactionFunctionDTO(
              lineFunction.taskTypeId??-1,
              lineFunction.taskType??'',
              lineFunction.requiresManagerApproval??'N',
              lineFunction.displayInPos??'Y',
              lineFunction.taskTypeName??'',
              lineFunction.category??'',
              isDarkTheme: true));
        } else {
          transactionLineIconicDarkFunctions.add(TransactionFunctionDTO(
              lineFunction.taskTypeId??-1,
              lineFunction.taskType??'',
              lineFunction.requiresManagerApproval??'N',
              lineFunction.displayInPos??'Y',
              lineFunction.taskTypeName??'',
              lineFunction.category??'',
              isDarkTheme: true));
        }
      }
    });

      _loadTransactionFunctionItems();
      if (!mounted) return;
      loader.hideLoaderDialog(context);
  }

  void loadDialog(Widget widget) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
          return widget;
        });
  }

  _showTransactionDiscountDialog(TransactionCubit transactionCubit,{int?approverID}) {
    clearNotificationBar();
    final status = transactionCubit.state.transactionData?.transactionStatus;
    if(status == 'CLOSED' || status == 'CANCELLED' || status == 'PENDING_CLOSE' || status == 'STARTED'
    || status == 'ABANDONED' || status == 'REOPENED' || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "DISCOUNTS"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    if (transactionCubit.state.transactionData != null) {
      if (transactionCubit.state.transactionData?.transactionStatus == "STARTED" &&
          transactionCubit.state.transactionData!.transactionLineDTOList.isEmpty) {
        ///
        /// Transaction has not been started, hence discounts operation not permitted .
        ///
        _notificationBar.showMessage(
          MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.",["STARTED","DISCOUNTS"]),
            AppColors.notoficationBGLightYellowColor);
      } else {
        if (transactionCubit.state.transactionData!.transactionLineDTOList.isNotEmpty) {
          bool atleaseOneProductIsNotSaved = false;
          for (var element in transactionCubit.state.transactionData!.transactionLineDTOList) {
            if (element.lineStatus == "INITIATED") {
              atleaseOneProductIsNotSaved = true;
            }
          }
          if (atleaseOneProductIsNotSaved) {
            ///
            /// At least one product in the transaction line is not saved.
            ///
            _notificationBar.showMessage(
              MessagesProvider.get("There are unsaved lines in transaction. Please click SAVE or SAVE AND HOLD before proceeding with apply discount."),
                AppColors.notoficationBGLightYellowColor);
          } else {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AddDiscountDialog(
                    approverID:approverID,
                    islineDiscount: false,
                    transactionNumber: transactionCubit.state.transactionData?.transactionId ?? 0,
                    showNotification: (String? value) {
                      _notificationBar.showMessage(value ?? '', AppColors.notificationBGLightBlueColor);
                    },
                  );
                });
          }
        } else {
          ///
          /// Transaction has not been started, hence discounts operation not permitted .
          ///
          _notificationBar.showMessage(
              MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.",["STARTED","DISCOUNTS"]),
              AppColors.notoficationBGLightYellowColor);
        }
      }
    } else {
      ///
      /// Transaction has not been initiated, hence showing a message in the bottom notification bar.
      ///
      _notificationBar.showMessage(MessagesProvider.get("Click on NEW button to proceed."),
          AppColors.notoficationBGLightYellowColor);
    }
  }

  _showTransactionLineDiscountDialog(transactionCubit, _selectedTransactionLinesGroup,{int? approverID}) {
    clearNotificationBar();
    final lineStatus = _selectedTransactionLinesGroup?.lineStatus;
    if(lineStatus == 'CANCELLED' || lineStatus == 'ABANDONED' || lineStatus == 'CLOSED' || lineStatus == 'INITIATED'
        || lineStatus == 'REVERSED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Selected transaction line(s) status is &1. &2 operation not permitted.", [lineStatus, "DISCOUNTS"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    if (transactionCubit?.state.transactionData != null) {
      if (transactionCubit?.state.transactionLinesGroupsBySeat != null) {
        if (transactionCubit.state.transactionData?.transactionStatus == "STARTED" &&
            transactionCubit.state.transactionData!.transactionLineDTOList.isEmpty) {
          ///
          /// Transaction has not been started, hence discounts operation not permitted .
          ///
          _notificationBar.showMessage(MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.",["STARTED","DISCOUNTS"]),
              AppColors.notoficationBGLightYellowColor);
        } else{
          if(transactionCubit.state.transactionData!.transactionLineDTOList.isNotEmpty ){
            bool atleaseOneProductIsNotSaved = false;
            for (var element in transactionCubit.state.transactionData!.transactionLineDTOList) {
              if(element.lineStatus == "INITIATED"){
                atleaseOneProductIsNotSaved = true;
              }
            }
            if(atleaseOneProductIsNotSaved){
              ///
              /// At least one product in the transaction line is not saved.
              ///
              _notificationBar.showMessage(MessagesProvider.get("There are unsaved lines in transaction. Please click SAVE or SAVE AND HOLD before proceeding with apply discount."),
                  AppColors.notoficationBGLightYellowColor);
            } else {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AddDiscountDialog(
                        islineDiscount: true,
                        transactionNumber: transactionCubit.state.transactionData?.transactionId ??0,
                        showNotification: (String? value) {
                          _loadTransactionFunctionItems(isForTransactionHeaderFunctions: true);
                          _notificationBar.showMessage(
                              value ?? '', AppColors.notificationBGLightBlueColor);
                        },
                        selectedTransactionLinesGroup: _selectedTransactionLinesGroup);
                  });
            }
          } else {
            ///
            /// Transaction has not been started, hence discounts operation not permitted .
            ///
            _notificationBar.showMessage(MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.",["STARTED","DISCOUNTS"]),
                AppColors.notoficationBGLightYellowColor);
          }
        }
      } else {
        ///
        /// Transaction has not been initiated, hence showing a message in the bottom notification bar.
        ///
        _notificationBar.showMessage(MessagesProvider.get("Click on NEW button to proceed."),
            AppColors.notoficationBGLightYellowColor);
      }
    } else {
      ///
      /// Transaction has not been initiated, hence showing a message in the bottom notification bar.
      ///
      _notificationBar.showMessage(MessagesProvider.get("Click on NEW button to proceed."),
          AppColors.notoficationBGLightYellowColor);
    }
  }

  void _onTransactionLineRemarksSelected({int?approverID}) async {
    clearNotificationBar();
    final TransactionCubit transactionCubit = context.read<TransactionCubit>();
    final lineStatus = _selectedTransactionLinesGroup?.lineStatus;
    if(lineStatus == 'CANCELLED' || lineStatus == 'PENDING_CLOSE' || lineStatus == 'REOPENED' || lineStatus == 'CLOSED'|| lineStatus == 'FULFILLED'
        || lineStatus == 'ABANDONED' || lineStatus == 'REVERSED' || lineStatus == 'REVERSE_INITIATED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Selected transaction line(s) status is &1. &2 operation not permitted.", [lineStatus, "LINE REMARKS"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    if (transactionCubit.state.transactionData != null && _selectedTransactionLinesGroup != null) {
      ///
      /// Entering remarks for the transaction line that has been selected.
      ///
      if ((_selectedTransactionLinesGroup?.transactionLines.length ?? 0) > 1) {
        ///Show the quantity dialog
        ///based on the quantity given extract the transaction line ids and pass it to the dialog.
        ///
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return ProductQuantityDialog(MessagesProvider.get("Line Quantity"), (quantity) async {
                if (int.parse(quantity) <= (_selectedTransactionLinesGroup?.transactionLines.length ?? 0)) {
                  List<TransactionLineDTO>? transactionLinesList =
                      _selectedTransactionLinesGroup?.transactionLines
                          .getRange(0, int.parse(quantity))
                          .toList();
                  List<int> transactionLinesIDs = [];
                  transactionLinesList?.forEach((transactionLine) {
                    transactionLinesIDs.add(transactionLine.transactionLineId);
                  });
                  _showRemarksDialog(transactionCubit, transactionLinesIDs,approverID:approverID);
                } else {
                  _notificationBar.showMessage(
                      MessagesProvider.get("Maximum quantity allowed is &1.", [_selectedTransactionLinesGroup?.transactionLines.length]),
                      AppColors.notoficationBGLightYellowColor);
                }
              });
            });
      } else {
        /// show the remarks dialog and pass on the transaction line id.
        ///
        List<TransactionLineDTO>? transactionLinesList =
            _selectedTransactionLinesGroup?.transactionLines;
        List<int> transactionLinesIDs = [];
        transactionLinesList?.forEach((transactionLine) {
          transactionLinesIDs.add(transactionLine.transactionLineId);
        });
        _showRemarksDialog(transactionCubit, transactionLinesIDs, approverID:approverID);
      }
    } else {
      ///
      /// Transaction has not been initiated, hence showing a message in the bottom notification bar.
      ///
      _notificationBar.showMessage(MessagesProvider.get("Click on NEW button to proceed."),
          AppColors.notoficationBGLightYellowColor);
    }
  }

  _showRemarksDialog(TransactionCubit transactionCubit, List<int> transactionLinesIDs,{int?approverID}) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          Log.v('transactionLIneRemarkValue${_selectedTransactionLinesGroup!.remarks}');
          return TransactionLineRemarkDialog(
            approverID:approverID,
            remarks: _selectedTransactionLinesGroup?.remarks ?? "",
            transactionLineIds: transactionLinesIDs,
            productName: _selectedTransactionLinesGroup?.productName ?? '',
            onComplete: (message) async {
              _loadTransactionFunctionItems(isForTransactionHeaderFunctions: true);
              _notificationBar.showMessage(
                  sprintf(message, [_selectedTransactionLinesGroup?.productName]),
                  AppColors.notificationBGLightBlueColor);
              // _transactionView.refreshUi();
            },
          );
        });
  }

  _onTransactionLineSetCourseSelected({int?approverID}) {
    clearNotificationBar();
    final TransactionCubit transactionCubit = context.read<TransactionCubit>();
    final lineStatus = _selectedTransactionLinesGroup?.lineStatus;
    if(lineStatus == 'ABANDONED' || lineStatus == 'CLOSED' || lineStatus == 'CANCELLED' || lineStatus == 'REVERSED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Selected transaction line(s) status is &1. &2 operation not permitted.", [lineStatus, "SET COURSE"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    //set course
    if (transactionCubit.state.transactionData != null && _selectedTransactionLinesGroup != null) {
      ///
      /// Entering course for the transaction line that has been selected.
      ///
      if ((_selectedTransactionLinesGroup?.transactionLines.length ?? 0) > 1) {
        /// Show the quantity dialog
        /// based on the quantity given extract the transaction line ids and pass it to the dialog.
        ///
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return ProductQuantityDialog(MessagesProvider.get("Line Quantity"), (quantity) async {
                if (int.parse(quantity) <=
                    (_selectedTransactionLinesGroup?.transactionLines.length ?? 0)) {
                  List<TransactionLineDTO>? transactionLinesList =
                      _selectedTransactionLinesGroup?.transactionLines
                          .getRange(0, int.parse(quantity))
                          .toList();
                  List<int> transactionLinesIDs = [];
                  transactionLinesList?.forEach((transactionLine) {
                    transactionLinesIDs.add(transactionLine.transactionLineId);
                  });
                  _showSetCourseDialog(transactionCubit, transactionLinesIDs, approverID:approverID);
                } else {
                  _notificationBar.showMessage(
                      MessagesProvider.get("Maximum quantity allowed is &1.", [_selectedTransactionLinesGroup?.transactionLines.length]),
                      AppColors.notoficationBGLightYellowColor);
                }
              });
            });
      } else {
        /// show the Set Course dialog and pass on the transaction line ids.
        ///
        List<TransactionLineDTO>? transactionLinesList =
            _selectedTransactionLinesGroup?.transactionLines;
        List<int> transactionLinesIDs = [];
        transactionLinesList?.forEach((transactionLine) {
          transactionLinesIDs.add(transactionLine.transactionLineId);
        });
        _showSetCourseDialog(transactionCubit, transactionLinesIDs, approverID:approverID);
      }
    } else {
      ///
      /// Transaction has not been initiated, hence showing a message in the bottom notification bar.
      ///
      _notificationBar.showMessage(MessagesProvider.get("Click on NEW button to proceed."),
          AppColors.notoficationBGLightYellowColor);
    }
  }

  _showSetCourseDialog(TransactionCubit transactionCubit, List<int> transactionLinesIDs,{int?approverID}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return TransactionLineCourseDialog(
            approverID:approverID,
            courseName: _selectedTransactionLinesGroup?.courseName ?? '',
            lineRemarks: _selectedTransactionLinesGroup?.remarks ?? '',
            productName: _selectedTransactionLinesGroup?.productName??'',
            transactionLineIds: transactionLinesIDs,
            onComplete: (String? value) async {
              _loadTransactionFunctionItems(isForTransactionHeaderFunctions: true);
              _notificationBar.showMessage(
                  value! + _selectedTransactionLinesGroup!.productName,
                  AppColors.notificationBGLightBlueColor);
            },
          );
        });
  }

  _showTransactionLineSearchDialog(TransactionCubit transactionCubit) {
    if (transactionCubit.state.transactionData != null) {
      if (transactionCubit.state.transactionLinesGroupsBySeat!.isNotEmpty) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return SearchTransactionLineDialog(
                  onConfirm: (String? value) {
                    _searchIconFunction?.icon = "assets/xmark-large.png";
                    setState(() {});
                    _notificationBar.showMessage(
                        value ?? '', AppColors.notificationBGLightBlueColor);
                  },
                  onCancel: (value) {},
                  onError: (String? value) {
                    _notificationBar.showMessage(
                        value ?? '', AppColors.notificationBGLightBlueColor);
                  });
            });
      } else {
        ///
        /// Transaction lines are empty, hence showing a message in the bottom notification bar.
        ///

        _notificationBar.showMessage(MessagesProvider.get("Invalid argument: &1",["Transaction lines"]),
            AppColors.notificationBGRedColor);
      }
    } else {
      ///
      /// Transaction has not been initiated, hence showing a message in the bottom notification bar.
      ///
      _notificationBar.showMessage(MessagesProvider.get("Click on NEW button to proceed."),
          AppColors.notoficationBGLightYellowColor);
    }
  }

  _onTransactionLineCancelSelected({int?approverID}) {
    clearNotificationBar();
    final TransactionCubit transactionCubit = context.read<TransactionCubit>();
    final lineStatus = _selectedTransactionLinesGroup?.lineStatus;
    if(lineStatus == 'CLOSED' || lineStatus == 'CANCELLED' || lineStatus == 'ABANDONED' || lineStatus == 'FULFILLED'
        || lineStatus == 'REVERSED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Selected transaction line(s) status is &1. &2 operation not permitted.", [lineStatus, "CANCEL"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    if (transactionCubit.state.transactionData != null && _selectedTransactionLinesGroup != null) {
      if ((_selectedTransactionLinesGroup?.transactionLines.length ?? 0) > 1) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return ProductQuantityDialog(MessagesProvider.get("Line Quantity"), (quantity) async {
                if (int.parse(quantity) <= (_selectedTransactionLinesGroup?.transactionLines.length ?? 0)) {
                  _cancelProduct(transactionCubit, int.parse(quantity), approverID:approverID);
                } else {
                  _notificationBar.showMessage(
                      MessagesProvider.get("Maximum quantity allowed is &1.", [_selectedTransactionLinesGroup?.transactionLines.length]),
                      AppColors.notoficationBGLightYellowColor);
                }
              });
            });
      } else {
        _cancelProduct(transactionCubit, 1,approverID:approverID);
      }
    } else {
      ///
      /// Transaction has not been initiated, hence showing a message in the bottom notification bar.
      ///
      _notificationBar.showMessage(MessagesProvider.get("Click on NEW button to proceed."),
          AppColors.notoficationBGLightYellowColor);
    }
  }

  // _cancelProduct(TransactionCubit transactionCubit, int quantity) async {
  //   List<TransactionLineDTO>? transactionLinesList =
  //       _selectedTransactionLinesGroup?.transactionLines.getRange(0, quantity).toList();
  //   List<int> transactionLinesIDs = [];
  //   transactionLinesList?.forEach((transactionLine) {
  //     transactionLinesIDs.add(transactionLine.transactionLineId);
  //   });
  //   if (_selectedTransactionLinesGroup!.transactionLines
  //           .getRange(0, quantity)
  //           .toList()[0]
  //           .lineStatus == "FULFILLED") {
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return CancelLineAlertDialog(
  //               showNotification: (value) {},
  //               productName: _selectedTransactionLinesGroup?.productName ?? '',
  //               transactionLineIds: transactionLinesIDs);
  //         });
  //   } else if (_selectedTransactionLinesGroup!.transactionLines
  //           .getRange(0, quantity)
  //           .toList()[0]
  //           .lineStatus ==
  //       "CANCELLED") {
  //     _showFeatureNotImplementedDialog(
  //         "Product is already cancelled"); //TODO: shows that product already got cancelled ...
  //   } else {
  //     transactionCubit.removeProductFromLine(transactionLineIds: transactionLinesIDs, reasonId: -1);
  //   }
  // }

  _onTransactionLineProfileSelected({int?approverID}) {
    clearNotificationBar();
    final TransactionCubit transactionCubit = context.read<TransactionCubit>();
    final lineStatus = _selectedTransactionLinesGroup?.lineStatus;
    if(lineStatus == 'ABANDONED' || lineStatus == 'CANCELLED' || lineStatus == 'CLOSED' || lineStatus == 'REVERSED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Selected transaction line(s) status is &1. &2 operation not permitted.", [lineStatus, "PROFILE"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    if(transactionCubit.state.transactionData?.transactionStatus == 'CLOSED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Transaction Current status is CLOSED. PROFILE operation not permitted."),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    if (transactionCubit.state.transactionData != null && _selectedTransactionLinesGroup != null) {
      if ((_selectedTransactionLinesGroup?.transactionLines.length ?? 0) > 1) {
        /// Show the quantity dialog
        /// based on the quantity given extract the transaction line ids and pass it to the dialog.
        ///
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return ProductQuantityDialog(MessagesProvider.get("Line Quantity"),
                  quantity: _selectedTransactionLinesGroup?.transactionLines.length, (quantity) async {
                List<TransactionLineDTO>? transactionLinesList =
                    _selectedTransactionLinesGroup?.transactionLines.getRange(0, int.parse(quantity)).toList();
                List<int> transactionLinesIDs = [];
                transactionLinesList?.forEach((transactionLine) {
                  transactionLinesIDs.add(transactionLine.transactionLineId);
                });
                _showTransactionLineProfileDialog(
                    transactionCubit, transactionLinesIDs, _selectedTransactionLinesGroup?.productName ?? '');
              });
            });
      } else {
        /// show the Set Course dialog and pass on the transaction line ids.
        ///
        List<TransactionLineDTO>? transactionLinesList =
            _selectedTransactionLinesGroup?.transactionLines;
        List<int> transactionLinesIDs = [];
        transactionLinesList?.forEach((transactionLine) {
          transactionLinesIDs.add(transactionLine.transactionLineId);
        });
        _showTransactionLineProfileDialog(transactionCubit, transactionLinesIDs,
            _selectedTransactionLinesGroup?.productName ?? '');
      }
    } else {
      ///
      /// Transaction has not been initiated, hence showing a message in the bottom notification bar.
      ///
      _notificationBar.showMessage(MessagesProvider.get("Click on NEW button to proceed."),
          const Color.fromARGB(255, 254, 232, 145));
    }
  }

  _showTransactionLineProfileDialog(TransactionCubit transactionCubit, List<int> transactionLinesIDs, String productName) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return TransactionProfileLineDialog(
              selectedProfileID: _selectedTransactionLinesGroup?.transactionLineProfileID ?? 0,
              transactionLineIds: transactionLinesIDs,
              remarks: _selectedTransactionLinesGroup?.remarks ?? '',
              productName: productName,
              onComplete: () {
                _notificationBar.showMessage(
                    MessagesProvider.get("Updated the profile successfully."),
                    AppColors.notificationBGLightBlueColor);
              },);
        });
  }

  _updateTransactionLineSeat({int? approverID}) {
    clearNotificationBar();
    final TransactionCubit transactionCubit = context.read<TransactionCubit>();
    final lineStatus = _selectedTransactionLinesGroup?.lineStatus;
    if(lineStatus == 'CLOSED' || lineStatus == 'CANCELLED' || lineStatus == 'ABANDONED' || lineStatus == 'REVERSED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Selected transaction line(s) status is &1. &2 operation not permitted.", [lineStatus, "SET SEAT"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    Map<int, String>? seats = {};
    List<int> transactionLinesIDs = [];
    if (transactionCubit.state.transactionData != null && _selectedTransactionLinesGroup != null) {
      transactionCubit.state.seats?.forEach((key, value) {
        if (value != _selectedTransactionLinesGroup?.seatName) {
          seats[key] = value;
        }
      });

      if ((_selectedTransactionLinesGroup?.transactionLines.length ?? 0) > 1) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return ProductQuantityDialog(MessagesProvider.get("Line Quantity"),
                  quantity: _selectedTransactionLinesGroup?.transactionLines.length, (quantity) async {
                List<TransactionLineDTO>? transactionLinesList =
                    _selectedTransactionLinesGroup?.transactionLines.getRange(0, int.parse(quantity)).toList();
                transactionLinesList?.forEach((transactionLine) {
                  transactionLinesIDs.add(transactionLine.transactionLineId);
                });

                _showUpdateTransactionLineSeatDialog(
                    transactionLinesIDs, _selectedTransactionLinesGroup, seats, transactionCubit.state.seatNumbers,approverID:approverID);
              });
            });
      } else {
        List<TransactionLineDTO>? transactionLinesList =
            _selectedTransactionLinesGroup?.transactionLines;
        transactionLinesList?.forEach((transactionLine) {
          transactionLinesIDs.add(transactionLine.transactionLineId);
        });

        _showUpdateTransactionLineSeatDialog(
            transactionLinesIDs,
            _selectedTransactionLinesGroup,
            seats,
            transactionCubit.state.seatNumbers, approverID:approverID,);
      }
    } else {
      _notificationBar.showMessage(MessagesProvider.get("Click on NEW button to proceed."),
          const Color.fromARGB(255, 254, 232, 145));
    }
  }

  _showUpdateTransactionLineSeatDialog(
      List<int> transactionLinesIDs,
      TransactionLinesGroup? selectedTransactionLinesGroup,
      Map<int, String>? seatNames,
      List<int>? seatNumbers,
      {int? approverID}) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
          return UpdateTransactionLineSeatDialog(
            approverID:approverID,
            transactionLinesIDs: transactionLinesIDs,
            selectedTransactionLinesGroup: _selectedTransactionLinesGroup,
            seatNames: seatNames,
            seatNumbers: seatNumbers,
            onComplete: () {
              _loadTransactionFunctionItems(isForTransactionHeaderFunctions: true);
              _notificationBar.showMessage(MessagesProvider.get("Updated the seat successfully for product &1.", [(_selectedTransactionLinesGroup?.productName)]),
                  AppColors.notificationBGLightBlueColor);
            },
            onValidation: () {
              _notificationBar.showMessage(
                  MessagesProvider.get("Please select an existing seat or click Add Seat for adding new seat."),
                  AppColors.notoficationBGLightYellowColor);
            },
          );
        });
  }

  _hideStatusBar() {
    /*SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top
    ]);*/
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  _goBack(BuildContext context) async {
    transactionCubit = context.read<TransactionCubit>();
    if(Platform.isAndroid) {
      /**
       * Unregistering the barcode scanner broadcast receiver
       */
      if (barcodeReaderType == Application.deviceManufacturer ||
          barcodeReaderType == "PDA" && Application.deviceManufacturer == "CILICO") {
        barcodeScannerMethodChannel.invokeMethod("unregisterBarcodeScannerBroadcast", {"type": barcodeReaderType});
      }
    }
    transactionCubit?.setBarcodeReadData(null);
    if(transactionCubit?.state.transactionData != null) {
      final status = transactionCubit?.state.transactionData?.transactionStatus;
      if(status == 'PENDING_CLOSE' || status == 'ABANDONED' || status == 'CANCELLED' || status == 'REOPENED'
          || status == 'CLOSED' || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
        await transactionCubit?.clearTransactionOnSalesScreenExit();
        if (!mounted) return;
        Navigator.pop(context);
      } else {
        _goBackConfirmationDialog();
      }
    } else {
      Navigator.pop(context);
    }
  }

  _goBackConfirmationDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return GoBackConfirmationDialog(
            transactionId: context.read<TransactionCubit>().state.transactionData!.transactionId,
            onComplete: () async {
              await transactionCubit?.unlockTransaction();
              if (!mounted) return;
              Navigator.pop(context);
              Navigator.pop(context);
             },
            onCancel: () {
              Navigator.pop(context);
            },
          );
        });
  }

  _clearErrorTransactionString() {
    transactionCubit = transactionCubit = context.read<TransactionCubit>();
    transactionCubit!.clearTransactionErrorString();
  }

  _iniTransactionLoadingStatus() {
    transactionCubit = transactionCubit = context.read<TransactionCubit>();
    transactionCubit!.resetTransactionLoadingStatus();
  }

  _resetTransactionLoadingStatus() {
    transactionCubit = transactionCubit = context.read<TransactionCubit>();
    transactionCubit!.resetTransactionLoadingStatus();
  }

  _clearStatus() {
    transactionCubit = transactionCubit = context.read<TransactionCubit>();
    transactionCubit!.clearStatus();
  }

  _clearTransactionFunctionsSelection() {
    transactionCubit = transactionCubit = context.read<TransactionCubit>();
    transactionCubit!.clearTransactionFunctionsSelection();
  }

  ///
  /// Menus for the ContextMenuView and IconicContextMenuView are initialized here.
  ///
  void _loadTransactionFunctionItems({bool isForTransactionHeaderFunctions = true}) {
    var isDarkTheme = (Theme.of(context).brightness == Brightness.dark);
    context.read<TransactionFunctionsCubit>().updateTransactionMenuItems(
        isForTransactionHeaderFunctions
            ? isDarkTheme ? transactionHeaderDarkFunctions : transactionHeaderLightFunctions
            : isDarkTheme ? transactionLineDarkFunctions : transactionLineLightFunctions,
        isForTransactionHeaderFunctions
            ? isDarkTheme ? transactionHeaderIconicDarkFunctions : transactionHeaderIconicLightFunctions
            : isDarkTheme ? transactionLineIconicDarkFunctions : transactionLineIconicLightFunctions);
  }

  _toggleTransactionSearchMode(TransactionCubit transactionCubit) {
    if (transactionCubit.state.isInSearchMode) {
      _searchIconFunction?.icon = "assets/ic_search_1.png";
      context.read<TransactionCubit>().changeSearchResultsStatus(false);
      _searchIconFunction = null;
    } else {
      _showTransactionLineSearchDialog(transactionCubit);
    }
    setState(() {});
    // Future.microtask(() =>  _iconicContextMenuView.refresh());

    // _iconicContextMenuView.refresh();
  }

  _showRemarksMandatoryDialog(
      String productName,
      ProductContainerDTO productPriceContainerData,
      int quantity,
      {required Function(String? remarks) onRemarksInputCallback, bool isCardProduct = false, }) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return MandatoryRemarkDialog(
            productId: productPriceContainerData.productId,
            quantity: quantity,
            isCardProduct: isCardProduct,
            onComplete: () {
              String notification = sprintf(MessagesProvider.get("Newly added product %s, Quantity: %d"), [productName, 1]);
              _notificationBar.showMessage(notification, const Color.fromARGB(255, 180, 236, 251));
            },
            onCancel: () {},
            onRemarksInput: (String remarks) {
              onRemarksInputCallback(remarks);
            },
          );
        });
  }

  _showTransactionHeaderProfileDialog({int? approverID}) {
    clearNotificationBar();
    transactionCubit = context.read<TransactionCubit>();
    final status = transactionCubit?.state.transactionData?.transactionStatus;
    if(status == 'ABANDONED' || status == 'CANCELLED' || status == 'CLOSED' || status == 'PENDING_CLOSE'
        || status == 'REOPENED' || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "PROFILE"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    if (transactionCubit?.state.transactionData != null) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return TransactionProfileDialog(
                approverID:approverID,
              onComplete: () {
                _notificationBar.showMessage(
                    MessagesProvider.get("Updated the transaction profile successfully."),
                    AppColors.notificationBGLightBlueColor
                );
              },
              onRemarksEnable: (profileId){
                _showRemarksForTransactionProfile(approverID,profileId);
              },
              selectedProfileID: transactionCubit?.state.transactionData?.transactionProfileId ?? 0,
            );
          });
    } else {
      ///
      /// Transaction has not been initiated, hence showing a message in the bottom notification bar.
      ///
      _notificationBar.showMessage(MessagesProvider.get("Click on NEW button to proceed."),
          AppColors.notoficationBGLightYellowColor);
    }
  }

  void _showRemarksForTransactionProfile(int? approverID, int? profileId) {
    final transactionCubit = context.read<TransactionCubit>();
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext cts) {
          return AddRemarkDialog(
            remarks: transactionCubit.state.transactionData?.remarks ?? '',
            transactionProfile: true,
            onConfirm: (String? value) async {
              loader.showLoaderDialog(context, MessagesProvider.get("Updating Transaction Profile..."));
              try{
                var execContextBL = await ExecutionContextBuilder.build();
                var sysExecContext = execContextBL.getExecutionContext();
                var _transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
                TransactionResponse? transactionResponse = await _transactionDataBl.updateTransactionIdentifiers(remarks: value ?? '');
                if(transactionResponse.exception == null){
                  Log.v('transaRemark ');
                  await transactionCubit.updateTransactionProfile(profileId!,approverID:approverID);
                  if (transactionCubit.state.updatedTransactionProfile == true &&
                      transactionCubit.state.updateTransactionProfileError == null) {
                    if (!mounted) return;
                    loader.hideLoaderDialog(context);
                    transactionCubit.clearTransactionProfileStates();
                    _notificationBar.showMessage(
                        MessagesProvider.get("Updated the transaction profile successfully."),
                        AppColors.notificationBGLightBlueColor
                    );
                  } else if(transactionCubit.state.updatedTransactionProfile == false &&
                      transactionCubit.state.updateTransactionProfileError != null) {
                    if (!mounted) return;
                    loader.hideLoaderDialog(context);
                    _notificationBar.showMessage(
                        transactionCubit.state.updateTransactionProfileError.toString(),
                        AppColors.notificationBGRedColor);
                    transactionCubit.clearTransactionProfileStates();
                  }
                }
              }
              on DioError catch(error) {
                var errorString = error.response?.data['data'] as String?;
                _notificationBar.showMessage(errorString ?? '', AppColors.notificationBGRedColor);
              }
            },
          );
        });
  }

  _repeatTransactionLine({int?approverID}) async {
    clearNotificationBar();
    var transactionCubit = context.read<TransactionCubit>();
    final lineStatus = _selectedTransactionLinesGroup?.lineStatus;
    if(lineStatus == 'CANCELLED' || lineStatus == 'CLOSED' || lineStatus == 'ABANDONED' || lineStatus == 'REVERSED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Selected transaction line(s) status is &1. &2 operation not permitted.", [lineStatus, "REPEAT"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    String transactionStatus = transactionCubit.state.transactionData?.transactionStatus ?? "STARTED";
    if (_selectedTransactionLinesGroup != null) {
      ProductContainerDTO? productContainer = await _productMenuDataBL
          .getProductDetails(_selectedTransactionLinesGroup?.productId ?? 0);
      if(transactionStatus == "CLOSED"){
        _notificationBar.showMessage(MessagesProvider.get("Selected transaction line(s) status is &1. &2 operation not permitted.",["CLOSED","REPEAT"]), AppColors.notoficationBGLightYellowColor);
      } else if (!((productContainer?.quantityPrompt == "N" || productContainer?.quantityPrompt == "Y") &&
          (productContainer?.productType == "CARDSALE" ||
              productContainer?.productType == "NEW" ||
              productContainer?.productType == "GAMETIME" ||
              productContainer?.productType == "RECHARGE" ||
              productContainer?.productType == "VARIABLECARD"))) {
        if (!mounted) return;
        showDialog(
            context: context,
            barrierColor: const Color(0x01000000),
            builder: (BuildContext context) {
              return NumberPad(
                initialOffset: Offset(50,50),
                title: MessagesProvider.get('Reorder Quantity'),
                onOkPressed: (repeatQuantity)  async {
                    loader.showLoaderDialog(
                        context, MessagesProvider.get("Repeating the product..."));
                    if(_selectedTransactionLinesGroup?.modifierTransactionLinesGroup.isNotEmpty == true) {
                      transactionCubit.repeatModifierTransactionLine(_selectedTransactionLinesGroup!, repeatQuantity,approverID:approverID);
                    } else {
                      transactionCubit.repeatTransactionLine(
                          _selectedTransactionLinesGroup!,
                          repeatQuantity,
                          productContainer?.allowPriceOverride == "Y" ? _selectedTransactionLinesGroup?.amount : null,
                          approverID:approverID);
                    }
                },);
            });
      }
    }
  }

  _fulfillTransactionLines({int?approverID}) async{
    clearNotificationBar();
    final TransactionCubit transactionCubit = context.read<TransactionCubit>();
    final lineStatus = _selectedTransactionLinesGroup?.lineStatus;
    if(lineStatus == 'PENDING_CLOSE' || lineStatus == 'CANCELLED' || lineStatus == 'CLOSED' || lineStatus == 'REOPENED' || lineStatus == 'FULFILLED'
        || lineStatus == 'ABANDONED' || lineStatus == 'REVERSED' || lineStatus == 'REVERSE_INITIATED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Selected transaction line(s) status is &1. &2 operation not permitted.", [lineStatus, "FULFILL LINES"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    if(transactionCubit.state.transactionData?.transactionStatus == 'CLOSED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Transaction Current status is CLOSED. FULFILL operation not permitted."),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    if (transactionCubit.state.transactionData != null && _selectedTransactionLinesGroup != null) {
      if (_selectedTransactionLinesGroup?.lineStatus == "FULFILLED") {
        _notificationBar.showMessage(MessagesProvider.get("No item(s) to fulfill."), AppColors.notoficationBGLightYellowColor);
      } else {
        if ((_selectedTransactionLinesGroup?.transactionLines.length ?? 0) > 1) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return ProductQuantityDialog(MessagesProvider.get("Line Quantity"), (quantity) async {
                  if(int.parse(quantity) > (_selectedTransactionLinesGroup?.transactionLines.length ?? 0)) {
                    _notificationBar.showMessage(
                        MessagesProvider.get("Maximum quantity allowed is &1.", [_selectedTransactionLinesGroup?.transactionLines.length]),
                        AppColors.notoficationBGLightYellowColor);
                  } else {
                    List<TransactionLineDTO>? transactionLinesList = _selectedTransactionLinesGroup
                        ?.transactionLines
                        .getRange(0, int.parse(quantity))
                        .toList();
                    List<TransactionLineDTO> transactionCardProduct =[];
                    for (TransactionLineDTO element in transactionLinesList??[]) {
                      if((element.transactionAccountDTOList??[]).isNotEmpty){
                        transactionCardProduct.add(element);
                      }
                    }
                    if(transactionCardProduct.isNotEmpty){
                      ProductContainerDTO? productPriceContainer = await _productMenuDataBL.getProductDetails(transactionCardProduct.first.productId);
                      _showCardFunctionalityDialog(isSplitCard: false, productPriceContainer: productPriceContainer!, quantity: transactionCardProduct.length, isEdit: false, isFullfill:true, transactionLines: transactionCardProduct, fullFillTransactionLines:transactionLinesList);
                    }else{
                      loader.showLoaderDialog(context, MessagesProvider.get("Ordering transaction lines..."));
                      transactionCubit.orderTransactionLines(transactionLinesList ?? [],approverID:approverID);

                    }

                  }
                });
              });
        } else {
          List<TransactionLineDTO>? transactionLinesList = _selectedTransactionLinesGroup?.transactionLines;
          List<TransactionLineDTO> transactionCardProduct =[];
          for (TransactionLineDTO element in transactionLinesList??[]) {
            if((element.transactionAccountDTOList??[]).isNotEmpty){
              transactionCardProduct.add(element);
            }
          }
          if(transactionCardProduct.isNotEmpty){
            ProductContainerDTO? productPriceContainer = await _productMenuDataBL.getProductDetails(transactionCardProduct.first.productId);
            _showCardFunctionalityDialog(isSplitCard: false, productPriceContainer: productPriceContainer!, quantity: transactionCardProduct.length, isEdit: false, isFullfill:true, transactionLines: transactionCardProduct, fullFillTransactionLines:transactionLinesList);
          }else{
            loader.showLoaderDialog(context, MessagesProvider.get("Ordering transaction lines..."));
            transactionCubit.orderTransactionLines(transactionLinesList ?? [],approverID:approverID);
          }
        }
      }
    } else {
      _notificationBar.showMessage(MessagesProvider.get("Click on NEW button to proceed."),
          const Color.fromARGB(255, 254, 232, 145));
    }
  }

  _fulfillTransaction({int?approverID}) async {
    clearNotificationBar();
    final TransactionCubit transactionCubit = context.read<TransactionCubit>();
    final status = transactionCubit.state.transactionData?.transactionStatus;
    if(status == 'PENDING_CLOSE' || status == 'CANCELLED' || status == 'CLOSED' || status == 'REOPENED'
        || status == 'ABANDONED' || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "FULFILL"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    var transactionLinesGroupsBySeat = transactionCubit.state.transactionLinesGroupsBySeat;
    var transactionData = transactionCubit.state.transactionData;
    if (transactionData != null) {
      if(transactionLinesGroupsBySeat?.isEmpty == true) {
        _notificationBar.showMessage(MessagesProvider.get("No item(s) to fulfill."), AppColors.notoficationBGLightYellowColor);
      } else {
        var isFulfilled = transactionData.transactionLineDTOList.where(
                (transactionLine) => transactionLine.lineStatus != "FULFILLED"
        );
        final item = _sitesResponse?.data?.siteContainerDTOList
            .where((element) => element.siteId == _execContextDTO.siteId);
        if (item?.isNotEmpty == true) {
          final zone = item!.first.timeZoneName;
          _timeZoneName = timeZoneMap[zone];
        }
        final currentDateTimeByZone = curDateTimeByZone(zone: _timeZoneName ?? 'GMT');
        final transactionDate = DateTime.parse(transactionCubit.state.transactionData?.transactionDate??DateTime.now().toIso8601String());

        if(isFulfilled.isNotEmpty) {
          showGeneralDialog(
              context: context,
              barrierDismissible: false,
              barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
              barrierColor: Colors.black45,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
                return OrderTransactionLinesDialog(
                  approverID:approverID,
                  transactionId: transactionData.transactionId,
                  transactionLinesGroupsBySeat: transactionLinesGroupsBySeat,
                  showNotification: (String value, Color color) {
                    _notificationBar.showMessage(value, color);
                  },
                    isFutureDatedTransaction: transactionDate.difference(currentDateTimeByZone).inMilliseconds > 0,
                    onCardProductExists: (List<TransactionLineDTO> fullFillTransactionLines)async{
                      List<TransactionLineDTO> transactionCardProduct = [];
                      for (TransactionLineDTO element in fullFillTransactionLines) {
                        if((element.transactionAccountDTOList??[]).isNotEmpty){
                          transactionCardProduct.add(element);
                        }
                      }
                      if(transactionCardProduct.isNotEmpty){
                        ProductContainerDTO? productPriceContainer = await _productMenuDataBL.getProductDetails(transactionCardProduct.first.productId);
                        _showCardFunctionalityDialog(isSplitCard: false, productPriceContainer: productPriceContainer!, quantity: transactionCardProduct.length, isEdit: false, isFullfill:true, transactionLines: transactionCardProduct, fullFillTransactionLines:fullFillTransactionLines);
                      }
                    });
              });
        } else {
          _notificationBar.showMessage(MessagesProvider.get("No item(s) to fulfill."), AppColors.notoficationBGLightYellowColor);
        }
      }
    } else {
      _notificationBar.showMessage(MessagesProvider.get("Click on NEW button to proceed."), AppColors.notoficationBGLightYellowColor);
    }
  }

  _onVipMandatoryProductSelected(ProductContainerDTO productPriceContainer, int quantity) async {
    if (Provider.of<SelectedCustomer>(context, listen: false).selectedData != null) {
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();
      final customerDataBl = await CustomerDataBuilder.build(execContext!);
      final accountDetails = await customerDataBl.getCustomerAccounts(
        customerId: Provider.of<SelectedCustomer>(context, listen: false).selectedData?.id ?? -1
      );
      if(accountDetails.data?[0].vipCustomer == true) {
        _showCardFunctionalityDialog(
          isSplitCard: false,
          productPriceContainer: productPriceContainer,
          quantity: quantity,
          isEdit: false,
            isFullfill:false
        );
      } else {
        _showVipOnlyDialog(productPriceContainer, quantity);
      }
    } else {
      _showVipOnlyDialog(productPriceContainer, quantity);
    }
  }

  _showVipOnlyDialog(ProductContainerDTO productPriceContainer, int quantity) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel:
        MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return VipOnlyDialog(
            onYesTapped: () {
              _showVipCardIdentificationDialog(productPriceContainer, quantity);
            },
            onNoTapped: () {
              _notificationBar.showMessage(
                  MessagesProvider.get("Product available only for VIP"),
                  AppColors.notoficationBGLightYellowColor);
            },
          );
        });
  }

  _showVipCardIdentificationDialog(ProductContainerDTO productPriceContainer, int quantity) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel:
        MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return VipCardIdentificationDialog(
            onVipCardIdentified: () {
              Future.delayed(const Duration(milliseconds: 800), () {
                _showCardFunctionalityDialog(
                  isSplitCard: false,
                  productPriceContainer: productPriceContainer,
                  quantity: quantity,
                  isEdit: false,
                    isFullfill:false
                );
              });
            },
            onCancelTapped: () {
              _notificationBar.showMessage(
                  MessagesProvider.get("Product available only for VIP"),
                  AppColors.notoficationBGLightYellowColor);
            },
            notificationBar: _notificationBar,
            isNFCAvailable: _isNFCAvailable,
          );
        });
  }

  _onOverridePriceSelected({int?approverID}) async {
    clearNotificationBar();
    final TransactionCubit transactionCubit = context.read<TransactionCubit>();
    final lineStatus = _selectedTransactionLinesGroup?.lineStatus;
    if(lineStatus == 'ABANDONED' || lineStatus == 'CANCELLED' || lineStatus == 'CLOSED' || lineStatus == 'REVERSED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Selected transaction line(s) status is &1. &2 operation not permitted.", [lineStatus, "OVERRIDE PRICE"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    if (transactionCubit.state.transactionData != null && _selectedTransactionLinesGroup != null) {
      ProductContainerDTO? productPriceContainer = await _productMenuDataBL.getProductDetails(_selectedTransactionLinesGroup?.productId ?? -1);
      if(productPriceContainer?.allowPriceOverride == "Y") {
        if ((_selectedTransactionLinesGroup?.transactionLines.length ?? 0) > 1) {
          if (!mounted) return;
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return ProductQuantityDialog(MessagesProvider.get("Line Quantity"), (quantity) async {
                  if (int.parse(quantity) <= (_selectedTransactionLinesGroup?.transactionLines.length ?? 0)) {
                    List<TransactionLineDTO>? transactionLinesList =
                    _selectedTransactionLinesGroup?.transactionLines
                        .getRange(0, int.parse(quantity))
                        .toList();
                    List<int> transactionLinesIDs = [];
                    transactionLinesList?.forEach((transactionLine) {
                      transactionLinesIDs.add(transactionLine.transactionLineId);
                    });
                    _showNumberPadToOverridePrice(
                        approverID:approverID,
                        transactionLinesIDs,
                        _selectedTransactionLinesGroup?.amount ?? 0.0,
                        _selectedTransactionLinesGroup?.remarks ?? "",
                        productPriceContainer);
                  } else {
                    _notificationBar.showMessage(
                        MessagesProvider.get("Maximum quantity allowed is &1.", [_selectedTransactionLinesGroup?.transactionLines.length]),
                        AppColors.notoficationBGLightYellowColor);
                  }
                });
              });
        } else {
          List<TransactionLineDTO>? transactionLinesList = _selectedTransactionLinesGroup?.transactionLines;
          List<int> transactionLinesIDs = [];
          transactionLinesList?.forEach((transactionLine) {
            transactionLinesIDs.add(transactionLine.transactionLineId);
          });
          _showNumberPadToOverridePrice(
              transactionLinesIDs,
              _selectedTransactionLinesGroup?.amount ?? 0.0,
              _selectedTransactionLinesGroup?.remarks ?? "",
              productPriceContainer);
        }
      } else {
        _notificationBar.showMessage(
            MessagesProvider.get("Cannot override the price for the product &1.", [_selectedTransactionLinesGroup?.productName]),
            AppColors.notoficationBGLightYellowColor);
      }
    } else {
      _notificationBar.showMessage(
          MessagesProvider.get("Click on NEW button to proceed."),
          AppColors.notoficationBGLightYellowColor);
    }
  }

  _showNumberPadToOverridePrice(
      List<int> transactionLineIds,
      double overriddenPrice,
      String lineRemarks,
      ProductContainerDTO? productPriceContainer,{int?approverID}) {
    final TransactionCubit transactionCubit = context.read<TransactionCubit>();
    showDialog(
        barrierDismissible: true,
        context: context,
        barrierColor: const Color(0x01000000),
        builder: (BuildContext context) {
          return NumberPad(
            initialOffset: const Offset(50, 50),
            title: MessagesProvider.get("User Price"),
            isInitialRequired: true,
            isDecimalRequired: true,
            initialDecimalValue: overriddenPrice,
            onOkPressed: (price) {
              if(price.toDouble() >= productPriceContainer?.minimumUserPrice) {
                transactionCubit.overrideTransactionLinePrice(productPriceContainer?.productName, transactionLineIds, price.toDouble(), lineRemarks, approverID:approverID);
              } else {
                _notificationBar.showMessage(
                    MessagesProvider.get("Override price cannot be less than &1 ", [productPriceContainer?.minimumUserPrice]),
                    AppColors.notoficationBGLightYellowColor);
              }
            },
          );
        });
  }

  ///
  /// Creating a TransactionView and performing actions on its click callback.
  ///
  _getTransactionView() {
    return TransactionView(
      bottomBar: true,
      currency: currency,
      amountFmt: amountFmt,
      onTransactionLineTapped: (TransactionLinesGroup transactionLinesGroup, bool isSelected) {
        _selectedTransactionLinesGroup = isSelected ? transactionLinesGroup : null;
        _loadTransactionFunctionItems(isForTransactionHeaderFunctions: !isSelected);
      },
      onTransactionSummaryTapped: (TransactionSummaryListCtas transactionBottomCtas) {
        switch (transactionBottomCtas) {
          case TransactionSummaryListCtas.DISCOUNTS:
            _openTransactionSummary();
            break;
          case TransactionSummaryListCtas.SUB_TOTAL:
            _openTransactionSummary();
            break;
          case TransactionSummaryListCtas.TAXES:
            _openTransactionSummary();
            break;
          case TransactionSummaryListCtas.TOTAL:
            _openTransactionSummary();
            break;
          case TransactionSummaryListCtas.SUMMARY:
            _openTransactionSummary();
            break;
        }
      },
      onTransactionSeatNameUpdated: () {
        _notificationBar.showMessage(
            MessagesProvider.get("Updated the seat name successfully."), AppColors.notificationBGLightBlueColor);
      },
    );
  }

  void _openTransactionSummary(){
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    final TransactionCubit transactionCubit = context.read<TransactionCubit>();
    if (transactionCubit.state.transactionData == null) {
      _notificationBar.showMessage(MessagesProvider.get("Click on NEW button to proceed."), theme.footerBG5!);
    } else {
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => const TransactionSummaryScreen()));
    }
  }

  void _showManagerLoginPopup({required Function(LoginResponse) onAuthSuccess}) {
    showDialog(context: context, barrierDismissible: false, builder: (ctx) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: SizeConfig.getSize(220)),
        child: ManagerLoginView(
          onLoginSuccess: (response) {
            onAuthSuccess(response);
          },
          onLoginError: (err) {},
        ),
      );
    });
  }

  _getContextMenuView() {
    ///
    /// Creating a ContextMenu for the transaction.
    ///
    TransactionCubit transactionCubit = context.read<TransactionCubit>();
    return ContextMenuView((TransactionFunctionDTO menuItem) async {
      ///
      /// If the ContextMenuItem is selected/unselected, the callback is handled here.
      ///
      switch (menuItem.taskType) {
        case "NEW":
          {
            if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(
                    () => _onNewTransactionSelected(approverID: response.data?.userPKId ?? -1, event: "NORMAL"));
              });
            } else {
              _onNewTransactionSelected(approverID: _currentUserPkId ?? -1, event: "NORMAL");
            }
          }
          break;
        case "REMARKS":
          {
            if (menuItem.category == "TRANSACTION HEADER FUNCTION") {
              final TransactionCubit transactionCubit = context.read<TransactionCubit>();
              if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
                _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                  Future.microtask(() => _onRemarksSelected(transactionCubit, approverID: response.data?.userPKId ?? -1));
                });
              } else {
                _onRemarksSelected(transactionCubit, approverID: _currentUserPkId);
              }
            } else if (menuItem.category == "TRANSACTION LINE FUNCTION") {
              if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
                _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                  Future.microtask(() => _onTransactionLineRemarksSelected(approverID: response.data?.userPKId ?? -1));
                });
              } else {
                _onTransactionLineRemarksSelected(approverID: _currentUserPkId);
              }
            }
          }
          break;
        case "SAVE":
          {
            if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(
                    () async => await _onSaveSelected(transactionCubit, approverID: response.data?.userPKId ?? -1));
              });
            } else {
              await _onSaveSelected(transactionCubit, approverID: _currentUserPkId);
            }
          }
          break;
        case "SAVE AND HOLD":
          {
            if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(
                    () async => await _onSaveAndHoldSelected(transactionCubit, approverID: response.data?.userPKId ?? -1));
              });
            } else {
              await _onSaveAndHoldSelected(transactionCubit, approverID: _currentUserPkId);
            }
          }
          break;
        case "COMPLETE":
          {
            if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(
                    () async => await _onCompleteSelected(transactionCubit, approverID: response.data?.userPKId ?? -1));
              });
            } else {
              await _onCompleteSelected(transactionCubit, approverID: _currentUserPkId);
            }
          }
          break;
        case "PAYMENT":
          {
            if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(() => _onPaymentSelected(transactionCubit, approverID: response.data?.userPKId ?? -1));
              });
            } else {
              _onPaymentSelected(transactionCubit, approverID: _currentUserPkId);
            }
          }
          break;
        case "DISCOUNTS":
          {
            if (menuItem.category == "TRANSACTION LINE FUNCTION") {
              if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
                _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                  Future.microtask(() => _showTransactionLineDiscountDialog(transactionCubit, _selectedTransactionLinesGroup,
                      approverID: response.data?.userPKId ?? -1));
                });
              } else {
                _showTransactionLineDiscountDialog(transactionCubit, _selectedTransactionLinesGroup,
                    approverID: _currentUserPkId);
              }
            } else if (menuItem.category == "TRANSACTION HEADER FUNCTION") {
              if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
                _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                  Future.microtask(
                      () => _showTransactionDiscountDialog(transactionCubit, approverID: response.data?.userPKId ?? -1));
                });
              } else {
                _showTransactionDiscountDialog(transactionCubit, approverID: _currentUserPkId);
              }
            }
          }
          break;
        case "DETAILS":
          {
            if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(() => _onDetailsSelected(transactionCubit, approverID: response.data?.userPKId ?? -1));
              });
            } else {
              _onDetailsSelected(transactionCubit, approverID: _currentUserPkId);
            }
          }
          break;
        case "CHANGE STAFF":
          {
            if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(() => _onChangeStaffSelected(transactionCubit, approverID: response.data?.userPKId ?? -1));
              });
            } else {
              _onChangeStaffSelected(transactionCubit, approverID: _currentUserPkId);
            }
          }
          break;
        case "ASSIGN DELIVERY AGENT":
          {
            /*if(menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(() => null);
              });
            } else {}*/
            _showFeatureNotImplementedDialog('Assign Delivery Agent Transaction');
          }
          break;
        case "SPLIT":
          {
            //Uncomment the below when implementing this feature
            /*if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(() => null);
              });
            } else {}*/
            _showFeatureNotImplementedDialog('Split Transaction');
          }
          break;
        case "MAP WAIVERS":
          {
            //Uncomment the below when implementing this feature
            /*if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(() => null);
              });
            } else {}*/
            _showFeatureNotImplementedDialog('Map Waivers Transaction');
          }
          break;
        case "REOPEN":
          {
            transactionCubit = context.read<TransactionCubit>();
            if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(() => _onReopenTransaction(transactionCubit, approverID: response.data?.userPKId ?? -1));
              });
            } else {
              _onReopenTransaction(transactionCubit, approverID: _currentUserPkId);
            }
          }
          break;
        case "OVERRIDE PRICE":
          {
            if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(() => _onOverridePriceSelected(approverID: response.data?.userPKId ?? -1));
              });
            } else {
              _onOverridePriceSelected(approverID: _currentUserPkId);
            }
          }
          break;
        case "PRINT KOT":
          {
            //Uncomment the below when implementing this feature
            /*if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(() => null);
              });
            } else {}*/
            _showFeatureNotImplementedDialog('Print KOT Transaction Line');
          }
          break;
        case "EDIT":
          {
            if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(() => onEditClicked(approverID: response.data?.userPKId ?? -1));
              });
            } else {
              onEditClicked(approverID: _currentUserPkId);
            }
          }
          break;
        case "VIEW LOGS":
          {
            if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(() => _viewLogs(transactionCubit, approverID: response.data?.userPKId ?? -1));
              });
            } else {
              _viewLogs(transactionCubit, approverID: _currentUserPkId);
            }
          }
          break;
        case "FULFILL":
          {
            if (menuItem.category == "TRANSACTION HEADER FUNCTION") {
              if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
                _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                  Future.microtask(() => _fulfillTransaction(approverID: response.data?.userPKId ?? -1));
                });
              } else {
                _fulfillTransaction(approverID: _currentUserPkId);
              }
            } else if (menuItem.category == "TRANSACTION LINE FUNCTION") {
              if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
                _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                  Future.microtask(() => _fulfillTransactionLines(approverID: response.data?.userPKId ?? -1));
                });
              } else {
                _fulfillTransactionLines(approverID: _currentUserPkId);
              }
            }
          }
          break;
        case "TRANSACTION LOOKUP":
          {
            if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(() => _transactionLookup(approverID: response.data?.userPKId ?? -1));
              });
            } else {
              _transactionLookup(approverID: _currentUserPkId);
            }
          }
          break;
        default:
          {
            _showFeatureNotImplementedDialog('${menuItem.taskTypeName} Feature');
          }
          break;
      }
    });
  }

  _getIconicContextMenuView() {
    ///
    /// Creating a IconicContextMenuView for the transaction.
    ///
    TransactionCubit transactionCubit = context.read<TransactionCubit>();
    _iconicContextMenuView = IconicContextMenuView((TransactionFunctionDTO menuItem) {
      ///
      /// If the IconicContextMenuItem is selected/unselected, the callback is handled here.
      ///
      switch (menuItem.taskType) {
        case "HELP":
          {
            clearNotificationBar();
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return const IconicContextMenuHelpDialog();
                });
          }
          break;
        case "PRINT":
          {
            if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(() => _printTransaction(approverID: response.data?.userPKId ?? -1));
              });
            } else {
              _printTransaction(approverID: _currentUserPkId);
            }
          }
          break;
        case "SEARCH":
          {
            _searchIconFunction = menuItem;
            clearNotificationBar();
            _toggleTransactionSearchMode(transactionCubit);
          }
          break;
        case "CANCEL":
          {
            if (menuItem.category == "TRANSACTION HEADER FUNCTION") {
              if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
                _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                  Future.microtask(() => _onCancelTransaction(transactionCubit, approverID: response.data?.userPKId ?? -1));
                });
              } else {
                _onCancelTransaction(transactionCubit, approverID: _currentUserPkId);
              }
            } else if (menuItem.category == "TRANSACTION LINE FUNCTION") {
              if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
                _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                  Future.microtask(() => _onTransactionLineCancelSelected(approverID: response.data?.userPKId ?? -1));
                });
              } else {
                _onTransactionLineCancelSelected(approverID: _currentUserPkId);
              }
            }
          }
          break;
        case "REVERSE":
          {
            if (menuItem.category == "TRANSACTION HEADER FUNCTION") {
              if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
                _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                  Future.microtask(() => _reverseTransaction(approverID: response.data?.userPKId ?? -1));
                });
              } else {
                _reverseTransaction(approverID: _currentUserPkId);
              }
            } else if (menuItem.category == "TRANSACTION LINE FUNCTION") {
              if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
                _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                  Future.microtask(() => _reverseTransactionLine(approverID: response.data?.userPKId ?? -1));
                });
              } else {
                _reverseTransactionLine(approverID: _currentUserPkId);
              }
            }
          }
          break;
        case "PROFILE":
          {
            if (menuItem.category == "TRANSACTION HEADER FUNCTION") {
              if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
                _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                  Future.microtask(() => _showTransactionHeaderProfileDialog(approverID: response.data?.userPKId ?? -1));
                });
              } else {
                _showTransactionHeaderProfileDialog(approverID: _currentUserPkId);
              }
            } else if (menuItem.category == "TRANSACTION LINE FUNCTION") {
              if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
                _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                  Future.microtask(() => _onTransactionLineProfileSelected(approverID: response.data?.userPKId ?? -1));
                });
              } else {
                _onTransactionLineProfileSelected(approverID: _currentUserPkId);
              }
            }
          }
          break;
        case "NON CHARGEABLE":
          {
            if (/*menuItem.requiresManagerApproval == 'Y' &&*/ !_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(() => _onNonChargeableTapped(transactionCubit, approverID: response.data?.userPKId ?? -1));
              });
            } else {
              _onNonChargeableTapped(transactionCubit, approverID: _currentUserPkId);
            }
          }
          break;
        case "TRANSACTION DATE":
          {
            if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(() => _onChangeTrxDate(transactionCubit, approverID: response.data?.userPKId ?? -1));
              });
            } else {
              _onChangeTrxDate(transactionCubit, approverID: _currentUserPkId);
            }
          }
          break;
        case "RESET":
          {
            transactionCubit = context.read<TransactionCubit>();
            if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(() => _onResetSelected(transactionCubit, approverID: response.data?.userPKId ?? -1));
              });
            } else {
              _onResetSelected(transactionCubit, approverID: _currentUserPkId);
            }
          }
          break;
        case "SET COURSE":
          {
            if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(() => _onTransactionLineSetCourseSelected(approverID: response.data?.userPKId ?? -1));
              });
            } else {
              _onTransactionLineSetCourseSelected(approverID: _currentUserPkId);
            }
          }
          break;
        case "SET SEAT":
          {
            if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(() => _updateTransactionLineSeat(approverID: response.data?.userPKId ?? -1));
              });
            } else {
              _updateTransactionLineSeat(approverID: _currentUserPkId);
            }
          }
          break;
        case "REPEAT":
          {
            if (menuItem.requiresManagerApproval == 'Y' && !_isCurrentUserManager) {
              _showManagerLoginPopup(onAuthSuccess: (LoginResponse response) {
                Future.microtask(() => _repeatTransactionLine(approverID: response.data?.userPKId ?? -1));
              });
            } else {
              _repeatTransactionLine(approverID: _currentUserPkId);
            }
          }
          break;
        default:
          {
            _showFeatureNotImplementedDialog('${menuItem.taskTypeName} Feature');
          }
          break;
      }
    });
    return _iconicContextMenuView;
  }

  _printTransaction({int? approverID}) async {
    clearNotificationBar();
    final TransactionCubit transactionCubit = context.read<TransactionCubit>();
    final status = transactionCubit.state.transactionData?.transactionStatus;
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    String? allowTransactionPrintBeforeSaving = await masterDataBL.getDefaultValuesByName(defaultValueName: "ALLOW_TRX_PRINT_BEFORE_SAVING");
    if(status == 'ABANDONED' || status == 'REOPENED' || status == 'STARTED' || status == 'CANCELLED'
        || status == 'REVERSE_INITIATED') {
       _notificationBar.showMessage(
            MessagesProvider.get(
                "Transaction Current status is &1. &2 operation not permitted.",
                [status, "PRINT"]),
            AppColors.notoficationBGLightYellowColor);
        return;

    }
    if (transactionCubit.state.transactionData != null) {
      if(allowTransactionPrintBeforeSaving == 'Y') {
        await transactionCubit.getTransactionPrintReceipt();
        if (context.read<TransactionCubit>().state.transactionData != null) {
          switch (shouldPrintTransactionReceipt) {
            case "N":
              {
                ///NO – Don’t Print The transaction receipt
              }
              break;
            case "A":
              {
                ///ASK – Ask a confirmation to print receipt with yes and no options on screen
                Future.microtask(() {
                  showGeneralDialog(
                      context: context,
                      barrierDismissible: false,
                      barrierLabel: MaterialLocalizations
                          .of(context)
                          .modalBarrierDismissLabel,
                      barrierColor: Colors.black45,
                      transitionDuration: const Duration(milliseconds: 200),
                      pageBuilder:
                          (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
                        return PrintReceiptConfirmationDialog(
                          onConfirmTapped: () {
                            Future.microtask(() =>
                                loader.showLoaderDialog(context, "Printing transaction receipt..."));
                            if (Application.printerType == "SUNMI" &&
                                Application.deviceManufacturer == "SUNMI") {
                              printingMethodChannel.setMethodCallHandler(nativeMethodHandler);
                              Log.printMethodEnd(" SUNMITransactionPrint()",'Sales Screen','Print');
                              printingMethodChannel.invokeMethod("printReceipt", {
                                "type": "SUNMI",
                                "receipt": context
                                    .read<TransactionCubit>()
                                    .state
                                    .transactionPrintReceipt
                                    ?.data![0].data,
                                "receiptType": "TRANSACTION",
                                "isBitmap": true
                              });
                              Log.printMethodEnd(" SUNMITransactionPrint()",'Sales Screen','Print');
                            } else if (Application.printerType == "ZEBRA" &&
                                Application.isBluetoothSupported == true &&
                                Application.deviceManufacturer != "SUNMI") {
                              printingMethodChannel.setMethodCallHandler(nativeMethodHandler);
                              Log.printMethodEnd("ZEBRATransactionPrint()",'Sales Screen','Print');
                              printingMethodChannel.invokeMethod("printReceipt", {
                                "type": "ZEBRA",
                                "receipt": context
                                    .read<TransactionCubit>()
                                    .state
                                    .transactionPrintReceipt
                                    ?.data![0].data,
                                "receiptType": "TRANSACTION",
                                "isBitmap": true
                              });
                              Log.printMethodEnd("ZEBRATransactionPrint()",'Sales Screen','Print');
                            } else {
                              Future.microtask(() {
                                  if(loader.isOpen) {
                                    loader.hideLoaderDialog(context);
                                  }
                                  _notificationBar.showMessage(
                                      MessagesProvider.get(""
                                          "Unfortunately print receipt failed as Printer Type is not set up."), AppColors.notificationBGLightBlueColor);
                              });
                            }
                          },
                          onCancelTapped: () {
                          },
                        );
                      });
                });
              }
              break;
            case "Y":
              {
                ///YES  - The app should print the transaction receipt
                if (Application.printerType == "SUNMI" && Application.deviceManufacturer == "SUNMI") {
                  Future.microtask(() =>
                      loader.showLoaderDialog(context, "Printing transaction receipt..."));
                  printingMethodChannel.setMethodCallHandler(nativeMethodHandler);
                  printingMethodChannel.invokeMethod("printReceipt", {
                    "type": "SUNMI",
                    "receipt": context
                        .read<TransactionCubit>()
                        .state
                        .transactionPrintReceipt
                        ?.data![0].data,
                    "receiptType": "TRANSACTION",
                    "isBitmap": true
                  });
                } else if (Application.printerType == "ZEBRA" &&
                    Application.isBluetoothSupported == true &&
                    Application.deviceManufacturer != "SUNMI") {
                  Future.microtask(() =>
                      loader.showLoaderDialog(context, "Printing the transaction receipt..."));
                  printingMethodChannel.setMethodCallHandler(nativeMethodHandler);
                  printingMethodChannel.invokeMethod("printReceipt", {
                    "type": "ZEBRA",
                    "receipt": context
                        .read<TransactionCubit>()
                        .state
                        .transactionPrintReceipt
                        ?.data![0].data,
                    "receiptType": "TRANSACTION",
                    "isBitmap": true
                  });
                } else {
                  Future.microtask(() {
                    if(loader.isOpen) {
                      loader.hideLoaderDialog(context);
                    }
                    _notificationBar.showMessage(
                        MessagesProvider.get(""
                            "Unfortunately print receipt failed as Printer Type is not set up."), AppColors.notificationBGLightBlueColor);
                  });
                }
                break;
              }
          }
        }
      } else {
        _notificationBar.showMessage(MessagesProvider.get("Complete Transaction Before Printing."),
            AppColors.notoficationBGLightYellowColor);
      }
    } else {
      ///
      /// Transaction has not been initiated, hence showing a message in the bottom notification bar.
      ///
      _notificationBar.showMessage(MessagesProvider.get("Click on NEW button to proceed."),
          AppColors.notoficationBGLightYellowColor);
    }
  }

  void _onChangeStaffSelected(TransactionCubit transactionCubit,{int?approverID}) {
    clearNotificationBar();
    final status = transactionCubit.state.transactionData?.transactionStatus;
    if(status == 'CANCELLED' || status == 'REOPENED' || status == 'CLOSED' || status == 'ABANDONED'
        || status == 'PENDING_CLOSE' || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "CHANGE STAFF"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    if (transactionCubit.state.transactionData != null) {
      var userRoleId = transactionCubit.state.transactionData?.userId;
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierLabel:
          MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.black45,
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return ChangeStaffDialog(
                approverID:approverID,
              onChangeStaffCallback: (response) {
                try {
                  loader.showLoaderDialog(context);
                  alertDialogUpdateUICallback(response, MessagesProvider.get("Changed the staff successfully."));
                } on DioError catch (error) {
                  loader.showLoaderErrorDialog(context);
                }
              },
              isNFCAvailable: _isNFCAvailable,
              userId: userRoleId
            );
          });
    } else {
      ///
      /// Transaction has not been initiated, hence showing a message in the bottom notification bar.
      ///
      _notificationBar.showMessage(
          MessagesProvider.get("Click on NEW button to proceed."),
          AppColors.notoficationBGLightYellowColor);
    }
  }

  void _onRemarksSelected(TransactionCubit transactionCubit,{int? approverID}) {
    clearNotificationBar();
    final status = transactionCubit.state.transactionData?.transactionStatus;
    if(status == 'PENDING_CLOSE' || status == 'ABANDONED' || status == 'REOPENED' || status == 'CLOSED'
        || status == 'CANCELLED' || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "REMARKS"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    Log.printMethodStart('_onRemarksSelected()','SalesScreen','Remarks');
    if (transactionCubit.state.transactionData != null) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            Log.v('tramsaRemark ${transactionCubit.state.transactionData!.remarks}');
            return AddRemarkDialog(
              remarks: transactionCubit.state.transactionData?.remarks ?? '',
              onConfirm: (String? value) async {
                loader.showLoaderDialog(context);
                var execContextBL = await ExecutionContextBuilder.build();
                var sysExecContext = execContextBL.getExecutionContext();
                _transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
                TransactionResponse? transactionResponse =
                await _transactionDataBl.addTransactionRemark(remarks: value ?? '');
                Log.printMethodEnd('_onRemarksSelected()','SalesScreen','Remarks');
                Log.printMethodReturn('_onRemarksSelected() - Remarks added to transaction','SalesScreen','Remarks');
                alertDialogUpdateUICallback(transactionResponse,
                    MessagesProvider.get("Updated the transaction remarks successfully"));
              },
            );
          });
    } else {
      ///
      /// Transaction has not been initiated, hence showing a message in the bottom notification bar.
      ///
      _notificationBar.showMessage(MessagesProvider.get("Click on NEW button to proceed."),
          AppColors.notoficationBGLightYellowColor);
    }
  }

  Future<void> _onSaveSelected(TransactionCubit transactionCubit,{int? approverID}) async {
    clearNotificationBar();
    final status = transactionCubit.state.transactionData?.transactionStatus;
    if(status == 'CANCELLED' || status == 'CLOSED' || status == 'FULFILLED' || status == 'ABANDONED'
        || status == 'PENDING_CLOSE' || status == 'REOPENED' || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "SAVE"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    if(TS.isTablesScreenOpened.value.toString() == 'YES' || widget.fromTables == true){
      if (transactionCubit.state.transactionData != null) {
        await transactionCubit.saveTransaction(approverID:approverID, shouldPopAfterSave: TS.isTablesScreenOpened.value.toString() == 'YES').whenComplete((){
          if(isAllOrdersScreenOpened.value.toString() == 'YES'){
            Future.delayed(const Duration(seconds: 1),(){
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            });
          }else{
            Future.delayed(const Duration(seconds: 1),(){
              Navigator.of(context).pop();
            });
          }
        });
      } else {
        _notificationBar.showMessage(
            MessagesProvider.get("Click on NEW button to proceed."),
            AppColors.notoficationBGLightYellowColor);
      }
    }else{
      if (transactionCubit.state.transactionData != null) {
        await transactionCubit.saveTransaction(approverID:approverID,shouldPopAfterSave:(false));
      } else {
        _notificationBar.showMessage(
            MessagesProvider.get("Click on NEW button to proceed."),
            AppColors.notoficationBGLightYellowColor);
      }
    }
  }

  Future<void> _onSaveAndHoldSelected(TransactionCubit transactionCubit,{int?approverID}) async {
    clearNotificationBar();
    int pendingLines = 0;
    context.read<TransactionCubit>().state.transactionData?.transactionLineDTOList.forEach((element) {
      final lineStatus = element.lineStatus;
      if(lineStatus == 'CANCELLED' || lineStatus == 'CLOSED'|| lineStatus == 'ORDERED'|| lineStatus == 'FULFILLED'|| lineStatus == 'ABANDONED'|| lineStatus == 'REVERSED') {

      } else {
        pendingLines++;
      }
    });
    if(pendingLines == 0) {
      _notificationBar.showMessage(
          MessagesProvider.get("All transaction lines are saved already. No lines are pending fulfillment."),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    if (transactionCubit.state.transactionData != null) {
      if(TS.isTablesScreenOpened.value.toString() == 'YES' || widget.fromTables == true){
        await transactionCubit.saveAndHoldTransaction(approverID:approverID,shouldPopAfterSave: TS.isTablesScreenOpened.value.toString() == 'YES').whenComplete((){
          if(isAllOrdersScreenOpened.value.toString() == 'YES'){
            Future.delayed(const Duration(seconds: 1),(){
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            });
          }else{
            Future.delayed(const Duration(seconds: 1),(){
              Navigator.of(context).pop();
            });
          }
        });
      }else{
        await transactionCubit.saveAndHoldTransaction(approverID:approverID,shouldPopAfterSave:false);
      }
    } else {
      _notificationBar.showMessage(
          MessagesProvider.get("Click on NEW button to proceed."),
          AppColors.notoficationBGLightYellowColor);
    }
  }

  Future<void> _onCompleteSelected(TransactionCubit transactionCubit,
      {int? approverID}) async {
    clearNotificationBar();
    isCompleted = true;
    final status = transactionCubit.state.transactionData?.transactionStatus;
    if(status == 'CANCELLED' || status == 'ABANDONED' || status == 'CLOSED' || status == 'REVERSED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "COMPLETE"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    if (transactionCubit.state.transactionData != null) {
      final transaction = transactionCubit.state.transactionData;
      if((transaction?.transactionPaymentTotal ?? 0) < (transaction?.transactionNetAmount ?? 0)) {
        if(_defaultPaymentMode?.autoShowTenderedAmountKeyPad == true) {
          showDialog(context: context, barrierDismissible: false, builder: (_) {
            return Padding(
                padding: EdgeInsets.only(left: SizeConfig.getWidth(16), top: SizeConfig.getHeight(16), right: SizeConfig.getWidth(16), bottom: SizeConfig.blockSizeVertical * 10.8),
                child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(8),
                  child: BlocProvider<CashScreenCubit>(
                      create: (ctx) => CashScreenCubit(),
                      child: TenderScreen(initialAmt: transaction?.transactionNetAmount ?? 0,
                          totalAmt: transaction?.transactionNetAmount ?? 0, trxId: transaction?.transactionId ?? -1,
                          isFromSalesScreen: true)),
                ));
          }).then((value) {
            final trxUpdated = context.read<PaymentScreenCubit>().state.transactionResponse;
            if(trxUpdated != null) {
              context.read<PaymentScreenCubit>().updateTransaction(null, isSettleCompleted: false);
              context.read<TransactionCubit>().onTransactionDataUpdated(trxUpdated.data);
            }
            _performCompleteTransaction(transactionCubit, approverID: approverID);
          });
        } else if(_defaultPaymentMode != null && _defaultPaymentMode?.autoShowTenderedAmountKeyPad == false) {
          CashPaymentRequest? cashPaymentRequest;
          final execContextBL = await ExecutionContextBuilder.build();
          final execContext = execContextBL.getExecutionContext();
          if(mounted) {
            cashPaymentRequest = CashPaymentRequest(paymentId: -1, approverId: execContext?.userPKId ?? -1,
                transactionId: -1, paymentModeId: _defaultPaymentMode?.paymentModeId ?? 291,
                amount: context.read<TransactionCubit>().state.transactionData?.transactionNetAmount ?? 0, cashDrawerId: -1, parentPaymentId: -1, tipAmount: 0.0,
                tenderedAmount: context.read<TransactionCubit>().state.transactionData?.transactionNetAmount ?? 0, reference: ''
            );
            loader.showLoaderDialog(context, MessagesProvider.get("Adding payment..."));
            await context.read<PaymentScreenCubit>().addPayment(context.read<TransactionCubit>().state.transactionData?.transactionId ?? -1, cashPaymentRequest);
            if(mounted) {
              loader.hideLoaderDialog(context);
            }
            await _performCompleteTransaction(transactionCubit, approverID: approverID);
          }
        } else {
          await _performCompleteTransaction(transactionCubit, approverID: approverID);
        }
      } else {
        await _performCompleteTransaction(transactionCubit, approverID: approverID);
      }
    } else {
      _notificationBar.showMessage(
          MessagesProvider.get("Click on NEW button to proceed."),
          AppColors.notoficationBGLightYellowColor);
    }
  }

  Future<void> _performCompleteTransaction(TransactionCubit transactionCubit, {int? approverID}) async {
    bool hasAuthorizedPayment = false;
    _hasGoneToPaymentAfterComplete = false;
    if(transactionCubit.state.transactionData != null) {
      for (var element in transactionCubit.state.transactionData!.transactionPaymentDTOList) {
        if(element.paymentStatus == 'AUTHORIZED') {
          hasAuthorizedPayment = true;
          break;
        }
      }
    }
    context.read<TransactionCubit>().onTransactionDataUpdated(transactionCubit.state.transactionData);
    if(hasAuthorizedPayment) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext ctx) {
            return GenericDialog(
              onTapYes: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BlocProvider<SettleScreenCubit>(
                    create: (context) => SettleScreenCubit(),
                    child: PaymentSettlementScreen(
                      transactionId: transactionCubit.state.transactionData?.transactionId,
                      transactionData: transactionCubit.state.transactionData,
                      initialPage: 0,
                    )))).then((value) async {
                  if(context.read<PaymentScreenCubit>().state.isSettleCompleted) {
                    final trxAfterSettle = context.read<PaymentScreenCubit>().state.transactionResponse;
                    context.read<PaymentScreenCubit>().updateTransaction(null, isSettleCompleted: false);
                    context.read<TransactionCubit>().onTransactionDataUpdated(trxAfterSettle?.data);
                  }
                  if(TS.isTablesScreenOpened.value.toString() == 'YES' || widget.fromTables == true){
                    await context.read<TransactionCubit>().completeTransaction(shouldPopAfterSave: true, approverID:approverID,);
                  }else{
                    await context.read<TransactionCubit>().completeTransaction(shouldPopAfterSave: false, approverID:approverID,);
                  }
                });
              },
              onTapNo: () async {
                if(TS.isTablesScreenOpened.value.toString() == 'YES' || widget.fromTables == true){
                  await context.read<TransactionCubit>().completeTransaction(shouldPopAfterSave: true, approverID:approverID,);
                }else{
                  await context.read<TransactionCubit>().completeTransaction(shouldPopAfterSave: false, approverID:approverID,);
                }
              }, title: MessagesProvider.get('Settle Payments'),
              msg: MessagesProvider.get('Do you want to continue with settlement?'),
            );
          });
    } else {
      if(TS.isTablesScreenOpened.value.toString() == 'YES' || widget.fromTables == true){
        await context.read<TransactionCubit>().completeTransaction(shouldPopAfterSave: true, approverID:approverID,);
      }else{
        await context.read<TransactionCubit>().completeTransaction(shouldPopAfterSave: false, approverID:approverID,);
      }
    }
  }

  void _onPaymentSelected(TransactionCubit transactionCubit,{int?approverID}) {
    clearNotificationBar();
    if (context.read<TransactionCubit>().state.transactionData != null) {
      final transactionData = context.read<TransactionCubit>().state.transactionData;
      context.read<DeviceInterfaceCubit>().setBarCodeResult(null);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentSummaryScreen(transactionData: transactionData),
        ),
      ).then((value) {
        context.read<DeviceInterfaceCubit>().setPaymentScannerStatus(false);
        transactionCubit.setBarcodeReadData(null);
        final trxUpdatedData = context.read<PaymentScreenCubit>().state.transactionResponse;
        if (trxUpdatedData != null) {
          final totalPaidAmt = trxUpdatedData.data?.transactionPaymentTotal ?? 0.0;
          final totalAmt = trxUpdatedData.data?.transactionNetAmount ?? 0.0;
          if (totalPaidAmt == totalAmt && totalAmt != 0 && trxUpdatedData.data?.transactionStatus != 'CLOSED') {
            _notificationBar.showMessage(
                MessagesProvider.get('Payment details have been updated.'),
                AppColors.notificationBGLightBlueColor);
          }
          context
              .read<TransactionCubit>()
              .onTransactionDataUpdated(trxUpdatedData.data);
        }
        context.read<PaymentScreenCubit>().clear();
      });
    } else {
      _notificationBar.showMessage(
          MessagesProvider.get("Click on NEW button to proceed."),
          AppColors.notoficationBGLightYellowColor);
    }
  }

  void _onDetailsSelected(TransactionCubit transactionCubit,{int?approverID}) {
    clearNotificationBar();
    final status = transactionCubit.state.transactionData?.transactionStatus;
    if(status == 'ABANDONED' || status == 'REOPENED' || status == 'PENDING_CLOSE' || status == 'CANCELLED'
        || status == 'CLOSED' || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "DETAILS"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    if (transactionCubit.state.transactionData != null) {
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.black45,
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
            return TransactionOrderDetailsDialog(
              approverID:approverID,
              isUpdate: true,
              showNotification: (String? value, Color color) {
                _notificationBar.showMessage(value ?? '', color);
              },
              transactionCubit: transactionCubit,
              onComplete: () {},
            );
          });
    } else {
      ///
      /// Transaction has not been initiated, hence showing a message in the bottom notification bar.
      ///
      _notificationBar.showMessage(
          MessagesProvider.get("Click on NEW button to proceed."),
          AppColors.notoficationBGLightYellowColor);
    }
  }

  void _onCancelTransaction(TransactionCubit transactionCubit,{int?approverID}) {
    clearNotificationBar();
    final status = transactionCubit.state.transactionData?.transactionStatus;
    if(status == 'REOPENED' || status == 'PENDING_CLOSE' || status == 'CANCELLED' || status == 'ABANDONED'
        || status == 'CLOSED' || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "CANCEL"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    if (transactionCubit.state.transactionData != null) {
      transactionCubit.cancelTransactionAPI(approverID:approverID);
    } else {
      ///
      /// Transaction has not been initiated, hence showing a message in the bottom notification bar.
      ///
      _notificationBar.showMessage(
          MessagesProvider.get("Click on NEW button to proceed."),
          AppColors.notoficationBGLightYellowColor);
    }
  }

  void _onUnlockTransaction(TransactionCubit transactionCubit) {
    if (transactionCubit.state.transactionData != null) {
      transactionCubit.unlockTransaction();
    }
  }

  void _onReopenTransaction(TransactionCubit transactionCubit,{int?approverID}) {
    clearNotificationBar();
    final status = transactionCubit.state.transactionData?.transactionStatus;
    if(status == 'BOOKED' || status == 'REOPENED' || status == 'STARTED' || status == 'CANCELLED'
        || status == 'PENDING_CLOSE' || status == 'ORDERED' || status == 'ABANDONED'
    || status == 'CONFIRMED' || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "REOPEN"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
     if (transactionCubit.state.transactionData != null) {
       transactionCubit.reopenTransaction(approverID:approverID);
     } else {
      ///
      /// Transaction has not been initiated, hence showing a message in the bottom notification bar.
      ///
      _notificationBar.showMessage(
          MessagesProvider.get("Click on NEW button to proceed."),
          AppColors.notoficationBGLightYellowColor);
    }
  }

  void _onChangeTrxDate(TransactionCubit transactionCubit,{int?approverID}) {
    clearNotificationBar();
    final TransactionCubit transactionCubit = context.read<TransactionCubit>();
    final status = transactionCubit.state.transactionData?.transactionStatus;
    if(status == 'FULFILLED' || status == 'CLOSED' || status == 'ABANDONED' || status == 'ORDERED'
        || status == 'CANCELLED' || status == 'REVERSED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "CHANGE DATE"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    if (transactionCubit.state.transactionData != null) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return ChangeTransactionDateDialog(
              approverID:approverID,
                date: transactionCubit.state.transactionData?.transactionDate ?? '',
                dateTimeFormat: _dateTimeFormat,
                isEnabled: transactionCubit.state.transactionData?.transactionStatus == "ORDERED" ||transactionCubit.state.transactionData?.transactionStatus == "FULFILLED" ?false:true,
                onTransactionDateChangedCallback: () {
                  _notificationBar.showMessage(
                      MessagesProvider.get("Updated the transaction details successfully."),
                      AppColors.notificationBGLightBlueColor);
                },
              );
          });
    } else {
      ///
      /// Transaction has not been initiated, hence showing a message in the bottom notification bar.
      ///
      _notificationBar.showMessage(
          MessagesProvider.get("Click on NEW button to proceed."),
          AppColors.notoficationBGLightYellowColor);
    }
  }

  void _onResetSelected(TransactionCubit transactionCubit, {int?approverID}) {
    clearNotificationBar();
    final status = transactionCubit.state.transactionData?.transactionStatus;
    if(status == 'PENDING_CLOSE' || status == 'CANCELLED' || status == 'REOPENED' || status == 'ABANDONED'
        || status == 'FULFILLED' || status == 'CLOSED' || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "CLEAR"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    if (transactionCubit.state.transactionData != null) {
      transactionCubit.clearTransactionAPI(approverID:approverID);
    } else {
      ///
      /// Transaction has not been initiated, hence showing a message in the bottom notification bar.
      ///
      _notificationBar.showMessage(
          MessagesProvider.get("Click on NEW button to proceed."),
          AppColors.notoficationBGLightYellowColor);
    }
  }

  void _viewLogs(TransactionCubit transactionCubit,{int?approverID}) {
    clearNotificationBar();
    if(transactionCubit.state.transactionData != null){
      showDialog(context: context,
          barrierDismissible: false,
          builder: (_) => StatefulBuilder(
              builder: (context, setState) {
                return ViewLogsScreen(
                  approverID:approverID,
                  title: "TRANSACTION USER LOGS FOR ${transactionCubit.state.transactionData?.transactionId}",
                );
              }
          ));
    }else{
      _notificationBar.showMessage(
          MessagesProvider.get("Click on NEW button to proceed."),
          AppColors.notoficationBGLightYellowColor);
    }
  }

  void _transactionLookup({int?approverID}){
    clearNotificationBar();
    TransactionCubit transactionCubit = context.read<TransactionCubit>();
    if (transactionCubit.state.transactionData == null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TransactionLookup(),
        ),
      );
    }else{
      _discardChanges();
    }
  }

  void _discardChanges() async{
    TransactionCubit transactionCubit = context.read<TransactionCubit>();
    showDialog(context: context,
        barrierDismissible: false,
        builder: (_) => DiscardChanges(
          onOk: () async {
            //await transactionCubit.clearTransactionOnSalesScreenExit();
            await transactionCubit.unlockTransaction();
            if(!mounted) return;
            Navigator.pop(context);
            _transactionLookup();
          },
     ));
  }

  _getDateTimeFormat() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    final dateTimeFormat = await masterDataBL.getDefaultValuesByName(defaultValueName: "DATETIME_FORMAT");

    _dateTimeFormat = (dateTimeFormat!.contains("tt")) ? dateTimeFormat.replaceAll("tt", "a") : dateTimeFormat;
  }

  Future<void> _getDefaultPayMode() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    final payModeGuid = await masterDataBL.getDefaultValuesByName(defaultValueName: "DEFAULT_PAYMENT_MODE");
    final modes = await masterDataBL.getPaymentModes();
    final selectedMode = modes?.where((element) => element.guid.toUpperCase() == payModeGuid?.toUpperCase());
    if (selectedMode != null && selectedMode.isNotEmpty) {
      _defaultPaymentMode = selectedMode.first;
    }
  }

  _getSites() async{
    final execContextBL = await ExecutionContextBuilder.build();
     _execContextDTO = execContextBL.getExecutionContext()!;
    _masterDataBl = await MasterDataBuilder.build(_execContextDTO);
    _sitesResponse = await _masterDataBl.getSites();
  }

  void _onNonChargeableTapped(TransactionCubit transactionCubit, {int? approverID}) {
    clearNotificationBar();
    if (transactionCubit.state.transactionData != null) {
      if (transactionCubit.state.transactionData?.isNonChargeable == false) {
        final status = transactionCubit.state.transactionData?.transactionStatus;
        if(status == 'CLOSED' || status == 'CANCELLED' || status == 'REOPENED' || status == 'ABANDONED'
            || status == 'PENDING_CLOSE' || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
          _notificationBar.showMessage(
              MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "NON CHARGEABLE"]),
              AppColors.notoficationBGLightYellowColor);
          return;
        }
        _setTransactionNonChargeable(context, transactionCubit, approverID: approverID);
      } else {
        final status = transactionCubit.state.transactionData?.transactionStatus;
        if(status == 'PENDING_CLOSE' || status == 'ABANDONED' || status == 'CANCELLED' || status == 'REOPENED'
            || status == 'CLOSED' || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
          _notificationBar.showMessage(
              MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "CHARGEABLE"]),
              AppColors.notoficationBGLightYellowColor);
          return;
        }
        _setTransactionChargeable(context, transactionCubit, approverID: approverID);
      }
    } else {
      _notificationBar.showMessage(
          MessagesProvider.get("Click on NEW button to proceed."), AppColors.notoficationBGLightYellowColor);
    }
  }

  Future _setTransactionNonChargeable(BuildContext context, TransactionCubit transactionCubit, {int? approverID}) async {
    Log.printMethodStart('_setTransactionNonChargeable()','SalesScreen','Non Chargeable');
    try {
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();
      final transactionDataBl = await TransactionDataBuilder.build(execContext!);
      Future.microtask(() => loader.showLoaderDialog(
            context,
            MessagesProvider.get("Updating the transaction as non chargeable."),
          ));
      TransactionResponse response = await transactionDataBl.makeTransactionNonChargable(
          remarks: transactionCubit.state.transactionData?.remarks, approverID: approverID);
      Log.printMethodEnd('_setTransactionNonChargeable()','SalesScreen','Non Chargeable');
      Log.printMethodReturn('_setTransactionNonChargeable() - Transaction made non chargeable.','SalesScreen','Non Chargeable');
      setState(() {
        loader.hideLoaderDialog(context);
        context.read<TransactionCubit>().onTransactionDataUpdated(response.data);
        context.read<TransactionFunctionsCubit>().setTransactionIsNonChargeable(true);
        _notificationBar.showMessage(
            MessagesProvider.get("Updated the transaction as non chargeable."), AppColors.notificationBGLightBlueColor);
      });
    } on DioError catch (error) {
      setState(() {
        loader.hideLoaderDialog(context);
        _notificationBar.showMessage(
            MessagesProvider.get("${error.response?.data['data'] as String?}"), AppColors.notificationBGRedColor);
      });
    }
  }

  Future _setTransactionChargeable(BuildContext context, TransactionCubit transactionCubit, {int? approverID}) async {
    Log.printMethodStart('_setTransactionChargeable()','SalesScreen','Chargeable');
    try {
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();
      final transactionDataBl = await TransactionDataBuilder.build(execContext!);
      Future.microtask(
          () => loader.showLoaderDialog(context, MessagesProvider.get("Updating the transaction as chargeable.")));
      TransactionResponse response = await transactionDataBl.makeTransactionChargable(
          remarks: transactionCubit.state.transactionData?.remarks, approverID: approverID);
      Log.printMethodEnd('_setTransactionChargeable()','SalesScreen','Chargeable');
      Log.printMethodReturn('_setTransactionChargeable() - Transaction made chargeable.','SalesScreen','Chargeable');
      setState(() {
        loader.hideLoaderDialog(context);
        context.read<TransactionCubit>().onTransactionDataUpdated(response.data);
        context.read<TransactionFunctionsCubit>().setTransactionIsNonChargeable(false);
        _notificationBar.showMessage(
            MessagesProvider.get("Updated the transaction as chargeable."), AppColors.notificationBGLightBlueColor);
      });
    } on DioError catch (error) {
      setState(() {
        loader.hideLoaderDialog(context);
        _notificationBar.showMessage(
            MessagesProvider.get("${error.response?.data['data'] as String?}"), AppColors.notificationBGRedColor);
      });
    }
  }

  void _reverseTransactionLine({int?approverID}) {
    clearNotificationBar();
    final TransactionCubit transactionCubit = context.read<TransactionCubit>();
    final lineStatus = _selectedTransactionLinesGroup?.lineStatus;
    if(lineStatus == 'INITIATED' || lineStatus == 'CANCELLED' || lineStatus == 'ABANDONED' || lineStatus == 'REVERSED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Selected transaction line(s) status is &1. &2 operation not permitted.", [lineStatus, "REVERSE"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    if (transactionCubit.state.transactionData != null && _selectedTransactionLinesGroup != null) {
      if (_selectedTransactionLinesGroup?.lineStatus == "FULFILLED" ||
          _selectedTransactionLinesGroup?.lineStatus == "CLOSED" ||
          _selectedTransactionLinesGroup?.lineStatus == "ORDERED") {
        if ((_selectedTransactionLinesGroup?.transactionLines.length ?? 0) > 1) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return ProductQuantityDialog(MessagesProvider.get("Line Quantity"), (quantity) async {
                  if (int.parse(quantity) <= (_selectedTransactionLinesGroup?.transactionLines.length ?? 0)) {
                    List<TransactionLineDTO>? transactionLinesList =
                    _selectedTransactionLinesGroup?.transactionLines.getRange(0, int.parse(quantity)).toList();
                    List<int> transactionLinesIDs = [];
                    transactionLinesList?.forEach((transactionLine) {
                      transactionLinesIDs.add(transactionLine.transactionLineId);
                    });
                    _showReverseTransactionLineDialog(transactionCubit, transactionLinesIDs, approverID:approverID);
                  } else {
                    _notificationBar.showMessage(
                        MessagesProvider.get(
                            "Maximum quantity allowed is &1.", [_selectedTransactionLinesGroup?.transactionLines.length]),
                        AppColors.notoficationBGLightYellowColor);
                  }
                });
              });
        } else {
          List<TransactionLineDTO>? transactionLinesList = _selectedTransactionLinesGroup?.transactionLines;
          List<int> transactionLinesIDs = [];
          transactionLinesList?.forEach((transactionLine) {
            transactionLinesIDs.add(transactionLine.transactionLineId);
          });
          _showReverseTransactionLineDialog(transactionCubit, transactionLinesIDs,approverID:approverID);
        }
      } else {
        _notificationBar.showMessage(
            MessagesProvider.get("Selected transaction line(s) status is &1. &2 operation not permitted.",
                [_selectedTransactionLinesGroup?.lineStatus, "REVERSE"]),
            AppColors.notoficationBGLightYellowColor);
      }
    } else {
      _notificationBar.showMessage(
          MessagesProvider.get("Click on NEW button to proceed."), AppColors.notoficationBGLightYellowColor);
    }
  }

  void _showReverseTransactionLineDialog(TransactionCubit transactionCubit, List<int> transactionLinesIDs,{int? approverID}) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
          return ReversalDialog(
            productName: _selectedTransactionLinesGroup?.productName ?? "",
            onYes: (ReversalReasonData data) {
              showGeneralDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                  barrierColor: Colors.black45,
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
                    return ReverseObligationsDialog(
                      approverID: approverID,
                      isTransactionReversal: false,
                      transactionLinesIds: transactionLinesIDs,
                      data: data,
                      onReversed: (response, receipt) {
                        loader.showLoaderDialog(context);
                        alertDialogUpdateUICallback(response, MessagesProvider.get("Reversed the line."));
                        _loadTransactionFunctionItems(isForTransactionHeaderFunctions: true);
                      },
                      onReversalError: (String message) {
                        _notificationBar.showMessage(MessagesProvider.get(message), AppColors.notificationBGRedColor);
                      },);
                  });
            },
            onCancel: () {
              _notificationBar.showMessage(
                  MessagesProvider.get("Please enter remarks for transaction reversal"), AppColors.notoficationBGLightYellowColor);
            },
          );
        });
  }

  void _reverseTransaction({int?approverID}) {
    clearNotificationBar();
    final TransactionData? transactionData = context.read<TransactionCubit>().state.transactionData;
    final status = context.read<TransactionCubit>().state.transactionData?.transactionStatus;
    if(status == 'INITIATED' || status == 'CANCELLED' || status == 'ABANDONED' || status == 'PENDING_CLOSE'
        || status == 'REOPENED' || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
      _notificationBar.showMessage(
          MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "REVERSE"]),
          AppColors.notoficationBGLightYellowColor);
      return;
    }
    if (transactionData != null) {
      if (transactionData.transactionStatus == "REVERSED" || transactionData.transactionStatus == "ABANDONED") {
        _notificationBar.showMessage(
            MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.",
                [transactionData.transactionStatus, "REVERSE"]),
            AppColors.notoficationBGLightYellowColor);
      } else {
        showGeneralDialog(
            context: context,
            barrierDismissible: false,
            barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
            barrierColor: Colors.black45,
            transitionDuration: const Duration(milliseconds: 200),
            pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
              return ReversalDialog(
                productName: "",
                onYes: (ReversalReasonData data) {
                  showGeneralDialog(
                      context: context,
                      barrierDismissible: false,
                      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                      barrierColor: Colors.black45,
                      transitionDuration: const Duration(milliseconds: 200),
                      pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
                        final currentTrxStatus = context.read<TransactionCubit>().state.transactionData?.transactionStatus;
                        return ReverseObligationsDialog(
                          approverID: approverID,
                          isTransactionReversal: true,
                          transactionLinesIds: [],
                          data: data,
                          onReversed: (response, receipt) async {
                            loader.showLoaderDialog(context);
                            final trx = context.read<TransactionCubit>().state.transactionData;
                            if(trx?.transactionLineDTOList.isNotEmpty == true) {
                              if(trx?.transactionLineDTOList.first.lineStatus == 'ORDERED') {
                                loader.hideLoaderDialog(context);
                                if (response.exception != null) {
                                  _notificationBar.showMessage(MessagesProvider.get("Update Failed"), AppColors.notificationBGRedColor); //TODO Change the text accordingly.
                                } else {
                                  clearNotificationBar();
                                  context.read<TransactionCubit>().onTransactionDataUpdated(response.data);
                                }
                              } else {
                                context.read<TransactionCubit>().onTransactionDataUpdated(response.data);
                                alertDialogUpdateUICallback(
                                    response, MessagesProvider.get("Reversed the transaction successfully."));
                                if(currentTrxStatus == 'ORDERED') {
                                  await getAndPrintTransactionReceipt(receipt);
                                }
                              }
                            } else {
                              context.read<TransactionCubit>().onTransactionDataUpdated(response.data);
                              alertDialogUpdateUICallback(
                                  response, MessagesProvider.get("Reversed the transaction successfully."));
                              if(currentTrxStatus == 'ORDERED') {
                                await getAndPrintTransactionReceipt(receipt);
                              }
                            }
                          },
                          onReversalError: (String message) {
                            _notificationBar.showMessage(MessagesProvider.get(message), AppColors.notificationBGRedColor);
                          },
                        );
                      });
                },
                onCancel: () {
                  _notificationBar.showMessage(
                      MessagesProvider.get("Please enter remarks for transaction reversal"), AppColors.notoficationBGLightYellowColor);
                },
              );
            });
      }
    } else {
      _notificationBar.showMessage(
          MessagesProvider.get("Click on NEW button to proceed."), AppColors.notoficationBGLightYellowColor);
    }
  }

  Future<void> getAndPrintTransactionReceipt(TransactionPrintReceiptResponse? receipt) async {
    msgAfterPrint = 'Reversed the transaction successfully.';
    if(receipt != null) {
      context.read<TransactionCubit>().updateReceiptData(receipt);
    }
    if (context.read<TransactionCubit>().state.transactionData != null) {
      switch (shouldPrintTransactionReceipt) {
        case "N":
          {
            ///NO – Don’t Print The transaction receipt
          }
          break;
        case "A":
          {
            ///ASK – Ask a confirmation to print receipt with yes and no options on screen
            Future.microtask(() {
              showGeneralDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierLabel: MaterialLocalizations
                      .of(context)
                      .modalBarrierDismissLabel,
                  barrierColor: Colors.black45,
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder:
                      (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
                    return PrintReceiptConfirmationDialog(
                      onConfirmTapped: () async {
                        Future.microtask(() =>
                            loader.showLoaderDialog(context, "Printing transaction receipt..."));
                        if (Application.printerType == "SUNMI" &&
                            Application.deviceManufacturer == "SUNMI") {
                          printingMethodChannel.setMethodCallHandler(nativeMethodHandler);
                          Log.printMethodEnd(" SUNMITransactionPrint()",'Sales Screen','Print');
                          printingMethodChannel.invokeMethod("printReceipt", {
                            "type": "SUNMI",
                            "receipt": context
                                .read<TransactionCubit>()
                                .state
                                .transactionPrintReceipt
                                ?.data![0].data,
                            "receiptType": "TRANSACTION",
                            "isBitmap": true
                          });
                          Log.printMethodEnd(" SUNMITransactionPrint()",'Sales Screen','Print');
                        } else if (Application.printerType == "ZEBRA" &&
                            Application.isBluetoothSupported == true &&
                            Application.deviceManufacturer != "SUNMI") {
                          printingMethodChannel.setMethodCallHandler(nativeMethodHandler);
                          Log.printMethodEnd("ZEBRATransactionPrint()",'Sales Screen','Print');
                          printingMethodChannel.invokeMethod("printReceipt", {
                            "type": "ZEBRA",
                            "receipt": context
                                .read<TransactionCubit>()
                                .state
                                .transactionPrintReceipt
                                ?.data![0].data,
                            "receiptType": "TRANSACTION",
                            "isBitmap": true
                          });
                          Log.printMethodEnd("ZEBRATransactionPrint()",'Sales Screen','Print');
                        } else {
                          Future.microtask(() {
                            if(loader.isOpen) {
                              loader.hideLoaderDialog(context);
                            }
                            _notificationBar.showMessage(
                                MessagesProvider.get(""
                                    "Unfortunately print receipt failed as Printer Type is not set up."), AppColors.notificationBGLightBlueColor);
                          });
                        }
                      },
                      onCancelTapped: () {
                        context.read<TransactionCubit>().clearPrintReceiptData();
                        _notificationBar.showMessage(MessagesProvider.get("Reversed the transaction successfully."), AppColors.notificationBGLightBlueColor);
                      },
                    );
                  });
            });
          }
          break;
        case "Y":
          {
            ///YES  - The app should print the transaction receipt
            if (Application.printerType == "SUNMI" && Application.deviceManufacturer == "SUNMI") {
              Future.microtask(() =>
                  loader.showLoaderDialog(context, "Printing transaction receipt..."));
              printingMethodChannel.setMethodCallHandler(nativeMethodHandler);
              printingMethodChannel.invokeMethod("printReceipt", {
                "type": "SUNMI",
                "receipt": context
                    .read<TransactionCubit>()
                    .state
                    .transactionPrintReceipt
                    ?.data![0].data,
                "receiptType": "TRANSACTION",
                "isBitmap": true
              });
            } else if (Application.printerType == "ZEBRA" &&
                Application.isBluetoothSupported == true &&
                Application.deviceManufacturer != "SUNMI") {
              Future.microtask(() =>
                  loader.showLoaderDialog(context, "Printing the transaction receipt..."));
              printingMethodChannel.setMethodCallHandler(nativeMethodHandler);
              printingMethodChannel.invokeMethod("printReceipt", {
                "type": "ZEBRA",
                "receipt": context
                    .read<TransactionCubit>()
                    .state
                    .transactionPrintReceipt
                    ?.data![0].data,
                "receiptType": "TRANSACTION",
                "isBitmap": true
              });
            } else {
              Future.microtask(() {
                if(loader.isOpen) {
                  loader.hideLoaderDialog(context);
                }
                _notificationBar.showMessage(
                    MessagesProvider.get(""
                        "Unfortunately print receipt failed as Printer Type is not set up."), AppColors.notificationBGLightBlueColor);
              });
            }
            break;
          }
      }
    }
  }

  void clearNotificationBar() {
    debugPrint('Cleared notificationBar');
    _notificationBar.showMessage('', colorWhite);
  }
}
