// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_serial_numbers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CardSerialNumbersResponse _$$_CardSerialNumbersResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CardSerialNumbersResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CardSerialNumberData.fromJson(e as Map<String, dynamic>))
          .toList(),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_CardSerialNumbersResponseToJson(
        _$_CardSerialNumbersResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
