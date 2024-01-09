
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_count_response.freezed.dart';
part 'transaction_count_response.g.dart';

@freezed
class TransactionsCountResponse with _$TransactionsCountResponse{
  const factory TransactionsCountResponse({
    int? data,
    String? exception,
  }) = _TTransactionsCountResponse;

  factory TransactionsCountResponse.fromJson(Map<String,dynamic> json) => _$TransactionsCountResponseFromJson(json);

}