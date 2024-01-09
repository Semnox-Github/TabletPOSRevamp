// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system_user_login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SystemUserLoginResponse _$SystemUserLoginResponseFromJson(
    Map<String, dynamic> json) {
  return _SystemUserLoginResponse.fromJson(json);
}

/// @nodoc
mixin _$SystemUserLoginResponse {
  SystemUserLoginData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SystemUserLoginResponseCopyWith<SystemUserLoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemUserLoginResponseCopyWith<$Res> {
  factory $SystemUserLoginResponseCopyWith(SystemUserLoginResponse value,
          $Res Function(SystemUserLoginResponse) then) =
      _$SystemUserLoginResponseCopyWithImpl<$Res, SystemUserLoginResponse>;
  @useResult
  $Res call({SystemUserLoginData? data, String? exception});

  $SystemUserLoginDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$SystemUserLoginResponseCopyWithImpl<$Res,
        $Val extends SystemUserLoginResponse>
    implements $SystemUserLoginResponseCopyWith<$Res> {
  _$SystemUserLoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SystemUserLoginData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SystemUserLoginDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SystemUserLoginDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SystemUserLoginResponseCopyWith<$Res>
    implements $SystemUserLoginResponseCopyWith<$Res> {
  factory _$$_SystemUserLoginResponseCopyWith(_$_SystemUserLoginResponse value,
          $Res Function(_$_SystemUserLoginResponse) then) =
      __$$_SystemUserLoginResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SystemUserLoginData? data, String? exception});

  @override
  $SystemUserLoginDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_SystemUserLoginResponseCopyWithImpl<$Res>
    extends _$SystemUserLoginResponseCopyWithImpl<$Res,
        _$_SystemUserLoginResponse>
    implements _$$_SystemUserLoginResponseCopyWith<$Res> {
  __$$_SystemUserLoginResponseCopyWithImpl(_$_SystemUserLoginResponse _value,
      $Res Function(_$_SystemUserLoginResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_SystemUserLoginResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SystemUserLoginData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SystemUserLoginResponse
    with DiagnosticableTreeMixin
    implements _SystemUserLoginResponse {
  const _$_SystemUserLoginResponse({this.data, this.exception});

  factory _$_SystemUserLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SystemUserLoginResponseFromJson(json);

  @override
  final SystemUserLoginData? data;
  @override
  final String? exception;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SystemUserLoginResponse(data: $data, exception: $exception)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SystemUserLoginResponse'))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('exception', exception));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SystemUserLoginResponse &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SystemUserLoginResponseCopyWith<_$_SystemUserLoginResponse>
      get copyWith =>
          __$$_SystemUserLoginResponseCopyWithImpl<_$_SystemUserLoginResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SystemUserLoginResponseToJson(
      this,
    );
  }
}

abstract class _SystemUserLoginResponse implements SystemUserLoginResponse {
  const factory _SystemUserLoginResponse(
      {final SystemUserLoginData? data,
      final String? exception}) = _$_SystemUserLoginResponse;

  factory _SystemUserLoginResponse.fromJson(Map<String, dynamic> json) =
      _$_SystemUserLoginResponse.fromJson;

  @override
  SystemUserLoginData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_SystemUserLoginResponseCopyWith<_$_SystemUserLoginResponse>
      get copyWith => throw _privateConstructorUsedError;
}
