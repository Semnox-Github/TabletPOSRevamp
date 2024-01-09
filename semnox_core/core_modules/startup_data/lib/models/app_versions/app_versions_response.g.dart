// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_versions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppVersionsResponse _$$_AppVersionsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_AppVersionsResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AppVersionsData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['Message'] as String?,
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_AppVersionsResponseToJson(
        _$_AppVersionsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'Message': instance.message,
      'exception': instance.exception,
    };
