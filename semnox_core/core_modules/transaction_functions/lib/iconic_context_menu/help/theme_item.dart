class ThemeItem {
  String title;
  String icon;

  ThemeItem({
    required this.title,
    required this.icon,
  });

  factory ThemeItem.fromJson(Map<String, dynamic> json) => ThemeItem(
    title: json["title"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "icon": icon,
  };
}