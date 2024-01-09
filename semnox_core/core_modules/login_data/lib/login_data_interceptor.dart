
import 'package:dio/dio.dart';

class LoginDataInterceptor extends Interceptor {

  final String token;

  LoginDataInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = token;
    super.onRequest(options, handler);
  }
}