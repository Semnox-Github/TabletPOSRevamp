import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:payment_data/models/request/cash_payment/cash_payment_request.dart';
import 'package:payment_data/payment_data_bl.dart';
import 'package:payment_ui/cubits/payment_summary/cash_screen/cash_screen_state.dart';
import 'package:messages_data/builder.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';

class CashScreenCubit extends Cubit<CashScreenState> {

  CashScreenCubit() : super(const CashScreenState());

  late PaymentDataBLContract _paymentDataBL;

  Future<bool> addCashPayment(int transactionId, CashPaymentRequest cashPaymentRequest) async {
    try {
      Log.printMethodStart("addCashPayment()", "Payment Screen -> Cash", "Apply");
      emit(state.copyWith(isLoading: true, loadingMessage: MessagesProvider.get('Adding payment...')));
      final response = await _paymentDataBL.addCashPayment(
          transactionId: transactionId,
          cashPaymentRequest: cashPaymentRequest
      );
      Log.printMethodEnd("addCashPayment()", "Payment Screen -> Cash", "Apply");
      Log.printMethodReturn("addCashPayment() - Cash payment added.", "Payment Screen -> Cash", "Apply");
      if(response.exception == null) {
        emit(state.copyWith(isLoading: false, transactionResponse: response, loadingMessage: null, tenderedAmount: '0.00'));
        return true;
      }
      return false;
    } on DioError catch(error) {
      final errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(isLoading: false, apiError: errorString ?? '', loadingMessage: null));
      return false;
    }
  }


  void clearError() {
    emit(state.copyWith(apiError: null));
  }

  void updateTransaction(TransactionResponse? response) {
    emit(state.copyWith(transactionResponse: response));
  }

  void setPaymentDataBL(PaymentDataBLContract paymentDataBL) {
    _paymentDataBL = paymentDataBL;
  }

  void updateSelectedDenomination(int denomination) {
    emit(state.copyWith(selectedDenomination: denomination));
  }

  void updateHundredDenominationCount(int count) {
    emit(state.copyWith(hundredDenominationCount: count));
  }

  void updateFiftyDenominationCount(int count) {
    emit(state.copyWith(fiftyDenominationCount: count));
  }

  void updateTwentyDenominationCount(int count) {
    emit(state.copyWith(twentyDenominationCount: count));
  }

  void updateTenDenominationCount(int count) {
    emit(state.copyWith(tenDenominationCount: count));
  }

  void updateFiveDenominationCount(int count) {
    emit(state.copyWith(fiveDenominationCount: count));
  }

  void updateOneDenominationCount(int count) {
    emit(state.copyWith(oneDenominationCount: count));
  }

  void updateTenderAmt(String tenderAmt) {
    emit(state.copyWith(tenderedAmount: tenderAmt));
  }

  Future<void> shouldShowTenderButton() async {
    final _execContextBL = await ExecutionContextBuilder.build();
    final _execContext = _execContextBL.getExecutionContext();
    final _masterDataBl = await MasterDataBuilder.build(_execContext!);
    final showTenderBtn = await _masterDataBl.getDefaultValuesByName(defaultValueName: "AUTO_SHOW_TENDERED_AMOUNT_KEY_PAD");
    emit(state.copyWith(shouldShowTenderButton: showTenderBtn == "Y"));
  }

}