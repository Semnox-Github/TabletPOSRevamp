// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_menu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductMenuResponse _$$_ProductMenuResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ProductMenuResponse(
      data: json['data'] == null
          ? null
          : ProductMenuData.fromJson(json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_ProductMenuResponseToJson(
        _$_ProductMenuResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
