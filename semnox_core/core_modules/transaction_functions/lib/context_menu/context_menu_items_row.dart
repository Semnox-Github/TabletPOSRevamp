import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/user_role_container/management_form_access_container_dto.dart';
import 'package:master_data/models/user_role_container/user_role_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_functions/context_menu/right_scroll_button.dart';
import 'package:widgets_library/utils/size_config.dart';
import '../transaction_function_dto.dart';
import 'left_scroll_button.dart';

class ContextMenuItemsRow extends StatelessWidget {
  const ContextMenuItemsRow(
      {Key? key,
      required this.items,
      required this.shouldShowLeftScroll,
      required this.shouldShowRightScroll,
      required this.onLeftScrollTappedCallback,
      required this.onItemTappedCallback,
      required this.onRightScrollTappedCallback})
      : super(key: key);

  final List<TransactionFunctionDTO>? items;
  final bool shouldShowLeftScroll;
  final bool shouldShowRightScroll;
  final VoidCallback onLeftScrollTappedCallback;
  final Function(TransactionFunctionDTO) onItemTappedCallback;
  final VoidCallback onRightScrollTappedCallback;

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    var execContextBL ;
    var execContext ;
    var masterDataBl;
    UserRoleContainerDTO? userRoleContainerDTO;
    List<ManagementFormAccessContainerDTO> filteredMangerRoleList = [];
    Future<bool> isEnabledTask(String category, String taskType) async {
      if (userRoleContainerDTO != null && masterDataBl != null) {
        filteredMangerRoleList = (userRoleContainerDTO?.managementFormAccessContainerDTOList ?? [])
            .where((mangerDto) =>
                mangerDto.mainMenu.toLowerCase() == category.toLowerCase() &&
                mangerDto.formName.toLowerCase() == taskType.toLowerCase())
            .toList();
        if (filteredMangerRoleList.isNotEmpty) {
          return true;
        } else {
          return false;
        }
      } else {
        execContextBL = await ExecutionContextBuilder.build();
        execContext = execContextBL.getExecutionContext();
        masterDataBl = await MasterDataBuilder.build(execContext!);
        userRoleContainerDTO = await masterDataBl.getUserRoleById(execContext.userRoleId ?? -1);
        filteredMangerRoleList = (userRoleContainerDTO?.managementFormAccessContainerDTOList ?? [])
            .where((mangerDto) =>
                mangerDto.mainMenu.toLowerCase() == category.toLowerCase() &&
                mangerDto.formName.toLowerCase() == taskType.toLowerCase())
            .toList();
        if (filteredMangerRoleList.isNotEmpty) {
          return true;
        } else {
          return false;
        }
      }
    }

    return Row(
      children: [
        shouldShowLeftScroll
            ? LeftScrollButton(
                onPressed: () {
                  onLeftScrollTappedCallback();
                },
              )
            : SizedBox(width: SizeConfig.getWidth(0),),
        Expanded(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, position) {
              return FutureBuilder<bool>(
                  future: isEnabledTask(items![position].category, items![position].taskTypeName),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GestureDetector(
                        onTap: (snapshot.data ?? true)
                            ? () {
                                onItemTappedCallback(items![position]);
                              }
                            : null,
                        child: Opacity(
                          opacity: (snapshot.data ?? true) ? 1 : .4,
                          child: Container(
                            padding: EdgeInsets.all(SizeConfig.getSize(2)),
                            width: SizeConfig.getWidth(120),
                            height: SizeConfig.getHeight(42),
                            decoration: BoxDecoration(
                              color: theme.secondaryColor,
                              borderRadius: BorderRadius.circular(SizeConfig.getSize(4.5)),
                            ),
                            margin: EdgeInsets.only(
                              left: SizeConfig.getWidth(2),
                              right: SizeConfig.getWidth(2),
                            ),
                            child: Center(
                              child: Text(
                                MessagesProvider.get(items?[position].taskTypeName ?? "").toUpperCase(),
                                textAlign: TextAlign.center,
                                style: theme.descriptionLight1?.copyWith(color: theme.light1, fontSize: SizeConfig.getFontSize(14)),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textScaleFactor: 1.0,
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          onItemTappedCallback(items![position]);
                        },
                        child: Opacity(
                          opacity: 1,
                          child: Container(
                            padding: EdgeInsets.all(SizeConfig.getSize(2)),
                            width: SizeConfig.getWidth(120),
                            height: SizeConfig.getHeight(42),
                            decoration: BoxDecoration(
                              color: theme.sideNavListBGSelectedState,
                              borderRadius: BorderRadius.circular(SizeConfig.getSize(4.5)),
                            ),
                            margin: EdgeInsets.only(
                              left: SizeConfig.getWidth(2),
                              right: SizeConfig.getWidth(2),
                            ),
                            child: Center(
                              child: Text(
                                MessagesProvider.get(items?[position].taskTypeName ?? "").toUpperCase(),
                                textAlign: TextAlign.center,
                                style: theme.descriptionLight1?.copyWith(color: theme.light1, fontSize: SizeConfig.getFontSize(14)),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textScaleFactor: 1.0,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  });
            },
            itemCount: items?.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
        shouldShowRightScroll
            ? RightScrollButton(
                onPressed: () {
                  onRightScrollTappedCallback();
                },
              )
            : SizedBox(width: SizeConfig.getWidth(0),),
      ],
    );
  }
}
