// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peripheral_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeripheralContainerDTO _$$_PeripheralContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_PeripheralContainerDTO(
      deviceId: json['DeviceId'] as int,
      deviceName: json['DeviceName'] as String,
      posMachineId: json['PosMachineId'] as int,
      deviceType: json['DeviceType'] as String,
      deviceSubType: json['DeviceSubType'] as String,
      vid: json['Vid'] as String,
      pid: json['Pid'] as String,
      optionalString: json['OptionalString'] as String,
      enableTagDecryption: json['EnableTagDecryption'] as bool,
      excludeDecryptionForTagLength:
          json['ExcludeDecryptionForTagLength'] as String,
      readerIsForRechargeOnly: json['ReaderIsForRechargeOnly'] as bool,
    );

Map<String, dynamic> _$$_PeripheralContainerDTOToJson(
        _$_PeripheralContainerDTO instance) =>
    <String, dynamic>{
      'DeviceId': instance.deviceId,
      'DeviceName': instance.deviceName,
      'PosMachineId': instance.posMachineId,
      'DeviceType': instance.deviceType,
      'DeviceSubType': instance.deviceSubType,
      'Vid': instance.vid,
      'Pid': instance.pid,
      'OptionalString': instance.optionalString,
      'EnableTagDecryption': instance.enableTagDecryption,
      'ExcludeDecryptionForTagLength': instance.excludeDecryptionForTagLength,
      'ReaderIsForRechargeOnly': instance.readerIsForRechargeOnly,
    };
