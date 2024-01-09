// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_container_dto.freezed.dart';
part 'message_container_dto.g.dart';

@freezed
class MessageContainerDTO with _$MessageContainerDTO {
  const factory MessageContainerDTO({
    @JsonKey(name: 'MessageId')
    required int messageId,
    @JsonKey(name: 'MessageNumber')
    required int messageNumber,
    @JsonKey(name: 'Message')
    required String message,
    @JsonKey(name: 'TranslatedMessage')
    required String translatedMessage,
  }) = _MessageContainerDTO;

  factory MessageContainerDTO.fromJson(Map<String, dynamic> json) => _$MessageContainerDTOFromJson(json);
}