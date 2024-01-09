import 'package:application_prefs_data/builder.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:login_data/builder.dart';
import 'package:login_data/models/login_request.dart';
import 'package:login_ui/bloc/login_bloc.dart';
import 'package:login_ui/bloc/login_event.dart';
import 'package:login_ui/bloc/login_state.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:login_ui/login_via_card_dialog.dart';
import 'package:logs_data/logger.dart';
import 'package:system_user_login_data/builder.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:login_ui/utils/styles.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/sites/site_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themes_library/themes_library.dart';

import 'LoginErrorDialog.dart';
import 'constants.dart';

class LoginView extends StatefulWidget {
  final VoidCallback onLoginSuccess;

  const LoginView({Key? key, required this.onLoginSuccess}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _userCtr = TextEditingController();
  final _passwordCtr = TextEditingController();

  final _selectedSiteNotifier = ValueNotifier<SiteDTO?>(null);

  final _formKey = GlobalKey<FormState>();

  final _dropDownList = <SiteDTO>[];

  final _loginBloc = LoginBloc();

  var _defaultSiteId = -1;
  var _isSiteEnabled = false;

  bool _isNfcAvailable = false;

  Future<void> initBloc() async {
    final preferences = await SharedPreferences.getInstance();
    _defaultSiteId = preferences.getInt(selectedSiteId) ?? -1;
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      await requestSites();
    }
  }

