
import 'package:dio/dio.dart';

class ProductMenuDataInterceptor extends Interceptor {

  final String token;

  ProductMenuDataInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = token;
    super.onRequest(options, handler);
  }
}