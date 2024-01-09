// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_table_status_container_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FacilityTableStatusContainerResponse
    _$$_FacilityTableStatusContainerResponseFromJson(
            Map<String, dynamic> json) =>
        _$_FacilityTableStatusContainerResponse(
          data: json['data'] == null
              ? null
              : FacilityTableStatusContainerData.fromJson(
                  json['data'] as Map<String, dynamic>),
          exception: json['exception'] as String?,
        );

Map<String, dynamic> _$$_FacilityTableStatusContainerResponseToJson(
        _$_FacilityTableStatusContainerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
