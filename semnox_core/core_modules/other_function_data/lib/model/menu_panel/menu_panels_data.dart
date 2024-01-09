// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:other_function_data/model/balance_transfer/transfer_details_dto.dart';
import 'package:other_function_data/model/menu_panel/product_menu_panel_content_dto.dart';
part 'menu_panels_data.freezed.dart';
part 'menu_panels_data.g.dart';

@freezed
class MenuPanelsDto with _$MenuPanelsDto {
  const factory MenuPanelsDto({
    @JsonKey(name: 'CellMarginTop')
    int? cellMarginTop,
    @JsonKey(name: 'RowCount')
    int? rowCount,
    @JsonKey(name: 'PanelId')
    int? panelId,
    @JsonKey(name: 'ColumnCount')
    int? columnCount,
    @JsonKey(name: 'DisplayOrder')
    int? displayOrder,
    @JsonKey(name: 'CellMarginBottom')
    int? cellMarginBottom,
    @JsonKey(name: 'Name')
    String? name,
    @JsonKey(name: 'ImageURL')
    String? imageURL,
    @JsonKey(name: 'CellMarginLeft')
    int? cellMarginLeft,
    @JsonKey(name: 'CellMarginRight')
    int? cellMarginRight,
    @JsonKey(name: 'IsActive')
    bool? isActive,
    @JsonKey(name: 'CreatedBy')
    String? createdBy,
    @JsonKey(name: 'CreationDate')
    String? creationDate,
    @JsonKey(name: 'LastUpdatedBy')
    String? lastUpdatedBy,
    @JsonKey(name: 'SiteId')
    int? siteId,
    @JsonKey(name: 'MasterEntityId')
    int? masterEntityId,
    @JsonKey(name: 'SynchStatus')
    bool? synchStatus,
    @JsonKey(name: 'Guid')
    String? guid,
    @JsonKey(name: 'ProductMenuPanelContentDTOList')
    List<ProductMenuPanelContentDto>? productMenuPanelContentDTOList,
    @JsonKey(name: 'IsChanged')
    bool? isChanged,
    @JsonKey(name: 'IsChangedRecursive')
    bool? isChangedRecursive,


  }) = _MenuPanelsDto;

  factory MenuPanelsDto.fromJson(Map<String, dynamic> json) => _$MenuPanelsDtoFromJson(json);
}
