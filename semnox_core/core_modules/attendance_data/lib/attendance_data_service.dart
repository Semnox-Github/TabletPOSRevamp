import 'dart:convert';
import 'dart:io';

import 'package:attendance_data/api_client/attendance_api_client.dart';
import 'package:attendance_data/constants.dart';
import 'package:attendance_data/model/attendanceForDay/attendance_for_day.dart';
import 'package:attendance_data/model/receipt/receipt_content_response.dart';
import 'package:attendance_data/model/recordAttendance/attendance_request.dart';
import 'package:attendance_data/model/record_attendance_model.dart';
import 'package:attendance_data/model/template_header_container/receipt_template_header_container_response.dart';
import 'package:attendance_data/model/shiftConfig/shift_config_model.dart';
import 'package:dio/dio.dart';
import 'package:master_data/models/user_role_container/user_role_container_response.dart';
import 'package:transaction_data/models/user_container/user_container_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:path_provider/path_provider.dart';

class AttendanceDataService {
  static const SHIFT_CONFIG_FILE_NAME = 'shift_config_response.json';
  static const RECEIPT_TEMPLATE_FILE_NAME = 'receipt_template_response.json';

  late AttendanceApiClient _attendanceApiClient;
  late SharedPreferences _preferences;
  late ExecutionContextDTO _executionContextDTO;

  static final AttendanceDataService _instance = AttendanceDataService._internal();
  AttendanceDataService._internal();

  factory AttendanceDataService(AttendanceApiClient apiClient, ExecutionContextDTO executionContextDTO, SharedPreferences sharedPreferences) {
    _instance._attendanceApiClient = apiClient;
    _instance._executionContextDTO = executionContextDTO;
    _instance._preferences = sharedPreferences;
    return _instance;
  }

  AttendanceForDay? attendanceForDay;

  Future<RecordAttendanceModel> recordAttendance(AttendanceRequest request,
      {required int userId}) {
    return _attendanceApiClient.postRecordAttendance(userId, request);
  }

  Future<AttendanceForDay> getAttendanceDetails({required int userId}) async {
    try {
      attendanceForDay =
          await _attendanceApiClient.getAttendanceDetails(userId);
      return attendanceForDay!;
    } on DioError {
      rethrow;
    }
  }

  Future<UserRoleContainerResponse> getUserRoleList(
      Map<String, dynamic> params) {
    try {
      return _attendanceApiClient.getUserRoleList(params);
    } on DioError {
      rethrow;
    }
  }

  Future<UserContainerResponse> getUserContainer(Map<String, dynamic> params) {
    try {
      return _attendanceApiClient.getUserContainer(params);
    } on DioError {
      rethrow;
    }
  }

  Future<ShiftConfigResponseModel> getShiftConfig() async {
    try {
      final shiftConfigHash = _preferences.getString(shiftConfigHashKey);
      final response = await _attendanceApiClient.getShiftConfig({
        'siteId': _executionContextDTO.siteId ?? -1,
        'hash': shiftConfigHash,
        'rebuildCache': false,
      });

      if(response.data != null && response.exception == null) {
        var responseString = json.encode(response.toJson());
        await _preferences.setString(shiftConfigHashKey, response.data?.hash ?? '');
        await _deleteFile(SHIFT_CONFIG_FILE_NAME);
        await _saveResponseToJsonFile(responseString, SHIFT_CONFIG_FILE_NAME);
        return response;
      } else {
        var resp = await getResponseFromFile<ShiftConfigResponseModel>(SHIFT_CONFIG_FILE_NAME, (json) => ShiftConfigResponseModel.fromJson(json));
        resp ??= await _attendanceApiClient.getShiftConfig({
          'siteId': _executionContextDTO.siteId ?? -1,
        });
        return resp;
      }
    } on DioError {
      rethrow;
    }
  }

  Future<T?> getResponseFromFile<T>(String fileName, T Function(Map<String, dynamic>) fromJson) async {
    var localPath = await _localPath;
    bool isFileAvailable = await File('$localPath/files/$fileName').exists();
    if(isFileAvailable) {
      final file = File('$localPath/files/$fileName');
      var fileContent = await file.readAsString();
      final responseMap = json.decode(fileContent) as Map<String, dynamic>;
      final response = fromJson(responseMap);
      return response;
    } else {
      return null;
    }
  }

  Future<int> _deleteFile(String fileName) async {
    try {
      var localPath = await _localPath;
      final file = File('$localPath/files/$fileName');
      await file.delete();
      return 1;
    } catch (e) {
      return 0;
    }
  }


  Future<void> _saveResponseToJsonFile(String response, String fileName) async {
    var localPath = await _localPath;
    await Directory('$localPath/files').create(recursive: false);
    await File('$localPath/files/$fileName').writeAsString(response);
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<ReceiptContentResponse> getReceiptContent(int userId, Map<String, dynamic> params) {
    try {
      return _attendanceApiClient.getReceiptContent(userId, params);
    } on DioError {
      rethrow;
    }
  }

  Future<ReceiptTemplateHeaderContainerResponse> getReceiptTemplateContainer(Map<String, dynamic> params) async {
    try {
      final receiptTemplateHash = _preferences.getString(receiptTemplateHashKey);
      params['hash'] = receiptTemplateHash;
      params['rebuildCache'] = false;
      final response = await _attendanceApiClient.getReceiptTemplateHeaderContainer(params);
      if(response.data != null && response.exception == null) {
        var responseString = json.encode(response.toJson());
        await _preferences.setString(receiptTemplateHashKey, response.data?.hash ?? '');
        await _deleteFile(RECEIPT_TEMPLATE_FILE_NAME);
        await _saveResponseToJsonFile(responseString, RECEIPT_TEMPLATE_FILE_NAME);
        return response;
      } else {
        var resp = await getResponseFromFile<ReceiptTemplateHeaderContainerResponse>(RECEIPT_TEMPLATE_FILE_NAME, (json) => ReceiptTemplateHeaderContainerResponse.fromJson(json));
        resp ??= await _attendanceApiClient.getReceiptTemplateHeaderContainer(params);
        return resp;
      }
    } on DioError {
      rethrow;
    }
  }
}
