// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orders_data/models/facility_table_container/facility_table_container_dto.dart';

part 'facility_container_dto.freezed.dart';
part 'facility_container_dto.g.dart';

@freezed
class FacilityContainerDTO with _$FacilityContainerDTO{
  const factory FacilityContainerDTO({
    @JsonKey(name: "FacilityId")
    required int facilityId,
    @JsonKey(name: "FacilityName")
    required String facilityName,
    @JsonKey(name: "Description")
    required String description,
    @JsonKey(name: "ActiveFlag")
    required bool activeFlag,
    @JsonKey(name: "AllowMultipleBookings")
    required bool allowMultipleBookings,
    @JsonKey(name: "Capacity")
    dynamic capacity,
    @JsonKey(name: "InternetKey")
    dynamic internetKey,
    @JsonKey(name: "Guid")
    required String guid,
    @JsonKey(name: "ScreenPosition")
    required String screenPosition,
    @JsonKey(name: "FacilityType")
    required int facilityType,
    @JsonKey(name: "MaxRowIndex")
    dynamic maxRowIndex,
    @JsonKey(name: "MaxColIndex")
    dynamic maxColIndex,
    @JsonKey(name: "InterfaceType")
    required int interfaceType,
    @JsonKey(name: "InterfaceName")
    required int interfaceName,
    @JsonKey(name: "ExternalSystemReference")
    required String externalSystemReference,
    @JsonKey(name: "ImageFileName")
    required String imageFileName,
    @JsonKey(name: "FacilityWidth")
    dynamic facilityWidth,
    @JsonKey(name: "FacilityHeight")
    dynamic facilityHeight,
    @JsonKey(name: "AutoTableLayout")
    required bool autoTableLayout,
   /* @JsonKey(name: "FacilitySeatsContainerDTOList")
    List<FacilitySeatsContainerDTO> facilitySeatsContainerDTOList,
    @JsonKey(name: "FacilitySeatLayoutContainerDTOList")
    List<FacilitySeatLayoutContainerDTO> facilitySeatLayoutContainerDTOList,
    @JsonKey(name: "FacilityWaiverContainerDTOList")
    List<FacilityWaiverContainerDTO> int facilityWaiverContainerDTOList,*/
    @JsonKey(name: "FacilityTableContainerDTOList")
    required List<FacilityTableContainerDTO> facilityTableContainerDTOList,
  }) = _FacilityContainerDTO;

  factory FacilityContainerDTO.fromJson(Map<String, dynamic> json) => _$FacilityContainerDTOFromJson(json);

}