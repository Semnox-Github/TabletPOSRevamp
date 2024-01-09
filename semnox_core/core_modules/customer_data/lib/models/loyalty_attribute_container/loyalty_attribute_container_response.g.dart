// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_attribute_container_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoyaltyAttributeContainerResponse
    _$$_LoyaltyAttributeContainerResponseFromJson(Map<String, dynamic> json) =>
        _$_LoyaltyAttributeContainerResponse(
          data: json['data'] == null
              ? null
              : LoyaltyAttributeContainerData.fromJson(
                  json['data'] as Map<String, dynamic>),
          exception: json['exception'] as String?,
        );

Map<String, dynamic> _$$_LoyaltyAttributeContainerResponseToJson(
        _$_LoyaltyAttributeContainerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
