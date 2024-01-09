import 'package:freezed_annotation/freezed_annotation.dart';

part 'printers_dto.freezed.dart';
part 'printers_dto.g.dart';

@freezed
class PrintersDto with _$PrintersDto{
  const factory PrintersDto({
    @JsonKey(name: 'PrinterProductId')
    int? printerProductId,
    @JsonKey(name: 'PrinterId')
    int? printerId,
    @JsonKey(name: 'ProductId')
    int? productId,
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
    @JsonKey(name: 'GUID')
    String? guid,
    @JsonKey(name: 'SynchStatus')
    bool? synchStatus,
    @JsonKey(name: 'MasterEntityId')
    int? masterEntityId,
    @JsonKey(name: 'Include')
    bool? include,
    @JsonKey(name: 'IsChanged')
    bool? isChanged,
    @JsonKey(name: 'PrinterPrintGroupId')
    int? printerPrintGroupId,
    @JsonKey(name: 'PrintGroupId')
    int? printGroupId,
  }) = _PrintersDto;

  factory PrintersDto.fromJson(Map<String, dynamic> json) => _$PrintersDtoFromJson(json);

}