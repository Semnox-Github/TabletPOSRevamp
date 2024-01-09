import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:transaction_functions/iconic_context_menu/help/theme_item.dart';
import 'help_dialog_theme_data.dart';

class HelpDialogDataThemeProvider {
  static HelpDialogThemeData? _helpDialogData;
  static List<ThemeItem>? _items;

  static Future<void> init() async {
    var jsonData = await rootBundle.loadString('assets/help_menu_dialog_items.json');
    _helpDialogData = HelpDialogThemeData.fromJson(json.decode(jsonData));
  }

  static List<ThemeItem>? getItemsList(bool isDark) {
    _items = isDark ? _helpDialogData?.darkTheme : _helpDialogData?.lightTheme;
    return _items;
  }

  static ThemeItem? getItemData(String title) {
    ThemeItem? data;
    _items?.forEach((element) {
      if(element.title == title) {
        data = element;
      }
    });
    return data;
  }
}
