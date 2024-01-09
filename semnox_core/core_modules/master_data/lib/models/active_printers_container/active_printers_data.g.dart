// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_printers_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ActivePrintersData _$$_ActivePrintersDataFromJson(
        Map<String, dynamic> json) =>
    _$_ActivePrintersData(
      printerId: json['PrinterId'] as int?,
      printerName: json['PrinterName'] as String?,
      printerLocation: json['PrinterLocation'] as String?,
      ipAddress: json['IpAddress'] as String?,
      printerTypeId: json['PrinterTypeId'] as int?,
      printerType: json['PrinterType'] as int?,
      remarks: json['Remarks'] as String?,
      kdsTerminal: json['KDSTerminal'] as int?,
      isActive: json['IsActive'] as bool?,
      creationDate: json['CreationDate'] as String?,
      createdBy: json['CreatedBy'] as String?,
      lastUpdatedDate: json['LastUpdatedDate'] as String?,
      lastUpdatedBy: json['LastUpdatedBy'] as String?,
      siteId: json['Site_Id'] as int?,
      printableProductIds: json['PrintableProductIds'],
      guid: json['GUID'] as String?,
      synchStatus: json['SynchStatus'] as bool?,
      masterEntityId: json['MasterEntityId'] as int?,
      wbPrinterModel: json['WBPrinterModel'] as int?,
      printProductsDtoList: (json['PrintProductsDTOList'] as List<dynamic>?)
          ?.map((e) => PrintersDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      printerPrintGroupsDtoList:
          (json['PrinterPrintGroupsDTOList'] as List<dynamic>?)
              ?.map((e) => PrintersDto.fromJson(e as Map<String, dynamic>))
              .toList(),
      isChanged: json['IsChanged'] as bool?,
    );

Map<String, dynamic> _$$_ActivePrintersDataToJson(
        _$_ActivePrintersData instance) =>
    <String, dynamic>{
      'PrinterId': instance.printerId,
      'PrinterName': instance.printerName,
      'PrinterLocation': instance.printerLocation,
      'IpAddress': instance.ipAddress,
      'PrinterTypeId': instance.printerTypeId,
      'PrinterType': instance.printerType,
      'Remarks': instance.remarks,
      'KDSTerminal': instance.kdsTerminal,
      'IsActive': instance.isActive,
      'CreationDate': instance.creationDate,
      'CreatedBy': instance.createdBy,
      'LastUpdatedDate': instance.lastUpdatedDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'Site_Id': instance.siteId,
      'PrintableProductIds': instance.printableProductIds,
      'GUID': instance.guid,
      'SynchStatus': instance.synchStatus,
      'MasterEntityId': instance.masterEntityId,
      'WBPrinterModel': instance.wbPrinterModel,
      'PrintProductsDTOList': instance.printProductsDtoList,
      'PrinterPrintGroupsDTOList': instance.printerPrintGroupsDtoList,
      'IsChanged': instance.isChanged,
    };
