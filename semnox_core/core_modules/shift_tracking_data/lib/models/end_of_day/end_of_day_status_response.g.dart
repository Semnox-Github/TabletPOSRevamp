// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'end_of_day_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EndOfDayStatus _$$_EndOfDayStatusFromJson(Map<String, dynamic> json) =>
    _$_EndOfDayStatus(
      data: json['data'],
      message: json['Message'] as String?,
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_EndOfDayStatusToJson(_$_EndOfDayStatus instance) =>
    <String, dynamic>{
      'data': instance.data,
      'Message': instance.message,
      'exception': instance.exception,
    };
