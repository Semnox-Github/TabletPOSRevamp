// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerResponse _$$_CustomerResponseFromJson(Map<String, dynamic> json) =>
    _$_CustomerResponse(
      data: json['data'] == null
          ? null
          : CustomerData.fromJson(json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_CustomerResponseToJson(_$_CustomerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
