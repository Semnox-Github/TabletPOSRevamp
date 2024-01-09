
import 'package:messages_data/messages_data_service.dart';
import 'package:messages_data/models/messages_container/message_response.dart';

abstract class MessagesDataBLContract {
  Future<MessagesResponse?> sync();
  Future<void> syncFromLocal();
  String? getMessage(String key);
  void clear();
}

class MessagesDataBLImpl implements MessagesDataBLContract {

  final MessagesDataService _messagesDataService;

  MessagesDataBLImpl(this._messagesDataService);

  @override
  Future<MessagesResponse?> sync() {
    return _messagesDataService.sync();
  }

  @override
  Future<void> syncFromLocal() async {
    await _messagesDataService.syncFromLocal();
  }

  @override
  String? getMessage(String key) {
    return _messagesDataService.getMessage(key);
  }

  @override
  void clear() {
    _messagesDataService.clear();
  }
}
