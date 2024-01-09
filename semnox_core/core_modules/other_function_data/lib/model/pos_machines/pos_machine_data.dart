import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:other_function_data/model/pos_machines/product_menu_pos_machine_map_dto.dart';
part 'pos_machine_data.freezed.dart';
part 'pos_machine_data.g.dart';

@freezed
class PosMachineDate with _$PosMachineDate {
  const factory PosMachineDate({
    @JsonKey(name: 'POSMachineId')
    int? pOSMachineId,
    @JsonKey(name: 'POSName')
    String? pOSName,
    @JsonKey(name: 'LegalEntity')
    String? legalEntity,
    @JsonKey(name: 'Remarks')
    String? remarks,
    @JsonKey(name: 'FriendlyName')
    String? friendlyName,
    @JsonKey(name: 'POSTypeId')
    int? pOSTypeId,
    @JsonKey(name: 'InventoryLocationId')
    int? inventoryLocationId,
    @JsonKey(name: 'IPAddress')
    String? iPAddress,
    @JsonKey(name: 'ComputerName')
    String? computerName,
    @JsonKey(name: 'Guid')
    String? guid,
    @JsonKey(name: 'SiteId')
    int? siteId,
    @JsonKey(name: 'SynchStatus')
    bool? synchStatus,
    @JsonKey(name: 'MasterEntityId')
    int? masterEntityId,
    @JsonKey(name: 'DayBeginTime')
    String? dayBeginTime,
    @JsonKey(name: 'DayEndTime')
    String? dayEndTime,
    @JsonKey(name: 'XReportRunTime')
    String? xReportRunTime,
    @JsonKey(name: 'IsActive')
    bool? isActive,
    @JsonKey(name: 'CreationDate')
    String? creationDate,
    @JsonKey(name: 'LastUpdatedBy')
    String? lastUpdatedBy,
    @JsonKey(name: 'LastUpdateDate')
    String? lastUpdateDate,
    @JsonKey(name: 'Attribute1')
    String? attribute1,
    @JsonKey(name: 'Attribute2')
    String? attribute2,
    @JsonKey(name: 'Attribute3')
    String? attribute3,
    @JsonKey(name: 'Attribute4')
    String? attribute4,
    @JsonKey(name: 'Attribute5')
    String? attribute5,
    @JsonKey(name: 'IsChanged')
    bool? isChanged,
    @JsonKey(name: 'ProductMenuPOSMachineMapDTOList')
    List<ProductMenuPosMachineMapDto>? productMenuPosMachineMapDto,
    @JsonKey(name: 'IsChangedRecursive')
    bool? isChangedRecursive,

  }) = _PosMachineDate;

  factory PosMachineDate.fromJson(Map<String, dynamic> json) => _$PosMachineDateFromJson(json);
}
