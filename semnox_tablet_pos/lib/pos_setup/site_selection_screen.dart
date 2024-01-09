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
import 'package:system_user_login_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/generic_dialog.dart';
import 'package:widgets_library/loader_dialog.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/keyboard_hider_widget.dart';
import 'package:widgets_library/utils/size_config.dart';

class SiteSelectionScreen extends StatefulWidget {
  final VoidCallback onPrevClicked;
  final int screenIndex;
  const SiteSelectionScreen({
    super.key,
    required this.onPrevClicked,
    required this.screenIndex,
  });

  @override
  State<SiteSelectionScreen> createState() => _SiteSelectionScreenState();
}

class _SiteSelectionScreenState extends State<SiteSelectionScreen>  {
  ScrollController scrollController = ScrollController();
  late ApplicationPrefsDataBLContract appPrefsBL;
  final _formKey = GlobalKey<FormState>();

  final _selectedSiteNotifier = ValueNotifier<SiteDTO?>(null);
  final _dropDownList = <SiteDTO>[];
  bool isLocked = false;


  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  Future<void> _init() async {
    isLocked = true;
    appPrefsBL = await ApplicationPrefsBuilder.build();
    final preferences = await SharedPreferences.getInstance();
    final selSiteID = preferences.getInt(selectedSiteId);

    final execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    if(execContextDTO != null) {
      Future.microtask(() => context.read<PosConfigCubit>().setLoadingStatus(1));
      final masterDataBL = await MasterDataBuilder.build(execContextDTO);
      final sites = await masterDataBL.getSites(shouldRefreshByForce: true);
      if(mounted) {
        final selectedItem = sites?.data?.siteContainerDTOList.where((element) => element.siteId == selSiteID);
        context.read<PosConfigCubit>()
            .updateSites(sites?.data?.siteContainerDTOList ?? []);
        if (sites?.data?.siteContainerDTOList.isNotEmpty == true) {
          _dropDownList.clear();
          _dropDownList.addAll(sites!.data!.siteContainerDTOList);
        }
        Future.microtask(() => context.read<PosConfigCubit>().setLoadingStatus(0));
        if (selectedItem?.isNotEmpty == true) {
          _selectedSiteNotifier.value = selectedItem?.first;
        }
      }
    }
    isLocked = false;
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    if(_dropDownList.isEmpty && !isLocked && widget.screenIndex == 2) {
      Future.microtask(() => _init());
    }
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
                      MessagesProvider.get('Site'),
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
                          child: ValueListenableBuilder(
                            valueListenable: _selectedSiteNotifier,
                            builder: (context, value, _) =>
                                DropdownButtonFormField(
                                  items: _dropDownList.map<DropdownMenuItem<SiteDTO>>((item) => DropdownMenuItem(
                                      value: item,
                                      child: Text(item.siteName,
                                          style: theme.heading5?.copyWith(
                                              fontSize: SizeConfig.isBigDevice() ? SizeConfig.getFontSize(30) : SizeConfig.getFontSize(28),
                                              fontWeight: FontWeight.w400)))).toList(),
                                  isExpanded: true,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null) {
                                      return MessagesProvider.get(
                                          "Please select a site");
                                    }
                                    return null;
                                  },
                                  value: _selectedSiteNotifier.value,
                                  style: theme.heading5?.copyWith(
                                    fontSize: SizeConfig.isBigDevice() ? SizeConfig.getFontSize(30) : SizeConfig.getFontSize(28),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  decoration: InputDecoration(
                                    label: Text(
                                      MessagesProvider.get("Site"),
                                      style: theme.heading5?.copyWith(
                                        fontSize:
                                        SizeConfig.getFontSize(28),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    border: const OutlineInputBorder(),
                                    isDense: true,
                                  ),
                                  onChanged: (value) {
                                    _selectedSiteNotifier.value = value;
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
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
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
                                _selectedSiteNotifier.value = null;
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
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: ElevatedButton(
                              onPressed: () async {
                                FocusManager.instance.primaryFocus?.unfocus();
                                final preferences = await SharedPreferences.getInstance();
                                final executionContextBL = await ExecutionContextBuilder.build();
                                final executionContextDTO = executionContextBL.getExecutionContext();
                                if(executionContextDTO?.isCorporate == false) {
                                  await appPrefsBL.setDefaultSiteId(-1);
                                  await preferences.setBool(isPosSetUpDone, true);
                                  await preferences.setInt(currPosSetUpIndex, 0);
                                  await preferences.setInt(selectedSiteId, -1);
                                  if (mounted) {
                                    Navigator.pop(context, true);
                                  }
                                } else {
                                  if(_formKey.currentState!.validate()) {
                                    final prevSiteId = preferences.getInt(selectedSiteId);
                                    await appPrefsBL.setDefaultSiteId(_selectedSiteNotifier.value?.siteId ?? -1);
                                    appPrefsBL.setDefaultSiteName(_selectedSiteNotifier.value?.siteName ?? '');
                                    await preferences.setBool(isPosSetUpDone, true);
                                    await preferences.setInt(currPosSetUpIndex, 0);
                                    await preferences.setInt(selectedSiteId, _selectedSiteNotifier.value?.siteId ?? -1);
                                    if (prevSiteId != null) {
                                      if (prevSiteId !=
                                          (_selectedSiteNotifier.value?.siteId ?? -1)) {
                                        await preferences.setBool(isSiteChanged, true);
                                      }
                                    }
                                    if (mounted) {
                                      Navigator.pop(context, true);
                                    }
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
