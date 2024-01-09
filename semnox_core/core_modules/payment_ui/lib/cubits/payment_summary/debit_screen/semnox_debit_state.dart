import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'semnox_debit_state.freezed.dart';
part 'semnox_debit_state.g.dart';

@freezed
class SemnoxDebitState with _$SemnoxDebitState {
  const factory SemnoxDebitState({
    @Default(false) bool isLoading,
    @Default(0) double balance,
    AccountDetailsData? cardDetails,
    TransactionResponse? transactionResponse,
    String? loadingMessage,
    String? validationError,
    String? apiError,
  }) = _SemnoxDebitState;

  factory SemnoxDebitState.fromJson(Map<String, dynamic> json) => _$SemnoxDebitStateFromJson(json);
}