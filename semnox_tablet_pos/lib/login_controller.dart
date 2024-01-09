import 'package:application_prefs_data/builder.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:login_ui/login_view.dart';
import 'package:login_ui/utils/common_widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:semnox_tablet_pos/AppStyle.dart';
import 'package:semnox_tablet_pos/developer_settings_screen.dart';
import 'package:semnox_tablet_pos/pos_setup/pos_setup_screen.dart';
import 'package:semnox_tablet_pos/Postlogin_Landingpage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shift_tracking_data/builder.dart';
import 'package:sprintf/sprintf.dart';
import 'package:messages_data/builder.dart';
import 'package:logs_data/logger.dart';
import 'package:system_user_login_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/keyboard_hider_widget.dart';
import 'package:widgets_library/utils/size_config.dart';

import 'AppColors.dart';
import 'dashboard_ui.dart';

class LoginController extends StatefulWidget {
  final bool isFromDashBoard;
  const LoginController({Key? key, this.isFromDashBoard = false}) : super(key: key);

  @override
  State<LoginController> createState() => _LoginControllerState();
}

class _LoginControllerState extends State<LoginController> {
  final userCtr = TextEditingController();

  final passwordCtr = TextEditingController();

  final siteIdCtr = TextEditingController();

  final appNameNotifier = ValueNotifier('');
  final appVersionNotifier = ValueNotifier('');
  final refreshNotifier = ValueNotifier(false);

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
    Future.microtask(() => {_deleteCacheDir()});
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
      color: theme.darkTextColor?.withOpacity(0.4) ?? Colors.black.withOpacity(0.4),
      child: Column(
          children: [
            const SizedBox(height: 10),
            ValueListenableBuilder(
                valueListenable: appNameNotifier,
                builder: (context, value, _) => InkWell(
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
                          msg: MessagesProvider.get('Click ${10-consecutiveTaps} times more to open developer settings'),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: theme.primaryOpposite ?? Colors.black,
                          textColor: theme.primaryColor ?? Colors.white,
                          fontSize: 16.0
                      );
                    }

                    if(consecutiveTaps == 10){
                      Fluttertoast.cancel();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DeveloperSettingsScreen()));
                    }

                    consecutiveTaps++;
                  },
                  child: Text(
                        appNameNotifier.value,
                        textAlign: TextAlign.center,
                        style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(34), fontWeight: FontWeight.w400) ??  AppStyle.normalTextStyle,
                      ),
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
                          backgroundColor: theme.primaryOpposite ?? Colors.black,
                          textColor: theme.primaryColor ?? Colors.white,
                          fontSize: 16.0
                      );
                    }

                    if(consecutiveTaps == finalTap){
                      Fluttertoast.cancel();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => POSSetupScreen())).then((value) {
                        if(refreshNotifier.value) {
                          refreshNotifier.value = false;
                        } else {
                          refreshNotifier.value = true;
                        }
                      });
                    }

                    consecutiveTaps++;
                  },
                  child: Text(
                        appVersionNotifier.value,
                        style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(28)) ?? AppStyle.hintTextStyle,
                      ),
                )),
            // SizedBox(height: SizeConfig.getSize(24)),
            Expanded(
              child: Align(
                child: ValueListenableBuilder(
                  valueListenable: refreshNotifier,
                  builder: (context, value, _) => SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 65,
                      child: LoginView(
                        key: ValueKey(value.toString()),
                        onLoginSuccess: ()async {
                          FocusManager.instance.primaryFocus?.unfocus();
                          final _isPerformedEod = await checkIsPerformedEOD();
                          if(_isPerformedEod){
                            showPerformedEOD();
                            return;
                          }
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PostLogin_LandingPage()),
                              (route) => false);
                        },
                      )),
                ),
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
    if(widget.isFromDashBoard) {
      final systemUserLoginBL = await SystemUserLoginDataBuilder.build();
      final machineId = await FlutterUdid.udid;
      final appPrefsDataBL = await ApplicationPrefsBuilder.build();
      await systemUserLoginBL.login(machineName: machineId.toUpperCase(), siteId: appPrefsDataBL.getDefaultSiteId());
    }
  }

  Future<void> _deleteCacheDir() async {
    var tempDir = await getTemporaryDirectory();

    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  }


  Future<bool> checkIsPerformedEOD()async{
    try{
      var executionContextBL = await ExecutionContextBuilder.build();
      final executionContext =  executionContextBL.getExecutionContext();
      final shiftTrackingBL = await ShiftTrackDataBuilder.build(executionContext!);
      final  response = await shiftTrackingBL.getEndOfDayStatus(executionContext.machineId!);
      if (response.exception == null && response.message == null) {
        print(" data from eod==>${response.data}");
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
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginController()),
                                      (route) => false);

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
