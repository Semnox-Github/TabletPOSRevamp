import 'package:flutter/material.dart';
import 'package:payment_ui/utils/colors.dart';
import 'package:payment_ui/utils/common_widgets.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:payment_ui/utils/styles.dart';
import 'package:messages_data/builder.dart';

class TipPopup extends StatelessWidget {
  final VoidCallback onTapYes;
  final VoidCallback onTapNo;

  const TipPopup({
    Key? key,
    required this.onTapYes,
    required this.onTapNo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Container(
      width: MediaQuery.of(context).size.width * 0.60,
      decoration: BoxDecoration(
          color: theme.backGroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: SizeConfig.getHeight(24)),
          Text(MessagesProvider.get('Tip').toUpperCase(), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(30)) ?? tsS26W70016),
          SizedBox(height: SizeConfig.getHeight(24)),
          const Divider(),
          SizedBox(height: SizeConfig.getHeight(16)),
          Text(MessagesProvider.get('Do you want to add tip?'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(26), fontWeight: FontWeight.w500) ?? tsS19W70016),
          SizedBox(height: SizeConfig.getHeight(16)),
          const Divider(),
          SizedBox(height: SizeConfig.getHeight(16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              containerButton(
                  text: MessagesProvider.get('No').toUpperCase(),
                  textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(24)) ?? tsS20W70016,
                  buttonColor: theme.footerBG1 ?? colorBlueF8,
                  height: SizeConfig.getHeight(60),
                  width: SizeConfig.getWidth(150),
                  onTapped: () {
                    Navigator.pop(context);
                    onTapNo();
                  }
              ),
              const SizedBox(width: 16),
              containerButton(
                  text: MessagesProvider.get('Yes').toUpperCase(),
                  textStyle: theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(24), color: Colors.white) ?? tsS20W700FF,
                  buttonColor: theme.button2InnerShadow1 ?? colorBlack3D,
                  height: SizeConfig.getHeight(60),
                  width: SizeConfig.getWidth(150),
                  onTapped: () {
                    Navigator.pop(context);
                    onTapYes();
                  }
              ),
            ],
          ),
          SizedBox(height: SizeConfig.getHeight(16)),
        ],
      ),
    );
  }
}
