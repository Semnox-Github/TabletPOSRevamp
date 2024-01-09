// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SiteDTO _$SiteDTOFromJson(Map<String, dynamic> json) {
  return _SiteDTO.fromJson(json);
}

/// @nodoc
mixin _$SiteDTO {
  @JsonKey(name: 'SiteId')
  int get siteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteName')
  String get siteName => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteAddress')
  String get siteAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsMasterSite')
  bool get isMasterSite => throw _privateConstructorUsedError;
  @JsonKey(name: 'OnlineEnabled')
  bool get onlineEnabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'PinCode')
  String get pinCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteURL')
  String get siteURL => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteShortName')
  String get siteShortName => throw _privateConstructorUsedError;
  @JsonKey(name: 'City')
  String get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'State')
  String get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'Country')
  String get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'StoreType')
  String get storeType => throw _privateConstructorUsedError;
  @JsonKey(name: 'Logo')
  String? get logo => throw _privateConstructorUsedError;
  @JsonKey(name: 'StoreRanking')
  String get storeRanking => throw _privateConstructorUsedError;
  @JsonKey(name: 'OpenTime')
  double get openTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'CloseTime')
  double get closeTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'OpenDate')
  String get openDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'ClosureDate')
  String get closureDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'BusinessDayStartTime')
  int get businessDayStartTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'TimeZoneName')
  String get timeZoneName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'PhoneNumber')
  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteDeliveryDetailsDTOList')
  List<SiteDeliveryDetailsDTO>? get siteDeliveryDetailsDTOList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SiteDTOCopyWith<SiteDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteDTOCopyWith<$Res> {
  factory $SiteDTOCopyWith(SiteDTO value, $Res Function(SiteDTO) then) =
      _$SiteDTOCopyWithImpl<$Res, SiteDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'SiteId')
          int siteId,
      @JsonKey(name: 'SiteName')
          String siteName,
      @JsonKey(name: 'SiteAddress')
          String siteAddress,
      @JsonKey(name: 'IsMasterSite')
          bool isMasterSite,
      @JsonKey(name: 'OnlineEnabled')
          bool onlineEnabled,
      @JsonKey(name: 'PinCode')
          String pinCode,
      @JsonKey(name: 'SiteURL')
          String siteURL,
      @JsonKey(name: 'SiteShortName')
          String siteShortName,
      @JsonKey(name: 'City')
          String city,
      @JsonKey(name: 'State')
          String state,
      @JsonKey(name: 'Country')
          String country,
      @JsonKey(name: 'StoreType')
          String storeType,
      @JsonKey(name: 'Logo')
          String? logo,
      @JsonKey(name: 'StoreRanking')
          String storeRanking,
      @JsonKey(name: 'OpenTime')
          double openTime,
      @JsonKey(name: 'CloseTime')
          double closeTime,
      @JsonKey(name: 'OpenDate')
          String openDate,
      @JsonKey(name: 'ClosureDate')
          String closureDate,
      @JsonKey(name: 'BusinessDayStartTime')
          int businessDayStartTime,
      @JsonKey(name: 'TimeZoneName')
          String timeZoneName,
      @JsonKey(name: 'Email')
          String email,
      @JsonKey(name: 'PhoneNumber')
          String phoneNumber,
      @JsonKey(name: 'SiteDeliveryDetailsDTOList')
          List<SiteDeliveryDetailsDTO>? siteDeliveryDetailsDTOList});
}

