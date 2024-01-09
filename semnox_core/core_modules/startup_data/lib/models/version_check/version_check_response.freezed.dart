// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'version_check_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VersionCheckResponse _$VersionCheckResponseFromJson(Map<String, dynamic> json) {
  return _VersionCheckResponse.fromJson(json);
}

/// @nodoc
mixin _$VersionCheckResponse {
  String? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VersionCheckResponseCopyWith<VersionCheckResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VersionCheckResponseCopyWith<$Res> {
  factory $VersionCheckResponseCopyWith(VersionCheckResponse value,
          $Res Function(VersionCheckResponse) then) =
      _$VersionCheckResponseCopyWithImpl<$Res, VersionCheckResponse>;
  @useResult
  $Res call({String? data, String? exception});
}

/// @nodoc
class _$VersionCheckResponseCopyWithImpl<$Res,
        $Val extends VersionCheckResponse>
    implements $VersionCheckResponseCopyWith<$Res> {
  _$VersionCheckResponseCopyWithImpl(this._value, this._then);

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
              as String?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VersionCheckResponseCopyWith<$Res>
    implements $VersionCheckResponseCopyWith<$Res> {
  factory _$$_VersionCheckResponseCopyWith(_$_VersionCheckResponse value,
          $Res Function(_$_VersionCheckResponse) then) =
      __$$_VersionCheckResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? data, String? exception});
}

/// @nodoc
class __$$_VersionCheckResponseCopyWithImpl<$Res>
    extends _$VersionCheckResponseCopyWithImpl<$Res, _$_VersionCheckResponse>
    implements _$$_VersionCheckResponseCopyWith<$Res> {
  __$$_VersionCheckResponseCopyWithImpl(_$_VersionCheckResponse _value,
      $Res Function(_$_VersionCheckResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_VersionCheckResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VersionCheckResponse implements _VersionCheckResponse {
  const _$_VersionCheckResponse({this.data, this.exception});

  factory _$_VersionCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$$_VersionCheckResponseFromJson(json);

  @override
  final String? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'VersionCheckResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VersionCheckResponse &&
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
  _$$_VersionCheckResponseCopyWith<_$_VersionCheckResponse> get copyWith =>
      __$$_VersionCheckResponseCopyWithImpl<_$_VersionCheckResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VersionCheckResponseToJson(
      this,
    );
  }
}

abstract class _VersionCheckResponse implements VersionCheckResponse {
  const factory _VersionCheckResponse(
      {final String? data, final String? exception}) = _$_VersionCheckResponse;

  factory _VersionCheckResponse.fromJson(Map<String, dynamic> json) =
      _$_VersionCheckResponse.fromJson;

  @override
  String? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_VersionCheckResponseCopyWith<_$_VersionCheckResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
