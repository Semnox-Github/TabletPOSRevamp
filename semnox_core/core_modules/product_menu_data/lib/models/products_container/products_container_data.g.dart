// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_container_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductsContainerData _$$_ProductsContainerDataFromJson(
        Map<String, dynamic> json) =>
    _$_ProductsContainerData(
      productContainerDTOList: (json['ProductContainerDTOList']
              as List<dynamic>)
          .map((e) => ProductContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['Hash'] as String?,
    );

Map<String, dynamic> _$$_ProductsContainerDataToJson(
        _$_ProductsContainerData instance) =>
    <String, dynamic>{
      'ProductContainerDTOList': instance.productContainerDTOList,
      'Hash': instance.hash,
    };
