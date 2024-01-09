// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_table_container_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FacilityTableContainerResponse _$$_FacilityTableContainerResponseFromJson(
        Map<String, dynamic> json) =>
    _$_FacilityTableContainerResponse(
      data: json['data'] == null
          ? null
          : FacilityTableContainerData.fromJson(
              json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_FacilityTableContainerResponseToJson(
        _$_FacilityTableContainerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
