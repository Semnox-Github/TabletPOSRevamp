// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/segment_category_container/segment_category_container_dto.dart';

part 'segment_category_container_data.freezed.dart';
part 'segment_category_container_data.g.dart';

@freezed
class SegmentCategoryContainerData with _$SegmentCategoryContainerData {
  const factory SegmentCategoryContainerData({
    @JsonKey(name: 'SegmentCategoryContainerDTOList')
    required List<SegmentCategoryContainerDTO> segmentCategoryContainerDTOList,
    @JsonKey(name: 'Hash')
    String? hash,
  }) = _SegmentCategoryContainerData;

  factory SegmentCategoryContainerData.fromJson(Map<String, dynamic> json) => _$SegmentCategoryContainerDataFromJson(json);
}
