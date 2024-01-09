import 'dart:async';
import 'dart:io';
import 'package:application_prefs_data/builder.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:install_plugin/install_plugin.dart';
import 'package:login_ui/utils/common_widgets.dart';
import 'package:logs_data/FileStorage.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/master_data_bl.dart';
import 'package:master_data/models/pos_machines_container/pos_printer_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:master_data/models/pos_machines_container/pos_machine_container_dto.dart';
import 'package:network_module/builder.dart';
import 'package:network_module/core/network/error_interceptor.dart';
import 'package:orders_data/blocs/app_blocs.dart';
import 'package:orders_data/blocs/app_events.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:payment_ui/cubits/payment_summary/payment_screen_cubit.dart';
import 'package:product_menu_data/builder.dart';
import 'package:semnox_tablet_pos/config/application.dart';
import 'package:semnox_tablet_pos/config/constants.dart';
import 'package:semnox_tablet_pos/dashboard_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shift_tracking_data/builder.dart';
import 'package:startup_data/builder.dart';
import 'package:startup_data/models/app_versions/app_versions_response.dart';
import 'package:startup_data/models/key_management/key_management_item.dart';
import 'package:system_user_login_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:startup_data/constants.dart' as constants;
import 'package:widgets_library/error_dialog.dart';
import 'package:widgets_library/generic_dialog.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'AppColors.dart';
import 'AppStyle.dart';
import 'login_controller.dart';
import 'pos_setup/pos_setup_screen.dart';


