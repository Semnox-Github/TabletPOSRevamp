// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_container_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CountryContainerResponse _$$_CountryContainerResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CountryContainerResponse(
      data: json['data'] == null
          ? null
          : CountryContainerData.fromJson(json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_CountryContainerResponseToJson(
        _$_CountryContainerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
