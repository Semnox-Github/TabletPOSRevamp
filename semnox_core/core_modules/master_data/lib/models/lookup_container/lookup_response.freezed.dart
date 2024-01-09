// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lookup_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LookupResponse _$LookupResponseFromJson(Map<String, dynamic> json) {
  return _LookupResponse.fromJson(json);
}

/// @nodoc
mixin _$LookupResponse {
  LookupData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LookupResponseCopyWith<LookupResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LookupResponseCopyWith<$Res> {
  factory $LookupResponseCopyWith(
          LookupResponse value, $Res Function(LookupResponse) then) =
      _$LookupResponseCopyWithImpl<$Res, LookupResponse>;
  @useResult
  $Res call({LookupData? data, String? exception});

  $LookupDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$LookupResponseCopyWithImpl<$Res, $Val extends LookupResponse>
    implements $LookupResponseCopyWith<$Res> {
  _$LookupResponseCopyWithImpl(this._value, this._then);

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
              as LookupData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LookupDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $LookupDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LookupResponseCopyWith<$Res>
    implements $LookupResponseCopyWith<$Res> {
  factory _$$_LookupResponseCopyWith(
          _$_LookupResponse value, $Res Function(_$_LookupResponse) then) =
      __$$_LookupResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LookupData? data, String? exception});

  @override
  $LookupDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_LookupResponseCopyWithImpl<$Res>
    extends _$LookupResponseCopyWithImpl<$Res, _$_LookupResponse>
    implements _$$_LookupResponseCopyWith<$Res> {
  __$$_LookupResponseCopyWithImpl(
      _$_LookupResponse _value, $Res Function(_$_LookupResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_LookupResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as LookupData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LookupResponse implements _LookupResponse {
  const _$_LookupResponse({this.data, this.exception});

  factory _$_LookupResponse.fromJson(Map<String, dynamic> json) =>
      _$$_LookupResponseFromJson(json);

  @override
  final LookupData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'LookupResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LookupResponse &&
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
  _$$_LookupResponseCopyWith<_$_LookupResponse> get copyWith =>
      __$$_LookupResponseCopyWithImpl<_$_LookupResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LookupResponseToJson(
      this,
    );
  }
}

abstract class _LookupResponse implements LookupResponse {
  const factory _LookupResponse(
      {final LookupData? data, final String? exception}) = _$_LookupResponse;

  factory _LookupResponse.fromJson(Map<String, dynamic> json) =
      _$_LookupResponse.fromJson;

  @override
  LookupData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_LookupResponseCopyWith<_$_LookupResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
