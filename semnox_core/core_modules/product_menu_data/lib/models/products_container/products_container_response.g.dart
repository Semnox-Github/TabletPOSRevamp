// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_container_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductsContainerResponse _$$_ProductsContainerResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ProductsContainerResponse(
      data: json['data'] == null
          ? null
          : ProductsContainerData.fromJson(
              json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_ProductsContainerResponseToJson(
        _$_ProductsContainerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
