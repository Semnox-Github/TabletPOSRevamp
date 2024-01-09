// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_printers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ActivePrintersResponse _$$_ActivePrintersResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ActivePrintersResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ActivePrintersData.fromJson(e as Map<String, dynamic>))
          .toList(),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_ActivePrintersResponseToJson(
        _$_ActivePrintersResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
