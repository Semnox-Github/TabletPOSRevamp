
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/game_container/game_container_dto.dart';

part 'game_container_data.freezed.dart';
part 'game_container_data.g.dart';

@freezed
class GameContainerData with _$GameContainerData{
  const factory GameContainerData({
    @JsonKey(name: 'GameContainerDTOList')
    required List<GameContainerDTO> gameContainerDTOList,
    @JsonKey(name: 'Hash')
    String? hash,
  }) = _GameContainerData;

  factory GameContainerData.fromJson(Map<String, dynamic> json) => _$GameContainerDataFromJson(json);

}