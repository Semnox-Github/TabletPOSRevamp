
import 'package:dio/dio.dart';

class PaymentDataInterceptor extends Interceptor {

  final String token;

  PaymentDataInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = token;
    super.onRequest(options, handler);
  }
}