
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orders_data/models/facility_table_container/facility_table_container_dto.dart';

part 'facility_table_container_data.freezed.dart';
part 'facility_table_container_data.g.dart';

@freezed
class FacilityTableContainerData with _$FacilityTableContainerData{
    const factory FacilityTableContainerData({
        @JsonKey(name: 'FacilityTablesContainerDTOList')
        required List<FacilityTableContainerDTO> facilityTablesContainerDTOList,
        @JsonKey(name: 'Hash')
        String? hash,
    }) = _FacilityTableContainerData;

    factory FacilityTableContainerData.fromJson(Map<String, dynamic> json) => _$FacilityTableContainerDataFromJson(json);
}