

import 'package:context_menu_data/context_menu_data_service.dart';
import 'package:context_menu_data/models/context_menu_response.dart';

abstract class ContextMenuDataBLContract {
  Future<ContextMenuResponse> callContextMenuApi();
  ContextMenuResponse? getContextMenu();
  void clear();
}

class ContextMenuDataBLImpl implements ContextMenuDataBLContract {

  final ContextMenuDataService contextMenuDataService;

  ContextMenuDataBLImpl(this.contextMenuDataService);

  @override
  Future<ContextMenuResponse> callContextMenuApi() {
    return contextMenuDataService.callContextMenuApi();
  }

  @override
  ContextMenuResponse? getContextMenu() {
    return contextMenuDataService.getContextMenu();
  }

  @override
  void clear() {
    contextMenuDataService.clear();
  }
}
