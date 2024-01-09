library iconic_context_menu_help_ui;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_functions/iconic_context_menu/help/theme_item.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'help_dialog_data_theme_provider.dart';
import 'package:product_config_ui/widgets/secondaryLargeButton.dart';

class IconicContextMenuHelpDialog extends StatefulWidget {
  const IconicContextMenuHelpDialog({super.key});

  @override
  State<StatefulWidget> createState() => _IconicContextMenuHelpDialogState();
}

class _IconicContextMenuHelpDialogState extends State<IconicContextMenuHelpDialog> {
  _IconicContextMenuHelpDialogState();

  SemnoxTheme? theme;
  var autoSizeTextGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    HelpDialogDataThemeProvider.getItemsList(Theme.of(context).brightness == Brightness.dark);

    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        backgroundColor: theme?.backGroundColor,
        child: SizedBox(
          height: SizeConfig.getHeight(410),
          width: SizeConfig.isBigDevice() ? SizeConfig.getWidth(492) : SizeConfig.getWidth(405),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: SizeConfig.getHeight(90),
                child: Center(
                  child: Text(
                    MessagesProvider.get("HELP"),
                    style: theme?.heading2?.copyWith(fontSize: SizeConfig.getFontSize(28),),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Divider(
                thickness: SizeConfig.getSize(1),
                color: theme?.dialogFooterInnerShadow,
                height: SizeConfig.getHeight(1),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            itemView(HelpDialogDataThemeProvider.getItemData("SEARCH"), theme!),
                            itemView(HelpDialogDataThemeProvider.getItemData("REVERSE"), theme!),
                            itemView(HelpDialogDataThemeProvider.getItemData("NON CHARGEABLE"), theme!),
                            itemView(HelpDialogDataThemeProvider.getItemData("RESET"), theme!),
                            itemView(HelpDialogDataThemeProvider.getItemData("SET SEAT"), theme!),
                            itemView(HelpDialogDataThemeProvider.getItemData("SEARCH CLOSE"), theme!),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(left: SizeConfig.getWidth(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            itemView(HelpDialogDataThemeProvider.getItemData("CANCEL"), theme!),
                            itemView(HelpDialogDataThemeProvider.getItemData("PROFILE"), theme!),
                            itemView(HelpDialogDataThemeProvider.getItemData("TRANSACTION DATE"), theme!),
                            itemView(HelpDialogDataThemeProvider.getItemData("SET COURSE"), theme!),
                            itemView(HelpDialogDataThemeProvider.getItemData("REPEAT"), theme!),
                            itemView(HelpDialogDataThemeProvider.getItemData("PRINT"), theme!),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: SizeConfig.getSize(1),
                color: theme?.dialogFooterInnerShadow,
                height: SizeConfig.getHeight(1),
              ),
              SizedBox(
                height: SizeConfig.getHeight(90),
                child: Align(
                  alignment: Alignment.center,
                  child: SecondaryLargeButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: MessagesProvider.get("CLOSE"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget itemView(ThemeItem? menuItem, SemnoxTheme theme) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.getSize(5)),
      child: Row(
        children: [
          Padding(padding: EdgeInsets.only(left: SizeConfig.getWidth(5))),
          Image.asset(
            menuItem!.icon,
            width: SizeConfig.getWidth(20),
            height: SizeConfig.getHeight(20),
          ),
          Padding(padding: EdgeInsets.only(left: SizeConfig.getWidth(5))),
          Text(
            MessagesProvider.get(menuItem.title),
            style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(18)),
          ),
        ],
      ),
    );
  }
}
