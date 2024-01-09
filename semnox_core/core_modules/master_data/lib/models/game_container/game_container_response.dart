import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/game_container/game_container_data.dart';
part 'game_container_response.freezed.dart';
part 'game_container_response.g.dart';

@freezed
class GameContainerResponse with _$GameContainerResponse {
  const factory GameContainerResponse({
    GameContainerData? data,
    String? exception
  }) = _GameContainerResponse;

  factory GameContainerResponse.fromJson(Map<String, dynamic> json) => _$GameContainerResponseFromJson(json);
}