  Future<void> requestSites() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    _loginBloc.setMasterDataBL(masterDataBL);
    if(execContextDTO.isCorporate == false) {
      _isSiteEnabled = false;
      Future.microtask(() {
        setState(() {

        });
      });
    } else {
      _isSiteEnabled = true;
      _loginBloc.add(RequestSitesEvent());
    }
  }

  @override
  void initState() {
    Future.microtask(() async {
      initBloc();
      _isNfcAvailable = await NFCManager().isNfcAvailable();

      Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
        if (_dropDownList.isEmpty) {
          if(_isSiteEnabled) {
            Future.delayed(const Duration(seconds: 2), () async {
              await requestSites();
            });
          }
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: SingleChildScrollView(
        child: BlocConsumer<LoginBloc, LoginState>(
          bloc: _loginBloc,
          listener: (_, loginState) {
            if(loginState is SitesUpdatedState) {
              final list = _loginBloc.siteResponse?.data?.siteContainerDTOList;
              if (list != null) {
                _dropDownList.clear();
                _dropDownList.addAll(list);
                final defaultSite =
                list.where((element) => element.siteId == _defaultSiteId);
                if (defaultSite.isNotEmpty) {
                  _selectedSiteNotifier.value = defaultSite.first;
                }
              }
            }
            if (loginState is ErrorState) {
              if(loginState.message.isNotEmpty) {
                Future.microtask(() {
                  loader.hideLoaderDialog(context);
                  _showErrorDialog(
                      context,
                      MessagesProvider.get("Login Failed").toUpperCase(),
                      loginState.message);
                  _loginBloc.add(ClearErrorEvent());
                });
              }
            } else if (loginState is SuccessState) {
              Log.printMethodEnd("_onLoginClick()", "Login Screen", "Login");
              Log.printMethodReturn("_onLoginClick() - Login Successful.", "Login Screen", "Login");
              Future.microtask(() async {
                if(loginState.response.data?.isCorporate == true) {
                  final preferences = await SharedPreferences.getInstance();
                  final appPrefsBL = await ApplicationPrefsBuilder.build();
                  final prevSiteId = preferences.getInt(selectedSiteId);
                  if (_selectedSiteNotifier.value != null) {
                    if (prevSiteId != (_selectedSiteNotifier.value?.siteId ?? -1)) {
                      await preferences.setBool(isSiteChanged, true);
                      await preferences.setInt(selectedSiteId, _selectedSiteNotifier.value?.siteId ?? -1);
                      await appPrefsBL.setDefaultSiteId(_selectedSiteNotifier.value?.siteId ?? -1);
                      await appPrefsBL.setDefaultSiteName(_selectedSiteNotifier.value?.siteName ?? '');
                    }
                  }
                }
                if(mounted) {
                  loader.hideLoaderDialog(context);
                  widget.onLoginSuccess();
                }
              });
            } else if (loginState is LoadingState) {
              Future.microtask(() => loader.showLoaderDialog(
                  context, MessagesProvider.get("Authenticating...")));
            }
          },
          builder: (_, loginState) {
            return _buildLoginForm(context, _dropDownList);
          },
        ),
      ),
    );
  }

  Widget _buildLoginForm(
      BuildContext context, List<SiteDTO> dropDownList) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Container(
      decoration: BoxDecoration(
        color: theme.primaryColor ?? Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.getSize(90)),
      padding: EdgeInsets.all(SizeConfig.getSize(16)),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: SizeConfig.getSize(8)),
            TextFormField(
              controller: _userCtr,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z@_]"))
              ],
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: theme.heading5?.copyWith(
                  fontSize: SizeConfig.isBigDevice() ? SizeConfig.getFontSize(22) : SizeConfig.getFontSize(26),
                  fontWeight: FontWeight.w400),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return MessagesProvider.get("Please enter username");
                }
                return null;
              },
              maxLength: 50,
              decoration: InputDecoration(
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
                  counterText: '',
                  hintText: MessagesProvider.get("Please enter username"),
                  label: Text(MessagesProvider.get("Username"),
                      style: theme.heading5?.copyWith(
                          fontSize: SizeConfig.getFontSize(24),
                          fontWeight: FontWeight.w400))),
            ),
            SizedBox(height: SizeConfig.getSize(16)),
            TextFormField(
              controller: _passwordCtr,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              maxLength: 15,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
              style: theme.heading5?.copyWith(
                  fontSize: SizeConfig.isBigDevice() ? SizeConfig.getFontSize(22) : SizeConfig.getFontSize(26),
                  fontWeight: FontWeight.w400),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return MessagesProvider.get("Please Enter Password");
                }
                return null;
              },
              decoration: InputDecoration(
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
                hintText: MessagesProvider.get("Please Enter Password"),
                counterText: '',
                label: Text(
                  MessagesProvider.get("Password"),
                  style: theme.heading5?.copyWith(
                      fontSize: SizeConfig.getFontSize(24),
                      fontWeight: FontWeight.w400),
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(height: SizeConfig.getSize(16)),
            Visibility(
              visible: _isSiteEnabled,
              child: DropdownButtonFormField(
                items: _dropDownList.map<DropdownMenuItem<SiteDTO>>((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item.siteName,
                        style: theme.heading5?.copyWith(
                            fontSize: SizeConfig.isBigDevice() ? SizeConfig.getFontSize(22) : SizeConfig.getFontSize(26),
                            fontWeight: FontWeight.w400)))).toList(),
                isExpanded: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if(!_isSiteEnabled) {
                    return null;
                  }
                  if (value == null) {
                    return MessagesProvider.get("Please select a site");
                  }
                  return null;
                },
                value: _selectedSiteNotifier.value,
                style: theme.heading5?.copyWith(
                    fontSize: SizeConfig.isBigDevice() ? SizeConfig.getFontSize(22) : SizeConfig.getFontSize(26),
                    fontWeight: FontWeight.w400),
                decoration: InputDecoration(
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
                  label: Text(
                    MessagesProvider.get("Site"),
                    style: theme.heading5?.copyWith(
                        fontSize: SizeConfig.getFontSize(24),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                onChanged: (value) {
                  _selectedSiteNotifier.value = value;
                },
                hint: Text(
                  MessagesProvider.get("Select Site"),
                  style: theme.heading5?.copyWith(
                      fontSize: SizeConfig.getFontSize(24),
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Visibility(
              visible: _isSiteEnabled,
                child: SizedBox(height: SizeConfig.getSize(24))),
            Visibility(
              visible: !_isSiteEnabled,
                child: SizedBox(height: SizeConfig.getSize(16))),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: theme.button2InnerShadow1 ?? Colors.black,
                  minimumSize: const Size(double.infinity, 46),
                  padding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  textStyle: theme.headingLight5
                      ?.copyWith(fontSize: SizeConfig.getFontSize(32))),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  var execContextBL = await ExecutionContextBuilder.build();
                  var executionContext = execContextBL.getExecutionContext();
                  var userLoginBL = await LoginDataBuilder.build(executionContext!);

                  var selSiteID = -1;
                  if(executionContext.isCorporate == true) {
                    selSiteID = _selectedSiteNotifier.value?.siteId ?? -1;
                  }
                  var machineId = await FlutterUdid.udid;
                  if (kDebugMode) {
                    machineId = 'MLR-LT023';
                  }

                  var loginRequest = LoginRequest(
                      loginId: _userCtr.text,
                      password: _passwordCtr.text,
                      siteId: selSiteID,
                      machineName: machineId.toUpperCase());

                  Log.printMethodStart("_onLoginClick()", "Login Screen", "Login");
                  _loginBloc.setLoginBL(userLoginBL);
                  _loginBloc.setLoginRequest(loginRequest);
                  _loginBloc.add(LoginClickEvent());
                }
              },
              child: Text(MessagesProvider.get("Login"),
                  style: theme.heading1?.copyWith(
                      fontSize: SizeConfig.getFontSize(30),
                      color: Colors.white)),
            ),
            SizedBox(height: SizeConfig.getSize(8)),
            _isNfcAvailable
                ? Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: theme.secondaryColor ?? Colors.black,
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      child: AutoSizeText(
                        MessagesProvider.get("OR"),
                        style: theme.heading5?.copyWith(
                            fontSize: SizeConfig.getFontSize(20),
                            fontWeight: FontWeight.w400) ??
                            tsS14W40016,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: theme.secondaryColor ?? Colors.black,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                ElevatedButton(
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
                      result = await systemUserLoginBL.loginWithoutSave(machineName: machineId.toUpperCase(), siteId: _selectedSiteNotifier.value?.siteId ?? -1);
                    }

                    Future.microtask(() => showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return LoginViaCardDialog(
                          systemUserLoginResponse: result,
                          onLoginViaCardSuccess: () {
                            Future.microtask(() async {
                              final preferences = await SharedPreferences.getInstance();
                              final appPrefsBL = await ApplicationPrefsBuilder.build();
                              final prevSiteId = preferences.getInt(selectedSiteId);
                              if (_selectedSiteNotifier.value != null) {
                                if (prevSiteId != (_selectedSiteNotifier.value?.siteId ?? -1)) {
                                  await preferences.setBool(isSiteChanged, true);
                                  await preferences.setInt(selectedSiteId, _selectedSiteNotifier.value?.siteId ?? -1);
                                  await appPrefsBL.setDefaultSiteId(_selectedSiteNotifier.value?.siteId ?? -1);
                                  await appPrefsBL.setDefaultSiteName(_selectedSiteNotifier.value?.siteName ?? '');
                                }
                              }
                              if(mounted) {
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
                        child: AutoSizeText(
                          MessagesProvider.get("Tap the employee card"),
                          style: theme.heading1?.copyWith(
                              fontSize: SizeConfig.getFontSize(30),
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
                : const SizedBox(height: 0),
          ],
        ),
      ),
    );
  }

  _showErrorDialog(BuildContext context, String title, String message) {
    showDialog(
        context: context, builder: (_) => LoginErrorDialog(title, message));
  }
}
