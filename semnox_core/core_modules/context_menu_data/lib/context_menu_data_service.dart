import 'package:context_menu_data/api_client/context_menu_api_client.dart';
import 'package:context_menu_data/models/context_menu_response.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:logs_data/logger.dart';



class ContextMenuDataService {
  late ContextMenuApiClient _contextMenuApiClient;
  late ExecutionContextDTO _executionContextDTO;

  static final ContextMenuDataService _instance = ContextMenuDataService._internal();
  ContextMenuDataService._internal();

  factory ContextMenuDataService(ContextMenuApiClient apiClient,ExecutionContextDTO executionContextDTO,) {
    _instance._contextMenuApiClient = apiClient;
    _instance._executionContextDTO = executionContextDTO;
    return _instance;
  }

  ContextMenuResponse? _contextMenuResponse;

  Future<ContextMenuResponse> callContextMenuApi() async {

    try {
      _contextMenuResponse ??= await _contextMenuApiClient.getContextMenus({
        'siteId': _executionContextDTO.siteId ?? 0,
        'rebuildCache':false,
        'hash':null
      });

      return _contextMenuResponse!;

    } on DioError {
      rethrow;
    }
  }

  ContextMenuResponse? getContextMenu() {
    return _contextMenuResponse;
  }

  void clear() {
    _contextMenuResponse = null;
  }
}
