// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_relationship_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerRelationshipResponse _$$_CustomerRelationshipResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerRelationshipResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              CustomerRelationshipData.fromJson(e as Map<String, dynamic>))
          .toList(),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_CustomerRelationshipResponseToJson(
        _$_CustomerRelationshipResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
