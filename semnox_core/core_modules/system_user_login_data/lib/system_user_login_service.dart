import 'package:application_prefs_data/application_prefs_data_bl.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:system_user_login_data/api_client/system_user_login_api_client.dart';

import 'models/system_user_login_request.dart';
import 'models/system_user_login_response.dart';


class SystemUserLoginService {

  late SystemUserLoginApiClient _loginApiClient;
  late ApplicationPrefsDataBLContract _appPrefsBL;

  static final SystemUserLoginService _instance = SystemUserLoginService._internal();
  SystemUserLoginService._internal();

  factory SystemUserLoginService(SystemUserLoginApiClient apiClient, ApplicationPrefsDataBLContract appPrefsBL) {
    _instance._loginApiClient = apiClient;
    _instance._appPrefsBL = appPrefsBL;
    return _instance;
  }

  Future<SystemUserLoginResponse> login({
    required String machineName,
    required int siteId,
  }) async {
    final username = _appPrefsBL.getSystemUserName();
    final password = _appPrefsBL.getSystemPassword();
    SystemUserLoginRequest loginRequest = SystemUserLoginRequest(
        LoginId: username,
        Password: password,
        MachineName: machineName,
        SiteId: siteId
    );
    try {
      final response = await _loginApiClient.login(loginRequest);
      await _setExecutionContext(response);
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<SystemUserLoginResponse> loginWithoutSave({
    required String machineName,
    required int siteId,
  }) async {
    final username = _appPrefsBL.getSystemUserName();
    final password = _appPrefsBL.getSystemPassword();
    SystemUserLoginRequest loginRequest = SystemUserLoginRequest(
        LoginId: username,
        Password: password,
        MachineName: machineName,
        SiteId: siteId
    );
    try {
      final response = await _loginApiClient.login(loginRequest);
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<SystemUserLoginResponse> loginWithCredentials({
    required String userName,
    required String password,
    required String machineName,
    required int siteId,
  }) async {
    SystemUserLoginRequest loginRequest = SystemUserLoginRequest(
        LoginId: userName,
        Password: password,
        MachineName: machineName,
        SiteId: siteId
    );
    try {
      final response = await _loginApiClient.login(loginRequest);
      await _setExecutionContext(response);
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<void> _setExecutionContext(SystemUserLoginResponse result) async {
    final executionDTO = ExecutionContextDTO(posMachineGuid: result.data?.posMachineGuid,
        webApiToken: result.data?.webApiToken,
        languageId: result.data?.languageId,
        isCorporate: result.data?.isCorporate,
        userPKId: result.data?.userPKId,
        userRoleId: result.data?.userRoleId,
        machineId: result.data?.machineId,
        siteId: result.data?.siteId,
        sitePKId: result.data?.sitePKId,
        userId: result.data?.userId,
        posMachineName: result.data?.posMachineName,
        languageCode: result.data?.languageCode,
        isUserLoggedIn: false
    );
     final execContextBL = await ExecutionContextBuilder.build();
     await execContextBL.setExecutionContext(executionDTO);
  }
}
