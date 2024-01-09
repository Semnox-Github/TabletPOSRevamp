import 'package:freezed_annotation/freezed_annotation.dart';

import 'blanance_transfer_data.dart';


part 'balance_transfer_response.freezed.dart';
part 'balance_transfer_response.g.dart';

@freezed
class BalanceTransferResponse with _$BalanceTransferResponse {
  const factory BalanceTransferResponse({
    BalanceTransferData? data,
    String? exception
  }) = _BalanceTransferResponse;

  factory BalanceTransferResponse.fromJson(Map<String, dynamic> json) => _$BalanceTransferResponseFromJson(json);
}