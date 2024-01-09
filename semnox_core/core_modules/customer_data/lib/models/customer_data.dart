// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'package:customer_data/models/address_dto.dart';
import 'package:customer_data/models/contact_dto.dart';
import 'package:customer_data/models/custom_data_set_dto.dart';
import 'package:customer_data/models/profile_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'customer_data.freezed.dart';
part 'customer_data.g.dart';

@freezed
class CustomerData with _$CustomerData {

  const factory CustomerData({
    @JsonKey(name: 'Id')
    required int id,
    @JsonKey(name: 'IsActive')
    required bool isActive,
    @JsonKey(name: 'IsBonusLoaded')
    required bool isBonusLoaded,
    @JsonKey(name: 'ProfileId')
    required int profileId,
    @JsonKey(name: 'MembershipId')
    required int membershipId,
    @JsonKey(name: 'Title')
     String? title,
    @JsonKey(name: 'FirstName')
    required String? firstName,
    @JsonKey(name: 'NickName')
    required String? nickName,
    @JsonKey(name: 'MiddleName')
    required String? middleName,
    @JsonKey(name: 'LastName')
    required String? lastName,
    @JsonKey(name: 'ExternalSystemReference')
    required String? externalSystemReference,
    @JsonKey(name: 'CustomerType')
    required int customerType,
    @JsonKey(name: 'UniqueIdentifier')
    required String? uniqueIdentifier,
    @JsonKey(name: 'TaxCode')
    required String? taxCode,
    @JsonKey(name: 'DateOfBirth')
    String? dateOfBirth,
    @JsonKey(name: 'Gender')
    required String? gender,
    @JsonKey(name: 'Anniversary')
    String? anniversary,
    @JsonKey(name: 'TeamUser')
    required bool teamUser,
    @JsonKey(name: 'RightHanded')
    required bool rightHanded,
    @JsonKey(name: 'OptInPromotions')
    required bool optInPromotions,
    @JsonKey(name: 'OptInPromotionsMode')
    required String? optInPromotionsMode,
    @JsonKey(name: 'PolicyTermsAccepted')
    required bool policyTermsAccepted,
    @JsonKey(name: 'Company')
    required String? company,
    @JsonKey(name: 'UserName')
    required String? userName,
    @JsonKey(name: 'PhotoURL')
    required String? photoURL,
    @JsonKey(name: 'IdProofFileURL')
    required String? idProofFileURL,
    @JsonKey(name: 'LastLoginTime')
    String? lastLoginTime,
    @JsonKey(name: 'Designation')
    required String? designation,
    @JsonKey(name: 'CustomDataSetId')
    required int customDataSetId,
    @JsonKey(name: 'Notes')
    required String? notes,
    @JsonKey(name: 'CardNumber')
    String? cardNumber,
    @JsonKey(name: 'Channel')
    String? channel,
    @JsonKey(name: 'Verified')
    required bool verified,
    @JsonKey(name: 'AddressDTOList')
    List<AddressDTO>? addressDTOList,
    @JsonKey(name: 'ContactDTOList')
    required List<ContactDTO>? contactDTOList,
    @JsonKey(name: 'ProfileDTO')
    required ProfileDTO? profileDTO,
    @JsonKey(name: 'CustomerVerificationDTO')
    required dynamic customerVerificationDTO,
    @JsonKey(name: 'CustomDataSetDTO')
    required CustomDataSetDTO? customDataSetDTO,
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
    @JsonKey(name: 'PhoneNumber')
    required String? phoneNumber,
    @JsonKey(name: 'PhoneContactDTO')
    ContactDTO? phoneContactDTO,
    @JsonKey(name: 'Password')
    required String? password,
    @JsonKey(name: 'LatestAddressDTO')
    required AddressDTO? latestAddressDTO,
    @JsonKey(name: 'SecondaryPhoneNumber')
    required String? secondaryPhoneNumber,
    @JsonKey(name: 'FBUserId')
    required String? fbUserId,
    @JsonKey(name: 'FBAccessToken')
    required String? fbAccessToken,
    @JsonKey(name: 'TWAccessToken')
    required String? twAccessToken,
    @JsonKey(name: 'TWAccessSecret')
    required String? twAccessSecret,
    @JsonKey(name: 'Email')
    required String? email,
    @JsonKey(name: 'WeChatAccessToken')
    required String? weChatAccessToken,
    @JsonKey(name: 'IsChanged')
    required bool isChanged,
    @JsonKey(name: 'IsChangedRecursive')
    required bool isChangedRecursive,
    @JsonKey(name: 'CustomerCuponsDT')
    required dynamic customerCuponsDT,
    @JsonKey(name: 'AccountDTOList')
    required List<dynamic>? accountDTOList,
    @JsonKey(name: 'CustomerMembershipProgressionDTOList')
    required List<dynamic>? customerMembershipProgressionDTOList,
    @JsonKey(name: 'CustomerMembershipRewardsLogDTOList')
    required List<dynamic>? customerMembershipRewardsLogDTOList,
    @JsonKey(name: 'CustomerSignedWaiverDTOList')
    required List<dynamic>? customerSignedWaiverDTOList,
    @JsonKey(name: 'CustomerApprovalLogDTOList')
    required List<dynamic>? customerApprovalLogDTOList,
    @JsonKey(name: 'ActiveCampaignCustomerInfoDTOList')
    required List<dynamic>? activeCampaignCustomerInfoDTOList,
    @JsonKey(name: 'LastVisitedDate')
    required String? lastVisitedDate,
  }) =_CustomerData;

  factory CustomerData.fromJson(Map<String, Object?> json) =>
      _$CustomerDataFromJson(json);
}
