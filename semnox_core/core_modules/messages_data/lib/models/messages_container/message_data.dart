
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messages_data/models/messages_container/message_container_dto.dart';

part 'message_data.freezed.dart';
part 'message_data.g.dart';

@freezed
class MessageData with _$MessageData {
  const factory MessageData({
    @JsonKey(name: 'MessageContainerDTOList')
    required List<MessageContainerDTO> messageContainerDTOList,
    @JsonKey(name: 'Hash')
    String? hash,
  }) = _MessageData;

  factory MessageData.fromJson(Map<String, dynamic> json) => _$MessageDataFromJson(json);
}