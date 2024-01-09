// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileDTO _$ProfileDTOFromJson(Map<String, dynamic> json) {
  return _ProfileDTO.fromJson(json);
}

/// @nodoc
mixin _$ProfileDTO {
  @JsonKey(name: 'Id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProfileTypeId')
  int get profileTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProfileType')
  int get profileType => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'Notes')
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateOfBirth')
  String? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'Gender')
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'Anniversary')
  String? get anniversary => throw _privateConstructorUsedError;
  @JsonKey(name: 'PhotoURL')
  String? get photoURL => throw _privateConstructorUsedError;
  @JsonKey(name: 'RightHanded')
  bool get rightHanded => throw _privateConstructorUsedError;
  @JsonKey(name: 'TeamUser')
  bool get teamUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'UniqueIdentifier')
  String? get uniqueIdentifier => throw _privateConstructorUsedError;
  @JsonKey(name: 'IdProofFileURL')
  String? get idProofFileURL => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxCode')
  String? get taxCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'Designation')
  String? get designation => throw _privateConstructorUsedError;
  @JsonKey(name: 'Company')
  String? get company => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserName')
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Password')
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastLoginTime')
  String? get lastLoginTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactDTOList')
  List<ContactDTO>? get contactDTOList => throw _privateConstructorUsedError;
  @JsonKey(name: 'AddressDTOList')
  List<AddressDTO>? get addressDTOList => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProfileContentHistoryDTOList')
  dynamic get profileContentHistoryDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'OptInPromotions')
  bool get optInPromotions => throw _privateConstructorUsedError;
  @JsonKey(name: 'OptInPromotionsMode')
  String? get optInPromotionsMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'OptInLastUpdatedDate')
  String? get optInLastUpdatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'PolicyTermsAccepted')
  bool get policyTermsAccepted => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool get isActive => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'ExternalSystemReference')
  String? get externalSystemReference => throw _privateConstructorUsedError;
  @JsonKey(name: 'OptOutWhatsApp')
  bool get optOutWhatsApp => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserStatus')
  String? get userStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'PasswordChangeDate')
  String? get passwordChangeDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'InvalidAccessAttempts')
  int get invalidAccessAttempts => throw _privateConstructorUsedError;
  @JsonKey(name: 'LockedOutTime')
  String? get lockedOutTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'PasswordChangeOnNextLogin')
  bool get passwordChangeOnNextLogin => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsChanged')
  bool get isChanged => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsChangedRecursive')
  bool get isChangedRecursive => throw _privateConstructorUsedError;
  @JsonKey(name: 'Channel')
  String? get channel => throw _privateConstructorUsedError;
  @JsonKey(name: 'Verified')
  bool? get verified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileDTOCopyWith<ProfileDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDTOCopyWith<$Res> {
  factory $ProfileDTOCopyWith(
          ProfileDTO value, $Res Function(ProfileDTO) then) =
      _$ProfileDTOCopyWithImpl<$Res, ProfileDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Id')
          int id,
      @JsonKey(name: 'ProfileTypeId')
          int profileTypeId,
      @JsonKey(name: 'ProfileType')
          int profileType,
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
      @JsonKey(name: 'Notes')
          String? notes,
      @JsonKey(name: 'DateOfBirth')
          String? dateOfBirth,
      @JsonKey(name: 'Gender')
          String? gender,
      @JsonKey(name: 'Anniversary')
          String? anniversary,
      @JsonKey(name: 'PhotoURL')
          String? photoURL,
      @JsonKey(name: 'RightHanded')
          bool rightHanded,
      @JsonKey(name: 'TeamUser')
          bool teamUser,
      @JsonKey(name: 'UniqueIdentifier')
          String? uniqueIdentifier,
      @JsonKey(name: 'IdProofFileURL')
          String? idProofFileURL,
      @JsonKey(name: 'TaxCode')
          String? taxCode,
      @JsonKey(name: 'Designation')
          String? designation,
      @JsonKey(name: 'Company')
          String? company,
      @JsonKey(name: 'UserName')
          String? userName,
      @JsonKey(name: 'Password')
          String? password,
      @JsonKey(name: 'LastLoginTime')
          String? lastLoginTime,
      @JsonKey(name: 'ContactDTOList')
          List<ContactDTO>? contactDTOList,
      @JsonKey(name: 'AddressDTOList')
          List<AddressDTO>? addressDTOList,
      @JsonKey(name: 'ProfileContentHistoryDTOList')
          dynamic profileContentHistoryDTOList,
      @JsonKey(name: 'OptInPromotions')
          bool optInPromotions,
      @JsonKey(name: 'OptInPromotionsMode')
          String? optInPromotionsMode,
      @JsonKey(name: 'OptInLastUpdatedDate')
          String? optInLastUpdatedDate,
      @JsonKey(name: 'PolicyTermsAccepted')
          bool policyTermsAccepted,
      @JsonKey(name: 'IsActive')
          bool isActive,
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
      @JsonKey(name: 'ExternalSystemReference')
          String? externalSystemReference,
      @JsonKey(name: 'OptOutWhatsApp')
          bool optOutWhatsApp,
      @JsonKey(name: 'UserStatus')
          String? userStatus,
      @JsonKey(name: 'PasswordChangeDate')
          String? passwordChangeDate,
      @JsonKey(name: 'InvalidAccessAttempts')
          int invalidAccessAttempts,
      @JsonKey(name: 'LockedOutTime')
          String? lockedOutTime,
      @JsonKey(name: 'PasswordChangeOnNextLogin')
          bool passwordChangeOnNextLogin,
      @JsonKey(name: 'IsChanged')
          bool isChanged,
      @JsonKey(name: 'IsChangedRecursive')
          bool isChangedRecursive,
      @JsonKey(name: 'Channel')
          String? channel,
      @JsonKey(name: 'Verified')
          bool? verified});
}

