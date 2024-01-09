import 'package:customer_ui/utils/AppColors.dart';
import 'package:customer_ui/utils/AppStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class CustomerDialogButton extends StatelessWidget{

  VoidCallback? onPress;
  String text;
  bool? background = true;

  CustomerDialogButton({super.key, this.onPress,
    required this.text,this.background});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        padding:  const EdgeInsets.all(8.0),
        backgroundColor: (background ?? true) ? theme.button2BG1 : theme.button1BG1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      ),
      child: Text(text, style: (background ?? true) ? AppStyle.customerTextBoldWhite.copyWith(fontSize: SizeConfig.getFontSize(16)) : AppStyle.customerTextBold.copyWith(color: theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),),);
  }

}