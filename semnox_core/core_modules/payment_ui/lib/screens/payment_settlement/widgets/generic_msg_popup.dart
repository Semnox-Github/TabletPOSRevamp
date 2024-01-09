import 'package:flutter/material.dart';
import 'package:payment_ui/utils/colors.dart';
import 'package:payment_ui/utils/common_widgets.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:payment_ui/utils/styles.dart';
import 'package:messages_data/builder.dart';

class GenericMsgPopup extends StatelessWidget {
  final VoidCallback onTapOk;
  final String title;
  final String msg;

  const GenericMsgPopup({
    Key? key,
    required this.onTapOk,
    required this.title,
    required this.msg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Container(
      width: MediaQuery.of(context).size.width * 0.70,
      decoration: BoxDecoration(
          color: theme.backGroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: SizeConfig.getHeight(24)),
          Text(title.toUpperCase(), style: theme.heading5?.copyWith(fontSize: 26) ?? tsS26W70016),
          SizedBox(height: SizeConfig.getHeight(24)),
          const Divider(),
          SizedBox(height: SizeConfig.getHeight(16)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.getSize(12)),
              child: Text(msg, style: theme.heading5?.copyWith(fontSize: 19, fontWeight: FontWeight.w500) ?? tsS19W50016, textAlign: TextAlign.center,)),
          SizedBox(height: SizeConfig.getHeight(16)),
          const Divider(),
          SizedBox(height: SizeConfig.getHeight(16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              containerButton(
                  text: MessagesProvider.get('OK').toUpperCase(),
                  textStyle: theme.heading5?.copyWith(fontSize: 20) ?? tsS20W70016,
                  buttonColor: theme.footerBG1 ?? colorBlueF8,
                  height: SizeConfig.getHeight(60),
                  width: SizeConfig.getWidth(150),
                  onTapped: () {
                    Navigator.pop(context);
                    onTapOk();
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
