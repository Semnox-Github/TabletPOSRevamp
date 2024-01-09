import 'package:execution_context/builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:login_data/builder.dart';
import 'package:login_data/models/login_request.dart';
import 'package:login_data/models/login_response.dart';
import 'package:login_ui/AppColors.dart';
import 'package:login_ui/bloc/login_bloc.dart';
import 'package:login_ui/bloc/login_event.dart';
import 'package:login_ui/bloc/login_state.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:login_ui/login_via_card_dialog.dart';
import 'package:login_ui/utils/common_widgets.dart';
import 'package:logs_data/logger.dart';
import 'package:orders_ui/Screens/TableSeatLoayoutScreen.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:login_ui/utils/styles.dart';
import 'package:master_data/builder.dart';
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/keyboard_hider_widget.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

typedef OnManagerLoginSuccess = Function(LoginResponse);
typedef OnManagerLoginError = Function(String);

class ManagerLoginView extends StatefulWidget {
  final OnManagerLoginSuccess onLoginSuccess;
  final OnManagerLoginError onLoginError;
  final Function(BuildContext)? cancelBtn;

  const ManagerLoginView({
    Key? key,
    required this.onLoginSuccess,
    required this.onLoginError,
    this.cancelBtn,
  }) : super(key: key);

  @override
  State<ManagerLoginView> createState() => _ManagerLoginViewState();
}

class _ManagerLoginViewState extends State<ManagerLoginView> with WidgetsBindingObserver {
  final _userCtr = TextEditingController();
  final _passwordCtr = TextEditingController();
  final _scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  final _loginBloc = LoginBloc();

  bool _isNfcAvailable = false;
  bool _hasScrollBar = false;
  bool _isScrollableByDefault = false;

