import 'package:dio/dio.dart';
// import 'package:network_module/core/endpoints.dart';
import 'package:network_module/core/error/api_exception.dart';
// import 'package:network_module/injection_container.dart' as di;
// import 'package:network_module/core/preference_keys.dart' as sp_keys;
import 'package:shared_preferences/shared_preferences.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    // if (options.path != loginEndPoint) {
    //   var token = di.sl<SharedPreferences>().getString(sp_keys.apiTokenKey);
    //   options.headers['Authorization'] = '$token';
    // }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    ApiException.fromDioError(err);
    super.onError(err, handler);
  }
}
