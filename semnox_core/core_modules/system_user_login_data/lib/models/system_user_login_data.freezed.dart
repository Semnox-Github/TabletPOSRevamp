// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system_user_login_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SystemUserLoginData _$SystemUserLoginDataFromJson(Map<String, dynamic> json) {
  return _SystemUserLoginData.fromJson(json);
}

/// @nodoc
mixin _$SystemUserLoginData {
  @JsonKey(name: 'PosMachineGuid')
  String get posMachineGuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'WebApiToken')
  String get webApiToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'Token')
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'LanguageId')
  int get languageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsCorporate')
  bool get isCorporate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserPKId')
  int get userPKId => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserRoleId')
  int? get userRoleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MachineId')
  int get machineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteId')
  int get siteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SitePKId')
  int get sitePKId => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserId')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'POSMachineName')
  String get posMachineName => throw _privateConstructorUsedError;
  @JsonKey(name: 'LanguageCode')
  String get languageCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SystemUserLoginDataCopyWith<SystemUserLoginData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemUserLoginDataCopyWith<$Res> {
  factory $SystemUserLoginDataCopyWith(
          SystemUserLoginData value, $Res Function(SystemUserLoginData) then) =
      _$SystemUserLoginDataCopyWithImpl<$Res, SystemUserLoginData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'PosMachineGuid') String posMachineGuid,
      @JsonKey(name: 'WebApiToken') String webApiToken,
      @JsonKey(name: 'Token') String? token,
      @JsonKey(name: 'LanguageId') int languageId,
      @JsonKey(name: 'IsCorporate') bool isCorporate,
      @JsonKey(name: 'UserPKId') int userPKId,
      @JsonKey(name: 'UserRoleId') int? userRoleId,
      @JsonKey(name: 'MachineId') int machineId,
      @JsonKey(name: 'SiteId') int siteId,
      @JsonKey(name: 'SitePKId') int sitePKId,
      @JsonKey(name: 'UserId') String userId,
      @JsonKey(name: 'POSMachineName') String posMachineName,
      @JsonKey(name: 'LanguageCode') String languageCode});
}

