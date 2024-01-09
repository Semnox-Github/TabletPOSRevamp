import 'package:context_menu_data/api_client/context_menu_api_client.dart';
import 'package:context_menu_data/context_menu_data_bl.dart';
import 'package:context_menu_data/context_menu_data_interceptor.dart';
import 'package:context_menu_data/context_menu_data_service.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:network_module/builder.dart';
import 'package:application_prefs_data/builder.dart';

class ContextMenuDataBuilder {
  static Future<ContextMenuDataBLContract> build(ExecutionContextDTO executionContextDTO) async {

    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final networkModuleBL = await NetworkModuleBuilder.build();

    networkModuleBL.addInterceptor(ContextMenuDataInterceptor(executionContextDTO.webApiToken ?? ''));
    final contextMenuApiClient = ContextMenuApiClient(networkModuleBL.getDioClient(), baseUrl: appPrefsBL.getServerUrl());
    final contextMenuDataService = ContextMenuDataService(contextMenuApiClient,executionContextDTO);
    final contextMenuDataBL = ContextMenuDataBLImpl(contextMenuDataService);
    return contextMenuDataBL;
  }
}