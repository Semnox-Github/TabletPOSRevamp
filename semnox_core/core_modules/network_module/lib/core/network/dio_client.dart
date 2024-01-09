import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:network_module/core/network/error_interceptor.dart';
import 'package:network_module/core/network/logging_interceptor.dart';


class DioClient {
  late String _baseUrl;
  late Dio _dio;

  static final DioClient _instance = DioClient._internal();
  DioClient._internal();
  static DioClient get instance => _instance;

  factory DioClient(url) {
    _instance._baseUrl = url;
    _instance._dio = Dio()..options = BaseOptions(baseUrl: _instance._baseUrl);
    _instance._dio.interceptors.add(AwesomeDioInterceptor());
    _instance._dio.interceptors.add(LoggingInterceptor());
    _instance._dio.interceptors.add(ErrorInterceptor());
    _instance._dio.interceptors.add(RetryInterceptor(
      dio: _instance._dio,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1), // wait 1 sec before first retry
        Duration(seconds: 2), // wait 2 sec before second retry
      ],
    ));
    return _instance;
  }

  Dio getDioClient() {
    return _dio;
  }

  void addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }

}
