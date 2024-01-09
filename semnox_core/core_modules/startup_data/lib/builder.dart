import 'package:application_prefs_data/builder.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:network_module/builder.dart';
import 'package:startup_data/api_client/startup_data_api_client.dart';
import 'package:startup_data/startup_data_bl.dart';
import 'package:startup_data/startup_data_interceptor.dart';
import 'package:startup_data/startup_data_service.dart';

class StartupDataBuilder {

  static Future<StartupDataBLContract> build(ExecutionContextDTO executionContextDTO) async {
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final networkModuleBL = await NetworkModuleBuilder.build();

    networkModuleBL.addInterceptor(StartupDataInterceptor(executionContextDTO.webApiToken ?? ''));

    final startupDataApiClient = StartupDataApiClient(networkModuleBL.getDioClient(), baseUrl: appPrefsBL.getServerUrl());
    final startupDataService = StartupDataService(startupDataApiClient, executionContextDTO, appPrefsBL);
    final startupDataBL = StartupDataBLImpl(startupDataService);
    return startupDataBL;
  }
}