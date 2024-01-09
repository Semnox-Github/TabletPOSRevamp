// To parse this JSON data, do
//
//     final recordAttendanceModel = recordAttendanceModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'record_attendance_model.freezed.dart';
part 'record_attendance_model.g.dart';

RecordAttendanceModel recordAttendanceModelFromJson(String str) =>
    RecordAttendanceModel.fromJson(json.decode(str));

String recordAttendanceModelToJson(RecordAttendanceModel data) =>
    json.encode(data.toJson());

@freezed
class RecordAttendanceModel with _$RecordAttendanceModel {
  const factory RecordAttendanceModel({
    String? type,
    int? attendanceRoleId,
    int? attendanceRoleApproverId,
    String? status,
    int? machineId,
    int? tipValue,
    String? approvedBy,
    String? approvalDate,
    int? attendanceLogStatusId,
    int? attendanceLogRequestStatusId,
  }) = _RecordAttendanceModel;

  factory RecordAttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$RecordAttendanceModelFromJson(json);
}
