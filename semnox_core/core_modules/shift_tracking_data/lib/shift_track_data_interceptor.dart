
import 'package:dio/dio.dart';

class ShiftTrackDataInterceptor extends Interceptor {

  final String token;

  ShiftTrackDataInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = token;
    super.onRequest(options, handler);
  }
}