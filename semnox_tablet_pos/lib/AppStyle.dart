import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:semnox_tablet_pos/AppColors.dart';

class AppStyle {
  static TextStyle titleTextStyle = GoogleFonts.robotoCondensed(
    color: Colors.white,
    fontSize: 32.0,
    fontWeight: FontWeight.w700,
  );
  static TextStyle titleTextDashboard = GoogleFonts.robotoCondensed(
    color: Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
  );
  static TextStyle dashBoardTitleStyle = const TextStyle(
    color: Colors.white,
    fontSize: 19,
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.w700,
  );
  static TextStyle dashBoardTitleVersionNumberStyle = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.w700,
  );

  static TextStyle titleBoldTextStyle = GoogleFonts.robotoCondensed(
      color: Colors.black, fontSize: 32.0, fontWeight: FontWeight.w700);

  static TextStyle title2TextStyle = GoogleFonts.robotoCondensed(
    color: Colors.black,
    fontSize: 32.0,
    fontWeight: FontWeight.w400,
  );

  static TextStyle normalWhiteTextStyle = GoogleFonts.robotoCondensed(
      color: Colors.white, fontSize: 26.0, fontWeight: FontWeight.w400);

  static TextStyle normalTextStyle = GoogleFonts.robotoCondensed(
    color: Colors.black,
    fontSize: 26.0,
    fontWeight: FontWeight.w400,
  );

  static TextStyle normalBoldTextStyle = GoogleFonts.robotoCondensed(
      color: Colors.black, fontSize: 26.0, fontWeight: FontWeight.w700);

  static TextStyle hintWhiteTextStyle = GoogleFonts.robotoCondensed(
      color: Colors.white, fontSize: 19.0, fontWeight: FontWeight.w700);

  static TextStyle hintTextStyle = GoogleFonts.robotoCondensed(
      color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w700);

  static TextStyle formTextStyle = GoogleFonts.robotoCondensed(
    color: Colors.black,
    fontSize: 19.0,
    fontWeight: FontWeight.w400,
  );

  static TextStyle loadingTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static TextStyle titleStyle = const TextStyle(
    color: Colors.black,
    fontSize: 19,
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.w400,
  );

  static TextStyle titleStyle2 = const TextStyle(
    color: Colors.black,
    fontSize: 19,
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.normal,
  );

  static TextStyle titleStyleBold = const TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleWhiteStyleBold = const TextStyle(
    color: Colors.white,
    fontSize: 19,
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.bold,
  );

  static TextStyle textDisabled = const TextStyle(
    color: Colors.black26,
    fontSize: 19,
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.bold,
  );

  static TextStyle dashBoardtitleStyleBold = const TextStyle(
    color: AppColors.primaryBlack,
    fontSize: 14,
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.bold,
  );

  static TextStyle dashBoardtitleStyleBoldWhite = const TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.bold,
  );
  static TextStyle dashBoardButtonTitle = const TextStyle(
    color: AppColors.primaryBlack,
    fontSize: 13,
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.normal,
  );

  static TextStyle appBarTitleText = const TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontStyle: FontStyle.normal,
      fontFamily: 'RobotoCondensed',
      fontWeight: FontWeight.w700
  );

  static TextStyle heading1 = const TextStyle(
      color: AppColors.primaryBlack,
      fontSize: 20.0,
      fontStyle: FontStyle.normal,
      fontFamily: 'RobotoCondensed',
      fontWeight: FontWeight.w700
  );
  static TextStyle title1 = const TextStyle(
      color: AppColors.primaryBlack,
      fontSize:14.0,
      fontStyle: FontStyle.normal,
      fontFamily: 'RobotoCondensed',
      fontWeight: FontWeight.w400
  );


  static TextStyle salesScreenTitleText = GoogleFonts.robotoCondensed(
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
      ));

  static TextStyle lineText = const TextStyle(
      color: AppColors.primaryBlack,
      fontSize:14.0,
      fontStyle: FontStyle.normal,
      fontFamily: 'RobotoCondensed',
      fontWeight: FontWeight.w500
  );
}

final tsS12W500C00 = GoogleFonts.robotoCondensed(color: colorBlack, fontSize: 12, fontWeight: FontWeight.w500, decoration: TextDecoration.none);
final tsS12W700FF = GoogleFonts.robotoCondensed(color: colorWhite, fontSize: 12, fontWeight: FontWeight.w700);
final tsS14W400FF = GoogleFonts.robotoCondensed(color: colorWhite, fontSize: 14, fontWeight: FontWeight.w400);
final tsS14W40016 = GoogleFonts.robotoCondensed(textStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: colorBlack16,));
final tsS14W50016 = GoogleFonts.robotoCondensed(color: colorBlack16, fontSize: 14, fontWeight: FontWeight.w500);
final tsS14W70016 = GoogleFonts.robotoCondensed(color: colorBlack16, fontSize: 14, fontWeight: FontWeight.w700);
final tsS14W700FF = GoogleFonts.robotoCondensed(color: colorWhite, fontSize: 14, fontWeight: FontWeight.w700);
final tsS16W60016 = GoogleFonts.robotoCondensed(color: colorBlack16, fontSize: 16, fontWeight: FontWeight.w600);
final tsS16W50016 = GoogleFonts.robotoCondensed(color: colorBlack16, fontSize: 16, fontWeight: FontWeight.w500);
final tsS16W500FF = GoogleFonts.robotoCondensed(color: colorWhite, fontSize: 16, fontWeight: FontWeight.w500);
final tsS16W70016 = GoogleFonts.robotoCondensed(color: colorBlack16, fontSize: 16, fontWeight: FontWeight.w700);
final tsS16W700FF = GoogleFonts.robotoCondensed(color: colorWhite, fontSize: 16, fontWeight: FontWeight.w700);
final tsS18W50016 = GoogleFonts.robotoCondensed(color: colorBlack16, fontSize: 18, fontWeight: FontWeight.w500);
final tsS20W700FF = GoogleFonts.robotoCondensed(color: colorWhite, fontSize: 20, fontWeight: FontWeight.w700);
final tsS20W70016 = GoogleFonts.robotoCondensed(color: colorBlack16, fontSize: 20, fontWeight: FontWeight.w700);
final tsS22W700FF = GoogleFonts.robotoCondensed(color: colorWhite, fontSize: 22, fontWeight: FontWeight.w700);
final tsS22W70016 = GoogleFonts.robotoCondensed(color: colorBlack16, fontSize: 22, fontWeight: FontWeight.w700);
final tsS24W70016 = GoogleFonts.robotoCondensed(color: colorBlack16, fontSize: 24, fontWeight: FontWeight.w700);
final tsS24W700FF = GoogleFonts.robotoCondensed(color: colorWhite, fontSize: 24, fontWeight: FontWeight.w700);
final tsS26W700FF = GoogleFonts.robotoCondensed(textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 26.0, color: Color.fromARGB(255, 16, 18, 22),));
