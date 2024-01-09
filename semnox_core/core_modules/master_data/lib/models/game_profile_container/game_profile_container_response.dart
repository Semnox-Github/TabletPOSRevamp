import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/game_profile_container/game_profile_container_data.dart';
part 'game_profile_container_response.freezed.dart';
part 'game_profile_container_response.g.dart';

@freezed
class GameProfileContainerResponse with _$GameProfileContainerResponse {
  const factory GameProfileContainerResponse({
    GameProfileContainerData? data,
    String? exception
  }) = _GameProfileContainerResponse;

  factory GameProfileContainerResponse.fromJson(Map<String, dynamic> json) => _$GameProfileContainerResponseFromJson(json);
}