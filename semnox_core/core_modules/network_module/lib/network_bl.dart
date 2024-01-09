
import 'package:dio/dio.dart';
import 'package:network_module/core/network/error_interceptor.dart';
import 'package:network_module/network_service.dart';

abstract class NetworkModuleBLContract {
  Dio getDioClient();
  void addInterceptor(Interceptor interceptor);
  Stream<ApiError> getApiErrorStream();
}

class NetworkModuleBLImpl implements NetworkModuleBLContract {

  final NetworkModuleService networkModuleService;

  NetworkModuleBLImpl(this.networkModuleService);

  @override
  Dio getDioClient() {
    return networkModuleService.getDioClient();
  }

  @override
  void addInterceptor(Interceptor interceptor) {
    networkModuleService.addInterceptor(interceptor);
  }

  @override
  Stream<ApiError> getApiErrorStream() {
    return networkModuleService.getApiErrorStream();
  }
}