// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_type_container_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderTypeContainerResponse _$$_OrderTypeContainerResponseFromJson(
        Map<String, dynamic> json) =>
    _$_OrderTypeContainerResponse(
      data: json['data'] == null
          ? null
          : OrderTypeContainerData.fromJson(
              json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_OrderTypeContainerResponseToJson(
        _$_OrderTypeContainerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
