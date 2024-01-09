
import 'package:dio/dio.dart';

class MembershipDataInterceptor extends Interceptor {

  final String token;

  MembershipDataInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = token;
    super.onRequest(options, handler);
  }
}