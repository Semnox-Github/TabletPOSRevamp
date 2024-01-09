// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LookupData _$$_LookupDataFromJson(Map<String, dynamic> json) =>
    _$_LookupData(
      lookupsContainerDTOList: (json['LookupsContainerDTOList']
              as List<dynamic>)
          .map((e) => LookupsContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['Hash'] as String?,
    );

Map<String, dynamic> _$$_LookupDataToJson(_$_LookupData instance) =>
    <String, dynamic>{
      'LookupsContainerDTOList': instance.lookupsContainerDTOList,
      'Hash': instance.hash,
    };
