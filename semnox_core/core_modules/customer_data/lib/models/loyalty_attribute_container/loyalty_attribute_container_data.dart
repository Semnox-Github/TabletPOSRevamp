import 'package:customer_data/models/loyalty_attribute_container/loyalty_attribute_container_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loyalty_attribute_container_data.freezed.dart';
part 'loyalty_attribute_container_data.g.dart';

@freezed
class LoyaltyAttributeContainerData with _$LoyaltyAttributeContainerData{
  const factory LoyaltyAttributeContainerData({
    @JsonKey(name: 'LoyaltyAttributeContainerDTOList')
    required List<LoyaltyAttributeContainerDTO> loyaltyAttributeContainerDTO,
    String? hash,

  }) = _LoyaltyAttributeContainerData;

  factory LoyaltyAttributeContainerData.fromJson(Map<String, dynamic> json) => _$LoyaltyAttributeContainerDataFromJson(json);
}