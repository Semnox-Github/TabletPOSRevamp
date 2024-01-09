// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'membership_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MemberShipResponse _$MemberShipResponseFromJson(Map<String, dynamic> json) {
  return _MemberShipResponse.fromJson(json);
}

/// @nodoc
mixin _$MemberShipResponse {
  MemberShipData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberShipResponseCopyWith<MemberShipResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberShipResponseCopyWith<$Res> {
  factory $MemberShipResponseCopyWith(
          MemberShipResponse value, $Res Function(MemberShipResponse) then) =
      _$MemberShipResponseCopyWithImpl<$Res, MemberShipResponse>;
  @useResult
  $Res call({MemberShipData? data, String? exception});

  $MemberShipDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$MemberShipResponseCopyWithImpl<$Res, $Val extends MemberShipResponse>
    implements $MemberShipResponseCopyWith<$Res> {
  _$MemberShipResponseCopyWithImpl(this._value, this._then);

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
              as MemberShipData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MemberShipDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $MemberShipDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MemberShipResponseCopyWith<$Res>
    implements $MemberShipResponseCopyWith<$Res> {
  factory _$$_MemberShipResponseCopyWith(_$_MemberShipResponse value,
          $Res Function(_$_MemberShipResponse) then) =
      __$$_MemberShipResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MemberShipData? data, String? exception});

  @override
  $MemberShipDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_MemberShipResponseCopyWithImpl<$Res>
    extends _$MemberShipResponseCopyWithImpl<$Res, _$_MemberShipResponse>
    implements _$$_MemberShipResponseCopyWith<$Res> {
  __$$_MemberShipResponseCopyWithImpl(
      _$_MemberShipResponse _value, $Res Function(_$_MemberShipResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_MemberShipResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MemberShipData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MemberShipResponse implements _MemberShipResponse {
  const _$_MemberShipResponse({this.data, this.exception});

  factory _$_MemberShipResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MemberShipResponseFromJson(json);

  @override
  final MemberShipData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'MemberShipResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MemberShipResponse &&
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
  _$$_MemberShipResponseCopyWith<_$_MemberShipResponse> get copyWith =>
      __$$_MemberShipResponseCopyWithImpl<_$_MemberShipResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemberShipResponseToJson(
      this,
    );
  }
}

abstract class _MemberShipResponse implements MemberShipResponse {
  const factory _MemberShipResponse(
      {final MemberShipData? data,
      final String? exception}) = _$_MemberShipResponse;

  factory _MemberShipResponse.fromJson(Map<String, dynamic> json) =
      _$_MemberShipResponse.fromJson;

  @override
  MemberShipData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_MemberShipResponseCopyWith<_$_MemberShipResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
