import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/transaction_functions/transaction_function_data.dart';

part 'transaction_function_response.freezed.dart';
part 'transaction_function_response.g.dart';

@freezed
class TransactionFunctionResponse with _$TransactionFunctionResponse {
  const factory TransactionFunctionResponse({
    TransactionFunctionData? data,
    String? exception
  }) = _TransactionFunctionResponse;

  factory TransactionFunctionResponse.fromJson(Map<String, dynamic> json) => _$TransactionFunctionResponseFromJson(json);
}