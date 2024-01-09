
import 'package:application_prefs_data/builder.dart';
import 'package:execution_context/builder.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:master_data/api_client/master_data_api_client.dart';
import 'package:master_data/master_data_bl.dart';
import 'package:master_data/master_data_interceptor.dart';
import 'package:master_data/master_data_service.dart';
import 'package:network_module/builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MasterDataBuilder {

  static Future<MasterDataBLContract> build(ExecutionContextDTO executionContextDTO) async {
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final networkModuleBL = await NetworkModuleBuilder.build();

    final sharedPreferences = await SharedPreferences.getInstance();
    networkModuleBL.addInterceptor(MasterDataInterceptor(executionContextDTO.webApiToken ?? ''));

    final masterDataApiClient = MasterDataApiClient(networkModuleBL.getDioClient(), baseUrl: appPrefsBL.getServerUrl());
    final masterDataService = MasterDataService(masterDataApiClient, executionContextDTO, sharedPreferences,appPrefsBL);
    final masterDataBL = MasterDataBLImpl(masterDataService);

    return masterDataBL;
  }
}