// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_machine_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_POSMachineContainerDTO _$$_POSMachineContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_POSMachineContainerDTO(
      posMachineId: json['POSMachineId'] as int,
      posName: json['POSName'] as String,
      posTypeName: json['PosTypeName'] as String,
      posTypeId: json['POSTypeId'] as int,
      computerName: json['ComputerName'] as String,
      ipAddress: json['IPAddress'] as String?,
      attribute1: json['Attribute1'] as String,
      inventoryLocationId: json['InventoryLocationId'] as int,
      guid: json['Guid'] as String,
      peripheralContainerDTOList: (json['PeripheralContainerDTOList']
              as List<dynamic>)
          .map(
              (e) => PeripheralContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      posProductExclusionsContainerDTOList:
          (json['POSProductExclusionsContainerDTOList'] as List<dynamic>)
              .map((e) => POSProductExclusionsContainerDTO.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      posPaymentModeInclusionContainerDTOList:
          (json['POSPaymentModeInclusionContainerDTOList'] as List<dynamic>)
              .map((e) => POSPaymentModeInclusionContainerDTO.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      productDisplayGroupFormatContainerDTOList:
          (json['ProductDisplayGroupFormatContainerDTOList'] as List<dynamic>)
              .map((e) => ProductDisplayGroupFormatContainerDTO.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      posPrinterContainerDTOList: (json['POSPrinterContainerDTOList']
              as List<dynamic>)
          .map(
              (e) => POSPrinterContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      includedProductIdList: (json['IncludedProductIdList'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      productMenuIdList: (json['ProductMenuIdList'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      facilityIdList: (json['FacilityIdList'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      excludedProductMenuPanelIdList:
          json['ExcludedProductMenuPanelIdList'] as List<dynamic>,
      posCashdrawerContainerDTOList:
          (json['POSCashdrawerContainerDTOList'] as List<dynamic>?)
              ?.map((e) =>
                  POSCashDrawerContainerDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$_POSMachineContainerDTOToJson(
        _$_POSMachineContainerDTO instance) =>
    <String, dynamic>{
      'POSMachineId': instance.posMachineId,
      'POSName': instance.posName,
      'PosTypeName': instance.posTypeName,
      'POSTypeId': instance.posTypeId,
      'ComputerName': instance.computerName,
      'IPAddress': instance.ipAddress,
      'Attribute1': instance.attribute1,
      'InventoryLocationId': instance.inventoryLocationId,
      'Guid': instance.guid,
      'PeripheralContainerDTOList': instance.peripheralContainerDTOList,
      'POSProductExclusionsContainerDTOList':
          instance.posProductExclusionsContainerDTOList,
      'POSPaymentModeInclusionContainerDTOList':
          instance.posPaymentModeInclusionContainerDTOList,
      'ProductDisplayGroupFormatContainerDTOList':
          instance.productDisplayGroupFormatContainerDTOList,
      'POSPrinterContainerDTOList': instance.posPrinterContainerDTOList,
      'IncludedProductIdList': instance.includedProductIdList,
      'ProductMenuIdList': instance.productMenuIdList,
      'FacilityIdList': instance.facilityIdList,
      'ExcludedProductMenuPanelIdList': instance.excludedProductMenuPanelIdList,
      'POSCashdrawerContainerDTOList': instance.posCashdrawerContainerDTOList,
    };
