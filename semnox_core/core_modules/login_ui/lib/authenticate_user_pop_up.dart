import 'package:auto_size_text/auto_size_text.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:login_data/builder.dart';
import 'package:login_data/models/login_request.dart';
import 'package:login_data/models/login_response.dart';
import 'package:login_ui/bloc/login_bloc.dart';
import 'package:login_ui/bloc/login_event.dart';
import 'package:login_ui/bloc/login_state.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:login_ui/login_via_card_dialog.dart';
import 'package:login_ui/utils/common_widgets.dart';
import 'package:login_ui/utils/styles.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/sites/site_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

import 'constants.dart';

typedef OnAuthenticationSuccess = Function(LoginResponse);
typedef OnAuthenticationError = Function(String);
typedef OnTapAuthenticateSuccess = Function(LoginResponse);

class AuthenticateUserView extends StatefulWidget {
  final OnAuthenticationSuccess onAuthenticationSuccess;
  final OnAuthenticationError onAuthenticationError;
  final OnTapAuthenticateSuccess onTapAuthenticateSuccess;

  const AuthenticateUserView({
    Key? key,
    required this.onAuthenticationSuccess,
    required this.onAuthenticationError,
    required this.onTapAuthenticateSuccess,
  }) : super(key: key);

  @override
  State<AuthenticateUserView> createState() => _AuthenticateUserViewState();
}

class _AuthenticateUserViewState extends State<AuthenticateUserView> {
  final _userCtr = TextEditingController();
  final _passwordCtr = TextEditingController();
  final _dropDownList = <SiteDTO>[];
  final selectedSiteNotifier = ValueNotifier<SiteDTO?>(null);
  final _formKey = GlobalKey<FormState>();
  bool _isNfcAvailable = false;
  var _defaultSiteId = -1;
  var _isSiteEnabled = false;
  final _selectedSiteNotifier = ValueNotifier<SiteDTO?>(null);
  final loginBloc = LoginBloc();

