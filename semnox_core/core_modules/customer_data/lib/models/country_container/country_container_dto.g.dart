// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CountryContainerDTO _$$_CountryContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_CountryContainerDTO(
      countryId: json['CountryId'] as int,
      countryName: json['CountryName'] as String,
      countryCode: json['CountryCode'] as String,
      isActive: json['IsActive'] as bool,
      stateContainerDTOList: (json['StateContainerDTOList'] as List<dynamic>)
          .map((e) => StateContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CountryContainerDTOToJson(
        _$_CountryContainerDTO instance) =>
    <String, dynamic>{
      'CountryId': instance.countryId,
      'CountryName': instance.countryName,
      'CountryCode': instance.countryCode,
      'IsActive': instance.isActive,
      'StateContainerDTOList': instance.stateContainerDTOList,
    };
