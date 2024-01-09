// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system_user_login_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SystemUserLoginRequest _$SystemUserLoginRequestFromJson(
    Map<String, dynamic> json) {
  return _SystemUserLoginRequest.fromJson(json);
}

/// @nodoc
mixin _$SystemUserLoginRequest {
  String get LoginId => throw _privateConstructorUsedError;
  String get Password => throw _privateConstructorUsedError;
  String get MachineName => throw _privateConstructorUsedError;
  int get SiteId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SystemUserLoginRequestCopyWith<SystemUserLoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemUserLoginRequestCopyWith<$Res> {
  factory $SystemUserLoginRequestCopyWith(SystemUserLoginRequest value,
          $Res Function(SystemUserLoginRequest) then) =
      _$SystemUserLoginRequestCopyWithImpl<$Res, SystemUserLoginRequest>;
  @useResult
  $Res call({String LoginId, String Password, String MachineName, int SiteId});
}

/// @nodoc
class _$SystemUserLoginRequestCopyWithImpl<$Res,
        $Val extends SystemUserLoginRequest>
    implements $SystemUserLoginRequestCopyWith<$Res> {
  _$SystemUserLoginRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? LoginId = null,
    Object? Password = null,
    Object? MachineName = null,
    Object? SiteId = null,
  }) {
    return _then(_value.copyWith(
      LoginId: null == LoginId
          ? _value.LoginId
          : LoginId // ignore: cast_nullable_to_non_nullable
              as String,
      Password: null == Password
          ? _value.Password
          : Password // ignore: cast_nullable_to_non_nullable
              as String,
      MachineName: null == MachineName
          ? _value.MachineName
          : MachineName // ignore: cast_nullable_to_non_nullable
              as String,
      SiteId: null == SiteId
          ? _value.SiteId
          : SiteId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SystemUserLoginRequestCopyWith<$Res>
    implements $SystemUserLoginRequestCopyWith<$Res> {
  factory _$$_SystemUserLoginRequestCopyWith(_$_SystemUserLoginRequest value,
          $Res Function(_$_SystemUserLoginRequest) then) =
      __$$_SystemUserLoginRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String LoginId, String Password, String MachineName, int SiteId});
}

/// @nodoc
class __$$_SystemUserLoginRequestCopyWithImpl<$Res>
    extends _$SystemUserLoginRequestCopyWithImpl<$Res,
        _$_SystemUserLoginRequest>
    implements _$$_SystemUserLoginRequestCopyWith<$Res> {
  __$$_SystemUserLoginRequestCopyWithImpl(_$_SystemUserLoginRequest _value,
      $Res Function(_$_SystemUserLoginRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? LoginId = null,
    Object? Password = null,
    Object? MachineName = null,
    Object? SiteId = null,
  }) {
    return _then(_$_SystemUserLoginRequest(
      LoginId: null == LoginId
          ? _value.LoginId
          : LoginId // ignore: cast_nullable_to_non_nullable
              as String,
      Password: null == Password
          ? _value.Password
          : Password // ignore: cast_nullable_to_non_nullable
              as String,
      MachineName: null == MachineName
          ? _value.MachineName
          : MachineName // ignore: cast_nullable_to_non_nullable
              as String,
      SiteId: null == SiteId
          ? _value.SiteId
          : SiteId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SystemUserLoginRequest implements _SystemUserLoginRequest {
  const _$_SystemUserLoginRequest(
      {required this.LoginId,
      required this.Password,
      required this.MachineName,
      required this.SiteId});

  factory _$_SystemUserLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$$_SystemUserLoginRequestFromJson(json);

  @override
  final String LoginId;
  @override
  final String Password;
  @override
  final String MachineName;
  @override
  final int SiteId;

  @override
  String toString() {
    return 'SystemUserLoginRequest(LoginId: $LoginId, Password: $Password, MachineName: $MachineName, SiteId: $SiteId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SystemUserLoginRequest &&
            (identical(other.LoginId, LoginId) || other.LoginId == LoginId) &&
            (identical(other.Password, Password) ||
                other.Password == Password) &&
            (identical(other.MachineName, MachineName) ||
                other.MachineName == MachineName) &&
            (identical(other.SiteId, SiteId) || other.SiteId == SiteId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, LoginId, Password, MachineName, SiteId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SystemUserLoginRequestCopyWith<_$_SystemUserLoginRequest> get copyWith =>
      __$$_SystemUserLoginRequestCopyWithImpl<_$_SystemUserLoginRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SystemUserLoginRequestToJson(
      this,
    );
  }
}

abstract class _SystemUserLoginRequest implements SystemUserLoginRequest {
  const factory _SystemUserLoginRequest(
      {required final String LoginId,
      required final String Password,
      required final String MachineName,
      required final int SiteId}) = _$_SystemUserLoginRequest;

  factory _SystemUserLoginRequest.fromJson(Map<String, dynamic> json) =
      _$_SystemUserLoginRequest.fromJson;

  @override
  String get LoginId;
  @override
  String get Password;
  @override
  String get MachineName;
  @override
  int get SiteId;
  @override
  @JsonKey(ignore: true)
  _$$_SystemUserLoginRequestCopyWith<_$_SystemUserLoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
