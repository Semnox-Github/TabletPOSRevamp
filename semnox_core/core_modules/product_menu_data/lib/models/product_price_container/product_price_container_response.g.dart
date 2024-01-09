// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_price_container_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductPriceContainerResponse _$$_ProductPriceContainerResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ProductPriceContainerResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              ProductPriceContainerData.fromJson(e as Map<String, dynamic>))
          .toList(),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_ProductPriceContainerResponseToJson(
        _$_ProductPriceContainerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