/// @nodoc
class _$SiteDTOCopyWithImpl<$Res, $Val extends SiteDTO>
    implements $SiteDTOCopyWith<$Res> {
  _$SiteDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? siteId = null,
    Object? siteName = null,
    Object? siteAddress = null,
    Object? isMasterSite = null,
    Object? onlineEnabled = null,
    Object? pinCode = null,
    Object? siteURL = null,
    Object? siteShortName = null,
    Object? city = null,
    Object? state = null,
    Object? country = null,
    Object? storeType = null,
    Object? logo = freezed,
    Object? storeRanking = null,
    Object? openTime = null,
    Object? closeTime = null,
    Object? openDate = null,
    Object? closureDate = null,
    Object? businessDayStartTime = null,
    Object? timeZoneName = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? siteDeliveryDetailsDTOList = freezed,
  }) {
    return _then(_value.copyWith(
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      siteName: null == siteName
          ? _value.siteName
          : siteName // ignore: cast_nullable_to_non_nullable
              as String,
      siteAddress: null == siteAddress
          ? _value.siteAddress
          : siteAddress // ignore: cast_nullable_to_non_nullable
              as String,
      isMasterSite: null == isMasterSite
          ? _value.isMasterSite
          : isMasterSite // ignore: cast_nullable_to_non_nullable
              as bool,
      onlineEnabled: null == onlineEnabled
          ? _value.onlineEnabled
          : onlineEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      pinCode: null == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
      siteURL: null == siteURL
          ? _value.siteURL
          : siteURL // ignore: cast_nullable_to_non_nullable
              as String,
      siteShortName: null == siteShortName
          ? _value.siteShortName
          : siteShortName // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      storeType: null == storeType
          ? _value.storeType
          : storeType // ignore: cast_nullable_to_non_nullable
              as String,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      storeRanking: null == storeRanking
          ? _value.storeRanking
          : storeRanking // ignore: cast_nullable_to_non_nullable
              as String,
      openTime: null == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as double,
      closeTime: null == closeTime
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as double,
      openDate: null == openDate
          ? _value.openDate
          : openDate // ignore: cast_nullable_to_non_nullable
              as String,
      closureDate: null == closureDate
          ? _value.closureDate
          : closureDate // ignore: cast_nullable_to_non_nullable
              as String,
      businessDayStartTime: null == businessDayStartTime
          ? _value.businessDayStartTime
          : businessDayStartTime // ignore: cast_nullable_to_non_nullable
              as int,
      timeZoneName: null == timeZoneName
          ? _value.timeZoneName
          : timeZoneName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      siteDeliveryDetailsDTOList: freezed == siteDeliveryDetailsDTOList
          ? _value.siteDeliveryDetailsDTOList
          : siteDeliveryDetailsDTOList // ignore: cast_nullable_to_non_nullable
              as List<SiteDeliveryDetailsDTO>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SiteDTOCopyWith<$Res> implements $SiteDTOCopyWith<$Res> {
  factory _$$_SiteDTOCopyWith(
          _$_SiteDTO value, $Res Function(_$_SiteDTO) then) =
      __$$_SiteDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'SiteId')
          int siteId,
      @JsonKey(name: 'SiteName')
          String siteName,
      @JsonKey(name: 'SiteAddress')
          String siteAddress,
      @JsonKey(name: 'IsMasterSite')
          bool isMasterSite,
      @JsonKey(name: 'OnlineEnabled')
          bool onlineEnabled,
      @JsonKey(name: 'PinCode')
          String pinCode,
      @JsonKey(name: 'SiteURL')
          String siteURL,
      @JsonKey(name: 'SiteShortName')
          String siteShortName,
      @JsonKey(name: 'City')
          String city,
      @JsonKey(name: 'State')
          String state,
      @JsonKey(name: 'Country')
          String country,
      @JsonKey(name: 'StoreType')
          String storeType,
      @JsonKey(name: 'Logo')
          String? logo,
      @JsonKey(name: 'StoreRanking')
          String storeRanking,
      @JsonKey(name: 'OpenTime')
          double openTime,
      @JsonKey(name: 'CloseTime')
          double closeTime,
      @JsonKey(name: 'OpenDate')
          String openDate,
      @JsonKey(name: 'ClosureDate')
          String closureDate,
      @JsonKey(name: 'BusinessDayStartTime')
          int businessDayStartTime,
      @JsonKey(name: 'TimeZoneName')
          String timeZoneName,
      @JsonKey(name: 'Email')
          String email,
      @JsonKey(name: 'PhoneNumber')
          String phoneNumber,
      @JsonKey(name: 'SiteDeliveryDetailsDTOList')
          List<SiteDeliveryDetailsDTO>? siteDeliveryDetailsDTOList});
}

