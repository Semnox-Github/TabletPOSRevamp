// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/request/approval_dto.dart';

part 'transaction_remark_line_request.freezed.dart';

part 'transaction_remark_line_request.g.dart';

@freezed
class TransactionRemarkLineRequest with _$TransactionRemarkLineRequest {
  const factory TransactionRemarkLineRequest({
    @JsonKey(name: 'TransactionLineId') required int transactionLineId,
    @JsonKey(name: 'LineRemarks') String? lineRemarks,
    @JsonKey(name: 'ApprovalDTO') required ApprovalDTO approvalDTO,
  }) = _TransactionRemarkLineRequest;

  factory TransactionRemarkLineRequest.fromJson(Map<String, dynamic> json) =>
      _$TransactionRemarkLineRequestFromJson(json);
}
