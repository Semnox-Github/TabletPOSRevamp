import 'package:freezed_annotation/freezed_annotation.dart';

import '../approval_dto.dart';

part 'close_transaction_request.freezed.dart';
part 'close_transaction_request.g.dart';

@freezed
class CloseTransactionRequest with _$CloseTransactionRequest {
  const factory CloseTransactionRequest({
    @JsonKey(name: 'TransactionId')
    required int transactionId,
    @JsonKey(name: 'Reason')
    required String reason,
    @JsonKey(name: 'Remarks')
    required String remarks,
    @JsonKey(name: 'ApprovalDTO')
    required ApprovalDTO approvalDTO,
  }) = _CloseTransactionRequest;

  factory CloseTransactionRequest.fromJson(Map<String, dynamic> json) => _$CloseTransactionRequestFromJson(json);
}
