// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_type_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskTypeContainerResponse _$$_TaskTypeContainerResponseFromJson(
        Map<String, dynamic> json) =>
    _$_TaskTypeContainerResponse(
      data: json['data'] == null
          ? null
          : TaskTypeData.fromJson(json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_TaskTypeContainerResponseToJson(
        _$_TaskTypeContainerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
