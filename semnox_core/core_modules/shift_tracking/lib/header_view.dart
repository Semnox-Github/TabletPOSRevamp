import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:product_config_ui/widgets/primaryMediumButton.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class HeaderView extends StatefulWidget {
  const HeaderView({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _HeaderViewState();
}

class _HeaderViewState extends State<HeaderView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Container(
        margin: EdgeInsets.only(
            right: SizeConfig.isBigDevice() ? SizeConfig.getWidth(33.0) : SizeConfig.getWidth(55.0),
            bottom: SizeConfig.getWidth(7)),
        padding: EdgeInsets.all(SizeConfig.getWidth(5)),
        decoration: BoxDecoration(
            color: theme.tableRow1,
            borderRadius: BorderRadius.circular(SizeConfig.getSize(4))),
        child: IntrinsicWidth(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(5)),
                  child: Text(
                    MessagesProvider.get("Type"),
                    style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(20)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(5)),
                  child: Text(
                    MessagesProvider.get("Cashier"),
                    style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(20)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(5)),
                  child: Text(
                    MessagesProvider.get("System"),
                    style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(20)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(5)),
                  child: Text(
                    MessagesProvider.get("Net Shift"),
                    style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(20)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                  child: Container(),
              ),
            ],
          ),
        ));
  }
}
