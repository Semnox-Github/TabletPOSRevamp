import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';

class AppColors{
  static late SemnoxTheme _theme;

  static void init(BuildContext context) {
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
  }

  static  Color backGroundGreyLightColor1 = _theme.button1BG1??const Color(0xFFF0F2F8);
  static  Color backGroundBlackColor1 = _theme.button2BG1 ??const Color.fromARGB(255, 61, 61, 61);
  static  Color greyColor1 = _theme.light2??const Color(0xFFD1D3D8);
  static  Color textPrimaryBlackColor1 =_theme.darkTextColor??const Color(0xFF101216);
  static  Color primaryBlack = _theme.darkTextColor??const Color(0xFF101216);
  static const Color black = Colors.black ;
  static  Color notificationBGLightBlueColor =_theme.footerBG4??const Color(0xFFB4ECFB);
  static  Color notificationBGRedColor =_theme.footerBG3??const Color(0xFFFC5050);
  static  Color notoficationBGLightYellowColor =_theme.footerBG5?? Color(0xFFFEE891);
  static  Color white = _theme.primaryColor ?? const Color(0xFFFFFFFF);
  static Color transparentColor = Colors.transparent;
  static Color borderGrey = _theme.dialogFooterInnerShadow ?? const Color(0xffD1D3D8);

}