import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:transaction_functions/iconic_context_menu/theme_item.dart';
import 'iconic_context_menu_theme_data.dart';

class IconicContextMenuThemeProvider {
  static IconicContextMenuThemeData? _data;
  static List<ThemeItem>? _items;

  static Future<void> init() async {
    var jsonData = await rootBundle.loadString('assets/iconic_context_menu_items.json');
    _data = IconicContextMenuThemeData.fromJson(json.decode(jsonData));
  }

  static List<ThemeItem>? getItemsList(bool isDark) {
    _items = isDark ? _data?.darkTheme : _data?.lightTheme;
    return _items;
  }
}
