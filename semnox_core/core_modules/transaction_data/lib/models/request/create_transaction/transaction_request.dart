// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/request/approval_dto.dart';

part 'transaction_request.freezed.dart';
part 'transaction_request.g.dart';

@freezed
class TransactionRequest with _$TransactionRequest {
  const factory TransactionRequest({
    @JsonKey(name: 'GuestCount')
    int? guestCount,
    @JsonKey(name: 'TransactionProfileId')
    required int transactionProfileId,
    @JsonKey(name: 'PrimaryAccountNumber')
    String? primaryAccountNumber,
    @JsonKey(name: 'GuestName')
    String? guestName,
    @JsonKey(name: 'TransactionIdentifier')
    String? transactionIdentifier,
    @JsonKey(name: 'GuestContact')
    String? guestContact,
    @JsonKey(name: 'TentNumber')
    String? tentNumber,
    @JsonKey(name: 'Remarks')
    String? remarks,
    @JsonKey(name: 'TransactionDateTime')
    String? transactionDateTime,
    @JsonKey(name: 'ApprovalDTO')
    required ApprovalDTO approvalDTO,
  }) = _TransactionRequest;

  factory TransactionRequest.fromJson(Map<String, dynamic> json) => _$TransactionRequestFromJson(json);
}