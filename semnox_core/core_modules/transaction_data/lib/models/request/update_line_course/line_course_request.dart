import 'package:freezed_annotation/freezed_annotation.dart';

import '../approval_dto.dart';

part 'line_course_request.freezed.dart';
part 'line_course_request.g.dart';

@freezed
class UpdateLineCourseRequest with _$UpdateLineCourseRequest {
  const factory UpdateLineCourseRequest({
    @JsonKey(name: 'TransactionLineId')
    required int transactionLineId,
    @JsonKey(name: 'CourseName')
    required String courseName,
    @JsonKey(name: 'LineRemarks')
    required String lineRemarks,
    @JsonKey(name: 'ApprovalDTO')
    required ApprovalDTO approvalDTO,
  }) = _UpdateLineCourseRequest;

  factory UpdateLineCourseRequest.fromJson(Map<String, dynamic> json) => _$UpdateLineCourseRequestFromJson(json);
}