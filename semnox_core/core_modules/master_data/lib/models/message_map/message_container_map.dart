import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_container_map.freezed.dart';
part 'message_container_map.g.dart';

@freezed
class MessageContainerMap with _$MessageContainerMap {

  const factory MessageContainerMap({
    required int messageId,
    required String message
  }) = _MessageContainerMap;

  factory MessageContainerMap.fromJson(Map<String, Object?> json) =>
      _$MessageContainerMapFromJson(json);
}