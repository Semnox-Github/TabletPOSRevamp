// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../approval_dto.dart';

part 'add_transaction_line_discount.freezed.dart';
part 'add_transaction_line_discount.g.dart';

@freezed
class AddTransactionLineDiscountRequest with _$AddTransactionLineDiscountRequest {
  const factory AddTransactionLineDiscountRequest({
    @JsonKey(name: 'TransactionLineId')
    required int transactionLineId,
    @JsonKey(name: 'DiscountId')
    required int discountId,
    @JsonKey(name:"Remarks")
    required String remarks,
    @JsonKey(name: 'DiscountAmount')
    required double discountAmount,
    @JsonKey(name: 'CouponNumber')
    required String couponNumber,
    @JsonKey(name: 'ApprovalDTO')
    required ApprovalDTO approvalDTO,
  }) = _AddTransactionLineDiscountRequest;

  factory AddTransactionLineDiscountRequest.fromJson(Map<String, dynamic> json) => _$AddTransactionLineDiscountRequestFromJson(json);
}
