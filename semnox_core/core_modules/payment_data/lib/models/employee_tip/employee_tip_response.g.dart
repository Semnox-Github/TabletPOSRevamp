// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_tip_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EmployeeTipResponse _$$_EmployeeTipResponseFromJson(
        Map<String, dynamic> json) =>
    _$_EmployeeTipResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => EmployeeTipData.fromJson(e as Map<String, dynamic>))
          .toList(),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_EmployeeTipResponseToJson(
        _$_EmployeeTipResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
