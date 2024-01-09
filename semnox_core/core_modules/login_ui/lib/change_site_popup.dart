import 'package:execution_context/builder.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:login_data/builder.dart';
import 'package:login_data/models/login_response.dart';
import 'package:login_ui/AppColors.dart';
import 'package:login_ui/LoginErrorDialog.dart';
import 'package:login_ui/bloc/login_bloc.dart';
import 'package:login_ui/bloc/login_event.dart';
import 'package:login_ui/bloc/login_state.dart';
import 'package:login_data/models/login_request.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/constants.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:login_ui/login_via_card_dialog.dart';
import 'package:login_ui/utils/colors.dart';
import 'package:login_ui/utils/common_widgets.dart';
import 'package:logs_data/logger.dart';
import 'package:widgets_library/utils/keyboard_hider_widget.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:login_ui/utils/styles.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/sites/site_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:messages_data/builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:system_user_login_data/builder.dart';
import 'package:system_user_login_data/models/system_user_login_response.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';

class ChangeSiteView extends StatefulWidget {
  final VoidCallback onLoginSuccess;
  final List<SiteDTO> siteList;
  final SiteDTO? selectedSite;

  const ChangeSiteView({Key? key,
    required this.onLoginSuccess,
    required this.siteList,
    this.selectedSite,
  }) : super(key: key);

  @override
  State<ChangeSiteView> createState() => _ChangeSiteViewState();
}

class _ChangeSiteViewState extends State<ChangeSiteView> with WidgetsBindingObserver {
  final _userCtr = TextEditingController();
  final _passwordCtr = TextEditingController();
  final _scrollController = ScrollController();

  final _formKey = GlobalKey<FormState>();

  final _loginBloc = LoginBloc();

  final selectedSiteNotifier = ValueNotifier<SiteDTO?>(null);


  bool isNfcAvailable = false;
  bool _hasScrollBar = false;
  bool _isScrollableByDefault = false;

