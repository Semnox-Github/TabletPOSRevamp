
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orders_data/models/transactions/transaction_data.dart';

part 'transaction_response.freezed.dart';
part 'transaction_response.g.dart';

@freezed
class TransactionResponse with _$TransactionResponse{
  const factory TransactionResponse({
    List<TransactionsData>? data,
    String? exception,
  }) = _TransactionResponse;

  factory TransactionResponse.fromJson(Map<String,dynamic> json) => _$TransactionResponseFromJson(json);

}