// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerData _$$_CustomerDataFromJson(Map<String, dynamic> json) =>
    _$_CustomerData(
      id: json['Id'] as int,
      isActive: json['IsActive'] as bool,
      isBonusLoaded: json['IsBonusLoaded'] as bool,
      profileId: json['ProfileId'] as int,
      membershipId: json['MembershipId'] as int,
      title: json['Title'] as String?,
      firstName: json['FirstName'] as String?,
      nickName: json['NickName'] as String?,
      middleName: json['MiddleName'] as String?,
      lastName: json['LastName'] as String?,
      externalSystemReference: json['ExternalSystemReference'] as String?,
      customerType: json['CustomerType'] as int,
      uniqueIdentifier: json['UniqueIdentifier'] as String?,
      taxCode: json['TaxCode'] as String?,
      dateOfBirth: json['DateOfBirth'] as String?,
      gender: json['Gender'] as String?,
      anniversary: json['Anniversary'] as String?,
      teamUser: json['TeamUser'] as bool,
      rightHanded: json['RightHanded'] as bool,
      optInPromotions: json['OptInPromotions'] as bool,
      optInPromotionsMode: json['OptInPromotionsMode'] as String?,
      policyTermsAccepted: json['PolicyTermsAccepted'] as bool,
      company: json['Company'] as String?,
      userName: json['UserName'] as String?,
      photoURL: json['PhotoURL'] as String?,
      idProofFileURL: json['IdProofFileURL'] as String?,
      lastLoginTime: json['LastLoginTime'] as String?,
      designation: json['Designation'] as String?,
      customDataSetId: json['CustomDataSetId'] as int,
      notes: json['Notes'] as String?,
      cardNumber: json['CardNumber'] as String?,
      channel: json['Channel'] as String?,
      verified: json['Verified'] as bool,
      addressDTOList: (json['AddressDTOList'] as List<dynamic>?)
          ?.map((e) => AddressDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      contactDTOList: (json['ContactDTOList'] as List<dynamic>?)
          ?.map((e) => ContactDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      profileDTO: json['ProfileDTO'] == null
          ? null
          : ProfileDTO.fromJson(json['ProfileDTO'] as Map<String, dynamic>),
      customerVerificationDTO: json['CustomerVerificationDTO'],
      customDataSetDTO: json['CustomDataSetDTO'] == null
          ? null
          : CustomDataSetDTO.fromJson(
              json['CustomDataSetDTO'] as Map<String, dynamic>),
      createdBy: json['CreatedBy'] as String?,
      creationDate: json['CreationDate'] as String?,
      lastUpdatedBy: json['LastUpdatedBy'] as String?,
      lastUpdateDate: json['LastUpdateDate'] as String?,
      siteId: json['SiteId'] as int,
      masterEntityId: json['MasterEntityId'] as int,
      synchStatus: json['SynchStatus'] as bool,
      guid: json['Guid'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      phoneContactDTO: json['PhoneContactDTO'] == null
          ? null
          : ContactDTO.fromJson(
              json['PhoneContactDTO'] as Map<String, dynamic>),
      password: json['Password'] as String?,
      latestAddressDTO: json['LatestAddressDTO'] == null
          ? null
          : AddressDTO.fromJson(
              json['LatestAddressDTO'] as Map<String, dynamic>),
      secondaryPhoneNumber: json['SecondaryPhoneNumber'] as String?,
      fbUserId: json['FBUserId'] as String?,
      fbAccessToken: json['FBAccessToken'] as String?,
      twAccessToken: json['TWAccessToken'] as String?,
      twAccessSecret: json['TWAccessSecret'] as String?,
      email: json['Email'] as String?,
      weChatAccessToken: json['WeChatAccessToken'] as String?,
      isChanged: json['IsChanged'] as bool,
      isChangedRecursive: json['IsChangedRecursive'] as bool,
      customerCuponsDT: json['CustomerCuponsDT'],
      accountDTOList: json['AccountDTOList'] as List<dynamic>?,
      customerMembershipProgressionDTOList:
          json['CustomerMembershipProgressionDTOList'] as List<dynamic>?,
      customerMembershipRewardsLogDTOList:
          json['CustomerMembershipRewardsLogDTOList'] as List<dynamic>?,
      customerSignedWaiverDTOList:
          json['CustomerSignedWaiverDTOList'] as List<dynamic>?,
      customerApprovalLogDTOList:
          json['CustomerApprovalLogDTOList'] as List<dynamic>?,
      activeCampaignCustomerInfoDTOList:
          json['ActiveCampaignCustomerInfoDTOList'] as List<dynamic>?,
      lastVisitedDate: json['LastVisitedDate'] as String?,
    );

Map<String, dynamic> _$$_CustomerDataToJson(_$_CustomerData instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'IsActive': instance.isActive,
      'IsBonusLoaded': instance.isBonusLoaded,
      'ProfileId': instance.profileId,
      'MembershipId': instance.membershipId,
      'Title': instance.title,
      'FirstName': instance.firstName,
      'NickName': instance.nickName,
      'MiddleName': instance.middleName,
      'LastName': instance.lastName,
      'ExternalSystemReference': instance.externalSystemReference,
      'CustomerType': instance.customerType,
      'UniqueIdentifier': instance.uniqueIdentifier,
      'TaxCode': instance.taxCode,
      'DateOfBirth': instance.dateOfBirth,
      'Gender': instance.gender,
      'Anniversary': instance.anniversary,
      'TeamUser': instance.teamUser,
      'RightHanded': instance.rightHanded,
      'OptInPromotions': instance.optInPromotions,
      'OptInPromotionsMode': instance.optInPromotionsMode,
      'PolicyTermsAccepted': instance.policyTermsAccepted,
      'Company': instance.company,
      'UserName': instance.userName,
      'PhotoURL': instance.photoURL,
      'IdProofFileURL': instance.idProofFileURL,
      'LastLoginTime': instance.lastLoginTime,
      'Designation': instance.designation,
      'CustomDataSetId': instance.customDataSetId,
      'Notes': instance.notes,
      'CardNumber': instance.cardNumber,
      'Channel': instance.channel,
      'Verified': instance.verified,
      'AddressDTOList': instance.addressDTOList,
      'ContactDTOList': instance.contactDTOList,
      'ProfileDTO': instance.profileDTO,
      'CustomerVerificationDTO': instance.customerVerificationDTO,
      'CustomDataSetDTO': instance.customDataSetDTO,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdateDate': instance.lastUpdateDate,
      'SiteId': instance.siteId,
      'MasterEntityId': instance.masterEntityId,
      'SynchStatus': instance.synchStatus,
      'Guid': instance.guid,
      'PhoneNumber': instance.phoneNumber,
      'PhoneContactDTO': instance.phoneContactDTO,
      'Password': instance.password,
      'LatestAddressDTO': instance.latestAddressDTO,
      'SecondaryPhoneNumber': instance.secondaryPhoneNumber,
      'FBUserId': instance.fbUserId,
      'FBAccessToken': instance.fbAccessToken,
      'TWAccessToken': instance.twAccessToken,
      'TWAccessSecret': instance.twAccessSecret,
      'Email': instance.email,
      'WeChatAccessToken': instance.weChatAccessToken,
      'IsChanged': instance.isChanged,
      'IsChangedRecursive': instance.isChangedRecursive,
      'CustomerCuponsDT': instance.customerCuponsDT,
      'AccountDTOList': instance.accountDTOList,
      'CustomerMembershipProgressionDTOList':
          instance.customerMembershipProgressionDTOList,
      'CustomerMembershipRewardsLogDTOList':
          instance.customerMembershipRewardsLogDTOList,
      'CustomerSignedWaiverDTOList': instance.customerSignedWaiverDTOList,
      'CustomerApprovalLogDTOList': instance.customerApprovalLogDTOList,
      'ActiveCampaignCustomerInfoDTOList':
          instance.activeCampaignCustomerInfoDTOList,
      'LastVisitedDate': instance.lastVisitedDate,
    };
