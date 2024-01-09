import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:master_data/models/order_status_container/order_status_container_data.dart'
import 'package:master_data/models/segment_category_container/segment_category_container_data.dart';

part 'segment_category_container_response.freezed.dart';
part 'segment_category_container_response.g.dart';

@freezed
class SegmentCategoryContainerResponse with _$SegmentCategoryContainerResponse {
  const factory SegmentCategoryContainerResponse({
    SegmentCategoryContainerData? data,
    String? exception
  }) = _SegmentCategoryContainerResponse;

  factory SegmentCategoryContainerResponse.fromJson(Map<String, dynamic> json) => _$SegmentCategoryContainerResponseFromJson(json);
}
