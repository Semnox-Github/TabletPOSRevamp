import 'package:dio/dio.dart';
import 'package:network_module/core/network/dio_client.dart';
import 'package:network_module/core/network/error_interceptor.dart';

class NetworkModuleService {

  late DioClient _dioClient;
  late ErrorInterceptor _errorInterceptor;

  static final NetworkModuleService _instance = NetworkModuleService._internal();
  NetworkModuleService._internal();

  factory NetworkModuleService(DioClient dioBuilder, ErrorInterceptor errorInterceptor) {
    _instance._dioClient = dioBuilder;
    _instance._errorInterceptor = errorInterceptor;
    return _instance;
  }

  Dio getDioClient() {
    return _dioClient.getDioClient();
  }

  void addInterceptor(Interceptor interceptor) {
    _dioClient.addInterceptor(interceptor);
  }

  Stream<ApiError> getApiErrorStream() {
    return _errorInterceptor.stream;
  }
}