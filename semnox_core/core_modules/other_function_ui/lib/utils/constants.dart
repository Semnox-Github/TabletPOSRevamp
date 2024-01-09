import 'package:flutter/material.dart';
import 'package:other_function_ui/widgets/colors.dart';
import 'package:other_function_ui/widgets/text_style.dart';

class AppConstants {
  static RegExp alphanumericRegEx = RegExp(r'^[a-zA-Z0-9]+$');
  static RegExp alphanumericRegExpWithSpecialChar = RegExp(r'^[a-zA-Z0-9\s]+$');
  static RegExp onlyNumbersRegExp = RegExp(r"^[0-9]+$");
  static RegExp removeLeadingAndTrailingSpaces = RegExp(r' \s+');

}

class AppDecorations {
  static BoxDecoration containerBoxDecoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      border: Border.all(color: KColor.borderGrey));

  static InputDecoration textFieldInputDecoration = InputDecoration(
    contentPadding:
        const EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          width: 1,
          color: KColor.primaryBlack,
        )),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          width: 1,
          color: KColor.borderGrey,
        )),
    hintStyle: KTextStyle.hintTextStyle,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        width: 1,
        color: KColor.primaryBlack,
      ),
    ),
  );
}
