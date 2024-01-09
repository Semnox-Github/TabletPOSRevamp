// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_credit_plus_consumption_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountCreditPlusConsumptionDTO _$$_AccountCreditPlusConsumptionDTOFromJson(
        Map<String, dynamic> json) =>
    _$_AccountCreditPlusConsumptionDTO(
      categoryId: json['CategoryId'] as int,
      productId: json['ProductId'] as int,
      orderTypeId: json['OrderTypeId'] as int,
      gameProfileId: (json['GameProfileId'] as num).toDouble(),
      gameId: (json['GameId'] as num).toDouble(),
      discountPercentage: (json['DiscountPercentage'] as num?)?.toDouble(),
      discountAmount: json['DiscountAmount'] as String?,
      discountedPrice: (json['DiscountedPrice'] as num?)?.toDouble(),
      consumptionQty: json['ConsumptionQty'] as int?,
      consumptionBalance: (json['ConsumptionBalance'] as num?)?.toDouble(),
      expiryDate: json['ExpiryDate'] as String?,
      quantityLimit: json['QuantityLimit'] as bool?,
    );

Map<String, dynamic> _$$_AccountCreditPlusConsumptionDTOToJson(
        _$_AccountCreditPlusConsumptionDTO instance) =>
    <String, dynamic>{
      'CategoryId': instance.categoryId,
      'ProductId': instance.productId,
      'OrderTypeId': instance.orderTypeId,
      'GameProfileId': instance.gameProfileId,
      'GameId': instance.gameId,
      'DiscountPercentage': instance.discountPercentage,
      'DiscountAmount': instance.discountAmount,
      'DiscountedPrice': instance.discountedPrice,
      'ConsumptionQty': instance.consumptionQty,
      'ConsumptionBalance': instance.consumptionBalance,
      'ExpiryDate': instance.expiryDate,
      'QuantityLimit': instance.quantityLimit,
    };
