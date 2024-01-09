// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_display_group_dto.freezed.dart';
part 'product_display_group_dto.g.dart';


@freezed
class ProductDisplayGroupFormatContainerDTO with _$ProductDisplayGroupFormatContainerDTO {
  const factory ProductDisplayGroupFormatContainerDTO({
    @JsonKey(name: 'Id')
    required int id,
    @JsonKey(name: 'DisplayGroup')
    String? displayGroup,
    @JsonKey(name: 'ButtonColor')
    required String buttonColor,
    @JsonKey(name: 'TextColor')
    required String textColor,
    @JsonKey(name: 'Font')
    required String font,
    @JsonKey(name: 'Description')
    required String description,
    @JsonKey(name: 'ExternalSourceReference')
    required String externalSourceReference,
    @JsonKey(name: 'SortOrder')
    required int sortOrder,
    @JsonKey(name: 'ImageUrl')
    required String imageUrl,
    @JsonKey(name: 'ProductIdList')
    dynamic productIdList,
    @JsonKey(name: 'ProductsDisplayGroupContainerDTOList')
    List<dynamic>? productsDisplayGroupContainerDTOList,
  }) = _ProductDisplayGroupFormatContainerDTO;

  factory ProductDisplayGroupFormatContainerDTO.fromJson(Map<String, dynamic> json) => _$ProductDisplayGroupFormatContainerDTOFromJson(json);
}