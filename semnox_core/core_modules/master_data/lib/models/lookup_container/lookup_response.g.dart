// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LookupResponse _$$_LookupResponseFromJson(Map<String, dynamic> json) =>
    _$_LookupResponse(
      data: json['data'] == null
          ? null
          : LookupData.fromJson(json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_LookupResponseToJson(_$_LookupResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
