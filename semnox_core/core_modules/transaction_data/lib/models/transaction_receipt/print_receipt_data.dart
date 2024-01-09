import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/transaction_receipt/receipt_line_dto.dart';

part 'print_receipt_data.freezed.dart';
part 'print_receipt_data.g.dart';

@freezed
class PrintReceiptData with _$PrintReceiptData {
  const factory PrintReceiptData({
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'PrintDocumentType') required String? printDocumentType,
    @JsonKey(name: 'TemplateId') required int templateId,
    @JsonKey(name: 'POSPrinterId') required int posPrinterId,
    @JsonKey(name: 'ReceiptLineDTOList') required List<ReceiptLineDto> receiptLineDtoList,
  }) = _PrintReceiptData;

  factory PrintReceiptData.fromJson(Map<String, dynamic> json) => _$PrintReceiptDataFromJson(json);
}
