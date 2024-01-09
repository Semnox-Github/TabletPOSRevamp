// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_table_status_container_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FacilityTableStatusContainerData
    _$$_FacilityTableStatusContainerDataFromJson(Map<String, dynamic> json) =>
        _$_FacilityTableStatusContainerData(
          facilityTableStatusContainerDTOList:
              (json['FacilityTableStatusContainerDTOList'] as List<dynamic>)
                  .map((e) => FacilityTableStatusContainerDTO.fromJson(
                      e as Map<String, dynamic>))
                  .toList(),
          hash: json['Hash'] as String?,
        );

Map<String, dynamic> _$$_FacilityTableStatusContainerDataToJson(
        _$_FacilityTableStatusContainerData instance) =>
    <String, dynamic>{
      'FacilityTableStatusContainerDTOList':
          instance.facilityTableStatusContainerDTOList,
      'Hash': instance.hash,
    };
