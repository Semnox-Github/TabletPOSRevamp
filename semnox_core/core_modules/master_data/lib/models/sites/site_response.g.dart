// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SiteResponse _$$_SiteResponseFromJson(Map<String, dynamic> json) =>
    _$_SiteResponse(
      data: json['data'] == null
          ? null
          : SiteList.fromJson(json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_SiteResponseToJson(_$_SiteResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
