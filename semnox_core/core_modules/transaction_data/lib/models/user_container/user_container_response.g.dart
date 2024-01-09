// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_container_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserContainerResponse _$$_UserContainerResponseFromJson(
        Map<String, dynamic> json) =>
    _$_UserContainerResponse(
      data: json['data'] == null
          ? null
          : UserContainerData.fromJson(json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_UserContainerResponseToJson(
        _$_UserContainerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
