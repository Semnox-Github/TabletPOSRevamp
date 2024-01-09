import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

enum ApiError { sessionExpired, otherError, connectivityError }

class ErrorInterceptor extends Interceptor {

  final StreamController<ApiError> _controller = StreamController<ApiError>.broadcast();

  static final ErrorInterceptor _instance = ErrorInterceptor._internal();
  ErrorInterceptor._internal();

  factory ErrorInterceptor() {
    return _instance;
  }

  Stream<ApiError> get stream => _controller.stream;
  static ErrorInterceptor get instance => _instance;

  void _setApiError(ApiError error) {
    _controller.sink.add(error);
  }

  void addApiError(ApiError error) {
    _setApiError(error);
  }

  void _closeStream() {
    _controller.close();
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if(err.response?.statusCode == 401) {
      _setApiError(ApiError.sessionExpired);
    } else if(err.error is SocketException) {
      _setApiError(ApiError.connectivityError);
    }
    super.onError(err, handler);
  }
}
