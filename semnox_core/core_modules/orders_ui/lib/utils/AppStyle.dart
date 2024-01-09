import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orders_ui/utils/AppColors.dart';

class AppStyle{
  static TextStyle titleTextStyle = GoogleFonts.robotoCondensed(
      color: Colors.white,
      fontSize: 32.0,
      fontWeight: FontWeight.w700
  );

  static TextStyle title2TextStyle = GoogleFonts.robotoCondensed(
      color: Colors.black, fontSize: 32.0,
      fontWeight: FontWeight.w400
  );

  static TextStyle titleBoldTextStyle = GoogleFonts.robotoCondensed(
      color: Colors.black,
      fontSize: 32.0,
      fontWeight: FontWeight.w700
  );

  static TextStyle normalWhiteTextStyle = GoogleFonts.robotoCondensed(
      color: Colors.white,
      fontSize: 26.0,
      fontWeight: FontWeight.w400
  );

  static TextStyle normalTextStyle = GoogleFonts.robotoCondensed(
      color: Colors.black,
      fontSize: 26.0,
      fontWeight: FontWeight.w400
  );

  static TextStyle normalBoldTextStyle = GoogleFonts.robotoCondensed(
      color: Colors.black,
      fontSize: 26.0,
      fontWeight: FontWeight.w700
  );

  static TextStyle hintWhiteTextStyle = GoogleFonts.robotoCondensed(
      color: Colors.white,
      fontSize: 19.0,
      fontWeight: FontWeight.w700
  );

  static TextStyle dropDownTextStyle = GoogleFonts.robotoCondensed(
      color: Colors.black,
      fontSize: 14.0,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400
  );

  static TextStyle hintTextStyle = GoogleFonts.robotoCondensed(
      color: Colors.black,
      fontSize: 19.0,
      fontWeight: FontWeight.w700
  );

  static TextStyle formTextStyle = GoogleFonts.robotoCondensed(
      color: Colors.black,
      fontSize: 19.0,
      fontWeight: FontWeight.w400);

  static TextStyle loadingTextStyle = const TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none
  );

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
    fontSize: 19,
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.bold,
  );

  static TextStyle alertWhiteText = const TextStyle(
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

  static TextStyle customerTitleText = const TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontStyle: FontStyle.normal,
      fontFamily: 'RobotoCondensed',
      fontWeight: FontWeight.w700
  );

  static TextStyle customerTitleBlackText = const TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontStyle: FontStyle.normal,
      fontFamily: 'RobotoCondensed',
      fontWeight: FontWeight.w700
  );

  static TextStyle customerTextBold = GoogleFonts.robotoCondensed(
      color: Colors.black,
      fontSize: 16.0,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700
  );


  static TextStyle customerTextLarge = GoogleFonts.robotoCondensed(
      color: Colors.black,
      fontSize: 16.0,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500
  );

  static TextStyle customerTextBoldWhite = GoogleFonts.robotoCondensed(
      color: Colors.white,
      fontSize: 16.0,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700
  );

  static TextStyle customerDisableText = GoogleFonts.robotoCondensed(
      color: AppColors.disabledTextColor,
      fontSize: 16.0,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700
  );

  static TextStyle customerText =  GoogleFonts.robotoCondensed(
      color: Colors.black,
      fontSize: 14.0,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500
  );

  static TextStyle dateText =  GoogleFonts.robotoCondensed(
      color: Colors.black,
      fontSize: 11.0,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500
  );

  static TextStyle customerTextSmall =  GoogleFonts.robotoCondensed(
      color: Colors.black,
      fontSize: 8.0,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500
  );

  static TextStyle customerTextDisabled =  GoogleFonts.robotoCondensed(
      color: Colors.grey,
      fontSize: 14.0,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500
  );

  static TextStyle customerTextWhite =  GoogleFonts.robotoCondensed(
      color: Colors.white,
      fontSize: 14.0,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500
  );


  static TextStyle customerButtonText =  GoogleFonts.robotoCondensed(
      color: Colors.white,
      fontSize: 14.0,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700
  );

  static TextStyle pageItemTextWhite =  GoogleFonts.robotoCondensed(
      color: Colors.white,
      fontSize: 12.0,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400
  );

  static TextStyle paginationTextBold =  GoogleFonts.robotoCondensed(
      color: Colors.black,
      fontSize: 14.0,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700
  );

  static TextStyle orderButtonTextBoldWhite = GoogleFonts.robotoCondensed(
      color: Colors.white,
      fontSize: 12.0,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700
  );

  static TextStyle transactionItemText =  GoogleFonts.robotoCondensed(
      color: Colors.black,
      fontSize: 12.0,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500
  );
}