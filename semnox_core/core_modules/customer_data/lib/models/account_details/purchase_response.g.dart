// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PurchaseResponse _$$_PurchaseResponseFromJson(Map<String, dynamic> json) =>
    _$_PurchaseResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PurchaseData.fromJson(e as Map<String, dynamic>))
          .toList(),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_PurchaseResponseToJson(_$_PurchaseResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