/// @nodoc
class _$SystemUserLoginDataCopyWithImpl<$Res, $Val extends SystemUserLoginData>
    implements $SystemUserLoginDataCopyWith<$Res> {
  _$SystemUserLoginDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posMachineGuid = null,
    Object? webApiToken = null,
    Object? token = freezed,
    Object? languageId = null,
    Object? isCorporate = null,
    Object? userPKId = null,
    Object? userRoleId = freezed,
    Object? machineId = null,
    Object? siteId = null,
    Object? sitePKId = null,
    Object? userId = null,
    Object? posMachineName = null,
    Object? languageCode = null,
  }) {
    return _then(_value.copyWith(
      posMachineGuid: null == posMachineGuid
          ? _value.posMachineGuid
          : posMachineGuid // ignore: cast_nullable_to_non_nullable
              as String,
      webApiToken: null == webApiToken
          ? _value.webApiToken
          : webApiToken // ignore: cast_nullable_to_non_nullable
              as String,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      languageId: null == languageId
          ? _value.languageId
          : languageId // ignore: cast_nullable_to_non_nullable
              as int,
      isCorporate: null == isCorporate
          ? _value.isCorporate
          : isCorporate // ignore: cast_nullable_to_non_nullable
              as bool,
      userPKId: null == userPKId
          ? _value.userPKId
          : userPKId // ignore: cast_nullable_to_non_nullable
              as int,
      userRoleId: freezed == userRoleId
          ? _value.userRoleId
          : userRoleId // ignore: cast_nullable_to_non_nullable
              as int?,
      machineId: null == machineId
          ? _value.machineId
          : machineId // ignore: cast_nullable_to_non_nullable
              as int,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      sitePKId: null == sitePKId
          ? _value.sitePKId
          : sitePKId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      posMachineName: null == posMachineName
          ? _value.posMachineName
          : posMachineName // ignore: cast_nullable_to_non_nullable
              as String,
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SystemUserLoginDataCopyWith<$Res>
    implements $SystemUserLoginDataCopyWith<$Res> {
  factory _$$_SystemUserLoginDataCopyWith(_$_SystemUserLoginData value,
          $Res Function(_$_SystemUserLoginData) then) =
      __$$_SystemUserLoginDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PosMachineGuid') String posMachineGuid,
      @JsonKey(name: 'WebApiToken') String webApiToken,
      @JsonKey(name: 'Token') String? token,
      @JsonKey(name: 'LanguageId') int languageId,
      @JsonKey(name: 'IsCorporate') bool isCorporate,
      @JsonKey(name: 'UserPKId') int userPKId,
      @JsonKey(name: 'UserRoleId') int? userRoleId,
      @JsonKey(name: 'MachineId') int machineId,
      @JsonKey(name: 'SiteId') int siteId,
      @JsonKey(name: 'SitePKId') int sitePKId,
      @JsonKey(name: 'UserId') String userId,
      @JsonKey(name: 'POSMachineName') String posMachineName,
      @JsonKey(name: 'LanguageCode') String languageCode});
}

/// @nodoc
class __$$_SystemUserLoginDataCopyWithImpl<$Res>
    extends _$SystemUserLoginDataCopyWithImpl<$Res, _$_SystemUserLoginData>
    implements _$$_SystemUserLoginDataCopyWith<$Res> {
  __$$_SystemUserLoginDataCopyWithImpl(_$_SystemUserLoginData _value,
      $Res Function(_$_SystemUserLoginData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posMachineGuid = null,
    Object? webApiToken = null,
    Object? token = freezed,
    Object? languageId = null,
    Object? isCorporate = null,
    Object? userPKId = null,
    Object? userRoleId = freezed,
    Object? machineId = null,
    Object? siteId = null,
    Object? sitePKId = null,
    Object? userId = null,
    Object? posMachineName = null,
    Object? languageCode = null,
  }) {
    return _then(_$_SystemUserLoginData(
      posMachineGuid: null == posMachineGuid
          ? _value.posMachineGuid
          : posMachineGuid // ignore: cast_nullable_to_non_nullable
              as String,
      webApiToken: null == webApiToken
          ? _value.webApiToken
          : webApiToken // ignore: cast_nullable_to_non_nullable
              as String,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      languageId: null == languageId
          ? _value.languageId
          : languageId // ignore: cast_nullable_to_non_nullable
              as int,
      isCorporate: null == isCorporate
          ? _value.isCorporate
          : isCorporate // ignore: cast_nullable_to_non_nullable
              as bool,
      userPKId: null == userPKId
          ? _value.userPKId
          : userPKId // ignore: cast_nullable_to_non_nullable
              as int,
      userRoleId: freezed == userRoleId
          ? _value.userRoleId
          : userRoleId // ignore: cast_nullable_to_non_nullable
              as int?,
      machineId: null == machineId
          ? _value.machineId
          : machineId // ignore: cast_nullable_to_non_nullable
              as int,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      sitePKId: null == sitePKId
          ? _value.sitePKId
          : sitePKId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      posMachineName: null == posMachineName
          ? _value.posMachineName
          : posMachineName // ignore: cast_nullable_to_non_nullable
              as String,
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SystemUserLoginData
    with DiagnosticableTreeMixin
    implements _SystemUserLoginData {
  const _$_SystemUserLoginData(
      {@JsonKey(name: 'PosMachineGuid') required this.posMachineGuid,
      @JsonKey(name: 'WebApiToken') required this.webApiToken,
      @JsonKey(name: 'Token') this.token,
      @JsonKey(name: 'LanguageId') required this.languageId,
      @JsonKey(name: 'IsCorporate') required this.isCorporate,
      @JsonKey(name: 'UserPKId') required this.userPKId,
      @JsonKey(name: 'UserRoleId') this.userRoleId,
      @JsonKey(name: 'MachineId') required this.machineId,
      @JsonKey(name: 'SiteId') required this.siteId,
      @JsonKey(name: 'SitePKId') required this.sitePKId,
      @JsonKey(name: 'UserId') required this.userId,
      @JsonKey(name: 'POSMachineName') required this.posMachineName,
      @JsonKey(name: 'LanguageCode') required this.languageCode});

  factory _$_SystemUserLoginData.fromJson(Map<String, dynamic> json) =>
      _$$_SystemUserLoginDataFromJson(json);

  @override
  @JsonKey(name: 'PosMachineGuid')
  final String posMachineGuid;
  @override
  @JsonKey(name: 'WebApiToken')
  final String webApiToken;
  @override
  @JsonKey(name: 'Token')
  final String? token;
  @override
  @JsonKey(name: 'LanguageId')
  final int languageId;
  @override
  @JsonKey(name: 'IsCorporate')
  final bool isCorporate;
  @override
  @JsonKey(name: 'UserPKId')
  final int userPKId;
  @override
  @JsonKey(name: 'UserRoleId')
  final int? userRoleId;
  @override
  @JsonKey(name: 'MachineId')
  final int machineId;
  @override
  @JsonKey(name: 'SiteId')
  final int siteId;
  @override
  @JsonKey(name: 'SitePKId')
  final int sitePKId;
  @override
  @JsonKey(name: 'UserId')
  final String userId;
  @override
  @JsonKey(name: 'POSMachineName')
  final String posMachineName;
  @override
  @JsonKey(name: 'LanguageCode')
  final String languageCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SystemUserLoginData(posMachineGuid: $posMachineGuid, webApiToken: $webApiToken, token: $token, languageId: $languageId, isCorporate: $isCorporate, userPKId: $userPKId, userRoleId: $userRoleId, machineId: $machineId, siteId: $siteId, sitePKId: $sitePKId, userId: $userId, posMachineName: $posMachineName, languageCode: $languageCode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SystemUserLoginData'))
      ..add(DiagnosticsProperty('posMachineGuid', posMachineGuid))
      ..add(DiagnosticsProperty('webApiToken', webApiToken))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('languageId', languageId))
      ..add(DiagnosticsProperty('isCorporate', isCorporate))
      ..add(DiagnosticsProperty('userPKId', userPKId))
      ..add(DiagnosticsProperty('userRoleId', userRoleId))
      ..add(DiagnosticsProperty('machineId', machineId))
      ..add(DiagnosticsProperty('siteId', siteId))
      ..add(DiagnosticsProperty('sitePKId', sitePKId))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('posMachineName', posMachineName))
      ..add(DiagnosticsProperty('languageCode', languageCode));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SystemUserLoginData &&
            (identical(other.posMachineGuid, posMachineGuid) ||
                other.posMachineGuid == posMachineGuid) &&
            (identical(other.webApiToken, webApiToken) ||
                other.webApiToken == webApiToken) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.languageId, languageId) ||
                other.languageId == languageId) &&
            (identical(other.isCorporate, isCorporate) ||
                other.isCorporate == isCorporate) &&
            (identical(other.userPKId, userPKId) ||
                other.userPKId == userPKId) &&
            (identical(other.userRoleId, userRoleId) ||
                other.userRoleId == userRoleId) &&
            (identical(other.machineId, machineId) ||
                other.machineId == machineId) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.sitePKId, sitePKId) ||
                other.sitePKId == sitePKId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.posMachineName, posMachineName) ||
                other.posMachineName == posMachineName) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      posMachineGuid,
      webApiToken,
      token,
      languageId,
      isCorporate,
      userPKId,
      userRoleId,
      machineId,
      siteId,
      sitePKId,
      userId,
      posMachineName,
      languageCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SystemUserLoginDataCopyWith<_$_SystemUserLoginData> get copyWith =>
      __$$_SystemUserLoginDataCopyWithImpl<_$_SystemUserLoginData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SystemUserLoginDataToJson(
      this,
    );
  }
}

