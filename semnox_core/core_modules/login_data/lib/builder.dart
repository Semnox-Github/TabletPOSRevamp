
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:login_data/api_client/login_api_client.dart';
import 'package:login_data/login_bl.dart';
import 'package:login_data/login_data_interceptor.dart';
import 'package:login_data/login_service.dart';
import 'package:network_module/builder.dart';
import 'package:execution_context/builder.dart';
import 'package:application_prefs_data/builder.dart';

class LoginDataBuilder {
  static Future<LoginBLContract> build(ExecutionContextDTO executionContextDTO) async {

    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final networkModuleBL = await NetworkModuleBuilder.build();

    networkModuleBL.addInterceptor(LoginDataInterceptor(executionContextDTO.webApiToken ?? ''));
    final loginApiClient = LoginApiClient(networkModuleBL.getDioClient(), baseUrl: appPrefsBL.getServerUrl());
    final loginService = LoginService(loginApiClient);
    final loginBL = LoginBLImpl(loginService);
    return loginBL;
  }
}