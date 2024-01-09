import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logs_data/logger.dart';
import 'package:messages_data/builder.dart';
import 'package:payment_data/builder.dart';
import 'package:payment_data/models/coupon_details/coupon_details_response.dart';
import 'package:payment_data/models/request/coupon_payment/coupon_payment_request.dart';
import 'package:payment_ui/cubits/payment_summary/voucher_screen/voucher_screen_state.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';

class VoucherScreenCubit extends Cubit<VoucherScreenState> {

  VoucherScreenCubit() : super(const VoucherScreenState());

  void updateTransaction(TransactionResponse? response) {
    emit(state.copyWith(transactionResponse: response));
  }

  void updateCouponDetails(CouponDetailsResponse? response) {
    emit(state.copyWith(couponDetails: response));
  }

  void setLoadingStatus({required bool status, String? message}) {
    emit(state.copyWith(isLoading: status, loadingMessage: message));
  }

  void setValidationError(String? validationError) {
    emit(state.copyWith(validationError: validationError));
  }

  void setTaxableStatus(bool isTaxable) {
    emit(state.copyWith(isTaxableSelected: isTaxable));
  }

  void setApiError(String? apiError) {
    emit(state.copyWith(apiError: apiError));
  }
  
  Future<void> fetchCouponInfo(String couponNumber, int payModeId) async {
    Log.printMethodStart("fetchCouponInfo()", "Payment Screen -> Voucher", "Init");
    try {
      emit(state.copyWith(isLoading: true, loadingMessage: MessagesProvider.get('Fetching coupon details...')));
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();

      final paymentDataBL = await PaymentDataBuilder.build(execContext!);
      final response = await paymentDataBL.getCouponDetails(couponNumber: couponNumber, payModeId: payModeId);
      if(response.data != null && response.data!.isNotEmpty) {
        Log.printMethodReturn("fetchCouponInfo() - Fetched coupon details.", "Payment Screen -> Voucher", "Init");
        emit(state.copyWith(isLoading: false, loadingMessage: null, couponDetails: response));
      } else {
        emit(state.copyWith(isLoading: false, transactionResponse: null, loadingMessage: null, couponDetails: null, validationError: MessagesProvider.get('Invalid or Used Coupon Number')));
      }
      Log.printMethodEnd("fetchCouponInfo()", "Payment Screen -> Voucher", "Init");
    } on DioError catch(error) {
      final errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(isLoading: false, apiError: errorString ?? '', loadingMessage: null));
    }
  }

  void addPayment(int transactionId, CouponPaymentRequest couponPaymentRequest) async {
    Log.printMethodStart("addPayment()", "Payment Screen -> Voucher", "Apply");
    try {
      emit(state.copyWith(isLoading: true, loadingMessage: MessagesProvider.get('Adding payment...')));
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();

      final paymentDataBL = await PaymentDataBuilder.build(execContext!);
      final response = await paymentDataBL.addCouponPayment(
          transactionId: transactionId,
          couponPaymentRequest: couponPaymentRequest
      );
      if(response.exception == null) {
        emit(state.copyWith(isLoading: false, transactionResponse: response, loadingMessage: null, couponDetails: null));
      } else {
        emit(state.copyWith(isLoading: false, transactionResponse: null, loadingMessage: null));
      }
      Log.printMethodStart("addPayment()", "Payment Screen -> Voucher", "Apply");
      Log.printMethodReturn("addPayment() - Added Coupon payment", "Payment Screen -> Voucher", "Apply");
    } on DioError catch(error) {
      final errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(isLoading: false, apiError: errorString ?? '', loadingMessage: null));
    }
  }


  void clear() {
    emit(const VoucherScreenState());
  }

}