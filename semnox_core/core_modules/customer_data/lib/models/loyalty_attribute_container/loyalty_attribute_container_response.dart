import 'package:customer_data/models/loyalty_attribute_container/loyalty_attribute_container_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loyalty_attribute_container_response.freezed.dart';
part 'loyalty_attribute_container_response.g.dart';

@freezed
class LoyaltyAttributeContainerResponse with _$LoyaltyAttributeContainerResponse{
  const factory LoyaltyAttributeContainerResponse({
    LoyaltyAttributeContainerData? data,
    String? exception

  }) = _LoyaltyAttributeContainerResponse;

  factory LoyaltyAttributeContainerResponse.fromJson(Map<String, dynamic> json) => _$LoyaltyAttributeContainerResponseFromJson(json);
}