import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:product_config_ui/transaction_line_remark_dialog/cubit/transaction_line_remark_state.dart';
import 'package:transaction_data/builder.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';

class TransactionLineRemarkDialogCubit
    extends Cubit<TransactionLineRemarkDialogState> {
  TransactionLineRemarkDialogCubit()
      : super(
            TransactionLineRemarkDialogState()); // here inside transactionOrderDetailsState class,  some of the fields are already initialized

  TransactionResponse? transactionResponse;
  var execContextBL;
  var sysExecContext;
  var transactionDataBl;

  void resetLoaderAndMessage() {
    emit(state.copyWith(
        isLoading: false, isError: false, isSuccess: false, statusMessage: ""));
  }

  Future<void> addRemarksToTransactionLineGroups(
      String remarks, List<int> transactionLineIds,{int?approverID}) async {
    try {
      emit(state.copyWith(isError: false, isLoading: true, isSuccess: false));
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      TransactionResponse? transactionResponse =
          await transactionDataBl.addTransactionRemarkLine(
              approveId:approverID??-1,
              lineRemarks: remarks, transactionLineIds: transactionLineIds);
      emit(state.copyWith(
          transactionResponse: transactionResponse!,
          isError: false,
          isLoading: false,
          isSuccess: true));
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(
          isError: true,
          isSuccess: false,
          isLoading: false,
          statusMessage: errorString ?? ''));
    } catch (error) {
      emit(state.copyWith(
          isError: true,
          isSuccess: false,
          isLoading: false,
          statusMessage: MessagesProvider.get("Something went Wrong!")));
    }
  }

  @override
  Future<void> close() async {
    //cancel streams
    super.close();
    transactionResponse = null;
    execContextBL = null;
    sysExecContext = null;
    transactionDataBl = null;
  }
}
