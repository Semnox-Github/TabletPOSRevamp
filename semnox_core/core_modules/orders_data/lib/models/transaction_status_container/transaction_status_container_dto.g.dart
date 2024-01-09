// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_status_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionStatusContainerDTO _$$_TransactionStatusContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionStatusContainerDTO(
      transactionStatusId: json['TransactionStatusId'] as int,
      threshHoldTimeOne: json['ThreshHoldTimeOne'],
      threshHoldTimeTwo: json['ThreshHoldTimeTwo'],
      threshHoldTimeThree: json['ThreshHoldTimeThree'],
      threshHoldAlertColorOne: json['ThreshHoldAlertColorOne'] as String?,
      threshHoldAlertColorTwo: json['ThreshHoldAlertColorTwo'] as String?,
      threshHoldAlertColorThree: json['ThreshHoldAlertColorThree'] as String?,
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

Map<String, dynamic> _$$_TransactionStatusContainerDTOToJson(
        _$_TransactionStatusContainerDTO instance) =>
    <String, dynamic>{
      'TransactionStatusId': instance.transactionStatusId,
      'ThreshHoldTimeOne': instance.threshHoldTimeOne,
      'ThreshHoldTimeTwo': instance.threshHoldTimeTwo,
      'ThreshHoldTimeThree': instance.threshHoldTimeThree,
      'ThreshHoldAlertColorOne': instance.threshHoldAlertColorOne,
      'ThreshHoldAlertColorTwo': instance.threshHoldAlertColorTwo,
      'ThreshHoldAlertColorThree': instance.threshHoldAlertColorThree,
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
