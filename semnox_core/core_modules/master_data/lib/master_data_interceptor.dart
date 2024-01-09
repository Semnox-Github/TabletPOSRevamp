
import 'package:dio/dio.dart';

class MasterDataInterceptor extends Interceptor {

  final String token;

  MasterDataInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = token;
    super.onRequest(options, handler);
  }
}