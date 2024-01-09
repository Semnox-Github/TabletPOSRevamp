// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'facility_table_status_container_dto.freezed.dart';
part 'facility_table_status_container_dto.g.dart';

@freezed
class FacilityTableStatusContainerDTO with _$FacilityTableStatusContainerDTO {
  const factory FacilityTableStatusContainerDTO({
    @JsonKey(name: 'FacilityTableStatusId')
    required int facilityTableStatusId,
    @JsonKey(name: 'ThreshHoldTimeOne')
    dynamic threshHoldTimeOne,
    @JsonKey(name: 'ThreshHoldTimeTwo')
    dynamic threshHoldTimeTwo,
    @JsonKey(name: 'ThreshHoldTimeThree')
    dynamic threshHoldTimeThree,
    @JsonKey(name: 'ThreshHoldAlertColorOne')
    required String threshHoldAlertColorOne,
    @JsonKey(name: 'ThreshHoldAlertColorThree')
    required String threshHoldAlertColorThree,
    @JsonKey(name: 'ThreshHoldAlertColorTwo')
    required String threshHoldAlertColorTwo,
    @JsonKey(name: 'StatusCode')
    required String statusCode,
    @JsonKey(name: 'StatusDescription')
    required String statusDescription,
    @JsonKey(name: 'TrackTime')
    required bool trackTime,
    @JsonKey(name: 'ThreshHoldCharacterOne')
    required String threshHoldCharacterOne,
    @JsonKey(name: 'ThreshHoldCharacterTwo')
    required String threshHoldCharacterTwo,
    @JsonKey(name: 'ThreshHoldCharacterThree')
    required String threshHoldCharacterThree,
    @JsonKey(name: 'Color')
    required String color,
    @JsonKey(name: 'Character')
    required String character,
    @JsonKey(name: 'Guid')
    required String guid,
  }) = _FacilityTableStatusContainerDTO;

  factory FacilityTableStatusContainerDTO.fromJson(Map<String, dynamic> json) => _$FacilityTableStatusContainerDTOFromJson(json);
}