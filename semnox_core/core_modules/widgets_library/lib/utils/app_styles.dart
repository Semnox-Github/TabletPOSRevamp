import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';

class AppStyle {

  static late SemnoxTheme _theme;

  static void init(BuildContext context) {
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
  }
  static TextStyle numPadStyle = _theme.headingLight4!;

  static TextStyle kB7R16 = _theme.heading4!;
}
