// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_machines_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_POSMachinesResponse _$$_POSMachinesResponseFromJson(
        Map<String, dynamic> json) =>
    _$_POSMachinesResponse(
      data: json['data'] == null
          ? null
          : POSMachinesData.fromJson(json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_POSMachinesResponseToJson(
        _$_POSMachinesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
