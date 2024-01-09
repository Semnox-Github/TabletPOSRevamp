
import 'package:dio/dio.dart';

class MessagesDataInterceptor extends Interceptor {

  final String token;

  MessagesDataInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = token;
    super.onRequest(options, handler);
  }
}