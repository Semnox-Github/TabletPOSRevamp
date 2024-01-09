import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/transaction_functions/transaction_function_data.dart';

import 'discount_coupon_summary_data.dart';

part 'discount_coupon_summary_response.freezed.dart';
part 'discount_coupon_summary_response.g.dart';

@freezed
class DiscountCouponSummaryResponse with _$DiscountCouponSummaryResponse {
  const factory DiscountCouponSummaryResponse({
    DiscountCouponData? data,
    String? exception
  }) = _DiscountCouponSummaryResponse;

  factory DiscountCouponSummaryResponse.fromJson(Map<String, dynamic> json) => _$DiscountCouponSummaryResponseFromJson(json);
}