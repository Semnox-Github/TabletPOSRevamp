// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'package:customer_data/models/address_dto.dart';
import 'package:customer_data/models/contact_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'profile_dto.freezed.dart';
part 'profile_dto.g.dart';

@freezed
class ProfileDTO with _$ProfileDTO {

  const factory ProfileDTO({
    @JsonKey(name: 'Id')
    required int id,
    @JsonKey(name: 'ProfileTypeId')
    required int profileTypeId,
    @JsonKey(name: 'ProfileType')
    required int profileType,
    @JsonKey(name: 'Title')
    required String? title,
    @JsonKey(name: 'FirstName')
    required String? firstName,
    @JsonKey(name: 'NickName')
    required String? nickName,
    @JsonKey(name: 'MiddleName')
    required String? middleName,
    @JsonKey(name: 'LastName')
    required String? lastName,
    @JsonKey(name: 'Notes')
    required String? notes,
    @JsonKey(name: 'DateOfBirth')
    String? dateOfBirth,
    @JsonKey(name: 'Gender')
    required String? gender,
    @JsonKey(name: 'Anniversary')
    String? anniversary,
    @JsonKey(name: 'PhotoURL')
    required String? photoURL,
    @JsonKey(name: 'RightHanded')
    required bool rightHanded,
    @JsonKey(name: 'TeamUser')
    required bool teamUser,
    @JsonKey(name: 'UniqueIdentifier')
    required String? uniqueIdentifier,
    @JsonKey(name: 'IdProofFileURL')
    required String? idProofFileURL,
    @JsonKey(name: 'TaxCode')
    required String? taxCode,
    @JsonKey(name: 'Designation')
    required String? designation,
    @JsonKey(name: 'Company')
    required String? company,
    @JsonKey(name: 'UserName')
    required String? userName,
    @JsonKey(name: 'Password')
    required String? password,
    @JsonKey(name: 'LastLoginTime')
    String? lastLoginTime,
    @JsonKey(name: 'ContactDTOList')
    List<ContactDTO>? contactDTOList,
    @JsonKey(name: 'AddressDTOList')
    List<AddressDTO>? addressDTOList,
    @JsonKey(name: 'ProfileContentHistoryDTOList')
    dynamic profileContentHistoryDTOList,
    @JsonKey(name: 'OptInPromotions')
    required bool optInPromotions,
    @JsonKey(name: 'OptInPromotionsMode')
    required String? optInPromotionsMode,
    @JsonKey(name: 'OptInLastUpdatedDate')
    String? optInLastUpdatedDate,
    @JsonKey(name: 'PolicyTermsAccepted')
    required bool policyTermsAccepted,
    @JsonKey(name: 'IsActive')
    required bool isActive,
    @JsonKey(name: 'CreatedBy')
    required String? createdBy,
    @JsonKey(name: 'CreationDate')
    required String? creationDate,
    @JsonKey(name: 'LastUpdatedBy')
    required String? lastUpdatedBy,
    @JsonKey(name: 'LastUpdateDate')
    required String? lastUpdateDate,
    @JsonKey(name: 'SiteId')
    required int siteId,
    @JsonKey(name: 'MasterEntityId')
    required int masterEntityId,
    @JsonKey(name: 'SynchStatus')
    required bool synchStatus,
    @JsonKey(name: 'Guid')
    required String? guid,
    @JsonKey(name: 'ExternalSystemReference')
    required String? externalSystemReference,
    @JsonKey(name: 'OptOutWhatsApp')
    required bool optOutWhatsApp,
    @JsonKey(name: 'UserStatus')
    required String? userStatus,
    @JsonKey(name: 'PasswordChangeDate')
    String? passwordChangeDate,
    @JsonKey(name: 'InvalidAccessAttempts')
    required int invalidAccessAttempts,
    @JsonKey(name: 'LockedOutTime')
    String? lockedOutTime,
    @JsonKey(name: 'PasswordChangeOnNextLogin')
    required bool passwordChangeOnNextLogin,
    @JsonKey(name: 'IsChanged')
    required bool isChanged,
    @JsonKey(name: 'IsChangedRecursive')
    required bool isChangedRecursive,
    @JsonKey(name: 'Channel')
    String? channel,
    @JsonKey(name: 'Verified')
    bool? verified,
  }) =_ProfileDTO;

  factory ProfileDTO.fromJson(Map<String, Object?> json) =>
      _$ProfileDTOFromJson(json);
}
