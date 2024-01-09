// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pause_time_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PauseTimeRequest _$$_PauseTimeRequestFromJson(Map<String, dynamic> json) =>
    _$_PauseTimeRequest(
      cardId: json['CardId'] as int?,
      managerId: json['ManagerId'] as int?,
      remarks: json['Remarks'] as String?,
      timeStatus: json['TimeStatus'] as int?,
    );

Map<String, dynamic> _$$_PauseTimeRequestToJson(_$_PauseTimeRequest instance) =>
    <String, dynamic>{
      'CardId': instance.cardId,
      'ManagerId': instance.managerId,
      'Remarks': instance.remarks,
      'TimeStatus': instance.timeStatus,
    };
