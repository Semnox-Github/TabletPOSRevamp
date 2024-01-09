// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddressDTO _$$_AddressDTOFromJson(Map<String, dynamic> json) =>
    _$_AddressDTO(
      id: json['Id'] as int,
      profileId: json['ProfileId'] as int,
      addressTypeId: json['AddressTypeId'] as int,
      addressType: json['AddressType'] as int,
      line1: json['Line1'] as String?,
      line2: json['Line2'] as String?,
      line3: json['Line3'] as String?,
      city: json['City'] as String?,
      stateId: json['StateId'] as int,
      countryId: json['CountryId'] as int,
      postalCode: json['PostalCode'] as String?,
      stateCode: json['StateCode'] as String?,
      stateName: json['StateName'] as String?,
      countryName: json['CountryName'] as String?,
      isActive: json['IsActive'] as bool,
      createdBy: json['CreatedBy'] as String?,
      creationDate: json['CreationDate'] as String,
      lastUpdatedBy: json['LastUpdatedBy'] as String?,
      lastUpdateDate: json['LastUpdateDate'] as String,
      siteId: json['SiteId'] as int,
      masterEntityId: json['MasterEntityId'] as int,
      synchStatus: json['SynchStatus'] as bool,
      guid: json['Guid'] as String?,
      isDefault: json['IsDefault'] as bool,
      contactDTOList: (json['ContactDTOList'] as List<dynamic>)
          .map((e) => ContactDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      isChanged: json['IsChanged'] as bool,
      isChangedRecursive: json['IsChangedRecursive'] as bool,
    );

Map<String, dynamic> _$$_AddressDTOToJson(_$_AddressDTO instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'ProfileId': instance.profileId,
      'AddressTypeId': instance.addressTypeId,
      'AddressType': instance.addressType,
      'Line1': instance.line1,
      'Line2': instance.line2,
      'Line3': instance.line3,
      'City': instance.city,
      'StateId': instance.stateId,
      'CountryId': instance.countryId,
      'PostalCode': instance.postalCode,
      'StateCode': instance.stateCode,
      'StateName': instance.stateName,
      'CountryName': instance.countryName,
      'IsActive': instance.isActive,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdateDate': instance.lastUpdateDate,
      'SiteId': instance.siteId,
      'MasterEntityId': instance.masterEntityId,
      'SynchStatus': instance.synchStatus,
      'Guid': instance.guid,
      'IsDefault': instance.isDefault,
      'ContactDTOList': instance.contactDTOList,
      'IsChanged': instance.isChanged,
      'IsChangedRecursive': instance.isChangedRecursive,
    };
