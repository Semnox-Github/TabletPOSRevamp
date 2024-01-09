  import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:execution_context/execution_context_bl.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/payment_modes_container/payment_mode_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:payment_data/builder.dart';
import 'package:payment_data/ismp4_connection/ismp4_connection.dart';
import 'package:payment_data/models/request/cash_payment/cash_payment_request.dart';
import 'package:payment_data/models/request/complete_refund/complete_refund_request.dart';
import 'package:payment_data/models/request/complete_sale/complete_sale_request.dart';
import 'package:payment_data/payment_data_bl.dart';
import 'package:payment_ui/cubits/payment_summary/cash_screen/cash_screen_state.dart';
import 'package:payment_ui/cubits/payment_summary/payment_screen_state.dart';
import 'package:transaction_data/models/create_transaction/transaction_payment_dto.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';

class PaymentScreenCubit extends Cubit<PaymentScreenState> {

  PaymentScreenCubit() : super(const PaymentScreenState());

  String amountFmt = '#,##0.00';
  var authCode = '', merchId = '', retRef = '', expiry = '', currency = '';
  var customerCopy = '', merchantCopy = '';
  var token = '', approval = '', acctNo = '', cardType= '', tranCode= '', authCodeInPayment= '', userTrace = '', captureStatus = '';
  final paymentModes = <PaymentModeContainerDTO>[];

  void updateTransaction(TransactionResponse? response, {isSettleCompleted = false}) {
    emit(state.copyWith(transactionResponse: response, tenderedAmount: 0, isSettleCompleted: isSettleCompleted));
  }

  void setSelectedPayMode(PaymentModeContainerDTO? mode) {
    emit(state.copyWith(selectedPayMode: mode));
  }

  void setSelectedPayModeIndex(int index) {
    emit(state.copyWith(selectedPayModeIndex: index));
  }

  void setScreenStatus(bool isCashScreen) {
    emit(state.copyWith(isCashScreenSelected: isCashScreen));
  }

  void setLoadingStatus({required int status, String? message}) {
    emit(state.copyWith(loadingStatus: status, loadingMessage: message));
  }

  void setValidationError(String? validationError) {
    emit(state.copyWith(validationError: validationError));
  }

  void setNotificationMessage(String? message, {bool isErrorMode = false}) {
    emit(state.copyWith(notificationMessage: message, isNotificationError: isErrorMode));
  }

  void setApiError(String? apiError) {
    emit(state.copyWith(apiError: apiError));
  }

  void updateTenderAmt(double tenderAmt) {
    emit(state.copyWith(tenderedAmount: tenderAmt));
  }

  void setSideBarStatus(bool shouldShowSideBar) {
    emit(state.copyWith(shouldShowSideBar: shouldShowSideBar));
  }

  void clear() {
    emit(const PaymentScreenState());
  }

  void updateAppliedPayments(List<TransactionPaymentDTO>? payments) {
    var tenderAmt = 0.0;
    if(state.isPaymentRefreshed) {
      if(payments != null && payments.isNotEmpty) {
        final tenderAmtString = payments.last.tenderedAmount;
        tenderAmt = tenderAmtString != null ? double.parse(tenderAmtString.toString()) : 0;
      }
    }
    emit(state.copyWith(appliedPayments: payments, tenderedAmount: tenderAmt));
  }

  void filterPaymentModes(String text) {
    if(text.isNotEmpty) {
      final list = paymentModes.where((element) => element.paymentMode.toLowerCase().contains(text.toLowerCase())).toList();
      updatePaymentModes(list, searchedForPayModes: true);
    } else {
      updatePaymentModes(paymentModes, searchedForPayModes: true);
    }
  }

  void updateGlobalPaymentModes(List<PaymentModeContainerDTO> modes) {
    paymentModes.clear();
    paymentModes.addAll(modes);
  }

  void updatePaymentModes(List<PaymentModeContainerDTO> modes, {bool searchedForPayModes = false}) {
    emit(state.copyWith(searchedPaymentModes: modes, searchedForPayModes: searchedForPayModes));
  }

  void updateCurrentUserPrivileges(bool isManager) {
    emit(state.copyWith(isCurrentUserManager: isManager));
  }

  void resetRefreshPaymentStatus() {
    emit(state.copyWith(isPaymentRefreshed: false));
  }

