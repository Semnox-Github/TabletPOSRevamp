import 'package:application_prefs_data/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:login_ui/lock_screen_view.dart';
import 'package:login_ui/login_view.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:semnox_tablet_pos/AppStyle.dart';
import 'package:semnox_tablet_pos/config/application.dart';
import 'package:semnox_tablet_pos/pos_setup/pos_setup_screen.dart';
import 'package:semnox_tablet_pos/Postlogin_Landingpage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sprintf/sprintf.dart';
import 'package:messages_data/builder.dart';
import 'package:logs_data/logger.dart';
import 'package:system_user_login_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/keyboard_hider_widget.dart';
import 'package:widgets_library/utils/size_config.dart';

import 'dashboard_ui.dart';

class LockScreenController extends StatefulWidget {
  const LockScreenController({Key? key}) : super(key: key);

  @override
  State<LockScreenController> createState() => _LockScreenControllerState();
}

class _LockScreenControllerState extends State<LockScreenController> {

  final appNameNotifier = ValueNotifier('');
  final appVersionNotifier = ValueNotifier('');

  // Variables in the state class
  var startTap = timeNow;
  var consecutiveTaps = 1;
  static const int serialTaps = 4;
  static const int finalTap = 7;
  static const int tapDurationInMs = 3000;
  static int get timeNow => DateTime.now().millisecondsSinceEpoch;

  @override
  void initState() {
    Future.microtask(() => {_readPackageInfo()});
    Future.microtask(() => {_updateExecutionContext()});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Scaffold(
        body: KeyboardHider(
          child: SafeArea(
              child: Container(
                color: Colors.black.withOpacity(0.4),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    ValueListenableBuilder(
                        valueListenable: appNameNotifier,
                        builder: (context, value, _) => Text(
                          appNameNotifier.value,
                          textAlign: TextAlign.center,
                          style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(34), fontWeight: FontWeight.w400) ?? AppStyle.normalTextStyle,
                        )),
                    ValueListenableBuilder(
                        valueListenable: appVersionNotifier,
                        builder: (context, value, _) => GestureDetector(
                          onTap: (){
                            final now = timeNow;
                            final diff = now - startTap;
                            final userExceededTapDuration = now - startTap > tapDurationInMs;

                            if (userExceededTapDuration) {
                              consecutiveTaps = 1;
                              startTap = now;
                            }
                            if (consecutiveTaps >= serialTaps && consecutiveTaps < finalTap) {
                              Fluttertoast.showToast(
                                  msg: MessagesProvider.get("Tap ${finalTap-consecutiveTaps} more times to access POS setup screen "),
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            }

                            if(consecutiveTaps == finalTap){
                              Fluttertoast.cancel();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => POSSetupScreen()));
                            }

                            consecutiveTaps++;
                          },
                          child: Text(
                            appVersionNotifier.value,
                            style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(28)) ?? AppStyle.hintTextStyle,
                          ),
                        )),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                            width: SizeConfig.blockSizeHorizontal * 65,
                            child: LockScreenView(
                              onLoginSuccess: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const DashboardScreen()),
                                        (route) => false);
                              },
                            )),
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }

  _readPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appNameNotifier.value = packageInfo.appName;
    appVersionNotifier.value = "${packageInfo.version}+${packageInfo.buildNumber}";
  }

  Future<void> _updateExecutionContext() async {
    final systemUserLoginBL = await SystemUserLoginDataBuilder.build();
    final machineId = await FlutterUdid.udid;
    final appPrefsDataBL = await ApplicationPrefsBuilder.build();
    await systemUserLoginBL.login(machineName: machineId.toUpperCase(), siteId: appPrefsDataBL.getDefaultSiteId());
  }
}
