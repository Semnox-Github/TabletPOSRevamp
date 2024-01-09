import 'package:dio/dio.dart';

class AttendanceInterceptor extends Interceptor {
  final String token;

  AttendanceInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = token;
    super.onRequest(options, handler);
  }
}
