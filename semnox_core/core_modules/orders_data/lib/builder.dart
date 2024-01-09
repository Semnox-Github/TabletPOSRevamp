import 'package:application_prefs_data/builder.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:network_module/builder.dart';
import 'package:orders_data/api_client/orders_api_client.dart';
import 'package:orders_data/orders_data_bl.dart';
import 'package:orders_data/orders_data_interceptor.dart';
import 'package:orders_data/orders_data_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersDataBuilder{
  static Future<OrdersDataBLContract> build(ExecutionContextDTO executionContextDTO) async {
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final networkModuleBL = await NetworkModuleBuilder.build();

    final sharedPreferences = await SharedPreferences.getInstance();
    networkModuleBL.addInterceptor(OrdersDataInterceptor(executionContextDTO.webApiToken ?? ''));

    final ordersDataAPiClient = OrdersApiClient(networkModuleBL.getDioClient(), baseUrl: appPrefsBL.getServerUrl());
    final ordersDataService = OrdersDataService(ordersDataAPiClient, executionContextDTO, sharedPreferences, appPrefsBL);
    final ordersDataBL = OrdersDataBLImpl(ordersDataService);

    return ordersDataBL;
  }
}