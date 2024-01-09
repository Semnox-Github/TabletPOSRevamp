// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_bonus_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoadBonusResponse _$$_LoadBonusResponseFromJson(Map<String, dynamic> json) =>
    _$_LoadBonusResponse(
      data: json['data'] == null
          ? null
          : LoadBonusData.fromJson(json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_LoadBonusResponseToJson(
        _$_LoadBonusResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
