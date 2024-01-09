
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messages_data/models/messages_container/message_data.dart';

part 'message_response.freezed.dart';
part 'message_response.g.dart';

@freezed
class MessagesResponse with _$MessagesResponse {
  const factory MessagesResponse({
    MessageData? data,
    String? exception
  }) = _MessagesResponse;

  factory MessagesResponse.fromJson(Map<String, dynamic> json) => _$MessagesResponseFromJson(json);
}