/// @nodoc
class _$ProfileDTOCopyWithImpl<$Res, $Val extends ProfileDTO>
    implements $ProfileDTOCopyWith<$Res> {
  _$ProfileDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? profileTypeId = null,
    Object? profileType = null,
    Object? title = freezed,
    Object? firstName = freezed,
    Object? nickName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? notes = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? anniversary = freezed,
    Object? photoURL = freezed,
    Object? rightHanded = null,
    Object? teamUser = null,
    Object? uniqueIdentifier = freezed,
    Object? idProofFileURL = freezed,
    Object? taxCode = freezed,
    Object? designation = freezed,
    Object? company = freezed,
    Object? userName = freezed,
    Object? password = freezed,
    Object? lastLoginTime = freezed,
    Object? contactDTOList = freezed,
    Object? addressDTOList = freezed,
    Object? profileContentHistoryDTOList = freezed,
    Object? optInPromotions = null,
    Object? optInPromotionsMode = freezed,
    Object? optInLastUpdatedDate = freezed,
    Object? policyTermsAccepted = null,
    Object? isActive = null,
    Object? createdBy = freezed,
    Object? creationDate = freezed,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdateDate = freezed,
    Object? siteId = null,
    Object? masterEntityId = null,
    Object? synchStatus = null,
    Object? guid = freezed,
    Object? externalSystemReference = freezed,
    Object? optOutWhatsApp = null,
    Object? userStatus = freezed,
    Object? passwordChangeDate = freezed,
    Object? invalidAccessAttempts = null,
    Object? lockedOutTime = freezed,
    Object? passwordChangeOnNextLogin = null,
    Object? isChanged = null,
    Object? isChangedRecursive = null,
    Object? channel = freezed,
    Object? verified = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      profileTypeId: null == profileTypeId
          ? _value.profileTypeId
          : profileTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      profileType: null == profileType
          ? _value.profileType
          : profileType // ignore: cast_nullable_to_non_nullable
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
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
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
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      rightHanded: null == rightHanded
          ? _value.rightHanded
          : rightHanded // ignore: cast_nullable_to_non_nullable
              as bool,
      teamUser: null == teamUser
          ? _value.teamUser
          : teamUser // ignore: cast_nullable_to_non_nullable
              as bool,
      uniqueIdentifier: freezed == uniqueIdentifier
          ? _value.uniqueIdentifier
          : uniqueIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      idProofFileURL: freezed == idProofFileURL
          ? _value.idProofFileURL
          : idProofFileURL // ignore: cast_nullable_to_non_nullable
              as String?,
      taxCode: freezed == taxCode
          ? _value.taxCode
          : taxCode // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      lastLoginTime: freezed == lastLoginTime
          ? _value.lastLoginTime
          : lastLoginTime // ignore: cast_nullable_to_non_nullable
              as String?,
      contactDTOList: freezed == contactDTOList
          ? _value.contactDTOList
          : contactDTOList // ignore: cast_nullable_to_non_nullable
              as List<ContactDTO>?,
      addressDTOList: freezed == addressDTOList
          ? _value.addressDTOList
          : addressDTOList // ignore: cast_nullable_to_non_nullable
              as List<AddressDTO>?,
      profileContentHistoryDTOList: freezed == profileContentHistoryDTOList
          ? _value.profileContentHistoryDTOList
          : profileContentHistoryDTOList // ignore: cast_nullable_to_non_nullable
              as dynamic,
      optInPromotions: null == optInPromotions
          ? _value.optInPromotions
          : optInPromotions // ignore: cast_nullable_to_non_nullable
              as bool,
      optInPromotionsMode: freezed == optInPromotionsMode
          ? _value.optInPromotionsMode
          : optInPromotionsMode // ignore: cast_nullable_to_non_nullable
              as String?,
      optInLastUpdatedDate: freezed == optInLastUpdatedDate
          ? _value.optInLastUpdatedDate
          : optInLastUpdatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      policyTermsAccepted: null == policyTermsAccepted
          ? _value.policyTermsAccepted
          : policyTermsAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
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
      externalSystemReference: freezed == externalSystemReference
          ? _value.externalSystemReference
          : externalSystemReference // ignore: cast_nullable_to_non_nullable
              as String?,
      optOutWhatsApp: null == optOutWhatsApp
          ? _value.optOutWhatsApp
          : optOutWhatsApp // ignore: cast_nullable_to_non_nullable
              as bool,
      userStatus: freezed == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordChangeDate: freezed == passwordChangeDate
          ? _value.passwordChangeDate
          : passwordChangeDate // ignore: cast_nullable_to_non_nullable
              as String?,
      invalidAccessAttempts: null == invalidAccessAttempts
          ? _value.invalidAccessAttempts
          : invalidAccessAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      lockedOutTime: freezed == lockedOutTime
          ? _value.lockedOutTime
          : lockedOutTime // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordChangeOnNextLogin: null == passwordChangeOnNextLogin
          ? _value.passwordChangeOnNextLogin
          : passwordChangeOnNextLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      isChanged: null == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      isChangedRecursive: null == isChangedRecursive
          ? _value.isChangedRecursive
          : isChangedRecursive // ignore: cast_nullable_to_non_nullable
              as bool,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileDTOCopyWith<$Res>
    implements $ProfileDTOCopyWith<$Res> {
  factory _$$_ProfileDTOCopyWith(
          _$_ProfileDTO value, $Res Function(_$_ProfileDTO) then) =
      __$$_ProfileDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Id')
          int id,
      @JsonKey(name: 'ProfileTypeId')
          int profileTypeId,
      @JsonKey(name: 'ProfileType')
          int profileType,
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
      @JsonKey(name: 'Notes')
          String? notes,
      @JsonKey(name: 'DateOfBirth')
          String? dateOfBirth,
      @JsonKey(name: 'Gender')
          String? gender,
      @JsonKey(name: 'Anniversary')
          String? anniversary,
      @JsonKey(name: 'PhotoURL')
          String? photoURL,
      @JsonKey(name: 'RightHanded')
          bool rightHanded,
      @JsonKey(name: 'TeamUser')
          bool teamUser,
      @JsonKey(name: 'UniqueIdentifier')
          String? uniqueIdentifier,
      @JsonKey(name: 'IdProofFileURL')
          String? idProofFileURL,
      @JsonKey(name: 'TaxCode')
          String? taxCode,
      @JsonKey(name: 'Designation')
          String? designation,
      @JsonKey(name: 'Company')
          String? company,
      @JsonKey(name: 'UserName')
          String? userName,
      @JsonKey(name: 'Password')
          String? password,
      @JsonKey(name: 'LastLoginTime')
          String? lastLoginTime,
      @JsonKey(name: 'ContactDTOList')
          List<ContactDTO>? contactDTOList,
      @JsonKey(name: 'AddressDTOList')
          List<AddressDTO>? addressDTOList,
      @JsonKey(name: 'ProfileContentHistoryDTOList')
          dynamic profileContentHistoryDTOList,
      @JsonKey(name: 'OptInPromotions')
          bool optInPromotions,
      @JsonKey(name: 'OptInPromotionsMode')
          String? optInPromotionsMode,
      @JsonKey(name: 'OptInLastUpdatedDate')
          String? optInLastUpdatedDate,
      @JsonKey(name: 'PolicyTermsAccepted')
          bool policyTermsAccepted,
      @JsonKey(name: 'IsActive')
          bool isActive,
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
      @JsonKey(name: 'ExternalSystemReference')
          String? externalSystemReference,
      @JsonKey(name: 'OptOutWhatsApp')
          bool optOutWhatsApp,
      @JsonKey(name: 'UserStatus')
          String? userStatus,
      @JsonKey(name: 'PasswordChangeDate')
          String? passwordChangeDate,
      @JsonKey(name: 'InvalidAccessAttempts')
          int invalidAccessAttempts,
      @JsonKey(name: 'LockedOutTime')
          String? lockedOutTime,
      @JsonKey(name: 'PasswordChangeOnNextLogin')
          bool passwordChangeOnNextLogin,
      @JsonKey(name: 'IsChanged')
          bool isChanged,
      @JsonKey(name: 'IsChangedRecursive')
          bool isChangedRecursive,
      @JsonKey(name: 'Channel')
          String? channel,
      @JsonKey(name: 'Verified')
          bool? verified});
}

