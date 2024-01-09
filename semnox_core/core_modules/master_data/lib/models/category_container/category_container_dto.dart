import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_container_dto.freezed.dart';
part 'category_container_dto.g.dart';

@freezed
class CategoryContainerDTO with _$CategoryContainerDTO{
  const factory CategoryContainerDTO({
    @JsonKey(name: 'CategoryId')
    required int? categoryId,
    @JsonKey(name: 'Name')
    required String? name,
    @JsonKey(name: 'ChildCategoryIdList')
    required List<int>? childCategoryIdList,
    @JsonKey(name: 'ParentCategoryIdList')
    required List<int>? parentCategoryIdList,
  }) = _CategoryContainerDTO;

  factory CategoryContainerDTO.fromJson(Map<String, dynamic> json) => _$CategoryContainerDTOFromJson(json);
}