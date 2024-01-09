// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';


part 'product_display_group_container_dto.freezed.dart';
part 'product_display_group_container_dto.g.dart';

@freezed
class ProductsDisplayGroupContainerDTO with _$ProductsDisplayGroupContainerDTO {
  const factory ProductsDisplayGroupContainerDTO({
    @JsonKey(name: 'Id')
    required int id,
    @JsonKey(name: 'DisplayGroupId')
    required int displayGroupId,
    @JsonKey(name: 'DisplayGroup')
    required String displayGroup,
  }) = _ProductsDisplayGroupContainerDTO;

  factory ProductsDisplayGroupContainerDTO.fromJson(Map<String, dynamic> json) => _$ProductsDisplayGroupContainerDTOFromJson(json);
}
