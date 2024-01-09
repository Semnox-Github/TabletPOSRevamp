// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_container_map_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageContainerMapDTO _$$_MessageContainerMapDTOFromJson(
        Map<String, dynamic> json) =>
    _$_MessageContainerMapDTO(
      messages: (json['messages'] as List<dynamic>)
          .map((e) => MessageContainerMap.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MessageContainerMapDTOToJson(
        _$_MessageContainerMapDTO instance) =>
    <String, dynamic>{
      'messages': instance.messages,
    };
