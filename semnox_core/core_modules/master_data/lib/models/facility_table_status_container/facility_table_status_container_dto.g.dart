// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_table_status_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FacilityTableStatusContainerDTO _$$_FacilityTableStatusContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_FacilityTableStatusContainerDTO(
      facilityTableStatusId: json['FacilityTableStatusId'] as int,
      threshHoldTimeOne: json['ThreshHoldTimeOne'],
      threshHoldTimeTwo: json['ThreshHoldTimeTwo'],
      threshHoldTimeThree: json['ThreshHoldTimeThree'],
      threshHoldAlertColorOne: json['ThreshHoldAlertColorOne'] as String,
      threshHoldAlertColorThree: json['ThreshHoldAlertColorThree'] as String,
      threshHoldAlertColorTwo: json['ThreshHoldAlertColorTwo'] as String,
      statusCode: json['StatusCode'] as String,
      statusDescription: json['StatusDescription'] as String,
      trackTime: json['TrackTime'] as bool,
      threshHoldCharacterOne: json['ThreshHoldCharacterOne'] as String,
      threshHoldCharacterTwo: json['ThreshHoldCharacterTwo'] as String,
      threshHoldCharacterThree: json['ThreshHoldCharacterThree'] as String,
      color: json['Color'] as String,
      character: json['Character'] as String,
      guid: json['Guid'] as String,
    );

Map<String, dynamic> _$$_FacilityTableStatusContainerDTOToJson(
        _$_FacilityTableStatusContainerDTO instance) =>
    <String, dynamic>{
      'FacilityTableStatusId': instance.facilityTableStatusId,
      'ThreshHoldTimeOne': instance.threshHoldTimeOne,
      'ThreshHoldTimeTwo': instance.threshHoldTimeTwo,
      'ThreshHoldTimeThree': instance.threshHoldTimeThree,
      'ThreshHoldAlertColorOne': instance.threshHoldAlertColorOne,
      'ThreshHoldAlertColorThree': instance.threshHoldAlertColorThree,
      'ThreshHoldAlertColorTwo': instance.threshHoldAlertColorTwo,
      'StatusCode': instance.statusCode,
      'StatusDescription': instance.statusDescription,
      'TrackTime': instance.trackTime,
      'ThreshHoldCharacterOne': instance.threshHoldCharacterOne,
      'ThreshHoldCharacterTwo': instance.threshHoldCharacterTwo,
      'ThreshHoldCharacterThree': instance.threshHoldCharacterThree,
      'Color': instance.color,
      'Character': instance.character,
      'Guid': instance.guid,
    };
