// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_container_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameContainerResponse _$$_GameContainerResponseFromJson(
        Map<String, dynamic> json) =>
    _$_GameContainerResponse(
      data: json['data'] == null
          ? null
          : GameContainerData.fromJson(json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_GameContainerResponseToJson(
        _$_GameContainerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
