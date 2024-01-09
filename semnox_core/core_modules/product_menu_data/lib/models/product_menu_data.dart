// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_menu_data/models/product_menu_container_snapshot_dto.dart';

part 'product_menu_data.freezed.dart';
part 'product_menu_data.g.dart';

@freezed
class ProductMenuData with _$ProductMenuData {

  const factory ProductMenuData({
    @JsonKey(name: 'ProductMenuContainerSnapshotDTOList')
    required List<ProductMenuContainerSnapshotDTO> productMenuContainerSnapshotDTOList,
    @JsonKey(name: 'Hash')
    String? hash,
  }) = _ProductMenuData;

  factory ProductMenuData.fromJson(Map<String, Object?> json) =>
      _$ProductMenuDataFromJson(json);
}