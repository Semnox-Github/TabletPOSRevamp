import 'package:application_prefs_data/builder.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/sites/site_dto.dart';
import 'package:product_menu_data/builder.dart';
import 'package:semnox_tablet_pos/config/constants.dart';
import 'package:semnox_tablet_pos/cubits/pos_config/pos_config_state.dart';
import 'package:messages_data/builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:system_user_login_data/builder.dart';
import 'package:semnox_tablet_pos/utils/validator.dart';

class PosConfigCubit extends Cubit<PosConfigState> {

  PosConfigCubit() : super(const PosConfigState());

  final serverValidations = <ServerReachableWithException>[];

  void updateSites(List<SiteDTO> sites) {
    emit(state.copyWith(sites: sites));
  }

  void setLoadingStatus(int status) {
    emit(state.copyWith(loadingStatus: status, apiError: null));
  }

  void clearLoginState() async {
    emit(state.copyWith(loginResponse: null));
  }

  void validateSystemUserCredentials(String userName, String password) async {
    Log.printMethodStart("validateSystemUserCredentials()", "System User Login Screen", "Next");
    try {
      emit(state.copyWith(loadingMessage: MessagesProvider.get('Validating Credentials...'), loadingStatus: 1));
      final sysUserLoginBL = await SystemUserLoginDataBuilder.build();
      final appPrefsDataBL = await ApplicationPrefsBuilder.build();
      final machineId = await FlutterUdid.udid;
      appPrefsDataBL.setMachineName(machineId);
      final response = await sysUserLoginBL.loginWithCredentials(userName: userName, password: password, machineName: machineId.toUpperCase(), siteId: appPrefsDataBL.getDefaultSiteId());
      final executionContextBL = await ExecutionContextBuilder.build();
      final executionContextDTO = executionContextBL.getExecutionContext();
      if(executionContextDTO != null) {
        final masterDataBL = await MasterDataBuilder.build(executionContextDTO);
        final productMenuDataBL = await ProductMenuDataBuilder.build(executionContextDTO);
        final sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.setBool(shouldRefreshLocalData, true);
        await sharedPreferences.setBool(shouldRefreshServer, true);
        masterDataBL.clear();
        productMenuDataBL.clear();
      }
      if(response.exception == null) {
        emit(state.copyWith(loginResponse: response, loadingMessage: null, loadingStatus: 0));
      } else {
        emit(state.copyWith(apiError: response.exception, loadingMessage: null, loadingStatus: 0));
      }
      Log.printMethodEnd("validateSystemUserCredentials()", "System User Login Screen", "Next");
      Log.printMethodReturn("validateSystemUserCredentials() - Validated system user credentials.", "System User Login Screen", "Next");
    } on DioError catch(error) {
      var errorString = error.response?.data['data'] as String?;
      errorString ??= error.response?.data['Message'] as String?;
      emit(state.copyWith(apiError: errorString, loadingMessage: null, loadingStatus: 0));
    }
  }

  void resetServerValidationStatus() {
    emit(state.copyWith(isServerValidated: false, apiError: null));
  }

  Future<void> validateServerURL(String baseUrl) async {
    Log.printMethodStart("validateServerURL()", "Server API Screen", "Next");
    emit(state.copyWith(loadingMessage: MessagesProvider.get('Validating Server URL...'), loadingStatus: 1));
    serverValidations.clear();
    final isUrlValidated = validator.url(baseUrl);
    bool isServerErrorPresent = false;
    if(isUrlValidated) {
      serverValidations.add(ServerReachableWithException(
          entityType: "Is Server Url Format Valid?",
          status: true,
          statusCode: null,
          exception: "null"));

      final dio = Dio();
      var url = Uri.parse('$baseUrl/api/Common/RemoteConnectionCheck');
      try {
        var response = await dio.get(url.toString(), queryParameters: {
          'checkDBConnection': false
        });
        switch (response.statusCode) {
          case 200:
            serverValidations.add(ServerReachableWithException(
                entityType: "Is WebServer Accessible ?",
                status: true,
                statusCode: null,
                exception: "null"));
            break;
          default:
            isServerErrorPresent = true;
            serverValidations.add(ServerReachableWithException(
                entityType: "Is WebServer Accessible ?",
                status: false,
                statusCode: null,
                exception: "null"));
        }
      } on DioError catch(error) {
        isServerErrorPresent = true;
        debugPrint('Error: ${error.toString()}');
        serverValidations.add(ServerReachableWithException(
            entityType: "Is WebServer Accessible ?",
            status: false,
            statusCode: error.response?.statusCode ?? -1,
            exception: error.error,
            stackTrace: error.stackTrace
        ));
      }

      /// check server connection with DBConnection flag enabled
      try {
        var response = await dio.get(url.toString(), queryParameters: {
          'checkDBConnection': true
        });
        switch (response.statusCode) {
          case 200:
            serverValidations.add(ServerReachableWithException(
                entityType: "Is DB Connection Established ?",
                status: true,
                statusCode: null,
                exception: "null"));
            break;
          default:
            isServerErrorPresent = true;
            serverValidations.add(ServerReachableWithException(
                entityType: "Is DB Connection Established ?",
                status: false,
                statusCode: null,
                exception: "null"));
        }
        Log.printMethodEnd("validateServerURL()", "Server API Screen", "Next");
        Log.printMethodReturn("validateServerURL() - Validated server url.", "Server API Screen", "Next");
      } on DioError catch(error) {
        isServerErrorPresent = true;
        debugPrint('Error: ${error.toString()}');
        serverValidations.add(ServerReachableWithException(
            entityType: "Is DB Connection Established ?",
            status: false,
            statusCode: error.response?.statusCode ?? -1,
            exception: error.error,
            stackTrace: error.stackTrace
        ));
      }
      if(isServerErrorPresent) {
        emit(state.copyWith(loadingMessage: null, loadingStatus: 0, isServerValidated: false, isServerErrorsPresent: true));
      } else {
        emit(state.copyWith(loadingMessage: null, loadingStatus: 0, isServerValidated: true, isServerErrorsPresent: false));
      }
    } else {
      serverValidations.add(ServerReachableWithException(
          entityType: "Is Server Url Format Valid ?",
          status: false,
          statusCode: null,
          exception: "Server Url Format Not Valid",
      ));
      serverValidations.add(ServerReachableWithException(
          entityType: "Is WebServer Accessible ?",
          status: false,
          statusCode: null,
          exception: "null"));
      serverValidations.add(ServerReachableWithException(
          entityType: "Is DB Connection Established ?",
          status: false,
          statusCode: null,
          exception: "null"));
      emit(state.copyWith(loadingMessage: null, loadingStatus: 0, isServerValidated: false, isServerErrorsPresent: true));
    }
  }

}

class ServerReachableWithException {
  String? entityType;
  bool? status;
  Object? exception;
  StackTrace? stackTrace;
  String? errorType;
  int? statusCode;

  ServerReachableWithException(
      {this.entityType,
        this.status,
        this.exception,
        this.stackTrace,
        this.statusCode});
}