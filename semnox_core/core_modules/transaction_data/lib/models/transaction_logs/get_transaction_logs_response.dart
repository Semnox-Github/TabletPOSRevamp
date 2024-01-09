import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/transaction_logs/get_transaction_logs_data.dart';

part 'get_transaction_logs_response.freezed.dart';
part 'get_transaction_logs_response.g.dart';

@freezed
class GetTransactionLogsResponse with _$GetTransactionLogsResponse {
  const factory GetTransactionLogsResponse({
    List<GetTransactionLogsData>? data,
    String? exception
  }) = _GetTransactionLogsResponse;

  factory GetTransactionLogsResponse.fromJson(Map<String, dynamic> json) => _$GetTransactionLogsResponseFromJson(json);
}