  void togglePaymentCardSelection(int pos) {
    final selection = (state.appliedPayments?[pos].isSelected ?? false);
    final paymentDtoList = state.appliedPayments?.toList(growable: true);
    if(paymentDtoList != null) {
      final newItem = paymentDtoList[pos].copyWith(isSelected: !selection);
      paymentDtoList.removeAt(pos);
      paymentDtoList.insert(pos, newItem);
      emit(state.copyWith(appliedPayments: paymentDtoList,apiError: null));
    }
  }

  Future<bool> addPayment(int transactionId, CashPaymentRequest cashPaymentRequest) async {
    try {
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();
      final paymentDataBL = await PaymentDataBuilder.build(execContext!);
      Log.printMethodStart("addPayment()", "Sales Screen", "Init");
      final response = await paymentDataBL.addCashPayment(
          transactionId: transactionId,
          cashPaymentRequest: cashPaymentRequest
      );
      Log.printMethodEnd("addPayment()", "Sales Screen", "Init");
      Log.printMethodReturn("addPayment() - Payment added.", "Sales Screen", "Init");
      if(response.exception == null) {
        return true;
      }
      return false;
    } on DioError catch(error) {
      return false;
    }
  }

  void reverseSelectedPayments() async {
    Log.printMethodStart("reverseSelectedPayments()", "Payment Screen", "Refund Payment");
    final paymentDtoList = state.appliedPayments;
    TransactionResponse? response;
    String? errorString;
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final paymentDataBL = await PaymentDataBuilder.build(execContext);
    if(paymentDtoList != null) {
      try {
        emit(state.copyWith(loadingStatus: 1, loadingMessage: 'reversing payment'));

        await Future.forEach(paymentDtoList, (element) async {
          final status = element.paymentStatus;
          if(status == 'AUTHORIZATION_DECLINED' || status == 'REFUND_INITIATED' || status == 'REFUND_DECLINED' || status == 'SETTLEMENT_DECLINED'
              || status == 'REFUNDED' || status == 'PRE_AUTHORIZED' || status == 'SETTLEMENT_INITIATED' || status == 'VOIDED'
              || status == 'PRE_AUTHORIZATION_DECLINED' || status == 'SALE_DECLINED' || status == 'REVERSED' || status == 'SALE_INITIATED'
              || status == 'VOID_DECLINED' || status == 'PRE_AUTHORIZATION_INITIATED' || status == 'AUTHORIZATION_INITIATED' || status == 'REVERSE_DECLINED'
              || status == 'VOID_INITIATED' || status == 'ADJUSTMENT_INITIATED' || status == 'REVERSE_INITIATED') {
            setValidationError(MessagesProvider.get('&1 operation is not allowed when &2 status is &3.', ["Refund", "Payment", status]));
          } else {
            final attrList1 = element.attribute1?.toString().split('~') ?? [];
            final attrList2 = element.attribute2?.toString().split('~') ?? [];
            final attrList3 = element.attribute3?.toString().split('~') ?? [];
            final attrList4 = element.attribute4?.toString().split('~') ?? [];

            merchantCopy = element.attribute4 ?? '';
            if(attrList1.length == 5) {
              retRef = attrList1[0];
              expiry = attrList1[1];
              authCode = attrList1[2];
              merchId = attrList1[3];
              currency = attrList1[4];
            } else {
              retRef = '';expiry = '';authCode = '';merchId='';
            }
            if(attrList2.length == 4) {
              token = attrList2[0];
              approval = attrList2[1];
              acctNo = attrList2[2];
              cardType = attrList2[3];
            } else {
              token = ''; approval = ''; acctNo = '';cardType = '';
            }
            if(attrList3.length == 2) {
              tranCode = attrList3[0];
              authCodeInPayment = attrList3[1];
            } else {
              tranCode = '';authCodeInPayment='';
            }
            if(attrList4.length == 2) {
              userTrace = attrList4[0];
              captureStatus = attrList4[1];
            } else {
              userTrace='';captureStatus='';
            }

            if(element.paymentStatus == "PRE_AUTHORIZED") {
              final notificationMessage = MessagesProvider.get(
                  'pre auth payments are not allowed');
              emit(state.copyWith(notificationMessage: notificationMessage,isNotificationError: false));
            }else
            if(element.isSelected && (element.paymentModeId == 439 || element.paymentModeId  == 440) && element.paymentStatus != 'REFUNDED'){
              var inquiryResponse = await Ismp4Connection.inquiry(authCode, merchId, retRef);
              if(inquiryResponse?.statusCode == 200){
                if(jsonDecode(inquiryResponse!.body)['refundable'] == 'Y'){
                  var refundingResponse = await Ismp4Connection.refundPayment(authCode, merchId, element.amount.toString(), retRef, expiry);
                  if(refundingResponse?.statusCode == 200){
                    if(jsonDecode(refundingResponse!.body)['respstat'] == 'A'){
                      final payModeDto = await masterDataBL.getPaymentModeById(element.paymentModeId);

                      final refundResponse = await paymentDataBL.startRefundPayment(
                          paymentId: element.paymentId
                      );
                      response = refundResponse;

                      if(payModeDto?.isCreditCard == true) {
                        merchantCopy = await createReceipt(false, 'VOID', element.guid,'', element.nameOnCreditCard ?? '', acctNo, 'Chip Read', null, null, null, '${element.amount}', (element.tipReqAmt ?? element.tipAmount).toString(), '${element.amount}');
                        customerCopy = await createReceipt(true, 'VOID', element.guid, '', element.nameOnCreditCard ?? '', acctNo, 'Chip Read', null, null, null, '${element.amount}', (element.tipReqAmt ?? element.tipAmount).toString(), '${element.amount}');

                        final completeRefundRequest = CompleteRefundRequest(responseId: -1, transactionId: element.transactionId, invoiceNo: element.guid, tokenId: '', recordNo: 'A', dsixReturnCode: '000',
                            statusId: -1, textResponse: jsonDecode(refundingResponse.body)['resptext'] ?? '', acctNo: acctNo, cardType: cardType, tranCode: 'VOID', refNo: jsonDecode(refundingResponse.body)['retref'] ?? '', purchase: '', authorize: '0.00', authCode: 'REVERS', processData: '', responseOrigin: '',
                            userTraceData: userTrace, captureStatus: captureStatus, acqRefData: '', transactionDatetime: element.paymentDate, transactionPaymentGuid: element.guid, creditCardName: '', nameOnCreditCard: element.nameOnCreditCard ?? '', creditCardExpiry: element.creditCardExpiry ?? '', amount: 0, isActive: true, synchStatus: false, siteId: -1,
                            tipAmount: '', masterEntityId: -1, status: 'SUCCESS', isChanged: true, customerCopy: customerCopy, merchantCopy: merchantCopy);
                        final completeResponse = await paymentDataBL.completeRefundPayment(
                            paymentId: element.paymentId,
                            completeRefundRequest: completeRefundRequest
                        );
                        response = completeResponse;
                      }
                    }
                    else  if(jsonDecode(refundingResponse!.body)['respstat'] == 'C'){

                    }else  if(jsonDecode(refundingResponse!.body)['respstat'] == 'B'){

                    }
                  }
                }
                else if(jsonDecode(inquiryResponse.body)["voidable"] == "Y"){
                  if(status == 'SETTLED' || status == 'REFUND_DECLINED' || status == 'SETTLEMENT_DECLINED' || status == 'AUTHORIZED'
                      || status == 'REVERSE_DECLINED' || status == 'ADJUSTMENT_INITIATED' || status == 'AUTHORIZATION_DECLINED' || status == 'REVERSED'
                      || status == 'PRE_AUTHORIZATION_DECLINED' || status == 'REFUNDED' || status == 'REVERSE_INITIATED' || status == 'VOIDED'
                      || status == 'SALE_DECLINED' || status == 'VOID_INITIATED' || status == 'REFUND_INITIATED') {
                    setValidationError(MessagesProvider.get('&1 operation is not allowed when &2 status is &3.', ["Void", "Payment", status]));
                  } else {
                    var refundingResponse = await Ismp4Connection.cancelPayment(authCode, merchId, element.amount.toString(), retRef, expiry);
                    if(refundingResponse?.statusCode == 200){
                      if(jsonDecode(refundingResponse!.body)['respstat'] == 'A'){
                        final payModeDto = await masterDataBL.getPaymentModeById(element.paymentModeId);

                        final refundResponse = await paymentDataBL.startRefundPayment(
                            paymentId: element.paymentId
                        );
                        response = refundResponse;

                        if(payModeDto?.isCreditCard == true) {
                          merchantCopy = await createReceipt(false, 'VOID',  element.guid,  '', element.nameOnCreditCard ?? '', acctNo, 'Chip Read', null, null, null, '${element.amount}', (element.tipReqAmt ?? element.tipAmount).toString(), '${element.amount}');
                          customerCopy = await createReceipt(true, 'VOID',  element.guid,  '', element.nameOnCreditCard ?? '', acctNo, 'Chip Read', null, null, null, '${element.amount}', (element.tipReqAmt ?? element.tipAmount).toString(), '${element.amount}');

                          final completeRefundRequest = CompleteRefundRequest(responseId: -1, transactionId: element.transactionId, invoiceNo: element.guid, tokenId: '', recordNo: 'A', dsixReturnCode: '000',
                              statusId: -1, textResponse: jsonDecode(refundingResponse.body)['resptext'] ?? '', acctNo: acctNo, cardType: cardType, tranCode: 'VOID', refNo: jsonDecode(refundingResponse.body)['retref'] ?? '', purchase: '', authorize: '0.00', authCode: 'REVERS', processData: '', responseOrigin: '',
                              userTraceData: userTrace, captureStatus: captureStatus, acqRefData: '', transactionDatetime: element.paymentDate, transactionPaymentGuid: element.guid, creditCardName: '', nameOnCreditCard: element.nameOnCreditCard ?? '', creditCardExpiry: element.creditCardExpiry ?? '', amount: 0, isActive: true, synchStatus: false, siteId: -1,
                              tipAmount: '', masterEntityId: -1, status: 'SUCCESS', isChanged: true, customerCopy: customerCopy, merchantCopy: merchantCopy);
                          final completeResponse = await paymentDataBL.completeRefundPayment(
                              paymentId: element.paymentId,
                              completeRefundRequest: completeRefundRequest
                          );
                          response = completeResponse;
                        }
                      }
                      else  if(jsonDecode(refundingResponse!.body)['respstat'] == 'C'){

                      }else  if(jsonDecode(refundingResponse!.body)['respstat'] == 'B'){

                      }
                    }
                  }
                }

              }
            }
            else if(element.isSelected && element.paymentStatus != 'REFUNDED') {

              final payModeDto = await masterDataBL.getPaymentModeById(element.paymentModeId);

              final refundResponse = await paymentDataBL.startRefundPayment(
                  paymentId: element.paymentId
              );
              response = refundResponse;

              if(payModeDto?.isCreditCard == true) {
                final completeRefundRequest = CompleteRefundRequest(responseId: -1, transactionId: element.transactionId, invoiceNo: element.guid, tokenId: '', recordNo: '', dsixReturnCode: '000',
                    statusId: -1, textResponse: approval, acctNo: acctNo, cardType: cardType, tranCode: tranCode, refNo: retRef, purchase: '', authorize: '', authCode: authCode, processData: '', responseOrigin: '',
                    userTraceData: userTrace, captureStatus: captureStatus, acqRefData: '', transactionPaymentGuid: element.guid, creditCardName: '', nameOnCreditCard: element.nameOnCreditCard ?? '', creditCardExpiry: element.creditCardExpiry ?? '', amount: -element.amount, isActive: true, synchStatus: false, siteId: -1,
                    tipAmount: '', masterEntityId: -1, status: '', isChanged: true, customerCopy: customerCopy, merchantCopy: merchantCopy);
                final completeResponse = await paymentDataBL.completeRefundPayment(
                    paymentId: element.paymentId,
                    completeRefundRequest: completeRefundRequest
                );
                response = completeResponse;
              }
            }
          }
        });
        Log.printMethodEnd("reverseSelectedPayments()", "Payment Screen", "Refund Payment");
        Log.printMethodReturn("reverseSelectedPayments() - Refund payment successful.", "Payment Screen", "Refund Payment");
      } on DioError catch(error) {
          errorString = error.response?.data['data'] as String?;
        } finally {
          final notificationMessage = response == null ? null : MessagesProvider.get('Payment has been refunded successfully.');
          response ??= state.transactionResponse;
          emit(state.copyWith(loadingMessage: null,
              transactionResponse: response, isPaymentRefreshed: true, apiError: errorString, notificationMessage: notificationMessage, loadingStatus: 0));
        }
    }
  }

