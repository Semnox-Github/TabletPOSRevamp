// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LookupsContainerDTO _$$_LookupsContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_LookupsContainerDTO(
      lookupId: json['LookupId'] as int,
      lookupName: json['LookupName'] as String,
      isProtected: json['IsProtected'] as String,
      lookupValuesContainerDTOList:
          (json['LookupValuesContainerDTOList'] as List<dynamic>)
              .map((e) =>
                  LookupValuesContainerDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$_LookupsContainerDTOToJson(
        _$_LookupsContainerDTO instance) =>
    <String, dynamic>{
      'LookupId': instance.lookupId,
      'LookupName': instance.lookupName,
      'IsProtected': instance.isProtected,
      'LookupValuesContainerDTOList': instance.lookupValuesContainerDTOList,
    };
