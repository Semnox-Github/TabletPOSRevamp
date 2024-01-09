import 'package:transaction_functions/iconic_context_menu/theme_item.dart';

class IconicContextMenuThemeData {
  List<ThemeItem> darkTheme;
  List<ThemeItem> lightTheme;

  IconicContextMenuThemeData({
    required this.darkTheme,
    required this.lightTheme,
  });

  factory IconicContextMenuThemeData.fromJson(Map<String, dynamic> json) => IconicContextMenuThemeData(
    darkTheme: List<ThemeItem>.from(json["dark_theme"].map((x) => ThemeItem.fromJson(x))),
    lightTheme: List<ThemeItem>.from(json["light_theme"].map((x) => ThemeItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "dark_theme": List<dynamic>.from(darkTheme.map((x) => x.toJson())),
    "light_theme": List<dynamic>.from(lightTheme.map((x) => x.toJson())),
  };
}