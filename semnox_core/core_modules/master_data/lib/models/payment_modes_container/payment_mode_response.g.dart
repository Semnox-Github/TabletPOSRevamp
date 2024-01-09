// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_mode_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentModesResponse _$$_PaymentModesResponseFromJson(
        Map<String, dynamic> json) =>
    _$_PaymentModesResponse(
      data: json['data'] == null
          ? null
          : PaymentModesData.fromJson(json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_PaymentModesResponseToJson(
        _$_PaymentModesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
