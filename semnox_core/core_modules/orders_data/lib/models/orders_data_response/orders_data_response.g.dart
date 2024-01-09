// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrdersDataResponse _$$_OrdersDataResponseFromJson(
        Map<String, dynamic> json) =>
    _$_OrdersDataResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => OrdersData.fromJson(e as Map<String, dynamic>))
          .toList(),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_OrdersDataResponseToJson(
        _$_OrdersDataResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
