// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerSearchResponse _$$_CustomerSearchResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerSearchResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CustomerData.fromJson(e as Map<String, dynamic>))
          .toList(),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_CustomerSearchResponseToJson(
        _$_CustomerSearchResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
