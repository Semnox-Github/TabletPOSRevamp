import 'package:flutter_bloc/flutter_bloc.dart';
import '../transaction_function_dto.dart';
import 'transaction_functions_cubit_state.dart';

class TransactionFunctionsCubit extends Cubit<TransactionFunctionsState> {
  TransactionFunctionsCubit() : super(TransactionFunctionsState());

  void updateTransactionMenuItems(List<TransactionFunctionDTO>? contextMenuFunctions,
      List<TransactionFunctionDTO>? iconicContextMenuFunctions) {
    emit(state.copyWith(contextMenuFunctions: contextMenuFunctions));
    emit(state.copyWith(iconicContextMenuFunctions: iconicContextMenuFunctions));
  }

  void setTransactionIsNonChargeable(bool isNonChargeable) {
    emit(state.copyWith(isTransactionNonChargeable: isNonChargeable));
  }
}
