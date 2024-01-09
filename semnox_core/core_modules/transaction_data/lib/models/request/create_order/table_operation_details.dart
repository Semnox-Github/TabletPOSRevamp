// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/request/approval_dto.dart';

part 'table_operation_details.freezed.dart';
part 'table_operation_details.g.dart';

@freezed
class TableOperationDetails with _$TableOperationDetails {
  const factory TableOperationDetails({
    @JsonKey(name: 'Reason')
    required String reason,
    @JsonKey(name: 'AdditionalComments')
    required String additionalComments,
    @JsonKey(name: 'ApprovalDTO')
    required ApprovalDTO approvalDTO,
  }) = _TableOperationDetails;

  factory TableOperationDetails.fromJson(Map<String, dynamic> json) => _$TableOperationDetailsFromJson(json);
}
