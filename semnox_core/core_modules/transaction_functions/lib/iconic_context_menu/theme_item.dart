class ThemeItem {
  String taskType;
  String taskTypeName;
  String category;
  String icon;

  ThemeItem({
    required this.taskType,
    required this.taskTypeName,
    required this.category,
    required this.icon,
  });

  factory ThemeItem.fromJson(Map<String, dynamic> json) => ThemeItem(
    taskType: json["taskType"],
    taskTypeName: json["taskTypeName"],
    category: json["category"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "taskType": taskType,
    "taskTypeName": taskTypeName,
    "category": category,
    "icon": icon,
  };
}