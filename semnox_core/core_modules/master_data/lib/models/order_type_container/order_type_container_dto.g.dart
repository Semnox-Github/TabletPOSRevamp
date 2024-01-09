// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_type_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderTypeContainerDTO _$$_OrderTypeContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_OrderTypeContainerDTO(
      orderTypeId: json['OrderTypeId'] as int?,
      name: json['Name'] as String?,
      description: json['Description'] as String?,
    );

Map<String, dynamic> _$$_OrderTypeContainerDTOToJson(
        _$_OrderTypeContainerDTO instance) =>
    <String, dynamic>{
      'OrderTypeId': instance.orderTypeId,
      'Name': instance.name,
      'Description': instance.description,
    };
