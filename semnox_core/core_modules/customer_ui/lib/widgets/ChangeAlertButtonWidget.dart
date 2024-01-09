import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';

class ChangeButtonWidget extends StatelessWidget{

  VoidCallback? onPress;
  String buttonText;
  Color? buttonBackground;
  TextStyle? buttonTextStyle;

  ChangeButtonWidget({
    this.onPress,
    required this.buttonText,
    required this.buttonBackground,
    this.buttonTextStyle});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Expanded(
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          primary: buttonBackground,
          shadowColor: theme.dividerColor,
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        child: Text(buttonText, textAlign: TextAlign.left,style: buttonTextStyle,overflow: TextOverflow.ellipsis,
        maxLines: 2,),),
    );
  }

}
