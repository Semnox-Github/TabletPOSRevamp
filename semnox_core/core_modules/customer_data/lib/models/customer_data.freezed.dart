// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerData _$CustomerDataFromJson(Map<String, dynamic> json) {
  return _CustomerData.fromJson(json);
}

/// @nodoc
mixin _$CustomerData {
  @JsonKey(name: 'Id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsBonusLoaded')
  bool get isBonusLoaded => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProfileId')
  int get profileId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MembershipId')
  int get membershipId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'FirstName')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'NickName')
  String? get nickName => throw _privateConstructorUsedError;
  @JsonKey(name: 'MiddleName')
  String? get middleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastName')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExternalSystemReference')
  String? get externalSystemReference => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerType')
  int get customerType => throw _privateConstructorUsedError;
  @JsonKey(name: 'UniqueIdentifier')
  String? get uniqueIdentifier => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxCode')
  String? get taxCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateOfBirth')
  String? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'Gender')
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'Anniversary')
  String? get anniversary => throw _privateConstructorUsedError;
  @JsonKey(name: 'TeamUser')
  bool get teamUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'RightHanded')
  bool get rightHanded => throw _privateConstructorUsedError;
  @JsonKey(name: 'OptInPromotions')
  bool get optInPromotions => throw _privateConstructorUsedError;
  @JsonKey(name: 'OptInPromotionsMode')
  String? get optInPromotionsMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'PolicyTermsAccepted')
  bool get policyTermsAccepted => throw _privateConstructorUsedError;
  @JsonKey(name: 'Company')
  String? get company => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserName')
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PhotoURL')
  String? get photoURL => throw _privateConstructorUsedError;
  @JsonKey(name: 'IdProofFileURL')
  String? get idProofFileURL => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastLoginTime')
  String? get lastLoginTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'Designation')
  String? get designation => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomDataSetId')
  int get customDataSetId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Notes')
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'CardNumber')
  String? get cardNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'Channel')
  String? get channel => throw _privateConstructorUsedError;
  @JsonKey(name: 'Verified')
  bool get verified => throw _privateConstructorUsedError;
  @JsonKey(name: 'AddressDTOList')
  List<AddressDTO>? get addressDTOList => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactDTOList')
  List<ContactDTO>? get contactDTOList => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProfileDTO')
  ProfileDTO? get profileDTO => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerVerificationDTO')
  dynamic get customerVerificationDTO => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomDataSetDTO')
  CustomDataSetDTO? get customDataSetDTO => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreationDate')
  String? get creationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastUpdatedBy')
  String? get lastUpdatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastUpdateDate')
  String? get lastUpdateDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteId')
  int get siteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MasterEntityId')
  int get masterEntityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SynchStatus')
  bool get synchStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'Guid')
  String? get guid => throw _privateConstructorUsedError;
  @JsonKey(name: 'PhoneNumber')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'PhoneContactDTO')
  ContactDTO? get phoneContactDTO => throw _privateConstructorUsedError;
  @JsonKey(name: 'Password')
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'LatestAddressDTO')
  AddressDTO? get latestAddressDTO => throw _privateConstructorUsedError;
  @JsonKey(name: 'SecondaryPhoneNumber')
  String? get secondaryPhoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'FBUserId')
  String? get fbUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'FBAccessToken')
  String? get fbAccessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'TWAccessToken')
  String? get twAccessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'TWAccessSecret')
  String? get twAccessSecret => throw _privateConstructorUsedError;
  @JsonKey(name: 'Email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'WeChatAccessToken')
  String? get weChatAccessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsChanged')
  bool get isChanged => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsChangedRecursive')
  bool get isChangedRecursive => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerCuponsDT')
  dynamic get customerCuponsDT => throw _privateConstructorUsedError;
  @JsonKey(name: 'AccountDTOList')
  List<dynamic>? get accountDTOList => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerMembershipProgressionDTOList')
  List<dynamic>? get customerMembershipProgressionDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerMembershipRewardsLogDTOList')
  List<dynamic>? get customerMembershipRewardsLogDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerSignedWaiverDTOList')
  List<dynamic>? get customerSignedWaiverDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerApprovalLogDTOList')
  List<dynamic>? get customerApprovalLogDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ActiveCampaignCustomerInfoDTOList')
  List<dynamic>? get activeCampaignCustomerInfoDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'LastVisitedDate')
  String? get lastVisitedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerDataCopyWith<CustomerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerDataCopyWith<$Res> {
  factory $CustomerDataCopyWith(
          CustomerData value, $Res Function(CustomerData) then) =
      _$CustomerDataCopyWithImpl<$Res, CustomerData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Id')
          int id,
      @JsonKey(name: 'IsActive')
          bool isActive,
      @JsonKey(name: 'IsBonusLoaded')
          bool isBonusLoaded,
      @JsonKey(name: 'ProfileId')
          int profileId,
      @JsonKey(name: 'MembershipId')
          int membershipId,
      @JsonKey(name: 'Title')
          String? title,
      @JsonKey(name: 'FirstName')
          String? firstName,
      @JsonKey(name: 'NickName')
          String? nickName,
      @JsonKey(name: 'MiddleName')
          String? middleName,
      @JsonKey(name: 'LastName')
          String? lastName,
      @JsonKey(name: 'ExternalSystemReference')
          String? externalSystemReference,
      @JsonKey(name: 'CustomerType')
          int customerType,
      @JsonKey(name: 'UniqueIdentifier')
          String? uniqueIdentifier,
      @JsonKey(name: 'TaxCode')
          String? taxCode,
      @JsonKey(name: 'DateOfBirth')
          String? dateOfBirth,
      @JsonKey(name: 'Gender')
          String? gender,
      @JsonKey(name: 'Anniversary')
          String? anniversary,
      @JsonKey(name: 'TeamUser')
          bool teamUser,
      @JsonKey(name: 'RightHanded')
          bool rightHanded,
      @JsonKey(name: 'OptInPromotions')
          bool optInPromotions,
      @JsonKey(name: 'OptInPromotionsMode')
          String? optInPromotionsMode,
      @JsonKey(name: 'PolicyTermsAccepted')
          bool policyTermsAccepted,
      @JsonKey(name: 'Company')
          String? company,
      @JsonKey(name: 'UserName')
          String? userName,
      @JsonKey(name: 'PhotoURL')
          String? photoURL,
      @JsonKey(name: 'IdProofFileURL')
          String? idProofFileURL,
      @JsonKey(name: 'LastLoginTime')
          String? lastLoginTime,
      @JsonKey(name: 'Designation')
          String? designation,
      @JsonKey(name: 'CustomDataSetId')
          int customDataSetId,
      @JsonKey(name: 'Notes')
          String? notes,
      @JsonKey(name: 'CardNumber')
          String? cardNumber,
      @JsonKey(name: 'Channel')
          String? channel,
      @JsonKey(name: 'Verified')
          bool verified,
      @JsonKey(name: 'AddressDTOList')
          List<AddressDTO>? addressDTOList,
      @JsonKey(name: 'ContactDTOList')
          List<ContactDTO>? contactDTOList,
      @JsonKey(name: 'ProfileDTO')
          ProfileDTO? profileDTO,
      @JsonKey(name: 'CustomerVerificationDTO')
          dynamic customerVerificationDTO,
      @JsonKey(name: 'CustomDataSetDTO')
          CustomDataSetDTO? customDataSetDTO,
      @JsonKey(name: 'CreatedBy')
          String? createdBy,
      @JsonKey(name: 'CreationDate')
          String? creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          String? lastUpdatedBy,
      @JsonKey(name: 'LastUpdateDate')
          String? lastUpdateDate,
      @JsonKey(name: 'SiteId')
          int siteId,
      @JsonKey(name: 'MasterEntityId')
          int masterEntityId,
      @JsonKey(name: 'SynchStatus')
          bool synchStatus,
      @JsonKey(name: 'Guid')
          String? guid,
      @JsonKey(name: 'PhoneNumber')
          String? phoneNumber,
      @JsonKey(name: 'PhoneContactDTO')
          ContactDTO? phoneContactDTO,
      @JsonKey(name: 'Password')
          String? password,
      @JsonKey(name: 'LatestAddressDTO')
          AddressDTO? latestAddressDTO,
      @JsonKey(name: 'SecondaryPhoneNumber')
          String? secondaryPhoneNumber,
      @JsonKey(name: 'FBUserId')
          String? fbUserId,
      @JsonKey(name: 'FBAccessToken')
          String? fbAccessToken,
      @JsonKey(name: 'TWAccessToken')
          String? twAccessToken,
      @JsonKey(name: 'TWAccessSecret')
          String? twAccessSecret,
      @JsonKey(name: 'Email')
          String? email,
      @JsonKey(name: 'WeChatAccessToken')
          String? weChatAccessToken,
      @JsonKey(name: 'IsChanged')
          bool isChanged,
      @JsonKey(name: 'IsChangedRecursive')
          bool isChangedRecursive,
      @JsonKey(name: 'CustomerCuponsDT')
          dynamic customerCuponsDT,
      @JsonKey(name: 'AccountDTOList')
          List<dynamic>? accountDTOList,
      @JsonKey(name: 'CustomerMembershipProgressionDTOList')
          List<dynamic>? customerMembershipProgressionDTOList,
      @JsonKey(name: 'CustomerMembershipRewardsLogDTOList')
          List<dynamic>? customerMembershipRewardsLogDTOList,
      @JsonKey(name: 'CustomerSignedWaiverDTOList')
          List<dynamic>? customerSignedWaiverDTOList,
      @JsonKey(name: 'CustomerApprovalLogDTOList')
          List<dynamic>? customerApprovalLogDTOList,
      @JsonKey(name: 'ActiveCampaignCustomerInfoDTOList')
          List<dynamic>? activeCampaignCustomerInfoDTOList,
      @JsonKey(name: 'LastVisitedDate')
          String? lastVisitedDate});

  $ProfileDTOCopyWith<$Res>? get profileDTO;
  $CustomDataSetDTOCopyWith<$Res>? get customDataSetDTO;
  $ContactDTOCopyWith<$Res>? get phoneContactDTO;
  $AddressDTOCopyWith<$Res>? get latestAddressDTO;
}

