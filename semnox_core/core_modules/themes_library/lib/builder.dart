import 'dart:async' show Future;
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:themes_library/themes_data.dart';
import 'dart:math' as math;

class ThemesProvider {
  static ThemesBL? _themesBLContract;

  static Future<void> init() async {
    var colorsString = await rootBundle.loadString('assets/colors.json');
    var colors = json.decode(colorsString);
    _themesBLContract = ThemesBL(colors);
  }

  static Color getColor(String key) {
    try{
      return Color(int.parse(_themesBLContract!.getData(key)));
    }catch(err){
      return Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    }
  }
}

class DarkThemeProvider {
  static ThemesBL? _themesBLContract;

  static Future<void> init() async {
    var colorsStringDark = await rootBundle.loadString('assets/colors_dark.json');
    var colorsDark = json.decode(colorsStringDark);
    _themesBLContract = ThemesBL(colorsDark);
  }

  static Color getColor(String key) {
    return Color(int.parse(_themesBLContract!.getData(key)));
  }
}
