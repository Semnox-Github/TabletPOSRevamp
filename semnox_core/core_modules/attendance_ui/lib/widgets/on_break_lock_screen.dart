import 'package:auto_size_text/auto_size_text.dart';
import 'package:execution_context/builder.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_data/builder.dart';
import 'package:login_data/models/login_request.dart';
import 'package:login_data/models/login_response.dart';
import 'package:login_ui/LoginErrorDialog.dart';
import 'package:login_ui/bloc/login_bloc.dart';
import 'package:login_ui/bloc/login_event.dart';
import 'package:login_ui/bloc/login_state.dart';
import 'package:login_ui/constants.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:login_ui/login_via_card_dialog.dart';
import 'package:login_ui/utils/styles.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/sites/site_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:system_user_login_data/builder.dart';
import 'package:system_user_login_data/models/system_user_login_response.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

typedef OnBackFromBreak = Function(LoginResponse);

class LockScreenView extends StatefulWidget {
  final VoidCallback onLoginSuccess;
  final OnBackFromBreak onBackFromBreak;

  const LockScreenView(
      {Key? key, required this.onLoginSuccess, required this.onBackFromBreak})
      : super(key: key);

  @override
  State<LockScreenView> createState() => _LockScreenViewState();
}

class _LockScreenViewState extends State<LockScreenView> {
  final _userCtr = TextEditingController();
  final _passwordCtr = TextEditingController();

  final _selectedSiteNotifier = ValueNotifier<SiteDTO?>(null);

  final _formKey = GlobalKey<FormState>();

  final _loginBloc = LoginBloc();

  var _defaultSiteId = -1;

  bool _isNfcAvailable = false;
  SemnoxTheme? _theme;