/// @nodoc
class _$CustomerDataCopyWithImpl<$Res, $Val extends CustomerData>
    implements $CustomerDataCopyWith<$Res> {
  _$CustomerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isActive = null,
    Object? isBonusLoaded = null,
    Object? profileId = null,
    Object? membershipId = null,
    Object? title = freezed,
    Object? firstName = freezed,
    Object? nickName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? externalSystemReference = freezed,
    Object? customerType = null,
    Object? uniqueIdentifier = freezed,
    Object? taxCode = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? anniversary = freezed,
    Object? teamUser = null,
    Object? rightHanded = null,
    Object? optInPromotions = null,
    Object? optInPromotionsMode = freezed,
    Object? policyTermsAccepted = null,
    Object? company = freezed,
    Object? userName = freezed,
    Object? photoURL = freezed,
    Object? idProofFileURL = freezed,
    Object? lastLoginTime = freezed,
    Object? designation = freezed,
    Object? customDataSetId = null,
    Object? notes = freezed,
    Object? cardNumber = freezed,
    Object? channel = freezed,
    Object? verified = null,
    Object? addressDTOList = freezed,
    Object? contactDTOList = freezed,
    Object? profileDTO = freezed,
    Object? customerVerificationDTO = freezed,
    Object? customDataSetDTO = freezed,
    Object? createdBy = freezed,
    Object? creationDate = freezed,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdateDate = freezed,
    Object? siteId = null,
    Object? masterEntityId = null,
    Object? synchStatus = null,
    Object? guid = freezed,
    Object? phoneNumber = freezed,
    Object? phoneContactDTO = freezed,
    Object? password = freezed,
    Object? latestAddressDTO = freezed,
    Object? secondaryPhoneNumber = freezed,
    Object? fbUserId = freezed,
    Object? fbAccessToken = freezed,
    Object? twAccessToken = freezed,
    Object? twAccessSecret = freezed,
    Object? email = freezed,
    Object? weChatAccessToken = freezed,
    Object? isChanged = null,
    Object? isChangedRecursive = null,
    Object? customerCuponsDT = freezed,
    Object? accountDTOList = freezed,
    Object? customerMembershipProgressionDTOList = freezed,
    Object? customerMembershipRewardsLogDTOList = freezed,
    Object? customerSignedWaiverDTOList = freezed,
    Object? customerApprovalLogDTOList = freezed,
    Object? activeCampaignCustomerInfoDTOList = freezed,
    Object? lastVisitedDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isBonusLoaded: null == isBonusLoaded
          ? _value.isBonusLoaded
          : isBonusLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as int,
      membershipId: null == membershipId
          ? _value.membershipId
          : membershipId // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      nickName: freezed == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      externalSystemReference: freezed == externalSystemReference
          ? _value.externalSystemReference
          : externalSystemReference // ignore: cast_nullable_to_non_nullable
              as String?,
      customerType: null == customerType
          ? _value.customerType
          : customerType // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueIdentifier: freezed == uniqueIdentifier
          ? _value.uniqueIdentifier
          : uniqueIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      taxCode: freezed == taxCode
          ? _value.taxCode
          : taxCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      anniversary: freezed == anniversary
          ? _value.anniversary
          : anniversary // ignore: cast_nullable_to_non_nullable
              as String?,
      teamUser: null == teamUser
          ? _value.teamUser
          : teamUser // ignore: cast_nullable_to_non_nullable
              as bool,
      rightHanded: null == rightHanded
          ? _value.rightHanded
          : rightHanded // ignore: cast_nullable_to_non_nullable
              as bool,
      optInPromotions: null == optInPromotions
          ? _value.optInPromotions
          : optInPromotions // ignore: cast_nullable_to_non_nullable
              as bool,
      optInPromotionsMode: freezed == optInPromotionsMode
          ? _value.optInPromotionsMode
          : optInPromotionsMode // ignore: cast_nullable_to_non_nullable
              as String?,
      policyTermsAccepted: null == policyTermsAccepted
          ? _value.policyTermsAccepted
          : policyTermsAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      idProofFileURL: freezed == idProofFileURL
          ? _value.idProofFileURL
          : idProofFileURL // ignore: cast_nullable_to_non_nullable
              as String?,
      lastLoginTime: freezed == lastLoginTime
          ? _value.lastLoginTime
          : lastLoginTime // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      customDataSetId: null == customDataSetId
          ? _value.customDataSetId
          : customDataSetId // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      cardNumber: freezed == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      addressDTOList: freezed == addressDTOList
          ? _value.addressDTOList
          : addressDTOList // ignore: cast_nullable_to_non_nullable
              as List<AddressDTO>?,
      contactDTOList: freezed == contactDTOList
          ? _value.contactDTOList
          : contactDTOList // ignore: cast_nullable_to_non_nullable
              as List<ContactDTO>?,
      profileDTO: freezed == profileDTO
          ? _value.profileDTO
          : profileDTO // ignore: cast_nullable_to_non_nullable
              as ProfileDTO?,
      customerVerificationDTO: freezed == customerVerificationDTO
          ? _value.customerVerificationDTO
          : customerVerificationDTO // ignore: cast_nullable_to_non_nullable
              as dynamic,
      customDataSetDTO: freezed == customDataSetDTO
          ? _value.customDataSetDTO
          : customDataSetDTO // ignore: cast_nullable_to_non_nullable
              as CustomDataSetDTO?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedBy: freezed == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdateDate: freezed == lastUpdateDate
          ? _value.lastUpdateDate
          : lastUpdateDate // ignore: cast_nullable_to_non_nullable
              as String?,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      masterEntityId: null == masterEntityId
          ? _value.masterEntityId
          : masterEntityId // ignore: cast_nullable_to_non_nullable
              as int,
      synchStatus: null == synchStatus
          ? _value.synchStatus
          : synchStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      guid: freezed == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneContactDTO: freezed == phoneContactDTO
          ? _value.phoneContactDTO
          : phoneContactDTO // ignore: cast_nullable_to_non_nullable
              as ContactDTO?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      latestAddressDTO: freezed == latestAddressDTO
          ? _value.latestAddressDTO
          : latestAddressDTO // ignore: cast_nullable_to_non_nullable
              as AddressDTO?,
      secondaryPhoneNumber: freezed == secondaryPhoneNumber
          ? _value.secondaryPhoneNumber
          : secondaryPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fbUserId: freezed == fbUserId
          ? _value.fbUserId
          : fbUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      fbAccessToken: freezed == fbAccessToken
          ? _value.fbAccessToken
          : fbAccessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      twAccessToken: freezed == twAccessToken
          ? _value.twAccessToken
          : twAccessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      twAccessSecret: freezed == twAccessSecret
          ? _value.twAccessSecret
          : twAccessSecret // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      weChatAccessToken: freezed == weChatAccessToken
          ? _value.weChatAccessToken
          : weChatAccessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      isChanged: null == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      isChangedRecursive: null == isChangedRecursive
          ? _value.isChangedRecursive
          : isChangedRecursive // ignore: cast_nullable_to_non_nullable
              as bool,
      customerCuponsDT: freezed == customerCuponsDT
          ? _value.customerCuponsDT
          : customerCuponsDT // ignore: cast_nullable_to_non_nullable
              as dynamic,
      accountDTOList: freezed == accountDTOList
          ? _value.accountDTOList
          : accountDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      customerMembershipProgressionDTOList: freezed ==
              customerMembershipProgressionDTOList
          ? _value.customerMembershipProgressionDTOList
          : customerMembershipProgressionDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      customerMembershipRewardsLogDTOList: freezed ==
              customerMembershipRewardsLogDTOList
          ? _value.customerMembershipRewardsLogDTOList
          : customerMembershipRewardsLogDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      customerSignedWaiverDTOList: freezed == customerSignedWaiverDTOList
          ? _value.customerSignedWaiverDTOList
          : customerSignedWaiverDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      customerApprovalLogDTOList: freezed == customerApprovalLogDTOList
          ? _value.customerApprovalLogDTOList
          : customerApprovalLogDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      activeCampaignCustomerInfoDTOList: freezed ==
              activeCampaignCustomerInfoDTOList
          ? _value.activeCampaignCustomerInfoDTOList
          : activeCampaignCustomerInfoDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      lastVisitedDate: freezed == lastVisitedDate
          ? _value.lastVisitedDate
          : lastVisitedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileDTOCopyWith<$Res>? get profileDTO {
    if (_value.profileDTO == null) {
      return null;
    }

    return $ProfileDTOCopyWith<$Res>(_value.profileDTO!, (value) {
      return _then(_value.copyWith(profileDTO: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomDataSetDTOCopyWith<$Res>? get customDataSetDTO {
    if (_value.customDataSetDTO == null) {
      return null;
    }

    return $CustomDataSetDTOCopyWith<$Res>(_value.customDataSetDTO!, (value) {
      return _then(_value.copyWith(customDataSetDTO: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ContactDTOCopyWith<$Res>? get phoneContactDTO {
    if (_value.phoneContactDTO == null) {
      return null;
    }

    return $ContactDTOCopyWith<$Res>(_value.phoneContactDTO!, (value) {
      return _then(_value.copyWith(phoneContactDTO: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressDTOCopyWith<$Res>? get latestAddressDTO {
    if (_value.latestAddressDTO == null) {
      return null;
    }

    return $AddressDTOCopyWith<$Res>(_value.latestAddressDTO!, (value) {
      return _then(_value.copyWith(latestAddressDTO: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CustomerDataCopyWith<$Res>
    implements $CustomerDataCopyWith<$Res> {
  factory _$$_CustomerDataCopyWith(
          _$_CustomerData value, $Res Function(_$_CustomerData) then) =
      __$$_CustomerDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Id')
          int id,
      @JsonKey(name: 'IsActive')
          bool isActive,
      @JsonKey(name: 'IsBonusLoaded')
          bool isBonusLoaded,
      @JsonKey(name: 'ProfileId')
          int profileId,
      @JsonKey(name: 'MembershipId')
          int membershipId,
      @JsonKey(name: 'Title')
          String? title,
      @JsonKey(name: 'FirstName')
          String? firstName,
      @JsonKey(name: 'NickName')
          String? nickName,
      @JsonKey(name: 'MiddleName')
          String? middleName,
      @JsonKey(name: 'LastName')
          String? lastName,
      @JsonKey(name: 'ExternalSystemReference')
          String? externalSystemReference,
      @JsonKey(name: 'CustomerType')
          int customerType,
      @JsonKey(name: 'UniqueIdentifier')
          String? uniqueIdentifier,
      @JsonKey(name: 'TaxCode')
          String? taxCode,
      @JsonKey(name: 'DateOfBirth')
          String? dateOfBirth,
      @JsonKey(name: 'Gender')
          String? gender,
      @JsonKey(name: 'Anniversary')
          String? anniversary,
      @JsonKey(name: 'TeamUser')
          bool teamUser,
      @JsonKey(name: 'RightHanded')
          bool rightHanded,
      @JsonKey(name: 'OptInPromotions')
          bool optInPromotions,
      @JsonKey(name: 'OptInPromotionsMode')
          String? optInPromotionsMode,
      @JsonKey(name: 'PolicyTermsAccepted')
          bool policyTermsAccepted,
      @JsonKey(name: 'Company')
          String? company,
      @JsonKey(name: 'UserName')
          String? userName,
      @JsonKey(name: 'PhotoURL')
          String? photoURL,
      @JsonKey(name: 'IdProofFileURL')
          String? idProofFileURL,
      @JsonKey(name: 'LastLoginTime')
          String? lastLoginTime,
      @JsonKey(name: 'Designation')
          String? designation,
      @JsonKey(name: 'CustomDataSetId')
          int customDataSetId,
      @JsonKey(name: 'Notes')
          String? notes,
      @JsonKey(name: 'CardNumber')
          String? cardNumber,
      @JsonKey(name: 'Channel')
          String? channel,
      @JsonKey(name: 'Verified')
          bool verified,
      @JsonKey(name: 'AddressDTOList')
          List<AddressDTO>? addressDTOList,
      @JsonKey(name: 'ContactDTOList')
          List<ContactDTO>? contactDTOList,
      @JsonKey(name: 'ProfileDTO')
          ProfileDTO? profileDTO,
      @JsonKey(name: 'CustomerVerificationDTO')
          dynamic customerVerificationDTO,
      @JsonKey(name: 'CustomDataSetDTO')
          CustomDataSetDTO? customDataSetDTO,
      @JsonKey(name: 'CreatedBy')
          String? createdBy,
      @JsonKey(name: 'CreationDate')
          String? creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          String? lastUpdatedBy,
      @JsonKey(name: 'LastUpdateDate')
          String? lastUpdateDate,
      @JsonKey(name: 'SiteId')
          int siteId,
      @JsonKey(name: 'MasterEntityId')
          int masterEntityId,
      @JsonKey(name: 'SynchStatus')
          bool synchStatus,
      @JsonKey(name: 'Guid')
          String? guid,
      @JsonKey(name: 'PhoneNumber')
          String? phoneNumber,
      @JsonKey(name: 'PhoneContactDTO')
          ContactDTO? phoneContactDTO,
      @JsonKey(name: 'Password')
          String? password,
      @JsonKey(name: 'LatestAddressDTO')
          AddressDTO? latestAddressDTO,
      @JsonKey(name: 'SecondaryPhoneNumber')
          String? secondaryPhoneNumber,
      @JsonKey(name: 'FBUserId')
          String? fbUserId,
      @JsonKey(name: 'FBAccessToken')
          String? fbAccessToken,
      @JsonKey(name: 'TWAccessToken')
          String? twAccessToken,
      @JsonKey(name: 'TWAccessSecret')
          String? twAccessSecret,
      @JsonKey(name: 'Email')
          String? email,
      @JsonKey(name: 'WeChatAccessToken')
          String? weChatAccessToken,
      @JsonKey(name: 'IsChanged')
          bool isChanged,
      @JsonKey(name: 'IsChangedRecursive')
          bool isChangedRecursive,
      @JsonKey(name: 'CustomerCuponsDT')
          dynamic customerCuponsDT,
      @JsonKey(name: 'AccountDTOList')
          List<dynamic>? accountDTOList,
      @JsonKey(name: 'CustomerMembershipProgressionDTOList')
          List<dynamic>? customerMembershipProgressionDTOList,
      @JsonKey(name: 'CustomerMembershipRewardsLogDTOList')
          List<dynamic>? customerMembershipRewardsLogDTOList,
      @JsonKey(name: 'CustomerSignedWaiverDTOList')
          List<dynamic>? customerSignedWaiverDTOList,
      @JsonKey(name: 'CustomerApprovalLogDTOList')
          List<dynamic>? customerApprovalLogDTOList,
      @JsonKey(name: 'ActiveCampaignCustomerInfoDTOList')
          List<dynamic>? activeCampaignCustomerInfoDTOList,
      @JsonKey(name: 'LastVisitedDate')
          String? lastVisitedDate});

  @override
  $ProfileDTOCopyWith<$Res>? get profileDTO;
  @override
  $CustomDataSetDTOCopyWith<$Res>? get customDataSetDTO;
  @override
  $ContactDTOCopyWith<$Res>? get phoneContactDTO;
  @override
  $AddressDTOCopyWith<$Res>? get latestAddressDTO;
}

/// @nodoc
class __$$_CustomerDataCopyWithImpl<$Res>
    extends _$CustomerDataCopyWithImpl<$Res, _$_CustomerData>
    implements _$$_CustomerDataCopyWith<$Res> {
  __$$_CustomerDataCopyWithImpl(
      _$_CustomerData _value, $Res Function(_$_CustomerData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isActive = null,
    Object? isBonusLoaded = null,
    Object? profileId = null,
    Object? membershipId = null,
    Object? title = freezed,
    Object? firstName = freezed,
    Object? nickName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? externalSystemReference = freezed,
    Object? customerType = null,
    Object? uniqueIdentifier = freezed,
    Object? taxCode = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? anniversary = freezed,
    Object? teamUser = null,
    Object? rightHanded = null,
    Object? optInPromotions = null,
    Object? optInPromotionsMode = freezed,
    Object? policyTermsAccepted = null,
    Object? company = freezed,
    Object? userName = freezed,
    Object? photoURL = freezed,
    Object? idProofFileURL = freezed,
    Object? lastLoginTime = freezed,
    Object? designation = freezed,
    Object? customDataSetId = null,
    Object? notes = freezed,
    Object? cardNumber = freezed,
    Object? channel = freezed,
    Object? verified = null,
    Object? addressDTOList = freezed,
    Object? contactDTOList = freezed,
    Object? profileDTO = freezed,
    Object? customerVerificationDTO = freezed,
    Object? customDataSetDTO = freezed,
    Object? createdBy = freezed,
    Object? creationDate = freezed,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdateDate = freezed,
    Object? siteId = null,
    Object? masterEntityId = null,
    Object? synchStatus = null,
    Object? guid = freezed,
    Object? phoneNumber = freezed,
    Object? phoneContactDTO = freezed,
    Object? password = freezed,
    Object? latestAddressDTO = freezed,
    Object? secondaryPhoneNumber = freezed,
    Object? fbUserId = freezed,
    Object? fbAccessToken = freezed,
    Object? twAccessToken = freezed,
    Object? twAccessSecret = freezed,
    Object? email = freezed,
    Object? weChatAccessToken = freezed,
    Object? isChanged = null,
    Object? isChangedRecursive = null,
    Object? customerCuponsDT = freezed,
    Object? accountDTOList = freezed,
    Object? customerMembershipProgressionDTOList = freezed,
    Object? customerMembershipRewardsLogDTOList = freezed,
    Object? customerSignedWaiverDTOList = freezed,
    Object? customerApprovalLogDTOList = freezed,
    Object? activeCampaignCustomerInfoDTOList = freezed,
    Object? lastVisitedDate = freezed,
  }) {
    return _then(_$_CustomerData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isBonusLoaded: null == isBonusLoaded
          ? _value.isBonusLoaded
          : isBonusLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as int,
      membershipId: null == membershipId
          ? _value.membershipId
          : membershipId // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      nickName: freezed == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      externalSystemReference: freezed == externalSystemReference
          ? _value.externalSystemReference
          : externalSystemReference // ignore: cast_nullable_to_non_nullable
              as String?,
      customerType: null == customerType
          ? _value.customerType
          : customerType // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueIdentifier: freezed == uniqueIdentifier
          ? _value.uniqueIdentifier
          : uniqueIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      taxCode: freezed == taxCode
          ? _value.taxCode
          : taxCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      anniversary: freezed == anniversary
          ? _value.anniversary
          : anniversary // ignore: cast_nullable_to_non_nullable
              as String?,
      teamUser: null == teamUser
          ? _value.teamUser
          : teamUser // ignore: cast_nullable_to_non_nullable
              as bool,
      rightHanded: null == rightHanded
          ? _value.rightHanded
          : rightHanded // ignore: cast_nullable_to_non_nullable
              as bool,
      optInPromotions: null == optInPromotions
          ? _value.optInPromotions
          : optInPromotions // ignore: cast_nullable_to_non_nullable
              as bool,
      optInPromotionsMode: freezed == optInPromotionsMode
          ? _value.optInPromotionsMode
          : optInPromotionsMode // ignore: cast_nullable_to_non_nullable
              as String?,
      policyTermsAccepted: null == policyTermsAccepted
          ? _value.policyTermsAccepted
          : policyTermsAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      idProofFileURL: freezed == idProofFileURL
          ? _value.idProofFileURL
          : idProofFileURL // ignore: cast_nullable_to_non_nullable
              as String?,
      lastLoginTime: freezed == lastLoginTime
          ? _value.lastLoginTime
          : lastLoginTime // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      customDataSetId: null == customDataSetId
          ? _value.customDataSetId
          : customDataSetId // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      cardNumber: freezed == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      addressDTOList: freezed == addressDTOList
          ? _value._addressDTOList
          : addressDTOList // ignore: cast_nullable_to_non_nullable
              as List<AddressDTO>?,
      contactDTOList: freezed == contactDTOList
          ? _value._contactDTOList
          : contactDTOList // ignore: cast_nullable_to_non_nullable
              as List<ContactDTO>?,
      profileDTO: freezed == profileDTO
          ? _value.profileDTO
          : profileDTO // ignore: cast_nullable_to_non_nullable
              as ProfileDTO?,
      customerVerificationDTO: freezed == customerVerificationDTO
          ? _value.customerVerificationDTO
          : customerVerificationDTO // ignore: cast_nullable_to_non_nullable
              as dynamic,
      customDataSetDTO: freezed == customDataSetDTO
          ? _value.customDataSetDTO
          : customDataSetDTO // ignore: cast_nullable_to_non_nullable
              as CustomDataSetDTO?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedBy: freezed == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdateDate: freezed == lastUpdateDate
          ? _value.lastUpdateDate
          : lastUpdateDate // ignore: cast_nullable_to_non_nullable
              as String?,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      masterEntityId: null == masterEntityId
          ? _value.masterEntityId
          : masterEntityId // ignore: cast_nullable_to_non_nullable
              as int,
      synchStatus: null == synchStatus
          ? _value.synchStatus
          : synchStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      guid: freezed == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneContactDTO: freezed == phoneContactDTO
          ? _value.phoneContactDTO
          : phoneContactDTO // ignore: cast_nullable_to_non_nullable
              as ContactDTO?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      latestAddressDTO: freezed == latestAddressDTO
          ? _value.latestAddressDTO
          : latestAddressDTO // ignore: cast_nullable_to_non_nullable
              as AddressDTO?,
      secondaryPhoneNumber: freezed == secondaryPhoneNumber
          ? _value.secondaryPhoneNumber
          : secondaryPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fbUserId: freezed == fbUserId
          ? _value.fbUserId
          : fbUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      fbAccessToken: freezed == fbAccessToken
          ? _value.fbAccessToken
          : fbAccessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      twAccessToken: freezed == twAccessToken
          ? _value.twAccessToken
          : twAccessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      twAccessSecret: freezed == twAccessSecret
          ? _value.twAccessSecret
          : twAccessSecret // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      weChatAccessToken: freezed == weChatAccessToken
          ? _value.weChatAccessToken
          : weChatAccessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      isChanged: null == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      isChangedRecursive: null == isChangedRecursive
          ? _value.isChangedRecursive
          : isChangedRecursive // ignore: cast_nullable_to_non_nullable
              as bool,
      customerCuponsDT: freezed == customerCuponsDT
          ? _value.customerCuponsDT
          : customerCuponsDT // ignore: cast_nullable_to_non_nullable
              as dynamic,
      accountDTOList: freezed == accountDTOList
          ? _value._accountDTOList
          : accountDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      customerMembershipProgressionDTOList: freezed ==
              customerMembershipProgressionDTOList
          ? _value._customerMembershipProgressionDTOList
          : customerMembershipProgressionDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      customerMembershipRewardsLogDTOList: freezed ==
              customerMembershipRewardsLogDTOList
          ? _value._customerMembershipRewardsLogDTOList
          : customerMembershipRewardsLogDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      customerSignedWaiverDTOList: freezed == customerSignedWaiverDTOList
          ? _value._customerSignedWaiverDTOList
          : customerSignedWaiverDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      customerApprovalLogDTOList: freezed == customerApprovalLogDTOList
          ? _value._customerApprovalLogDTOList
          : customerApprovalLogDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      activeCampaignCustomerInfoDTOList: freezed ==
              activeCampaignCustomerInfoDTOList
          ? _value._activeCampaignCustomerInfoDTOList
          : activeCampaignCustomerInfoDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      lastVisitedDate: freezed == lastVisitedDate
          ? _value.lastVisitedDate
          : lastVisitedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerData with DiagnosticableTreeMixin implements _CustomerData {
  const _$_CustomerData(
      {@JsonKey(name: 'Id')
          required this.id,
      @JsonKey(name: 'IsActive')
          required this.isActive,
      @JsonKey(name: 'IsBonusLoaded')
          required this.isBonusLoaded,
      @JsonKey(name: 'ProfileId')
          required this.profileId,
      @JsonKey(name: 'MembershipId')
          required this.membershipId,
      @JsonKey(name: 'Title')
          this.title,
      @JsonKey(name: 'FirstName')
          required this.firstName,
      @JsonKey(name: 'NickName')
          required this.nickName,
      @JsonKey(name: 'MiddleName')
          required this.middleName,
      @JsonKey(name: 'LastName')
          required this.lastName,
      @JsonKey(name: 'ExternalSystemReference')
          required this.externalSystemReference,
      @JsonKey(name: 'CustomerType')
          required this.customerType,
      @JsonKey(name: 'UniqueIdentifier')
          required this.uniqueIdentifier,
      @JsonKey(name: 'TaxCode')
          required this.taxCode,
      @JsonKey(name: 'DateOfBirth')
          this.dateOfBirth,
      @JsonKey(name: 'Gender')
          required this.gender,
      @JsonKey(name: 'Anniversary')
          this.anniversary,
      @JsonKey(name: 'TeamUser')
          required this.teamUser,
      @JsonKey(name: 'RightHanded')
          required this.rightHanded,
      @JsonKey(name: 'OptInPromotions')
          required this.optInPromotions,
      @JsonKey(name: 'OptInPromotionsMode')
          required this.optInPromotionsMode,
      @JsonKey(name: 'PolicyTermsAccepted')
          required this.policyTermsAccepted,
      @JsonKey(name: 'Company')
          required this.company,
      @JsonKey(name: 'UserName')
          required this.userName,
      @JsonKey(name: 'PhotoURL')
          required this.photoURL,
      @JsonKey(name: 'IdProofFileURL')
          required this.idProofFileURL,
      @JsonKey(name: 'LastLoginTime')
          this.lastLoginTime,
      @JsonKey(name: 'Designation')
          required this.designation,
      @JsonKey(name: 'CustomDataSetId')
          required this.customDataSetId,
      @JsonKey(name: 'Notes')
          required this.notes,
      @JsonKey(name: 'CardNumber')
          this.cardNumber,
      @JsonKey(name: 'Channel')
          this.channel,
      @JsonKey(name: 'Verified')
          required this.verified,
      @JsonKey(name: 'AddressDTOList')
          final List<AddressDTO>? addressDTOList,
      @JsonKey(name: 'ContactDTOList')
          required final List<ContactDTO>? contactDTOList,
      @JsonKey(name: 'ProfileDTO')
          required this.profileDTO,
      @JsonKey(name: 'CustomerVerificationDTO')
          required this.customerVerificationDTO,
      @JsonKey(name: 'CustomDataSetDTO')
          required this.customDataSetDTO,
      @JsonKey(name: 'CreatedBy')
          required this.createdBy,
      @JsonKey(name: 'CreationDate')
          required this.creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          required this.lastUpdatedBy,
      @JsonKey(name: 'LastUpdateDate')
          required this.lastUpdateDate,
      @JsonKey(name: 'SiteId')
          required this.siteId,
      @JsonKey(name: 'MasterEntityId')
          required this.masterEntityId,
      @JsonKey(name: 'SynchStatus')
          required this.synchStatus,
      @JsonKey(name: 'Guid')
          required this.guid,
      @JsonKey(name: 'PhoneNumber')
          required this.phoneNumber,
      @JsonKey(name: 'PhoneContactDTO')
          this.phoneContactDTO,
      @JsonKey(name: 'Password')
          required this.password,
      @JsonKey(name: 'LatestAddressDTO')
          required this.latestAddressDTO,
      @JsonKey(name: 'SecondaryPhoneNumber')
          required this.secondaryPhoneNumber,
      @JsonKey(name: 'FBUserId')
          required this.fbUserId,
      @JsonKey(name: 'FBAccessToken')
          required this.fbAccessToken,
      @JsonKey(name: 'TWAccessToken')
          required this.twAccessToken,
      @JsonKey(name: 'TWAccessSecret')
          required this.twAccessSecret,
      @JsonKey(name: 'Email')
          required this.email,
      @JsonKey(name: 'WeChatAccessToken')
          required this.weChatAccessToken,
      @JsonKey(name: 'IsChanged')
          required this.isChanged,
      @JsonKey(name: 'IsChangedRecursive')
          required this.isChangedRecursive,
      @JsonKey(name: 'CustomerCuponsDT')
          required this.customerCuponsDT,
      @JsonKey(name: 'AccountDTOList')
          required final List<dynamic>? accountDTOList,
      @JsonKey(name: 'CustomerMembershipProgressionDTOList')
          required final List<dynamic>? customerMembershipProgressionDTOList,
      @JsonKey(name: 'CustomerMembershipRewardsLogDTOList')
          required final List<dynamic>? customerMembershipRewardsLogDTOList,
      @JsonKey(name: 'CustomerSignedWaiverDTOList')
          required final List<dynamic>? customerSignedWaiverDTOList,
      @JsonKey(name: 'CustomerApprovalLogDTOList')
          required final List<dynamic>? customerApprovalLogDTOList,
      @JsonKey(name: 'ActiveCampaignCustomerInfoDTOList')
          required final List<dynamic>? activeCampaignCustomerInfoDTOList,
      @JsonKey(name: 'LastVisitedDate')
          required this.lastVisitedDate})
      : _addressDTOList = addressDTOList,
        _contactDTOList = contactDTOList,
        _accountDTOList = accountDTOList,
        _customerMembershipProgressionDTOList =
            customerMembershipProgressionDTOList,
        _customerMembershipRewardsLogDTOList =
            customerMembershipRewardsLogDTOList,
        _customerSignedWaiverDTOList = customerSignedWaiverDTOList,
        _customerApprovalLogDTOList = customerApprovalLogDTOList,
        _activeCampaignCustomerInfoDTOList = activeCampaignCustomerInfoDTOList;

  factory _$_CustomerData.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerDataFromJson(json);

  @override
  @JsonKey(name: 'Id')
  final int id;
  @override
  @JsonKey(name: 'IsActive')
  final bool isActive;
  @override
  @JsonKey(name: 'IsBonusLoaded')
  final bool isBonusLoaded;
  @override
  @JsonKey(name: 'ProfileId')
  final int profileId;
  @override
  @JsonKey(name: 'MembershipId')
  final int membershipId;
  @override
  @JsonKey(name: 'Title')
  final String? title;
  @override
  @JsonKey(name: 'FirstName')
  final String? firstName;
  @override
  @JsonKey(name: 'NickName')
  final String? nickName;
  @override
  @JsonKey(name: 'MiddleName')
  final String? middleName;
  @override
  @JsonKey(name: 'LastName')
  final String? lastName;
  @override
  @JsonKey(name: 'ExternalSystemReference')
  final String? externalSystemReference;
  @override
  @JsonKey(name: 'CustomerType')
  final int customerType;
  @override
  @JsonKey(name: 'UniqueIdentifier')
  final String? uniqueIdentifier;
  @override
  @JsonKey(name: 'TaxCode')
  final String? taxCode;
  @override
  @JsonKey(name: 'DateOfBirth')
  final String? dateOfBirth;
  @override
  @JsonKey(name: 'Gender')
  final String? gender;
  @override
  @JsonKey(name: 'Anniversary')
  final String? anniversary;
  @override
  @JsonKey(name: 'TeamUser')
  final bool teamUser;
  @override
  @JsonKey(name: 'RightHanded')
  final bool rightHanded;
  @override
  @JsonKey(name: 'OptInPromotions')
  final bool optInPromotions;
  @override
  @JsonKey(name: 'OptInPromotionsMode')
  final String? optInPromotionsMode;
  @override
  @JsonKey(name: 'PolicyTermsAccepted')
  final bool policyTermsAccepted;
  @override
  @JsonKey(name: 'Company')
  final String? company;
  @override
  @JsonKey(name: 'UserName')
  final String? userName;
  @override
  @JsonKey(name: 'PhotoURL')
  final String? photoURL;
  @override
  @JsonKey(name: 'IdProofFileURL')
  final String? idProofFileURL;
  @override
  @JsonKey(name: 'LastLoginTime')
  final String? lastLoginTime;
  @override
  @JsonKey(name: 'Designation')
  final String? designation;
  @override
  @JsonKey(name: 'CustomDataSetId')
  final int customDataSetId;
  @override
  @JsonKey(name: 'Notes')
  final String? notes;
  @override
  @JsonKey(name: 'CardNumber')
  final String? cardNumber;
  @override
  @JsonKey(name: 'Channel')
  final String? channel;
  @override
  @JsonKey(name: 'Verified')
  final bool verified;
  final List<AddressDTO>? _addressDTOList;
  @override
  @JsonKey(name: 'AddressDTOList')
  List<AddressDTO>? get addressDTOList {
    final value = _addressDTOList;
    if (value == null) return null;
    if (_addressDTOList is EqualUnmodifiableListView) return _addressDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ContactDTO>? _contactDTOList;
  @override
  @JsonKey(name: 'ContactDTOList')
  List<ContactDTO>? get contactDTOList {
    final value = _contactDTOList;
    if (value == null) return null;
    if (_contactDTOList is EqualUnmodifiableListView) return _contactDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'ProfileDTO')
  final ProfileDTO? profileDTO;
  @override
  @JsonKey(name: 'CustomerVerificationDTO')
  final dynamic customerVerificationDTO;
  @override
  @JsonKey(name: 'CustomDataSetDTO')
  final CustomDataSetDTO? customDataSetDTO;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'CreationDate')
  final String? creationDate;
  @override
  @JsonKey(name: 'LastUpdatedBy')
  final String? lastUpdatedBy;
  @override
  @JsonKey(name: 'LastUpdateDate')
  final String? lastUpdateDate;
  @override
  @JsonKey(name: 'SiteId')
  final int siteId;
  @override
  @JsonKey(name: 'MasterEntityId')
  final int masterEntityId;
  @override
  @JsonKey(name: 'SynchStatus')
  final bool synchStatus;
  @override
  @JsonKey(name: 'Guid')
  final String? guid;
  @override
  @JsonKey(name: 'PhoneNumber')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'PhoneContactDTO')
  final ContactDTO? phoneContactDTO;
  @override
  @JsonKey(name: 'Password')
  final String? password;
  @override
  @JsonKey(name: 'LatestAddressDTO')
  final AddressDTO? latestAddressDTO;
  @override
  @JsonKey(name: 'SecondaryPhoneNumber')
  final String? secondaryPhoneNumber;
  @override
  @JsonKey(name: 'FBUserId')
  final String? fbUserId;
  @override
  @JsonKey(name: 'FBAccessToken')
  final String? fbAccessToken;
  @override
  @JsonKey(name: 'TWAccessToken')
  final String? twAccessToken;
  @override
  @JsonKey(name: 'TWAccessSecret')
  final String? twAccessSecret;
  @override
  @JsonKey(name: 'Email')
  final String? email;
  @override
  @JsonKey(name: 'WeChatAccessToken')
  final String? weChatAccessToken;
  @override
  @JsonKey(name: 'IsChanged')
  final bool isChanged;
  @override
  @JsonKey(name: 'IsChangedRecursive')
  final bool isChangedRecursive;
  @override
  @JsonKey(name: 'CustomerCuponsDT')
  final dynamic customerCuponsDT;
  final List<dynamic>? _accountDTOList;
  @override
  @JsonKey(name: 'AccountDTOList')
  List<dynamic>? get accountDTOList {
    final value = _accountDTOList;
    if (value == null) return null;
    if (_accountDTOList is EqualUnmodifiableListView) return _accountDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _customerMembershipProgressionDTOList;
  @override
  @JsonKey(name: 'CustomerMembershipProgressionDTOList')
  List<dynamic>? get customerMembershipProgressionDTOList {
    final value = _customerMembershipProgressionDTOList;
    if (value == null) return null;
    if (_customerMembershipProgressionDTOList is EqualUnmodifiableListView)
      return _customerMembershipProgressionDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _customerMembershipRewardsLogDTOList;
  @override
  @JsonKey(name: 'CustomerMembershipRewardsLogDTOList')
  List<dynamic>? get customerMembershipRewardsLogDTOList {
    final value = _customerMembershipRewardsLogDTOList;
    if (value == null) return null;
    if (_customerMembershipRewardsLogDTOList is EqualUnmodifiableListView)
      return _customerMembershipRewardsLogDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _customerSignedWaiverDTOList;
  @override
  @JsonKey(name: 'CustomerSignedWaiverDTOList')
  List<dynamic>? get customerSignedWaiverDTOList {
    final value = _customerSignedWaiverDTOList;
    if (value == null) return null;
    if (_customerSignedWaiverDTOList is EqualUnmodifiableListView)
      return _customerSignedWaiverDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _customerApprovalLogDTOList;
  @override
  @JsonKey(name: 'CustomerApprovalLogDTOList')
  List<dynamic>? get customerApprovalLogDTOList {
    final value = _customerApprovalLogDTOList;
    if (value == null) return null;
    if (_customerApprovalLogDTOList is EqualUnmodifiableListView)
      return _customerApprovalLogDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _activeCampaignCustomerInfoDTOList;
  @override
  @JsonKey(name: 'ActiveCampaignCustomerInfoDTOList')
  List<dynamic>? get activeCampaignCustomerInfoDTOList {
    final value = _activeCampaignCustomerInfoDTOList;
    if (value == null) return null;
    if (_activeCampaignCustomerInfoDTOList is EqualUnmodifiableListView)
      return _activeCampaignCustomerInfoDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'LastVisitedDate')
  final String? lastVisitedDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CustomerData(id: $id, isActive: $isActive, isBonusLoaded: $isBonusLoaded, profileId: $profileId, membershipId: $membershipId, title: $title, firstName: $firstName, nickName: $nickName, middleName: $middleName, lastName: $lastName, externalSystemReference: $externalSystemReference, customerType: $customerType, uniqueIdentifier: $uniqueIdentifier, taxCode: $taxCode, dateOfBirth: $dateOfBirth, gender: $gender, anniversary: $anniversary, teamUser: $teamUser, rightHanded: $rightHanded, optInPromotions: $optInPromotions, optInPromotionsMode: $optInPromotionsMode, policyTermsAccepted: $policyTermsAccepted, company: $company, userName: $userName, photoURL: $photoURL, idProofFileURL: $idProofFileURL, lastLoginTime: $lastLoginTime, designation: $designation, customDataSetId: $customDataSetId, notes: $notes, cardNumber: $cardNumber, channel: $channel, verified: $verified, addressDTOList: $addressDTOList, contactDTOList: $contactDTOList, profileDTO: $profileDTO, customerVerificationDTO: $customerVerificationDTO, customDataSetDTO: $customDataSetDTO, createdBy: $createdBy, creationDate: $creationDate, lastUpdatedBy: $lastUpdatedBy, lastUpdateDate: $lastUpdateDate, siteId: $siteId, masterEntityId: $masterEntityId, synchStatus: $synchStatus, guid: $guid, phoneNumber: $phoneNumber, phoneContactDTO: $phoneContactDTO, password: $password, latestAddressDTO: $latestAddressDTO, secondaryPhoneNumber: $secondaryPhoneNumber, fbUserId: $fbUserId, fbAccessToken: $fbAccessToken, twAccessToken: $twAccessToken, twAccessSecret: $twAccessSecret, email: $email, weChatAccessToken: $weChatAccessToken, isChanged: $isChanged, isChangedRecursive: $isChangedRecursive, customerCuponsDT: $customerCuponsDT, accountDTOList: $accountDTOList, customerMembershipProgressionDTOList: $customerMembershipProgressionDTOList, customerMembershipRewardsLogDTOList: $customerMembershipRewardsLogDTOList, customerSignedWaiverDTOList: $customerSignedWaiverDTOList, customerApprovalLogDTOList: $customerApprovalLogDTOList, activeCampaignCustomerInfoDTOList: $activeCampaignCustomerInfoDTOList, lastVisitedDate: $lastVisitedDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CustomerData'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('isActive', isActive))
      ..add(DiagnosticsProperty('isBonusLoaded', isBonusLoaded))
      ..add(DiagnosticsProperty('profileId', profileId))
      ..add(DiagnosticsProperty('membershipId', membershipId))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('nickName', nickName))
      ..add(DiagnosticsProperty('middleName', middleName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty(
          'externalSystemReference', externalSystemReference))
      ..add(DiagnosticsProperty('customerType', customerType))
      ..add(DiagnosticsProperty('uniqueIdentifier', uniqueIdentifier))
      ..add(DiagnosticsProperty('taxCode', taxCode))
      ..add(DiagnosticsProperty('dateOfBirth', dateOfBirth))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('anniversary', anniversary))
      ..add(DiagnosticsProperty('teamUser', teamUser))
      ..add(DiagnosticsProperty('rightHanded', rightHanded))
      ..add(DiagnosticsProperty('optInPromotions', optInPromotions))
      ..add(DiagnosticsProperty('optInPromotionsMode', optInPromotionsMode))
      ..add(DiagnosticsProperty('policyTermsAccepted', policyTermsAccepted))
      ..add(DiagnosticsProperty('company', company))
      ..add(DiagnosticsProperty('userName', userName))
      ..add(DiagnosticsProperty('photoURL', photoURL))
      ..add(DiagnosticsProperty('idProofFileURL', idProofFileURL))
      ..add(DiagnosticsProperty('lastLoginTime', lastLoginTime))
      ..add(DiagnosticsProperty('designation', designation))
      ..add(DiagnosticsProperty('customDataSetId', customDataSetId))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('cardNumber', cardNumber))
      ..add(DiagnosticsProperty('channel', channel))
      ..add(DiagnosticsProperty('verified', verified))
      ..add(DiagnosticsProperty('addressDTOList', addressDTOList))
      ..add(DiagnosticsProperty('contactDTOList', contactDTOList))
      ..add(DiagnosticsProperty('profileDTO', profileDTO))
      ..add(DiagnosticsProperty(
          'customerVerificationDTO', customerVerificationDTO))
      ..add(DiagnosticsProperty('customDataSetDTO', customDataSetDTO))
      ..add(DiagnosticsProperty('createdBy', createdBy))
      ..add(DiagnosticsProperty('creationDate', creationDate))
      ..add(DiagnosticsProperty('lastUpdatedBy', lastUpdatedBy))
      ..add(DiagnosticsProperty('lastUpdateDate', lastUpdateDate))
      ..add(DiagnosticsProperty('siteId', siteId))
      ..add(DiagnosticsProperty('masterEntityId', masterEntityId))
      ..add(DiagnosticsProperty('synchStatus', synchStatus))
      ..add(DiagnosticsProperty('guid', guid))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('phoneContactDTO', phoneContactDTO))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('latestAddressDTO', latestAddressDTO))
      ..add(DiagnosticsProperty('secondaryPhoneNumber', secondaryPhoneNumber))
      ..add(DiagnosticsProperty('fbUserId', fbUserId))
      ..add(DiagnosticsProperty('fbAccessToken', fbAccessToken))
      ..add(DiagnosticsProperty('twAccessToken', twAccessToken))
      ..add(DiagnosticsProperty('twAccessSecret', twAccessSecret))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('weChatAccessToken', weChatAccessToken))
      ..add(DiagnosticsProperty('isChanged', isChanged))
      ..add(DiagnosticsProperty('isChangedRecursive', isChangedRecursive))
      ..add(DiagnosticsProperty('customerCuponsDT', customerCuponsDT))
      ..add(DiagnosticsProperty('accountDTOList', accountDTOList))
      ..add(DiagnosticsProperty('customerMembershipProgressionDTOList',
          customerMembershipProgressionDTOList))
      ..add(DiagnosticsProperty('customerMembershipRewardsLogDTOList',
          customerMembershipRewardsLogDTOList))
      ..add(DiagnosticsProperty(
          'customerSignedWaiverDTOList', customerSignedWaiverDTOList))
      ..add(DiagnosticsProperty(
          'customerApprovalLogDTOList', customerApprovalLogDTOList))
      ..add(DiagnosticsProperty('activeCampaignCustomerInfoDTOList',
          activeCampaignCustomerInfoDTOList))
      ..add(DiagnosticsProperty('lastVisitedDate', lastVisitedDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isBonusLoaded, isBonusLoaded) ||
                other.isBonusLoaded == isBonusLoaded) &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.membershipId, membershipId) ||
                other.membershipId == membershipId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.externalSystemReference, externalSystemReference) ||
                other.externalSystemReference == externalSystemReference) &&
            (identical(other.customerType, customerType) ||
                other.customerType == customerType) &&
            (identical(other.uniqueIdentifier, uniqueIdentifier) ||
                other.uniqueIdentifier == uniqueIdentifier) &&
            (identical(other.taxCode, taxCode) || other.taxCode == taxCode) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.anniversary, anniversary) ||
                other.anniversary == anniversary) &&
            (identical(other.teamUser, teamUser) ||
                other.teamUser == teamUser) &&
            (identical(other.rightHanded, rightHanded) ||
                other.rightHanded == rightHanded) &&
            (identical(other.optInPromotions, optInPromotions) ||
                other.optInPromotions == optInPromotions) &&
            (identical(other.optInPromotionsMode, optInPromotionsMode) ||
                other.optInPromotionsMode == optInPromotionsMode) &&
            (identical(other.policyTermsAccepted, policyTermsAccepted) ||
                other.policyTermsAccepted == policyTermsAccepted) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.photoURL, photoURL) ||
                other.photoURL == photoURL) &&
            (identical(other.idProofFileURL, idProofFileURL) ||
                other.idProofFileURL == idProofFileURL) &&
            (identical(other.lastLoginTime, lastLoginTime) ||
                other.lastLoginTime == lastLoginTime) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.customDataSetId, customDataSetId) ||
                other.customDataSetId == customDataSetId) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            const DeepCollectionEquality()
                .equals(other._addressDTOList, _addressDTOList) &&
            const DeepCollectionEquality()
                .equals(other._contactDTOList, _contactDTOList) &&
            (identical(other.profileDTO, profileDTO) ||
                other.profileDTO == profileDTO) &&
            const DeepCollectionEquality().equals(
                other.customerVerificationDTO, customerVerificationDTO) &&
            (identical(other.customDataSetDTO, customDataSetDTO) ||
                other.customDataSetDTO == customDataSetDTO) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.lastUpdatedBy, lastUpdatedBy) ||
                other.lastUpdatedBy == lastUpdatedBy) &&
            (identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.masterEntityId, masterEntityId) || other.masterEntityId == masterEntityId) &&
            (identical(other.synchStatus, synchStatus) || other.synchStatus == synchStatus) &&
            (identical(other.guid, guid) || other.guid == guid) &&
            (identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber) &&
            (identical(other.phoneContactDTO, phoneContactDTO) || other.phoneContactDTO == phoneContactDTO) &&
            (identical(other.password, password) || other.password == password) &&
            (identical(other.latestAddressDTO, latestAddressDTO) || other.latestAddressDTO == latestAddressDTO) &&
            (identical(other.secondaryPhoneNumber, secondaryPhoneNumber) || other.secondaryPhoneNumber == secondaryPhoneNumber) &&
            (identical(other.fbUserId, fbUserId) || other.fbUserId == fbUserId) &&
            (identical(other.fbAccessToken, fbAccessToken) || other.fbAccessToken == fbAccessToken) &&
            (identical(other.twAccessToken, twAccessToken) || other.twAccessToken == twAccessToken) &&
            (identical(other.twAccessSecret, twAccessSecret) || other.twAccessSecret == twAccessSecret) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.weChatAccessToken, weChatAccessToken) || other.weChatAccessToken == weChatAccessToken) &&
            (identical(other.isChanged, isChanged) || other.isChanged == isChanged) &&
            (identical(other.isChangedRecursive, isChangedRecursive) || other.isChangedRecursive == isChangedRecursive) &&
            const DeepCollectionEquality().equals(other.customerCuponsDT, customerCuponsDT) &&
            const DeepCollectionEquality().equals(other._accountDTOList, _accountDTOList) &&
            const DeepCollectionEquality().equals(other._customerMembershipProgressionDTOList, _customerMembershipProgressionDTOList) &&
            const DeepCollectionEquality().equals(other._customerMembershipRewardsLogDTOList, _customerMembershipRewardsLogDTOList) &&
            const DeepCollectionEquality().equals(other._customerSignedWaiverDTOList, _customerSignedWaiverDTOList) &&
            const DeepCollectionEquality().equals(other._customerApprovalLogDTOList, _customerApprovalLogDTOList) &&
            const DeepCollectionEquality().equals(other._activeCampaignCustomerInfoDTOList, _activeCampaignCustomerInfoDTOList) &&
            (identical(other.lastVisitedDate, lastVisitedDate) || other.lastVisitedDate == lastVisitedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        isActive,
        isBonusLoaded,
        profileId,
        membershipId,
        title,
        firstName,
        nickName,
        middleName,
        lastName,
        externalSystemReference,
        customerType,
        uniqueIdentifier,
        taxCode,
        dateOfBirth,
        gender,
        anniversary,
        teamUser,
        rightHanded,
        optInPromotions,
        optInPromotionsMode,
        policyTermsAccepted,
        company,
        userName,
        photoURL,
        idProofFileURL,
        lastLoginTime,
        designation,
        customDataSetId,
        notes,
        cardNumber,
        channel,
        verified,
        const DeepCollectionEquality().hash(_addressDTOList),
        const DeepCollectionEquality().hash(_contactDTOList),
        profileDTO,
        const DeepCollectionEquality().hash(customerVerificationDTO),
        customDataSetDTO,
        createdBy,
        creationDate,
        lastUpdatedBy,
        lastUpdateDate,
        siteId,
        masterEntityId,
        synchStatus,
        guid,
        phoneNumber,
        phoneContactDTO,
        password,
        latestAddressDTO,
        secondaryPhoneNumber,
        fbUserId,
        fbAccessToken,
        twAccessToken,
        twAccessSecret,
        email,
        weChatAccessToken,
        isChanged,
        isChangedRecursive,
        const DeepCollectionEquality().hash(customerCuponsDT),
        const DeepCollectionEquality().hash(_accountDTOList),
        const DeepCollectionEquality()
            .hash(_customerMembershipProgressionDTOList),
        const DeepCollectionEquality()
            .hash(_customerMembershipRewardsLogDTOList),
        const DeepCollectionEquality().hash(_customerSignedWaiverDTOList),
        const DeepCollectionEquality().hash(_customerApprovalLogDTOList),
        const DeepCollectionEquality().hash(_activeCampaignCustomerInfoDTOList),
        lastVisitedDate
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerDataCopyWith<_$_CustomerData> get copyWith =>
      __$$_CustomerDataCopyWithImpl<_$_CustomerData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerDataToJson(
      this,
    );
  }
}

abstract class _CustomerData implements CustomerData {
  const factory _CustomerData(
      {@JsonKey(name: 'Id')
          required final int id,
      @JsonKey(name: 'IsActive')
          required final bool isActive,
      @JsonKey(name: 'IsBonusLoaded')
          required final bool isBonusLoaded,
      @JsonKey(name: 'ProfileId')
          required final int profileId,
      @JsonKey(name: 'MembershipId')
          required final int membershipId,
      @JsonKey(name: 'Title')
          final String? title,
      @JsonKey(name: 'FirstName')
          required final String? firstName,
      @JsonKey(name: 'NickName')
          required final String? nickName,
      @JsonKey(name: 'MiddleName')
          required final String? middleName,
      @JsonKey(name: 'LastName')
          required final String? lastName,
      @JsonKey(name: 'ExternalSystemReference')
          required final String? externalSystemReference,
      @JsonKey(name: 'CustomerType')
          required final int customerType,
      @JsonKey(name: 'UniqueIdentifier')
          required final String? uniqueIdentifier,
      @JsonKey(name: 'TaxCode')
          required final String? taxCode,
      @JsonKey(name: 'DateOfBirth')
          final String? dateOfBirth,
      @JsonKey(name: 'Gender')
          required final String? gender,
      @JsonKey(name: 'Anniversary')
          final String? anniversary,
      @JsonKey(name: 'TeamUser')
          required final bool teamUser,
      @JsonKey(name: 'RightHanded')
          required final bool rightHanded,
      @JsonKey(name: 'OptInPromotions')
          required final bool optInPromotions,
      @JsonKey(name: 'OptInPromotionsMode')
          required final String? optInPromotionsMode,
      @JsonKey(name: 'PolicyTermsAccepted')
          required final bool policyTermsAccepted,
      @JsonKey(name: 'Company')
          required final String? company,
      @JsonKey(name: 'UserName')
          required final String? userName,
      @JsonKey(name: 'PhotoURL')
          required final String? photoURL,
      @JsonKey(name: 'IdProofFileURL')
          required final String? idProofFileURL,
      @JsonKey(name: 'LastLoginTime')
          final String? lastLoginTime,
      @JsonKey(name: 'Designation')
          required final String? designation,
      @JsonKey(name: 'CustomDataSetId')
          required final int customDataSetId,
      @JsonKey(name: 'Notes')
          required final String? notes,
      @JsonKey(name: 'CardNumber')
          final String? cardNumber,
      @JsonKey(name: 'Channel')
          final String? channel,
      @JsonKey(name: 'Verified')
          required final bool verified,
      @JsonKey(name: 'AddressDTOList')
          final List<AddressDTO>? addressDTOList,
      @JsonKey(name: 'ContactDTOList')
          required final List<ContactDTO>? contactDTOList,
      @JsonKey(name: 'ProfileDTO')
          required final ProfileDTO? profileDTO,
      @JsonKey(name: 'CustomerVerificationDTO')
          required final dynamic customerVerificationDTO,
      @JsonKey(name: 'CustomDataSetDTO')
          required final CustomDataSetDTO? customDataSetDTO,
      @JsonKey(name: 'CreatedBy')
          required final String? createdBy,
      @JsonKey(name: 'CreationDate')
          required final String? creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          required final String? lastUpdatedBy,
      @JsonKey(name: 'LastUpdateDate')
          required final String? lastUpdateDate,
      @JsonKey(name: 'SiteId')
          required final int siteId,
      @JsonKey(name: 'MasterEntityId')
          required final int masterEntityId,
      @JsonKey(name: 'SynchStatus')
          required final bool synchStatus,
      @JsonKey(name: 'Guid')
          required final String? guid,
      @JsonKey(name: 'PhoneNumber')
          required final String? phoneNumber,
      @JsonKey(name: 'PhoneContactDTO')
          final ContactDTO? phoneContactDTO,
      @JsonKey(name: 'Password')
          required final String? password,
      @JsonKey(name: 'LatestAddressDTO')
          required final AddressDTO? latestAddressDTO,
      @JsonKey(name: 'SecondaryPhoneNumber')
          required final String? secondaryPhoneNumber,
      @JsonKey(name: 'FBUserId')
          required final String? fbUserId,
      @JsonKey(name: 'FBAccessToken')
          required final String? fbAccessToken,
      @JsonKey(name: 'TWAccessToken')
          required final String? twAccessToken,
      @JsonKey(name: 'TWAccessSecret')
          required final String? twAccessSecret,
      @JsonKey(name: 'Email')
          required final String? email,
      @JsonKey(name: 'WeChatAccessToken')
          required final String? weChatAccessToken,
      @JsonKey(name: 'IsChanged')
          required final bool isChanged,
      @JsonKey(name: 'IsChangedRecursive')
          required final bool isChangedRecursive,
      @JsonKey(name: 'CustomerCuponsDT')
          required final dynamic customerCuponsDT,
      @JsonKey(name: 'AccountDTOList')
          required final List<dynamic>? accountDTOList,
      @JsonKey(name: 'CustomerMembershipProgressionDTOList')
          required final List<dynamic>? customerMembershipProgressionDTOList,
      @JsonKey(name: 'CustomerMembershipRewardsLogDTOList')
          required final List<dynamic>? customerMembershipRewardsLogDTOList,
      @JsonKey(name: 'CustomerSignedWaiverDTOList')
          required final List<dynamic>? customerSignedWaiverDTOList,
      @JsonKey(name: 'CustomerApprovalLogDTOList')
          required final List<dynamic>? customerApprovalLogDTOList,
      @JsonKey(name: 'ActiveCampaignCustomerInfoDTOList')
          required final List<dynamic>? activeCampaignCustomerInfoDTOList,
      @JsonKey(name: 'LastVisitedDate')
          required final String? lastVisitedDate}) = _$_CustomerData;

  factory _CustomerData.fromJson(Map<String, dynamic> json) =
      _$_CustomerData.fromJson;

  @override
  @JsonKey(name: 'Id')
  int get id;
  @override
  @JsonKey(name: 'IsActive')
  bool get isActive;
  @override
  @JsonKey(name: 'IsBonusLoaded')
  bool get isBonusLoaded;
  @override
  @JsonKey(name: 'ProfileId')
  int get profileId;
  @override
  @JsonKey(name: 'MembershipId')
  int get membershipId;
  @override
  @JsonKey(name: 'Title')
  String? get title;
  @override
  @JsonKey(name: 'FirstName')
  String? get firstName;
  @override
  @JsonKey(name: 'NickName')
  String? get nickName;
  @override
  @JsonKey(name: 'MiddleName')
  String? get middleName;
  @override
  @JsonKey(name: 'LastName')
  String? get lastName;
  @override
  @JsonKey(name: 'ExternalSystemReference')
  String? get externalSystemReference;
  @override
  @JsonKey(name: 'CustomerType')
  int get customerType;
  @override
  @JsonKey(name: 'UniqueIdentifier')
  String? get uniqueIdentifier;
  @override
  @JsonKey(name: 'TaxCode')
  String? get taxCode;
  @override
  @JsonKey(name: 'DateOfBirth')
  String? get dateOfBirth;
  @override
  @JsonKey(name: 'Gender')
  String? get gender;
  @override
  @JsonKey(name: 'Anniversary')
  String? get anniversary;
  @override
  @JsonKey(name: 'TeamUser')
  bool get teamUser;
  @override
  @JsonKey(name: 'RightHanded')
  bool get rightHanded;
  @override
  @JsonKey(name: 'OptInPromotions')
  bool get optInPromotions;
  @override
  @JsonKey(name: 'OptInPromotionsMode')
  String? get optInPromotionsMode;
  @override
  @JsonKey(name: 'PolicyTermsAccepted')
  bool get policyTermsAccepted;
  @override
  @JsonKey(name: 'Company')
  String? get company;
  @override
  @JsonKey(name: 'UserName')
  String? get userName;
  @override
  @JsonKey(name: 'PhotoURL')
  String? get photoURL;
  @override
  @JsonKey(name: 'IdProofFileURL')
  String? get idProofFileURL;
  @override
  @JsonKey(name: 'LastLoginTime')
  String? get lastLoginTime;
  @override
  @JsonKey(name: 'Designation')
  String? get designation;
  @override
  @JsonKey(name: 'CustomDataSetId')
  int get customDataSetId;
  @override
  @JsonKey(name: 'Notes')
  String? get notes;
  @override
  @JsonKey(name: 'CardNumber')
  String? get cardNumber;
  @override
  @JsonKey(name: 'Channel')
  String? get channel;
  @override
  @JsonKey(name: 'Verified')
  bool get verified;
  @override
  @JsonKey(name: 'AddressDTOList')
  List<AddressDTO>? get addressDTOList;
  @override
  @JsonKey(name: 'ContactDTOList')
  List<ContactDTO>? get contactDTOList;
  @override
  @JsonKey(name: 'ProfileDTO')
  ProfileDTO? get profileDTO;
  @override
  @JsonKey(name: 'CustomerVerificationDTO')
  dynamic get customerVerificationDTO;
  @override
  @JsonKey(name: 'CustomDataSetDTO')
  CustomDataSetDTO? get customDataSetDTO;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'CreationDate')
  String? get creationDate;
  @override
  @JsonKey(name: 'LastUpdatedBy')
  String? get lastUpdatedBy;
  @override
  @JsonKey(name: 'LastUpdateDate')
  String? get lastUpdateDate;
  @override
  @JsonKey(name: 'SiteId')
  int get siteId;
  @override
  @JsonKey(name: 'MasterEntityId')
  int get masterEntityId;
  @override
  @JsonKey(name: 'SynchStatus')
  bool get synchStatus;
  @override
  @JsonKey(name: 'Guid')
  String? get guid;
  @override
  @JsonKey(name: 'PhoneNumber')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'PhoneContactDTO')
  ContactDTO? get phoneContactDTO;
  @override
  @JsonKey(name: 'Password')
  String? get password;
  @override
  @JsonKey(name: 'LatestAddressDTO')
  AddressDTO? get latestAddressDTO;
  @override
  @JsonKey(name: 'SecondaryPhoneNumber')
  String? get secondaryPhoneNumber;
  @override
  @JsonKey(name: 'FBUserId')
  String? get fbUserId;
  @override
  @JsonKey(name: 'FBAccessToken')
  String? get fbAccessToken;
  @override
  @JsonKey(name: 'TWAccessToken')
  String? get twAccessToken;
  @override
  @JsonKey(name: 'TWAccessSecret')
  String? get twAccessSecret;
  @override
  @JsonKey(name: 'Email')
  String? get email;
  @override
  @JsonKey(name: 'WeChatAccessToken')
  String? get weChatAccessToken;
  @override
  @JsonKey(name: 'IsChanged')
  bool get isChanged;
  @override
  @JsonKey(name: 'IsChangedRecursive')
  bool get isChangedRecursive;
  @override
  @JsonKey(name: 'CustomerCuponsDT')
  dynamic get customerCuponsDT;
  @override
  @JsonKey(name: 'AccountDTOList')
  List<dynamic>? get accountDTOList;
  @override
  @JsonKey(name: 'CustomerMembershipProgressionDTOList')
  List<dynamic>? get customerMembershipProgressionDTOList;
  @override
  @JsonKey(name: 'CustomerMembershipRewardsLogDTOList')
  List<dynamic>? get customerMembershipRewardsLogDTOList;
  @override
  @JsonKey(name: 'CustomerSignedWaiverDTOList')
  List<dynamic>? get customerSignedWaiverDTOList;
  @override
  @JsonKey(name: 'CustomerApprovalLogDTOList')
  List<dynamic>? get customerApprovalLogDTOList;
  @override
  @JsonKey(name: 'ActiveCampaignCustomerInfoDTOList')
  List<dynamic>? get activeCampaignCustomerInfoDTOList;
  @override
  @JsonKey(name: 'LastVisitedDate')
  String? get lastVisitedDate;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerDataCopyWith<_$_CustomerData> get copyWith =>
      throw _privateConstructorUsedError;
}
