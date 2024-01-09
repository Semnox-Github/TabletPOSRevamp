
import 'package:application_prefs_data/builder.dart';
import 'package:customer_data/api_client/customer_data_api_client.dart';
import 'package:customer_data/customer_data_bl.dart';
import 'package:customer_data/customer_data_interceptor.dart';
import 'package:customer_data/customer_data_service.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:network_module/builder.dart';

class CustomerDataBuilder {
  static Future<CustomerDataBLContract> build(ExecutionContextDTO executionContextDTO) async {

    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final networkModuleBL = await NetworkModuleBuilder.build();

    networkModuleBL.addInterceptor(CustomerSearchDataInterceptor(executionContextDTO.webApiToken ?? ''));
    final customerDataApiClient = CustomerDataApiClient(networkModuleBL.getDioClient(), baseUrl: appPrefsBL.getServerUrl());
    final customerDataService = CustomerDataService(customerDataApiClient, executionContextDTO);
    final customerDataBL = CustomerDataBLImpl(customerDataService);
    return customerDataBL;
  }
}