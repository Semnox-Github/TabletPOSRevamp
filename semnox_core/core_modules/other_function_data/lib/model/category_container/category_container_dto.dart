
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_container_dto.freezed.dart';
part 'category_container_dto.g.dart';

@freezed
class CategoryContainerDTO with _$CategoryContainerDTO {
  const factory CategoryContainerDTO({
    @JsonKey(name: 'CategoryId')
    int? categoryId,
    @JsonKey(name: 'Name')
    String? name,
    @JsonKey(name: 'ChildCategoryIdList ')
    List<int>? childCategoryIdList,
    @JsonKey(name: 'ParentCategoryIdList')
    List<int>? parentCategoryIdList,

  }) = _CategoryContainerDTO;

  factory CategoryContainerDTO.fromJson(Map<String, dynamic> json) => _$CategoryContainerDTOFromJson(json);
}
