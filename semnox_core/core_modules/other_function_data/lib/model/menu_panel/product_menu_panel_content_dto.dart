import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_menu_panel_content_dto.freezed.dart';
part 'product_menu_panel_content_dto.g.dart';

@freezed
class ProductMenuPanelContentDto with _$ProductMenuPanelContentDto {
  const factory ProductMenuPanelContentDto({
    @JsonKey(name: 'Id')
    int? id,
    @JsonKey(name: 'PanelId')
    int? panelId,
    @JsonKey(name: 'ObjectType')
    String? objectType,
    @JsonKey(name: 'ObjectGuid')
    String? objectGuid,
    @JsonKey(name: 'RowIndex')
    int? rowIndex,
    @JsonKey(name: 'ColumnIndex')
    int? columnIndex,
    @JsonKey(name: 'ImageURL')
    String? imageURL,
    @JsonKey(name: 'ButtonType')
    String? buttonType,
    @JsonKey(name: 'BackColor')
    String? backColor,
    @JsonKey(name: 'TextColor')
    String? textColor,
    @JsonKey(name: 'Font')
    String? font,
    @JsonKey(name: 'IsActive')
    bool? isActive,
    @JsonKey(name: 'CreatedBy')
    String? createdBy,
    @JsonKey(name: 'CreationDate')
    String? creationDate,
    @JsonKey(name: 'LastUpdatedBy')
    String? lastUpdatedBy,
    @JsonKey(name: 'LastUpdatedDate')
    String? lastUpdatedDate,
    @JsonKey(name: 'SiteId')
    int? siteId,
    @JsonKey(name: 'MasterEntityId')
    int? masterEntityId,
    @JsonKey(name: 'SynchStatus')
    bool? synchStatus,
    @JsonKey(name: 'Guid')
    String? guid,
    @JsonKey(name: 'IsChanged')
    bool? isChanged,
    @JsonKey(name: 'IsMerged')
    @Default(false) isMerged




  }) = _ProductMenuPanelContentDto;

  factory ProductMenuPanelContentDto.fromJson(Map<String, dynamic> json) => _$ProductMenuPanelContentDtoFromJson(json);
}
