import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/payment_modes_container/payment_mode_container_dto.dart';
import 'package:payment_data/builder.dart';
import 'package:payment_data/ismp4_connection/ismp4_connection.dart';
import 'package:payment_data/models/employee_tip/employee_tip_data.dart';
import 'package:payment_data/models/request/complete_sale/complete_sale_request.dart';
import 'package:payment_data/models/request/complete_tip/complete_tip_request.dart';
import 'package:payment_data/models/request/split_tip/split_tip_request.dart';
import 'package:payment_data/payment_data_bl.dart';
import 'package:master_data/master_data_bl.dart';
import 'package:payment_ui/cubits/payment_settlement/settle_screen_state.dart';
import 'package:messages_data/builder.dart';
import 'package:transaction_data/models/create_transaction/transaction_payment_dto.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';
import 'package:payment_data/models/request/ui_argument.dart';

class SettleScreenCubit extends Cubit<SettleScreenState> {

  SettleScreenCubit() : super(const SettleScreenState());

  String amountFmt = '#,##0.00';
  var authCode = '', merchId = '', retRef = '', expiry = '', currency = "";
  var customerCopy = '', merchantCopy = '';
  var token = '', approval = '', acctNo = '', cardType= '', tranCode= '', authCodeInPayment= '', userTrace = '', captureStatus = '';
  final settlementModes = <String>[];

  void setTransaction(TransactionResponse? response) {
    emit(state.copyWith(transactionResponse: response));
  }

  void setSettleScreenIndex(int index, {String selectedMode = ''}) {
    emit(state.copyWith(settleScreenIndex: index, selectedSettleMode: selectedMode));
  }

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

  void setSideBarStatus(bool shouldShowSideBar) {
    emit(state.copyWith(showSideBar: shouldShowSideBar));
  }

  void setFilterSectionStatus(bool shouldShowFilterSection) {
    emit(state.copyWith(showFilterSection: shouldShowFilterSection));
  }

  void setPaymentModes(List<PaymentModeContainerDTO> modes) {
    emit(state.copyWith(payModes: modes));
  }

  void setSettledPayments(List<TransactionPaymentDTO> payments) {
    emit(state.copyWith(settledPayments: payments));
  }

  void setAuthPayments(List<TransactionPaymentDTO> payments) {
    emit(state.copyWith(authorizedPayments: payments));
  }

  void clearExemptedPayments() {
    emit(state.copyWith(exemptedPayments: [], maxLimitTipPC: 0));
  }

  void setEditPaySwitchStatus(bool status, {bool shouldUpdateList = true}) {
    if(shouldUpdateList) {
      updateAllEditablePaymentsStatus(status);
    }
    emit(state.copyWith(editPaySwitchStatus: status));
  }

  void updateAllEditablePaymentsStatus(bool switchStatus) {
    final payments = state.editablePayments.toList(growable: true);
    for(int i=0; i<payments.length; i++) {
      payments[i] = payments[i].copyWith(isSelected: switchStatus);
    }
    emit(state.copyWith(editablePayments: payments));
  }

  void updateEditablePaymentStatus(int currentIndex, bool switchStatus) {
    final payments = state.editablePayments.toList(growable: true);
    payments[currentIndex] = payments[currentIndex].copyWith(isSelected: switchStatus);
    emit(state.copyWith(editablePayments: payments));
  }

  void updateGlobalSettleModes(List<String> list) {
    settlementModes.clear();
    settlementModes.addAll(list);
  }

  void filterSettlementModes(String text) {
    if(text.isNotEmpty) {
      final list = settlementModes.where((element) => element.toLowerCase().contains(text.toLowerCase())).toList();
      updateSettlementModes(list, searchedForSettleModes: true);
    } else {
      updateSettlementModes(settlementModes, searchedForSettleModes: true);
    }
  }

  void updateSettlementModes(List<String> modes, {bool searchedForSettleModes = false}) {
    emit(state.copyWith(searchedSettlementModes: modes, searchedForSettleModes: searchedForSettleModes));
  }


  void setTipSwitchStatus(bool status, {bool shouldUpdateList = true}) {
    if(shouldUpdateList) {
      updateAllSettledPaymentsStatus(status);
    }
    emit(state.copyWith(tipSwitchStatus: status));
  }

  void clearSwitchStatuses() {
    emit(state.copyWith(authPaymentsSwitchStatus: false, tipSwitchStatus: false, editPaySwitchStatus: false));
  }

  void setTipAddedStatus(bool status) {
    emit(state.copyWith(isTipAdded: status));
  }

  void resetSettlePaymentStatus() {
    emit(state.copyWith(isSettleCompleted: false));
  }

