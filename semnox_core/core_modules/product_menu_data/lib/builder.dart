
import 'package:application_prefs_data/builder.dart';
import 'package:execution_context/builder.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:network_module/builder.dart';
import 'package:product_menu_data/api_client/product_menu_data_api_client.dart';
import 'package:product_menu_data/product_menu_bl.dart';
import 'package:product_menu_data/product_menu_data_interceptor.dart';
import 'package:product_menu_data/product_menu_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductMenuDataBuilder {
  static Future<ProductMenuDataBLContract> build(ExecutionContextDTO executionContextDTO) async {

    final appPrefsDataBL = await ApplicationPrefsBuilder.build();
    final networkModuleBL = await NetworkModuleBuilder.build();

    final sharedPreferences = await SharedPreferences.getInstance();
    networkModuleBL.addInterceptor(ProductMenuDataInterceptor(executionContextDTO.webApiToken ?? ''));
    final productMenuDataApiClient = ProductMenuDataApiClient(networkModuleBL.getDioClient(), baseUrl: appPrefsDataBL.getServerUrl());
    final productMenuDataService = ProductMenuDataService(productMenuDataApiClient, executionContextDTO, sharedPreferences);
    final productMenuDataBL = ProductMenuDataBLImpl(productMenuDataService);

    return productMenuDataBL;
  }
}