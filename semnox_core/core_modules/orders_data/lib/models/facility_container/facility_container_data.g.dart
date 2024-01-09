// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_container_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FacilityContainerData _$$_FacilityContainerDataFromJson(
        Map<String, dynamic> json) =>
    _$_FacilityContainerData(
      facilitysContainerDTOList: (json['FacilitysContainerDTOList']
              as List<dynamic>)
          .map((e) => FacilityContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['Hash'] as String?,
    );

Map<String, dynamic> _$$_FacilityContainerDataToJson(
        _$_FacilityContainerData instance) =>
    <String, dynamic>{
      'FacilitysContainerDTOList': instance.facilitysContainerDTOList,
      'Hash': instance.hash,
    };
