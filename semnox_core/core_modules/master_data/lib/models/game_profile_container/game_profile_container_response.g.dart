// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_profile_container_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameProfileContainerResponse _$$_GameProfileContainerResponseFromJson(
        Map<String, dynamic> json) =>
    _$_GameProfileContainerResponse(
      data: json['data'] == null
          ? null
          : GameProfileContainerData.fromJson(
              json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_GameProfileContainerResponseToJson(
        _$_GameProfileContainerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
