import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';

class KColor {
  static late SemnoxTheme theme;

  static void init(BuildContext context) {
    theme = Theme.of(context).extension<SemnoxTheme>()!;
  }

  static Color primaryBtnColor = theme.button1BG1!; //Color(0xFFEEF0F8);
  static Color backGroundGreyLightColor1 =
      theme.cardStateUnselectedLight ?? const Color(0xFFF0F2F8);
  static Color borderGrey =
      theme.dialogFooterInnerShadow ?? const Color(0xffD1D3D8);
  static Color primaryBlack = theme.darkTextColor!;
  static const Color textFieldHintColor = Color(0xFF9A9A9A);
  static Color notificationBGLightBlueColor = theme.footerBG4!;
  static Color notificationBGRedColor = theme.footerBG3!;
  static Color notoficationBGLightYellowColor =
      theme.footerBG5 ?? const Color(0xFFFEE891);
  static Color darkGreyColor1 = theme.button2BG1!;
  static Color white = theme.primaryColor!;
  static const Color disabledTextColor = Color(0xFFD3D3DB);
  static const Color lightGrey1 = Color(0xFFDDDDDD);
  static const Color darkGrey1 = Color(0xFFEFF1F7);
  static const Color transparentColor = Colors.transparent;
}
