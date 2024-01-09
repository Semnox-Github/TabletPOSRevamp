// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status_container_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderStatusContainerData _$$_OrderStatusContainerDataFromJson(
        Map<String, dynamic> json) =>
    _$_OrderStatusContainerData(
      orderStatusContainerDTOList:
          (json['OrderStatusContainerDTOList'] as List<dynamic>)
              .map((e) =>
                  OrderStatusContainerDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
      hash: json['Hash'] as String?,
    );

Map<String, dynamic> _$$_OrderStatusContainerDataToJson(
        _$_OrderStatusContainerData instance) =>
    <String, dynamic>{
      'OrderStatusContainerDTOList': instance.orderStatusContainerDTOList,
      'Hash': instance.hash,
    };
