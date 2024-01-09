import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/transaction_receipt/print_receipt_data.dart';

part 'transaction_print_receipt_dto.freezed.dart';
part 'transaction_print_receipt_dto.g.dart';

@freezed
class TransactionPrintReceiptDto with _$TransactionPrintReceiptDto {
  const factory TransactionPrintReceiptDto({
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'Format') required String? format,
    @JsonKey(name: 'DocumentType') required String documentType,
    @JsonKey(name: 'TemplateId') required int templateId,
    @JsonKey(name: 'POSPrinterId') required int posPrinterId,
    @JsonKey(name: 'Data') required PrintReceiptData data,
  }) = _TransactionPrintReceiptDto;

  factory TransactionPrintReceiptDto.fromJson(Map<String, dynamic> json) =>
      _$TransactionPrintReceiptDtoFromJson(json);
}