import 'package:transaction_functions/iconic_context_menu/theme_item.dart';
import 'iconic_context_menu/iconic_context_menu_theme_provider.dart';

class TransactionFunctionDTO {
  final int taskTypeId;
  final String taskType;
  final String requiresManagerApproval;
  final String displayInPos;
  final String taskTypeName;
  final String category;
  late bool isIconicFunction;
  late String icon;

  TransactionFunctionDTO(this.taskTypeId, this.taskType, this.requiresManagerApproval,
      this.displayInPos, this.taskTypeName, this.category, {required bool isDarkTheme}) {
    var iconicContextMenuList = IconicContextMenuThemeProvider.getItemsList(isDarkTheme);
    for (var item in iconicContextMenuList!) {
      if (item.taskTypeName == taskTypeName) {
        if(item.category == category) {
          isIconicFunction = true;
          icon = item.icon;
        } else {
          isIconicFunction = false;
        }
      } else {
        isIconicFunction = false;
      }
    }
  }

  static ThemeItem? isIconicTransactionFunction(String? taskTypeName, String? category, bool isDarkTheme) {
    var iconicContextMenuList = IconicContextMenuThemeProvider.getItemsList(isDarkTheme);
    for (var item in iconicContextMenuList!) {
      if (item.taskTypeName == taskTypeName) {
        if(item.category == category) return item;
      }
    }
    return null;
  }
}
