// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'package:customer_data/models/contact_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'address_dto.freezed.dart';
part 'address_dto.g.dart';

@freezed
class AddressDTO with _$AddressDTO {

  const factory AddressDTO({
    @JsonKey(name: 'Id')
    required int id,
    @JsonKey(name: 'ProfileId')
    required int profileId,
    @JsonKey(name: 'AddressTypeId')
    required int addressTypeId,
    @JsonKey(name: 'AddressType')
    required int addressType,
    @JsonKey(name: 'Line1')
    String? line1,
    @JsonKey(name: 'Line2')
    String? line2,
    @JsonKey(name: 'Line3')
    String? line3,
    @JsonKey(name: 'City')
    String? city,
    @JsonKey(name: 'StateId')
    required int stateId,
    @JsonKey(name: 'CountryId')
    required int countryId,
    @JsonKey(name: 'PostalCode')
    String? postalCode,
    @JsonKey(name: 'StateCode')
    String? stateCode,
    @JsonKey(name: 'StateName')
    String? stateName,
    @JsonKey(name: 'CountryName')
    String? countryName,
    @JsonKey(name: 'IsActive')
    required bool isActive,
    @JsonKey(name: 'CreatedBy')
    String? createdBy,
    @JsonKey(name: 'CreationDate')
    required String creationDate,
    @JsonKey(name: 'LastUpdatedBy')
    String? lastUpdatedBy,
    @JsonKey(name: 'LastUpdateDate')
    required String lastUpdateDate,
    @JsonKey(name: 'SiteId')
    required int siteId,
    @JsonKey(name: 'MasterEntityId')
    required int masterEntityId,
    @JsonKey(name: 'SynchStatus')
    required bool synchStatus,
    @JsonKey(name: 'Guid')
    String? guid,
    @JsonKey(name: 'IsDefault')
    required bool isDefault,
    @JsonKey(name: 'ContactDTOList')
    required List<ContactDTO> contactDTOList,
    @JsonKey(name: 'IsChanged')
    required bool isChanged,
    @JsonKey(name: 'IsChangedRecursive')
    required bool isChangedRecursive,
  }) =_AddressDTO;

  factory AddressDTO.fromJson(Map<String, Object?> json) =>
      _$AddressDTOFromJson(json);
}
