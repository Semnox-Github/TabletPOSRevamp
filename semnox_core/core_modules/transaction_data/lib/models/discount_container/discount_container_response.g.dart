// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_container_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiscountContainerResponse _$$_DiscountContainerResponseFromJson(
        Map<String, dynamic> json) =>
    _$_DiscountContainerResponse(
      data: json['data'] == null
          ? null
          : DiscountContainerData.fromJson(
              json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_DiscountContainerResponseToJson(
        _$_DiscountContainerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
