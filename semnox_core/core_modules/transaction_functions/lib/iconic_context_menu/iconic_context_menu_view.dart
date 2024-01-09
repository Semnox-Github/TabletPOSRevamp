library iconic_context_menu;

import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/user_role_container/management_form_access_container_dto.dart';
import 'package:master_data/models/user_role_container/user_role_container_dto.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';
import '../cubit/transaction_functions_cubit.dart';
import '../cubit/transaction_functions_cubit_state.dart';
import '../transaction_function_dto.dart';

class IconicContextMenuView extends StatefulWidget {
  final Function(TransactionFunctionDTO tappedItem) tappedItemCallback;
  late _IconicContextMenuViewState _iconicContextMenuViewState;

  IconicContextMenuView(this.tappedItemCallback, {super.key}) {
    _iconicContextMenuViewState = _IconicContextMenuViewState();
  }

  @override
  State<StatefulWidget> createState() => _iconicContextMenuViewState;

  refresh() {
    _iconicContextMenuViewState.refresh();
  }
}

class _IconicContextMenuViewState extends State<IconicContextMenuView> {

  var _execContextBL ;
  var _execContext ;
  var _masterDataBl;
  UserRoleContainerDTO? _userRoleContainerDTO;
  List<ManagementFormAccessContainerDTO> _filteredMangerRoleList = [];

  Future<bool> _isEnabledTask(String category, String taskType) async {
    if (taskType.toLowerCase() == "help") {
      return true;
    }
    if (_userRoleContainerDTO != null && _masterDataBl != null) {
      _filteredMangerRoleList = (_userRoleContainerDTO?.managementFormAccessContainerDTOList ?? [])
          .where((mangerDto) =>
              mangerDto.mainMenu.toLowerCase() == category.toLowerCase() &&
              mangerDto.formName.toLowerCase() == taskType.toLowerCase())
          .toList();
      if (_filteredMangerRoleList.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } else {
      _execContextBL = await ExecutionContextBuilder.build();
      _execContext = _execContextBL.getExecutionContext();
      _masterDataBl = await MasterDataBuilder.build(_execContext!);
      _userRoleContainerDTO = await _masterDataBl.getUserRoleById(_execContext.userRoleId ?? -1);
      _filteredMangerRoleList = (_userRoleContainerDTO?.managementFormAccessContainerDTOList ?? [])
          .where((mangerDto) =>
              mangerDto.mainMenu.toLowerCase() == category.toLowerCase() &&
              mangerDto.formName.toLowerCase() == taskType.toLowerCase())
          .toList();
      if (_filteredMangerRoleList.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    var isDarkTheme = (Theme.of(context).brightness == Brightness.dark);
    SizeConfig.init(context);
    return BlocBuilder<TransactionFunctionsCubit, TransactionFunctionsState>(
        builder: (context, TransactionFunctionsState transactionFunctionsState) {
      return Column(
        children: [
          Expanded(
            // flex: 10,
            child: Row(
              children: [
                if (transactionFunctionsState.iconicContextMenuFunctions != null)
                  for (var item in transactionFunctionsState.iconicContextMenuFunctions!)
                    Expanded(
                      child: FutureBuilder<bool>(
                        future: _isEnabledTask(item.category, item.taskTypeName),
                        builder: (context, snapshot) {
                          if(snapshot.hasData){
                            return  InkWell(
                                onTap:(snapshot.data??true)? () {
                                  widget.tappedItemCallback(item);
                                }:null,
                                child: Opacity(
                                    opacity: (snapshot.data ?? true) ? 1 : 0.4,
                                    child: Container(
                                      // margin: const EdgeInsets.symmetric(vertical: 5),
                                      color: transactionFunctionsState.isTransactionNonChargeable == true
                                          ? item.taskType == "NON CHARGEABLE"
                                              ? theme.secondaryColor
                                              : theme.transparentColor
                                          : theme.transparentColor,
                                      child: Image.asset(
                                        item.taskType == "NON CHARGEABLE"
                                            ? transactionFunctionsState.isTransactionNonChargeable == true
                                                ? isDarkTheme
                                                    ? "assets/ic_non_chargeable_1.png"
                                                    : "assets/ic_non_chargeable_light.png"
                                                : item.icon
                                            : item.icon,
                                        color: item.taskType == "HELP"
                                            ? isDarkTheme
                                                ? theme.secondaryColor
                                                : null
                                            : null,
                                        width: SizeConfig.getWidth(28),
                                        height: SizeConfig.getHeight(28),
                                      ),
                                    ),
                                  ));
                          } else {
                            return InkWell(
                                onTap: () {
                                  widget.tappedItemCallback(item);
                                },
                                child: Container(
                                    // margin: const EdgeInsets.symmetric(vertical: 5),
                                    color: transactionFunctionsState.isTransactionNonChargeable == true
                                        ? item.taskType == "NON CHARGEABLE"
                                            ? theme.secondaryColor
                                            : theme.transparentColor
                                        : theme.transparentColor,
                                    child: Image.asset(
                                      item.taskType == "NON CHARGEABLE"
                                          ? transactionFunctionsState.isTransactionNonChargeable == true
                                              ? isDarkTheme
                                                  ? "assets/ic_non_chargeable_1.png"
                                                  : "assets/ic_non_chargeable_light.png"
                                              : item.icon
                                          : item.icon,
                                      color: item.taskType == "HELP"
                                          ? isDarkTheme
                                              ? theme.secondaryColor
                                              : null
                                          : null,
                                      width: SizeConfig.getWidth(28),
                                      height: SizeConfig.getHeight(28),
                                    ),
                                  ));
                            }
                        }
                      ),
                    )
              ],
            ),
          ),
        ],
      );
    });
  }

  void refresh() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //executes after build is done
      setState(() {});
    });
  }
}
