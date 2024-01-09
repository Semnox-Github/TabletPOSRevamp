import 'dart:async';

import 'package:attendance_ui/widgets/on_break_lock_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logs_data/logger.dart';
import 'package:messages_data/builder.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:semnox_tablet_pos/AppStyle.dart';
import 'package:semnox_tablet_pos/dashboard_ui.dart';
import 'package:semnox_tablet_pos/pos_setup/pos_setup_screen.dart';

import '../attendance_ui.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
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
                    style: AppStyle.normalTextStyle,
                  )),
          ValueListenableBuilder(
              valueListenable: appVersionNotifier,
              builder: (context, value, _) => GestureDetector(
                    onTap: () {
                      final now = timeNow;
                      final diff = now - startTap;
                      final userExceededTapDuration =
                          now - startTap > tapDurationInMs;

                      if (userExceededTapDuration) {
                        consecutiveTaps = 1;
                        startTap = now;
                      }
                      if (consecutiveTaps >= serialTaps &&
                          consecutiveTaps < finalTap) {
                        Fluttertoast.showToast(
                            msg: MessagesProvider.get(
                                "Tap ${finalTap - consecutiveTaps} more times to access POS setup screen "),
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }

                      if (consecutiveTaps == finalTap) {
                        Fluttertoast.cancel();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const POSSetupScreen()));
                      }

                      consecutiveTaps++;
                    },
                    child: Text(
                      appVersionNotifier.value,
                      style: AppStyle.hintTextStyle,
                    ),
                  )),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 700,
                child: LockScreenView(
                  onLoginSuccess: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardScreen()),
                        (route) => false);
                  },
                  onBackFromBreak: (LoginResponse) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const DashboardScreen(isFromBreak: true)),
                        (route) => false);

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AttendancePopUp(
                          onSuccess: () {},
                          onFailureShowNotification: (msg) {},
                          isFromBreak: true,
                          loginResponse: LoginResponse,
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    )));
  }

  _readPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appNameNotifier.value = packageInfo.appName;
    appVersionNotifier.value = packageInfo.version;
  }
}
