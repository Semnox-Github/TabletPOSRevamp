import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/system_user_login_request.dart';
import '../models/system_user_login_response.dart';

part 'system_user_login_api_client.g.dart';

@RestApi()
abstract class SystemUserLoginApiClient {

  factory SystemUserLoginApiClient(Dio dio, {String baseUrl}) = _SystemUserLoginApiClient;

  static const loginEndPoint = "api/Login/AuthenticateSystemUsers";

  @POST(loginEndPoint)
  Future<SystemUserLoginResponse> login(@Body() SystemUserLoginRequest loginRequest);
}