  @override
  void initState() {
    Future.microtask(() async {
      _initBloc();
      isNfcAvailable = await NFCManager().isNfcAvailable();
      if(mounted) {
        selectedSiteNotifier.value = widget.selectedSite;
      }
    });
    WidgetsBinding.instance.endOfFrame.then(
          (_) {
        if (mounted) {
          setState(() {
            _hasScrollBar = _scrollController.position.maxScrollExtent != 0;
            _isScrollableByDefault = _hasScrollBar;
          });
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          if(!_isScrollableByDefault) {
            _hasScrollBar = isKeyboardVisible;
          }
          return Material(
          color: Colors.transparent,
          child: KeyboardHider(
            child: Scroller(
              controller: _scrollController,
              child: Container(
                color: Colors.transparent,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: BlocConsumer<LoginBloc, LoginState>(
                    bloc: _loginBloc,
                    listener: (_, state) {
                      if (state is ErrorState) {
                        if(state.message.isNotEmpty) {
                          Future.microtask(() {
                            loader.hideLoaderDialog(context);
                            if(state.message.toLowerCase().contains('invalid login id')) {
                              _showErrorDialog(
                                  context, MessagesProvider.get("Approval Failed").toUpperCase(), MessagesProvider.get("Not a valid approver"));
                            } else {
                              _showErrorDialog(
                                  context, MessagesProvider.get("Login failed").toUpperCase(), state.message);
                            }
                            _loginBloc.add(ClearErrorEvent());
                          });
                        }
                      } else if(state is SuccessState) {
                        Log.printMethodEnd("_onLoginClick()", "Change Site", "OK");
                        Log.printMethodReturn("_onLoginClick() - Login successful.", "Change Site", "OK");
                        Future.microtask(() async {
                          final preferences = await SharedPreferences.getInstance();
                          await preferences.setInt(selectedSiteId, selectedSiteNotifier.value?.siteId ?? -1);
                          if(mounted) {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            widget.onLoginSuccess();
                          }
                        });
                      } else if(state is LoadingState) {
                        Future.microtask(() => loader.showLoaderDialog(context));
                      }
                    },
                    builder: (_, state) {
                      return _buildLoginForm(context, isKeyboardVisible);
                    },
                  ),
                ),
              ),
            ),
          ),
        );
        },
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context, bool isKeyboardVisible) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.backGroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.only( left: SizeConfig.getWidth(24), right: _hasScrollBar ? SizeConfig.getWidth(64) : SizeConfig.getWidth(24),
          top: SizeConfig.getHeight(16), bottom: SizeConfig.getHeight(16) + MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(MessagesProvider.get("Change Site").toUpperCase(), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(34))),
            SizedBox(height: SizeConfig.getHeight(8)),
            const Divider(),
            SizedBox(height: SizeConfig.getHeight(12)),
            ValueListenableBuilder<SiteDTO?>(
              valueListenable: selectedSiteNotifier,
              builder: (context, value, _) => DropdownButtonFormField(
                items: widget.siteList.map<DropdownMenuItem<SiteDTO>>((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item.siteName,
                        style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(26), fontWeight: FontWeight.w400)))).toList(),
                decoration: InputDecoration(
                    label: Text(
                      MessagesProvider.get("Site"),
                      style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(24), fontWeight: FontWeight.w400),
                    ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: theme.secondaryColor?.withOpacity(0.54) ?? Colors.black54, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: theme.secondaryColor?.withOpacity(0.54) ?? Colors.black54, width: 1),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: theme.errorTextColor ?? Colors.red, width: 1),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: theme.errorTextColor ?? Colors.red, width: 1),
                  ),
                  contentPadding: EdgeInsets.only(left: SizeConfig.getSize(12), top: SizeConfig.isBigDevice() ? SizeConfig.getSize(16) : 0, bottom: SizeConfig.isBigDevice() ? SizeConfig.getSize(16) : 0),
                ),
                isExpanded: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null) {
                    return MessagesProvider.get("Please select a site");
                  }
                  return null;
                },
                value: selectedSiteNotifier.value,
                style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(26), fontWeight: FontWeight.w400, color: Colors.white),
                onChanged: (value) {
                  selectedSiteNotifier.value = value;
                },
                hint: Text(
                  MessagesProvider.get("Select Site"),
                  style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(24), fontWeight: FontWeight.w400, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.getHeight(20)),
            TextFormField(
              controller: _userCtr,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 30),
              style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(30), fontWeight: FontWeight.w400),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return MessagesProvider.get("Please enter username");
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: MessagesProvider.get("Username"),
                  hintStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(30), fontWeight: FontWeight.w400, color: Colors.grey),
                  label: Text(MessagesProvider.get("Username"),
                      style: theme.heading5?.copyWith(
                          fontSize: SizeConfig.getFontSize(24),
                          fontWeight: FontWeight.w400)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: theme.secondaryColor?.withOpacity(0.54) ?? Colors.black54, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: theme.secondaryColor?.withOpacity(0.54) ?? Colors.black54, width: 1),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: theme.errorTextColor ?? Colors.red, width: 1),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: theme.errorTextColor ?? Colors.red, width: 1),
                ),
                contentPadding: EdgeInsets.only(left: SizeConfig.getSize(12), top: SizeConfig.isBigDevice() ? SizeConfig.getSize(16) : 0, bottom: SizeConfig.isBigDevice() ? SizeConfig.getSize(16) : 0),
              ),
            ),
            SizedBox(height: SizeConfig.getHeight(20)),
            TextFormField(
              controller: _passwordCtr,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 30),
              style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(30), fontWeight: FontWeight.w400),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return MessagesProvider.get("Please Enter Password");
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: MessagesProvider.get("Password"),
                  hintStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(30), fontWeight: FontWeight.w400, color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: theme.secondaryColor?.withOpacity(0.54) ?? Colors.black54, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: theme.secondaryColor?.withOpacity(0.54) ?? Colors.black54, width: 1),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: theme.errorTextColor ?? Colors.red, width: 1),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: theme.errorTextColor ?? Colors.red, width: 1),
                ),
                label: Text(
                  MessagesProvider.get("Password"),
                  style: theme.heading5?.copyWith(
                      fontSize: SizeConfig.getFontSize(24),
                      fontWeight: FontWeight.w400),
                ),
                contentPadding: EdgeInsets.only(left: SizeConfig.getSize(12), top: SizeConfig.isBigDevice() ? SizeConfig.getSize(16) : 0, bottom: SizeConfig.isBigDevice() ? SizeConfig.getSize(16) : 0),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            Visibility(
              visible: isNfcAvailable,
                child: SizedBox(height: SizeConfig.getHeight(20))),
            Visibility(
              visible: isNfcAvailable,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                    theme.button2InnerShadow1 ?? Colors.black,
                    minimumSize: const Size(double.infinity, 46),
                    padding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    textStyle: theme.headingLight5?.copyWith(
                        fontSize: SizeConfig.getFontSize(32))),
                onPressed: () async {
                  var result = _loginBloc.systemUserLoginResponse;
                  var machineId = await FlutterUdid.udid;
                  if(result == null) {
                    final systemUserLoginBL = await SystemUserLoginDataBuilder.build();
                    result = await systemUserLoginBL.loginWithoutSave(machineName: machineId.toUpperCase(), siteId: selectedSiteNotifier.value?.siteId ?? -1);
                  }
                  Future.microtask(() => showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return LoginViaCardDialog(
                        changedSiteId: selectedSiteNotifier.value?.siteId ?? -1,
                        systemUserLoginResponse: result,
                        onLoginViaCardSuccess: () {
                          Future.microtask(() async {
                            final preferences = await SharedPreferences.getInstance();
                            await preferences.setInt(selectedSiteId, selectedSiteNotifier.value?.siteId ?? -1);
                            if(mounted) {
                              Navigator.pop(context);
                              widget.onLoginSuccess();
                            }
                          });
                        },
                        isAuthenticateUser: false,
                        onAutheticateUser: (loginResponse) {},
                      );
                    },
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        right: 4,
                      ),
                      child: Image.asset('assets/ic_tap_card_small.png',
                          color: Colors.white),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        right: 4,
                      ),
                      child: Text(
                        MessagesProvider.get("Tap the employee card"),
                        style: theme.heading1?.copyWith(
                            fontSize: SizeConfig.getFontSize(30),
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: !isNfcAvailable,
              child: SizedBox(height: SizeConfig.getHeight(40)),
            ),
            SizedBox(height: SizeConfig.getHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: SizeConfig.getWidth(24)),
                containerButton(
                    width: SizeConfig.getWidth(140),
                    height: SizeConfig.getHeight(65),
                    buttonColor: theme.footerBG1 ?? colorBlueFA,
                    text: MessagesProvider.get("Cancel"), textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(32), fontWeight: FontWeight.w600) ?? tsS24W70016,
                    onTapped: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Navigator.pop(context);
                }),
                SizedBox(width: SizeConfig.getWidth(24)),
                containerButton(
                    width: SizeConfig.getWidth(140),
                    height: SizeConfig.getHeight(65),
                    buttonColor: theme.button2InnerShadow1 ?? Colors.black,
                    text: MessagesProvider.get("OK"), textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(32), fontWeight: FontWeight.w600, color: Colors.white) ?? tsS24W70016,
                    onTapped: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Future.delayed(const Duration(milliseconds: 400), () async {
                    if (_formKey.currentState!.validate())  {
                      var result = _loginBloc.systemUserLoginResponse;
                      var machineId = await FlutterUdid.udid;
                      if(kDebugMode) {
                        machineId = 'MLR-LT023';
                      }
                      if(result == null) {
                        final systemUserLoginBL = await SystemUserLoginDataBuilder.build();
                        result = await systemUserLoginBL.loginWithoutSave(machineName: machineId.toUpperCase(), siteId: selectedSiteNotifier.value?.siteId ?? -1);
                      }
                      final sysExecContext = _getExecutionContextFromSysLogin(result);
                      final userLoginBL = await LoginDataBuilder.build(sysExecContext);

                      final loginRequest = LoginRequest(
                          loginId: _userCtr.text,
                          password: _passwordCtr.text,
                          siteId: selectedSiteNotifier.value?.siteId ?? -1,
                          machineName: machineId.toUpperCase());

                      Log.printMethodStart("_onLoginClick()", "Change Site", "OK");
                      _loginBloc.setLoginBL(userLoginBL);
                      _loginBloc.setLoginRequest(loginRequest);
                      _loginBloc.add(LoginClickEvent());
                    }
                  });
                }),
                SizedBox(width: SizeConfig.getWidth(24)),
              ],
            ),
            SizedBox(height: SizeConfig.getHeight(24)),
          ],
        ),
      ),
    );
  }

  Future<void> _initBloc() async {
    final systemUserLoginBL = await SystemUserLoginDataBuilder.build();
    var machineId = await FlutterUdid.udid;
    if(kDebugMode) {
      machineId = 'MLR-LT023';
    }
    final result = await systemUserLoginBL.loginWithoutSave(machineName: machineId.toUpperCase(), siteId: selectedSiteNotifier.value?.siteId ?? -1);

    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContextDTO!);

    _loginBloc.setMasterDataBL(masterDataBL);
    _loginBloc.add(RequestSitesEvent());
    final sites = await masterDataBL.getSites();
    if (sites != null) {
      var item = sites.data?.siteContainerDTOList
          .where((element) => element.siteId == execContextDTO.siteId);
      if (item?.isNotEmpty == true) {
        selectedSiteNotifier.value = item?.first;
      }
    }

    _loginBloc.setSystemUserLoginResponse(result);


  }

  ExecutionContextDTO _getExecutionContextFromSysLogin(SystemUserLoginResponse response) {
    final executionDTO = ExecutionContextDTO(posMachineGuid: response.data?.posMachineGuid,
        webApiToken: response.data?.webApiToken,
        languageId: response.data?.languageId,
        isCorporate: response.data?.isCorporate,
        userPKId: response.data?.userPKId,
        userRoleId: response.data?.userRoleId,
        machineId: response.data?.machineId,
        siteId: response.data?.siteId,
        sitePKId: response.data?.sitePKId,
        userId: response.data?.userId,
        posMachineName: response.data?.posMachineName,
        languageCode: response.data?.languageCode,
        isUserLoggedIn: true
    );
    return executionDTO;
  }

  _showErrorDialog(BuildContext context, String title, String message) {
    showDialog(
        context: context, builder: (_) => LoginErrorDialog(title, message));
  }
}
