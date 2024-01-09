import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';

class KColor {
  static late SemnoxTheme theme;
  static void init(BuildContext context) {
    theme = Theme.of(context).extension<SemnoxTheme>()!;
  }

  static const Color primaryBtnColor = Color.fromARGB(255, 239, 241, 250);
  static Color borderGrey =
      theme.dialogFooterInnerShadow ?? const Color(0xffD1D3D8);
  static Color colorBlack = theme.secondaryColor ?? Colors.black;
}
