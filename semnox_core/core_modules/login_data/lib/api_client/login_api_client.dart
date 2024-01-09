import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/login_request.dart';
import '../models/login_response.dart';

part 'login_api_client.g.dart';

@RestApi()
abstract class LoginApiClient {

  factory LoginApiClient(Dio dio, {String baseUrl}) = _LoginApiClient;

  static const loginEndPoint = "api/Login/AuthenticateUsersNew";

  @POST(loginEndPoint)
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
}
