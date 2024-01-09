import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static TextStyle seatTextStyle = GoogleFonts.robotoCondensed(
      textStyle: const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    color: Color.fromARGB(255, 255, 255, 255),
  ));

  static TextStyle normalTextStyle = GoogleFonts.robotoCondensed(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
        color: Color.fromARGB(255, 16, 18, 22),
      ));

  static TextStyle boldTextStyle2 = GoogleFonts.robotoCondensed(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
        color: Color.fromARGB(255, 16, 18, 22),
      ));

  static TextStyle lineText = GoogleFonts.robotoCondensed(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14.0,
        color: Colors.black,
      ));

  static TextStyle secondaryButtonTextStyleLarge = const TextStyle(
    fontFamily: 'RobotoCondensed',
    color: Color(0xFF101216),
    fontSize: 19.0,
    fontWeight: FontWeight.w700,
  );

  static TextStyle primaryButtonTextStyleLarge = const TextStyle(
    fontFamily: 'RobotoCondensed',
    color: Colors.white,
    fontSize: 19.0,
    fontWeight: FontWeight.w700,
  );

}
