// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FacilityContainerDTO _$$_FacilityContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_FacilityContainerDTO(
      facilityId: json['FacilityId'] as int,
      facilityName: json['FacilityName'] as String,
      description: json['Description'] as String,
      activeFlag: json['ActiveFlag'] as bool,
      allowMultipleBookings: json['AllowMultipleBookings'] as bool,
      capacity: json['Capacity'],
      internetKey: json['InternetKey'],
      guid: json['Guid'] as String,
      screenPosition: json['ScreenPosition'] as String,
      facilityType: json['FacilityType'] as int,
      maxRowIndex: json['MaxRowIndex'],
      maxColIndex: json['MaxColIndex'],
      interfaceType: json['InterfaceType'] as int,
      interfaceName: json['InterfaceName'] as int,
      externalSystemReference: json['ExternalSystemReference'] as String,
      imageFileName: json['ImageFileName'] as String,
      facilityWidth: json['FacilityWidth'],
      facilityHeight: json['FacilityHeight'],
      autoTableLayout: json['AutoTableLayout'] as bool,
      facilityTableContainerDTOList:
          (json['FacilityTableContainerDTOList'] as List<dynamic>)
              .map((e) =>
                  FacilityTableContainerDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$_FacilityContainerDTOToJson(
        _$_FacilityContainerDTO instance) =>
    <String, dynamic>{
      'FacilityId': instance.facilityId,
      'FacilityName': instance.facilityName,
      'Description': instance.description,
      'ActiveFlag': instance.activeFlag,
      'AllowMultipleBookings': instance.allowMultipleBookings,
      'Capacity': instance.capacity,
      'InternetKey': instance.internetKey,
      'Guid': instance.guid,
      'ScreenPosition': instance.screenPosition,
      'FacilityType': instance.facilityType,
      'MaxRowIndex': instance.maxRowIndex,
      'MaxColIndex': instance.maxColIndex,
      'InterfaceType': instance.interfaceType,
      'InterfaceName': instance.interfaceName,
      'ExternalSystemReference': instance.externalSystemReference,
      'ImageFileName': instance.imageFileName,
      'FacilityWidth': instance.facilityWidth,
      'FacilityHeight': instance.facilityHeight,
      'AutoTableLayout': instance.autoTableLayout,
      'FacilityTableContainerDTOList': instance.facilityTableContainerDTOList,
    };
