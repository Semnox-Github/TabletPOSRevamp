// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_attribute_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoyaltyAttributeContainerDTO _$$_LoyaltyAttributeContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_LoyaltyAttributeContainerDTO(
      loyaltyAttributeId: json['LoyaltyAttributeId'] as int,
      attribute: json['Attribute'] as String,
      purchaseApplicable: json['PurchaseApplicable'] as String,
      consumptionApplicable: json['ConsumptionApplicable'] as String,
      dBColumnName: json['DBColumnName'] as String,
      creditPlusType: json['CreditPlusType'] as String,
    );

Map<String, dynamic> _$$_LoyaltyAttributeContainerDTOToJson(
        _$_LoyaltyAttributeContainerDTO instance) =>
    <String, dynamic>{
      'LoyaltyAttributeId': instance.loyaltyAttributeId,
      'Attribute': instance.attribute,
      'PurchaseApplicable': instance.purchaseApplicable,
      'ConsumptionApplicable': instance.consumptionApplicable,
      'DBColumnName': instance.dBColumnName,
      'CreditPlusType': instance.creditPlusType,
    };
