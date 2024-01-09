// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/create_transaction/transaction_data.dart';


part 'search_transaction_response.freezed.dart';
part 'search_transaction_response.g.dart';

@freezed
class TransactionSearchResponse with _$TransactionSearchResponse {

  const factory TransactionSearchResponse({
    List<TransactionData>? data, String? exception
  }) =_TransactionSearchResponse;

  factory TransactionSearchResponse.fromJson(Map<String, Object?> json) =>
      _$TransactionSearchResponseFromJson(json);
}
