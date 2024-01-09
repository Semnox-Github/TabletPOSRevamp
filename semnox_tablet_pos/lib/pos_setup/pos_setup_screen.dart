import 'package:application_prefs_data/application_prefs_data_bl.dart';
import 'package:application_prefs_data/builder.dart';
import 'package:execution_context/builder.dart';
import 'package:execution_context/execution_context_bl.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/sites/site_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:semnox_tablet_pos/config/constants.dart';
import 'package:semnox_tablet_pos/cubits/pos_config/pos_config_cubit.dart';
import 'package:semnox_tablet_pos/cubits/pos_config/pos_config_state.dart';
import 'package:semnox_tablet_pos/developer_settings_screen.dart';
import 'package:semnox_tablet_pos/pos_setup/server_setup_screen.dart';
import 'package:semnox_tablet_pos/pos_setup/site_selection_screen.dart';
import 'package:semnox_tablet_pos/pos_setup/system_user_cred_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/loader_dialog.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/keyboard_hider_widget.dart';
import 'package:widgets_library/utils/size_config.dart';

class POSSetupScreen extends StatefulWidget {
  final int? initialIndex;
  const POSSetupScreen({super.key, this.initialIndex});

  @override
  State<POSSetupScreen> createState() => _POSSetupScreenState();
}

class _POSSetupScreenState extends State<POSSetupScreen> {
  ScrollController scrollController = ScrollController();
  final fieldServerController = TextEditingController();
  late ApplicationPrefsDataBLContract appPrefsBL;
  final _refreshNotifier = ValueNotifier<bool>(false);


  final _userCtr = TextEditingController();
  final _passwordCtr = TextEditingController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    if(widget.initialIndex != null) {
      _currentPage = widget.initialIndex!;
    }
    Future.microtask(() async {
      appPrefsBL = await ApplicationPrefsBuilder.build();
    });
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return WillPopScope(
      onWillPop: () async => false,
      child: KeyboardHider(
        child: BlocConsumer<PosConfigCubit, PosConfigState>(
          listener: (ctx, state) {
            if (state.loadingStatus == 1) {
              Future.microtask(
                  () => showLoaderDialog(context, state.loadingMessage));
            }
            if (state.loadingStatus == 0) {
              Future.microtask(
                  () => context.read<PosConfigCubit>().setLoadingStatus(-1));
              Future.microtask(() => hideLoaderDialog(context));
              if (state.apiError != null) {
                if (state.isServerValidated) {
                  fieldServerController.clear();
                  context.read<PosConfigCubit>().resetServerValidationStatus();
                }
                Future.microtask(() => _showErrorDialog(state.apiError ?? ''));
              }
              if(state.isServerErrorsPresent) {
                Fluttertoast.showToast(
                    msg: MessagesProvider.get('Please Enter Valid server Url'),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.SNACKBAR,
                    timeInSecForIosWeb: 1,
                    backgroundColor: theme.primaryOpposite ?? Colors.black,
                    textColor: theme.primaryColor ?? Colors.white,
                    fontSize: 16.0);
              }
              if (state.isServerValidated) {
                Future.microtask(() {
                  var serverUrl = fieldServerController.text.toString();
                  if(serverUrl.characters.last != '/') {
                    serverUrl = '$serverUrl/';
                  }
                  appPrefsBL.setServerUrl(serverUrl);
                  context.read<PosConfigCubit>().resetServerValidationStatus();
                  Log.v('SERVER URL: ${appPrefsBL.getServerUrl()}');
                  _setCurrentPage(1);
                  _saveCurrentPageStatus(1);
                });
              }
              if (state.loginResponse != null) {
                Future.microtask(() async {
                  await appPrefsBL.setSystemUserName(_userCtr.text);
                  await appPrefsBL.setSystemPassword(_passwordCtr.text);
                });
                if(_refreshNotifier.value) {
                  _refreshNotifier.value = false;
                } else {
                  _refreshNotifier.value = true;
                }
                _setCurrentPage(2);
                _saveCurrentPageStatus(2);

                Future.microtask(
                    () => context.read<PosConfigCubit>().clearLoginState());
              }
            }
          },
          builder: (ctx, state) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(SizeConfig.getHeight(100)),
                child: AppBar(
                  toolbarHeight: SizeConfig.getHeight(100),
                  backgroundColor: Colors.black54,
                  centerTitle: false,
                  leadingWidth: 20,
                  title: Text(
                    _getSetupTitle(),
                    style: theme.headingLight4?.copyWith(
                        fontSize: SizeConfig.getFontSize(40),
                        fontWeight: FontWeight.w700,
                        color: theme.light1),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.white),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DeveloperSettingsScreen()));
                      },
                    ),
                  ],
                  titleSpacing: 0,
                  leading: Container(),
                ),
              ),
              body: IndexedStack(
                index: _currentPage,
                children: [
                  ServerSetupScreen(
                    onNextClicked: (serverUrl) {
                      fieldServerController.text = serverUrl;
                    },
                  ),
                  SystemUserCredScreen(
                    onPrevClicked: () {
                      _setCurrentPage(0);
                    },
                    onNextClicked: (userName, password) {
                      _userCtr.text = userName;
                      _passwordCtr.text = password;
                    },
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: _refreshNotifier,
                    builder: (context, val, _) => SiteSelectionScreen(
                      key: ValueKey(_refreshNotifier.value),
                      onPrevClicked: () {
                        _setCurrentPage(1);
                      },
                      screenIndex: _currentPage,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _showErrorDialog(String message) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              content: Text(
                message,
                style: theme.heading6,
              ),
              actions: [
                CupertinoDialogAction(
                  child:
                      Text(MessagesProvider.get("OK"), style: theme.heading3),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
        barrierDismissible: true);
  }

  Future<void> updateExecutionContext(ExecutionContextBLContract execContextBL,
      ExecutionContextDTO? dto) async {
    if (dto != null) {
      await execContextBL.setExecutionContext(dto);
    }
  }

  String _getSetupTitle() {
    if(_currentPage == 0) {
      return MessagesProvider.get("Server API").toUpperCase();
    } else if (_currentPage == 1) {
      return MessagesProvider.get("System User Login");
    } else {
      return MessagesProvider.get("Select Any Site");
    }
  }

  void _setCurrentPage(int pageNo) {
    setState(() {
      _currentPage = pageNo;
    });
  }

  Future<void> _saveCurrentPageStatus(int pageNo) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setInt(currPosSetUpIndex, pageNo);
  }

/*Future<NetworkInfo> _wifiInfo() async{
    //request for location permission
    if (await Permission.location.request().isGranted) {
      Permission.location.request();
    }
    final info = NetworkInfo();
    var wifiName = await info.getWifiName();
    wifiName = wifiName?.replaceAll('"', '');
    wifiNameNotifier.value = wifiName;
    wifiIPNotifier.value = await info.getWifiIP();
    return info;
  }*/
}
