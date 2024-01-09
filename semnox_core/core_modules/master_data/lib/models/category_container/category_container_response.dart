import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/category_container/category_container_data.dart';

part 'category_container_response.freezed.dart';
part 'category_container_response.g.dart';

@freezed
class CategoryContainerResponse with _$CategoryContainerResponse{
  const factory CategoryContainerResponse({
    CategoryContainerData? data,
    String? exception
  }) = _CategoryContainerResponse;

  factory CategoryContainerResponse.fromJson(Map<String, dynamic> json) => _$CategoryContainerResponseFromJson(json);
}