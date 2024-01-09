
import 'package:dio/dio.dart';

class ContextMenuDataInterceptor extends Interceptor {

  final String token;

  ContextMenuDataInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = token;
    super.onRequest(options, handler);
  }
}