
import 'package:application_prefs_data/builder.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:messages_data/api_client/messages_data_api_client.dart';
import 'package:messages_data/messages_data_bl.dart';
import 'package:messages_data/messages_data_interceptor.dart';
import 'package:messages_data/messages_data_service.dart';
import 'package:network_module/builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessagesProvider {

  static MessagesDataBLContract? _messagesDataBLContract;

  static Future<MessagesDataBLContract> build(ExecutionContextDTO? executionContextDTO) async {
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final networkModuleBL = await NetworkModuleBuilder.build();
    final sharedPreferences = await SharedPreferences.getInstance();

    networkModuleBL.addInterceptor(MessagesDataInterceptor(executionContextDTO?.webApiToken ?? ''));
    final messagesDataApiClient = MessagesDataApiClient(networkModuleBL.getDioClient(), baseUrl: appPrefsBL.getServerUrl());
    final messagesDataService = MessagesDataService(messagesDataApiClient, sharedPreferences, appPrefsBL);
    final messagesDataBL = MessagesDataBLImpl(messagesDataService);
    _messagesDataBLContract = messagesDataBL;
    return messagesDataBL;
  }

  static String get(String key, [List<dynamic> args = const []]) {
    var msg = _messagesDataBLContract!.getMessage(key);
    if(msg == null) {
      int i = 0;
      for (dynamic arg in args) {
        i++;
        key = key.replaceAll("&$i", "$arg");
      }
      return key;
    } else {
      int i = 0;
      for (dynamic arg in args) {
        i++;
        msg = msg!.replaceAll("&$i", "$arg");
      }
      return msg!;
    }
  }
}