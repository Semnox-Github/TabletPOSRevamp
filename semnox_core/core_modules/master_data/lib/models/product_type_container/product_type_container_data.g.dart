// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_type_container_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductContainerData _$$_ProductContainerDataFromJson(
        Map<String, dynamic> json) =>
    _$_ProductContainerData(
      productTypeContainerDtoList:
          (json['ProductTypeContainerDTOList'] as List<dynamic>?)
              ?.map((e) =>
                  ProductTypeContainerDto.fromJson(e as Map<String, dynamic>))
              .toList(),
      hash: json['Hash'] as String?,
    );

Map<String, dynamic> _$$_ProductContainerDataToJson(
        _$_ProductContainerData instance) =>
    <String, dynamic>{
      'ProductTypeContainerDTOList': instance.productTypeContainerDtoList,
      'Hash': instance.hash,
    };
