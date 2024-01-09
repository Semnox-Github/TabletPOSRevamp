import 'package:dio/dio.dart';
import 'package:logs_data/logger.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Log.printApiLog("Request URL: ${options.method} ${options.uri} \nBody: ${options.data ?? ''}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Log.printApiLog("Response URL: ${response.realUri}, Response Body: ${response.data}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Log.printApiLog("Api Error: ${err.response?.data}");
    super.onError(err, handler);
  }
}
