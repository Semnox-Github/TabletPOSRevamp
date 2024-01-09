class AppConstants {
  static RegExp alphanumericRegEx = RegExp(r'^[a-zA-Z0-9]+$');
  static RegExp alphanumericRegExpWithSpecialChar = RegExp(r'^[a-zA-Z0-9\s]+$');
  static RegExp onlyNumbersRegExp = RegExp(r"^[0-9]+$");
  static RegExp removeLeadingAndTrailingSpaces = RegExp(r' \s+');

}
