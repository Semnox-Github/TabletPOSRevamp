// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddressDTO _$AddressDTOFromJson(Map<String, dynamic> json) {
  return _AddressDTO.fromJson(json);
}

/// @nodoc
mixin _$AddressDTO {
  @JsonKey(name: 'Id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProfileId')
  int get profileId => throw _privateConstructorUsedError;
  @JsonKey(name: 'AddressTypeId')
  int get addressTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'AddressType')
  int get addressType => throw _privateConstructorUsedError;
  @JsonKey(name: 'Line1')
  String? get line1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'Line2')
  String? get line2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'Line3')
  String? get line3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'City')
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'StateId')
  int get stateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CountryId')
  int get countryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PostalCode')
  String? get postalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'StateCode')
  String? get stateCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'StateName')
  String? get stateName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CountryName')
  String? get countryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreationDate')
  String get creationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastUpdatedBy')
  String? get lastUpdatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastUpdateDate')
  String get lastUpdateDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteId')
  int get siteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MasterEntityId')
  int get masterEntityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SynchStatus')
  bool get synchStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'Guid')
  String? get guid => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDefault')
  bool get isDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactDTOList')
  List<ContactDTO> get contactDTOList => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsChanged')
  bool get isChanged => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsChangedRecursive')
  bool get isChangedRecursive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressDTOCopyWith<AddressDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressDTOCopyWith<$Res> {
  factory $AddressDTOCopyWith(
          AddressDTO value, $Res Function(AddressDTO) then) =
      _$AddressDTOCopyWithImpl<$Res, AddressDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int id,
      @JsonKey(name: 'ProfileId') int profileId,
      @JsonKey(name: 'AddressTypeId') int addressTypeId,
      @JsonKey(name: 'AddressType') int addressType,
      @JsonKey(name: 'Line1') String? line1,
      @JsonKey(name: 'Line2') String? line2,
      @JsonKey(name: 'Line3') String? line3,
      @JsonKey(name: 'City') String? city,
      @JsonKey(name: 'StateId') int stateId,
      @JsonKey(name: 'CountryId') int countryId,
      @JsonKey(name: 'PostalCode') String? postalCode,
      @JsonKey(name: 'StateCode') String? stateCode,
      @JsonKey(name: 'StateName') String? stateName,
      @JsonKey(name: 'CountryName') String? countryName,
      @JsonKey(name: 'IsActive') bool isActive,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreationDate') String creationDate,
      @JsonKey(name: 'LastUpdatedBy') String? lastUpdatedBy,
      @JsonKey(name: 'LastUpdateDate') String lastUpdateDate,
      @JsonKey(name: 'SiteId') int siteId,
      @JsonKey(name: 'MasterEntityId') int masterEntityId,
      @JsonKey(name: 'SynchStatus') bool synchStatus,
      @JsonKey(name: 'Guid') String? guid,
      @JsonKey(name: 'IsDefault') bool isDefault,
      @JsonKey(name: 'ContactDTOList') List<ContactDTO> contactDTOList,
      @JsonKey(name: 'IsChanged') bool isChanged,
      @JsonKey(name: 'IsChangedRecursive') bool isChangedRecursive});
}

