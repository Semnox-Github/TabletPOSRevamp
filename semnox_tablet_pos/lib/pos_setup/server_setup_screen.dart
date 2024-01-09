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
import 'package:semnox_tablet_pos/AppColors.dart';
import 'package:semnox_tablet_pos/config/constants.dart';
import 'package:semnox_tablet_pos/cubits/pos_config/pos_config_cubit.dart';
import 'package:semnox_tablet_pos/cubits/pos_config/pos_config_state.dart';
import 'package:semnox_tablet_pos/utils/network_connectivity_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/generic_dialog.dart';
import 'package:widgets_library/loader_dialog.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/keyboard_hider_widget.dart';
import 'package:widgets_library/utils/size_config.dart';

import '../utils/file_utils.dart';

class ServerSetupScreen extends StatefulWidget {
  final Function(String) onNextClicked;

  const ServerSetupScreen({
    super.key,
    required this.onNextClicked,
  });

  @override
  State<ServerSetupScreen> createState() => _ServerSetupScreenState();
}

class _ServerSetupScreenState extends State<ServerSetupScreen> {
  ScrollController scrollController = ScrollController();
  final posNameController = TextEditingController();
  final deviceIPController = TextEditingController();
  final fieldServerController = TextEditingController();
  late ApplicationPrefsDataBLContract appPrefsBL;
  final _formKey = GlobalKey<FormState>();

