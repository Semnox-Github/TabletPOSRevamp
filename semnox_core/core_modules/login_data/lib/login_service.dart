import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:login_data/api_client/login_api_client.dart';

import 'models/login_request.dart';
import 'models/login_response.dart';

class LoginService {
  late LoginApiClient loginApiClient;

  static final LoginService _instance = LoginService._internal();
  LoginService._internal();

  factory LoginService(LoginApiClient apiClient) {
    _instance.loginApiClient = apiClient;
    return _instance;
  }

  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      var response = await loginApiClient.login(loginRequest);
      await _setExecutionContext(response);
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<LoginResponse> authenticateUser(LoginRequest loginRequest) async {
    try {
      var response = await loginApiClient.login(loginRequest);

      return response;
    } on DioError {
      rethrow;
    }
  }

  void loginUsingCard(String cardNumber) {}

  Future<void> _setExecutionContext(LoginResponse result) async {
    var executionDTO = ExecutionContextDTO(
        posMachineGuid: result.data?.posMachineGuid,
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
        isUserLoggedIn: true);
    var execContextBL = await ExecutionContextBuilder.build();
    await execContextBL.setExecutionContext(executionDTO);
  }

  Future<LoginResponse> managerLogin(LoginRequest loginRequest) {
    try {
      return loginApiClient.login(loginRequest);
    } on DioError {
      rethrow;
    }
  }
}
