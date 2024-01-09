// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_coupon_summary_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiscountCouponData _$$_DiscountCouponDataFromJson(
        Map<String, dynamic> json) =>
    _$_DiscountCouponData(
      discountId: json['DiscountId'] as int?,
      couponNumber: json['CouponNumber'] as String?,
      status: json['Status'] as String?,
      startDate: json['StartDate'] as String?,
      expiryDate: json['ExpiryDate'] as String?,
    );

Map<String, dynamic> _$$_DiscountCouponDataToJson(
        _$_DiscountCouponData instance) =>
    <String, dynamic>{
      'DiscountId': instance.discountId,
      'CouponNumber': instance.couponNumber,
      'Status': instance.status,
      'StartDate': instance.startDate,
      'ExpiryDate': instance.expiryDate,
    };
