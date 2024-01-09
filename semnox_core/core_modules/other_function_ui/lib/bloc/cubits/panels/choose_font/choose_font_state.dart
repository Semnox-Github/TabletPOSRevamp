class ChooseFontState {
  ChooseFontState(
      {this.selectedFontFamily = 'RobotoCondensed',
      this.selectedFontStyle = 'Normal Normal Normal',
      this.selectedFontSize = 14,
      this.fontStyleList = const [],
      this.fontSizeList = const [],
      this.fontFamilyList = const []});

  String? selectedFontFamily;
  String? selectedFontStyle;
  int? selectedFontSize;
  List<String> fontFamilyList;
  List<String> fontStyleList;
  List<int> fontSizeList;

  ChooseFontState copyWith({
    String? selectedFontFamily,
    String? selectedFontStyle,
    int? selectedFontSize,
    List<String>? fontFamilyList,
    List<String>? fontStyleList,
    List<int>? fontSizeList,
  }) {
    return ChooseFontState(
        selectedFontFamily: selectedFontFamily ?? this.selectedFontFamily,
        selectedFontStyle: selectedFontStyle ?? this.selectedFontStyle,
        selectedFontSize: selectedFontSize ?? this.selectedFontSize,
        fontFamilyList: fontFamilyList ?? this.fontFamilyList,
        fontStyleList: fontStyleList ?? this.fontStyleList,
        fontSizeList: fontSizeList ?? this.fontSizeList);
  }
}
