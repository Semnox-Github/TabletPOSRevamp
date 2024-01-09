// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/request/approval_dto.dart';

part 'set_staff_request.freezed.dart';
part 'set_staff_request.g.dart';

@freezed
class SetStaffRequest with _$SetStaffRequest {
  const factory SetStaffRequest({
    @JsonKey(name: 'UserId')
    required int userId,
    @JsonKey(name: 'ApprovalDTO')
    required ApprovalDTO approvalDTO,
  }) = _SetStaffRequest;

  factory SetStaffRequest.fromJson(Map<String, dynamic> json) => _$SetStaffRequestFromJson(json);
}
