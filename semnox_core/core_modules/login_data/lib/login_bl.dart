import 'package:login_data/login_service.dart';

import 'models/login_request.dart';
import 'models/login_response.dart';

abstract class LoginBLContract {
  Future<LoginResponse> login(LoginRequest loginRequest);

  Future<LoginResponse> managerLogin(LoginRequest loginRequest);
  Future<LoginResponse> authenticateUser(LoginRequest loginRequest);

  void loginUsingCard(String cardNumber);
}

class LoginBLImpl implements LoginBLContract {
  final LoginService loginService;

  LoginBLImpl(this.loginService);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) {
    return loginService.login(loginRequest);
  }

  @override
  Future<LoginResponse> authenticateUser(LoginRequest loginRequest) {
    return loginService.authenticateUser(loginRequest);
  }

  @override
  void loginUsingCard(String cardNumber) {
    loginService.loginUsingCard(cardNumber);
  }

  @override
  Future<LoginResponse> managerLogin(LoginRequest loginRequest) {
    return loginService.managerLogin(loginRequest);
  }
}
