// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_attribute_container_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoyaltyAttributeContainerData _$$_LoyaltyAttributeContainerDataFromJson(
        Map<String, dynamic> json) =>
    _$_LoyaltyAttributeContainerData(
      loyaltyAttributeContainerDTO: (json['LoyaltyAttributeContainerDTOList']
              as List<dynamic>)
          .map((e) =>
              LoyaltyAttributeContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['hash'] as String?,
    );

Map<String, dynamic> _$$_LoyaltyAttributeContainerDataToJson(
        _$_LoyaltyAttributeContainerData instance) =>
    <String, dynamic>{
      'LoyaltyAttributeContainerDTOList': instance.loyaltyAttributeContainerDTO,
      'hash': instance.hash,
    };
