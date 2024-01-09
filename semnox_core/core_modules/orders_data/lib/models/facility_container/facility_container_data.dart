// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orders_data/models/facility_container/facility_container_dto.dart';

part 'facility_container_data.freezed.dart';
part 'facility_container_data.g.dart';

@freezed
class FacilityContainerData with _$FacilityContainerData{
  const factory FacilityContainerData({
    @JsonKey(name: 'FacilitysContainerDTOList')
    required List<FacilityContainerDTO> facilitysContainerDTOList,
    @JsonKey(name: 'Hash')
    String? hash,
  }) = _FacilityContainerData;

factory FacilityContainerData.fromJson(Map<String, dynamic> json) => _$FacilityContainerDataFromJson(json);
}