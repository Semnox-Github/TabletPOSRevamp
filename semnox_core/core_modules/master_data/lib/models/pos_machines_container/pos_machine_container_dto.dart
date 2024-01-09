// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/pos_machines_container/peripheral_container_dto.dart';
import 'package:master_data/models/pos_machines_container/pos_cash_drawer_dto.dart';
import 'package:master_data/models/pos_machines_container/pos_payment_mode_inclusion_dto.dart';
import 'package:master_data/models/pos_machines_container/pos_printer_dto.dart';
import 'package:master_data/models/pos_machines_container/pos_product_exclusions_dto.dart';
import 'package:master_data/models/pos_machines_container/product_display_group_dto.dart';

part 'pos_machine_container_dto.freezed.dart';
part 'pos_machine_container_dto.g.dart';


@freezed
class POSMachineContainerDTO with _$POSMachineContainerDTO {
  const factory POSMachineContainerDTO({
    @JsonKey(name: 'POSMachineId')
    required int posMachineId,
    @JsonKey(name: 'POSName')
    required String posName,
    @JsonKey(name: 'PosTypeName')
    required String posTypeName,
    @JsonKey(name: 'POSTypeId')
    required int posTypeId,
    @JsonKey(name: 'ComputerName')
    required String computerName,
    @JsonKey(name: 'IPAddress')
    String? ipAddress,
    @JsonKey(name: 'Attribute1')
    required String attribute1,
    @JsonKey(name: 'InventoryLocationId')
    required int inventoryLocationId,
    @JsonKey(name: 'Guid')
    required String guid,
    @JsonKey(name: 'PeripheralContainerDTOList')
    required List<PeripheralContainerDTO> peripheralContainerDTOList,
    @JsonKey(name: 'POSProductExclusionsContainerDTOList')
    required List<POSProductExclusionsContainerDTO> posProductExclusionsContainerDTOList,
    @JsonKey(name: 'POSPaymentModeInclusionContainerDTOList')
    required List<POSPaymentModeInclusionContainerDTO> posPaymentModeInclusionContainerDTOList,
    @JsonKey(name: 'ProductDisplayGroupFormatContainerDTOList')
    required List<ProductDisplayGroupFormatContainerDTO> productDisplayGroupFormatContainerDTOList,
    @JsonKey(name: 'POSPrinterContainerDTOList')
    required List<POSPrinterContainerDTO> posPrinterContainerDTOList,
    @JsonKey(name: 'IncludedProductIdList')
    required List<int> includedProductIdList,
    @JsonKey(name: 'ProductMenuIdList')
    required List<int> productMenuIdList,
    @JsonKey(name: 'FacilityIdList')
    required List<int> facilityIdList,
    @JsonKey(name: 'ExcludedProductMenuPanelIdList')
    required List<dynamic> excludedProductMenuPanelIdList,
    @JsonKey(name: 'POSCashdrawerContainerDTOList')
    List<POSCashDrawerContainerDTO>? posCashdrawerContainerDTOList,
  }) = _POSMachineContainerDTO;

  factory POSMachineContainerDTO.fromJson(Map<String, dynamic> json) => _$POSMachineContainerDTOFromJson(json);
}