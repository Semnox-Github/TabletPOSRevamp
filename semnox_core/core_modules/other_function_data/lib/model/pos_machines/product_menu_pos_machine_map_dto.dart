import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_menu_pos_machine_map_dto.freezed.dart';
part 'product_menu_pos_machine_map_dto.g.dart';

@freezed
class ProductMenuPosMachineMapDto with _$ProductMenuPosMachineMapDto {
  const factory ProductMenuPosMachineMapDto({
    @JsonKey(name: 'Id')
    int? id,
    @JsonKey(name: 'MenuId')
    int? menuId,
    @JsonKey(name: 'POSMachineId')
    int? pOSMachineId,
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
  }) = _ProductMenuPosMachineMapDto;

  factory ProductMenuPosMachineMapDto.fromJson(Map<String, dynamic> json) => _$ProductMenuPosMachineMapDtoFromJson(json);
}
