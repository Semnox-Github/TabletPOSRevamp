import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:payment_data/models/coupon_details/coupon_details_data.dart';

part 'coupon_details_response.freezed.dart';
part 'coupon_details_response.g.dart';

@freezed
class CouponDetailsResponse with _$CouponDetailsResponse {
  const factory CouponDetailsResponse({
    List<CouponDetailsData>? data, String? exception
  }) = _CouponDetailsResponse;

  factory CouponDetailsResponse.fromJson(Map<String, dynamic> json) => _$CouponDetailsResponseFromJson(json);
}