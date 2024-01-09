import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_menu_panel_mapping_dto.freezed.dart';
part 'product_menu_panel_mapping_dto.g.dart';

@freezed
class ProductMenuPanelMappingDto with _$ProductMenuPanelMappingDto {
  const factory ProductMenuPanelMappingDto({
    @JsonKey(name: 'Id')
    int? id,
    @JsonKey(name: 'PanelId')
    int? panelId,
    @JsonKey(name: 'MenuId')
    int? menuId,
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

  }) = _ProductMenuPanelMappingDto;

  factory ProductMenuPanelMappingDto.fromJson(Map<String, dynamic> json) => _$ProductMenuPanelMappingDtoFromJson(json);
}
