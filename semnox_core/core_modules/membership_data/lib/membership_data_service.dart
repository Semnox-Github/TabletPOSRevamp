import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:membership_data/api_client/membership_api_client.dart';
import 'package:membership_data/constants.dart';
import 'package:membership_data/models/membership_response.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



class MembershipDataService {
  static const MEMBERSHIP_CONTAINER_FILE_NAME = 'membership_container_response.json';

  late MemberShipApiClient _membershipApiClient;
  late ExecutionContextDTO _executionContextDTO;
  late SharedPreferences _preferences;

  static final MembershipDataService _instance = MembershipDataService._internal();
  MembershipDataService._internal();

  factory MembershipDataService(MemberShipApiClient apiClient, SharedPreferences sharedPreferences, ExecutionContextDTO executionContextDTO) {
    _instance._membershipApiClient = apiClient;
    _instance._executionContextDTO = executionContextDTO;
    _instance._preferences = sharedPreferences;
    return _instance;
  }

  MemberShipResponse? _memberShipResponse;


  Future<MemberShipResponse> callMembershipDataApi() async {
    try {
      final membershipContainerHash = _preferences.getString(membershipContainerHashKey);
      _memberShipResponse ??= await _membershipApiClient.getMembershipData({
        'siteId': _executionContextDTO.siteId ?? -1,
        'hash': membershipContainerHash,
        'rebuildCache': false,
      });

      if(_memberShipResponse?.data != null && _memberShipResponse?.exception == null) {
        var responseString = json.encode(_memberShipResponse!.toJson());
        await _preferences.setString(membershipContainerHashKey, _memberShipResponse?.data?.hash ?? '');
        await _deleteFile(MEMBERSHIP_CONTAINER_FILE_NAME);
        await _saveResponseToJsonFile(responseString, MEMBERSHIP_CONTAINER_FILE_NAME);
      } else {
        _memberShipResponse = await getResponseFromFile<MemberShipResponse>(MEMBERSHIP_CONTAINER_FILE_NAME, (json) => MemberShipResponse.fromJson(json));
        _memberShipResponse ??= await _membershipApiClient.getMembershipData({
          'siteId': _executionContextDTO.siteId ?? -1
        });
      }
      return _memberShipResponse!;
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

  MemberShipResponse? getMembershipData() {
    return _memberShipResponse;
  }

  void clear() {
    _memberShipResponse = null;
  }

}
