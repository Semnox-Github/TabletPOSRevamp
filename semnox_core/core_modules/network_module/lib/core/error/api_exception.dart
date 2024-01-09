import 'package:dio/dio.dart';

class ApiException implements Exception {

  String message = "";

  ApiException({required this.message});

  ApiException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection time out";
        break;
      case DioErrorType.receiveTimeout:
        message = "Connection time out";
        break;
      case DioErrorType.response:
        message = _handleError(dioError.response!.statusCode!);
        break;
      case DioErrorType.sendTimeout:
        message = "Connection time out";
        break;
      default:
        message = "Please check your connection";
        break;
    }
  }

  String _handleError(int statusCode) {
    switch (statusCode) {
      case 400:
        return "Bad Request";
      case 404:
        return "Not Found";
      case 500:
        return "Internal Server Error";
      default:
        return "Something went wrong";
    }
  }

  @override
  String toString() => message;
}