class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  bool _splashImgDownloaded = false;
  bool _hasValidationError = false;
  bool _isMasterDataSyncDone = false;
  bool _navigateToHome = false;
  bool _isEODPerformed = false;
  String? _brandImagePath;
  String _appName = "";
  String _appVersion = "";
  int _defaultSiteId = -1;
  late SharedPreferences preferences;
  String _loadingMessage = 'Please wait while we setup the application';
  late StreamSubscription<ApiError> errorStream;
  static const kioskModeMethodChannel = MethodChannel("semnox.tablet.pos/kiosk_mode_channel");
  static const deviceMethodChannel = MethodChannel("semnox.tablet.pos/device");
  static const printingMethodChannel = MethodChannel("semnox.tablet.pos/printing");

  final fileStorage = FileStorage();

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.microtask(() async {
      final executionContextBL = await ExecutionContextBuilder.build();
      final executionContext = executionContextBL.getExecutionContext();

      MessagesProvider.build(executionContext);
    });

    Future.microtask(
        () => {_readPackageInfo(), _updateSplashImage(), _checkAndNavigate()});

    Future.microtask(() => {
          _setUpErrorStreamListener(onStreamTriggered: () async {
            errorStream.cancel();
            await _refreshSplash();
          }, onConnectivityError: () {
            errorStream.cancel();
            Future.microtask(() => Application.navKey.currentState
                ?.pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const LoginController()),
                    (route) => false));
          })
        });

    if(Platform.isAndroid) {
      deviceMethodChannel.setMethodCallHandler(nativeMethodHandler);
      deviceMethodChannel.invokeMethod("getDeviceManufacturer");
      deviceMethodChannel.invokeMethod("requestBluetoothAndLocationPermission");
      deviceMethodChannel.invokeMethod("isBluetoothSupported");
    }
  }

  Future<dynamic> nativeMethodHandler(MethodCall methodCall) async {
    if(methodCall.method == "BLUETOOTH SUPPORT") {
      Application.isBluetoothSupported = methodCall.arguments;
    }
  }

  @override
  void dispose() {
    errorStream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
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
                padding: const EdgeInsets.only(
                    bottom: 0, right: 0, top: 40, left: 0),
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
                (_splashImgDownloaded && (_brandImagePath!=null))
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
    var appPrefsDataBL = await ApplicationPrefsBuilder.build();
    var executionContextBL = await ExecutionContextBuilder.build();
    var executionContext = executionContextBL.getExecutionContext();
    var systemUserLoginBL = await SystemUserLoginDataBuilder.build();
    var machineName = appPrefsDataBL.getMachineName();
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool(shouldUploadAllLogFiles, true);
    _defaultSiteId = appPrefsDataBL.getDefaultSiteId();
    final isPosSetupDone = preferences.getBool(isPosSetUpDone) ?? false;
    final isPosRegistered = preferences.getBool(isMachineRegistered) ?? false;
    if(!isPosRegistered) {
      await preferences.setBool(shouldRefreshServer, true);
    }
    await preferences.setBool(shouldRefreshLocalData, true);
    final currentPosPageIndex = preferences.getInt(currPosSetUpIndex) ?? 0;
    if (isPosSetupDone) {
      if (executionContext == null ||
          executionContext.isUserLoggedIn == false) {
        Log.v('User is not Logged In.');

        _navigateToHome = false;
        var machineId = await FlutterUdid.udid;
        if (kDebugMode) {
          machineId = 'MLR-LT023';
        }
        await systemUserLoginBL.login(machineName: machineId.toUpperCase(), siteId: appPrefsDataBL.getDefaultSiteId());
        _setLoadingMessage(MessagesProvider.get('Validating System Login'));
        final synced = await _callStartupApis();
        if (!synced) {
          return;
        }

        final executionContext = executionContextBL.getExecutionContext()?.copyWith(siteId: _defaultSiteId);
        final masterDataBL = await MasterDataBuilder.build(executionContext!);
        Log.printMethodStart('masterDataSync()', 'Splash Screen', 'Init');
        _setLoadingMessage(MessagesProvider.get('Loading Containers...'));
        _isMasterDataSyncDone = await masterDataBL.sync();
        _setLoadingMessage(MessagesProvider.get('Completed Loading Containers...'));
        Log.printMethodEnd('masterDataSync()', 'Splash Screen', 'Init');
        if (_hasValidationError) {
          return;
        }
        if (_isMasterDataSyncDone) {
          await checkAndSetKioskMode(masterDataBL);
          await preferences.setBool(isMachineRegistered, true);

          Future.microtask(() => {
                Navigator.pop(context),
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginController()))
              });
        } else {

        }
      } else {
        _navigateToHome = true;
        Log.v('User is Logged In.');
        final executionContext = executionContextBL.getExecutionContext()?.copyWith(siteId: _defaultSiteId);
        final masterDataBL = await MasterDataBuilder.build(executionContext!);
        _isEODPerformed = await checkIsPerformedEOD(executionContext);
        if(_isEODPerformed){
          showPerformedEOD();
          return;
        }
        final productMenuBL =
            await ProductMenuDataBuilder.build(executionContext);
        final synced = await _callStartupApis();

        if (!synced) {
          return;
        }
        _setLoadingMessage(MessagesProvider.get('Loading Containers...'));
        Log.printMethodStart('masterDataSync()', 'Splash Screen', 'Init');
        _isMasterDataSyncDone = await masterDataBL.sync();
        if (_isMasterDataSyncDone) {
          await masterDataBL.syncParafaitDefaultsContainer();
          await _updateSplashImage();
          await checkAndSetKioskMode(masterDataBL);
          await productMenuBL.sync();
          _setLoadingMessage(MessagesProvider.get('Completed Loading Containers...'));
          Log.printMethodEnd('masterDataSync()', 'Splash Screen', 'Init');
          if (_hasValidationError) {
            return;
          }

          if(Platform.isAndroid) {
            _setLoadingMessage(MessagesProvider.get('Loading Active Bluetooth Printers...'));
            await performBluetoothPrinterConnection(masterDataBL);
            }


          _setLoadingMessage(MessagesProvider.get('Application is ready to use.'));
          Future.microtask(() => {
            Navigator.pop(context),
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DashboardScreen()))
          });
        } else {

        }
      }
    } else {
      _navigateToPOSConfig(currentPosPageIndex);
    }
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
      //TODO Search for the printer id and then connect to the same.

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

  _navigateToPOSConfig(int currentPosPageIndex) async {
    if (mounted) {
      final result = await Navigator.push(context,
          MaterialPageRoute(builder: (context) => POSSetupScreen(initialIndex: currentPosPageIndex)));
      Log.v("POS setup completed");
      if (result == true) {
        _checkAndNavigate();
      } else {
        Log.v('POS setup not completed');
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
    try {
      final isDirectoryExists = await Directory('$localPath/images').exists();
      if(isDirectoryExists) {
        bool isImageAvailable = await File(_brandImagePath!).exists();
        setState(() {
          _splashImgDownloaded = isImageAvailable;
        });
      }
    } on Exception catch (error) {

    }
  }

  _readPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _appName = packageInfo.appName;
    _appVersion = "${packageInfo.version}+${packageInfo.buildNumber}";
  }

  Future<void> _setUpErrorStreamListener({
    required onStreamTriggered,
    required onConnectivityError,
  }) async {
    final networkBL = await NetworkModuleBuilder.build();

    errorStream = networkBL.getApiErrorStream().listen((event) async {
      if (event.name == ApiError.sessionExpired.name) {
        WidgetsBinding.instance.endOfFrame.then(
          (_) {
            if (mounted) {
              _showConfirmationDialog(context, onOkClicked: () {
                onStreamTriggered();
              });
            }
          },
        );
      } else if (event.name == ApiError.connectivityError.name) {
        if (mounted) {
          _showConnectivityErrorDialog(context, onOkClicked: () {
            onConnectivityError();
          });
        }
      }
    });
  }

  _refreshSplash() async {
    final executionContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = executionContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(executionContextDTO!);
    final productMenuDataBL = await ProductMenuDataBuilder.build(executionContextDTO);
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(shouldRefreshLocalData, true);
    if (mounted) {
      context.read<TransactionCubit>().clear();
      context.read<PaymentScreenCubit>().clear();
    }
    //clear session
    await executionContextBL.clearExecutionContext();
    masterDataBL.clear();
    productMenuDataBL.clear();

    Application.navKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const SplashScreenPage()),
        (route) => false);
  }

  _showConnectivityErrorDialog(BuildContext context,
      {required VoidCallback onOkClicked}) {
    showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  MessagesProvider.get('Network Issue'),
                  style: Theme.of(context).extension<SemnoxTheme>()!.heading5?.copyWith(fontSize: SizeConfig.getFontSize(32), fontWeight: FontWeight.w400),
                ),
              ),
              content: Text(
                MessagesProvider.get('Network Issue. Please relogin to continue. Verify status of your last action before performing the action again.'),
                style: Theme.of(context).extension<SemnoxTheme>()!.heading5?.copyWith(fontSize: SizeConfig.getFontSize(26), fontWeight: FontWeight.w400),
              ),
              actions: [
                CupertinoDialogAction(
                  child: Text(
                    MessagesProvider.get('OK'),
                    style: Theme.of(context).extension<SemnoxTheme>()!.heading5?.copyWith(fontSize: SizeConfig.getFontSize(32), fontWeight: FontWeight.w400),
                  ),
                  onPressed: () {
                    onOkClicked();
                    // Navigator.pop(context);
                  },
                ),
              ],
            ),
        barrierDismissible: false);
  }

  _showConfirmationDialog(BuildContext context,
      {required VoidCallback onOkClicked}) {
    showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  MessagesProvider.get('Session Expired'),
                  style: Theme.of(context).extension<SemnoxTheme>()!.heading5?.copyWith(fontSize: SizeConfig.getFontSize(32), fontWeight: FontWeight.w400),
                ),
              ),
              content: Text(
                MessagesProvider.get('Please re-login'),
                style: Theme.of(context).extension<SemnoxTheme>()!.heading5?.copyWith(fontSize: SizeConfig.getFontSize(26), fontWeight: FontWeight.w400),
              ),
              actions: [
                CupertinoDialogAction(
                  child: Text(
                    MessagesProvider.get('OK'),
                    style: Theme.of(context).extension<SemnoxTheme>()!.heading5?.copyWith(fontSize: SizeConfig.getFontSize(32), fontWeight: FontWeight.w400),
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

  Future<bool> _callStartupApis() async {
    final executionContextBL = await ExecutionContextBuilder.build();
    final executionContext = executionContextBL.getExecutionContext()?.copyWith(siteId: _defaultSiteId);
    final startupDataBL = await StartupDataBuilder.build(executionContext!);
    final masterDataBL = await MasterDataBuilder.build(executionContext);

    final isServerOnline = await startupDataBL.isServerAvailable();
    if (isServerOnline) {
      Log.printMethodStart('callValidationApis()', 'Splash Screen', 'Init');

      if(Platform.isAndroid) {
        try {
          /// check app versions - download if new version available.
          final response = await startupDataBL.checkAppVersions();
          await checkAndInstall(response);
        } on DioError catch (error) {
          _hasValidationError = true;
          final errorString = error.response?.data['data'] as String?;
          Log.e('Parafait Versions api Error: ${error.toString()}');
        }
      }

      /// delete old log files
      fileStorage.deleteFileList();

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

  Future<void> checkAndInstall(AppVersionsResponse response) async {
    final version = response.data?.where((element) => element.parafaitExecutableName == 'TabletPOS.exe').toList();
    if(version?.isNotEmpty == true) {
      final apiVersion = '${version!.first.majorVersion}.${version.first.minorVersion}.${version.first.patchVersion}';
      bool isNewVersionAvailable = isVersionGreaterThan(apiVersion, _appVersion.split('+')[0]);
      bool shouldUpgradeApp = false;
      var appDocDir = await getTemporaryDirectory();
      final appPrefsBL = await ApplicationPrefsBuilder.build();
      String savePath = "${appDocDir.path}/ParafaitTabletPOS.apk";
      String fileUrl = "${appPrefsBL.getServerUrl()}/apk/ParafaitTabletPOS.apk";
      var file = File(savePath);
      bool isInstallMode = file.existsSync();
      if(isNewVersionAvailable) {
       if(mounted) {
         await _showUpgradeDialog(context, isInstallMode,() async { /// onTapYes
           shouldUpgradeApp = true;
         });
       }
      }
      if(shouldUpgradeApp) {
        double progressValue = 0.0;
        if(!file.existsSync()) {
          await Dio().download(fileUrl, savePath, onReceiveProgress: (count, total) {
            final value = count / total;
            if (progressValue != value) {
              setState(() {
                if (progressValue < 1.0) {
                  progressValue = count / total;
                } else {
                  progressValue = 0.0;
                }
                _setLoadingMessage('Downloading app... ${(progressValue * 100).toStringAsFixed(0)}%');
              });
            }
          });
        }
        var res = await InstallPlugin.install(savePath);
        if(res.toString() == 'Install Cancel') {
          res = await InstallPlugin.install(savePath);
        }
      }
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
                  if (_isMasterDataSyncDone) {
                    if (_navigateToHome) {
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
                            Navigator.pop(context),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LoginController()))
                          });
                    }
                  }
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

  Future<void> _showUpgradeDialog(BuildContext context, bool isInstallMode, VoidCallback onTapYes) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => GenericDialog(
          positiveBtnMsg: isInstallMode ? 'Install' : 'Download',
          isSingleBtnMode: true,
          onTapOk: () {
            onTapYes();
          },
          onTapYes: () {},
          onTapNo: () {}, title: MessagesProvider.get('Update Available').toUpperCase(),
          msg: MessagesProvider.get('New version of application is available'),
        ));
  }

  void _setLoadingMessage(String message) {
    setState(() {
      _loadingMessage = message;
    });
  }

  Future<void> checkAndSetKioskMode(MasterDataBLContract masterDataBL) async {
    if(Platform.isAndroid) {
      final kioskDefault = await masterDataBL.getDefaultValuesByName(defaultValueName: 'FULL_SCREEN_POS');
      if(kioskDefault == 'Y') {
        kioskModeMethodChannel.invokeMethod('startKioskMode');
      } else if(kioskDefault == 'N') {
        kioskModeMethodChannel.invokeMethod('stopKioskMode');
      }
      }
    }

  Future<bool> checkIsPerformedEOD(ExecutionContextDTO executionContext)async{
    try{
      final shiftTrackingBL = await ShiftTrackDataBuilder.build(executionContext);
      final  response = await shiftTrackingBL.getEndOfDayStatus(executionContext.machineId!);
      if (response.exception == null && response.message == null) {
        print(" from EOD==>${response.data}");
        return response.data;
      }
    } on DioError catch(error){
      var errorString = error.response?.data['data'] as String?;
      print("$errorString");
    }
   return false;
  }

  showPerformedEOD(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          final theme =
          Theme.of(context).extension<SemnoxTheme>()!;
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
                        MessagesProvider.get(
                            "End of the Day is Performed")
                            .toUpperCase(),
                        style: theme.heading5?.copyWith(
                            fontSize:
                            SizeConfig.getFontSize(34))),
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
                        "POS End of the Day is Performed for the current business day. You are not allowed to use this POS till next business day",
                        style: theme.description3?.copyWith(
                            fontSize: SizeConfig.getFontSize(34)),
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
                                fontSize:
                                SizeConfig.getFontSize(
                                    32),
                                fontWeight:
                                FontWeight.w600) ??
                                tsS24W70016,
                            onTapped: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginController()));

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
}
