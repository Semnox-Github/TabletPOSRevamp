// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConfigurationData _$$_ConfigurationDataFromJson(Map<String, dynamic> json) =>
    _$_ConfigurationData(
      parafaitDefaultContainerDtoList: (json['ParafaitDefaultContainerDTOList']
              as List<dynamic>)
          .map((e) =>
              ParafaitDefaultContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['Hash'] as String?,
    );

Map<String, dynamic> _$$_ConfigurationDataToJson(
        _$_ConfigurationData instance) =>
    <String, dynamic>{
      'ParafaitDefaultContainerDTOList':
          instance.parafaitDefaultContainerDtoList,
      'Hash': instance.hash,
    };
