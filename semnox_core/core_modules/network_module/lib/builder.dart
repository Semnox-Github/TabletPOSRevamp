
import 'package:application_prefs_data/builder.dart';
import 'package:network_module/core/network/dio_client.dart';
import 'package:network_module/core/network/error_interceptor.dart';
import 'package:network_module/network_bl.dart';
import 'package:network_module/network_service.dart';

class NetworkModuleBuilder {

  static Future<NetworkModuleBLContract> build() async {

    final appPrefsDataBL = await ApplicationPrefsBuilder.build();
    final dioClient = DioClient(appPrefsDataBL.getServerUrl());

    final errorInterceptor = ErrorInterceptor.instance;
    NetworkModuleService networkModuleService = NetworkModuleService(dioClient, errorInterceptor);
    NetworkModuleBLContract networkModuleBL = NetworkModuleBLImpl(networkModuleService);

    return networkModuleBL;
  }
}