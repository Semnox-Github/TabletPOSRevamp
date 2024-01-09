// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_profile_container_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameProfileContainerData _$$_GameProfileContainerDataFromJson(
        Map<String, dynamic> json) =>
    _$_GameProfileContainerData(
      gameProfileContainerDTOList:
          (json['GameProfileContainerDTOList'] as List<dynamic>)
              .map((e) =>
                  GameProfileContainerDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
      hash: json['Hash'] as String?,
    );

Map<String, dynamic> _$$_GameProfileContainerDataToJson(
        _$_GameProfileContainerData instance) =>
    <String, dynamic>{
      'GameProfileContainerDTOList': instance.gameProfileContainerDTOList,
      'Hash': instance.hash,
    };
