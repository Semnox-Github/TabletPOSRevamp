// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_coupons_used_dto.freezed.dart';
part 'payment_coupons_used_dto.g.dart';

@freezed
class PaymentCouponsUsedDTO with _$PaymentCouponsUsedDTO {
  const factory PaymentCouponsUsedDTO({
    @JsonKey(name: 'Id')
    required int id,
    @JsonKey(name: 'CouponSetId')
    required int couponSetId,
    @JsonKey(name: 'DiscountId')
    required int discountId,
    @JsonKey(name: 'CouponNumber')
    required String couponNumber,
    @JsonKey(name: 'TransactionId')
    required int transactionId,
    @JsonKey(name: 'LineId')
    required int lineId,
    @JsonKey(name: 'PaymentId')
    required int paymentId,
    @JsonKey(name: 'IsActive')
    required bool isActive,
    @JsonKey(name: 'SiteId')
    required int siteId,
    @JsonKey(name: 'MasterEntityId')
    required int masterEntityId,
    @JsonKey(name: 'SynchStatus')
    required bool synchStatus,
    @JsonKey(name: 'Guid')
    required String guid,
    @JsonKey(name: 'CreatedBy')
    required String createdBy,
    @JsonKey(name: 'CreationDate')
    required String creationDate,
    @JsonKey(name: 'LastUpdatedBy')
    required String lastUpdatedBy,
    @JsonKey(name: 'LastUpdatedDate')
    required String lastUpdatedDate,
    @JsonKey(name: 'IsChanged')
    required bool isChanged,
  }) = _PaymentCouponsUsedDTO;

  factory PaymentCouponsUsedDTO.fromJson(Map<String, dynamic> json) => _$PaymentCouponsUsedDTOFromJson(json);
}