  Future<void> searchTransaction(TransactionSearchArguments args) async {
    Log.printMethodStart("searchTransaction()", "Payment Settlements Screen", "Search");
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final paymentDataBL = await PaymentDataBuilder.build(execContextDTO!);
    final masterDataBL = await MasterDataBuilder.build(execContextDTO);
    final list = await masterDataBL.getPaymentModes();
    final supportedPayModes = <PaymentModeContainerDTO>[]; /// pay modes with card authorization enabled
    if(list != null) {
      supportedPayModes.addAll(list.where((element) => element.allowCreditCardAuthorization));
    }
    try {
      emit(state.copyWith(loadingStatus: 1));
      final shouldIncludeDate = args.transactionId == -1;
      final transactionsResp = await paymentDataBL.searchTransactions(arguments: args, shouldIncludeDate: shouldIncludeDate);
      final transactions = transactionsResp.data;
      if(transactions != null) {

        final payments = <TransactionPaymentDTO>[];
        for (var transaction in transactions) {
          final currPayments = <TransactionPaymentDTO>[];
          if(args.paymentModeId != null) {
            if(state.settleScreenIndex == 0) {
              if(transaction.transactionStatus != 'CLOSED' && transaction.transactionStatus != 'ABANDONED' && transaction.transactionStatus != 'CANCELLED' && transaction.transactionStatus != 'REVERSED' && transaction.transactionStatus != 'REVERSE_INITIATED') {
                currPayments.addAll(transaction.transactionPaymentDTOList.where((element) => element.paymentStatusId == 29 && element.paymentStatus != 'SETTLED' && isModeSupported(supportedPayModes, element.paymentModeId)).toList(growable: true));
              }
            } else if(state.settleScreenIndex == 1) {
              if(transaction.transactionStatus != 'ABANDONED' && transaction.transactionStatus != 'CANCELLED' && transaction.transactionStatus != 'REVERSED' && transaction.transactionStatus != 'REVERSE_INITIATED') {
                currPayments.addAll(transaction.transactionPaymentDTOList.where((element) => element.paymentModeId == args.paymentModeId).toList(growable: true));
              }
            } else {
              if(transaction.transactionStatus != 'STARTED' && transaction.transactionStatus != 'ABANDONED' && transaction.transactionStatus != 'ORDERED'
                  && transaction.transactionStatus != 'PENDING_CLOSE' && transaction.transactionStatus != 'CANCELLED' && transaction.transactionStatus != 'BOOKED'
              && transaction.transactionStatus != 'CONFIRMED' && transaction.transactionStatus != 'REVERSED' && transaction.transactionStatus != 'REVERSE_INITIATED') {
                currPayments.addAll(transaction.transactionPaymentDTOList.where((element) => element.paymentModeId == args.paymentModeId).toList(growable: true));
              }
            }
          } else {
            if(state.settleScreenIndex == 0) {
              if(transaction.transactionStatus != 'CLOSED' && transaction.transactionStatus != 'ABANDONED' && transaction.transactionStatus != 'CANCELLED' && transaction.transactionStatus != 'REVERSED' && transaction.transactionStatus != 'REVERSE_INITIATED') {
                currPayments.addAll(transaction.transactionPaymentDTOList.where((element) => element.paymentStatusId == 29 && isModeSupported(supportedPayModes, element.paymentModeId)).toList(growable: true));
              }
            } else if(state.settleScreenIndex == 1) {
              if(transaction.transactionStatus != 'ABANDONED' && transaction.transactionStatus != 'CANCELLED' && transaction.transactionStatus != 'REVERSED' && transaction.transactionStatus != 'REVERSE_INITIATED') {
                currPayments.addAll(transaction.transactionPaymentDTOList.toList(growable: true));
              }
            } else {
              if(transaction.transactionStatus != 'STARTED' && transaction.transactionStatus != 'ABANDONED' && transaction.transactionStatus != 'ORDERED'
                  && transaction.transactionStatus != 'PENDING_CLOSE' && transaction.transactionStatus != 'CANCELLED' && transaction.transactionStatus != 'BOOKED'
                  && transaction.transactionStatus != 'CONFIRMED' && transaction.transactionStatus != 'REVERSED' && transaction.transactionStatus != 'REVERSE_INITIATED') {
                currPayments.addAll(transaction.transactionPaymentDTOList.toList(growable: true));
              }
            }
          }
          for(int i = 0; i < currPayments.length; i++) {
            currPayments[i] = currPayments[i].copyWith(transactionNumber: transaction.transactionNumber);
          }
          payments.addAll(currPayments);
        }

        if(state.settleScreenIndex == 0) {
          emit(state.copyWith(loadingStatus: 0, authorizedPayments: payments, showFilterSection: false, authPaymentsSwitchStatus: false, tipSwitchStatus: false, editPaySwitchStatus: false));
        } else if (state.settleScreenIndex == 1) {
          emit(state.copyWith(loadingStatus: 0, settledPayments: payments, showFilterSection: false, authPaymentsSwitchStatus: false, tipSwitchStatus: false, editPaySwitchStatus: false));
        } else {
          emit(state.copyWith(loadingStatus: 0, editablePayments: payments, showFilterSection: false, authPaymentsSwitchStatus: false, tipSwitchStatus: false, editPaySwitchStatus: false));
        }
        Log.printMethodEnd("searchTransaction()", "Payment Settlements Screen", "Search");
        Log.printMethodReturn("searchTransaction() - Transaction Search Completed.", "Payment Settlements Screen", "Search");
      }
    } on DioError catch(error) {
      final errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(loadingStatus: 0, apiError: errorString ?? '', loadingMessage: null));
    }
  }

  bool isModeSupported(List<PaymentModeContainerDTO> payModes, int payModeId) {
    for (var value in payModes) {
      if(value.paymentModeId == payModeId) {
        return true;
      }
    }
    return false;
  }

  void setAuthPaymentsSwitchStatus(bool status, {bool shouldUpdateList = true}) {
    if(shouldUpdateList) {
      updateAllAuthorizedPaymentsStatus(status);
    }
    emit(state.copyWith(authPaymentsSwitchStatus: status));
  }

  void updateAuthorizedPaymentStatus(int currentIndex, bool switchStatus) {
    final payments = state.authorizedPayments.toList(growable: true);
    payments[currentIndex] = payments[currentIndex].copyWith(isSelected: switchStatus);
    emit(state.copyWith(authorizedPayments: payments));
  }

  void updateAllAuthorizedPaymentsStatus(bool switchStatus) {
    final payments = state.authorizedPayments.toList(growable: true);
    for(int i=0; i<payments.length; i++) {
      payments[i] = payments[i].copyWith(isSelected: switchStatus);
    }
    emit(state.copyWith(authorizedPayments: payments));
  }

  void updateSettledPaymentStatus(int currentIndex, bool switchStatus) {
    final payments = state.settledPayments.toList(growable: true);
    payments[currentIndex] = payments[currentIndex].copyWith(isSelected: switchStatus);
    emit(state.copyWith(settledPayments: payments));
  }

  void updateAllSettledPaymentsStatus(bool switchStatus) {
    final payments = state.settledPayments.toList(growable: true);
    for(int i=0; i<payments.length; i++) {
      payments[i] = payments[i].copyWith(isSelected: switchStatus);
    }
    emit(state.copyWith(settledPayments: payments));
  }

  void updateTipReqAmount(int currentIndex, double amount) {
    final payments = state.settledPayments.toList(growable: true);
    payments[currentIndex] = payments[currentIndex].copyWith(tipReqAmt: amount);
    emit(state.copyWith(settledPayments: payments));
  }

  void updateTipReqAuthAmount(int currentIndex, double amount) {
    final payments = state.authorizedPayments.toList(growable: true);
    payments[currentIndex] = payments[currentIndex].copyWith(tipReqAmt: amount);
    emit(state.copyWith(authorizedPayments: payments));
  }

  Future<void> updateEmployeeTips(int currentIndex, List<EmployeeTipData> tipList, double amount) async {
    final payments = state.settledPayments.toList(growable: true);
    final paymentDTO = payments[currentIndex];
    Map<int, List<EmployeeTipData>>? map;
    if(state.employeeTips != null) {
      map = Map.from(state.employeeTips!);
    }
    map ??= <int, List<EmployeeTipData>>{};
    map[paymentDTO.paymentId] = tipList;
    payments[currentIndex] = paymentDTO.copyWith(tipReqAmt: amount);
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final paymentDataBL = await PaymentDataBuilder.build(execContextDTO!);
    final paymentRequestList = <SplitTipRequest>[];
    for (var element in tipList) {
      if(element.shouldRemoveFromBackend == false) {
        final splitTipRequest = SplitTipRequest(tipId: element.tipId ?? -1, paymentId: paymentDTO.paymentId, userId: element.userId ?? -1,
            splitByPercentage: element.splitByPercentage ?? 100, isActive: true, siteId: -1, masterEntityId: -1, isChanged: true);
        paymentRequestList.add(splitTipRequest);
      } else { /// remove added tip split from backend by setting active status to false.
        final splitTipRequest = SplitTipRequest(tipId: element.tipId ?? -1, paymentId: paymentDTO.paymentId, userId: element.userId ?? -1,
            splitByPercentage: element.splitByPercentage ?? 100, isActive: false, siteId: -1, masterEntityId: -1, isChanged: true);
        paymentRequestList.add(splitTipRequest);
      }
    }
    try {
      final resp = await paymentDataBL.splitTip(paymentId: paymentDTO.paymentId, splitTipRequests: paymentRequestList);
      emit(state.copyWith(settledPayments: payments, isTipSplitAdded: false, employeeTips: map, notificationMessage: MessagesProvider.get('Please click TIP ADJUST to save the Tip.')));
    } on DioError catch(err) {
      emit(state.copyWith(settledPayments: payments, isTipSplitAdded: false, employeeTips: map, notificationMessage: MessagesProvider.get('Please click TIP ADJUST to save the Tip.')));
    }

  }

  void resetTipSplitStatus() {
    emit(state.copyWith(isTipSplitAdded: false, employeeTips: null));
  }

  Future<void> addTip() async {
    Log.printMethodStart("addTip()", "Payment Settlements Screen -> Adjust Tip", "Tip Adjust");
    final payments = state.settledPayments.toList(growable: true);
    final checkedPayments = payments.where((element) => element.isSelected == true).toList();

    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final paymentDataBL = await PaymentDataBuilder.build(execContextDTO!);
    final masterDataBL = await MasterDataBuilder.build(execContextDTO);
    final paymentMaxLimit = await masterDataBL.getDefaultValuesByName(defaultValueName: 'MAX_TIP_AMOUNT_PERCENTAGE');
    final exemptedPayments = <TransactionPaymentDTO>[];
    final eligiblePayments = <TransactionPaymentDTO>[];
    var maxPC = 0;
    if(paymentMaxLimit != null) {
      maxPC = int.parse(paymentMaxLimit);
      for (var element in checkedPayments) {
        final tipAmt = element.tipReqAmt ?? element.tipAmount;
        final maxLimitAmt = element.amount * (maxPC / 100);
        if(tipAmt > maxLimitAmt) {
          exemptedPayments.add(element);
        } else {
          eligiblePayments.add(element);
        }
      }
    } else {
      eligiblePayments.addAll(checkedPayments);
    }

    TransactionResponse? resp;

    emit(state.copyWith(loadingStatus: 1));

    if(eligiblePayments.isNotEmpty) {

      try {
        await Future.forEach(eligiblePayments, (element) async {
          final status = element.paymentStatus;
          if(status == 'VOID_DECLINED' || status == 'SALE_INITIATED' || status == 'SETTLEMENT_INITIATED' || status == 'REVERSE_INITIATED'
              || status == 'SETTLEMENT_DECLINED' || status == 'AUTHORIZATION_INITIATED' || status == 'PRE_AUTHORIZED' || status == 'VOID_INITIATED'
              || status == 'REFUND_DECLINED' || status == 'PRE_AUTHORIZATION_INITIATED' || status == 'VOIDED' || status == 'PRE_AUTHORIZATION_DECLINED'
              || status == 'REVERSED' || status == 'AUTHORIZATION_DECLINED' || status == 'AUTHORIZED' || status == 'SALE_DECLINED'
              || status == 'REFUND_INITIATED' || status == 'REFUNDED' || status == 'REVERSE_DECLINED') {
            setValidationError(MessagesProvider.get('&1 operation is not allowed when &2 status is &3.', ["Adjust Tip", "Payment", status]));
          } else {
            final startResp = await paymentDataBL.startTipAdjust(paymentId: element.paymentId);

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

            if(element.paymentModeId == 439 || element.paymentModeId == 440) {
              print("tip amount ${element.tipReqAmt.toString()} $token");

              if(element.tipReqAmt != null && element.tipReqAmt != 0.0){
                var autherizeResponse = await Ismp4Connection.autherize(authCode, merchId, element.tipReqAmt.toString(), token, expiry, currency,"Y",);
                if(autherizeResponse?.statusCode == 200){
                  Log.i("autherization tip response ${element.tipReqAmt} ${element.tipAmount} ${autherizeResponse!.body}");
                  if(jsonDecode(autherizeResponse.body)['respstat'] == 'A') {
                    final json = jsonDecode(autherizeResponse.body);
                    final tagData = json['emvTagData'] == null ? null : jsonDecode(json['emvTagData']);
                    final acqRef = processAcqRef(json, tagData);
                    var inquiryResponse = await Ismp4Connection.inquiry(authCode, merchId, jsonDecode(autherizeResponse.body)['retref'] );
                    Log.d("inquiry response ${inquiryResponse!.body}");
                    var total = (element.tipReqAmt ?? 0) + element.amount;
                    if(inquiryResponse.statusCode == 200){
                      if((jsonDecode(inquiryResponse.body)['setlstat'] != 'Authorized') && (jsonDecode(inquiryResponse.body)['setlstat'] != 'Queued for Capture')){
                        emit(state.copyWith(loadingStatus: 0, apiError: "No further adjustment is possible on this transaction", transactionResponse: resp ?? state.transactionResponse, isSettleCompleted: false));
                      }else{
                        var captureResponse = await Ismp4Connection.capture(authCode, merchId, jsonDecode(autherizeResponse.body)['retref']);
                        Log.i("capture response ${captureResponse?.statusCode} ${captureResponse!.body}");
                        if(captureResponse.statusCode == 200){
                          final guid = startResp.data?.transactionPaymentDTOList.isNotEmpty == true ? startResp.data!.transactionPaymentDTOList.last.guid : startResp.data?.guid;
                          merchantCopy = await createReceipt(false, 'VOID', guid ?? '', jsonDecode(autherizeResponse.body)['authcode'] ?? '', element.nameOnCreditCard ?? '', acctNo, 'Chip Read', null, null, null, '${element.amount}', (element.tipReqAmt ?? element.tipAmount).toString(), '${element.amount}');
                          customerCopy = await createReceipt(true, 'VOID', guid ?? '', jsonDecode(autherizeResponse.body)['authcode'] ?? '', element.nameOnCreditCard ?? '', acctNo, 'Chip Read', null, null, null, '${element.amount}', (element.tipReqAmt ?? element.tipAmount).toString(), '${element.amount}');
                          final completeTipRequest = CompleteTipRequest(responseId: -1,
                            transactionId: startResp.data?.transactionId ?? -1,
                            invoiceNo: guid ?? '',
                            tokenId: jsonDecode(autherizeResponse.body)['token'] ?? '', recordNo: 'A',
                            dsixReturnCode: '00', statusId: -1, textResponse: jsonDecode(inquiryResponse.body)['resptext'] ?? '',
                            acctNo: acctNo, cardType: cardType, tranCode: 'CAPTURE',
                            refNo: jsonDecode(inquiryResponse.body)['retref'] ?? '',
                            purchase: element.amount.toString(), authorize: total.toString(),
                            authCode: jsonDecode(autherizeResponse.body)['authcode'] ?? '',
                            processData: jsonDecode(inquiryResponse.body)['batchid'] ?? '',
                            responseOrigin: jsonDecode(inquiryResponse.body)['authdate'] ?? '', synchStatus : false,
                            userTraceData: userTrace, captureStatus: captureStatus,
                            acqRefData:acqRef,
                            transactionPaymentGuid: guid ?? '', creditCardName: '',
                            nameOnCreditCard: element.nameOnCreditCard ?? '', creditCardExpiry: element.creditCardExpiry ?? '',
                            amount: element.amount, isActive: true, siteId: -1,
                            tipAmount: (element.tipReqAmt ?? element.tipAmount).toString(),
                            masterEntityId: -1, status: 'SUCCESS', isChanged: true, merchantCopy: merchantCopy,
                            customerCopy: customerCopy,transactionDatetime: startResp.data?.transactionDate,);
                          resp = await paymentDataBL.completeTipAdjust(paymentId: element.paymentId, completeTipRequest: completeTipRequest);

                        }
                      }
                    }
                  }
                }
              }
              else{
                final guid = startResp.data?.transactionPaymentDTOList.isNotEmpty == true ? startResp.data!.transactionPaymentDTOList.last.guid : startResp.data?.guid;

                final completeTipRequest = CompleteTipRequest(responseId: -1, transactionId: element.transactionId, statusId: -1, invoiceNo: guid ?? '', tokenId: token,  recordNo: 'A', dsixReturnCode: '000',
                    textResponse: 'Approval', acctNo: acctNo, cardType: cardType, tranCode: 'CAPTURE', refNo: retRef, purchase: '', authorize: element.amount.toString(), authCode: authCodeInPayment, processData: '', responseOrigin: '',
                    userTraceData: userTrace, captureStatus: captureStatus, acqRefData: '', transactionPaymentGuid: guid ?? '',  creditCardName: '', nameOnCreditCard: element.nameOnCreditCard ?? '', creditCardExpiry: element.creditCardExpiry ?? '', isActive: true, siteId: -1,
                    amount: element.amount, transactionDatetime: startResp.data?.transactionDate,
                    tipAmount: (element.tipReqAmt ?? element.tipAmount).toString(), masterEntityId: -1, status: 'SUCCESS', isChanged: true, merchantCopy: merchantCopy, customerCopy: customerCopy, synchStatus: false);
                resp = await paymentDataBL.completeTipAdjust(paymentId: element.paymentId, completeTipRequest: completeTipRequest);

              }

            } else {
              final completeTipRequest = CompleteTipRequest(responseId: -1, transactionId: element.transactionId, statusId: -1,
                  amount: element.amount, isActive: true, siteId: -1,synchStatus: false,
                  tipAmount: (element.tipReqAmt ?? element.tipAmount).toString(), masterEntityId: -1, isChanged: true);

              resp = await paymentDataBL.completeTipAdjust(paymentId: element.paymentId, completeTipRequest: completeTipRequest);
            }
          }
        });
        Log.printMethodEnd("addTip()", "Payment Settlements Screen -> Adjust Tip", "Tip Adjust");
        Log.printMethodReturn("addTip() - Tip adjust Successful.", "Payment Settlements Screen -> Adjust Tip", "Tip Adjust");
        emit(state.copyWith(loadingStatus: 0, transactionResponse: resp ?? state.transactionResponse, exemptedPayments: exemptedPayments, maxLimitTipPC: maxPC, isTipAdded: true));
      } on DioError catch(error) {
        final errorString = error.response?.data['data'] as String?;
        emit(state.copyWith(loadingStatus: 0, apiError: errorString ?? '', loadingMessage: null, exemptedPayments: exemptedPayments, maxLimitTipPC: maxPC));
      }
    } else {
      emit(state.copyWith(loadingStatus: 0, exemptedPayments: exemptedPayments, maxLimitTipPC: maxPC));
    }
  }

  void clearEditablePayments() {
    emit(state.copyWith(editablePayments: []));
  }

  Future<void> settleAuthPayments(List<TransactionPaymentDTO> payments) async {
    Log.printMethodStart("settleAuthPayments()", "Payment Settlements Screen -> Settle", "Settle");
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final paymentDataBL = await PaymentDataBuilder.build(execContextDTO!);
    final masterDataBL = await MasterDataBuilder.build(execContextDTO);
    final currencySymbol = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CURRENCY_SYMBOL') ?? '';
    amountFmt = await masterDataBL.getDefaultValuesByName(defaultValueName: 'AMOUNT_FORMAT') ?? '#,##0.00';
    final paymentMaxLimit = await masterDataBL.getDefaultValuesByName(defaultValueName: 'MAX_TIP_AMOUNT_PERCENTAGE');
    final exemptedPayments = <TransactionPaymentDTO>[];
    final eligiblePayments = <TransactionPaymentDTO>[];
    var maxPC = 0;

    if(paymentMaxLimit != null) {
      maxPC = int.parse(paymentMaxLimit);
      for (var element in payments) {
        final tipAmt = element.tipReqAmt ?? element.tipAmount;
        final maxLimitAmt = element.amount * (maxPC / 100);
        if(tipAmt > maxLimitAmt) {
          exemptedPayments.add(element);
        } else {
          eligiblePayments.add(element);
        }
      }
    } else {
      eligiblePayments.addAll(payments);
    }

    TransactionResponse? resp;
    emit(state.copyWith(loadingStatus: 1));

    if(eligiblePayments.isNotEmpty) {

      try {

        await Future.forEach(eligiblePayments, (element) async {
          final status = element.paymentStatus;
          if(status == 'PRE_AUTHORIZATION_DECLINED' || status == 'AUTHORIZATION_DECLINED' || status == 'REVERSE_DECLINED'
              || status == 'REVERSE_INITIATED' || status == 'VOID_DECLINED' || status == 'AUTHORIZATION_INITIATED' || status == 'ADJUSTMENT_INITIATED'
              || status == 'SETTLED' || status == 'REFUND_DECLINED' || status == 'SALE_INITIATED'
              || status == 'PRE_AUTHORIZED' || status == 'REFUNDED' || status == 'VOIDED' || status == 'SALE_DECLINED'
              || status == 'VOID_INITIATED' || status == 'REVERSED' || status == 'PRE_AUTHORIZATION_INITIATED' || status == 'REFUND_INITIATED') {
            setValidationError(MessagesProvider.get('&1 operation is not allowed when &2 status is &3.', ["Settle", "Payment", status]));
          } else {
            emit(state.copyWith(loadingStatus: 1));
            final startResp = await paymentDataBL.startSettle(paymentId: element.paymentId);

            final attrList1 = element.attribute1?.toString().split('~') ?? [];
            final attrList2 = element.attribute2?.toString().split('~') ?? [];
            final attrList3 = element.attribute3?.toString().split('~') ?? [];
            final attrList4 = element.attribute4?.toString().split('~') ?? [];

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

            if(element.paymentModeId == 439 || element.paymentModeId  == 440){

              var inquiryResponse = await Ismp4Connection.inquiry(authCode, merchId, retRef);
              if(inquiryResponse?.statusCode == 200){
                if((jsonDecode(inquiryResponse!.body)['setlstat'] != 'Authorized') && (jsonDecode(inquiryResponse.body)['setlstat'] != 'Queued for Capture')){

                  emit(state.copyWith(loadingStatus: 0, apiError: "No further adjustment is possible on this transaction", transactionResponse: resp ?? state.transactionResponse, isSettleCompleted: false));
                }else{
                  final json = jsonDecode(inquiryResponse.body);
                  final tagData = json['emvTagData'] == null ? null : jsonDecode(json['emvTagData']);
                  final acqRef = processAcqRef(json, tagData);
                  var captureResponse = await Ismp4Connection.capture(authCode, merchId, retRef);
                  if(captureResponse?.statusCode == 200){
                    var total = element.amount + (element.tipReqAmt ?? 0.0);
                    String totalAmount = total.toStringAsFixed(2);

                    print("total  $total $totalAmount ${element.tipAmount} ${element.tipReqAmt}");
                    merchantCopy = "      Test Site Test Site Daytona\r\n           250 Daytona Blvd,\r\n             Daytona Beach,\r\n                FL 32114\r\n\r\nMerchant ID          : ${jsonDecode(captureResponse!.body)['merchid'] ?? ''}\r\nTransaction Date  : ${DateFormat('MMM-dd-yyyy hh:mm a').format(DateTime.now())}\r\nTransaction Type  : CAPTURE\r\nAuthorization        : ${jsonDecode(captureResponse.body)['authcode'] ?? ''}\r\nCard Type             : $userTrace\r\nCardholder Name : ${element.nameOnCreditCard}\r\nPAN                      : 37XXXXXXXXXX1008\r\nEntry Mode           : Chip Read\r\n              APPROVED-000\r\n\r\nTransaction Amount : $currencySymbol ${element.amount}\r\n\r\nTip                             : _____________\r\n\r\nTotal                          : _____________\r\n\r\n\r\n\r\n        _______________________\r\n\r\n               Signature\r\n\r\nI promise to pay this total subject to and in accordance with the agreement governing the use of this Card.\r\n\r\nFor your convenience we are providing the following gratuity calculations:\r\n             23% is $currencySymbol 0.00\r\n             20% is $currencySymbol 0.00\r\n             18% is $currencySymbol 0.00\r\n\r\n\r\n           **Merchant Copy**\r\n                Thank You";
                    final guid = startResp.data?.transactionPaymentDTOList.isNotEmpty == true ? startResp.data!.transactionPaymentDTOList.last.guid : startResp.data?.guid;
                    merchantCopy = await createReceipt(false, 'VOID', guid ?? '', jsonDecode(captureResponse.body)['authcode'] ?? '', element.nameOnCreditCard ?? '', acctNo, 'Chip Read', null, null, null, '${element.amount}', (element.tipReqAmt ?? element.tipAmount).toString(), '${element.amount}');
                    customerCopy = await createReceipt(true, 'VOID', guid ?? '', jsonDecode(captureResponse.body)['authcode'] ?? '', element.nameOnCreditCard ?? '', acctNo, 'Chip Read', null, null, null, '${element.amount}', (element.tipReqAmt ?? element.tipAmount).toString(), '${element.amount}');

                    Log.v("\n Merchant Copy:\t$merchantCopy\n Customer Copy:\t$customerCopy");
                    final completeSaleRequest = CompleteSaleRequest(responseId: -1, transactionId: startResp.data?.transactionId ?? -1, invoiceNo: guid ?? '', tokenId: jsonDecode(captureResponse.body)['token'] ?? '', recordNo: 'A', dsixReturnCode: '000',
                        statusId: -1, textResponse: jsonDecode(captureResponse.body)['resptext'] ?? '', acctNo: acctNo, cardType: cardType, transactionDatetime: startResp.data?.transactionDate, tranCode: 'CAPTURE', refNo: jsonDecode(captureResponse.body)['retref'] ?? '', purchase: element.amount.toString(), authorize: totalAmount, authCode: jsonDecode(captureResponse.body)['authcode'] ?? '',
                        processData: '', responseOrigin:  element.paymentTransactionDTOList[0].responseId.toString() ?? '',
                        userTraceData: userTrace, captureStatus: captureStatus, acqRefData: acqRef, transactionPaymentGuid: guid ?? '', creditCardName: '', nameOnCreditCard: element.nameOnCreditCard ?? '', creditCardExpiry: element.creditCardExpiry ?? '', amount: element.amount, isActive: true, synchStatus: false, siteId: -1,
                        tipAmount:  element.tipReqAmt != null ? element.tipReqAmt.toString() : '0', masterEntityId: -1, status: 'SUCCESS', isChanged: true, merchantCopy: merchantCopy, customerCopy: customerCopy,
                        creationDate:  '0001-01-01T00:00:00', lastUpdateDate: '0001-01-01T00:00:00');
                    final paymentID = startResp.data?.transactionPaymentDTOList.isNotEmpty == true ?
                    startResp.data!.transactionPaymentDTOList.last.paymentId : -1;
                    resp = await paymentDataBL.completeSettle(
                        paymentId: paymentID,
                        completeSaleRequest: completeSaleRequest
                    );
                    emit(state.copyWith(loadingStatus: 0, transactionResponse: resp ?? state.transactionResponse, isSettleCompleted: true));
                  }

                }
              } else {
                emit(state.copyWith(loadingStatus: 0, apiError: "Something went wrong. Please try again later...", transactionResponse: resp ?? state.transactionResponse, isSettleCompleted: false));
              }
            }else{
              var total = element.amount + (element.tipReqAmt ?? 0.0);
              String totalAmount = total.toStringAsFixed(2);
              final guid = startResp.data?.transactionPaymentDTOList.isNotEmpty == true ? startResp.data!.transactionPaymentDTOList.last.guid : startResp.data?.guid;
              final completeSaleRequest = CompleteSaleRequest(responseId: -1, transactionId: startResp.data?.transactionId ?? -1, invoiceNo: guid ?? '', tokenId: '', recordNo: '', dsixReturnCode: '',
                  statusId: -1, textResponse: '', acctNo: '', cardType: '', transactionDatetime: startResp.data?.transactionDate, tranCode: '', refNo: '', purchase: element.amount.toString(), authorize: totalAmount, authCode: '', processData: '', responseOrigin: '1695368',
                  userTraceData: '', captureStatus: '', acqRefData: '', transactionPaymentGuid: guid ?? '', creditCardName: '', nameOnCreditCard: '', creditCardExpiry: '', amount: startResp.data?.transactionPaymentTotal ?? 0, isActive: true, synchStatus: false, siteId: -1,
                  tipAmount: element.tipReqAmt == null ? element.tipReqAmt.toString() : '', masterEntityId: -1, status: 'SUCCESS', isChanged: true, creationDate:  '0001-01-01T00:00:00', lastUpdateDate: '0001-01-01T00:00:00');
              final paymentID = startResp.data?.transactionPaymentDTOList.isNotEmpty == true ?
              startResp.data!.transactionPaymentDTOList.last.paymentId : -1;
              PaymentModeContainerDTO? dto = await masterDataBL.getPaymentModeById(element.paymentId);
              if(dto?.gateway != null && dto?.gateway != -1){
                resp = await paymentDataBL.completeSettle(
                    paymentId: paymentID,
                    completeSaleRequest: completeSaleRequest
                );
              }else{
                resp = await paymentDataBL.completeSettle(
                    paymentId: paymentID,
                    completeSaleRequest: null
                );
              }
              emit(state.copyWith(loadingStatus: 0, transactionResponse: resp ?? state.transactionResponse, isSettleCompleted: true));

            }
          }
        });
        Log.printMethodEnd("settleAuthPayments()", "Payment Settlements Screen -> Settle", "Settle");
        Log.printMethodReturn("settleAuthPayments() - Settle completed.", "Payment Settlements Screen -> Settle", "Settle");
      } on DioError catch(error) {
        final errorString = error.response?.data['data'] as String?;
        emit(state.copyWith(loadingStatus: 0, apiError: errorString ?? '', loadingMessage: null));
      }
    }else {
      emit(state.copyWith(loadingStatus: 0, exemptedPayments: exemptedPayments, maxLimitTipPC: maxPC));
    }
  }

  void clear() {
    emit(const SettleScreenState());
  }

  String processAcqRef(dynamic json, dynamic tagData) {
    final ref = StringBuffer();
    if(tagData == null){
      ref.write(
          'AID:|ARC:|IAD:|TSI:|TVR:|EntryMethod:${json['entrymode']}');
    }else {
      ref.write(
          'AID:${tagData['AID']}|ARC:${tagData['ARC']}|IAD:${tagData['IAD']}|TSI:${tagData['TSI']}|TVR:${tagData['TVR']}|EntryMethod:${json['entrymode']}');
    }
    return ref.toString();
  }

  Future<String> createReceipt(bool customerCopy,String transactionType,String invoiceNo, String authorization,String cardHolderName, String pan,
      String entryMode,String? aid, String? iad,String? tvr,String transactionAmount,String tip,String total) async {

    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    var masterDataBL = await MasterDataBuilder.build(execContextDTO!);
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
    if(!customerCopy) buffer.write('           **Merchant Copy**\r\n');
    buffer.write('           Thank You');

    return buffer.toString();
  }
}