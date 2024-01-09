// ignore_for_file: invalid_annotation_target

import 'package:customer_data/models/customer_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_relationship_data.freezed.dart';
part 'customer_relationship_data.g.dart';

@freezed
class CustomerRelationshipData with _$CustomerRelationshipData {
  const factory CustomerRelationshipData({
    @JsonKey(name: 'Id')
    int? id,
    @JsonKey(name: 'CustomerId')
    int? customerId,
    @JsonKey(name: 'CustomerName')
    String? customerName,
    @JsonKey(name: 'RelatedCustomerId')
    int? relatedCustomerId,
    @JsonKey(name: 'RelatedCustomerName')
    String? relatedCustomerName,
    @JsonKey(name: 'CustomerRelationshipTypeId')
    int? customerRelationshipTypeId,
    @JsonKey(name: 'EffectiveDate')
    String? effectiveDate,
    @JsonKey(name: 'ExpiryDate')
    String? expiryDate,
    @JsonKey(name: 'IsActive')
    bool? isActive,
    @JsonKey(name: 'CreatedBy')
    String? createdBy,
    @JsonKey(name: 'CreationDate')
    String? creationDate,
    @JsonKey(name: 'LastUpdatedBy')
    String? lastUpdatedBy,
    @JsonKey(name: 'LastUpdateDate')
    String? lastUpdateDate,
    @JsonKey(name: 'SiteId')
    int? siteId,
    @JsonKey(name: 'MasterEntityId')
    int? masterEntityId,
    @JsonKey(name: 'SynchStatus')
    bool? synchStatus,
    @JsonKey(name: 'Guid')
    String? guid,
    @JsonKey(name: 'CustomerDTO')
    required CustomerData customerDTO,
    @JsonKey(name: 'RelatedCustomerDTO')
    required CustomerData relatedCustomerDTO,
    @JsonKey(name: 'IsChanged')
    bool? isChanged,

  }) = _CustomerRelationshipData;

  factory CustomerRelationshipData.fromJson(Map<String, dynamic> json) => _$CustomerRelationshipDataFromJson(json);

}