/// @nodoc
class _$AddressDTOCopyWithImpl<$Res, $Val extends AddressDTO>
    implements $AddressDTOCopyWith<$Res> {
  _$AddressDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? profileId = null,
    Object? addressTypeId = null,
    Object? addressType = null,
    Object? line1 = freezed,
    Object? line2 = freezed,
    Object? line3 = freezed,
    Object? city = freezed,
    Object? stateId = null,
    Object? countryId = null,
    Object? postalCode = freezed,
    Object? stateCode = freezed,
    Object? stateName = freezed,
    Object? countryName = freezed,
    Object? isActive = null,
    Object? createdBy = freezed,
    Object? creationDate = null,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdateDate = null,
    Object? siteId = null,
    Object? masterEntityId = null,
    Object? synchStatus = null,
    Object? guid = freezed,
    Object? isDefault = null,
    Object? contactDTOList = null,
    Object? isChanged = null,
    Object? isChangedRecursive = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as int,
      addressTypeId: null == addressTypeId
          ? _value.addressTypeId
          : addressTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      addressType: null == addressType
          ? _value.addressType
          : addressType // ignore: cast_nullable_to_non_nullable
              as int,
      line1: freezed == line1
          ? _value.line1
          : line1 // ignore: cast_nullable_to_non_nullable
              as String?,
      line2: freezed == line2
          ? _value.line2
          : line2 // ignore: cast_nullable_to_non_nullable
              as String?,
      line3: freezed == line3
          ? _value.line3
          : line3 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int,
      countryId: null == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      stateCode: freezed == stateCode
          ? _value.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String?,
      stateName: freezed == stateName
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryName: freezed == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdatedBy: freezed == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdateDate: null == lastUpdateDate
          ? _value.lastUpdateDate
          : lastUpdateDate // ignore: cast_nullable_to_non_nullable
              as String,
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
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      contactDTOList: null == contactDTOList
          ? _value.contactDTOList
          : contactDTOList // ignore: cast_nullable_to_non_nullable
              as List<ContactDTO>,
      isChanged: null == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      isChangedRecursive: null == isChangedRecursive
          ? _value.isChangedRecursive
          : isChangedRecursive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddressDTOCopyWith<$Res>
    implements $AddressDTOCopyWith<$Res> {
  factory _$$_AddressDTOCopyWith(
          _$_AddressDTO value, $Res Function(_$_AddressDTO) then) =
      __$$_AddressDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int id,
      @JsonKey(name: 'ProfileId') int profileId,
      @JsonKey(name: 'AddressTypeId') int addressTypeId,
      @JsonKey(name: 'AddressType') int addressType,
      @JsonKey(name: 'Line1') String? line1,
      @JsonKey(name: 'Line2') String? line2,
      @JsonKey(name: 'Line3') String? line3,
      @JsonKey(name: 'City') String? city,
      @JsonKey(name: 'StateId') int stateId,
      @JsonKey(name: 'CountryId') int countryId,
      @JsonKey(name: 'PostalCode') String? postalCode,
      @JsonKey(name: 'StateCode') String? stateCode,
      @JsonKey(name: 'StateName') String? stateName,
      @JsonKey(name: 'CountryName') String? countryName,
      @JsonKey(name: 'IsActive') bool isActive,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreationDate') String creationDate,
      @JsonKey(name: 'LastUpdatedBy') String? lastUpdatedBy,
      @JsonKey(name: 'LastUpdateDate') String lastUpdateDate,
      @JsonKey(name: 'SiteId') int siteId,
      @JsonKey(name: 'MasterEntityId') int masterEntityId,
      @JsonKey(name: 'SynchStatus') bool synchStatus,
      @JsonKey(name: 'Guid') String? guid,
      @JsonKey(name: 'IsDefault') bool isDefault,
      @JsonKey(name: 'ContactDTOList') List<ContactDTO> contactDTOList,
      @JsonKey(name: 'IsChanged') bool isChanged,
      @JsonKey(name: 'IsChangedRecursive') bool isChangedRecursive});
}

