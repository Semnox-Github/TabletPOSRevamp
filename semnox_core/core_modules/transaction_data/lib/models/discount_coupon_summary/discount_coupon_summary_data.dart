// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/transaction_functions/task_type_container_dto.dart';

part 'discount_coupon_summary_data.freezed.dart';
part 'discount_coupon_summary_data.g.dart';

@freezed
class DiscountCouponData with _$DiscountCouponData {
  const factory DiscountCouponData({
    @JsonKey(name: 'DiscountId')
    int? discountId,
    @JsonKey(name: 'CouponNumber')
    String? couponNumber,
    @JsonKey(name: 'Status')
    String? status,
    @JsonKey(name: 'StartDate')
    String? startDate,
    @JsonKey(name: 'ExpiryDate')
    String? expiryDate,
  }) = _DiscountCouponData;

  factory DiscountCouponData.fromJson(Map<String, dynamic> json) => _$DiscountCouponDataFromJson(json);
}