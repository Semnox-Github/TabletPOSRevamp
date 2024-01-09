// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discount_coupon_summary_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiscountCouponData _$DiscountCouponDataFromJson(Map<String, dynamic> json) {
  return _DiscountCouponData.fromJson(json);
}

/// @nodoc
mixin _$DiscountCouponData {
  @JsonKey(name: 'DiscountId')
  int? get discountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CouponNumber')
  String? get couponNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'StartDate')
  String? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExpiryDate')
  String? get expiryDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscountCouponDataCopyWith<DiscountCouponData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountCouponDataCopyWith<$Res> {
  factory $DiscountCouponDataCopyWith(
          DiscountCouponData value, $Res Function(DiscountCouponData) then) =
      _$DiscountCouponDataCopyWithImpl<$Res, DiscountCouponData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'DiscountId') int? discountId,
      @JsonKey(name: 'CouponNumber') String? couponNumber,
      @JsonKey(name: 'Status') String? status,
      @JsonKey(name: 'StartDate') String? startDate,
      @JsonKey(name: 'ExpiryDate') String? expiryDate});
}

/// @nodoc
class _$DiscountCouponDataCopyWithImpl<$Res, $Val extends DiscountCouponData>
    implements $DiscountCouponDataCopyWith<$Res> {
  _$DiscountCouponDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discountId = freezed,
    Object? couponNumber = freezed,
    Object? status = freezed,
    Object? startDate = freezed,
    Object? expiryDate = freezed,
  }) {
    return _then(_value.copyWith(
      discountId: freezed == discountId
          ? _value.discountId
          : discountId // ignore: cast_nullable_to_non_nullable
              as int?,
      couponNumber: freezed == couponNumber
          ? _value.couponNumber
          : couponNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiscountCouponDataCopyWith<$Res>
    implements $DiscountCouponDataCopyWith<$Res> {
  factory _$$_DiscountCouponDataCopyWith(_$_DiscountCouponData value,
          $Res Function(_$_DiscountCouponData) then) =
      __$$_DiscountCouponDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'DiscountId') int? discountId,
      @JsonKey(name: 'CouponNumber') String? couponNumber,
      @JsonKey(name: 'Status') String? status,
      @JsonKey(name: 'StartDate') String? startDate,
      @JsonKey(name: 'ExpiryDate') String? expiryDate});
}

/// @nodoc
class __$$_DiscountCouponDataCopyWithImpl<$Res>
    extends _$DiscountCouponDataCopyWithImpl<$Res, _$_DiscountCouponData>
    implements _$$_DiscountCouponDataCopyWith<$Res> {
  __$$_DiscountCouponDataCopyWithImpl(
      _$_DiscountCouponData _value, $Res Function(_$_DiscountCouponData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discountId = freezed,
    Object? couponNumber = freezed,
    Object? status = freezed,
    Object? startDate = freezed,
    Object? expiryDate = freezed,
  }) {
    return _then(_$_DiscountCouponData(
      discountId: freezed == discountId
          ? _value.discountId
          : discountId // ignore: cast_nullable_to_non_nullable
              as int?,
      couponNumber: freezed == couponNumber
          ? _value.couponNumber
          : couponNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DiscountCouponData implements _DiscountCouponData {
  const _$_DiscountCouponData(
      {@JsonKey(name: 'DiscountId') this.discountId,
      @JsonKey(name: 'CouponNumber') this.couponNumber,
      @JsonKey(name: 'Status') this.status,
      @JsonKey(name: 'StartDate') this.startDate,
      @JsonKey(name: 'ExpiryDate') this.expiryDate});

  factory _$_DiscountCouponData.fromJson(Map<String, dynamic> json) =>
      _$$_DiscountCouponDataFromJson(json);

  @override
  @JsonKey(name: 'DiscountId')
  final int? discountId;
  @override
  @JsonKey(name: 'CouponNumber')
  final String? couponNumber;
  @override
  @JsonKey(name: 'Status')
  final String? status;
  @override
  @JsonKey(name: 'StartDate')
  final String? startDate;
  @override
  @JsonKey(name: 'ExpiryDate')
  final String? expiryDate;

  @override
  String toString() {
    return 'DiscountCouponData(discountId: $discountId, couponNumber: $couponNumber, status: $status, startDate: $startDate, expiryDate: $expiryDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiscountCouponData &&
            (identical(other.discountId, discountId) ||
                other.discountId == discountId) &&
            (identical(other.couponNumber, couponNumber) ||
                other.couponNumber == couponNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, discountId, couponNumber, status, startDate, expiryDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiscountCouponDataCopyWith<_$_DiscountCouponData> get copyWith =>
      __$$_DiscountCouponDataCopyWithImpl<_$_DiscountCouponData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiscountCouponDataToJson(
      this,
    );
  }
}

abstract class _DiscountCouponData implements DiscountCouponData {
  const factory _DiscountCouponData(
          {@JsonKey(name: 'DiscountId') final int? discountId,
          @JsonKey(name: 'CouponNumber') final String? couponNumber,
          @JsonKey(name: 'Status') final String? status,
          @JsonKey(name: 'StartDate') final String? startDate,
          @JsonKey(name: 'ExpiryDate') final String? expiryDate}) =
      _$_DiscountCouponData;

  factory _DiscountCouponData.fromJson(Map<String, dynamic> json) =
      _$_DiscountCouponData.fromJson;

  @override
  @JsonKey(name: 'DiscountId')
  int? get discountId;
  @override
  @JsonKey(name: 'CouponNumber')
  String? get couponNumber;
  @override
  @JsonKey(name: 'Status')
  String? get status;
  @override
  @JsonKey(name: 'StartDate')
  String? get startDate;
  @override
  @JsonKey(name: 'ExpiryDate')
  String? get expiryDate;
  @override
  @JsonKey(ignore: true)
  _$$_DiscountCouponDataCopyWith<_$_DiscountCouponData> get copyWith =>
      throw _privateConstructorUsedError;
}
