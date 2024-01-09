// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_container_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameContainerData _$$_GameContainerDataFromJson(Map<String, dynamic> json) =>
    _$_GameContainerData(
      gameContainerDTOList: (json['GameContainerDTOList'] as List<dynamic>)
          .map((e) => GameContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['Hash'] as String?,
    );

Map<String, dynamic> _$$_GameContainerDataToJson(
        _$_GameContainerData instance) =>
    <String, dynamic>{
      'GameContainerDTOList': instance.gameContainerDTOList,
      'Hash': instance.hash,
    };
