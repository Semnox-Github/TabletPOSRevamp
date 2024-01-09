// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status_container_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderStatusContainerResponse _$$_OrderStatusContainerResponseFromJson(
        Map<String, dynamic> json) =>
    _$_OrderStatusContainerResponse(
      data: json['data'] == null
          ? null
          : OrderStatusContainerData.fromJson(
              json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_OrderStatusContainerResponseToJson(
        _$_OrderStatusContainerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