/// @nodoc
class __$$_AddressDTOCopyWithImpl<$Res>
    extends _$AddressDTOCopyWithImpl<$Res, _$_AddressDTO>
    implements _$$_AddressDTOCopyWith<$Res> {
  __$$_AddressDTOCopyWithImpl(
      _$_AddressDTO _value, $Res Function(_$_AddressDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? profileId = null,
    Object? addressTypeId = null,
    Object? addressType = null,
    Object? line1 = freezed,
    Object? line2 = freezed,
    Object? line3 = freezed,
    Object? city = freezed,
    Object? stateId = null,
    Object? countryId = null,
    Object? postalCode = freezed,
    Object? stateCode = freezed,
    Object? stateName = freezed,
    Object? countryName = freezed,
    Object? isActive = null,
    Object? createdBy = freezed,
    Object? creationDate = null,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdateDate = null,
    Object? siteId = null,
    Object? masterEntityId = null,
    Object? synchStatus = null,
    Object? guid = freezed,
    Object? isDefault = null,
    Object? contactDTOList = null,
    Object? isChanged = null,
    Object? isChangedRecursive = null,
  }) {
    return _then(_$_AddressDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as int,
      addressTypeId: null == addressTypeId
          ? _value.addressTypeId
          : addressTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      addressType: null == addressType
          ? _value.addressType
          : addressType // ignore: cast_nullable_to_non_nullable
              as int,
      line1: freezed == line1
          ? _value.line1
          : line1 // ignore: cast_nullable_to_non_nullable
              as String?,
      line2: freezed == line2
          ? _value.line2
          : line2 // ignore: cast_nullable_to_non_nullable
              as String?,
      line3: freezed == line3
          ? _value.line3
          : line3 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int,
      countryId: null == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      stateCode: freezed == stateCode
          ? _value.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String?,
      stateName: freezed == stateName
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryName: freezed == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdatedBy: freezed == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdateDate: null == lastUpdateDate
          ? _value.lastUpdateDate
          : lastUpdateDate // ignore: cast_nullable_to_non_nullable
              as String,
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
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      contactDTOList: null == contactDTOList
          ? _value._contactDTOList
          : contactDTOList // ignore: cast_nullable_to_non_nullable
              as List<ContactDTO>,
      isChanged: null == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      isChangedRecursive: null == isChangedRecursive
          ? _value.isChangedRecursive
          : isChangedRecursive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddressDTO with DiagnosticableTreeMixin implements _AddressDTO {
  const _$_AddressDTO(
      {@JsonKey(name: 'Id')
          required this.id,
      @JsonKey(name: 'ProfileId')
          required this.profileId,
      @JsonKey(name: 'AddressTypeId')
          required this.addressTypeId,
      @JsonKey(name: 'AddressType')
          required this.addressType,
      @JsonKey(name: 'Line1')
          this.line1,
      @JsonKey(name: 'Line2')
          this.line2,
      @JsonKey(name: 'Line3')
          this.line3,
      @JsonKey(name: 'City')
          this.city,
      @JsonKey(name: 'StateId')
          required this.stateId,
      @JsonKey(name: 'CountryId')
          required this.countryId,
      @JsonKey(name: 'PostalCode')
          this.postalCode,
      @JsonKey(name: 'StateCode')
          this.stateCode,
      @JsonKey(name: 'StateName')
          this.stateName,
      @JsonKey(name: 'CountryName')
          this.countryName,
      @JsonKey(name: 'IsActive')
          required this.isActive,
      @JsonKey(name: 'CreatedBy')
          this.createdBy,
      @JsonKey(name: 'CreationDate')
          required this.creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          this.lastUpdatedBy,
      @JsonKey(name: 'LastUpdateDate')
          required this.lastUpdateDate,
      @JsonKey(name: 'SiteId')
          required this.siteId,
      @JsonKey(name: 'MasterEntityId')
          required this.masterEntityId,
      @JsonKey(name: 'SynchStatus')
          required this.synchStatus,
      @JsonKey(name: 'Guid')
          this.guid,
      @JsonKey(name: 'IsDefault')
          required this.isDefault,
      @JsonKey(name: 'ContactDTOList')
          required final List<ContactDTO> contactDTOList,
      @JsonKey(name: 'IsChanged')
          required this.isChanged,
      @JsonKey(name: 'IsChangedRecursive')
          required this.isChangedRecursive})
      : _contactDTOList = contactDTOList;

  factory _$_AddressDTO.fromJson(Map<String, dynamic> json) =>
      _$$_AddressDTOFromJson(json);

  @override
  @JsonKey(name: 'Id')
  final int id;
  @override
  @JsonKey(name: 'ProfileId')
  final int profileId;
  @override
  @JsonKey(name: 'AddressTypeId')
  final int addressTypeId;
  @override
  @JsonKey(name: 'AddressType')
  final int addressType;
  @override
  @JsonKey(name: 'Line1')
  final String? line1;
  @override
  @JsonKey(name: 'Line2')
  final String? line2;
  @override
  @JsonKey(name: 'Line3')
  final String? line3;
  @override
  @JsonKey(name: 'City')
  final String? city;
  @override
  @JsonKey(name: 'StateId')
  final int stateId;
  @override
  @JsonKey(name: 'CountryId')
  final int countryId;
  @override
  @JsonKey(name: 'PostalCode')
  final String? postalCode;
  @override
  @JsonKey(name: 'StateCode')
  final String? stateCode;
  @override
  @JsonKey(name: 'StateName')
  final String? stateName;
  @override
  @JsonKey(name: 'CountryName')
  final String? countryName;
  @override
  @JsonKey(name: 'IsActive')
  final bool isActive;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'CreationDate')
  final String creationDate;
  @override
  @JsonKey(name: 'LastUpdatedBy')
  final String? lastUpdatedBy;
  @override
  @JsonKey(name: 'LastUpdateDate')
  final String lastUpdateDate;
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
  @JsonKey(name: 'IsDefault')
  final bool isDefault;
  final List<ContactDTO> _contactDTOList;
  @override
  @JsonKey(name: 'ContactDTOList')
  List<ContactDTO> get contactDTOList {
    if (_contactDTOList is EqualUnmodifiableListView) return _contactDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contactDTOList);
  }

  @override
  @JsonKey(name: 'IsChanged')
  final bool isChanged;
  @override
  @JsonKey(name: 'IsChangedRecursive')
  final bool isChangedRecursive;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddressDTO(id: $id, profileId: $profileId, addressTypeId: $addressTypeId, addressType: $addressType, line1: $line1, line2: $line2, line3: $line3, city: $city, stateId: $stateId, countryId: $countryId, postalCode: $postalCode, stateCode: $stateCode, stateName: $stateName, countryName: $countryName, isActive: $isActive, createdBy: $createdBy, creationDate: $creationDate, lastUpdatedBy: $lastUpdatedBy, lastUpdateDate: $lastUpdateDate, siteId: $siteId, masterEntityId: $masterEntityId, synchStatus: $synchStatus, guid: $guid, isDefault: $isDefault, contactDTOList: $contactDTOList, isChanged: $isChanged, isChangedRecursive: $isChangedRecursive)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddressDTO'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('profileId', profileId))
      ..add(DiagnosticsProperty('addressTypeId', addressTypeId))
      ..add(DiagnosticsProperty('addressType', addressType))
      ..add(DiagnosticsProperty('line1', line1))
      ..add(DiagnosticsProperty('line2', line2))
      ..add(DiagnosticsProperty('line3', line3))
      ..add(DiagnosticsProperty('city', city))
      ..add(DiagnosticsProperty('stateId', stateId))
      ..add(DiagnosticsProperty('countryId', countryId))
      ..add(DiagnosticsProperty('postalCode', postalCode))
      ..add(DiagnosticsProperty('stateCode', stateCode))
      ..add(DiagnosticsProperty('stateName', stateName))
      ..add(DiagnosticsProperty('countryName', countryName))
      ..add(DiagnosticsProperty('isActive', isActive))
      ..add(DiagnosticsProperty('createdBy', createdBy))
      ..add(DiagnosticsProperty('creationDate', creationDate))
      ..add(DiagnosticsProperty('lastUpdatedBy', lastUpdatedBy))
      ..add(DiagnosticsProperty('lastUpdateDate', lastUpdateDate))
      ..add(DiagnosticsProperty('siteId', siteId))
      ..add(DiagnosticsProperty('masterEntityId', masterEntityId))
      ..add(DiagnosticsProperty('synchStatus', synchStatus))
      ..add(DiagnosticsProperty('guid', guid))
      ..add(DiagnosticsProperty('isDefault', isDefault))
      ..add(DiagnosticsProperty('contactDTOList', contactDTOList))
      ..add(DiagnosticsProperty('isChanged', isChanged))
      ..add(DiagnosticsProperty('isChangedRecursive', isChangedRecursive));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddressDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.addressTypeId, addressTypeId) ||
                other.addressTypeId == addressTypeId) &&
            (identical(other.addressType, addressType) ||
                other.addressType == addressType) &&
            (identical(other.line1, line1) || other.line1 == line1) &&
            (identical(other.line2, line2) || other.line2 == line2) &&
            (identical(other.line3, line3) || other.line3 == line3) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.stateId, stateId) || other.stateId == stateId) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.stateCode, stateCode) ||
                other.stateCode == stateCode) &&
            (identical(other.stateName, stateName) ||
                other.stateName == stateName) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
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
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            const DeepCollectionEquality()
                .equals(other._contactDTOList, _contactDTOList) &&
            (identical(other.isChanged, isChanged) ||
                other.isChanged == isChanged) &&
            (identical(other.isChangedRecursive, isChangedRecursive) ||
                other.isChangedRecursive == isChangedRecursive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        profileId,
        addressTypeId,
        addressType,
        line1,
        line2,
        line3,
        city,
        stateId,
        countryId,
        postalCode,
        stateCode,
        stateName,
        countryName,
        isActive,
        createdBy,
        creationDate,
        lastUpdatedBy,
        lastUpdateDate,
        siteId,
        masterEntityId,
        synchStatus,
        guid,
        isDefault,
        const DeepCollectionEquality().hash(_contactDTOList),
        isChanged,
        isChangedRecursive
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddressDTOCopyWith<_$_AddressDTO> get copyWith =>
      __$$_AddressDTOCopyWithImpl<_$_AddressDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressDTOToJson(
      this,
    );
  }
}

