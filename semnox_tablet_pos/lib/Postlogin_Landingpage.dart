import 'dart:io';


import 'package:application_prefs_data/builder.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/pos_machines_container/pos_machine_container_dto.dart';
import 'package:master_data/master_data_bl.dart';
import 'package:master_data/models/pos_machines_container/pos_printer_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:product_menu_data/builder.dart';
import 'package:semnox_tablet_pos/config/application.dart';
import 'package:semnox_tablet_pos/config/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startup_data/builder.dart';
import 'package:startup_data/models/key_management/key_management_item.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/builder.dart';
import 'package:logs_data/logger.dart';
import 'package:widgets_library/error_dialog.dart';
import 'package:startup_data/constants.dart' as constants;

import 'dashboard_ui.dart';

class PostLogin_LandingPage extends StatefulWidget {
  const PostLogin_LandingPage({super.key});

  @override
  State<PostLogin_LandingPage> createState() => _PostLogin_LandingPageState();
}

class _PostLogin_LandingPageState extends State<PostLogin_LandingPage> {
  bool _splashImgDownloaded = false;
  bool _hasValidationError = false;
  int _defaultSiteId = -1;
  String? _brandImagePath;
  String _appName = "";
  String _appVersion = "";
  String _loadingMessage = '';
  static const deviceMethodChannel = MethodChannel("semnox.tablet.pos/device");
  static const printingMethodChannel = MethodChannel("semnox.tablet.pos/printing");
  late SharedPreferences preferences;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.microtask(
        () => {_readPackageInfo(), _updateSplashImage(), _checkAndNavigate()});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: theme.primaryColor ?? Colors.white,
        appBar: AppBar(
          toolbarHeight: 110,
          centerTitle: true,
          backgroundColor: theme.primaryColor ?? Colors.white,
          elevation: 0,
          title: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 0, right: 0, top: 40, left: 0),
                child: Text(
                  _appName,
                  style: theme.heading5?.copyWith(fontSize: 24),
                ),
              ),
              Text(
                _appVersion,
                style: theme.heading5?.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (_splashImgDownloaded)
                  ? Image.file(
                      File(_brandImagePath!),
                      width: 352,
                      height: 92,
                    )
                  : Image.asset(
                      'assets/SemnoxLogo.png',
                      width: 352,
                      height: 92,
                    ),
              const SizedBox(height: 70),
              const CircularProgressIndicator(),
              const SizedBox(height: 15),
              Text(_loadingMessage, style: theme.heading5?.copyWith(fontSize: 16, fontWeight: FontWeight.w400))
            ],
          ),
        ),
      ),
    );
  }

  _checkAndNavigate() async {
    // _splashImgDownloaded = true;
    final executionContextBL = await ExecutionContextBuilder.build();
    final executionContext = executionContextBL.getExecutionContext();
    final productMenuBL = await ProductMenuDataBuilder.build(executionContext!);
    final transactionDataBl = await TransactionDataBuilder.build(executionContext);
    final masterDataBL = await MasterDataBuilder.build(executionContext);
    final appPrefsDataBL = await ApplicationPrefsBuilder.build();
    _defaultSiteId = appPrefsDataBL.getDefaultSiteId();

    final sharedPreferences = await SharedPreferences.getInstance();
    final siteChanged = sharedPreferences.getBool(isSiteChanged) ?? false;
    if(siteChanged) { /// if site is changed, some functions in application wont work, so refreshing containers.
      await sharedPreferences.setBool(shouldRefreshLocalData, true);
      await sharedPreferences.setBool(shouldRefreshServer, true);
      ///calling validation apis again to verify whether machine is registered in site.
      final synced = await _callStartupApis();
      if (!synced) {
        return;
      }
      await masterDataBL.sync();
      await sharedPreferences.setBool(isSiteChanged, false);
    }
    _setLoadingMessage('Syncing Parafait Defaults...');
    await masterDataBL.syncParafaitDefaultsContainer();
    _setLoadingMessage('Downloading Product Menu...');
    Log.printMethodStart('productMenuSync()', 'Splash Screen', 'Init');
    await productMenuBL.sync();
    Log.printMethodEnd('productMenuSync()', 'Splash Screen', 'Init');

    if(Platform.isAndroid) {
      deviceMethodChannel.setMethodCallHandler(nativeMethodHandler);
      deviceMethodChannel.invokeMethod("getDeviceManufacturer");
      deviceMethodChannel.invokeMethod("requestBluetoothAndLocationPermission");
      deviceMethodChannel.invokeMethod("isBluetoothSupported");
      Application.printerType = await masterDataBL.getDefaultValuesByName(defaultValueName: "PRINTER_TYPE");

      _setLoadingMessage(MessagesProvider.get('Loading Active Bluetooth Printers...'));
      await performBluetoothPrinterConnection(masterDataBL);
    }

    _setLoadingMessage(MessagesProvider.get('Application is ready to use.'));
    sharedPreferences.setBool(shouldRefreshLocalData, false);
    sharedPreferences.setBool(shouldRefreshServer, false);

    Future.microtask(() => {
          Navigator.pop(context),
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DashboardScreen()))
        });
  }

  Future<void> performBluetoothPrinterConnection(MasterDataBLContract masterDataBL) async {
    final executionContextBL = await ExecutionContextBuilder.build();
    final executionContext = executionContextBL.getExecutionContext();

    var printerTypes = await masterDataBL.getLookUpValuesByName("PRINTER_TYPE");
    var receiptPrinterLookupValueId = -1;
    if(printerTypes?.isNotEmpty == true) {
      printerTypes?.forEach((printerContainer) {
        if(printerContainer.lookupValue == "ReceiptPrinter") {
          receiptPrinterLookupValueId = printerContainer.lookupValueId;
        }
      });

      var activePrinters = await masterDataBL.getActivePrinters();
      if (activePrinters?.data?.isNotEmpty == true) {
        Application.activePrinters = activePrinters?.data;
      }
    }

    if(receiptPrinterLookupValueId != -1) {
      final posContainer = await masterDataBL.getPosMachines();
      var printerId = -1;
      List<POSPrinterContainerDTO> posPrinterContainerDTOList = [];
      if(posContainer != null) {
        for(var responsePrinter in posContainer) {
          if(responsePrinter.posMachineId == executionContext?.machineId) {
            posPrinterContainerDTOList = responsePrinter.posPrinterContainerDTOList;
          }
        }
      }

      for(var responsePrinter in posPrinterContainerDTOList) {
        if(responsePrinter.printerTypeId == receiptPrinterLookupValueId) {
          printerId = responsePrinter.printerId;
          break;
        }
      }

      if(Application.activePrinters != null) {
        for(var activePrinter in Application.activePrinters!) {
          if(activePrinter.printerId == printerId) {
            preferences = await SharedPreferences.getInstance();
            preferences.setString(connectedPrinterMacAddress, activePrinter.ipAddress!);
            if(activePrinter.ipAddress != null) {
              preferences.setString(connectedPrinterMacAddress, activePrinter.ipAddress!);
            }
            printingMethodChannel.invokeMethod(
                "saveRegisteredPrinter",
                {"bluetoothPrinterMacAddress": activePrinter.ipAddress!});
            printingMethodChannel.invokeMethod(
                "connectToPrinter",
                {"bluetoothPrinterMacAddress": activePrinter.ipAddress!});
            break;
          }
        }
      }
    }
  }

  get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  _updateSplashImage() async {
    var localPath = await _localPath;
    _brandImagePath = '$localPath/images/splash.jpg';
    bool isImageAvailable = await File(_brandImagePath!).exists();
    setState(() {
      _splashImgDownloaded = isImageAvailable;
    });
  }

  _readPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _appName = packageInfo.appName;
    _appVersion = "${packageInfo.version}+${packageInfo.buildNumber}";
  }

  void _setLoadingMessage(String message) {
    setState(() {
      _loadingMessage = message;
    });
  }

  Future<dynamic> nativeMethodHandler(MethodCall methodCall) async {
    if(methodCall.method == "BLUETOOTH SUPPORT") {
      Application.isBluetoothSupported = methodCall.arguments;
    }
  }

  Future<bool> _callStartupApis() async {
    final executionContextBL = await ExecutionContextBuilder.build();
    final executionContext = executionContextBL.getExecutionContext()?.copyWith(siteId: _defaultSiteId);
    final startupDataBL = await StartupDataBuilder.build(executionContext!);
    final masterDataBL = await MasterDataBuilder.build(executionContext);

    final isServerOnline = await startupDataBL.isServerAvailable();
    if (isServerOnline) {
      Log.printMethodStart('callValidationApis()', 'Splash Screen', 'Init');

      try {
        /// validate license
        _setLoadingMessage(MessagesProvider.get('Validating License...'));
        final response = await startupDataBL.validateLicense();
        final validated = await _validateLicenseApi(response.data);
        if (!validated) {
          _hasValidationError = true;
          return false;
        }
        _setLoadingMessage(MessagesProvider.get('Completed Validating License...'));
      } on DioError catch (error) {
        _hasValidationError = true;
        final errorString = error.response?.data['data'] as String?;
        Future.microtask(() => _showErrorDialog(
            context, 'Validate Pos License'.toUpperCase(), errorString ?? '',
            isWarning: false));
        Log.e('Validating License Error: ${error.toString()}');
        return false;
      }

      try {
        /// validate pos machine count
        _setLoadingMessage(MessagesProvider.get('Validating Licensed POS Count...'));
        final posResponse = await masterDataBL.syncPosMachineContainer();
        if(kReleaseMode) { /// call this validation on release mode only for convenience.
          final isMachinePresent = await _validatePosMachineName(posResponse?.data?.posMachineContainerDTOList);
          if(!isMachinePresent) {
            Log.e('Machine name not found in pos server');
            _hasValidationError = true;
            return false;
          }
          final response = await startupDataBL.validatePosMachineCount(posResponse?.data?.posMachineContainerDTOList.length ?? 0);
          final validated = await _validatePosMachineCountApi(response.data);
          if (!validated) {
            _hasValidationError = true;
            return false;
          }
        }
      } on DioError catch (error) {
        _hasValidationError = true;
        final errorString = error.response?.data['data'] as String?;
        Future.microtask(() => _showErrorDialog(
            context, 'Validate Pos License'.toUpperCase(), errorString ?? ''));
        Log.e('Validating POS Machine Count Error: ${error.toString()}');
      }

      try {
        /// validate max card
        final response = await startupDataBL.validateMaxCard();
        final validated = await _validateMaxCardApi(response.data);
        if (!validated) {
          _hasValidationError = true;
          return false;
        }
      } on DioError catch (error) {
        _hasValidationError = true;
        final errorString = error.response?.data['data'] as String?;
        Future.microtask(() => _showErrorDialog(
            context, 'Validate Max Cards'.toUpperCase(), errorString ?? ''));
        Log.e('Validate Max Cards Error: ${error.toString()}');
      }

      try {
        /// validate max transaction number
        _setLoadingMessage(MessagesProvider.get('Validating Transaction Number.'));
        final response = await startupDataBL.validateTransactionNumber();
        final validated = await _validateMaxTransactionNumberApi(response.data);
        if (!validated) {
          _hasValidationError = true;
          return false;
        }
        _setLoadingMessage(MessagesProvider.get('Completed Validating Transaction Number.'));
      } on DioError catch (error) {
        _hasValidationError = true;
        final errorString = error.response?.data['data'] as String?;
        Future.microtask(() => _showErrorDialog(context,
            'Validate Max Invoice Sequences'.toUpperCase(), errorString ?? '',
            isWarning: false));
        Log.e('Validating Transaction Number Error: ${error.toString()}');
        return false;
      }
      Log.printMethodEnd('callValidationApis()', 'Splash Screen', 'Init');
      Log.printMethodReturn('callValidationApis() - true', 'Splash Screen', 'Init');
      return true;
    } else {
      return false;
    }
  }

  bool isVersionGreaterThan(String newVersion, String currentVersion){
    List<String> currentV = currentVersion.split(".");
    List<String> newV = newVersion.split(".");
    bool a = false;
    for (var i = 0 ; i <= 2; i++){
      a = int.parse(newV[i]) > int.parse(currentV[i]);
      if(int.parse(newV[i]) != int.parse(currentV[i])) break;
    }
    return a;
  }

  Future<bool> _validateLicenseApi(dynamic response) async {
    if (response is String) {
      Future.microtask(() => _showErrorDialog(
          context, 'Validate Pos License'.toUpperCase(), response.toString()));
      return false;
    } else {
      final resp = response as List;
      if (resp.isEmpty) {
        return true;
      } else {
        final keyResp = KeyManagementItem.fromJson(resp[0]);
        final message = _getMessage(
            constants.keyErrorMap[keyResp.messageNumber] ?? '',
            keyResp.parameters);
        Future.microtask(() => _showErrorDialog(
            context, 'Validate Pos License'.toUpperCase(), message));
        return true;
      }
    }
  }

  Future<bool> _validatePosMachineCountApi(dynamic response) async {
    if (response is String) {
      if (response.isEmpty) {
        return true;
      } else {
        Future.microtask(() => _showErrorDialog(context,
            'Validate Pos License'.toUpperCase(), response.toString()));
        return true;
      }
    }
    return false;
  }

  Future<bool> _validatePosMachineName(List<POSMachineContainerDTO>? machineList) async {
    final machineId = await FlutterUdid.udid;
    if (machineList != null) {
      if (machineList.isEmpty) {
        Future.microtask(() => _showErrorDialog(context,
            'Invalid Pos Machine: $machineId'.toUpperCase(), 'Please register the POS in POS management setup. Contact semnox for any queries', isWarning: false));
        return false;
      } else {
        var isMachinePresent = false;
        for (var element in machineList) {
          if(element.computerName.toUpperCase() == machineId.toUpperCase()) {
            isMachinePresent = true;
          }
        }
        if(!isMachinePresent) {
          Future.microtask(() => _showErrorDialog(context,
              'Invalid Pos Machine: $machineId'.toUpperCase(), 'Please register the POS in POS management setup. Contact semnox for any queries', isWarning: false));
        }
        return isMachinePresent;
      }
    }
    Future.microtask(() => _showErrorDialog(context,
        'Invalid Pos Machine: $machineId'.toUpperCase(), 'Please register the POS in POS management setup. Contact semnox for any queries', isWarning: false));
    return false;
  }

  Future<bool> _validateMaxCardApi(dynamic response) async {
    if (response is String) {
      Future.microtask(() => _showErrorDialog(
          context, 'Validate Max Cards'.toUpperCase(), response.toString()));
      return false;
    } else {
      final resp = response as List;
      if (resp.isEmpty) {
        return true;
      } else {
        final keyResp = KeyManagementItem.fromJson(resp[0]);
        final message = _getMessage(
            constants.keyErrorMap[keyResp.messageNumber] ?? '',
            keyResp.parameters);
        Future.microtask(() => _showErrorDialog(
            context, 'Validate Max Cards'.toUpperCase(), message));
        return true;
      }
    }
  }

  Future<bool> _validateMaxTransactionNumberApi(dynamic response) async {
    if (response is String) {
      Future.microtask(() => _showErrorDialog(context,
          'Validate Max Invoice Sequences'.toUpperCase(), response.toString()));
      return false;
    } else {
      final resp = response as List;
      if (resp.isEmpty) {
        return true;
      } else {
        final message = resp[0].toString();
        Future.microtask(() => _showErrorDialog(
            context, 'Validate Max Invoice Sequences'.toUpperCase(), message));
        return true;
      }
    }
  }

  String _getMessage(String msg, [List<dynamic> args = const []]) {
    int i = 0;
    for (dynamic arg in args) {
      i++;
      msg = msg.replaceAll("&$i", "$arg");
    }
    return msg;
  }

  _showErrorDialog(BuildContext context, String title, String message,
      {bool isWarning = true}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => ErrorDialog(
          title: title,
          message: message,
          onTapOk: () {
            _hasValidationError = false;
            if (isWarning) {
              Future.microtask(() => {
                Navigator.pop(context),
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const DashboardScreen()))
              });
            } else {
              Future.microtask(() => {
                if (Platform.isAndroid)
                  {SystemNavigator.pop()}
                else if (Platform.isIOS)
                  {exit(0)}
              });
            }
          },
        ));
  }

}
