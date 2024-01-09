// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:payment_data/models/coupon_details/payment_coupons_used_dto.dart';

part 'coupon_details_data.freezed.dart';
part 'coupon_details_data.g.dart';

@freezed
class CouponDetailsData with _$CouponDetailsData {
  const factory CouponDetailsData({
    @JsonKey(name: 'CouponSetId')
    required int couponSetId,
    @JsonKey(name: 'FromNumber')
    required String fromNumber,
    @JsonKey(name: 'ToNumber')
    required String toNumber,
    @JsonKey(name: 'Count')
    required int count,
    @JsonKey(name: 'UsedCount')
    required int usedCount,
    @JsonKey(name: 'PaymentModeId')
    required int paymentModeId,
    @JsonKey(name: 'StartDate')
    required String startDate,
    @JsonKey(name: 'ExpiryDate')
    required String expiryDate,
    @JsonKey(name: 'CouponValue')
    required double couponValue,
    @JsonKey(name: 'IsActive')
    required bool isActive,
    @JsonKey(name: 'LastUpdatedDate')
    required String lastUpdatedDate,
    @JsonKey(name: 'CreatedBy')
    required String createdBy,
    @JsonKey(name: 'CreationDate')
    required String creationDate,
    @JsonKey(name: 'LastUpdatedBy')
    required String lastUpdatedBy,
    @JsonKey(name: 'SiteId')
    required int siteId,
    @JsonKey(name: 'MasterEntityId')
    required int masterEntityId,
    @JsonKey(name: 'SynchStatus')
    required bool synchStatus,
    @JsonKey(name: 'Guid')
    required String guid,
    @JsonKey(name: 'PaymentCouponsUsedDTOList')
    required List<PaymentCouponsUsedDTO> paymentCouponsUsedDTOList,
    @JsonKey(name: 'IsChangedRecursive')
    required bool isChangedRecursive,
    @JsonKey(name: 'IsChanged')
    required bool isChanged,
  }) = _CouponDetailsData;

  factory CouponDetailsData.fromJson(Map<String, dynamic> json) => _$CouponDetailsDataFromJson(json);
}