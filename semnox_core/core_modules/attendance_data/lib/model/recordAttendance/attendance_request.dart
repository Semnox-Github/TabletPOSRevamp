// To parse this JSON data, do
//
//     final attendanceRequest = attendanceRequestFromJson(jsonString);

import 'dart:convert';

AttendanceRequest attendanceRequestFromJson(String str) =>
    AttendanceRequest.fromJson(json.decode(str));

String attendanceRequestToJson(AttendanceRequest data) =>
    json.encode(data.toJson());

class AttendanceRequest {
  AttendanceRequest({
    required this.type,
    required this.attendanceRoleId,
    required this.attendanceRoleApproverId,
    this.isAutoClockInOut,
    required this.status,
    this.machineId,
    this.tipValue,
    this.approvedBy,
    this.approvalDate,
    this.attendanceLogStatusId,
    this.attendanceLogRequestStatusId,
  });

  String type;
  int attendanceRoleId;
  int attendanceRoleApproverId;
  bool? isAutoClockInOut;
  String status;
  int? machineId;
  int? tipValue;
  dynamic approvedBy;
  dynamic approvalDate;
  int? attendanceLogStatusId;
  int? attendanceLogRequestStatusId;

  factory AttendanceRequest.fromJson(Map<String, dynamic> json) =>
      AttendanceRequest(
        type: json["Type"],
        attendanceRoleId: json["AttendanceRoleId"],
        attendanceRoleApproverId: json["AttendanceRoleApproverId"],
        isAutoClockInOut: json["IsAutoClockInOut"] ?? false,
        status: json["Status"],
        machineId: json["MachineId"] ?? -1,
        tipValue: json["TipValue"] ?? 0,
        approvedBy: json["ApprovedBy"],
        approvalDate: json["ApprovalDate"],
        attendanceLogStatusId: json["AttendanceLogStatusId"] ?? -1,
        attendanceLogRequestStatusId:
            json["AttendanceLogRequestStatusId"] ?? -1,
      );

  Map<String, dynamic> toJson() => {
        "Type": type,
        "AttendanceRoleId": attendanceRoleId,
        "AttendanceRoleApproverId": attendanceRoleApproverId,
        "IsAutoClockInOut": isAutoClockInOut,
        "Status": status,
        "MachineId": machineId,
        "TipValue": tipValue,
        "ApprovedBy": approvedBy,
        "ApprovalDate": approvalDate,
        "AttendanceLogStatusId": attendanceLogStatusId,
        "AttendanceLogRequestStatusId": attendanceLogRequestStatusId,
      };
}
