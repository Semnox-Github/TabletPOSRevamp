// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/facility_table_status_container/facility_table_status_container_dto.dart';

part 'facility_table_status_container_data.freezed.dart';
part 'facility_table_status_container_data.g.dart';

@freezed
class FacilityTableStatusContainerData with _$FacilityTableStatusContainerData {
  const factory FacilityTableStatusContainerData({
    @JsonKey(name: 'FacilityTableStatusContainerDTOList')
    required List<FacilityTableStatusContainerDTO> facilityTableStatusContainerDTOList,
    @JsonKey(name: 'Hash')
    String? hash,
  }) = _FacilityTableStatusContainerData;

  factory FacilityTableStatusContainerData.fromJson(Map<String, dynamic> json) => _$FacilityTableStatusContainerDataFromJson(json);
}