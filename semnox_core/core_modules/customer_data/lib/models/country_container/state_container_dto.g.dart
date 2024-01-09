// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StateContainerDTO _$$_StateContainerDTOFromJson(Map<String, dynamic> json) =>
    _$_StateContainerDTO(
      stateId: json['StateId'] as int,
      state: json['State'] as String,
      description: json['Description'] as String,
      countryId: json['CountryId'] as int,
    );

Map<String, dynamic> _$$_StateContainerDTOToJson(
        _$_StateContainerDTO instance) =>
    <String, dynamic>{
      'StateId': instance.stateId,
      'State': instance.state,
      'Description': instance.description,
      'CountryId': instance.countryId,
    };
