// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContactDTO _$$_ContactDTOFromJson(Map<String, dynamic> json) =>
    _$_ContactDTO(
      id: json['Id'] as int,
      profileId: json['ProfileId'] as int,
      addressId: json['AddressId'] as int,
      countryId: json['CountryId'] as int,
      contactSubTypeId: json['ContactSubTypeId'] as int,
      contactTypeId: json['ContactTypeId'] as int,
      contactType: json['ContactType'] as int,
      contactSubType: json['ContactSubType'] as int,
      attribute1: json['Attribute1'] as String,
      attribute2: json['Attribute2'] as String,
      isActive: json['IsActive'] as bool,
      isDefault: json['IsDefault'] as bool,
      createdBy: json['CreatedBy'] as String,
      creationDate: json['CreationDate'] as String,
      lastUpdatedBy: json['LastUpdatedBy'] as String,
      lastUpdateDate: json['LastUpdateDate'] as String,
      siteId: json['SiteId'] as int,
      masterEntityId: json['MasterEntityId'] as int,
      synchStatus: json['SynchStatus'] as bool,
      guid: json['Guid'] as String,
      uuid: json['UUID'] as String,
      whatsAppEnabled: json['WhatsAppEnabled'] as bool,
      isVerified: json['IsVerified'] as bool,
      isChanged: json['IsChanged'] as bool,
    );

Map<String, dynamic> _$$_ContactDTOToJson(_$_ContactDTO instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'ProfileId': instance.profileId,
      'AddressId': instance.addressId,
      'CountryId': instance.countryId,
      'ContactSubTypeId': instance.contactSubTypeId,
      'ContactTypeId': instance.contactTypeId,
      'ContactType': instance.contactType,
      'ContactSubType': instance.contactSubType,
      'Attribute1': instance.attribute1,
      'Attribute2': instance.attribute2,
      'IsActive': instance.isActive,
      'IsDefault': instance.isDefault,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdateDate': instance.lastUpdateDate,
      'SiteId': instance.siteId,
      'MasterEntityId': instance.masterEntityId,
      'SynchStatus': instance.synchStatus,
      'Guid': instance.guid,
      'UUID': instance.uuid,
      'WhatsAppEnabled': instance.whatsAppEnabled,
      'IsVerified': instance.isVerified,
      'IsChanged': instance.isChanged,
    };
