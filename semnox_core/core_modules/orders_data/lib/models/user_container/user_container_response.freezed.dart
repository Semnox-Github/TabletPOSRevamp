// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_container_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserContainerResponse _$UserContainerResponseFromJson(
    Map<String, dynamic> json) {
  return _UserContainerResponse.fromJson(json);
}

/// @nodoc
mixin _$UserContainerResponse {
  UserContainerData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserContainerResponseCopyWith<UserContainerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserContainerResponseCopyWith<$Res> {
  factory $UserContainerResponseCopyWith(UserContainerResponse value,
          $Res Function(UserContainerResponse) then) =
      _$UserContainerResponseCopyWithImpl<$Res, UserContainerResponse>;
  @useResult
  $Res call({UserContainerData? data, String? exception});

  $UserContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$UserContainerResponseCopyWithImpl<$Res,
        $Val extends UserContainerResponse>
    implements $UserContainerResponseCopyWith<$Res> {
  _$UserContainerResponseCopyWithImpl(this._value, this._then);

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
              as UserContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserContainerDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $UserContainerDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserContainerResponseCopyWith<$Res>
    implements $UserContainerResponseCopyWith<$Res> {
  factory _$$_UserContainerResponseCopyWith(_$_UserContainerResponse value,
          $Res Function(_$_UserContainerResponse) then) =
      __$$_UserContainerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserContainerData? data, String? exception});

  @override
  $UserContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_UserContainerResponseCopyWithImpl<$Res>
    extends _$UserContainerResponseCopyWithImpl<$Res, _$_UserContainerResponse>
    implements _$$_UserContainerResponseCopyWith<$Res> {
  __$$_UserContainerResponseCopyWithImpl(_$_UserContainerResponse _value,
      $Res Function(_$_UserContainerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_UserContainerResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserContainerResponse implements _UserContainerResponse {
  const _$_UserContainerResponse({this.data, this.exception});

  factory _$_UserContainerResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UserContainerResponseFromJson(json);

  @override
  final UserContainerData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'UserContainerResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserContainerResponse &&
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
  _$$_UserContainerResponseCopyWith<_$_UserContainerResponse> get copyWith =>
      __$$_UserContainerResponseCopyWithImpl<_$_UserContainerResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserContainerResponseToJson(
      this,
    );
  }
}

abstract class _UserContainerResponse implements UserContainerResponse {
  const factory _UserContainerResponse(
      {final UserContainerData? data,
      final String? exception}) = _$_UserContainerResponse;

  factory _UserContainerResponse.fromJson(Map<String, dynamic> json) =
      _$_UserContainerResponse.fromJson;

  @override
  UserContainerData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_UserContainerResponseCopyWith<_$_UserContainerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