abstract class _AddressDTO implements AddressDTO {
  const factory _AddressDTO(
      {@JsonKey(name: 'Id')
          required final int id,
      @JsonKey(name: 'ProfileId')
          required final int profileId,
      @JsonKey(name: 'AddressTypeId')
          required final int addressTypeId,
      @JsonKey(name: 'AddressType')
          required final int addressType,
      @JsonKey(name: 'Line1')
          final String? line1,
      @JsonKey(name: 'Line2')
          final String? line2,
      @JsonKey(name: 'Line3')
          final String? line3,
      @JsonKey(name: 'City')
          final String? city,
      @JsonKey(name: 'StateId')
          required final int stateId,
      @JsonKey(name: 'CountryId')
          required final int countryId,
      @JsonKey(name: 'PostalCode')
          final String? postalCode,
      @JsonKey(name: 'StateCode')
          final String? stateCode,
      @JsonKey(name: 'StateName')
          final String? stateName,
      @JsonKey(name: 'CountryName')
          final String? countryName,
      @JsonKey(name: 'IsActive')
          required final bool isActive,
      @JsonKey(name: 'CreatedBy')
          final String? createdBy,
      @JsonKey(name: 'CreationDate')
          required final String creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          final String? lastUpdatedBy,
      @JsonKey(name: 'LastUpdateDate')
          required final String lastUpdateDate,
      @JsonKey(name: 'SiteId')
          required final int siteId,
      @JsonKey(name: 'MasterEntityId')
          required final int masterEntityId,
      @JsonKey(name: 'SynchStatus')
          required final bool synchStatus,
      @JsonKey(name: 'Guid')
          final String? guid,
      @JsonKey(name: 'IsDefault')
          required final bool isDefault,
      @JsonKey(name: 'ContactDTOList')
          required final List<ContactDTO> contactDTOList,
      @JsonKey(name: 'IsChanged')
          required final bool isChanged,
      @JsonKey(name: 'IsChangedRecursive')
          required final bool isChangedRecursive}) = _$_AddressDTO;

