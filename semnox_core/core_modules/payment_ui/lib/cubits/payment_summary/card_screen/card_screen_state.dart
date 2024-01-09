import 'package:transaction_data/models/create_transaction/transaction_response.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_screen_state.freezed.dart';
part 'card_screen_state.g.dart';

@freezed
class CardScreenState with _$CardScreenState {
  const factory CardScreenState({
    @Default(false) bool isLoading,
    TransactionResponse? transactionResponse,
    String? loadingMessage,
    String? validationError,
    String? apiError,
  }) = _CardScreenState;

  factory CardScreenState.fromJson(Map<String, dynamic> json) => _$CardScreenStateFromJson(json);
}