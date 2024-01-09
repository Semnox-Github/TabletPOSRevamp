// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup_values_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LookupValuesContainerDTO _$$_LookupValuesContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_LookupValuesContainerDTO(
      lookupValueId: json['LookupValueId'] as int,
      lookupValue: json['LookupValue'] as String,
      description: json['Description'] as String,
      lookupName: json['LookupName'],
    );

Map<String, dynamic> _$$_LookupValuesContainerDTOToJson(
        _$_LookupValuesContainerDTO instance) =>
    <String, dynamic>{
      'LookupValueId': instance.lookupValueId,
      'LookupValue': instance.lookupValue,
      'Description': instance.description,
      'LookupName': instance.lookupName,
    };
