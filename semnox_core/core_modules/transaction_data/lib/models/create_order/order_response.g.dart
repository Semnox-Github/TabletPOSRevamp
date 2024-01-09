// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_COrderResponse _$$_COrderResponseFromJson(Map<String, dynamic> json) =>
    _$_COrderResponse(
      data: json['data'] == null
          ? null
          : OrderData.fromJson(json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_COrderResponseToJson(_$_COrderResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
