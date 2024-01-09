import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:product_config_ui/transaction_order_details_dialog/cubit/transaction_order_details_state.dart';
import 'package:transaction_data/builder.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';

class TransactionOrderDetailsCubit extends Cubit<TransactionOrderDetailsState>{
  TransactionOrderDetailsCubit(): super(TransactionOrderDetailsState()); // here inside transactionOrderDetailsState class,  some of the fields are already initialized

  TransactionResponse? transactionResponse;
  var execContextBL;
  var sysExecContext;
  var transactionDataBl;

  void resetLoaderAndMessage() {
    emit(state.copyWith(
        isLoading: false,
        isError: false,
        isSuccess: false,
        statusMessage: ""));
  }

  Future<void> updateTransactionOrderDetails(
      {required String guestName,
        int?approverID,
        required int guestCount,
        required String guestContact,
        required String transactionIdentifier}) async {
    try {
      emit(state.copyWith(
          isError: false,
          isLoading: true,
          isSuccess: false));
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      transactionResponse = await transactionDataBl.updateTransactionIdentifiers(
          approverId:approverID,
          guestName: guestName,
          guestContact: guestContact,
          guestCount: guestCount,
          transactionIdentifier: transactionIdentifier);
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
    }catch (error) {
      emit(state.copyWith(
          isError: true,
          isSuccess: false,
          isLoading: false,
          statusMessage: MessagesProvider.get("Something went Wrong!")));
    }
  }

  Future<void> initiateTransaction(
      {required String guestName,
        int?approverID,
        required int guestCount,
        required String guestContact,
        required String transactionIdentifier,
      int? tableId}) async {
    try {
      emit(state.copyWith(
          isError: false,
          isLoading: true,
          isSuccess: false));
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      transactionResponse = await transactionDataBl.initiateTransaction(
          approverID:approverID,
          guestCount: guestCount,
          guestName: guestName,
          guestContact: guestContact,
          transactionIdentifier: transactionIdentifier,
          tableId:tableId??-1
      );
      transactionResponse=  await transactionDataBl.lockTransaction();
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
    }catch (error) {
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
    transactionDataBl =  null;
  }

}



