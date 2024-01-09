// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_coupon_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiscountCouponSummaryResponse _$$_DiscountCouponSummaryResponseFromJson(
        Map<String, dynamic> json) =>
    _$_DiscountCouponSummaryResponse(
      data: json['data'] == null
          ? null
          : DiscountCouponData.fromJson(json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_DiscountCouponSummaryResponseToJson(
        _$_DiscountCouponSummaryResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
