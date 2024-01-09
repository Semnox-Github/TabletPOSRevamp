import 'dart:io';

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
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/sites/site_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:semnox_tablet_pos/config/constants.dart';
import 'package:semnox_tablet_pos/cubits/pos_config/pos_config_cubit.dart';
import 'package:semnox_tablet_pos/cubits/pos_config/pos_config_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/generic_dialog.dart';
import 'package:widgets_library/loader_dialog.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/keyboard_hider_widget.dart';
import 'package:widgets_library/utils/size_config.dart';

class SystemUserCredScreen extends StatefulWidget {
  final Function(String, String) onNextClicked;
  final VoidCallback onPrevClicked;

  const SystemUserCredScreen({
    super.key,
    required this.onPrevClicked,
    required this.onNextClicked,
  });

  @override
  State<SystemUserCredScreen> createState() => _SystemUserCredScreenState();
}

class _SystemUserCredScreenState extends State<SystemUserCredScreen> {
  ScrollController scrollController = ScrollController();
  late ApplicationPrefsDataBLContract appPrefsBL;
  final _formKey = GlobalKey<FormState>();

  final _userCtr = TextEditingController();
  final _passwordCtr = TextEditingController();

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    Future.microtask(() => _init());
  }

  Future<void> _init() async {
    appPrefsBL = await ApplicationPrefsBuilder.build();
    _userCtr.text = appPrefsBL.getSystemUserName();
    _passwordCtr.text = appPrefsBL.getSystemPassword();
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(right: 8, top: 8, bottom: 5),
        child: Scroller(
          controller: scrollController,
          child: ListView(
            controller: scrollController,
            children: [
              Padding(padding: const EdgeInsets.only(
                  left: 20, top: 10, right: 36, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      MessagesProvider.get("System User Login"),
                      style: theme.heading5?.copyWith(
                        fontSize: SizeConfig.getFontSize(38),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _userCtr,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9a-zA-Z@_]"))
                            ],
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            style: theme.heading5?.copyWith(
                              fontSize: SizeConfig.getFontSize(30),
                              fontWeight: FontWeight.w400,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return MessagesProvider.get(
                                    "Please enter System UserName");
                              }
                              return null;
                            },
                            maxLength: 50,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                counterText: '',
                                isDense: true,
                                hintText: MessagesProvider.get(
                                    "Please enter System UserName"),
                                label: Text(
                                    MessagesProvider.get("System Username"),
                                    style: theme.heading5?.copyWith(
                                      fontSize:
                                      SizeConfig.getFontSize(30),
                                      fontWeight: FontWeight.w400,
                                    ))),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.getSize(30)),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _passwordCtr,
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            maxLength: 15,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                  RegExp(r'\s')),
                            ],
                            style: theme.heading5?.copyWith(
                              fontSize: SizeConfig.getFontSize(30),
                              fontWeight: FontWeight.w400,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return MessagesProvider.get("Please enter System Password");
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: MessagesProvider.get("Please enter System Password"),
                              counterText: '',
                              isDense: true,
                              border: const OutlineInputBorder(),
                              label: Text(
                                MessagesProvider.get("System Password"),
                                style: theme.heading5?.copyWith(
                                  fontSize:
                                  SizeConfig.getFontSize(30),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            keyboardType:
                            TextInputType.visiblePassword,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width *
                                0.15,
                            child: ElevatedButton(
                              onPressed: () async {
                                FocusManager.instance.primaryFocus?.unfocus();
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext ctx) {
                                      return GenericDialog(
                                        onTapYes: () {
                                          if (Platform.isAndroid) {
                                            SystemNavigator.pop();
                                          }
                                          else if (Platform.isIOS) {
                                            exit(0);
                                          }
                                        },
                                        onTapNo: () {

                                        }, title: MessagesProvider.get('Exit Application'),
                                        msg: MessagesProvider.get('Are you sure to exit application?'),
                                      );
                                    });
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.fromLTRB(
                                    25.0, 10.0, 25.0, 10.0),
                                backgroundColor:
                                theme.button2InnerShadow1,
                              ),
                              child: Text(
                                MessagesProvider.get("Close").toUpperCase(),
                                style: theme.headingLight5?.copyWith(
                                    fontSize:
                                    SizeConfig.getFontSize(30),
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width *
                                0.15,
                            child: ElevatedButton(
                              onPressed: () async {
                                FocusManager.instance.primaryFocus?.unfocus();
                                _userCtr.clear();
                                _passwordCtr.clear();
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.fromLTRB(
                                    25.0, 10.0, 25.0, 10.0),
                                backgroundColor:
                                theme.button2InnerShadow1,
                              ),
                              child: Text(
                                MessagesProvider.get("Clear").toUpperCase(),
                                style: theme.headingLight5?.copyWith(
                                    fontSize:
                                    SizeConfig.getFontSize(30),
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width *
                                0.15,
                            child: ElevatedButton(
                              onPressed: () async {
                                FocusManager.instance.primaryFocus?.unfocus();
                                widget.onPrevClicked();
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.fromLTRB(
                                    25.0, 10.0, 25.0, 10.0),
                                backgroundColor:
                                theme.button2InnerShadow1,
                              ),
                              child: Text(
                                MessagesProvider.get("Prev").toUpperCase(),
                                style: theme.headingLight5?.copyWith(
                                    fontSize:
                                    SizeConfig.getFontSize(30),
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width *
                                0.15,
                            child: ElevatedButton(
                              onPressed: () async {
                                FocusManager.instance.primaryFocus?.unfocus();
                                final userName = _userCtr.text;
                                final password = _passwordCtr.text;
                                if(_formKey.currentState!.validate()) {
                                  widget.onNextClicked(userName, password);
                                  context.read<PosConfigCubit>().validateSystemUserCredentials(_userCtr.text, _passwordCtr.text);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.fromLTRB(
                                    25.0, 10.0, 25.0, 10.0),
                                backgroundColor:
                                theme.button2InnerShadow1,
                              ),
                              child: Text(
                                MessagesProvider.get("Next").toUpperCase(),
                                style: theme.headingLight5?.copyWith(
                                    fontSize:
                                    SizeConfig.getFontSize(30),
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
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

}
