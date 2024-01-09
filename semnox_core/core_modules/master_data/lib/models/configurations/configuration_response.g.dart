// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConfigurationResponse _$$_ConfigurationResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ConfigurationResponse(
      data: json['data'] == null
          ? null
          : ConfigurationData.fromJson(json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_ConfigurationResponseToJson(
        _$_ConfigurationResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
