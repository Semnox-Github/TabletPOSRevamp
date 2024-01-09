import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:instant/instant.dart';
import 'package:intl/intl.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/AppColors.dart';
import 'package:notificationbar_ui/AppStyle.dart';
import 'package:widgets_library/utils/time_zones.dart';
import 'package:startup_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:semnox_tablet_pos/developer_settings_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

typedef ShouldShowSideBar = Function(bool);

class NotificationBar extends StatefulWidget {
  final bool showHideSideBar;
  late _NotificationBarState _notificationBarState;
  final ShouldShowSideBar? onSideBarStatusUpdate;

  NotificationBar(
      {super.key, required this.showHideSideBar, this.onSideBarStatusUpdate}) {
    _notificationBarState = _NotificationBarState(showHideSideBar);
  }

  showMessage(String message, Color color) {
    _notificationBarState.showNotification(message, color);
  }

  @override
  State<NotificationBar> createState() => _notificationBarState;
}

class _NotificationBarState extends State<NotificationBar> {
  final bool _showHideSideBar;
  String? _notifMessage = "";
  Color? _notifColor;
  bool _isOnline = true;
  String _currentDateTime = "";
  Timer? _dateTimeTimer;
  Timer? _checkServerStatusTimer;
  final Queue<Notification> _queue = Queue();
  bool _isNotificationInDisplay = false;
  _NotificationBarState(this._showHideSideBar);
  String _posName = '';
  String _userName = '';
  String? _timeZoneName;
  AppRaisedButton? _appraisedBtn;
  bool shouldShowSideBar = true;
  bool isDarkModeEnabled = false;  var startTap = timeNow;
  var consecutiveTaps = 1;
  static const int serialTaps = 4;
  static const int finalTap = 7;
  static const int tapDurationInMs = 3000;
  static int get timeNow => DateTime.now().millisecondsSinceEpoch;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => {_initDefaults()});
    _dateTimeTimer = Timer.periodic(
        const Duration(seconds: 1), (Timer t) => _updateDateTime());
    _checkServerStatusTimer = Timer.periodic(
        const Duration(minutes: 1), (Timer t) => _checkRemoteServerStatus());
  }

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    isDarkModeEnabled = brightness == Brightness.dark;
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    _notifColor ??= theme.footerBG2;
    SizeConfig.init(context);
    return LayoutBuilder(builder: (context, _) {
      _appraisedBtn = AppRaisedButton(
        shouldShowSideBar: shouldShowSideBar,
        onSideBarStatusUpdate: (isHideBarShown) {
          shouldShowSideBar = isHideBarShown;
          if (widget.onSideBarStatusUpdate != null) {
            widget.onSideBarStatusUpdate!(isHideBarShown);
          }
        },
      );
      return InkWell(
        onTap: (){
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
        child: Container(
          color: _notifColor,
          height: SizeConfig.getSize(70),
          padding: const EdgeInsets.only(bottom: 5,top:4),
          child: Row(
            children: [
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.only(left: 7, right: 7, top: 3, bottom: 3),
                  child: Row(
                    children: [
                      if (_showHideSideBar)
                        _appraisedBtn ?? const SizedBox(width: 0),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          _notifMessage ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.heading5?.copyWith(
                                  fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w400, color: _getTextColor()) ??
                              AppStyle.titleStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: SizeConfig.getSize(340),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(children: [
                            Icon(Icons.person_outline_rounded,size: SizeConfig.getSize(20),),
                            const SizedBox(width: 2,),
                            Text(
                              _userName,
                              overflow: TextOverflow.ellipsis,
                              style: theme.heading5?.copyWith(
                                  fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w400, color: _getTextColor()),
                              // textAlign: TextAlign.left,
                            ),
                          ],),
                          Row(children: [
                            Icon(Icons.tablet_android_outlined,size: SizeConfig.getSize(15),),
                            const SizedBox(width: 2,),
                            Text(
                              _posName.toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              style: theme.heading5?.copyWith(
                                  fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w400, color: _getTextColor()),
                              // textAlign: TextAlign.left,
                            ),
                          ],),

                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _currentDateTime,
                          style: theme.heading5
                              ?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w400, color: _getTextColor()),
                        ),
                        Row(
                          children: [
                            NotificationStatusIndicator(
                                notificationDotColor:
                                _isOnline ? Colors.green : Colors.red),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              _isOnline
                                  ? MessagesProvider.get("Online")
                                  : MessagesProvider.get("Offline"),
                              style: theme.heading5?.copyWith(
                                  fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w400, color: _getTextColor()),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5)
            ],
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _dateTimeTimer?.cancel();
    _dateTimeTimer = null;
    _checkServerStatusTimer?.cancel();
    _checkServerStatusTimer = null;
  }

  void _initDefaults() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    final sites = await masterDataBL.getSites();

    final item = sites?.data?.siteContainerDTOList
        .where((element) => element.siteId == execContextDTO.siteId);
    if (item?.isNotEmpty == true) {
      final zone = item!.first.timeZoneName;
      _timeZoneName = timeZoneMap[zone];
    }
    _posName = execContextDTO.posMachineName!;
    _userName = execContextDTO.userId!;
  }

  void showNotification(String message, Color color) {
    Notification newNotif = Notification(color, message);
    if (_isNotificationInDisplay) {
      _queue.add(newNotif);
    } else {
      _showNotif(newNotif);
    }
  }

  void clearNotification() {
    setState(() {
      _notifMessage = "";
      _notifColor = Colors.white;
    });
  }

  void _showNotif(Notification newNotif) {
    setState(() {
      _notifMessage = newNotif.message;
      _notifColor = newNotif.color;
    });
    _isNotificationInDisplay = true;
    _showNextNotification();
  }

  void _showNextNotification() {
    if (_queue.isNotEmpty) {
      Notification nextNotification = _queue.first;
      _queue.removeFirst();
      _showNotif(nextNotification);
    } else {
      _isNotificationInDisplay = false;
    }
  }

  _updateDateTime() {
    final currentZone = curDateTimeByZone(zone: _timeZoneName ?? 'GMT');
    String time =
        DateFormat("EEEE, dd-MMM-yyyy hh:mm:ss a").format(currentZone);
    if (time != _currentDateTime) {
      setState(() {
        _currentDateTime = time;
      });
    }
  }

  Future<void> _checkRemoteServerStatus() async {
    if (ModalRoute.of(context)?.isCurrent ?? false) {
      /// check if this widget on top of nav stack. (current active screen)
      final execContextBL = await ExecutionContextBuilder.build();
      final execContextDTO = execContextBL.getExecutionContext();
      final startupDataBL = await StartupDataBuilder.build(execContextDTO!);
      _isOnline = await startupDataBL.isRemoteServerOnline();
    }
  }

  Color _getTextColor() {
    if(isDarkModeEnabled) {
      if(_notifColor!.computeLuminance() > 0.179) {
        return Colors.black;
      } else {
        return Colors.white;
      }
    } else {
      return Colors.black;
    }
  }
}

class NotificationStatusIndicator extends StatelessWidget {
  final Color notificationDotColor;
  const NotificationStatusIndicator(
      {Key? key, required this.notificationDotColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.getSize(8),
      width: SizeConfig.getSize(8),
      decoration: BoxDecoration(
        color: notificationDotColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

class AppRaisedButton extends StatefulWidget {
  final ShouldShowSideBar onSideBarStatusUpdate;
  final bool shouldShowSideBar;

  const AppRaisedButton(
      {Key? key,
      required this.shouldShowSideBar,
      required this.onSideBarStatusUpdate})
      : super(key: key);

  @override
  State<AppRaisedButton> createState() => _AppRaisedButtonState();
}

class _AppRaisedButtonState extends State<AppRaisedButton> {
  final _shouldShowSideBar = ValueNotifier(true);

  @override
  void initState() {
    _shouldShowSideBar.value = widget.shouldShowSideBar;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return PhysicalModel(
      shape: BoxShape.rectangle,
      color: theme.button1BG1 ?? AppColors.buttonBackgroundColor,
      shadowColor: theme.scrollDisabled ?? AppColors.buttonShadowColor,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () {
          _shouldShowSideBar.value = !_shouldShowSideBar.value;
          widget.onSideBarStatusUpdate(_shouldShowSideBar.value);
        },
        child: SizedBox(
          height: SizeConfig.getHeight(60),
          width: SizeConfig.blockSizeHorizontal * 17.5,
          child: ValueListenableBuilder<bool>(
            valueListenable: _shouldShowSideBar,
            builder: (context, shouldShowSideBar, _) => Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: SizeConfig.getWidth(24)),
                Image.asset(
                  shouldShowSideBar
                      ? 'assets/ic_hide_new.png'
                      : 'assets/ic_show.png',
                  width: SizeConfig.getSize(24),
                  height: SizeConfig.getSize(24),
                  color: theme.primaryOpposite,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: SizeConfig.getWidth(15)),
                Text(
                  shouldShowSideBar
                      ? MessagesProvider.get("Hide Sidebar")
                      : MessagesProvider.get("Show Sidebar"),
                  style: theme.heading5?.copyWith(
                          fontSize: SizeConfig.getFontSize(22),
                          color: theme.primaryOpposite) ??
                      tsS16W700C00,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Notification {
  Color color;
  String message;
  Notification(this.color, this.message);
}
