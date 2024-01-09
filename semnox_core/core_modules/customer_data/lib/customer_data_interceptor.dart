
import 'package:dio/dio.dart';

class CustomerSearchDataInterceptor extends Interceptor {

  final String token;

  CustomerSearchDataInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = token;
    super.onRequest(options, handler);
  }
}