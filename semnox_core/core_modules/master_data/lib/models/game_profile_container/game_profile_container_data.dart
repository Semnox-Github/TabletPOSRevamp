
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/game_profile_container/game_profile_container_dto.dart';

part 'game_profile_container_data.freezed.dart';
part 'game_profile_container_data.g.dart';

@freezed
class GameProfileContainerData with _$GameProfileContainerData{
  const factory GameProfileContainerData({
    @JsonKey(name: 'GameProfileContainerDTOList')
    required List<GameProfileContainerDTO> gameProfileContainerDTOList,
    @JsonKey(name: 'Hash')
    String? hash,
  }) = _GameProfileContainerData;

  factory GameProfileContainerData.fromJson(Map<String, dynamic> json) => _$GameProfileContainerDataFromJson(json);
}