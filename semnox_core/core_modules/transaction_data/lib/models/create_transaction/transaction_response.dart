import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/create_transaction/transaction_data.dart';

part 'transaction_response.freezed.dart';
part 'transaction_response.g.dart';

@freezed
class TransactionResponse with _$TransactionResponse {
  const factory TransactionResponse({
    TransactionData? data,
    String? exception
  }) = _TransactionResponse;

  factory TransactionResponse.fromJson(Map<String, dynamic> json) => _$TransactionResponseFromJson(json);
}