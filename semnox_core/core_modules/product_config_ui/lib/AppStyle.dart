import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';

class AppStyle {
  static late SemnoxTheme _theme;

  static void init(BuildContext context) {
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
  }
  static TextStyle remarkTextTitle = _theme.heading3!;
  static TextStyle remarkTextBoxTitle = _theme.title1!;

  static TextStyle seatdropdownText = _theme.title3!;
  static TextStyle seatdialogSmallText = _theme.subtitle1!;
  static TextStyle dialogCancelButtonTextStyle = _theme.heading5!;
  static TextStyle dialogokButtonTextStyle = _theme.headingLight5!;

  static TextStyle appBarTitleTextStyle = _theme.headingLight4!;

  static TextStyle subTitle1CBlack =  _theme.description1!;

  static TextStyle subTitle1CWhite =  _theme.descriptionLight1!;
  static TextStyle changeStaffHeading = _theme.heading2!;
  static TextStyle changeStaffSubText = _theme.subtitle2!;
  static TextStyle changeStaffSubHeading = _theme.heading6!;
  static TextStyle changeStaffSubHeading2 = _theme.subtitle3!;

  static TextStyle dialogHeading1TextStyle = _theme.heading3!;

  static TextStyle dialogHeading2TextStyle = _theme.heading6!;

  static TextStyle textFieldHintTextStyle = _theme.textFieldHintStyle!;

  static TextStyle title1TextStyle = _theme.subtitle2!;

  static TextStyle primaryButtonTextStyle =  _theme.descriptionLight1!;

  static TextStyle secondaryButtonTextStyle = _theme.description1!;

  static TextStyle loaderTextStyle = _theme.description2!.copyWith(decoration: TextDecoration.none);

  static TextStyle inputTextFieldStyle = _theme.subtitle2!;

  static TextStyle primaryButtonTextStyleLarge = _theme.headingLight5!;

  static TextStyle secondaryButtonTextStyleLarge = _theme.heading5!;
  static TextStyle tapCardResultsTextStyle = _theme.heading4!;
  static TextStyle changeStaffTitle = _theme.title2!;

  static TextStyle description1 = _theme.description2!;
  static TextStyle description2 = _theme.description1!.copyWith(decoration: TextDecoration.none);

  static TextStyle fulfillDropDownText = const TextStyle(
    fontFamily: 'RobotoCondensed',
    color: Color.fromARGB(255, 16, 18, 22),
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
  );
}
