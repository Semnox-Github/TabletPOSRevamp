// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pos_printer_dto.freezed.dart';
part 'pos_printer_dto.g.dart';


@freezed
class POSPrinterContainerDTO with _$POSPrinterContainerDTO {
  const factory POSPrinterContainerDTO({
    @JsonKey(name: 'POSPrinterId')
    required int posPrinterId,
    @JsonKey(name: 'PrinterId')
    required int printerId,
    @JsonKey(name: 'SecondaryPrinterId')
    int? secondaryPrinterId,
    @JsonKey(name: 'OrderTypeGroupId')
    required int orderTypeGroupId,
    @JsonKey(name: 'POSMachineId')
    required int posMachineId,
    @JsonKey(name: 'POSTypeId')
    required int posTypeId,
    @JsonKey(name: 'PrintTemplateId')
    required int printTemplateId,
    @JsonKey(name: 'PrinterTypeId')
    required int printerTypeId,
    @JsonKey(name: 'PrinterName')
    required String printerName,
    @JsonKey(name: 'POSPrinterOverrideRulesContainerDTOList')
    List<dynamic>? posPrinterOverrideRulesContainerDTOList,
  }) = _POSPrinterContainerDTO;

  factory POSPrinterContainerDTO.fromJson(Map<String, dynamic> json) => _$POSPrinterContainerDTOFromJson(json);
}