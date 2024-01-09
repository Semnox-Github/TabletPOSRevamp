// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discount_coupon_summary_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiscountCouponSummaryResponse _$DiscountCouponSummaryResponseFromJson(
    Map<String, dynamic> json) {
  return _DiscountCouponSummaryResponse.fromJson(json);
}

/// @nodoc
mixin _$DiscountCouponSummaryResponse {
  DiscountCouponData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscountCouponSummaryResponseCopyWith<DiscountCouponSummaryResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountCouponSummaryResponseCopyWith<$Res> {
  factory $DiscountCouponSummaryResponseCopyWith(
          DiscountCouponSummaryResponse value,
          $Res Function(DiscountCouponSummaryResponse) then) =
      _$DiscountCouponSummaryResponseCopyWithImpl<$Res,
          DiscountCouponSummaryResponse>;
  @useResult
  $Res call({DiscountCouponData? data, String? exception});

  $DiscountCouponDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$DiscountCouponSummaryResponseCopyWithImpl<$Res,
        $Val extends DiscountCouponSummaryResponse>
    implements $DiscountCouponSummaryResponseCopyWith<$Res> {
  _$DiscountCouponSummaryResponseCopyWithImpl(this._value, this._then);

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
              as DiscountCouponData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DiscountCouponDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DiscountCouponDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DiscountCouponSummaryResponseCopyWith<$Res>
    implements $DiscountCouponSummaryResponseCopyWith<$Res> {
  factory _$$_DiscountCouponSummaryResponseCopyWith(
          _$_DiscountCouponSummaryResponse value,
          $Res Function(_$_DiscountCouponSummaryResponse) then) =
      __$$_DiscountCouponSummaryResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DiscountCouponData? data, String? exception});

  @override
  $DiscountCouponDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_DiscountCouponSummaryResponseCopyWithImpl<$Res>
    extends _$DiscountCouponSummaryResponseCopyWithImpl<$Res,
        _$_DiscountCouponSummaryResponse>
    implements _$$_DiscountCouponSummaryResponseCopyWith<$Res> {
  __$$_DiscountCouponSummaryResponseCopyWithImpl(
      _$_DiscountCouponSummaryResponse _value,
      $Res Function(_$_DiscountCouponSummaryResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_DiscountCouponSummaryResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DiscountCouponData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DiscountCouponSummaryResponse
    implements _DiscountCouponSummaryResponse {
  const _$_DiscountCouponSummaryResponse({this.data, this.exception});

  factory _$_DiscountCouponSummaryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_DiscountCouponSummaryResponseFromJson(json);

  @override
  final DiscountCouponData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'DiscountCouponSummaryResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiscountCouponSummaryResponse &&
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
  _$$_DiscountCouponSummaryResponseCopyWith<_$_DiscountCouponSummaryResponse>
      get copyWith => __$$_DiscountCouponSummaryResponseCopyWithImpl<
          _$_DiscountCouponSummaryResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiscountCouponSummaryResponseToJson(
      this,
    );
  }
}

abstract class _DiscountCouponSummaryResponse
    implements DiscountCouponSummaryResponse {
  const factory _DiscountCouponSummaryResponse(
      {final DiscountCouponData? data,
      final String? exception}) = _$_DiscountCouponSummaryResponse;

  factory _DiscountCouponSummaryResponse.fromJson(Map<String, dynamic> json) =
      _$_DiscountCouponSummaryResponse.fromJson;

  @override
  DiscountCouponData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_DiscountCouponSummaryResponseCopyWith<_$_DiscountCouponSummaryResponse>
      get copyWith => throw _privateConstructorUsedError;
}
