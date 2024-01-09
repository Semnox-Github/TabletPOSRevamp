import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:other_function_data/model/menu/product_menu_panel_mapping_dto.dart';
part 'menu_data.freezed.dart';
part 'menu_data.g.dart';

@freezed
class MenuDto with _$MenuDto {
  const factory MenuDto({
    @JsonKey(name: 'MenuId')
    int? menuId,
    @JsonKey(name: 'Name')
    String? name,
    @JsonKey(name:'Description')
    String? description,
    @JsonKey(name: 'Type')
    String? type,
    @JsonKey(name: 'StartDate')
    String? startDate,
    @JsonKey(name: 'EndDate')
    String? endDate,
    @JsonKey(name: 'IsActive')
    bool? isActive,
    @JsonKey(name: 'CreatedBy')
    String? createdBy,
    @JsonKey(name: 'CreationDate')
    String? creationDate,
    @JsonKey(name: 'LastUpdatedBy')
    String? lastUpdatedBy,
    @JsonKey(name: 'LastUpdateDate')
    String? lastUpdateDate,
    @JsonKey(name: 'SiteId')
    int? siteId,
    @JsonKey(name: 'MasterEntityId')
    int? masterEntityId,
    @JsonKey(name: 'SynchStatus')
    bool? synchStatus,
    @JsonKey(name: 'Guid')
    String? guid,
    @JsonKey(name: 'ProductMenuPanelMappingDTOList')
    List<ProductMenuPanelMappingDto>? productMenuPanelMappingDtoList,
    @JsonKey(name: 'IsChanged')
    bool? isChanged,
    @JsonKey(name: 'IsChangedRecursive')
    bool? isChangedRecursive,

  }) = _MenuDto;

  factory MenuDto.fromJson(Map<String, dynamic> json) => _$MenuDtoFromJson(json);
}