  Future<void> initBloc() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContextDTO!);

    final preferences = await SharedPreferences.getInstance();
    _defaultSiteId = preferences.getInt(selectedSiteId) ?? -1;

    _loginBloc.setMasterDataBL(masterDataBL);
    _loginBloc.add(RequestSitesEvent());

    final systemUserLoginBL = await SystemUserLoginDataBuilder.build();
    var machineId = await FlutterUdid.udid;
    if (kDebugMode) {
      machineId = 'MLR-LT023';
    }
    final result = await systemUserLoginBL.loginWithoutSave(
        machineName: machineId.toUpperCase(), siteId: execContextDTO.siteId ?? -1);

    _loginBloc.setSystemUserLoginResponse(result);
  }

  @override
  void initState() {
    Future.microtask(() async {
      initBloc();
      _isNfcAvailable = await NFCManager().isNfcAvailable();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: SingleChildScrollView(
        child: BlocBuilder<LoginBloc, LoginState>(
          bloc: _loginBloc,
          builder: (_, loginState) {
            final list = _loginBloc.siteResponse?.data?.siteContainerDTOList;
            final dropDownList = <DropdownMenuItem<SiteDTO>>[];
            if (list != null) {
              for (int i = 0; i < list.length; i++) {
                final item = list[i];
                dropDownList.add(DropdownMenuItem(
                    value: item,
                    child: Text(item.siteName,
                        style: GoogleFonts.robotoCondensed(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400))));
              }
              final defaultSite =
                  list.where((element) => element.siteId == _defaultSiteId);
              if (defaultSite.isNotEmpty) {
                _selectedSiteNotifier.value = defaultSite.first;
              }
            }
            if (loginState is ErrorState) {
              Future.microtask(() => _showErrorDialog(
                  context,
                  MessagesProvider.get("Login failed").toUpperCase(),
                  loginState.message));
              loader.hideLoaderDialog(context);
            } else if (loginState is SuccessState) {
              Log.printMethodEnd("_onLoginClick()", "Login Screen", "Login");
              Log.printMethodReturn("_onLoginClick() - Login Successful.", "Login Screen", "Login");
              Future.microtask(
                  () => widget.onBackFromBreak(loginState.response));
              loader.hideLoaderDialog(context);
            } else if (loginState is LoadingState) {
              Future.microtask(() => loader.showLoaderDialog(
                  context, MessagesProvider.get("Authenticating...")));
            }

            return _buildLoginForm(context, dropDownList);
          },
        ),
      ),
    );
  }

  Widget _buildLoginForm(
      BuildContext context, List<DropdownMenuItem<SiteDTO>> dropDownList) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
                  fontSize: SizeConfig.isBigDevice()
                      ? SizeConfig.getFontSize(22)
                      : SizeConfig.getFontSize(26),
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
                    borderSide: BorderSide(
                        color: theme.secondaryColor?.withOpacity(0.54) ??
                            Colors.black54,
                        width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: theme.secondaryColor?.withOpacity(0.54) ??
                            Colors.black54,
                        width: 1),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: theme.errorTextColor ?? Colors.red, width: 1),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: theme.errorTextColor ?? Colors.red, width: 1),
                  ),
                  contentPadding: EdgeInsets.only(
                      left: SizeConfig.getSize(12),
                      top:
                          SizeConfig.isBigDevice() ? SizeConfig.getSize(16) : 0,
                      bottom: SizeConfig.isBigDevice()
                          ? SizeConfig.getSize(16)
                          : 0),
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
              style: GoogleFonts.robotoCondensed(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return MessagesProvider.get("Please enter password");
                }
                return null;
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: theme.secondaryColor?.withOpacity(0.54) ??
                          Colors.black54,
                      width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: theme.secondaryColor?.withOpacity(0.54) ??
                          Colors.black54,
                      width: 1),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: theme.errorTextColor ?? Colors.red, width: 1),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: theme.errorTextColor ?? Colors.red, width: 1),
                ),
                contentPadding: EdgeInsets.only(
                    left: SizeConfig.getSize(12),
                    top: SizeConfig.isBigDevice() ? SizeConfig.getSize(16) : 0,
                    bottom:
                        SizeConfig.isBigDevice() ? SizeConfig.getSize(16) : 0),
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
            const SizedBox(height: 10),
            DropdownButtonFormField(
              items: dropDownList,
              isExpanded: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null) {
                  return MessagesProvider.get("Please select a site");
                }
                return null;
              },
              value: _selectedSiteNotifier.value,
              style: theme.heading5?.copyWith(
                  fontSize: SizeConfig.isBigDevice()
                      ? SizeConfig.getFontSize(22)
                      : SizeConfig.getFontSize(26),
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: theme.secondaryColor?.withOpacity(0.54) ??
                          Colors.black54,
                      width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: theme.secondaryColor?.withOpacity(0.54) ??
                          Colors.black54,
                      width: 1),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: theme.errorTextColor ?? Colors.red, width: 1),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: theme.errorTextColor ?? Colors.red, width: 1),
                ),
                contentPadding: EdgeInsets.only(
                    left: SizeConfig.getSize(12),
                    top: SizeConfig.isBigDevice() ? SizeConfig.getSize(16) : 0,
                    bottom:
                        SizeConfig.isBigDevice() ? SizeConfig.getSize(16) : 0),
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
            SizedBox(height: SizeConfig.getSize(24)),
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
                  var result = _loginBloc.systemUserLoginResponse;
                  var machineId = await FlutterUdid.udid;
                  if (kDebugMode) {
                    machineId = 'MLR-LT023';
                  }
                  if (result == null) {
                    final systemUserLoginBL =
                        await SystemUserLoginDataBuilder.build();
                    result = await systemUserLoginBL.loginWithoutSave(
                        machineName: machineId.toUpperCase(), siteId: _selectedSiteNotifier.value?.siteId ?? -1);
                  }
                  final sysExecContext =
                      _getExecutionContextFromSysLogin(result);
                  final userLoginBL =
                      await LoginDataBuilder.build(sysExecContext);

                  final preferences = await SharedPreferences.getInstance();
                  await preferences.setInt(selectedSiteId,
                      _selectedSiteNotifier.value?.siteId ?? -1);

                  final loginRequest = LoginRequest(
                      loginId: _userCtr.text,
                      password: _passwordCtr.text,
                      siteId: _selectedSiteNotifier.value?.siteId ?? -1,
                      machineName: machineId);

                  Log.printMethodStart("_onLoginClick()", "Login Screen", "Login");
                  _loginBloc.setLoginBL(userLoginBL);
                  _loginBloc.setLoginRequest(loginRequest);
                  _loginBloc.add(LoginClickEvent());
                }
              },
              child: Text(MessagesProvider.get("Login")),
            ),
            const SizedBox(height: 5),
            _isNfcAvailable
                ? Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.black,
                              height: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4, right: 4),
                            child: AutoSizeText(
                              MessagesProvider.get("OR"),
                              style: tsS14W40016,
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.black,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return LoginViaCardDialog(
                                onLoginViaCardSuccess: () {
                                  Future.microtask(
                                      () => widget.onLoginSuccess());
                                },
                                isAuthenticateUser: false,
                                onAutheticateUser: (loginResponse) {},
                                systemUserLoginResponse:
                                    _loginBloc.systemUserLoginResponse,
                              );
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                right: 4,
                              ),
                              child: Image.asset(
                                'assets/ic_tap_card_small.png',
                                color: _theme?.secondaryColor,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                right: 4,
                              ),
                              child: AutoSizeText(
                                MessagesProvider.get("Tap the employee card"),
                                style: tsS16W70016,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                : const SizedBox(height: 0),
          ],
        ),
      ),
    );
  }

  ExecutionContextDTO _getExecutionContextFromSysLogin(
      SystemUserLoginResponse response) {
    final executionDTO = ExecutionContextDTO(
        posMachineGuid: response.data?.posMachineGuid,
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
        isUserLoggedIn: true);
    return executionDTO;
  }

  _showErrorDialog(BuildContext context, String title, String message) {
    showDialog(
        context: context, builder: (_) => LoginErrorDialog(title, message));
  }
}
