// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_machine_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_POSMachineResponse _$$_POSMachineResponseFromJson(
        Map<String, dynamic> json) =>
    _$_POSMachineResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PosMachineDate.fromJson(e as Map<String, dynamic>))
          .toList(),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_POSMachineResponseToJson(
        _$_POSMachineResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