/// @nodoc
class __$$_ProfileDTOCopyWithImpl<$Res>
    extends _$ProfileDTOCopyWithImpl<$Res, _$_ProfileDTO>
    implements _$$_ProfileDTOCopyWith<$Res> {
  __$$_ProfileDTOCopyWithImpl(
      _$_ProfileDTO _value, $Res Function(_$_ProfileDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? profileTypeId = null,
    Object? profileType = null,
    Object? title = freezed,
    Object? firstName = freezed,
    Object? nickName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? notes = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? anniversary = freezed,
    Object? photoURL = freezed,
    Object? rightHanded = null,
    Object? teamUser = null,
    Object? uniqueIdentifier = freezed,
    Object? idProofFileURL = freezed,
    Object? taxCode = freezed,
    Object? designation = freezed,
    Object? company = freezed,
    Object? userName = freezed,
    Object? password = freezed,
    Object? lastLoginTime = freezed,
    Object? contactDTOList = freezed,
    Object? addressDTOList = freezed,
    Object? profileContentHistoryDTOList = freezed,
    Object? optInPromotions = null,
    Object? optInPromotionsMode = freezed,
    Object? optInLastUpdatedDate = freezed,
    Object? policyTermsAccepted = null,
    Object? isActive = null,
    Object? createdBy = freezed,
    Object? creationDate = freezed,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdateDate = freezed,
    Object? siteId = null,
    Object? masterEntityId = null,
    Object? synchStatus = null,
    Object? guid = freezed,
    Object? externalSystemReference = freezed,
    Object? optOutWhatsApp = null,
    Object? userStatus = freezed,
    Object? passwordChangeDate = freezed,
    Object? invalidAccessAttempts = null,
    Object? lockedOutTime = freezed,
    Object? passwordChangeOnNextLogin = null,
    Object? isChanged = null,
    Object? isChangedRecursive = null,
    Object? channel = freezed,
    Object? verified = freezed,
  }) {
    return _then(_$_ProfileDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      profileTypeId: null == profileTypeId
          ? _value.profileTypeId
          : profileTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      profileType: null == profileType
          ? _value.profileType
          : profileType // ignore: cast_nullable_to_non_nullable
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
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
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
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      rightHanded: null == rightHanded
          ? _value.rightHanded
          : rightHanded // ignore: cast_nullable_to_non_nullable
              as bool,
      teamUser: null == teamUser
          ? _value.teamUser
          : teamUser // ignore: cast_nullable_to_non_nullable
              as bool,
      uniqueIdentifier: freezed == uniqueIdentifier
          ? _value.uniqueIdentifier
          : uniqueIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      idProofFileURL: freezed == idProofFileURL
          ? _value.idProofFileURL
          : idProofFileURL // ignore: cast_nullable_to_non_nullable
              as String?,
      taxCode: freezed == taxCode
          ? _value.taxCode
          : taxCode // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      lastLoginTime: freezed == lastLoginTime
          ? _value.lastLoginTime
          : lastLoginTime // ignore: cast_nullable_to_non_nullable
              as String?,
      contactDTOList: freezed == contactDTOList
          ? _value._contactDTOList
          : contactDTOList // ignore: cast_nullable_to_non_nullable
              as List<ContactDTO>?,
      addressDTOList: freezed == addressDTOList
          ? _value._addressDTOList
          : addressDTOList // ignore: cast_nullable_to_non_nullable
              as List<AddressDTO>?,
      profileContentHistoryDTOList: freezed == profileContentHistoryDTOList
          ? _value.profileContentHistoryDTOList
          : profileContentHistoryDTOList // ignore: cast_nullable_to_non_nullable
              as dynamic,
      optInPromotions: null == optInPromotions
          ? _value.optInPromotions
          : optInPromotions // ignore: cast_nullable_to_non_nullable
              as bool,
      optInPromotionsMode: freezed == optInPromotionsMode
          ? _value.optInPromotionsMode
          : optInPromotionsMode // ignore: cast_nullable_to_non_nullable
              as String?,
      optInLastUpdatedDate: freezed == optInLastUpdatedDate
          ? _value.optInLastUpdatedDate
          : optInLastUpdatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      policyTermsAccepted: null == policyTermsAccepted
          ? _value.policyTermsAccepted
          : policyTermsAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
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
      externalSystemReference: freezed == externalSystemReference
          ? _value.externalSystemReference
          : externalSystemReference // ignore: cast_nullable_to_non_nullable
              as String?,
      optOutWhatsApp: null == optOutWhatsApp
          ? _value.optOutWhatsApp
          : optOutWhatsApp // ignore: cast_nullable_to_non_nullable
              as bool,
      userStatus: freezed == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordChangeDate: freezed == passwordChangeDate
          ? _value.passwordChangeDate
          : passwordChangeDate // ignore: cast_nullable_to_non_nullable
              as String?,
      invalidAccessAttempts: null == invalidAccessAttempts
          ? _value.invalidAccessAttempts
          : invalidAccessAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      lockedOutTime: freezed == lockedOutTime
          ? _value.lockedOutTime
          : lockedOutTime // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordChangeOnNextLogin: null == passwordChangeOnNextLogin
          ? _value.passwordChangeOnNextLogin
          : passwordChangeOnNextLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      isChanged: null == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      isChangedRecursive: null == isChangedRecursive
          ? _value.isChangedRecursive
          : isChangedRecursive // ignore: cast_nullable_to_non_nullable
              as bool,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfileDTO implements _ProfileDTO {
  const _$_ProfileDTO(
      {@JsonKey(name: 'Id')
          required this.id,
      @JsonKey(name: 'ProfileTypeId')
          required this.profileTypeId,
      @JsonKey(name: 'ProfileType')
          required this.profileType,
      @JsonKey(name: 'Title')
          required this.title,
      @JsonKey(name: 'FirstName')
          required this.firstName,
      @JsonKey(name: 'NickName')
          required this.nickName,
      @JsonKey(name: 'MiddleName')
          required this.middleName,
      @JsonKey(name: 'LastName')
          required this.lastName,
      @JsonKey(name: 'Notes')
          required this.notes,
      @JsonKey(name: 'DateOfBirth')
          this.dateOfBirth,
      @JsonKey(name: 'Gender')
          required this.gender,
      @JsonKey(name: 'Anniversary')
          this.anniversary,
      @JsonKey(name: 'PhotoURL')
          required this.photoURL,
      @JsonKey(name: 'RightHanded')
          required this.rightHanded,
      @JsonKey(name: 'TeamUser')
          required this.teamUser,
      @JsonKey(name: 'UniqueIdentifier')
          required this.uniqueIdentifier,
      @JsonKey(name: 'IdProofFileURL')
          required this.idProofFileURL,
      @JsonKey(name: 'TaxCode')
          required this.taxCode,
      @JsonKey(name: 'Designation')
          required this.designation,
      @JsonKey(name: 'Company')
          required this.company,
      @JsonKey(name: 'UserName')
          required this.userName,
      @JsonKey(name: 'Password')
          required this.password,
      @JsonKey(name: 'LastLoginTime')
          this.lastLoginTime,
      @JsonKey(name: 'ContactDTOList')
          final List<ContactDTO>? contactDTOList,
      @JsonKey(name: 'AddressDTOList')
          final List<AddressDTO>? addressDTOList,
      @JsonKey(name: 'ProfileContentHistoryDTOList')
          this.profileContentHistoryDTOList,
      @JsonKey(name: 'OptInPromotions')
          required this.optInPromotions,
      @JsonKey(name: 'OptInPromotionsMode')
          required this.optInPromotionsMode,
      @JsonKey(name: 'OptInLastUpdatedDate')
          this.optInLastUpdatedDate,
      @JsonKey(name: 'PolicyTermsAccepted')
          required this.policyTermsAccepted,
      @JsonKey(name: 'IsActive')
          required this.isActive,
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
      @JsonKey(name: 'ExternalSystemReference')
          required this.externalSystemReference,
      @JsonKey(name: 'OptOutWhatsApp')
          required this.optOutWhatsApp,
      @JsonKey(name: 'UserStatus')
          required this.userStatus,
      @JsonKey(name: 'PasswordChangeDate')
          this.passwordChangeDate,
      @JsonKey(name: 'InvalidAccessAttempts')
          required this.invalidAccessAttempts,
      @JsonKey(name: 'LockedOutTime')
          this.lockedOutTime,
      @JsonKey(name: 'PasswordChangeOnNextLogin')
          required this.passwordChangeOnNextLogin,
      @JsonKey(name: 'IsChanged')
          required this.isChanged,
      @JsonKey(name: 'IsChangedRecursive')
          required this.isChangedRecursive,
      @JsonKey(name: 'Channel')
          this.channel,
      @JsonKey(name: 'Verified')
          this.verified})
      : _contactDTOList = contactDTOList,
        _addressDTOList = addressDTOList;

  factory _$_ProfileDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileDTOFromJson(json);

  @override
  @JsonKey(name: 'Id')
  final int id;
  @override
  @JsonKey(name: 'ProfileTypeId')
  final int profileTypeId;
  @override
  @JsonKey(name: 'ProfileType')
  final int profileType;
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
  @JsonKey(name: 'Notes')
  final String? notes;
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
  @JsonKey(name: 'PhotoURL')
  final String? photoURL;
  @override
  @JsonKey(name: 'RightHanded')
  final bool rightHanded;
  @override
  @JsonKey(name: 'TeamUser')
  final bool teamUser;
  @override
  @JsonKey(name: 'UniqueIdentifier')
  final String? uniqueIdentifier;
  @override
  @JsonKey(name: 'IdProofFileURL')
  final String? idProofFileURL;
  @override
  @JsonKey(name: 'TaxCode')
  final String? taxCode;
  @override
  @JsonKey(name: 'Designation')
  final String? designation;
  @override
  @JsonKey(name: 'Company')
  final String? company;
  @override
  @JsonKey(name: 'UserName')
  final String? userName;
  @override
  @JsonKey(name: 'Password')
  final String? password;
  @override
  @JsonKey(name: 'LastLoginTime')
  final String? lastLoginTime;
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

  @override
  @JsonKey(name: 'ProfileContentHistoryDTOList')
  final dynamic profileContentHistoryDTOList;
  @override
  @JsonKey(name: 'OptInPromotions')
  final bool optInPromotions;
  @override
  @JsonKey(name: 'OptInPromotionsMode')
  final String? optInPromotionsMode;
  @override
  @JsonKey(name: 'OptInLastUpdatedDate')
  final String? optInLastUpdatedDate;
  @override
  @JsonKey(name: 'PolicyTermsAccepted')
  final bool policyTermsAccepted;
  @override
  @JsonKey(name: 'IsActive')
  final bool isActive;
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
  @JsonKey(name: 'ExternalSystemReference')
  final String? externalSystemReference;
  @override
  @JsonKey(name: 'OptOutWhatsApp')
  final bool optOutWhatsApp;
  @override
  @JsonKey(name: 'UserStatus')
  final String? userStatus;
  @override
  @JsonKey(name: 'PasswordChangeDate')
  final String? passwordChangeDate;
  @override
  @JsonKey(name: 'InvalidAccessAttempts')
  final int invalidAccessAttempts;
  @override
  @JsonKey(name: 'LockedOutTime')
  final String? lockedOutTime;
  @override
  @JsonKey(name: 'PasswordChangeOnNextLogin')
  final bool passwordChangeOnNextLogin;
  @override
  @JsonKey(name: 'IsChanged')
  final bool isChanged;
  @override
  @JsonKey(name: 'IsChangedRecursive')
  final bool isChangedRecursive;
  @override
  @JsonKey(name: 'Channel')
  final String? channel;
  @override
  @JsonKey(name: 'Verified')
  final bool? verified;

  @override
  String toString() {
    return 'ProfileDTO(id: $id, profileTypeId: $profileTypeId, profileType: $profileType, title: $title, firstName: $firstName, nickName: $nickName, middleName: $middleName, lastName: $lastName, notes: $notes, dateOfBirth: $dateOfBirth, gender: $gender, anniversary: $anniversary, photoURL: $photoURL, rightHanded: $rightHanded, teamUser: $teamUser, uniqueIdentifier: $uniqueIdentifier, idProofFileURL: $idProofFileURL, taxCode: $taxCode, designation: $designation, company: $company, userName: $userName, password: $password, lastLoginTime: $lastLoginTime, contactDTOList: $contactDTOList, addressDTOList: $addressDTOList, profileContentHistoryDTOList: $profileContentHistoryDTOList, optInPromotions: $optInPromotions, optInPromotionsMode: $optInPromotionsMode, optInLastUpdatedDate: $optInLastUpdatedDate, policyTermsAccepted: $policyTermsAccepted, isActive: $isActive, createdBy: $createdBy, creationDate: $creationDate, lastUpdatedBy: $lastUpdatedBy, lastUpdateDate: $lastUpdateDate, siteId: $siteId, masterEntityId: $masterEntityId, synchStatus: $synchStatus, guid: $guid, externalSystemReference: $externalSystemReference, optOutWhatsApp: $optOutWhatsApp, userStatus: $userStatus, passwordChangeDate: $passwordChangeDate, invalidAccessAttempts: $invalidAccessAttempts, lockedOutTime: $lockedOutTime, passwordChangeOnNextLogin: $passwordChangeOnNextLogin, isChanged: $isChanged, isChangedRecursive: $isChangedRecursive, channel: $channel, verified: $verified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profileTypeId, profileTypeId) ||
                other.profileTypeId == profileTypeId) &&
            (identical(other.profileType, profileType) ||
                other.profileType == profileType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.anniversary, anniversary) ||
                other.anniversary == anniversary) &&
            (identical(other.photoURL, photoURL) ||
                other.photoURL == photoURL) &&
            (identical(other.rightHanded, rightHanded) ||
                other.rightHanded == rightHanded) &&
            (identical(other.teamUser, teamUser) ||
                other.teamUser == teamUser) &&
            (identical(other.uniqueIdentifier, uniqueIdentifier) ||
                other.uniqueIdentifier == uniqueIdentifier) &&
            (identical(other.idProofFileURL, idProofFileURL) ||
                other.idProofFileURL == idProofFileURL) &&
            (identical(other.taxCode, taxCode) || other.taxCode == taxCode) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.lastLoginTime, lastLoginTime) ||
                other.lastLoginTime == lastLoginTime) &&
            const DeepCollectionEquality()
                .equals(other._contactDTOList, _contactDTOList) &&
            const DeepCollectionEquality()
                .equals(other._addressDTOList, _addressDTOList) &&
            const DeepCollectionEquality().equals(
                other.profileContentHistoryDTOList,
                profileContentHistoryDTOList) &&
            (identical(other.optInPromotions, optInPromotions) ||
                other.optInPromotions == optInPromotions) &&
            (identical(other.optInPromotionsMode, optInPromotionsMode) ||
                other.optInPromotionsMode == optInPromotionsMode) &&
            (identical(other.optInLastUpdatedDate, optInLastUpdatedDate) ||
                other.optInLastUpdatedDate == optInLastUpdatedDate) &&
            (identical(other.policyTermsAccepted, policyTermsAccepted) ||
                other.policyTermsAccepted == policyTermsAccepted) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.lastUpdatedBy, lastUpdatedBy) ||
                other.lastUpdatedBy == lastUpdatedBy) &&
            (identical(other.lastUpdateDate, lastUpdateDate) ||
                other.lastUpdateDate == lastUpdateDate) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.masterEntityId, masterEntityId) ||
                other.masterEntityId == masterEntityId) &&
            (identical(other.synchStatus, synchStatus) ||
                other.synchStatus == synchStatus) &&
            (identical(other.guid, guid) || other.guid == guid) &&
            (identical(other.externalSystemReference, externalSystemReference) ||
                other.externalSystemReference == externalSystemReference) &&
            (identical(other.optOutWhatsApp, optOutWhatsApp) ||
                other.optOutWhatsApp == optOutWhatsApp) &&
            (identical(other.userStatus, userStatus) ||
                other.userStatus == userStatus) &&
            (identical(other.passwordChangeDate, passwordChangeDate) ||
                other.passwordChangeDate == passwordChangeDate) &&
            (identical(other.invalidAccessAttempts, invalidAccessAttempts) ||
                other.invalidAccessAttempts == invalidAccessAttempts) &&
            (identical(other.lockedOutTime, lockedOutTime) ||
                other.lockedOutTime == lockedOutTime) &&
            (identical(other.passwordChangeOnNextLogin, passwordChangeOnNextLogin) ||
                other.passwordChangeOnNextLogin == passwordChangeOnNextLogin) &&
            (identical(other.isChanged, isChanged) ||
                other.isChanged == isChanged) &&
            (identical(other.isChangedRecursive, isChangedRecursive) ||
                other.isChangedRecursive == isChangedRecursive) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.verified, verified) ||
                other.verified == verified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        profileTypeId,
        profileType,
        title,
        firstName,
        nickName,
        middleName,
        lastName,
        notes,
        dateOfBirth,
        gender,
        anniversary,
        photoURL,
        rightHanded,
        teamUser,
        uniqueIdentifier,
        idProofFileURL,
        taxCode,
        designation,
        company,
        userName,
        password,
        lastLoginTime,
        const DeepCollectionEquality().hash(_contactDTOList),
        const DeepCollectionEquality().hash(_addressDTOList),
        const DeepCollectionEquality().hash(profileContentHistoryDTOList),
        optInPromotions,
        optInPromotionsMode,
        optInLastUpdatedDate,
        policyTermsAccepted,
        isActive,
        createdBy,
        creationDate,
        lastUpdatedBy,
        lastUpdateDate,
        siteId,
        masterEntityId,
        synchStatus,
        guid,
        externalSystemReference,
        optOutWhatsApp,
        userStatus,
        passwordChangeDate,
        invalidAccessAttempts,
        lockedOutTime,
        passwordChangeOnNextLogin,
        isChanged,
        isChangedRecursive,
        channel,
        verified
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileDTOCopyWith<_$_ProfileDTO> get copyWith =>
      __$$_ProfileDTOCopyWithImpl<_$_ProfileDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileDTOToJson(
      this,
    );
  }
}

