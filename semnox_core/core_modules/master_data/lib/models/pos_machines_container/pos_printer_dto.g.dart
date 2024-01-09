// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_printer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_POSPrinterContainerDTO _$$_POSPrinterContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_POSPrinterContainerDTO(
      posPrinterId: json['POSPrinterId'] as int,
      printerId: json['PrinterId'] as int,
      secondaryPrinterId: json['SecondaryPrinterId'] as int?,
      orderTypeGroupId: json['OrderTypeGroupId'] as int,
      posMachineId: json['POSMachineId'] as int,
      posTypeId: json['POSTypeId'] as int,
      printTemplateId: json['PrintTemplateId'] as int,
      printerTypeId: json['PrinterTypeId'] as int,
      printerName: json['PrinterName'] as String,
      posPrinterOverrideRulesContainerDTOList:
          json['POSPrinterOverrideRulesContainerDTOList'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_POSPrinterContainerDTOToJson(
        _$_POSPrinterContainerDTO instance) =>
    <String, dynamic>{
      'POSPrinterId': instance.posPrinterId,
      'PrinterId': instance.printerId,
      'SecondaryPrinterId': instance.secondaryPrinterId,
      'OrderTypeGroupId': instance.orderTypeGroupId,
      'POSMachineId': instance.posMachineId,
      'POSTypeId': instance.posTypeId,
      'PrintTemplateId': instance.printTemplateId,
      'PrinterTypeId': instance.printerTypeId,
      'PrinterName': instance.printerName,
      'POSPrinterOverrideRulesContainerDTOList':
          instance.posPrinterOverrideRulesContainerDTOList,
    };
