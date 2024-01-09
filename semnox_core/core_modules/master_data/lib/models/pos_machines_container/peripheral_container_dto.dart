// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'peripheral_container_dto.freezed.dart';
part 'peripheral_container_dto.g.dart';


@freezed
class PeripheralContainerDTO with _$PeripheralContainerDTO {
  const factory PeripheralContainerDTO({
    @JsonKey(name: 'DeviceId')
    required int deviceId,
    @JsonKey(name: 'DeviceName')
    required String deviceName,
    @JsonKey(name: 'PosMachineId')
    required int posMachineId,
    @JsonKey(name: 'DeviceType')
    required String deviceType,
    @JsonKey(name: 'DeviceSubType')
    required String deviceSubType,
    @JsonKey(name: 'Vid')
    required String vid,
    @JsonKey(name: 'Pid')
    required String pid,
    @JsonKey(name: 'OptionalString')
    required String optionalString,
    @JsonKey(name: 'EnableTagDecryption')
    required bool enableTagDecryption,
    @JsonKey(name: 'ExcludeDecryptionForTagLength')
    required String excludeDecryptionForTagLength,
    @JsonKey(name: 'ReaderIsForRechargeOnly')
    required bool readerIsForRechargeOnly,
  }) = _PeripheralContainerDTO;

  factory PeripheralContainerDTO.fromJson(Map<String, dynamic> json) => _$PeripheralContainerDTOFromJson(json);
}