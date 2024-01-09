import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/active_printers_container/printers_dto.dart';

part 'active_printers_data.freezed.dart';
part 'active_printers_data.g.dart';

@freezed
class ActivePrintersData with _$ActivePrintersData{
  const factory ActivePrintersData({
    @JsonKey(name: 'PrinterId')
    int? printerId,
    @JsonKey(name: 'PrinterName')
    String? printerName,
    @JsonKey(name: 'PrinterLocation')
    String? printerLocation,
    @JsonKey(name: 'IpAddress')
    String? ipAddress,
    @JsonKey(name: 'PrinterTypeId')
    int? printerTypeId,
    @JsonKey(name: 'PrinterType')
    int? printerType,
    @JsonKey(name: 'Remarks')
    String? remarks,
    @JsonKey(name: 'KDSTerminal')
    int? kdsTerminal,
    @JsonKey(name: 'IsActive')
    bool? isActive,
    @JsonKey(name: 'CreationDate')
    String? creationDate,
    @JsonKey(name: 'CreatedBy')
    String? createdBy,
    @JsonKey(name: 'LastUpdatedDate')
    String? lastUpdatedDate,
    @JsonKey(name: 'LastUpdatedBy')
    String? lastUpdatedBy,
    @JsonKey(name: 'Site_Id')
    int? siteId,
    @JsonKey(name: 'PrintableProductIds')
    dynamic? printableProductIds,
    @JsonKey(name: 'GUID')
    String? guid,
    @JsonKey(name: 'SynchStatus')
    bool? synchStatus,
    @JsonKey(name: 'MasterEntityId')
    int? masterEntityId,
    @JsonKey(name: 'WBPrinterModel')
    int? wbPrinterModel,
    @JsonKey(name: 'PrintProductsDTOList')
    List<PrintersDto>? printProductsDtoList,
    @JsonKey(name: 'PrinterPrintGroupsDTOList')
    List<PrintersDto>? printerPrintGroupsDtoList,
    @JsonKey(name: 'IsChanged')
    bool? isChanged,
  }) = _ActivePrintersData;

  factory ActivePrintersData.fromJson(Map<String, dynamic> json) => _$ActivePrintersDataFromJson(json);

}