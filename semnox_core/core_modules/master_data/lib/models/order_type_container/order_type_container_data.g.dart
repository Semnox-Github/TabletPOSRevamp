// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_type_container_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderTypeContainerData _$$_OrderTypeContainerDataFromJson(
        Map<String, dynamic> json) =>
    _$_OrderTypeContainerData(
      orderTypeContainerDTOList: (json['OrderTypeContainerDTOList']
              as List<dynamic>)
          .map((e) => OrderTypeContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['Hash'] as String?,
    );

Map<String, dynamic> _$$_OrderTypeContainerDataToJson(
        _$_OrderTypeContainerData instance) =>
    <String, dynamic>{
      'OrderTypeContainerDTOList': instance.orderTypeContainerDTOList,
      'Hash': instance.hash,
    };
