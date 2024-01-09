import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:other_function_ui/widgets/text_style.dart';

import 'package:widgets_library/utils/size_config.dart';

class RedeemCard extends StatelessWidget {
  final String text;
  final Color? color;
  final Function()? onTap;
  final Color textColor;
  const RedeemCard(
      {Key? key,
      required this.text,
      this.color,
      this.onTap,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.15,
        height:SizeConfig.isBigDevice()? SizeConfig.getSize(70):SizeConfig.getSize(80),
        child: Card(
          shadowColor: CupertinoColors.label,
          color: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  text,
                  style: SizeConfig.isBigDevice()?KTextStyle.actionBtnTextStyle(textColor).copyWith( fontSize: SizeConfig.getFontSize(22), ):KTextStyle.actionBtnTextStyle(textColor),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
