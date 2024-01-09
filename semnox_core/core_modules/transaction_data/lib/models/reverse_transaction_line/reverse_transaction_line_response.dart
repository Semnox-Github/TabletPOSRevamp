import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';

part 'reverse_transaction_line_response.freezed.dart';
part 'reverse_transaction_line_response.g.dart';

@freezed
class ReverseTransactionLineResponse with _$ReverseTransactionLineResponse {
  const factory ReverseTransactionLineResponse({
    TransactionResponse? transactionResponse,
    String? exception
  }) = _ReverseTransactionLineResponse;

  factory ReverseTransactionLineResponse.fromJson(Map<String, dynamic> json) => _$ReverseTransactionLineResponseFromJson(json);
}