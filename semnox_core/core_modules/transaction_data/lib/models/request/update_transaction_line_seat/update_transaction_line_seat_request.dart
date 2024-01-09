import 'package:freezed_annotation/freezed_annotation.dart';

import '../approval_dto.dart';

part 'update_transaction_line_seat_request.freezed.dart';
part 'update_transaction_line_seat_request.g.dart';

@freezed
class UpdateTransactionLineSeatRequest with _$UpdateTransactionLineSeatRequest {
  const factory UpdateTransactionLineSeatRequest({
    @JsonKey(name: 'TransactionLineId')
    required int transactionLineId,
    @JsonKey(name: 'SeatName')
    required String seatName,
    @JsonKey(name: 'SeatNumber')
    required String seatNumber,
    @JsonKey(name: 'LineRemarks')
    required String lineRemarks,
    @JsonKey(name: 'ApprovalDTO')
    required ApprovalDTO approvalDto,
  }) = _UpdateTransactionLineSeatRequest;

  factory UpdateTransactionLineSeatRequest.fromJson(Map<String, dynamic> json) => _$UpdateTransactionLineSeatRequestFromJson(json);
}