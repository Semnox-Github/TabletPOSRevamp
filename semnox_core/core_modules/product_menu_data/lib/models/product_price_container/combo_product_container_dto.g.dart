// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_product_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ComboProductContainerDTO _$$_ComboProductContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_ComboProductContainerDTO(
      comboProductId: json['ComboProductId'] as int,
      productId: json['ProductId'] as int,
      childProductId: json['ChildProductId'] as int,
      childProductName: json['ChildProductName'] as String,
      categoryName: json['CategoryName'] as String,
      childProductType: json['ChildProductType'] as String,
      childProductAutoGenerateCardNumber:
          json['ChildProductAutoGenerateCardNumber'] as String,
      quantity: (json['Quantity'] as num).toDouble(),
      categoryId: json['CategoryId'] as int,
      displayGroupId: json['DisplayGroupId'] as int,
      displayGroup: json['DisplayGroup'] as String,
      priceInclusive: json['PriceInclusive'] as bool,
      additionalProduct: json['AdditionalProduct'] as bool,
      sortOrder: json['SortOrder'],
      price: (json['Price'] as num?)?.toDouble(),
      maximumQuantity: json['MaximumQuantity'],
    );

Map<String, dynamic> _$$_ComboProductContainerDTOToJson(
        _$_ComboProductContainerDTO instance) =>
    <String, dynamic>{
      'ComboProductId': instance.comboProductId,
      'ProductId': instance.productId,
      'ChildProductId': instance.childProductId,
      'ChildProductName': instance.childProductName,
      'CategoryName': instance.categoryName,
      'ChildProductType': instance.childProductType,
      'ChildProductAutoGenerateCardNumber':
          instance.childProductAutoGenerateCardNumber,
      'Quantity': instance.quantity,
      'CategoryId': instance.categoryId,
      'DisplayGroupId': instance.displayGroupId,
      'DisplayGroup': instance.displayGroup,
      'PriceInclusive': instance.priceInclusive,
      'AdditionalProduct': instance.additionalProduct,
      'SortOrder': instance.sortOrder,
      'Price': instance.price,
      'MaximumQuantity': instance.maximumQuantity,
    };
