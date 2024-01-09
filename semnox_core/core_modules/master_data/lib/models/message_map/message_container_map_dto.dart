import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/message_map/message_container_map.dart';

part 'message_container_map_dto.freezed.dart';
part 'message_container_map_dto.g.dart';

@freezed
class MessageContainerMapDTO with _$MessageContainerMapDTO {

  const factory MessageContainerMapDTO({
    required List<MessageContainerMap> messages
  }) = _MessageContainerMapDTO;

  factory MessageContainerMapDTO.fromJson(Map<String, Object?> json) =>
      _$MessageContainerMapDTOFromJson(json);
}