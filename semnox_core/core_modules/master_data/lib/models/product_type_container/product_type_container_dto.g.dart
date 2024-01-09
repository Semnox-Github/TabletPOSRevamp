// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_type_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductTypeContainerDto _$$_ProductTypeContainerDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ProductTypeContainerDto(
      productTypeId: json['ProductTypeId'] as int?,
      productType: json['ProductType'] as String?,
      description: json['Description'] as String?,
      cardSale: json['CardSale'] as bool?,
      reportGroup: json['ReportGroup'] as String?,
      orderTypeId: json['OrderTypeId'] as int?,
    );

Map<String, dynamic> _$$_ProductTypeContainerDtoToJson(
        _$_ProductTypeContainerDto instance) =>
    <String, dynamic>{
      'ProductTypeId': instance.productTypeId,
      'ProductType': instance.productType,
      'Description': instance.description,
      'CardSale': instance.cardSale,
      'ReportGroup': instance.reportGroup,
      'OrderTypeId': instance.orderTypeId,
    };
