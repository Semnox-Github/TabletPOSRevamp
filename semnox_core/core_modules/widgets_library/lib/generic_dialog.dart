import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:messages_data/builder.dart';

class GenericDialog extends StatelessWidget {
  final VoidCallback onTapYes;
  final VoidCallback onTapNo;
  final VoidCallback? onTapOk;
  final String title;
  final String msg;
  final bool isSingleBtnMode;
  final String? positiveBtnMsg;
  final String? negativeBtnMsg;

  const GenericDialog({
    Key? key,
    required this.onTapYes,
    required this.onTapNo,
    this.onTapOk,
    required this.title,
    required this.msg,
    this.isSingleBtnMode = false,
    this.positiveBtnMsg,
    this.negativeBtnMsg
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(260)),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Container(
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
              Text(title.toUpperCase(), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(30))),
              SizedBox(height: SizeConfig.getHeight(24)),
              const Divider(),
              SizedBox(height: SizeConfig.getHeight(16)),
              Text(msg, style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(26), fontWeight: FontWeight.w500)),
              SizedBox(height: SizeConfig.getHeight(16)),
              const Divider(),
              SizedBox(height: SizeConfig.getHeight(16)),
              isSingleBtnMode ?
              button(
                  text: positiveBtnMsg ?? MessagesProvider.get('OK').toUpperCase(),
                  textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(24)) ,
                  buttonColor: theme.footerBG1,
                  borderColor: theme.scrollDisabled,
                  height: SizeConfig.getHeight(60),
                  width: SizeConfig.getWidth(150),
                  onTapped: () {
                    if(onTapOk != null) {
                      onTapOk!();
                    }
                    Navigator.pop(context);
                  }
              ) :
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(
                      text: negativeBtnMsg ?? MessagesProvider.get('No').toUpperCase(),
                      textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(24)) ,
                      buttonColor: theme.footerBG1,
                      borderColor: theme.scrollDisabled,
                      height: SizeConfig.getHeight(60),
                      width: negativeBtnMsg != null ? SizeConfig.getWidth(160) : SizeConfig.getWidth(150),
                      onTapped: () {
                        Navigator.pop(context);
                        onTapNo();
                      }
                  ),
                  const SizedBox(width: 16),
                  button(
                      text: positiveBtnMsg ?? MessagesProvider.get('Yes').toUpperCase(),
                      textStyle: theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(24), color: Colors.white) ,
                      buttonColor: theme.button2InnerShadow1,
                      borderColor: theme.scrollDisabled,
                      height: SizeConfig.getHeight(60),
                      width: positiveBtnMsg != null ? SizeConfig.getWidth(160) : SizeConfig.getWidth(150),
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
        ),
      ),
    );
  }
}


Widget button({
  required String text,
  TextStyle? textStyle,
  required VoidCallback onTapped,
  Color? buttonColor,
  Color? borderColor,
  double cornerRadius = 8,
  double height = 50,
  double width = 300
}) {
  return InkWell(
    onTap: () {
      onTapped();
    },
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        border: Border.all(color: borderColor ?? Colors.grey),
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      child: Center(
        child: Text(text, style: textStyle),
      ),
    ),
  );
}