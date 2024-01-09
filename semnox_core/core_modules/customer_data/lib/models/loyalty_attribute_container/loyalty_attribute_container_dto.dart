import 'package:freezed_annotation/freezed_annotation.dart';

part 'loyalty_attribute_container_dto.freezed.dart';
part 'loyalty_attribute_container_dto.g.dart';

@freezed
class LoyaltyAttributeContainerDTO with _$LoyaltyAttributeContainerDTO{
  const factory LoyaltyAttributeContainerDTO({
    @JsonKey(name: 'LoyaltyAttributeId')
    required int loyaltyAttributeId,
    @JsonKey(name: 'Attribute')
    required String attribute,
    @JsonKey(name: 'PurchaseApplicable')
    required String purchaseApplicable,
    @JsonKey(name: 'ConsumptionApplicable')
    required String consumptionApplicable,
    @JsonKey(name: 'DBColumnName')
    required String dBColumnName,
    @JsonKey(name: 'CreditPlusType')
    required String creditPlusType,

  }) = _LoyaltyAttributeContainerDTO;

  factory LoyaltyAttributeContainerDTO.fromJson(Map<String, dynamic> json) => _$LoyaltyAttributeContainerDTOFromJson(json);
}