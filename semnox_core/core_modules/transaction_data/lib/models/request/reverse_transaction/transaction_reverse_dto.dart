import 'package:freezed_annotation/freezed_annotation.dart';
import '../approval_dto.dart';

part 'transaction_reverse_dto.freezed.dart';
part 'transaction_reverse_dto.g.dart';

@freezed
class TransactionReverseDto with _$TransactionReverseDto {
  const factory TransactionReverseDto({
    @JsonKey(name: 'TransactionId') required int transactionId,
    @JsonKey(name: 'ReasonId') required int reasonId,
    @JsonKey(name: 'Remarks') required String remarks,
    @JsonKey(name: 'ReverseObligations') required bool reverseObligations,
    @JsonKey(name: 'ForceReverseUsedObligations') required bool forceReverseUsedObligations,
    @JsonKey(name: 'TransactionLineIdList') required List<int> transactionLineIdList,
    @JsonKey(name: 'ApprovalDTO') required ApprovalDTO approvalDTO,
  }) = _TransactionReverseDto;

  factory TransactionReverseDto.fromJson(Map<String, dynamic> json) => _$TransactionReverseDtoFromJson(json);
}