  factory _AddressDTO.fromJson(Map<String, dynamic> json) =
      _$_AddressDTO.fromJson;

  @override
  @JsonKey(name: 'Id')
  int get id;
  @override
  @JsonKey(name: 'ProfileId')
  int get profileId;
  @override
  @JsonKey(name: 'AddressTypeId')
  int get addressTypeId;
  @override
  @JsonKey(name: 'AddressType')
  int get addressType;
  @override
  @JsonKey(name: 'Line1')
  String? get line1;
  @override
  @JsonKey(name: 'Line2')
  String? get line2;
  @override
  @JsonKey(name: 'Line3')
  String? get line3;
  @override
  @JsonKey(name: 'City')
  String? get city;
  @override
  @JsonKey(name: 'StateId')
  int get stateId;
  @override
  @JsonKey(name: 'CountryId')
  int get countryId;
  @override
  @JsonKey(name: 'PostalCode')
  String? get postalCode;
  @override
  @JsonKey(name: 'StateCode')
  String? get stateCode;
  @override
  @JsonKey(name: 'StateName')
  String? get stateName;
  @override
  @JsonKey(name: 'CountryName')
  String? get countryName;
  @override
  @JsonKey(name: 'IsActive')
  bool get isActive;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'CreationDate')
  String get creationDate;
  @override
  @JsonKey(name: 'LastUpdatedBy')
  String? get lastUpdatedBy;
  @override
  @JsonKey(name: 'LastUpdateDate')
  String get lastUpdateDate;
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
  @JsonKey(name: 'IsDefault')
  bool get isDefault;
  @override
  @JsonKey(name: 'ContactDTOList')
  List<ContactDTO> get contactDTOList;
  @override
  @JsonKey(name: 'IsChanged')
  bool get isChanged;
  @override
  @JsonKey(name: 'IsChangedRecursive')
  bool get isChangedRecursive;
  @override
  @JsonKey(ignore: true)
  _$$_AddressDTOCopyWith<_$_AddressDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
