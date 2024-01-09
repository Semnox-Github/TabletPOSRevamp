// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderStatusContainerDTO _$$_OrderStatusContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_OrderStatusContainerDTO(
      orderStatusId: json['OrderStatusId'] as int,
      orderStatus: json['OrderStatus'] as String,
      guid: json['Guid'] as String,
    );

Map<String, dynamic> _$$_OrderStatusContainerDTOToJson(
        _$_OrderStatusContainerDTO instance) =>
    <String, dynamic>{
      'OrderStatusId': instance.orderStatusId,
      'OrderStatus': instance.orderStatus,
      'Guid': instance.guid,
    };
