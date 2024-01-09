import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logs_data/logger.dart';
import 'package:payment_data/models/request/generic_payment/generic_payment_request.dart';
import 'package:payment_data/payment_data_bl.dart';
import 'package:payment_ui/cubits/payment_summary/generic_screen/generic_screen_state.dart';
import 'package:messages_data/builder.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';

class GenericScreenCubit extends Cubit<GenericScreenState> {

  GenericScreenCubit() : super(const GenericScreenState());

  late PaymentDataBLContract _paymentDataBL;

  void addPayment(int transactionId, GenericPaymentRequest genericPaymentRequest) async {
    Log.printMethodStart("addPayment()", "Payment Screen", "Apply");
    try {
      emit(state.copyWith(isLoading: true, loadingMessage: MessagesProvider.get('adding_payment')));
      final response = await _paymentDataBL.addGenericPayment(
          transactionId: transactionId,
          genericPaymentRequest: genericPaymentRequest
      );
      if(response.exception == null) {
        emit(state.copyWith(isLoading: false, transactionResponse: response, loadingMessage: null));
      }
      Log.printMethodEnd("addPayment()", "Payment Screen", "Apply");
      Log.printMethodReturn("addPayment() - Payment added.", "Payment Screen", "Apply");
    } on DioError catch(error) {
      final errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(isLoading: false, apiError: errorString ?? '', loadingMessage: null));
    }
  }

  void updateTransaction(TransactionResponse? response) {
    emit(state.copyWith(transactionResponse: response));
  }

  void clearError() {
    emit(state.copyWith(apiError: null));
  }


  void setPaymentDataBL(PaymentDataBLContract paymentDataBL) {
    _paymentDataBL = paymentDataBL;
  }

}