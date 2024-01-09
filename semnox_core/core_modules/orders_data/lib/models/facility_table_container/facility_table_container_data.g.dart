// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_table_container_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FacilityTableContainerData _$$_FacilityTableContainerDataFromJson(
        Map<String, dynamic> json) =>
    _$_FacilityTableContainerData(
      facilityTablesContainerDTOList:
          (json['FacilityTablesContainerDTOList'] as List<dynamic>)
              .map((e) =>
                  FacilityTableContainerDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
      hash: json['Hash'] as String?,
    );

Map<String, dynamic> _$$_FacilityTableContainerDataToJson(
        _$_FacilityTableContainerData instance) =>
    <String, dynamic>{
      'FacilityTablesContainerDTOList': instance.facilityTablesContainerDTOList,
      'Hash': instance.hash,
    };
