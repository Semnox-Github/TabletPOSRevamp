

import 'package:system_user_login_data/api_client/system_user_login_api_client.dart';
import 'package:system_user_login_data/system_user_login_service.dart';

import 'models/system_user_login_request.dart';
import 'models/system_user_login_response.dart';

abstract class SystemUserLoginBLContract {
  Future<SystemUserLoginResponse> login({
    required String machineName,
    required int siteId,
  });
  Future<SystemUserLoginResponse> loginWithoutSave({
    required String machineName,
    required int siteId,
  });
  Future<SystemUserLoginResponse> loginWithCredentials({
    required String userName,
    required String password,
    required String machineName,
    required int siteId,
  });
}

class SystemUserLoginBLImpl implements SystemUserLoginBLContract {

  final SystemUserLoginService loginService;


  SystemUserLoginBLImpl(this.loginService);

  @override
  Future<SystemUserLoginResponse> login({
    required String machineName,
    required int siteId,
  }) {
    return loginService.login(machineName: machineName, siteId: siteId);
  }

  @override
  Future<SystemUserLoginResponse> loginWithoutSave({
    required String machineName,
    required int siteId,
  }) {
    return loginService.loginWithoutSave(machineName: machineName, siteId: siteId);
  }

  @override
  Future<SystemUserLoginResponse> loginWithCredentials({
    required String userName,
    required String password,
    required String machineName,
    required int siteId,
  }) {
    return loginService.loginWithCredentials(userName: userName, password: password, machineName: machineName, siteId: siteId);
  }
}