/// @nodoc
class __$$_SiteDTOCopyWithImpl<$Res>
    extends _$SiteDTOCopyWithImpl<$Res, _$_SiteDTO>
    implements _$$_SiteDTOCopyWith<$Res> {
  __$$_SiteDTOCopyWithImpl(_$_SiteDTO _value, $Res Function(_$_SiteDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? siteId = null,
    Object? siteName = null,
    Object? siteAddress = null,
    Object? isMasterSite = null,
    Object? onlineEnabled = null,
    Object? pinCode = null,
    Object? siteURL = null,
    Object? siteShortName = null,
    Object? city = null,
    Object? state = null,
    Object? country = null,
    Object? storeType = null,
    Object? logo = freezed,
    Object? storeRanking = null,
    Object? openTime = null,
    Object? closeTime = null,
    Object? openDate = null,
    Object? closureDate = null,
    Object? businessDayStartTime = null,
    Object? timeZoneName = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? siteDeliveryDetailsDTOList = freezed,
  }) {
    return _then(_$_SiteDTO(
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      siteName: null == siteName
          ? _value.siteName
          : siteName // ignore: cast_nullable_to_non_nullable
              as String,
      siteAddress: null == siteAddress
          ? _value.siteAddress
          : siteAddress // ignore: cast_nullable_to_non_nullable
              as String,
      isMasterSite: null == isMasterSite
          ? _value.isMasterSite
          : isMasterSite // ignore: cast_nullable_to_non_nullable
              as bool,
      onlineEnabled: null == onlineEnabled
          ? _value.onlineEnabled
          : onlineEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      pinCode: null == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
      siteURL: null == siteURL
          ? _value.siteURL
          : siteURL // ignore: cast_nullable_to_non_nullable
              as String,
      siteShortName: null == siteShortName
          ? _value.siteShortName
          : siteShortName // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      storeType: null == storeType
          ? _value.storeType
          : storeType // ignore: cast_nullable_to_non_nullable
              as String,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      storeRanking: null == storeRanking
          ? _value.storeRanking
          : storeRanking // ignore: cast_nullable_to_non_nullable
              as String,
      openTime: null == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as double,
      closeTime: null == closeTime
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as double,
      openDate: null == openDate
          ? _value.openDate
          : openDate // ignore: cast_nullable_to_non_nullable
              as String,
      closureDate: null == closureDate
          ? _value.closureDate
          : closureDate // ignore: cast_nullable_to_non_nullable
              as String,
      businessDayStartTime: null == businessDayStartTime
          ? _value.businessDayStartTime
          : businessDayStartTime // ignore: cast_nullable_to_non_nullable
              as int,
      timeZoneName: null == timeZoneName
          ? _value.timeZoneName
          : timeZoneName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      siteDeliveryDetailsDTOList: freezed == siteDeliveryDetailsDTOList
          ? _value._siteDeliveryDetailsDTOList
          : siteDeliveryDetailsDTOList // ignore: cast_nullable_to_non_nullable
              as List<SiteDeliveryDetailsDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SiteDTO with DiagnosticableTreeMixin implements _SiteDTO {
  const _$_SiteDTO(
      {@JsonKey(name: 'SiteId')
          required this.siteId,
      @JsonKey(name: 'SiteName')
          required this.siteName,
      @JsonKey(name: 'SiteAddress')
          required this.siteAddress,
      @JsonKey(name: 'IsMasterSite')
          required this.isMasterSite,
      @JsonKey(name: 'OnlineEnabled')
          required this.onlineEnabled,
      @JsonKey(name: 'PinCode')
          required this.pinCode,
      @JsonKey(name: 'SiteURL')
          required this.siteURL,
      @JsonKey(name: 'SiteShortName')
          required this.siteShortName,
      @JsonKey(name: 'City')
          required this.city,
      @JsonKey(name: 'State')
          required this.state,
      @JsonKey(name: 'Country')
          required this.country,
      @JsonKey(name: 'StoreType')
          required this.storeType,
      @JsonKey(name: 'Logo')
          this.logo,
      @JsonKey(name: 'StoreRanking')
          required this.storeRanking,
      @JsonKey(name: 'OpenTime')
          required this.openTime,
      @JsonKey(name: 'CloseTime')
          required this.closeTime,
      @JsonKey(name: 'OpenDate')
          required this.openDate,
      @JsonKey(name: 'ClosureDate')
          required this.closureDate,
      @JsonKey(name: 'BusinessDayStartTime')
          required this.businessDayStartTime,
      @JsonKey(name: 'TimeZoneName')
          required this.timeZoneName,
      @JsonKey(name: 'Email')
          required this.email,
      @JsonKey(name: 'PhoneNumber')
          required this.phoneNumber,
      @JsonKey(name: 'SiteDeliveryDetailsDTOList')
          final List<SiteDeliveryDetailsDTO>? siteDeliveryDetailsDTOList})
      : _siteDeliveryDetailsDTOList = siteDeliveryDetailsDTOList;

  factory _$_SiteDTO.fromJson(Map<String, dynamic> json) =>
      _$$_SiteDTOFromJson(json);

  @override
  @JsonKey(name: 'SiteId')
  final int siteId;
  @override
  @JsonKey(name: 'SiteName')
  final String siteName;
  @override
  @JsonKey(name: 'SiteAddress')
  final String siteAddress;
  @override
  @JsonKey(name: 'IsMasterSite')
  final bool isMasterSite;
  @override
  @JsonKey(name: 'OnlineEnabled')
  final bool onlineEnabled;
  @override
  @JsonKey(name: 'PinCode')
  final String pinCode;
  @override
  @JsonKey(name: 'SiteURL')
  final String siteURL;
  @override
  @JsonKey(name: 'SiteShortName')
  final String siteShortName;
  @override
  @JsonKey(name: 'City')
  final String city;
  @override
  @JsonKey(name: 'State')
  final String state;
  @override
  @JsonKey(name: 'Country')
  final String country;
  @override
  @JsonKey(name: 'StoreType')
  final String storeType;
  @override
  @JsonKey(name: 'Logo')
  final String? logo;
  @override
  @JsonKey(name: 'StoreRanking')
  final String storeRanking;
  @override
  @JsonKey(name: 'OpenTime')
  final double openTime;
  @override
  @JsonKey(name: 'CloseTime')
  final double closeTime;
  @override
  @JsonKey(name: 'OpenDate')
  final String openDate;
  @override
  @JsonKey(name: 'ClosureDate')
  final String closureDate;
  @override
  @JsonKey(name: 'BusinessDayStartTime')
  final int businessDayStartTime;
  @override
  @JsonKey(name: 'TimeZoneName')
  final String timeZoneName;
  @override
  @JsonKey(name: 'Email')
  final String email;
  @override
  @JsonKey(name: 'PhoneNumber')
  final String phoneNumber;
  final List<SiteDeliveryDetailsDTO>? _siteDeliveryDetailsDTOList;
  @override
  @JsonKey(name: 'SiteDeliveryDetailsDTOList')
  List<SiteDeliveryDetailsDTO>? get siteDeliveryDetailsDTOList {
    final value = _siteDeliveryDetailsDTOList;
    if (value == null) return null;
    if (_siteDeliveryDetailsDTOList is EqualUnmodifiableListView)
      return _siteDeliveryDetailsDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SiteDTO(siteId: $siteId, siteName: $siteName, siteAddress: $siteAddress, isMasterSite: $isMasterSite, onlineEnabled: $onlineEnabled, pinCode: $pinCode, siteURL: $siteURL, siteShortName: $siteShortName, city: $city, state: $state, country: $country, storeType: $storeType, logo: $logo, storeRanking: $storeRanking, openTime: $openTime, closeTime: $closeTime, openDate: $openDate, closureDate: $closureDate, businessDayStartTime: $businessDayStartTime, timeZoneName: $timeZoneName, email: $email, phoneNumber: $phoneNumber, siteDeliveryDetailsDTOList: $siteDeliveryDetailsDTOList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SiteDTO'))
      ..add(DiagnosticsProperty('siteId', siteId))
      ..add(DiagnosticsProperty('siteName', siteName))
      ..add(DiagnosticsProperty('siteAddress', siteAddress))
      ..add(DiagnosticsProperty('isMasterSite', isMasterSite))
      ..add(DiagnosticsProperty('onlineEnabled', onlineEnabled))
      ..add(DiagnosticsProperty('pinCode', pinCode))
      ..add(DiagnosticsProperty('siteURL', siteURL))
      ..add(DiagnosticsProperty('siteShortName', siteShortName))
      ..add(DiagnosticsProperty('city', city))
      ..add(DiagnosticsProperty('state', state))
      ..add(DiagnosticsProperty('country', country))
      ..add(DiagnosticsProperty('storeType', storeType))
      ..add(DiagnosticsProperty('logo', logo))
      ..add(DiagnosticsProperty('storeRanking', storeRanking))
      ..add(DiagnosticsProperty('openTime', openTime))
      ..add(DiagnosticsProperty('closeTime', closeTime))
      ..add(DiagnosticsProperty('openDate', openDate))
      ..add(DiagnosticsProperty('closureDate', closureDate))
      ..add(DiagnosticsProperty('businessDayStartTime', businessDayStartTime))
      ..add(DiagnosticsProperty('timeZoneName', timeZoneName))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty(
          'siteDeliveryDetailsDTOList', siteDeliveryDetailsDTOList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SiteDTO &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.siteName, siteName) ||
                other.siteName == siteName) &&
            (identical(other.siteAddress, siteAddress) ||
                other.siteAddress == siteAddress) &&
            (identical(other.isMasterSite, isMasterSite) ||
                other.isMasterSite == isMasterSite) &&
            (identical(other.onlineEnabled, onlineEnabled) ||
                other.onlineEnabled == onlineEnabled) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode) &&
            (identical(other.siteURL, siteURL) || other.siteURL == siteURL) &&
            (identical(other.siteShortName, siteShortName) ||
                other.siteShortName == siteShortName) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.storeType, storeType) ||
                other.storeType == storeType) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.storeRanking, storeRanking) ||
                other.storeRanking == storeRanking) &&
            (identical(other.openTime, openTime) ||
                other.openTime == openTime) &&
            (identical(other.closeTime, closeTime) ||
                other.closeTime == closeTime) &&
            (identical(other.openDate, openDate) ||
                other.openDate == openDate) &&
            (identical(other.closureDate, closureDate) ||
                other.closureDate == closureDate) &&
            (identical(other.businessDayStartTime, businessDayStartTime) ||
                other.businessDayStartTime == businessDayStartTime) &&
            (identical(other.timeZoneName, timeZoneName) ||
                other.timeZoneName == timeZoneName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            const DeepCollectionEquality().equals(
                other._siteDeliveryDetailsDTOList,
                _siteDeliveryDetailsDTOList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        siteId,
        siteName,
        siteAddress,
        isMasterSite,
        onlineEnabled,
        pinCode,
        siteURL,
        siteShortName,
        city,
        state,
        country,
        storeType,
        logo,
        storeRanking,
        openTime,
        closeTime,
        openDate,
        closureDate,
        businessDayStartTime,
        timeZoneName,
        email,
        phoneNumber,
        const DeepCollectionEquality().hash(_siteDeliveryDetailsDTOList)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SiteDTOCopyWith<_$_SiteDTO> get copyWith =>
      __$$_SiteDTOCopyWithImpl<_$_SiteDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SiteDTOToJson(
      this,
    );
  }
}

abstract class _SiteDTO implements SiteDTO {
  const factory _SiteDTO(
          {@JsonKey(name: 'SiteId')
              required final int siteId,
          @JsonKey(name: 'SiteName')
              required final String siteName,
          @JsonKey(name: 'SiteAddress')
              required final String siteAddress,
          @JsonKey(name: 'IsMasterSite')
              required final bool isMasterSite,
          @JsonKey(name: 'OnlineEnabled')
              required final bool onlineEnabled,
          @JsonKey(name: 'PinCode')
              required final String pinCode,
          @JsonKey(name: 'SiteURL')
              required final String siteURL,
          @JsonKey(name: 'SiteShortName')
              required final String siteShortName,
          @JsonKey(name: 'City')
              required final String city,
          @JsonKey(name: 'State')
              required final String state,
          @JsonKey(name: 'Country')
              required final String country,
          @JsonKey(name: 'StoreType')
              required final String storeType,
          @JsonKey(name: 'Logo')
              final String? logo,
          @JsonKey(name: 'StoreRanking')
              required final String storeRanking,
          @JsonKey(name: 'OpenTime')
              required final double openTime,
          @JsonKey(name: 'CloseTime')
              required final double closeTime,
          @JsonKey(name: 'OpenDate')
              required final String openDate,
          @JsonKey(name: 'ClosureDate')
              required final String closureDate,
          @JsonKey(name: 'BusinessDayStartTime')
              required final int businessDayStartTime,
          @JsonKey(name: 'TimeZoneName')
              required final String timeZoneName,
          @JsonKey(name: 'Email')
              required final String email,
          @JsonKey(name: 'PhoneNumber')
              required final String phoneNumber,
          @JsonKey(name: 'SiteDeliveryDetailsDTOList')
              final List<SiteDeliveryDetailsDTO>? siteDeliveryDetailsDTOList}) =
      _$_SiteDTO;

  factory _SiteDTO.fromJson(Map<String, dynamic> json) = _$_SiteDTO.fromJson;

  @override
  @JsonKey(name: 'SiteId')
  int get siteId;
  @override
  @JsonKey(name: 'SiteName')
  String get siteName;
  @override
  @JsonKey(name: 'SiteAddress')
  String get siteAddress;
  @override
  @JsonKey(name: 'IsMasterSite')
  bool get isMasterSite;
  @override
  @JsonKey(name: 'OnlineEnabled')
  bool get onlineEnabled;
  @override
  @JsonKey(name: 'PinCode')
  String get pinCode;
  @override
  @JsonKey(name: 'SiteURL')
  String get siteURL;
  @override
  @JsonKey(name: 'SiteShortName')
  String get siteShortName;
  @override
  @JsonKey(name: 'City')
  String get city;
  @override
  @JsonKey(name: 'State')
  String get state;
  @override
  @JsonKey(name: 'Country')
  String get country;
  @override
  @JsonKey(name: 'StoreType')
  String get storeType;
  @override
  @JsonKey(name: 'Logo')
  String? get logo;
  @override
  @JsonKey(name: 'StoreRanking')
  String get storeRanking;
  @override
  @JsonKey(name: 'OpenTime')
  double get openTime;
  @override
  @JsonKey(name: 'CloseTime')
  double get closeTime;
  @override
  @JsonKey(name: 'OpenDate')
  String get openDate;
  @override
  @JsonKey(name: 'ClosureDate')
  String get closureDate;
  @override
  @JsonKey(name: 'BusinessDayStartTime')
  int get businessDayStartTime;
  @override
  @JsonKey(name: 'TimeZoneName')
  String get timeZoneName;
  @override
  @JsonKey(name: 'Email')
  String get email;
  @override
  @JsonKey(name: 'PhoneNumber')
  String get phoneNumber;
  @override
  @JsonKey(name: 'SiteDeliveryDetailsDTOList')
  List<SiteDeliveryDetailsDTO>? get siteDeliveryDetailsDTOList;
  @override
  @JsonKey(ignore: true)
  _$$_SiteDTOCopyWith<_$_SiteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
