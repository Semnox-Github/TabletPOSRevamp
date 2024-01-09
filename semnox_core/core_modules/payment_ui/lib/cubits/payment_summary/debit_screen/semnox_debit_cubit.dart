import 'package:customer_data/builder.dart';
import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logs_data/logger.dart';
import 'package:messages_data/builder.dart';
import 'package:payment_data/models/request/card_payment/card_payment_request.dart';
import 'package:payment_data/payment_data_bl.dart';
import 'package:payment_ui/cubits/payment_summary/debit_screen/semnox_debit_state.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';

class SemnoxDebitCubit extends Cubit<SemnoxDebitState> {

  SemnoxDebitCubit() : super(const SemnoxDebitState());

  late PaymentDataBLContract _paymentDataBL;

  void addPayment(int transactionId, CardPaymentRequest cardPaymentRequest) async {
    Log.printMethodStart("addPayment()", "Payment Screen -> Debit Card", "Apply");
    try {
      emit(state.copyWith(isLoading: true, loadingMessage: MessagesProvider.get('Adding payment...')));
      final response = await _paymentDataBL.addCardPayment(
          transactionId: transactionId,
          cardPaymentRequest: cardPaymentRequest
      );
      if(response.exception == null) {
        emit(state.copyWith(isLoading: false, transactionResponse: response, loadingMessage: null, cardDetails: null));
      } else {
        emit(state.copyWith(isLoading: false, transactionResponse: null, loadingMessage: null));
      }
      Log.printMethodEnd("addPayment()", "Payment Screen -> Debit Card", "Apply");
      Log.printMethodReturn("addPayment() - Debit Card payment added.", "Payment Screen -> Debit Card", "Apply");
    } on DioError catch(error) {
      final errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(isLoading: false, apiError: errorString ?? '', loadingMessage: null));
    }
  }

  void updateTransaction(TransactionResponse? response) {
    emit(state.copyWith(transactionResponse: response));
  }

  void updateBalance(double amount) {
    emit(state.copyWith(balance: amount));
  }

  void updateCardInfo(AccountDetailsData data) {
    emit(state.copyWith(cardDetails: data));
  }

  void resetCardInfo() {
    emit(state.copyWith(cardDetails: null));
  }

  void clearError() {
    emit(state.copyWith(apiError: null));
  }

  void fetchCardInfo(String cardNumber) async {
    Log.printMethodStart("fetchCardInfo()", "Payment Screen -> Debit Card", "Init");
    try {
      emit(state.copyWith(isLoading: true, loadingMessage: MessagesProvider.get('Fetching card details...')));
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();

      final customerDataBl = await CustomerDataBuilder.build(execContext!);
      final response = await customerDataBl.getCustomerAccounts(
          customerId: -1 ,
          accountNumber: cardNumber
      );
      if(response.exception == null) {
        if (response.data?[0].accountId == -1) {
          emit(state.copyWith(isLoading: false, apiError: MessagesProvider.get('Could not process a new card.'), loadingMessage: null));
        }
        if(response.data?.isNotEmpty == true) {
          Log.printMethodReturn("fetchCardInfo() - Fetch card info successful.", "Payment Screen -> Debit Card", "Init");
          emit(state.copyWith(isLoading: false, cardDetails: response.data?[0], loadingMessage: null));
        }
      }
      Log.printMethodEnd("fetchCardInfo()", "Payment Screen -> Debit Card", "Init");
    } on DioError catch(error) {
      final errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(isLoading: false, apiError: errorString ?? '', loadingMessage: null));
    }
  }

  void setPaymentDataBL(PaymentDataBLContract paymentDataBL) {
    _paymentDataBL = paymentDataBL;
  }


}