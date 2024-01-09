// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_table_current_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FacilityTableCurrentStatusResponse
    _$$_FacilityTableCurrentStatusResponseFromJson(Map<String, dynamic> json) =>
        _$_FacilityTableCurrentStatusResponse(
          data: (json['data'] as List<dynamic>?)
              ?.map((e) => FacilityTableCurrentStatusDTO.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          exception: json['exception'] as String?,
        );

Map<String, dynamic> _$$_FacilityTableCurrentStatusResponseToJson(
        _$_FacilityTableCurrentStatusResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
