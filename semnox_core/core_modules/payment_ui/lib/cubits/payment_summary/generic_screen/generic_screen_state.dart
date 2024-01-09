import 'package:transaction_data/models/create_transaction/transaction_response.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_screen_state.freezed.dart';
part 'generic_screen_state.g.dart';

@freezed
class GenericScreenState with _$GenericScreenState {
  const factory GenericScreenState({
    @Default(false) bool isLoading,
    TransactionResponse? transactionResponse,
    @Default('0.00') String tenderedAmount,
    String? loadingMessage,
    String? validationError,
    String? apiError,
  }) = _GenericScreenState;

  factory GenericScreenState.fromJson(Map<String, dynamic> json) => _$GenericScreenStateFromJson(json);
}