abstract class _ProfileDTO implements ProfileDTO {
  const factory _ProfileDTO(
      {@JsonKey(name: 'Id')
          required final int id,
      @JsonKey(name: 'ProfileTypeId')
          required final int profileTypeId,
      @JsonKey(name: 'ProfileType')
          required final int profileType,
      @JsonKey(name: 'Title')
          required final String? title,
      @JsonKey(name: 'FirstName')
          required final String? firstName,
      @JsonKey(name: 'NickName')
          required final String? nickName,
      @JsonKey(name: 'MiddleName')
          required final String? middleName,
      @JsonKey(name: 'LastName')
          required final String? lastName,
      @JsonKey(name: 'Notes')
          required final String? notes,
      @JsonKey(name: 'DateOfBirth')
          final String? dateOfBirth,
      @JsonKey(name: 'Gender')
          required final String? gender,
      @JsonKey(name: 'Anniversary')
          final String? anniversary,
      @JsonKey(name: 'PhotoURL')
          required final String? photoURL,
      @JsonKey(name: 'RightHanded')
          required final bool rightHanded,
      @JsonKey(name: 'TeamUser')
          required final bool teamUser,
      @JsonKey(name: 'UniqueIdentifier')
          required final String? uniqueIdentifier,
      @JsonKey(name: 'IdProofFileURL')
          required final String? idProofFileURL,
      @JsonKey(name: 'TaxCode')
          required final String? taxCode,
      @JsonKey(name: 'Designation')
          required final String? designation,
      @JsonKey(name: 'Company')
          required final String? company,
      @JsonKey(name: 'UserName')
          required final String? userName,
      @JsonKey(name: 'Password')
          required final String? password,
      @JsonKey(name: 'LastLoginTime')
          final String? lastLoginTime,
      @JsonKey(name: 'ContactDTOList')
          final List<ContactDTO>? contactDTOList,
      @JsonKey(name: 'AddressDTOList')
          final List<AddressDTO>? addressDTOList,
      @JsonKey(name: 'ProfileContentHistoryDTOList')
          final dynamic profileContentHistoryDTOList,
      @JsonKey(name: 'OptInPromotions')
          required final bool optInPromotions,
      @JsonKey(name: 'OptInPromotionsMode')
          required final String? optInPromotionsMode,
      @JsonKey(name: 'OptInLastUpdatedDate')
          final String? optInLastUpdatedDate,
      @JsonKey(name: 'PolicyTermsAccepted')
          required final bool policyTermsAccepted,
      @JsonKey(name: 'IsActive')
          required final bool isActive,
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
      @JsonKey(name: 'ExternalSystemReference')
          required final String? externalSystemReference,
      @JsonKey(name: 'OptOutWhatsApp')
          required final bool optOutWhatsApp,
      @JsonKey(name: 'UserStatus')
          required final String? userStatus,
      @JsonKey(name: 'PasswordChangeDate')
          final String? passwordChangeDate,
      @JsonKey(name: 'InvalidAccessAttempts')
          required final int invalidAccessAttempts,
      @JsonKey(name: 'LockedOutTime')
          final String? lockedOutTime,
      @JsonKey(name: 'PasswordChangeOnNextLogin')
          required final bool passwordChangeOnNextLogin,
      @JsonKey(name: 'IsChanged')
          required final bool isChanged,
      @JsonKey(name: 'IsChangedRecursive')
          required final bool isChangedRecursive,
      @JsonKey(name: 'Channel')
          final String? channel,
      @JsonKey(name: 'Verified')
          final bool? verified}) = _$_ProfileDTO;

