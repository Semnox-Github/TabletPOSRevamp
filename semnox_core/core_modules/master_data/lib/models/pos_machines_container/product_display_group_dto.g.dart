// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_display_group_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductDisplayGroupFormatContainerDTO
    _$$_ProductDisplayGroupFormatContainerDTOFromJson(
            Map<String, dynamic> json) =>
        _$_ProductDisplayGroupFormatContainerDTO(
          id: json['Id'] as int,
          displayGroup: json['DisplayGroup'] as String?,
          buttonColor: json['ButtonColor'] as String,
          textColor: json['TextColor'] as String,
          font: json['Font'] as String,
          description: json['Description'] as String,
          externalSourceReference: json['ExternalSourceReference'] as String,
          sortOrder: json['SortOrder'] as int,
          imageUrl: json['ImageUrl'] as String,
          productIdList: json['ProductIdList'],
          productsDisplayGroupContainerDTOList:
              json['ProductsDisplayGroupContainerDTOList'] as List<dynamic>?,
        );

Map<String, dynamic> _$$_ProductDisplayGroupFormatContainerDTOToJson(
        _$_ProductDisplayGroupFormatContainerDTO instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'DisplayGroup': instance.displayGroup,
      'ButtonColor': instance.buttonColor,
      'TextColor': instance.textColor,
      'Font': instance.font,
      'Description': instance.description,
      'ExternalSourceReference': instance.externalSourceReference,
      'SortOrder': instance.sortOrder,
      'ImageUrl': instance.imageUrl,
      'ProductIdList': instance.productIdList,
      'ProductsDisplayGroupContainerDTOList':
          instance.productsDisplayGroupContainerDTOList,
    };