  String _selectedProtocol = 'https://';
  final _protocolDropdownState = GlobalKey<FormFieldState>();
  final _protocolList = ['https://', 'http://'];

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    Future.microtask(() => _init());
  }

  Future<void> _init() async {
    appPrefsBL = await ApplicationPrefsBuilder.build();
    var machineName = appPrefsBL.getMachineName();
    machineName ??= await FlutterUdid.udid;
    posNameController.text = machineName.toUpperCase();
    final preferences = await SharedPreferences.getInstance();
    final protocol = preferences.getString(baseUrlProtocol);
    if(protocol != null) {
      _selectedProtocol = protocol;
    }
    var deviceIP  = await NetworkConnectivityProvider().getDeviceIpAddress();
    deviceIPController.text = deviceIP?.toString() ?? '--';
    fieldServerController.text = appPrefsBL.getServerUrl().replaceAll("https://", "")
        .replaceAll("http://", "");
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
                      MessagesProvider.get("Server Url"),
                      style: theme.heading5?.copyWith(
                        fontSize: SizeConfig.getFontSize(38),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: DropdownButtonFormField(
                            key: _protocolDropdownState,
                            iconSize: SizeConfig.getSize(28),
                            items: _protocolList.map<DropdownMenuItem<String>>((item) => DropdownMenuItem(
                              value: item,
                              child: Text(item,
                                  style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(30), fontWeight: FontWeight.w400)),
                            )).toList(),
                            isExpanded: false,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              return null;
                            },
                            value: _selectedProtocol,
                            style: theme.heading5?.copyWith(
                              fontSize: SizeConfig.isBigDevice() ? SizeConfig.getFontSize(32) : SizeConfig.getFontSize(28),
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              isDense: false,
                              contentPadding: EdgeInsets.fromLTRB(SizeConfig.getSize(12), SizeConfig.isBigDevice() ? SizeConfig.getSize(26) : SizeConfig.getSize(22), SizeConfig.getSize(12), SizeConfig.isBigDevice() ? SizeConfig.getSize(17) : SizeConfig.getSize(14))
                            ),
                            onChanged: (value) {
                              _selectedProtocol = value ?? '';
                            },
                            hint: Text(
                              MessagesProvider.get("Select Site"),
                              style: theme.heading5?.copyWith(
                                fontSize: SizeConfig.isBigDevice() ? SizeConfig.getFontSize(32) : SizeConfig.getFontSize(30),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          flex: 5,
                          child: TextFormField(
                            controller: fieldServerController,
                            style: theme.heading5?.copyWith(
                              fontSize: SizeConfig.getFontSize(30),
                              fontWeight: FontWeight.w400,
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return MessagesProvider.get("Please enter Server Url");
                              }
                              return null;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                  RegExp(r'\s')),
                            ],
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              isDense: false,
                                contentPadding: EdgeInsets.fromLTRB(SizeConfig.getSize(12), SizeConfig.getSize(26), SizeConfig.getSize(12), SizeConfig.getSize(16))
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      MessagesProvider.get("Device IP Address"),
                      style: theme.heading5?.copyWith(
                        fontSize: SizeConfig.getFontSize(38),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(12), vertical: SizeConfig.getSize(6)),
                            decoration: BoxDecoration(color: theme.customerDetailBG ?? colorBlack, borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: TextFormField(
                                controller: deviceIPController,
                                enabled: false,
                                style: theme.heading5?.copyWith(
                                  fontSize: SizeConfig.getFontSize(30),
                                  fontWeight: FontWeight.w400,
                                ),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  counterText: '',
                                ),
                                maxLength: 15,
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'\s')),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      MessagesProvider.get("Device Identifier"),
                      style: theme.heading5?.copyWith(
                        fontSize: SizeConfig.getFontSize(38),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(12), vertical: SizeConfig.getSize(6)),
                            decoration: BoxDecoration(color: theme.customerDetailBG ?? colorBlack, borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: TextFormField(
                                controller: posNameController,
                                enabled: false,
                                style: theme.heading5?.copyWith(
                                  fontSize: SizeConfig.getFontSize(30),
                                  fontWeight: FontWeight.w400,
                                ),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  counterText: '',
                                ),
                                maxLength: 15,
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'\s')),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.getSize(30)),
                    Visibility(
                      visible: context.read<PosConfigCubit>().state.isServerErrorsPresent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: ElevatedButton(
                              onPressed: () async {
                                FocusManager.instance.primaryFocus?.unfocus();
                                final serverValidationsRes = context.read<PosConfigCubit>().serverValidations;
                                bool? status = false;
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: SizedBox(
                                        width: double.maxFinite,
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Flexible(
                                                child: SingleChildScrollView(
                                                  child: ListView.builder(
                                                      shrinkWrap: true,
                                                      padding: EdgeInsets.zero,
                                                      physics: const ClampingScrollPhysics(),
                                                      scrollDirection: Axis.vertical,
                                                      itemCount: serverValidationsRes.length,
                                                      itemBuilder: (context, index) {
                                                        if (index == 0) {
                                                          status =
                                                              serverValidationsRes[index].status;
                                                        } else if (index == 1) {
                                                          status = serverValidationsRes[0].status == true
                                                              ? serverValidationsRes[index].status : false;
                                                        } else if (index == 2) {
                                                          status = serverValidationsRes[0].status == true &&
                                                              serverValidationsRes[1].status == true
                                                              ? serverValidationsRes[index].status
                                                              : false;
                                                        }
                                                        return ExpansionTile(
                                                          title: AnimatedContainer(
                                                              duration: const Duration(milliseconds: 500),
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                        serverValidationsRes[index].entityType ?? '',
                                                                        overflow: TextOverflow.ellipsis,
                                                                        style: theme.heading5?.copyWith(
                                                                          fontSize: SizeConfig.getFontSize(28),
                                                                          fontWeight: FontWeight.w500,
                                                                        ),
                                                                        softWrap: true),
                                                                  ),
                                                                  status == true
                                                                      ? const Icon(
                                                                    Icons.check,
                                                                    color: Colors.green,
                                                                  )
                                                                      : const Icon(
                                                                    Icons.close,
                                                                    color: Colors.red,
                                                                  ),
                                                                ],
                                                              )),
                                                          children: [
                                                            status == false
                                                                ? Container(
                                                              width: 400,
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                  color: theme.primaryOpposite ?? colorBlack,
                                                                ),
                                                                borderRadius: const BorderRadius.all(
                                                                    Radius.circular(20)),
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text(
                                                                      "Error StatusCode : ${serverValidationsRes[index].statusCode}",
                                                                      style: theme.heading5?.copyWith(
                                                                        fontSize: SizeConfig.getFontSize(24),
                                                                        fontWeight: FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "Exception : ${serverValidationsRes[index].exception}",
                                                                      style: theme.heading5?.copyWith(
                                                                        fontSize: SizeConfig.getFontSize(24),
                                                                        fontWeight: FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                     "StackTrace : ${serverValidationsRes[index].stackTrace}",
                                                                      style: theme.heading5?.copyWith(
                                                                        fontSize: SizeConfig.getFontSize(24),
                                                                        fontWeight: FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                      Alignment.bottomCenter,
                                                                      child: ElevatedButton(
                                                                        onPressed: () async {
                                                                          FocusManager.instance.primaryFocus?.unfocus();
                                                                          var path = await fileUtils.writeToFile(
                                                                              "Error StatusCode : ${serverValidationsRes[index].statusCode.toString()} /n Exception : ${serverValidationsRes[index].exception} /n StackTrace : ${serverValidationsRes[index].stackTrace}");
                                                                          await fileUtils.shareFile(path);
                                                                        },
                                                                        style: ElevatedButton.styleFrom(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              25.0, 10.0, 25.0, 10.0),
                                                                          backgroundColor:
                                                                          theme.button2InnerShadow1,
                                                                        ),
                                                                        child: Text(
                                                                          MessagesProvider.get("Share").toUpperCase(),
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
                                                              ),
                                                            )
                                                                : Container()
                                                          ],
                                                        );
                                                      }),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.fromLTRB(
                                    25.0, 10.0, 25.0, 10.0),
                                backgroundColor: Colors.red,
                              ),
                              child: Text(
                                MessagesProvider.get("View Error Details").toUpperCase(),
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
                    ),
                    SizedBox(height: SizeConfig.getSize(30)),
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
                                fieldServerController.clear();
                                _protocolDropdownState.currentState?.didChange('https://');
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
                                if(_formKey.currentState!.validate()) {
                                  _addSlashToServer();
                                  final serverUrl = '$_selectedProtocol${fieldServerController.text.toString()}';
                                  widget.onNextClicked(serverUrl);
                                  final preferences = await SharedPreferences.getInstance();
                                  await preferences.setBool(isPosSetUpDone, false);
                                  await preferences.setInt(selectedSiteId, -1);
                                  await appPrefsBL.setDefaultSiteId(-1);
                                  preferences.setString(baseUrlProtocol, _selectedProtocol);

                                  if(mounted) {
                                    await context.read<PosConfigCubit>().validateServerURL(serverUrl);
                                  }
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

  void _addSlashToServer() {
    String text = fieldServerController.text;
    if (!text.endsWith('/')) {
      fieldServerController.text = '$text/';
    }
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
