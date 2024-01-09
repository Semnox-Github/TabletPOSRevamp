import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/request/approval_dto.dart';

part 'set_transaction_profile_id_request.freezed.dart';
part 'set_transaction_profile_id_request.g.dart';

@freezed
class SetTransactionProfileIdRequest with _$SetTransactionProfileIdRequest {
  const factory SetTransactionProfileIdRequest({
    @JsonKey(name: 'TransactionProfileId')
    required int transactionProfileId,
    @JsonKey(name: 'ApprovalDTO')
    required ApprovalDTO approvalDTO,
  }) = _SetTransactionProfileIdRequest;

  factory SetTransactionProfileIdRequest.fromJson(Map<String, dynamic> json) => _$SetTransactionProfileIdRequestFromJson(json);
}
