// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment_category_container_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SegmentCategoryContainerData _$$_SegmentCategoryContainerDataFromJson(
        Map<String, dynamic> json) =>
    _$_SegmentCategoryContainerData(
      segmentCategoryContainerDTOList: (json['SegmentCategoryContainerDTOList']
              as List<dynamic>)
          .map((e) =>
              SegmentCategoryContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['Hash'] as String?,
    );

Map<String, dynamic> _$$_SegmentCategoryContainerDataToJson(
        _$_SegmentCategoryContainerData instance) =>
    <String, dynamic>{
      'SegmentCategoryContainerDTOList':
          instance.segmentCategoryContainerDTOList,
      'Hash': instance.hash,
    };
