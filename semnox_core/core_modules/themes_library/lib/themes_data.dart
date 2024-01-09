library strings_data;

abstract class ThemesBLContract {
  String getData(String key);
}

class ThemesBL implements ThemesBLContract {
  final dynamic colors;

  ThemesBL(this.colors);

  @override
  String getData(String key) {
    return colors[key] ?? "Theme not defined";
  }
}
