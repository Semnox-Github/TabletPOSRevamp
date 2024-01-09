import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/request/add_line/transaction_account_dto.dart';
import '../../create_transaction/transaction_account_dto.dart';
import '../approval_dto.dart';

part 'order_transaction_lines_request.freezed.dart';
part 'order_transaction_lines_request.g.dart';

@freezed
class OrderTransactionLinesRequest with _$OrderTransactionLinesRequest {
  const factory OrderTransactionLinesRequest({
    @JsonKey(name: 'TransactionLineId')
    required int transactionLineId,
    @JsonKey(name: 'TransactionAccountDTOList')
    required List<TransactionLineAccountDto> transactionAccountDtoList,
    @JsonKey(name: 'ApprovalDTO')
    required ApprovalDTO approvalDto,
  }) = _OrderTransactionLinesRequest;

  factory OrderTransactionLinesRequest.fromJson(Map<String, dynamic> json) => _$OrderTransactionLinesRequestFromJson(json);
}