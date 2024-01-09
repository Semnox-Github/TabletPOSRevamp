import 'package:dio/dio.dart';

class OrdersDataInterceptor extends Interceptor{

  final String token;

  OrdersDataInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = token;
    super.onRequest(options, handler);
  }
}