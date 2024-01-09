// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_entitlement_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExchangeEntitlementResponse _$$_ExchangeEntitlementResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ExchangeEntitlementResponse(
      data: json['data'] == null
          ? null
          : ExchangeEntitlementData.fromJson(
              json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_ExchangeEntitlementResponseToJson(
        _$_ExchangeEntitlementResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
