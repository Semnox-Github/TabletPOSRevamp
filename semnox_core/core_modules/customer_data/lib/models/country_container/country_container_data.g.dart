// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_container_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CountryContainerData _$$_CountryContainerDataFromJson(
        Map<String, dynamic> json) =>
    _$_CountryContainerData(
      countryContainerDTOList: (json['CountryContainerDTOList']
              as List<dynamic>)
          .map((e) => CountryContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['hash'] as String?,
    );

Map<String, dynamic> _$$_CountryContainerDataToJson(
        _$_CountryContainerData instance) =>
    <String, dynamic>{
      'CountryContainerDTOList': instance.countryContainerDTOList,
      'hash': instance.hash,
    };
