// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'contact_dto.freezed.dart';
part 'contact_dto.g.dart';

@freezed
class ContactDTO with _$ContactDTO {

  const factory ContactDTO({
    @JsonKey(name: 'Id')
    required int id,
    @JsonKey(name: 'ProfileId')
    required int profileId,
    @JsonKey(name: 'AddressId')
    required int addressId,
    @JsonKey(name: 'CountryId')
    required int countryId,
    @JsonKey(name: 'ContactSubTypeId')
    required int contactSubTypeId,
    @JsonKey(name: 'ContactTypeId')
    required int contactTypeId,
    @JsonKey(name: 'ContactType')
    required int contactType,
    @JsonKey(name: 'ContactSubType')
    required int contactSubType,
    @JsonKey(name: 'Attribute1')
    required String attribute1,
    @JsonKey(name: 'Attribute2')
    required String attribute2,
    @JsonKey(name: 'IsActive')
    required bool isActive,
    @JsonKey(name: 'IsDefault')
    required bool isDefault,
    @JsonKey(name: 'CreatedBy')
    required String createdBy,
    @JsonKey(name: 'CreationDate')
    required String creationDate,
    @JsonKey(name: 'LastUpdatedBy')
    required String lastUpdatedBy,
    @JsonKey(name: 'LastUpdateDate')
    required String lastUpdateDate,
    @JsonKey(name: 'SiteId')
    required int siteId,
    @JsonKey(name: 'MasterEntityId')
    required int masterEntityId,
    @JsonKey(name: 'SynchStatus')
    required bool synchStatus,
    @JsonKey(name: 'Guid')
    required String guid,
    @JsonKey(name: 'UUID')
    required String uuid,
    @JsonKey(name: 'WhatsAppEnabled')
    required bool whatsAppEnabled,
    @JsonKey(name: 'IsVerified')
    required bool isVerified,
    @JsonKey(name: 'IsChanged')
    required bool isChanged,
  }) =_ContactDTO;

  factory ContactDTO.fromJson(Map<String, Object?> json) =>
      _$ContactDTOFromJson(json);
}