  @override
  void initState() {
    Future.microtask(() async {
      _isNfcAvailable = await NFCManager().isNfcAvailable();
      setState(() {
      });
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
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          if (!_isScrollableByDefault) {
            _hasScrollBar = isKeyboardVisible;
          }
          return Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Scroller(
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: BlocConsumer<LoginBloc, LoginState>(
                  bloc: _loginBloc,
                  listener: (_, state) {
                    if (state is ErrorState) {
                      if (state.message.isNotEmpty) {
                        Future.microtask(() {
                          loader.hideLoaderDialog(context);
                          final titleText = state.message == MessagesProvider.get('Not a valid approver')
                              ? MessagesProvider.get('Not a valid approver')
                              : MessagesProvider.get('Login Failed');
                          showAppErrorDialog(
                            context: context,
                            title: titleText,
                            message: state.message,
                          );
                          _loginBloc.add(ClearErrorEvent());
                          return widget.onLoginError(state.message);
                        });
                      }
                    } else if (state is SuccessState) {
                      Log.printMethodEnd("_onManagerLoginClick()", "Manager approval required", "OK");
                      if(mounted) {
                        /// to close popup loader first
                        Navigator.pop(context);
                      }
                      Future.microtask(() => _processManagerLogin(context, state.response));
                    } else if (state is LoadingState) {
                      Future.microtask(() => loader.showLoaderDialog(context));
                    }
                  },
                  builder: (_, state) {
                    return _buildLoginForm(context, isKeyboardVisible);
                  },
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
    return KeyboardHider(
      child: Container(
        decoration: BoxDecoration(
          color: theme.backGroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.only(
            left: SizeConfig.getWidth(24),
            right: _hasScrollBar ? SizeConfig.getWidth(64) : SizeConfig.getWidth(24),
            top: SizeConfig.getHeight(16),
            bottom: isKeyboardVisible ? SizeConfig.getHeight(16) : SizeConfig.getHeight(16)),
        width: SizeConfig.getWidth(602),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: SizeConfig.getHeight(12)),
              Text(MessagesProvider.get("Manager approval required").toUpperCase(),
                  style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(34))),
              SizedBox(height: SizeConfig.getHeight(12)),
              const Divider(),
              SizedBox(height: SizeConfig.getHeight(12)),
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
                scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 30),
                style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(30), fontWeight: FontWeight.w400),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return MessagesProvider.get("Please Enter Password");
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: MessagesProvider.get("Password"),
                  hintStyle: theme.heading5
                      ?.copyWith(fontSize: SizeConfig.getFontSize(30), fontWeight: FontWeight.w400, color: Colors.grey),
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
                    style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(24), fontWeight: FontWeight.w400),
                  ),
                  contentPadding: EdgeInsets.only(
                      left: SizeConfig.getSize(12),
                      top: SizeConfig.isBigDevice() ? SizeConfig.getSize(16) : 0,
                      bottom: SizeConfig.isBigDevice() ? SizeConfig.getSize(16) : 0),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              Visibility(visible: _isNfcAvailable, child: SizedBox(height: SizeConfig.getHeight(20))),
              Visibility(
                visible: _isNfcAvailable,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: theme.button2InnerShadow1 ?? Colors.black,
                      minimumSize: const Size(double.infinity, 46),
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      textStyle: theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(32))),
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (cxt) {
                        return LoginViaCardDialog(
                          onLoginViaCardSuccess: () {},
                          isAuthenticateUser: false,
                          isFromManagerLogin: true,
                          onAutheticateUser: (loginResponse) {
                            _processManagerLogin(context, loginResponse);
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
                        child: Image.asset('assets/ic_tap_card_small.png', color: Colors.white),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 4,
                        ),
                        child: Text(
                          MessagesProvider.get("Tap the employee card"),
                          style: theme.heading1?.copyWith(fontSize: SizeConfig.getFontSize(30), color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: !_isNfcAvailable,
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
                      buttonColor: theme.footerBG1 ?? AppColors.buttonBackgrounColor,
                      text: MessagesProvider.get("Cancel"),
                      textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(32), fontWeight: FontWeight.w600) ?? tsS24W70016,
                      onTapped: () {
                        Navigator.pop(context);
                        pressedRowOuterValue.value = '';
                        pressedRowInnerValue.value = '';
                        pressedColumnOuterValue.value = '';
                        pressedColumnInnerValue.value = '';
                        selectedOuterTableId.value = '';
                        selectedInnerTableId.value = '';
                        if (widget.cancelBtn != null) {
                          widget.cancelBtn!(context);
                        }
                      }),
                  SizedBox(width: SizeConfig.getWidth(24)),
                  containerButton(
                      width: SizeConfig.getWidth(140),
                      height: SizeConfig.getHeight(65),
                      buttonColor: theme.button2InnerShadow1 ?? Colors.black,
                      text: MessagesProvider.get("OK"),
                      textStyle: theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(32), fontWeight: FontWeight.w600, color: Colors.white) ?? tsS24W70016,
                      onTapped: () async {
                        if (_formKey.currentState!.validate()) {
                          final execContextBL = await ExecutionContextBuilder.build();
                          final execContext = execContextBL.getExecutionContext();
                          final userLoginBL = await LoginDataBuilder.build(execContext!);
                          var machineId = await FlutterUdid.udid;
                          if (kDebugMode) {
                            machineId = 'MLR-LT023';
                          }
                          final loginRequest = LoginRequest(
                              loginId: _userCtr.text,
                              password: _passwordCtr.text,
                              siteId: execContext.siteId ?? -1,
                              machineName: machineId.toUpperCase());

                          Log.printMethodStart("_onManagerLoginClick()", "Manager approval required", "OK");
                          _loginBloc.setLoginBL(userLoginBL);
                          _loginBloc.setLoginRequest(loginRequest);
                          _loginBloc.add(ManagerLoginClickEvent());
                        }
                      }),
                  SizedBox(width: SizeConfig.getWidth(24)),
                ],
              ),
              SizedBox(height: SizeConfig.getHeight(15)),
            ],
          ),
        ),
      ),
    );
  }

  _processManagerLogin(BuildContext context, LoginResponse response) async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final userRoleDTO = await masterDataBL.getUserRoleById(response.data?.userRoleId ?? -1);

    if (userRoleDTO?.selfApprovalAllowed == true) {
      Log.printMethodReturn("_onManagerLoginClick() - true", "Manager approval required", "OK");
      widget.onLoginSuccess(response);
      if (mounted) {
        Navigator.pop(context);
      }
    } else {
      Log.printMethodReturn("_onManagerLoginClick() - false", "Manager approval required", "OK");
      _loginBloc.setError(MessagesProvider.get('Not a valid approver'));
      _loginBloc.add(AddErrorEvent());
      widget.onLoginError(MessagesProvider.get('Not a valid approver'));
    }
  }
}
