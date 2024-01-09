import 'package:dio/dio.dart';

class OtherFunctionsDataInterceptor extends Interceptor {
  final String token;

  OtherFunctionsDataInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = token;
    super.onRequest(options, handler);
  }
}
