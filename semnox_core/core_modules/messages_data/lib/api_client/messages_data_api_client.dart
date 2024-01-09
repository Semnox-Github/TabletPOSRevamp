import 'package:dio/dio.dart';
import 'package:messages_data/models/messages_container/message_response.dart';
import 'package:retrofit/http.dart';


part 'messages_data_api_client.g.dart';

@RestApi()
abstract class MessagesDataApiClient {

  factory MessagesDataApiClient(Dio dio, {String baseUrl}) = _MessagesDataApiClient;

  static const _messageContainerEndPoint = "api/Communication/MessageContainer";

  @GET(_messageContainerEndPoint)
  Future<MessagesResponse> getMessagesContainer(@Queries() Map<String, dynamic> queries);
}
