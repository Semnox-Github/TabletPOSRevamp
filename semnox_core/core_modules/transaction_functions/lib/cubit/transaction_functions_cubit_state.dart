import '../transaction_function_dto.dart';

class TransactionFunctionsState {
  TransactionFunctionsState({
    this.contextMenuFunctions,
    this.iconicContextMenuFunctions,
    this.isTransactionNonChargeable,
  });

  List<TransactionFunctionDTO>? contextMenuFunctions;
  List<TransactionFunctionDTO>? iconicContextMenuFunctions;
  bool? isTransactionNonChargeable  = false;

  TransactionFunctionsState copyWith({
    List<TransactionFunctionDTO>? contextMenuFunctions,
    List<TransactionFunctionDTO>? iconicContextMenuFunctions,
    bool? isTransactionNonChargeable  = false
  }) {
    return TransactionFunctionsState(
        contextMenuFunctions: contextMenuFunctions ?? this.contextMenuFunctions,
        iconicContextMenuFunctions: iconicContextMenuFunctions ?? this.iconicContextMenuFunctions,
        isTransactionNonChargeable: isTransactionNonChargeable ?? this.isTransactionNonChargeable
    );
  }
}
