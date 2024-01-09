// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../approval_dto.dart';

part 'add_transaction_request.freezed.dart';
part 'add_transaction_request.g.dart';

@freezed
class AddTransactionDiscountRequest with _$AddTransactionDiscountRequest {
  const factory AddTransactionDiscountRequest({
    @JsonKey(name: 'TransactionDiscountId')
    required int transactionDiscountId,
    @JsonKey(name: 'DiscountId')
    required int discountId,
    @JsonKey(name: 'DiscountAmount')
    required double discountAmount,
    @JsonKey(name: 'CouponNumber')
    required String couponNumber,
    @JsonKey(name: 'ApprovalDTO')
    required ApprovalDTO approvalDTO,
  }) = _AddTransactionDiscountRequest;

  factory AddTransactionDiscountRequest.fromJson(Map<String, dynamic> json) => _$AddTransactionDiscountRequestFromJson(json);
}
