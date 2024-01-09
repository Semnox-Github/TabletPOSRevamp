import 'dart:convert';
import 'dart:io';

import 'package:application_prefs_data/application_prefs_data_bl.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startup_data/api_client/startup_data_api_client.dart';
import 'package:startup_data/models/app_versions/app_versions_response.dart';
import 'package:startup_data/models/generic/generic_response.dart';
import 'package:startup_data/models/remote_connection/remote_connection_response.dart';
import 'package:http/http.dart' as http;
import 'package:logs_data/logger.dart';
import 'package:system_user_login_data/builder.dart';


class StartupDataService {

  late StartupDataApiClient _startupDataApiClient;
  late ExecutionContextDTO _executionContextDTO;
  late ApplicationPrefsDataBLContract _appPrefsBL;

  static final StartupDataService _instance = StartupDataService._internal();
  StartupDataService._internal();

  factory StartupDataService(StartupDataApiClient apiClient, ExecutionContextDTO executionContextDTO, ApplicationPrefsDataBLContract appPrefsBL) {
    _instance._startupDataApiClient = apiClient;
    _instance._executionContextDTO = executionContextDTO;
    _instance._appPrefsBL = appPrefsBL;
    return _instance;
  }

  Future<bool> isServerAvailable() async {
    try {
      final response = await _startupDataApiClient.checkRemoteServerStatus();
      if(response.data != null) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (error) {
      return false;
    }

  }


  Future<bool> isRemoteServerOnline() async {
    try {
      // using http method because background api calls trigger socket exception when session is expired. (since http api have no interceptors added to detect session out)
      var headers = {
        'Authorization': _executionContextDTO.webApiToken ?? '',
        'Content-Type': 'application/json'
      };
      var url = Uri.parse('${_appPrefsBL.getServerUrl()}/api/Common/RemoteConnectionCheck');
      var response = await http.get(url,headers: headers);
      if(response.statusCode == 200){
        final result = RemoteConnectionResponse.fromJson(json.decode(response.body));
        if(result.data != null) {
          Log.v('::::  POS is Online :::: (${result.data})');
          return true;
        } else {
          Log.v('::::  POS is Offline ::::');
          return false;
        }
      } else {
        Log.v('::::  POS is Offline ::::');
        return false;
      }
    } on DioError catch (error) {
      Log.v('::::  POS is Offline ::::');
      return false;
    }
  }

  Future<bool> uploadLogFiles(File file) async {
    try {
      final response = await uploadFileToServer(file, _executionContextDTO.webApiToken ?? '');
      if (response.statusCode == 200) {
        return true;
      } else if(response.statusCode == 401) {
        final systemUserLoginBL = await SystemUserLoginDataBuilder.build();
        final machineId = await FlutterUdid.udid;
        final systemUserResponse = await systemUserLoginBL.loginWithoutSave(machineName: machineId.toUpperCase(), siteId: _executionContextDTO.siteId ?? -1);
        final resp = await uploadFileToServer(file, systemUserResponse.data?.webApiToken ?? '');
        if(resp.statusCode == 200) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } on DioError {
      rethrow;
    }
  }

  Future<http.Response> uploadFileToServer(File file, String token) async {
    final fileName = file.path.split('/').last;
    final response = await http.post(
      Uri.parse('${_appPrefsBL.getServerUrl()}/api/Common/FileResource?defaultValueName=TABLET_POS_LOGFILE_PATH&fileName=$fileName&secure=${false}'),
      headers: {
        'Content-Type': "text/plain;charset=utf-8",
        'Accept': "*/*",
        'Content-Length': file.lengthSync().toString(),
        'Connection': 'keep-alive',
        'Authorization': token
      },
      body: file.readAsBytesSync(),
    );
    return response;
  }


  Future<GenericResponse> validateLicense() async {
    try {
      final response = await _startupDataApiClient.validateLicense();
      return response;
    } on DioError catch (error) {
      rethrow;
    }
  }

  Future<GenericResponse> validatePosMachineCount(int machineCount) async {
    try {
      final response = await _startupDataApiClient.validatePosMachineCount({
        'machineCount': machineCount,
      });
      return response;
    } on DioError catch (error) {
      rethrow;
    }
  }

  Future<GenericResponse> validateMaxCard() async {
    try {
      final response = await _startupDataApiClient.validateMaxCard();
      return response;
    } on DioError catch (error) {
      rethrow;
    }
  }

  Future<GenericResponse> validateTransactionNumber() async {
    try {
      final response = await _startupDataApiClient.validateTransactionNumber();
      return response;
    } on DioError catch (error) {
      rethrow;
    }
  }

  Future<GenericResponse> checkVersion(String appVersion) async {
    List<String> version = appVersion.split('.');
    try {
      final response = await _startupDataApiClient.checkVersion({
        'parafaitExecutableName': 'TabletPOS.exe',
        'majorVersion': version[0],
        'minorVersion': version[1],
        'patchVersion': version[2],
      });
      return response;
    } on DioError catch (error) {
      rethrow;
    }
  }

  Future<AppVersionsResponse> checkAppVersions() async {
    try {
      final response = await _startupDataApiClient.checkAppVersions();
      return response;
    } on DioError catch (error) {
      rethrow;
    }
  }

  void clear() {

  }

}
