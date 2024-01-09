import 'package:freezed_annotation/freezed_annotation.dart';
import '../approval_dto.dart';

part 'transaction_line_reverse_dto.freezed.dart';
part 'transaction_line_reverse_dto.g.dart';

@freezed
class TransactionLineReverseDto with _$TransactionLineReverseDto {
  const factory TransactionLineReverseDto({
    @JsonKey(name: 'TransactionLineId')
    required int transactionLineId,
    @JsonKey(name: 'ReasonId')
    required int reasonId,
    @JsonKey(name: 'Remarks')
    required String remarks,
    @JsonKey(name: 'ReverseObligations')
    required bool reverseObligations,
    @JsonKey(name: 'ForceReverseUsedObligations')
    required bool forceReverseUsedObligations,
    @JsonKey(name: 'ApprovalDTO')
    required ApprovalDTO approvalDTO,
  }) = _TransactionLineReverseDto;

  factory TransactionLineReverseDto.fromJson(Map<String, dynamic> json) => _$TransactionLineReverseDtoFromJson(json);
}