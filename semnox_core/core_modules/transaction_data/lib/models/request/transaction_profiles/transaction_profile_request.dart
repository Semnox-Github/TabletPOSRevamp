// ignore_for_file: non_constant_identifier_names, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/request/approval_dto.dart';

part 'transaction_profile_request.freezed.dart';
part 'transaction_profile_request.g.dart';

@freezed
class TransactionProfileRequest with _$TransactionProfileRequest {
  const factory TransactionProfileRequest({
    @JsonKey(name: 'TransactionLineIdList')
    required List<int> transactionLineIdList,
    @JsonKey(name: 'remarks')
    required String remarks,
    @JsonKey(name: 'ProfileId')
    required int profileId,
    @JsonKey(name: 'Name')
    required String name,
    @JsonKey(name: 'Identification')
    required String identification,
    @JsonKey(name: 'ApprovalDTO')
    required ApprovalDTO approvalDTO,
  }) = _TransactionProfileRequest;

  factory TransactionProfileRequest.fromJson(Map<String, dynamic> json) => _$TransactionProfileRequestFromJson(json);
}