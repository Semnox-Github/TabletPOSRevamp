// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../approval_dto.dart';

part 'remove_line_request.freezed.dart';
part 'remove_line_request.g.dart';

@freezed
class RemoveLineRequest with _$RemoveLineRequest {
  const factory RemoveLineRequest({
    @JsonKey(name: 'TransactionLineId')
    required int transactionLineId,
    @JsonKey(name: 'ReasonId')
    required int reasonId,
    @JsonKey(name: 'Reason')
    required String reason,
    @JsonKey(name: 'LineRemarks')
    required String lineRemarks,
    @JsonKey(name: 'ApprovalDTO')
    required ApprovalDTO approvalDTO,
  }) = _RemoveLineRequest;

  factory RemoveLineRequest.fromJson(Map<String, dynamic> json) => _$RemoveLineRequestFromJson(json);
}