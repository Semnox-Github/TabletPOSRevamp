import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_print_receipt_container_dto.freezed.dart';
part 'transaction_print_receipt_container_dto.g.dart';

@freezed
class TransactionPrintReceiptContainerDto with _$TransactionPrintReceiptContainerDto {
  const factory TransactionPrintReceiptContainerDto({
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'Format') required String? format,
    @JsonKey(name: 'DocumentType') required String documentType,
    @JsonKey(name: 'TemplateId') required int templateId,
    @JsonKey(name: 'POSPrinterId') required int posPrinterId,
    @JsonKey(name: 'Data') required String data,
  }) = _TransactionPrintReceiptContainerDto;

  factory TransactionPrintReceiptContainerDto.fromJson(Map<String, dynamic> json) =>
      _$TransactionPrintReceiptContainerDtoFromJson(json);
}
