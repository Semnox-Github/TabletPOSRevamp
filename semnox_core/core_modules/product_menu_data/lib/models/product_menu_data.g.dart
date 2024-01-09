// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_menu_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductMenuData _$$_ProductMenuDataFromJson(Map<String, dynamic> json) =>
    _$_ProductMenuData(
      productMenuContainerSnapshotDTOList:
          (json['ProductMenuContainerSnapshotDTOList'] as List<dynamic>)
              .map((e) => ProductMenuContainerSnapshotDTO.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      hash: json['Hash'] as String?,
    );

Map<String, dynamic> _$$_ProductMenuDataToJson(_$_ProductMenuData instance) =>
    <String, dynamic>{
      'ProductMenuContainerSnapshotDTOList':
          instance.productMenuContainerSnapshotDTOList,
      'Hash': instance.hash,
    };
