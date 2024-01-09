// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_role_container_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRoleContainerResponse _$UserRoleContainerResponseFromJson(
    Map<String, dynamic> json) {
  return _UserRoleContainerResponse.fromJson(json);
}

/// @nodoc
mixin _$UserRoleContainerResponse {
  UserRoleContainerData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRoleContainerResponseCopyWith<UserRoleContainerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRoleContainerResponseCopyWith<$Res> {
  factory $UserRoleContainerResponseCopyWith(UserRoleContainerResponse value,
          $Res Function(UserRoleContainerResponse) then) =
      _$UserRoleContainerResponseCopyWithImpl<$Res, UserRoleContainerResponse>;
  @useResult
  $Res call({UserRoleContainerData? data, String? exception});

  $UserRoleContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$UserRoleContainerResponseCopyWithImpl<$Res,
        $Val extends UserRoleContainerResponse>
    implements $UserRoleContainerResponseCopyWith<$Res> {
  _$UserRoleContainerResponseCopyWithImpl(this._value, this._then);

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
              as UserRoleContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserRoleContainerDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $UserRoleContainerDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserRoleContainerResponseCopyWith<$Res>
    implements $UserRoleContainerResponseCopyWith<$Res> {
  factory _$$_UserRoleContainerResponseCopyWith(
          _$_UserRoleContainerResponse value,
          $Res Function(_$_UserRoleContainerResponse) then) =
      __$$_UserRoleContainerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserRoleContainerData? data, String? exception});

  @override
  $UserRoleContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_UserRoleContainerResponseCopyWithImpl<$Res>
    extends _$UserRoleContainerResponseCopyWithImpl<$Res,
        _$_UserRoleContainerResponse>
    implements _$$_UserRoleContainerResponseCopyWith<$Res> {
  __$$_UserRoleContainerResponseCopyWithImpl(
      _$_UserRoleContainerResponse _value,
      $Res Function(_$_UserRoleContainerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_UserRoleContainerResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserRoleContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRoleContainerResponse implements _UserRoleContainerResponse {
  const _$_UserRoleContainerResponse({this.data, this.exception});

  factory _$_UserRoleContainerResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UserRoleContainerResponseFromJson(json);

  @override
  final UserRoleContainerData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'UserRoleContainerResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRoleContainerResponse &&
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
  _$$_UserRoleContainerResponseCopyWith<_$_UserRoleContainerResponse>
      get copyWith => __$$_UserRoleContainerResponseCopyWithImpl<
          _$_UserRoleContainerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRoleContainerResponseToJson(
      this,
    );
  }
}

abstract class _UserRoleContainerResponse implements UserRoleContainerResponse {
  const factory _UserRoleContainerResponse(
      {final UserRoleContainerData? data,
      final String? exception}) = _$_UserRoleContainerResponse;

  factory _UserRoleContainerResponse.fromJson(Map<String, dynamic> json) =
      _$_UserRoleContainerResponse.fromJson;

  @override
  UserRoleContainerData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_UserRoleContainerResponseCopyWith<_$_UserRoleContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}
