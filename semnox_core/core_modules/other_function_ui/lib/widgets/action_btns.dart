import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:other_function_ui/widgets/text_style.dart';

class OfActionBtns extends StatelessWidget {
  final String text;
  final Function()? onClick;
  final Color btnColor, textColor;
  final TextStyle? actionButtonTextStyle;
  const OfActionBtns(
      {Key? key,
      this.onClick,
      this.actionButtonTextStyle,
      required this.text,
      required this.btnColor,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Padding(
      padding:  EdgeInsets.all(SizeConfig.getSize(8)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(SizeConfig.getWidth(4)),
          tapTargetSize:
          MaterialTapTargetSize.shrinkWrap,
          maximumSize: Size(SizeConfig.getSize(130),SizeConfig.getSize(75)),
          minimumSize:  Size(SizeConfig.getSize(130),SizeConfig.getSize(75)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                SizeConfig.getSize(8)), // <-- Radius
          ),
          backgroundColor: btnColor,
        ),
        onPressed: onClick,
        child: Text(
          text??'',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style:   actionButtonTextStyle?.copyWith(fontSize: SizeConfig.getFontSize(20)) ??
              KTextStyle.actionBtnTextStyle(textColor).copyWith(fontSize: SizeConfig.getFontSize(20)),
        ),
      ),
    );
  }
}
