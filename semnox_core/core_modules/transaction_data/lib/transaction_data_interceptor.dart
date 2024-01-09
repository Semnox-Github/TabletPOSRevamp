
import 'package:dio/dio.dart';

class TransactionDataInterceptor extends Interceptor {

  final String token;

  TransactionDataInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = token;
    super.onRequest(options, handler);
  }
}