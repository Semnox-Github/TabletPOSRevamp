// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_menu_data/models/product_menu_panel_container_dto.dart';

part 'product_menu_container_snapshot_dto.freezed.dart';
part 'product_menu_container_snapshot_dto.g.dart';

@freezed
class ProductMenuContainerSnapshotDTO with _$ProductMenuContainerSnapshotDTO {

  const factory ProductMenuContainerSnapshotDTO({
    @JsonKey(name: 'StartDateTime')
    required String startDateTime,
    @JsonKey(name: 'EndDateTime')
    required String endDateTime,
    @JsonKey(name: 'ProductMenuPanelContainerDTOList')
    required List<ProductMenuPanelContainerDTO> productMenuPanelContainerDTOList,
  }) = _ProductMenuContainerSnapshotDTO;

  factory ProductMenuContainerSnapshotDTO.fromJson(Map<String, Object?> json) =>
      _$ProductMenuContainerSnapshotDTOFromJson(json);
}