  factory _ProfileDTO.fromJson(Map<String, dynamic> json) =
      _$_ProfileDTO.fromJson;

  @override
  @JsonKey(name: 'Id')
  int get id;
  @override
  @JsonKey(name: 'ProfileTypeId')
  int get profileTypeId;
  @override
  @JsonKey(name: 'ProfileType')
  int get profileType;
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
  @JsonKey(name: 'Notes')
  String? get notes;
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
  @JsonKey(name: 'PhotoURL')
  String? get photoURL;
  @override
  @JsonKey(name: 'RightHanded')
  bool get rightHanded;
  @override
  @JsonKey(name: 'TeamUser')
  bool get teamUser;
  @override
  @JsonKey(name: 'UniqueIdentifier')
  String? get uniqueIdentifier;
  @override
  @JsonKey(name: 'IdProofFileURL')
  String? get idProofFileURL;
  @override
  @JsonKey(name: 'TaxCode')
  String? get taxCode;
  @override
  @JsonKey(name: 'Designation')
  String? get designation;
  @override
  @JsonKey(name: 'Company')
  String? get company;
  @override
  @JsonKey(name: 'UserName')
  String? get userName;
  @override
  @JsonKey(name: 'Password')
  String? get password;
  @override
  @JsonKey(name: 'LastLoginTime')
  String? get lastLoginTime;
  @override
  @JsonKey(name: 'ContactDTOList')
  List<ContactDTO>? get contactDTOList;
  @override
  @JsonKey(name: 'AddressDTOList')
  List<AddressDTO>? get addressDTOList;
  @override
  @JsonKey(name: 'ProfileContentHistoryDTOList')
  dynamic get profileContentHistoryDTOList;
  @override
  @JsonKey(name: 'OptInPromotions')
  bool get optInPromotions;
  @override
  @JsonKey(name: 'OptInPromotionsMode')
  String? get optInPromotionsMode;
  @override
  @JsonKey(name: 'OptInLastUpdatedDate')
  String? get optInLastUpdatedDate;
  @override
  @JsonKey(name: 'PolicyTermsAccepted')
  bool get policyTermsAccepted;
  @override
  @JsonKey(name: 'IsActive')
  bool get isActive;
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
  @JsonKey(name: 'ExternalSystemReference')
  String? get externalSystemReference;
  @override
  @JsonKey(name: 'OptOutWhatsApp')
  bool get optOutWhatsApp;
  @override
  @JsonKey(name: 'UserStatus')
  String? get userStatus;
  @override
  @JsonKey(name: 'PasswordChangeDate')
  String? get passwordChangeDate;
  @override
  @JsonKey(name: 'InvalidAccessAttempts')
  int get invalidAccessAttempts;
  @override
  @JsonKey(name: 'LockedOutTime')
  String? get lockedOutTime;
  @override
  @JsonKey(name: 'PasswordChangeOnNextLogin')
  bool get passwordChangeOnNextLogin;
  @override
  @JsonKey(name: 'IsChanged')
  bool get isChanged;
  @override
  @JsonKey(name: 'IsChangedRecursive')
  bool get isChangedRecursive;
  @override
  @JsonKey(name: 'Channel')
  String? get channel;
  @override
  @JsonKey(name: 'Verified')
  bool? get verified;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileDTOCopyWith<_$_ProfileDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
