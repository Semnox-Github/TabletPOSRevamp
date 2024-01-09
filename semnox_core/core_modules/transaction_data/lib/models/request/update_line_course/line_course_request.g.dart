// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_course_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateLineCourseRequest _$$_UpdateLineCourseRequestFromJson(
        Map<String, dynamic> json) =>
    _$_UpdateLineCourseRequest(
      transactionLineId: json['TransactionLineId'] as int,
      courseName: json['CourseName'] as String,
      lineRemarks: json['LineRemarks'] as String,
      approvalDTO:
          ApprovalDTO.fromJson(json['ApprovalDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UpdateLineCourseRequestToJson(
        _$_UpdateLineCourseRequest instance) =>
    <String, dynamic>{
      'TransactionLineId': instance.transactionLineId,
      'CourseName': instance.courseName,
      'LineRemarks': instance.lineRemarks,
      'ApprovalDTO': instance.approvalDTO,
    };
