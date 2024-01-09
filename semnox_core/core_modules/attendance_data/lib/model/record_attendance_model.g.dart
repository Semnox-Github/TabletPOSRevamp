// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecordAttendanceModel _$$_RecordAttendanceModelFromJson(
        Map<String, dynamic> json) =>
    _$_RecordAttendanceModel(
      type: json['type'] as String?,
      attendanceRoleId: json['attendanceRoleId'] as int?,
      attendanceRoleApproverId: json['attendanceRoleApproverId'] as int?,
      status: json['status'] as String?,
      machineId: json['machineId'] as int?,
      tipValue: json['tipValue'] as int?,
      approvedBy: json['approvedBy'] as String?,
      approvalDate: json['approvalDate'] as String?,
      attendanceLogStatusId: json['attendanceLogStatusId'] as int?,
      attendanceLogRequestStatusId:
          json['attendanceLogRequestStatusId'] as int?,
    );

Map<String, dynamic> _$$_RecordAttendanceModelToJson(
        _$_RecordAttendanceModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'attendanceRoleId': instance.attendanceRoleId,
      'attendanceRoleApproverId': instance.attendanceRoleApproverId,
      'status': instance.status,
      'machineId': instance.machineId,
      'tipValue': instance.tipValue,
      'approvedBy': instance.approvedBy,
      'approvalDate': instance.approvalDate,
      'attendanceLogStatusId': instance.attendanceLogStatusId,
      'attendanceLogRequestStatusId': instance.attendanceLogRequestStatusId,
    };
