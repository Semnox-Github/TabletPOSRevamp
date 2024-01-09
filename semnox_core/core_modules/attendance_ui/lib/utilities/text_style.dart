import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themes_library/themes_library.dart';

class KTextStyle {
  static late SemnoxTheme _theme;
  static void init(BuildContext context) {
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
  }

  static TextStyle titleTextStyle = GoogleFonts.robotoCondensed(
    color: Colors.white,
    fontSize: 32.0,
    fontWeight: FontWeight.w700,
  );

  static TextStyle breadCrumbTitle =
      GoogleFonts.robotoCondensed(fontWeight: FontWeight.bold, fontSize: 16);

  static TextStyle actionBtnTextStyle(Color textColor) =>
      GoogleFonts.robotoCondensed(
          fontWeight: FontWeight.bold, fontSize: 12, color: textColor);

  static TextStyle regularBoldTextStyle =
      GoogleFonts.robotoCondensed(fontWeight: FontWeight.w700, fontSize: 16);
  static TextStyle backBtnText = GoogleFonts.robotoCondensed(
      fontWeight: FontWeight.w700, fontSize: 20, color: Colors.white);

  static TextStyle bonusHintText =
      GoogleFonts.robotoCondensed(fontWeight: FontWeight.w700, fontSize: 24);
  static TextStyle smallBlackText =
      GoogleFonts.robotoCondensed(fontWeight: FontWeight.w700, fontSize: 14);
  static TextStyle largeRegularText = _theme.subtitle1!;
}
