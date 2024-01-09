// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_type_container_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductTypeContainerResponse _$$_ProductTypeContainerResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ProductTypeContainerResponse(
      data: json['data'] == null
          ? null
          : ProductContainerData.fromJson(json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_ProductTypeContainerResponseToJson(
        _$_ProductTypeContainerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