abstract class _SystemUserLoginData implements SystemUserLoginData {
  const factory _SystemUserLoginData(
      {@JsonKey(name: 'PosMachineGuid')
          required final String posMachineGuid,
      @JsonKey(name: 'WebApiToken')
          required final String webApiToken,
      @JsonKey(name: 'Token')
          final String? token,
      @JsonKey(name: 'LanguageId')
          required final int languageId,
      @JsonKey(name: 'IsCorporate')
          required final bool isCorporate,
      @JsonKey(name: 'UserPKId')
          required final int userPKId,
      @JsonKey(name: 'UserRoleId')
          final int? userRoleId,
      @JsonKey(name: 'MachineId')
          required final int machineId,
      @JsonKey(name: 'SiteId')
          required final int siteId,
      @JsonKey(name: 'SitePKId')
          required final int sitePKId,
      @JsonKey(name: 'UserId')
          required final String userId,
      @JsonKey(name: 'POSMachineName')
          required final String posMachineName,
      @JsonKey(name: 'LanguageCode')
          required final String languageCode}) = _$_SystemUserLoginData;

  factory _SystemUserLoginData.fromJson(Map<String, dynamic> json) =
      _$_SystemUserLoginData.fromJson;

  @override
  @JsonKey(name: 'PosMachineGuid')
  String get posMachineGuid;
  @override
  @JsonKey(name: 'WebApiToken')
  String get webApiToken;
  @override
  @JsonKey(name: 'Token')
  String? get token;
  @override
  @JsonKey(name: 'LanguageId')
  int get languageId;
  @override
  @JsonKey(name: 'IsCorporate')
  bool get isCorporate;
  @override
  @JsonKey(name: 'UserPKId')
  int get userPKId;
  @override
  @JsonKey(name: 'UserRoleId')
  int? get userRoleId;
  @override
  @JsonKey(name: 'MachineId')
  int get machineId;
  @override
  @JsonKey(name: 'SiteId')
  int get siteId;
  @override
  @JsonKey(name: 'SitePKId')
  int get sitePKId;
  @override
  @JsonKey(name: 'UserId')
  String get userId;
  @override
  @JsonKey(name: 'POSMachineName')
  String get posMachineName;
  @override
  @JsonKey(name: 'LanguageCode')
  String get languageCode;
  @override
  @JsonKey(ignore: true)
  _$$_SystemUserLoginDataCopyWith<_$_SystemUserLoginData> get copyWith =>
      throw _privateConstructorUsedError;
}
