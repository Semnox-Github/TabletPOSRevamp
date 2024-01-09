// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment_category_container_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SegmentCategoryContainerResponse
    _$$_SegmentCategoryContainerResponseFromJson(Map<String, dynamic> json) =>
        _$_SegmentCategoryContainerResponse(
          data: json['data'] == null
              ? null
              : SegmentCategoryContainerData.fromJson(
                  json['data'] as Map<String, dynamic>),
          exception: json['exception'] as String?,
        );

Map<String, dynamic> _$$_SegmentCategoryContainerResponseToJson(
        _$_SegmentCategoryContainerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
