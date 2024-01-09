// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_relationship_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerRelationshipData _$$_CustomerRelationshipDataFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerRelationshipData(
      id: json['Id'] as int?,
      customerId: json['CustomerId'] as int?,
      customerName: json['CustomerName'] as String?,
      relatedCustomerId: json['RelatedCustomerId'] as int?,
      relatedCustomerName: json['RelatedCustomerName'] as String?,
      customerRelationshipTypeId: json['CustomerRelationshipTypeId'] as int?,
      effectiveDate: json['EffectiveDate'] as String?,
      expiryDate: json['ExpiryDate'] as String?,
      isActive: json['IsActive'] as bool?,
      createdBy: json['CreatedBy'] as String?,
      creationDate: json['CreationDate'] as String?,
      lastUpdatedBy: json['LastUpdatedBy'] as String?,
      lastUpdateDate: json['LastUpdateDate'] as String?,
      siteId: json['SiteId'] as int?,
      masterEntityId: json['MasterEntityId'] as int?,
      synchStatus: json['SynchStatus'] as bool?,
      guid: json['Guid'] as String?,
      customerDTO:
          CustomerData.fromJson(json['CustomerDTO'] as Map<String, dynamic>),
      relatedCustomerDTO: CustomerData.fromJson(
          json['RelatedCustomerDTO'] as Map<String, dynamic>),
      isChanged: json['IsChanged'] as bool?,
    );

Map<String, dynamic> _$$_CustomerRelationshipDataToJson(
        _$_CustomerRelationshipData instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'CustomerId': instance.customerId,
      'CustomerName': instance.customerName,
      'RelatedCustomerId': instance.relatedCustomerId,
      'RelatedCustomerName': instance.relatedCustomerName,
      'CustomerRelationshipTypeId': instance.customerRelationshipTypeId,
      'EffectiveDate': instance.effectiveDate,
      'ExpiryDate': instance.expiryDate,
      'IsActive': instance.isActive,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdateDate': instance.lastUpdateDate,
      'SiteId': instance.siteId,
      'MasterEntityId': instance.masterEntityId,
      'SynchStatus': instance.synchStatus,
      'Guid': instance.guid,
      'CustomerDTO': instance.customerDTO,
      'RelatedCustomerDTO': instance.relatedCustomerDTO,
      'IsChanged': instance.isChanged,
    };
