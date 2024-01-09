// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_container_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryContainerResponse _$$_CategoryContainerResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CategoryContainerResponse(
      data: json['data'] == null
          ? null
          : CategoryContainerData.fromJson(
              json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_CategoryContainerResponseToJson(
        _$_CategoryContainerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
