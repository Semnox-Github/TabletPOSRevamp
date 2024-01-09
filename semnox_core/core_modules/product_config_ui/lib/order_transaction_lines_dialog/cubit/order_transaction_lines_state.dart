import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';
import 'package:transaction_ui/models/transaction_lines_group.dart';

part 'order_transaction_lines_state.freezed.dart';
part 'order_transaction_lines_state.g.dart';

@freezed
class OrderTransactionLinesState with _$OrderTransactionLinesState {
  const factory OrderTransactionLinesState({
    @Default(-1) int loadingStatus,
    List<String>? seats,
    List<String>? course,
    List<String>? products,
    List<TransactionLinesGroup>? transactionLinesGroup,
    bool? isSuccess,
    bool? isError,
    String? statusMessage,
    TransactionResponse? transactionResponse,
    Map<String, List<TransactionLinesGroup>>? transactionLinesGroupsBySeat,
    List<TransactionLinesGroup>? selectedTransactionLinesGroup,
    bool? shouldClearSearchFilter,
  }) = _OrderTransactionLinesState;

  factory OrderTransactionLinesState.fromJson(Map<String, dynamic> json) => _$OrderTransactionLinesStateFromJson(json);
}