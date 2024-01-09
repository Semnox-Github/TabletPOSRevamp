// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) {
  return _LoginRequest.fromJson(json);
}

/// @nodoc
mixin _$LoginRequest {
  @JsonKey(name: 'LoginId')
  String? get loginId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Password')
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteId')
  int get siteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MachineName')
  String get machineName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TagNumber')
  String? get tagNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginRequestCopyWith<LoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginRequestCopyWith<$Res> {
  factory $LoginRequestCopyWith(
          LoginRequest value, $Res Function(LoginRequest) then) =
      _$LoginRequestCopyWithImpl<$Res, LoginRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'LoginId') String? loginId,
      @JsonKey(name: 'Password') String? password,
      @JsonKey(name: 'SiteId') int siteId,
      @JsonKey(name: 'MachineName') String machineName,
      @JsonKey(name: 'TagNumber') String? tagNumber});
}

/// @nodoc
class _$LoginRequestCopyWithImpl<$Res, $Val extends LoginRequest>
    implements $LoginRequestCopyWith<$Res> {
  _$LoginRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginId = freezed,
    Object? password = freezed,
    Object? siteId = null,
    Object? machineName = null,
    Object? tagNumber = freezed,
  }) {
    return _then(_value.copyWith(
      loginId: freezed == loginId
          ? _value.loginId
          : loginId // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      machineName: null == machineName
          ? _value.machineName
          : machineName // ignore: cast_nullable_to_non_nullable
              as String,
      tagNumber: freezed == tagNumber
          ? _value.tagNumber
          : tagNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginRequestCopyWith<$Res>
    implements $LoginRequestCopyWith<$Res> {
  factory _$$_LoginRequestCopyWith(
          _$_LoginRequest value, $Res Function(_$_LoginRequest) then) =
      __$$_LoginRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'LoginId') String? loginId,
      @JsonKey(name: 'Password') String? password,
      @JsonKey(name: 'SiteId') int siteId,
      @JsonKey(name: 'MachineName') String machineName,
      @JsonKey(name: 'TagNumber') String? tagNumber});
}

/// @nodoc
class __$$_LoginRequestCopyWithImpl<$Res>
    extends _$LoginRequestCopyWithImpl<$Res, _$_LoginRequest>
    implements _$$_LoginRequestCopyWith<$Res> {
  __$$_LoginRequestCopyWithImpl(
      _$_LoginRequest _value, $Res Function(_$_LoginRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginId = freezed,
    Object? password = freezed,
    Object? siteId = null,
    Object? machineName = null,
    Object? tagNumber = freezed,
  }) {
    return _then(_$_LoginRequest(
      loginId: freezed == loginId
          ? _value.loginId
          : loginId // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      machineName: null == machineName
          ? _value.machineName
          : machineName // ignore: cast_nullable_to_non_nullable
              as String,
      tagNumber: freezed == tagNumber
          ? _value.tagNumber
          : tagNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginRequest implements _LoginRequest {
  const _$_LoginRequest(
      {@JsonKey(name: 'LoginId') this.loginId,
      @JsonKey(name: 'Password') this.password,
      @JsonKey(name: 'SiteId') required this.siteId,
      @JsonKey(name: 'MachineName') required this.machineName,
      @JsonKey(name: 'TagNumber') this.tagNumber});

  factory _$_LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$$_LoginRequestFromJson(json);

  @override
  @JsonKey(name: 'LoginId')
  final String? loginId;
  @override
  @JsonKey(name: 'Password')
  final String? password;
  @override
  @JsonKey(name: 'SiteId')
  final int siteId;
  @override
  @JsonKey(name: 'MachineName')
  final String machineName;
  @override
  @JsonKey(name: 'TagNumber')
  final String? tagNumber;

  @override
  String toString() {
    return 'LoginRequest(loginId: $loginId, password: $password, siteId: $siteId, machineName: $machineName, tagNumber: $tagNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginRequest &&
            (identical(other.loginId, loginId) || other.loginId == loginId) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.machineName, machineName) ||
                other.machineName == machineName) &&
            (identical(other.tagNumber, tagNumber) ||
                other.tagNumber == tagNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, loginId, password, siteId, machineName, tagNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginRequestCopyWith<_$_LoginRequest> get copyWith =>
      __$$_LoginRequestCopyWithImpl<_$_LoginRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginRequestToJson(
      this,
    );
  }
}

abstract class _LoginRequest implements LoginRequest {
  const factory _LoginRequest(
      {@JsonKey(name: 'LoginId') final String? loginId,
      @JsonKey(name: 'Password') final String? password,
      @JsonKey(name: 'SiteId') required final int siteId,
      @JsonKey(name: 'MachineName') required final String machineName,
      @JsonKey(name: 'TagNumber') final String? tagNumber}) = _$_LoginRequest;

  factory _LoginRequest.fromJson(Map<String, dynamic> json) =
      _$_LoginRequest.fromJson;

  @override
  @JsonKey(name: 'LoginId')
  String? get loginId;
  @override
  @JsonKey(name: 'Password')
  String? get password;
  @override
  @JsonKey(name: 'SiteId')
  int get siteId;
  @override
  @JsonKey(name: 'MachineName')
  String get machineName;
  @override
  @JsonKey(name: 'TagNumber')
  String? get tagNumber;
  @override
  @JsonKey(ignore: true)
  _$$_LoginRequestCopyWith<_$_LoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
