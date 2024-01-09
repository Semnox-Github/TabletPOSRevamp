import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/models/payment_modes_container/payment_mode_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:payment_data/builder.dart';
import 'package:payment_data/models/request/ui_argument.dart';
import 'package:payment_ui/cubits/payment_settlement/edit_payment/edit_payment_state.dart';
import 'package:transaction_data/models/create_transaction/transaction_payment_dto.dart';

class EditPaymentCubit extends Cubit<EditPaymentState> {

  EditPaymentCubit() : super(const EditPaymentState());

  void setLoadingStatus({required int status, String? message}) {
    emit(state.copyWith(loadingStatus: status, loadingMessage: message));
  }

  void setValidationError(String? validationError) {
    emit(state.copyWith(validationError: validationError));
  }

  void setNotificationMessage(String? message) {
    emit(state.copyWith(notificationMessage: message));
  }

  void setApiError(String? apiError) {
    emit(state.copyWith(apiError: apiError));
  }

  void clearEditCompleteStatus() {
    emit(state.copyWith(isEditCompleted: false));
  }

  void clear() {
    emit(const EditPaymentState());
  }

  void setPaymentModes(List<PaymentModeContainerDTO> payModeList) {
    emit(state.copyWith(compatiblePayModes: payModeList));
  }

  void setEditablePayments(List<TransactionPaymentDTO> payments) {
    emit(state.copyWith(editablePayments: payments));
  }

  void updateEditablePaymentStatus(int currentIndex, bool status) {
    final payments = state.editablePayments.toList(growable: true);
    payments[currentIndex] = payments[currentIndex].copyWith(isSelected: status);
    emit(state.copyWith(editablePayments: payments));
  }


  void setEditSwitchStatus(bool status, {bool shouldUpdateList = true}) {
    if(shouldUpdateList) {
      updateAllEditablePaymentsStatus(status);
    }
    emit(state.copyWith(editSwitchStatus: status));
  }

  void updateAllEditablePaymentsStatus(bool switchStatus) {
    final payments = state.editablePayments.toList(growable: true);
    for(int i=0; i<payments.length; i++) {
      payments[i] = payments[i].copyWith(isSelected: switchStatus);
    }
    emit(state.copyWith(editablePayments: payments));
  }

  Future<void> updatePayments(List<TransactionPaymentDTO> editablePayments, EditPaymentArguments args) async {
    Log.printMethodStart("updatePayments()", "Payment Settlements Screen -> Edit Payments", "Confirm");
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final paymentDataBL = await PaymentDataBuilder.build(execContextDTO!);
    final payMap = <int, List<TransactionPaymentDTO>>{};
    var trxId = '';
    try {
      for (var payment in editablePayments) {
        final list = editablePayments.where((element) => element.transactionId == payment.transactionId).toList();
        final updatedList = <TransactionPaymentDTO>[];
        if(list.isNotEmpty) {
          for (var item in list) {
            final status = item.paymentStatus;
            if(status == 'ADJUSTMENT_INITIATED' || status == 'REFUND_DECLINED' || status == 'REVERSE_DECLINED' || status == 'PRE_AUTHORIZED'
            || status == 'AUTHORIZED' || status == 'REFUND_INITIATED' || status == 'PRE_AUTHORIZATION_DECLINED' || status == 'SALE_INITIATED'
            || status == 'SETTLEMENT_INITIATED' || status == 'REVERSED' || status == 'SETTLEMENT_DECLINED' || status == 'SALE_DECLINED'
            || status == 'AUTHORIZATION_DECLINED' || status == 'REFUNDED' || status == 'REVERSE_INITIATED' || status == 'VOID_DECLINED'
            || status == 'VOIDED' || status == 'AUTHORIZATION_INITIATED' || status == 'PRE_AUTHORIZATION_INITIATED' || status == 'VOID_INITIATED') {
              setValidationError(MessagesProvider.get('&1 operation is not allowed when &2 status is &3.', ["Edit Payment", "Payment", status]));
            } else {
              updatedList.add(
                  item.copyWith(
                    paymentModeId: args.compatiblePayModeId,
                    reference: args.reference ?? item.reference,
                    creditCardName: args.creditCardName ?? item.creditCardNumber,
                    nameOnCreditCard: args.nameOnCreditCard ?? item.nameOnCreditCard,
                    creditCardNumber: args.cardNumber ?? item.creditCardNumber,
                    creditCardAuthorization: args.authorization ?? item.creditCardAuthorization,
                    isChanged: true,
                    isChangedRecursive: true,
                  )
              );
            }
          }
          payMap[payment.transactionId] = updatedList;
        }
      }

      emit(state.copyWith(loadingStatus: 1, loadingMessage: MessagesProvider.get('Updating Payments...')));

      await Future.forEach(payMap.entries, (entry) async {
        await Future.forEach(editablePayments, (innerPayment) async {
          trxId = entry.key.toString();
          final transactionsResp = await paymentDataBL.updatePayments(transactionId: entry.key, payments: entry.value);
        });
      });
      Log.printMethodEnd("updatePayments()", "Payment Settlements Screen -> Edit Payments", "Confirm");
      Log.printMethodReturn("updatePayments() - Edit Payment Successful.", "Payment Settlements Screen -> Edit Payments", "Confirm");
      emit(state.copyWith(loadingStatus: 0, isEditCompleted: true, loadingMessage: null));
    } on DioError catch(error) {
      final errorString = error.response?.data['data'] as String?;
      final errorMsg = 'Trxn Id: $trxId Message: $errorString';
      emit(state.copyWith(loadingStatus: 0, apiError: errorMsg ?? '', loadingMessage: null));
    }
  }


}