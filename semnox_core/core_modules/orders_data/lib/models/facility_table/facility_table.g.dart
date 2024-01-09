// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FacilityTable _$$_FacilityTableFromJson(Map<String, dynamic> json) =>
    _$_FacilityTable(
      Reason: json['Reason'] as String?,
      AdditionalComments: json['AdditionalComments'] as String?,
      ApprovalDTO: json['ApprovalDTO'] == null
          ? null
          : ApproveDTO.fromJson(json['ApprovalDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FacilityTableToJson(_$_FacilityTable instance) =>
    <String, dynamic>{
      'Reason': instance.Reason,
      'AdditionalComments': instance.AdditionalComments,
      'ApprovalDTO': instance.ApprovalDTO,
    };
