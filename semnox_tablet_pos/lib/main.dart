import 'dart:async';

import 'package:application_prefs_data/builder.dart';
import 'package:application_prefs_data/environment.dart';
import 'package:attendance_ui/bloc/bloc/attendance_bloc.dart';
import 'package:background_fetch/background_fetch.dart';
import 'package:customer_ui/providers/SelectedCardDetailsProvider.dart';
import 'package:customer_ui/providers/SelectedCustomerNameProvider.dart';
import 'package:customer_ui/providers/SelectedCustomerProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:logs_data/logger.dart';
import 'package:orders_ui/providers/SelectedFacilityProvider.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:payment_ui/cubits/payment_summary/payment_screen_cubit.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:product_config_ui/order_transaction_lines_dialog/cubit/order_transaction_lines_cubit.dart';
import 'package:provider/provider.dart';
import 'package:semnox_tablet_pos/SplashScreen.dart';
import 'package:semnox_tablet_pos/config/application.dart';
import 'package:semnox_tablet_pos/config/constants.dart';
import 'package:semnox_tablet_pos/cubits/pos_config/pos_config_cubit.dart';
import 'package:semnox_tablet_pos/lock_screen_controller.dart';
import 'package:semnox_tablet_pos/utils/log_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themes_library/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_card_ui/card_functionality/cubit/card_functionality_cubit.dart';
import 'package:transaction_functions/cubit/transaction_functions_cubit.dart';
import 'package:transaction_functions/iconic_context_menu/help/help_dialog_data_theme_provider.dart';
import 'package:transaction_functions/iconic_context_menu/iconic_context_menu_theme_provider.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:widgets_library/cubits/device_interface_cubit.dart';

void main() async {
  runZonedGuarded(() async {
    await dotenv.load(fileName: Environment.fileName);
    ThemesProvider.init();
    DarkThemeProvider.init();
    HelpDialogDataThemeProvider.init();
    await IconicContextMenuThemeProvider.init();
    final preferences = await SharedPreferences.getInstance();
    final inactiveTimeOut = _getInactiveTimeOut(preferences);

    //Commenting as the bluetooth printer isn't supported in iOS devices.
    // Platform.isIOS ? _iosBluetoothConnectionCheck() : null;


    if (_isLoggingEnabled(preferences)) {
      var status = await Permission.storage.request();
      if (!status.isGranted || status.isDenied) {
        await Permission.storage.request();
        await Permission.manageExternalStorage.request();
        openAppSettings();
      }

      FlutterError.onError = (details) {
        Log.e(details.exception.toString());
        Log.e(details.stack.toString());
      };
    }
    WidgetsFlutterBinding.ensureInitialized();
    await ApplicationPrefsBuilder.build();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]).then((value) =>
        runApp(MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => SelectedCustomer()),
              ChangeNotifierProvider(create: (_) => SelectedCustomerName()),
              ChangeNotifierProvider(create: (_) => SelectedCardDetails()),
              ChangeNotifierProvider(create: (_) => SelectedFacility())
            ],
            child: MultiBlocProvider(providers: [
              BlocProvider<OtherFunctionBloc>(
                  create: (BuildContext context) => OtherFunctionBloc()),
              BlocProvider<AttendanceBloc>(
                  create: (BuildContext context) => AttendanceBloc()),
              BlocProvider<TransactionCubit>(
                create: (BuildContext context) => TransactionCubit(),
              ),
              BlocProvider<TransactionFunctionsCubit>(
                create: (BuildContext context) => TransactionFunctionsCubit(),
              ),
              BlocProvider<PaymentScreenCubit>(
                create: (BuildContext context) => PaymentScreenCubit(),
              ),
              BlocProvider<PosConfigCubit>(
                create: (BuildContext context) => PosConfigCubit(),
              ),
              BlocProvider<OrderTransactionLinesCubit>(
                create: (BuildContext context) => OrderTransactionLinesCubit(),
              ),
              BlocProvider<CardFunctionalityCubit>(
                  create: (BuildContext context) => CardFunctionalityCubit()),
              BlocProvider<DeviceInterfaceCubit>(
                  create: (BuildContext context) => DeviceInterfaceCubit()),
            ], child: POSApp(posInactiveTimeOut: inactiveTimeOut)))));
  }, (error, stackTrace) {
    Log.e('$error \n ${stackTrace.toString()}');
    });
}


