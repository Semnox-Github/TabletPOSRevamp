// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_container_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FaciltyContainerResponse _$$_FaciltyContainerResponseFromJson(
        Map<String, dynamic> json) =>
    _$_FaciltyContainerResponse(
      data: json['data'] == null
          ? null
          : FacilityContainerData.fromJson(
              json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_FaciltyContainerResponseToJson(
        _$_FaciltyContainerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
