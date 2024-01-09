import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:themes_library/themes_library.dart';

class AppConstants {
  static RegExp alphanumericRegEx = RegExp(r'^[a-zA-Z0-9]+$');
  static RegExp alphanumericRegExpWithSpecialChar = RegExp(r'^[a-zA-Z0-9\s]+$');
  static RegExp onlyNumbersRegExp = RegExp(r"^[0-9]+$");
}

