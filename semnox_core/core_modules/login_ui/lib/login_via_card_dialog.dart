import 'package:auto_size_text/auto_size_text.dart';
import 'package:execution_context/builder.dart';
import 'package:execution_context/models/execution_context_dto.dart';
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
import 'package:logs_data/logger.dart';
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:system_user_login_data/models/system_user_login_response.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

typedef OnAuthenticateUser = Function(LoginResponse);

class LoginViaCardDialog extends StatefulWidget {
  final VoidCallback onLoginViaCardSuccess;
  final OnAuthenticateUser onAutheticateUser;
  final SystemUserLoginResponse? systemUserLoginResponse;
  final bool isFromManagerLogin;
  final bool isAuthenticateUser;
  final int? changedSiteId;

  const LoginViaCardDialog(
      {super.key,
        required this.onLoginViaCardSuccess,
        this.systemUserLoginResponse,
        required this.onAutheticateUser,
        required this.isAuthenticateUser,
        this.isFromManagerLogin = false,
        this.changedSiteId
      });

  @override
  State<StatefulWidget> createState() => _LoginViaCardDialogState();
}

class _LoginViaCardDialogState extends State<LoginViaCardDialog> {
  final tapStatus = ValueNotifier<String?>(null);
  final loginBloc = LoginBloc();
  final NFCManager nfcManager = NFCManager();
  late Stream<NFCReadData> nfcReadDataStream;

  @override
  void initState() {
    super.initState();
    tapStatus.value = MessagesProvider.get('Waiting...');
    final sysExecContext = widget.systemUserLoginResponse == null
        ? null
        : _getExecutionContextFromSysLogin(widget.systemUserLoginResponse!);

    nfcReadDataStream = nfcManager.startScan();
    nfcReadDataStream.listen((data) async {
      nfcManager.stop();
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = sysExecContext ?? execContextBL.getExecutionContext();
      final userLoginBL = await LoginDataBuilder.build(execContext!);
      var machineId = await FlutterUdid.udid;
      if (kDebugMode) {
        machineId = 'MLR-LT023';
      }
      final loginRequest = LoginRequest(
          tagNumber: data.readableData,
          siteId: widget.changedSiteId ?? execContext.siteId ?? -1,
          machineName: machineId.toUpperCase());

      loginBloc.setLoginBL(userLoginBL);
      loginBloc.setLoginRequest(loginRequest);
      if (widget.isAuthenticateUser) {
        loginBloc.add(AuthenticateEvent());
      } else if (widget.isFromManagerLogin) {
        loginBloc.add(ManagerLoginClickEvent());
      } else {
        Log.printMethodStart("_loginViaCard()", "TAP CARD NOW", "Tap Card");
        loginBloc.add(LoginViaCardEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeConfig.getSize(16.0))),
        elevation: 0.0,
        backgroundColor: theme.transparentColor,
        child: Container(
          margin: EdgeInsets.only(left: SizeConfig.getWidth(0.0), right: SizeConfig.getWidth(0.0)),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.all(SizeConfig.getSize(10)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeConfig.getSize(10)),
                  color: theme.cartItemCardBG,
                ),
                child: SizedBox(
                  height: SizeConfig.getHeight(422),
                  width: SizeConfig.getWidth(572),
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.getHeight(90),
                        child: Align(
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            MessagesProvider.get("TAP CARD NOW"),
                            style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: SizeConfig.getSize(1),
                        color: theme.dialogFooterInnerShadow,
                        height: SizeConfig.getHeight(1),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/ic_tap_card_large.png',
                              color: theme.secondaryColor,
                              width: SizeConfig.getWidth(140),
                              height: SizeConfig.getHeight(140),
                            ),
                            BlocConsumer<LoginBloc, LoginState>(
                                bloc: loginBloc,
                                listener: (_, loginState) {
                                  if (loginState is ErrorState) {
                                    tapStatus.value = MessagesProvider.get("Invalid User Card. Please retry.");
                                    nfcReadDataStream = nfcManager.startScan();
                                  } else if (loginState is SuccessState) {
                                    tapStatus.value = MessagesProvider.get("Authenticated");
                                    if(widget.isFromManagerLogin) {
                                      Future.microtask(() => widget.onAutheticateUser(loginState.response));
                                    } else if (widget.isAuthenticateUser) {
                                      Future.microtask(() => widget.onAutheticateUser(loginState.response));
                                    } else {
                                      Log.printMethodEnd("_loginViaCard()", "TAP CARD NOW", "Tap Card");
                                      Log.printMethodReturn("_loginViaCard() - Login Successful.", "TAP CARD NOW", "Tap Card");
                                      Future.microtask(() => widget.onLoginViaCardSuccess());
                                    }
                                    Navigator.pop(context);
                                  } else if (loginState is LoadingState) {
                                    tapStatus.value = MessagesProvider.get('Card identified. Authenticating...');
                                  }
                                },
                                builder: (_, loginState) {
                                  return Padding(
                                    padding: EdgeInsets.all(SizeConfig.getSize(8.0)),
                                    child: AutoSizeText(
                                      tapStatus.value ?? '',
                                      style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                    ),
                                  );
                                })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    nfcManager.stop();
                    Navigator.of(context).pop();
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: SizeConfig.getSize(30.0),
                      backgroundColor: theme.darkTextColor ?? Colors.black,
                      child: Icon(Icons.close, color: Colors.white, size: SizeConfig.getSize(24),),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
}
