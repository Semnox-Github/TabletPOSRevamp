
import 'package:application_prefs_data/builder.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:network_module/builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transaction_data/api_client/transaction_api_client.dart';
import 'package:transaction_data/transaction_data_bl.dart';
import 'package:transaction_data/transaction_data_interceptor.dart';
import 'package:transaction_data/transaction_data_service.dart';

class TransactionDataBuilder {
  static Future<TransactionDataBLContract> build(ExecutionContextDTO executionContextDTO) async {
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final networkModuleBL = await NetworkModuleBuilder.build();
    final sharedPreferences = await SharedPreferences.getInstance();

    networkModuleBL.addInterceptor(TransactionDataInterceptor(executionContextDTO.webApiToken ?? ''));
    final transactionApiClient = TransactionApiClient(networkModuleBL.getDioClient(), baseUrl: appPrefsBL.getServerUrl());
    final transactionDataService = TransactionDataService(transactionApiClient, executionContextDTO, sharedPreferences, appPrefsBL);
    final transactionDataBL = TransactionDataBLImpl(transactionDataService);
    return transactionDataBL;
  }
}