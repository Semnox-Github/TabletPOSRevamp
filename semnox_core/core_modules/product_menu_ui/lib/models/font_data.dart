class FontData {
  String fontFamily;
  double fontSize;
  String fontStyle;
  String fontWeight;

  FontData({required this.fontFamily,required this.fontSize,required this.fontStyle,required this.fontWeight});

  @override
  String toString() {
    return '{fontFamily: ${fontFamily}, fontSize: ${fontSize}, fontStyle: ${fontStyle}, fontWeight: ${fontWeight},}';
  }

  FontData copyWith({
    String? fontFamily,
    double? fontSize,
    String? fontStyle,
    String? fontWeight,
  }) {
    return FontData(
        fontFamily: fontFamily ?? this.fontFamily,
        fontSize: fontSize ?? this.fontSize,
        fontStyle: fontStyle ?? this.fontStyle,
        fontWeight: fontWeight ?? this.fontWeight
    );
  }
}