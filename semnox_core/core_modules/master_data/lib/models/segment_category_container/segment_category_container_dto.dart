import 'package:freezed_annotation/freezed_annotation.dart';

part 'segment_category_container_dto.freezed.dart';

part 'segment_category_container_dto.g.dart';

@freezed
class SegmentCategoryContainerDTO with _$SegmentCategoryContainerDTO {
  const factory SegmentCategoryContainerDTO({
    @JsonKey(name: 'SegmentCategoryId') required int segmentCategoryId,
    @JsonKey(name: 'SegmentName1') String? segmentName1,
    @JsonKey(name: 'SegmentValue1') String? segmentValue1,
    @JsonKey(name: 'SegmentName2') String? segmentName2,
    @JsonKey(name: 'SegmentValue2') String? segmentValue2,
    @JsonKey(name: 'SegmentName3') dynamic segmentName3,
    @JsonKey(name: 'SegmentValue3') dynamic segmentValue3,
    @JsonKey(name: 'SegmentValue4') dynamic segmentName4,
    @JsonKey(name: 'SegmentName4') dynamic segmentValue4,
    @JsonKey(name: 'SegmentValue5') dynamic segmentName5,
    @JsonKey(name: 'SegmentName5') dynamic segmentValue5,
    @JsonKey(name: 'SegmentValue6') dynamic segmentName6,
    @JsonKey(name: 'SegmentName6') dynamic segmentValue6,
    @JsonKey(name: 'SegmentValue7') dynamic segmentName7,
    @JsonKey(name: 'SegmentName7') dynamic segmentValue7,
    @JsonKey(name: 'SegmentName8') dynamic segmentName8,
    @JsonKey(name: 'SegmentValue8') dynamic segmentValue8,
    @JsonKey(name: 'SegmentName9') dynamic segmentName9,
    @JsonKey(name: 'SegmentValue9') dynamic segmentValue9,
    @JsonKey(name: 'SegmentName10') dynamic segmentName10,
    @JsonKey(name: 'SegmentValue10') dynamic segmentValue10,

  }) = _SegmentCategoryContainerDTO;

  factory SegmentCategoryContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$SegmentCategoryContainerDTOFromJson(json);
}
