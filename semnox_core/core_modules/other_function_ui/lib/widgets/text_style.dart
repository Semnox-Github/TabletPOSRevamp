import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';


class KTextStyle {
  static late SemnoxTheme _theme;

  static void init(BuildContext context) {
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
  }

  static TextStyle titleTextStyle = _theme.headingLight1!;

  static TextStyle titleStyleBold = _theme.heading5!;

  static TextStyle breadCrumbTitle = _theme.heading3!;

  static TextStyle actionBtnTextStyle(Color textColor) =>
      _theme.description1!.copyWith(color: textColor);

  static TextStyle regularBoldTextStyle = _theme.heading6!;
  static TextStyle backBtnText = _theme.headingLight4!;
  static TextStyle smallWhiteBoldtext = _theme.descriptionLight1!;
  static TextStyle bonusHintText = _theme.heading2!;
  static TextStyle smallBlackText =_theme.subtitle3!;
  static TextStyle hintTextStyle = _theme.textFieldHintStyle!;
  static TextStyle primaryDarkButtonTextStyle =  _theme.subtitleLight3!;
  static TextStyle primaryLightButtonTextStyle = _theme.subtitle3!;
  static TextStyle smallBlackText5 =  _theme.subtitle2!;
  static TextStyle regularNormalTextStyle =  _theme.subtitle1!;
  static TextStyle regularBlackText = _theme.title3!;
  static TextStyle largeRegularText = _theme.subtitle1!;
  static TextStyle headingTextStyle1 =  _theme.heading4!;

}
