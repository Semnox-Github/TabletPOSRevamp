// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_search_count_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerSearchCountResponse _$$_CustomerSearchCountResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerSearchCountResponse(
      data: json['data'] as int,
      totalNoOfPages: json['TotalNoOfPages'] as int,
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_CustomerSearchCountResponseToJson(
        _$_CustomerSearchCountResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'TotalNoOfPages': instance.totalNoOfPages,
      'exception': instance.exception,
    };
