// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_relationship_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateRelationshipRequest _$$_UpdateRelationshipRequestFromJson(
        Map<String, dynamic> json) =>
    _$_UpdateRelationshipRequest(
      customerId: json['CustomerId'] as int?,
      customerName: json['CustomerName'] as String?,
      relatedCustomerId: json['RelatedCustomerId'] as int?,
      relatedCustomerName: json['RelatedCustomerName'] as String?,
      customerRelationshipTypeId: json['CustomerRelationshipTypeId'] as int?,
      effectiveDate: json['EffectiveDate'],
      expiryDate: json['ExpiryDate'],
      isActive: json['IsActive'] as bool?,
      customerDto: json['CustomerDTO'],
      relatedCustomerDto: json['RelatedCustomerDTO'],
      isChanged: json['IsChanged'] as bool?,
    );

Map<String, dynamic> _$$_UpdateRelationshipRequestToJson(
        _$_UpdateRelationshipRequest instance) =>
    <String, dynamic>{
      'CustomerId': instance.customerId,
      'CustomerName': instance.customerName,
      'RelatedCustomerId': instance.relatedCustomerId,
      'RelatedCustomerName': instance.relatedCustomerName,
      'CustomerRelationshipTypeId': instance.customerRelationshipTypeId,
      'EffectiveDate': instance.effectiveDate,
      'ExpiryDate': instance.expiryDate,
      'IsActive': instance.isActive,
      'CustomerDTO': instance.customerDto,
      'RelatedCustomerDTO': instance.relatedCustomerDto,
      'IsChanged': instance.isChanged,
    };
