// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_relationship_request.freezed.dart';
part 'update_relationship_request.g.dart';

@freezed
class UpdateRelationshipRequest with _$UpdateRelationshipRequest {
  const factory UpdateRelationshipRequest({
    @JsonKey(name: 'CustomerId')
    required int? customerId,
    @JsonKey(name: 'CustomerName')
    required String? customerName,
    @JsonKey(name: 'RelatedCustomerId')
    required int? relatedCustomerId,
    @JsonKey(name: 'RelatedCustomerName')
    required String? relatedCustomerName,
    @JsonKey(name: 'CustomerRelationshipTypeId')
    required int? customerRelationshipTypeId,
    @JsonKey(name: 'EffectiveDate')
    required dynamic effectiveDate,
    @JsonKey(name: 'ExpiryDate')
    required dynamic expiryDate,
    @JsonKey(name: 'IsActive')
    required bool? isActive,
    @JsonKey(name: 'CustomerDTO')
    required dynamic customerDto,
    @JsonKey(name: 'RelatedCustomerDTO')
    required dynamic relatedCustomerDto,
    @JsonKey(name: 'IsChanged')
    required bool? isChanged,
  }) = _UpdateRelationshipRequest;

  factory UpdateRelationshipRequest.fromJson(Map<String, dynamic> json) => _$UpdateRelationshipRequestFromJson(json);
}