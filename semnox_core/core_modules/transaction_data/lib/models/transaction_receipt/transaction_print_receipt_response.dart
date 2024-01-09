import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/transaction_receipt/transaction_print_receipt_container_dto.dart';

part 'transaction_print_receipt_response.freezed.dart';
part 'transaction_print_receipt_response.g.dart';

@freezed
class TransactionPrintReceiptResponse with _$TransactionPrintReceiptResponse {
  const factory TransactionPrintReceiptResponse({
    List<TransactionPrintReceiptContainerDto>? data,
    String? exception
  }) = _TransactionPrintReceiptResponse;

  factory TransactionPrintReceiptResponse.fromJson(Map<String, dynamic> json) => _$TransactionPrintReceiptResponseFromJson(json);
}
