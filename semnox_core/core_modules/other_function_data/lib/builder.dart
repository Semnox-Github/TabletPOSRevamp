import 'package:application_prefs_data/builder.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:network_module/builder.dart';
import 'package:other_function_data/api_client/other_function_api_client.dart';
import 'package:other_function_data/other_functions_data_bl.dart';
import 'package:other_function_data/other_functions_data_interceptor.dart';
import 'package:other_function_data/other_functions_data_service.dart';

class OtherFunctionDataBuilder {
  static Future<OtherFunctionDataBLContract> build(
      ExecutionContextDTO executionContextDTO) async {
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final networkModuleBL = await NetworkModuleBuilder.build();

    networkModuleBL.addInterceptor(
        OtherFunctionsDataInterceptor(executionContextDTO.webApiToken ?? ''));

    final otherFunctionDataApiClient = OtherFunctionApiClient(
        networkModuleBL.getDioClient(),
        baseUrl: appPrefsBL.getServerUrl());
    final ordersDataService = OtherFunctionDataService(
        otherFunctionDataApiClient, executionContextDTO, appPrefsBL);
    final ordersDataBL = OtherFunctionDataBlImpl(ordersDataService);

    return ordersDataBL;
  }
}
