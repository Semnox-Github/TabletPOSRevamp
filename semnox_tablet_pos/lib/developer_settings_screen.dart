
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logs_data/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:semnox_tablet_pos/config/constants.dart';
import 'package:semnox_tablet_pos/utils/log_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

import 'AppStyle.dart';

class DeveloperSettingsScreen extends StatefulWidget {
  const DeveloperSettingsScreen({Key? key}) : super(key: key);

  @override
  State<DeveloperSettingsScreen> createState() => _DeveloperSettingsScreenState();
}

class _DeveloperSettingsScreenState extends State<DeveloperSettingsScreen> {

  bool isStethoSelected = false;
  bool isLoggingSelected = false;

  @override
  void initState() {
    Future.microtask(() => _initSwitchStatus());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            toolbarHeight: 80.0,
            backgroundColor: theme.darkTextColor?.withOpacity(0.54) ?? Colors.black54,
            centerTitle: false,
            leadingWidth: 20,
            title: Text(
              MessagesProvider.get('Developer Settings'),
              style: theme.headingLight5?.copyWith(fontSize: 32, color: Colors.white) ?? AppStyle.titleTextStyle,
            ),
            titleSpacing: 0,
            leading: Container(),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: theme.button2InnerShadow1,
                  ),
                  child: Text(
                    MessagesProvider.get("Done"),
                    style: theme.headingLight5?.copyWith(fontSize: 32, color: Colors.white) ?? AppStyle.titleTextStyle,
                  ),
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                        value: isLoggingSelected,
                        activeColor: theme.secondaryColor ?? Colors.black,
                        checkColor: theme.primaryColor ?? Colors.white,
                        onChanged: (value) async {
                          var status = await Permission.storage.request();
                          final preferences = await SharedPreferences.getInstance();
                          if ((!status.isGranted || status.isDenied) && value == true) {

                            await Permission.storage.request();
                            await Permission.manageExternalStorage.request();
                            openAppSettings();
                          }else{
                            setState(() {
                              isLoggingSelected = value ?? false;
                            });
                          }
                          if(mounted) {
                            if(value == true && status.isGranted) {
                              _showDialog(context, onOkClicked: () async {
                                await preferences.setBool(isLoggingEnabled, true);
                              }, title: MessagesProvider.get('Logging is enabled'),
                                message:  MessagesProvider.get(''),
                                //MessagesProvider.get('Need to kill and restart the app to reflect changes')
                              );
                            } else if(value == false) {
                              LogUtils.instance.uploadRecentLogFile(preferences).catchError((error) {
                                Log.e("Syncing logs to server failed: ${error.toString()}");
                              });
                              _showDialog(context, onOkClicked: () async {
                                final preferences = await SharedPreferences.getInstance();
                                await preferences.setBool(isLoggingEnabled, false);
                              }, title: MessagesProvider.get('Logging is disabled'),
                                message:  MessagesProvider.get(''),
                                // message: MessagesProvider.get('Need to kill and restart the app to reflect changes')
                              );
                            }
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      MessagesProvider.get('Enable Logging'),
                      style: theme.heading5?.copyWith(fontSize: 26, fontWeight: FontWeight.w400) ?? AppStyle.normalTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showDialog(BuildContext context, {
        required VoidCallback onOkClicked,
        required String title,
        required String message
    }) {
    showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              title,
              style: Theme.of(context).extension<SemnoxTheme>()!.heading5?.copyWith(fontSize: SizeConfig.getFontSize(32), fontWeight: FontWeight.w600),
            ),
          ),
          content: Text(
            message,
            style: Theme.of(context).extension<SemnoxTheme>()!.heading5?.copyWith(fontSize: SizeConfig.getFontSize(26), fontWeight: FontWeight.w400),
          ),
          actions: [
            CupertinoDialogAction(
              child: Text(
                MessagesProvider.get('OK'),
                style: Theme.of(context).extension<SemnoxTheme>()!.heading5?.copyWith(fontSize: SizeConfig.getFontSize(32), fontWeight: FontWeight.w500),
              ),
              onPressed: () {
                onOkClicked();
                Navigator.pop(context);
              },
            ),
          ],
        ),
        barrierDismissible: true);
  }

  Future<void> _initSwitchStatus() async {
    final preferences = await SharedPreferences.getInstance();
    setState(() {
      isLoggingSelected = preferences.getBool(isLoggingEnabled) ?? false;
    });
  }
}
