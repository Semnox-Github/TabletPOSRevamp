
import 'package:dio/dio.dart';

class StartupDataInterceptor extends Interceptor {

  final String token;

  StartupDataInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = token;
    super.onRequest(options, handler);
  }
}