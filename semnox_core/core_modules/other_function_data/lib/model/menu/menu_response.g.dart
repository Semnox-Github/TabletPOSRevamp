// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuResponse _$$_MenuResponseFromJson(Map<String, dynamic> json) =>
    _$_MenuResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MenuDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_MenuResponseToJson(_$_MenuResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
