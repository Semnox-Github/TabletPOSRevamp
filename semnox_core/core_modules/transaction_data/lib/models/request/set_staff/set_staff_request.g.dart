// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_staff_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SetStaffRequest _$$_SetStaffRequestFromJson(Map<String, dynamic> json) =>
    _$_SetStaffRequest(
      userId: json['UserId'] as int,
      approvalDTO:
          ApprovalDTO.fromJson(json['ApprovalDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SetStaffRequestToJson(_$_SetStaffRequest instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'ApprovalDTO': instance.approvalDTO,
    };
