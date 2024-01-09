// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GenericResponse<T> _$$_GenericResponseFromJson<T>(
        Map<String, dynamic> json) =>
    _$_GenericResponse<T>(
      data: json['data'],
      exception: json['exception'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_GenericResponseToJson<T>(
        _$_GenericResponse<T> instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
      'message': instance.message,
    };