  void showLoader({String? message}) {
    emit(state.copyWith(loadingStatus: 1,loadingMessage: message));
  }

  void hideLoader() {
    emit(state.copyWith(loadingStatus: 0,loadingMessage: null));
  }

  Future<String> createReceipt(bool customerCopy,String transactionType,String invoiceNo, String authorization,String cardHolderName, String pan,
      String entryMode,String? aid, String? iad,String? tvr,String transactionAmount,String tip,String total) async {

    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    var masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    var currencySymbol = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CURRENCY_SYMBOL') ?? '';
    amountFmt = await masterDataBL.getDefaultValuesByName(defaultValueName: 'AMOUNT_FORMAT') ?? '#,##0.00';
    var sites = await masterDataBL.getSites();
    final item = sites?.data?.siteContainerDTOList.where((element) => element.siteId == execContextDTO.siteId);

    final buffer = StringBuffer('');
    buffer.write('${item?.first.siteName}\r\n'.padLeft(20, ' '));
    item?.first.siteAddress.split(',').forEach((tag) {
      buffer.write('$tag,\r\n'.padLeft(20, ' '));
    });
    buffer.write('${'Merchant ID'.padRight(20, ' ')}${': $merchId\n'}');
    buffer.write('${'Transaction Date'.padRight(20, ' ')}${': ${DateFormat('MMM-dd-yyyy hh:mm a').format(DateTime.now())}\n'}');
    buffer.write('${'Transaction Type'.padRight(20, ' ')}${': $transactionType\n'}');
    buffer.write('${'Invoice Number'.padRight(20, ' ')}${': $invoiceNo\r\n'}');
    buffer.write('${'Authorization'.padRight(20, ' ')}${': $authorization\n'}');
    buffer.write('${'Card Type'.padRight(20, ' ')}${': $userTrace\n'}');
    buffer.write('${'Cardholder Name'.padRight(20, ' ')}${': $cardHolderName\n'}');
    buffer.write('${'PAN'.padRight(20, ' ')}${': $pan\n'}');
    buffer.write('${'Entry Mode'.padRight(20, ' ')}${': $entryMode\n'}');
    if(aid != null) buffer.write('${'AID'.padRight(20, ' ')}${': $aid\n'}');
    if(iad != null) buffer.write('${'IAD'.padRight(20, ' ')}${': $iad\n'}');
    if(tvr != null) buffer.write('${'TVR'.padRight(20, ' ')}${': $tvr\n'}');
    buffer.write('${'APPROVED-000'.padLeft(20, ' ')}${'\n'}');
    buffer.write('${'TransactionAmount'.padRight(20, ' ')}${': $transactionAmount\n'}');
    if(tip == '0.0')  buffer.write('${'Tip'.padRight(20, ' ')}${': _____________\n'}');
    if(tip != '0.0') buffer.write('${'Tip'.padRight(20, ' ')}${': $tip \n'}');
    buffer.write('${'Total'.padRight(20, ' ')}${': $total\n'}');
    buffer.write('        _______________________\r\n\r\n');
    if(customerCopy) buffer.write('IMPORTANT— retain this copy for your records\r\n\r\n ');
    if(customerCopy) buffer.write('          **Cardholder Copy **\r\n');
    if(!customerCopy) buffer.write('        Signature\r\n\r\n');
    if(!customerCopy) buffer.write('I promise to pay this total subject to and in accordance with the agreement governing the use of this Card.\r\n\r\n');
    if(!customerCopy) buffer.write('For your convenience we are providing the following gratuity calculations:\r\n');
    if(!customerCopy) buffer.write('             23% is $currencySymbol ${formatAmount(0)}\r\n');
    if(!customerCopy) buffer.write('             20% is $currencySymbol ${formatAmount(0)}\r\n ');
    if(!customerCopy) buffer.write('18% is $currencySymbol 0.00\r\n\r\n\r\n');
    if(!customerCopy) buffer.write('           **Merchant Copy**\r\n');
    buffer.write('           Thank You');

    return buffer.toString();
  }

  String formatAmount(double amount) {
    final format = NumberFormat(amountFmt);
    return format.format(amount);
  }
}