bool _isLoggingEnabled(SharedPreferences preferences) {
  final status = preferences.getBool(isLoggingEnabled) ?? false;
  return status;
}

int _getInactiveTimeOut(SharedPreferences preferences) {
  final duration = preferences.getInt(posInactiveTimeOut) ?? 999;
  return duration;
}

//Commenting as the bluetooth printer isn't supported in iOS devices.
/*Future<void> _iosBluetoothConnectionCheck() async {
  const iosMethodChannel = MethodChannel('semnox.tablet.pos/bluetooth');
  try {
    await iosMethodChannel.invokeMethod('getBluetoothState');
  } on PlatformException catch (e) {
    Log.e("Failed to get bluetooth state: '${e.message}'.");
  }
}*/

class POSApp extends StatefulWidget {
  final int posInactiveTimeOut;
  const POSApp({super.key, required this.posInactiveTimeOut});

  @override
  State<POSApp> createState() => _POSAppState();
}

class _POSAppState extends State<POSApp> {
  late SessionConfig sessionConfig;

  @override
  void initState() {
    sessionConfig = SessionConfig(
      invalidateSessionForAppLostFocus:
          Duration(minutes: widget.posInactiveTimeOut),
      invalidateSessionForUserInactivity:
          Duration(minutes: widget.posInactiveTimeOut),
    );

    sessionConfig.stream.listen((SessionTimeoutState timeoutEvent) {
      if (timeoutEvent == SessionTimeoutState.userInactivityTimeout) {
        Application.sessionStateStream.add(SessionState.stopListening);
        Application.navKey.currentState?.pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => const LockScreenController()),
            (route) => false);
      } else if (timeoutEvent == SessionTimeoutState.appFocusTimeout) {
        Application.sessionStateStream.add(SessionState.stopListening);
        Application.navKey.currentState?.pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => const LockScreenController()),
            (route) => false);
      }
    });
    initPlatformState();
    super.initState();
  }

  Future<void> initPlatformState() async {
    // Configure BackgroundFetch.
    await BackgroundFetch.configure(BackgroundFetchConfig(
        minimumFetchInterval: 15,
        stopOnTerminate: true,
        enableHeadless: false,
        requiresBatteryNotLow: false,
        requiresCharging: false,
        requiresStorageNotLow: false,
        requiresDeviceIdle: false,
        requiredNetworkType: NetworkType.ANY
    ), (String taskId) async {  // <-- Event handler

      await LogUtils.instance.syncLogFiles().catchError((error) {
        Log.e("Syncing logs to server failed: ${error.toString()}");
        return false;
      });

      BackgroundFetch.finish(taskId);
    }, (String taskId) async {  // <-- Task timeout handler.
      BackgroundFetch.finish(taskId);
    });

    BackgroundFetch.start().then((int status) {

    }).catchError((e) {

    });
    if (!mounted) return;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SessionTimeoutManager(
      userActivityDebounceDuration: const Duration(seconds: 1),
      sessionConfig: sessionConfig,
      sessionStateStream: Application.sessionStateStream.stream,
      child: MaterialApp(
        title: 'Parafait POS',
        theme: semnoxThemeData(context, false),
        darkTheme: semnoxThemeData(context, true),
        debugShowCheckedModeBanner: false,
        navigatorKey: Application.navKey,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
        home: const SplashScreenPage(),
        supportedLocales: const [Locale('en', 'US')],
      ),
    );
  }
}
