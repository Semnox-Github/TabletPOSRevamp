
import 'package:application_prefs_data/builder.dart';
import 'package:network_module/builder.dart';
import 'package:system_user_login_data/api_client/system_user_login_api_client.dart';
import 'package:system_user_login_data/system_user_login_bl.dart';
import 'package:system_user_login_data/system_user_login_service.dart';

class SystemUserLoginDataBuilder {
  static Future<SystemUserLoginBLContract> build() async {

    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final networkModuleBL = await NetworkModuleBuilder.build();

    final systemUserLoginApiClient = SystemUserLoginApiClient(networkModuleBL.getDioClient(), baseUrl: appPrefsBL.getServerUrl());
    final systemUserLoginService = SystemUserLoginService(systemUserLoginApiClient, appPrefsBL);
    final systemUserLoginBL = SystemUserLoginBLImpl(systemUserLoginService);
    return systemUserLoginBL;
  }
}