import 'dart:convert';
import 'dart:io';

import 'package:application_prefs_data/application_prefs_data_bl.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:messages_data/api_client/messages_data_api_client.dart';
import 'package:messages_data/constants.dart';
import 'package:messages_data/models/messages_container/message_response.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MessagesDataService {
  static const MESSAGES_FILE_NAME = 'messages_container_response.json';

  late MessagesDataApiClient _membershipApiClient;
  late SharedPreferences _preferences;
  late ApplicationPrefsDataBLContract _appPrefsBL;

  static final MessagesDataService _instance = MessagesDataService._internal();
  MessagesDataService._internal();

  factory MessagesDataService(MessagesDataApiClient apiClient, SharedPreferences sharedPreferences, ApplicationPrefsDataBLContract appPrefsBL) {
    _instance._membershipApiClient = apiClient;
    _instance._appPrefsBL = appPrefsBL;
    _instance._preferences = sharedPreferences;
    return _instance;
  }

  Map<String,String>? _messageMap;
  MessagesResponse? _messagesResponse;

  Future<MessagesResponse?> sync() async {
    _messagesResponse = await _callMessagesContainerApi();
    return _messagesResponse;
  }

  String? getMessage(String key) {
    return _messageMap?[key];
  }

  Future<void> syncFromLocal() async {
    _messageMap = await _getMessagesContainerFromFile();
  }

  Future<MessagesResponse?> _callMessagesContainerApi() async {
    try {
      final executionContextBL = await ExecutionContextBuilder.build();
      final executionContext = executionContextBL.getExecutionContext();
      final refreshServer = _preferences.getBool(shouldRefreshServer) ?? false;
      final siteID = _appPrefsBL.getDefaultSiteId();
      final messageHash = _preferences.getString(messageHashKey);
      final response = await _membershipApiClient.getMessagesContainer({
        'siteId': siteID,
        'hash': messageHash,
        'rebuildCache': refreshServer,
        'languageId': executionContext?.languageId ?? -1,
      });
      final messageList = response.data?.messageContainerDTOList;
      if (messageList != null) {
        _messageMap = <String,String>{};
        for (int i = 0; i < messageList.length; i++) {
          final item = messageList[i];
          if(item.translatedMessage.isNotEmpty) {
            _messageMap?[item.message] = item.translatedMessage;
          } else {
            _messageMap?[item.message] = item.message;
          }
        }
        if(response.data != null && response.exception == null) {
          await _preferences.setString(messageHashKey, response.data?.hash ?? '');
          await _deleteFile(MESSAGES_FILE_NAME);
          var responseString = json.encode(response.toJson());
          await _saveResponseToJsonFile(responseString, MESSAGES_FILE_NAME);
        }
      } else {
        _messageMap = await _getMessagesContainerFromFile();
      }
      return response;
    } on DioError catch (error) {
      return null;
    }
  }

  Future<Map<String,String>?> _getMessagesContainerFromFile() async {
    var localPath = await _localPath;
    bool isFileAvailable = await File('$localPath/files/$MESSAGES_FILE_NAME').exists();
    if(isFileAvailable) {
      final file = File('$localPath/files/$MESSAGES_FILE_NAME');
      var fileContent = await file.readAsString();
      final responseMap = json.decode(fileContent) as Map<String, dynamic>;
      final messageContainerMapDTO = MessagesResponse.fromJson(responseMap);
      final messages = messageContainerMapDTO.data?.messageContainerDTOList;
      var messageContainerMap = <String, String>{};

      if(messages != null) {
        for(int i=0; i<messages.length; i++) {
          final item = messages[i];
          if(item.translatedMessage.isNotEmpty) {
            messageContainerMap[item.message] = item.translatedMessage;
          } else {
            messageContainerMap[item.message] = item.message;
          }
        }
      }
      return messageContainerMap;
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


  void clear() {
    _messageMap = null;
    _messagesResponse = null;
  }

}