  Future<void> requestSites() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    final preferences = await SharedPreferences.getInstance();
    _defaultSiteId = preferences.getInt(selectedSiteId) ?? -1;
    loginBloc.setMasterDataBL(masterDataBL);
    if(execContextDTO.isCorporate == false) {
      _isSiteEnabled = false;
      Future.microtask(() {
        setState(() {

        });
      });
    } else {
      _isSiteEnabled = true;
      loginBloc.add(RequestSitesEvent());
    }
  }

  @override
  void initState() {
    Future.microtask(() async {
      _isNfcAvailable = await NFCManager().isNfcAvailable();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    requestSites();
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        type: MaterialType.transparency,
        child: Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: dialogContent(context),
        ),
      ),
    );
  }

  Widget dialogContent(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            top: 18.0,
          ),
          margin: const EdgeInsets.only(top: 13.0, right: 8.0),
          decoration: BoxDecoration(
            color: theme.primaryColor ?? Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: theme.darkTextColor ?? Colors.black26,
                blurRadius: 0.0,
                offset: const Offset(0.0, 0.0),
              ),
            ],
          ),
          child: BlocConsumer<LoginBloc, LoginState>(
            bloc: loginBloc,
            listener: (context, state) {
              if (state is SitesUpdatedState) {
                var list = loginBloc.siteResponse?.data?.siteContainerDTOList;
                if (list != null) {
                  _dropDownList.clear();
                  _dropDownList.addAll(list);
                  final defaultSite =
                      list.where((element) => element.siteId == _defaultSiteId);
                  if (defaultSite.isNotEmpty) {
                    selectedSiteNotifier.value = defaultSite.first;
                  }
                }
              } else if (state is LoadingState) {
                Future.microtask(() => loader.showLoaderDialog(context));
              }

              if (state is ErrorState) {
                if (state.message.isNotEmpty) {
                  Future.microtask(() {
                    loader.hideLoaderDialog(context);
                    final titleText = state.message ==
                        MessagesProvider.get('Not a valid approver')
                        ? MessagesProvider.get('Not a valid approver')
                        : MessagesProvider.get('Login failed');
                    showAppErrorDialog(
                      context: context,
                      title: titleText,
                      message: state.message,
                    );
                    loginBloc.add(ClearErrorEvent());
                    return widget.onAuthenticationError(state.message);
                  });
                }
              } else if (state is SuccessState) {
                Log.printMethodEnd("_authenticateUser()", "Login Screen", "Record Attendance");
                Log.printMethodReturn("_authenticateUser() - Login Successful.", "Login Screen", "Record Attendance");
                Future.microtask(() {
                  widget.onAuthenticationSuccess(state.response);
                });
              }
            },
            builder: (_, state) {
              return _buildLoginForm(context);
            },
          ),
        ),
        Positioned(
          right: 0.0,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                radius: 14.0,
                backgroundColor: theme.primaryOpposite ?? Colors.black,
                child: Icon(Icons.close,
                    color: theme.primaryColor ?? Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return RawScrollbar(
      thumbVisibility: true,
      thickness: 12,
      trackColor: theme.scrollArea,
      thumbColor: theme.scrollBarHandle,
      child: Container(
        width: SizeConfig.screenWidth * 0.5,
        decoration: BoxDecoration(
          color: theme.primaryColor ?? Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(SizeConfig.getWidth(24)),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _userCtr,
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
                        top: SizeConfig.isBigDevice()
                            ? SizeConfig.getSize(16)
                            : 0,
                        bottom: SizeConfig.isBigDevice()
                            ? SizeConfig.getSize(16)
                            : 0),
                    hintText: MessagesProvider.get("Please enter username"),
                    label: Text(MessagesProvider.get("Username"),
                        style: theme.heading5?.copyWith(
                            fontSize: SizeConfig.getFontSize(24),
                            fontWeight: FontWeight.w400)),
                  ),
                ),
                SizedBox(height: SizeConfig.getSize(16)),
                TextFormField(
                  controller: _passwordCtr,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  style: theme.heading5?.copyWith(
                      fontSize: SizeConfig.getFontSize(28),
                      fontWeight: FontWeight.w400),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return MessagesProvider.get("Please Enter Password");
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
                            color: theme.errorTextColor ?? Colors.red,
                            width: 1),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: theme.errorTextColor ?? Colors.red,
                            width: 1),
                      ),
                      hintText: MessagesProvider.get("Please Enter Password"),
                      label: Text(
                        MessagesProvider.get("Password"),
                        style: theme.heading5?.copyWith(
                            fontSize: SizeConfig.getFontSize(24),
                            fontWeight: FontWeight.w400),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: SizeConfig.getSize(12),
                          top: SizeConfig.isBigDevice()
                              ? SizeConfig.getSize(16)
                              : 0,
                          bottom: SizeConfig.isBigDevice()
                              ? SizeConfig.getSize(16)
                              : 0)),
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: SizeConfig.getSize(16)),

                Visibility(
                  visible: _isSiteEnabled,
                  child: DropdownButtonFormField(
                    items: _dropDownList.map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(item.siteName,
                            style: theme.heading5?.copyWith(
                                fontSize: SizeConfig.getFontSize(26),
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
                    value: selectedSiteNotifier.value,
                    style: theme.heading5?.copyWith(
                        fontSize: SizeConfig.isBigDevice()
                            ? SizeConfig.getFontSize(22)
                            : SizeConfig.getFontSize(26),
                        fontWeight: FontWeight.w400),
                    onChanged: (value) {
                      selectedSiteNotifier.value = value;
                    },
                    decoration: InputDecoration(
                        label: Text(
                          MessagesProvider.get("Site"),
                          style: theme.heading5?.copyWith(
                              fontSize: SizeConfig.getFontSize(24),
                              fontWeight: FontWeight.w400),
                        ),
                        contentPadding: EdgeInsets.only(
                            left: SizeConfig.getSize(12),
                            top: SizeConfig.isBigDevice()
                                ? SizeConfig.getSize(16)
                                : 0,
                            bottom: SizeConfig.isBigDevice()
                                ? SizeConfig.getSize(16)
                                : 0),
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
                              color: theme.errorTextColor ?? Colors.red,
                              width: 1),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: theme.errorTextColor ?? Colors.red,
                              width: 1),
                        )),
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
                      backgroundColor:
                          theme.button2InnerShadow1 ?? Colors.black,
                      minimumSize: const Size(double.infinity, 46),
                      padding: const EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      textStyle: theme.headingLight5
                          ?.copyWith(fontSize: SizeConfig.getFontSize(32))),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final execContextBL =
                          await ExecutionContextBuilder.build();
                      final execContext = execContextBL.getExecutionContext();
                      final userLoginBL =
                          await LoginDataBuilder.build(execContext!);
                      var machineId = await FlutterUdid.udid;
                      if (kDebugMode) {
                        machineId = 'MLR-LT023';
                      }
                      final loginRequest = LoginRequest(
                          loginId: _userCtr.text,
                          password: _passwordCtr.text,
                          siteId: selectedSiteNotifier.value?.siteId ?? -1,
                          machineName: machineId.toUpperCase());

                      Log.printMethodStart("_authenticateUser()", "Login Screen", "Record Attendance");
                      loginBloc.setLoginBL(userLoginBL);
                      loginBloc.setLoginRequest(loginRequest);
                      loginBloc.add(AuthenticateEvent());
                    }
                  },
                  child: Text(MessagesProvider.get("Login"),
                      style: theme.heading1?.copyWith(
                          fontSize: SizeConfig.getFontSize(30),
                          color: Colors.white)),
                ),
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
                                padding:
                                    const EdgeInsets.only(left: 4, right: 4),
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
                                padding: const EdgeInsets.all(12),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                textStyle: theme.headingLight5?.copyWith(
                                    fontSize: SizeConfig.getFontSize(32))),
                            onPressed: () {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return LoginViaCardDialog(
                                    onLoginViaCardSuccess: () {},
                                    isAuthenticateUser: true,
                                    onAutheticateUser: (loginResponse) {
                                      widget.onTapAuthenticateSuccess(
                                          loginResponse);
                                    },
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
                                      color: Colors.white),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    right: 4,
                                  ),
                                  child: AutoSizeText(
                                    MessagesProvider.get(
                                        "Tap the employee card"),
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
        ),
      ),
    );
  }
}
