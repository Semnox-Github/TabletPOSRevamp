import 'package:transaction_data/models/create_transaction/transaction_response.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cash_screen_state.freezed.dart';
part 'cash_screen_state.g.dart';

@freezed
class CashScreenState with _$CashScreenState {
  const factory CashScreenState({
    @Default(false) bool isLoading,
    TransactionResponse? transactionResponse,
    @Default('0.00') String tenderedAmount,
    @Default(100) int selectedDenomination,
    @Default(0) int hundredDenominationCount,
    @Default(0) int fiftyDenominationCount,
    @Default(0) int twentyDenominationCount,
    @Default(0) int tenDenominationCount,
    @Default(0) int fiveDenominationCount,
    @Default(0) int oneDenominationCount,
    String? loadingMessage,
    @Default(false) bool shouldShowTenderButton,
    String? validationError,
    String? apiError,
  }) = _CashScreenState;

  factory CashScreenState.fromJson(Map<String, dynamic> json) => _$CashScreenStateFromJson(json);
}