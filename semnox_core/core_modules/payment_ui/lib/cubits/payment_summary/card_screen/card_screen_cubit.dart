import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:payment_data/models/request/card_payment/card_payment_request.dart';
import 'package:payment_data/models/request/complete_auth/complete_auth_request.dart';
import 'package:payment_data/models/request/complete_sale/complete_sale_request.dart';
import 'package:payment_data/payment_data_bl.dart';
import 'package:payment_ui/cubits/payment_summary/card_screen/card_screen_state.dart';
import 'package:messages_data/builder.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';

import 'package:payment_data/ismp4_connection/ismp4_connection.dart';
import 'package:http/http.dart' as http;

class CardScreenCubit extends Cubit<CardScreenState> {

  CardScreenCubit() : super(const CardScreenState());

  late PaymentDataBLContract _paymentDataBL;
  String amountFmt = '#,##0.00';

  void addPreAuthPayment(int transactionId, CardPaymentRequest cardPaymentRequest, {String? authResponse}) async {
    Log.printMethodStart("addPreAuthPayment()", "Payment Screen", "Apply");
    try {
      emit(state.copyWith(isLoading: true, loadingMessage: MessagesProvider.get('Adding payment...')));
      final response = await _paymentDataBL.addCardPayment(
          transactionId: transactionId,
          cardPaymentRequest: cardPaymentRequest
      );
      if(response.exception == null) {

        final execContextBL = await ExecutionContextBuilder.build();
        final execContextDTO = execContextBL.getExecutionContext();
        final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
        final currency = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CURRENCY_SYMBOL') ?? '';
        amountFmt = await masterDataBL.getDefaultValuesByName(defaultValueName: 'AMOUNT_FORMAT') ?? '#,##0.00';

        CompleteSaleRequest completeSaleRequest;
        final guid = response.data?.transactionPaymentDTOList.isNotEmpty == true ? response.data!.transactionPaymentDTOList.last.guid : response.data?.guid;
        if(authResponse != null) {
          final json = jsonDecode(authResponse);
          String approval = '';
          if(json['respstat'] == 'A') {
            approval = 'Approval';
          } else if (json['respstat'] == 'B') {
            approval = 'Retry';
          } else if (json['respstat'] == 'B') {
            approval = 'Declined';
          }
          final tagData = (cardPaymentRequest.amount == 0.0) ? null :  jsonDecode(json['emvTagData']);
          final acqRef = processAcqRef(json, tagData);
          String? tagNetwork =  tagData != null ? '${tagData['Network Label']}' : '';
          String? tagAID =  tagData != null ? '${tagData['AID']}' : '';
          String? tagIAD =  tagData != null ? '${tagData['IAD']}' : '';
          String? tagTVR =  tagData != null ? '${tagData['TVR']}' : '';
          final merchantReceipt = "      Test Site Test Site Daytona\r\n           250 Daytona Blvd,\r\n             Daytona Beach,\r\n                FL 32114\r\n\r\nMerchant ID          : ${json['merchid']}\r\nTransaction Date  : ${DateFormat('MMM-dd-yyyy hh:mm a').format(DateTime.now())}\r\nTransaction Type  : AUTHORIZATION\r\nInvoice Number    : @invoiceNo\r\nAuthorization        : ${json['authcode']}\r\nCard Type             : $tagNetwork\r\nCardholder Name : ${cardPaymentRequest.nameOnCreditCard}\r\nPAN                      : 37XXXXXXXXXX1008\r\nEntry Mode           : Chip Read\r\nAID                       : $tagAID\r\nIAD                       : $tagIAD\r\nTVR                       : $tagTVR\r\n              APPROVED-000\r\n\r\nTransaction Amount : $currency ${cardPaymentRequest.amount}\r\n\r\nTip                             : _____________\r\n\r\nTotal                          : _____________\r\n\r\n\r\n\r\n        _______________________\r\n\r\n               Signature\r\n\r\nI promise to pay this total subject to and in accordance with the agreement governing the use of this Card.\r\n\r\nFor your convenience we are providing the following gratuity calculations:\r\n             23% is $currency 0.00\r\n             20% is $currency 0.00\r\n             18% is $currency 0.00\r\n\r\n\r\n           **Merchant Copy**\r\n                Thank You";
          final customerReceipt = "      Test Site Test Site Daytona\r\n           250 Daytona Blvd,\r\n             Daytona Beach,\r\n                FL 32114\r\n\r\nMerchant ID          : ${json['merchid']}\r\nTransaction Date  : ${DateFormat('MMM-dd-yyyy hh:mm a').format(DateTime.now())}\r\nTransaction Type  : AUTHORIZATION\r\nInvoice Number    : @invoiceNo\r\nAuthorization        : ${json['authcode']}\r\nCard Type             : $tagNetwork\r\nCardholder Name : ${cardPaymentRequest.nameOnCreditCard}\r\nPAN                      : 37XXXXXXXXXX1008\r\nEntry Mode           : Chip Read\r\nAID                       : $tagAID\r\nIAD                       : $tagIAD\r\nTVR                       : $tagTVR\r\n              APPROVED-000\r\n\r\nTransaction Amount : $currency ${cardPaymentRequest.amount}\r\n\r\nTip                             : _____________\r\n\r\nTotal                          : _____________\r\n\r\n\r\nIMPORTANT— retain this copy for your records\r\n\r\n          **Cardholder Copy **\r\n                Thank You";
          final attr1 = '$customerReceipt~$merchantReceipt~$acqRef';
          final attr2 = '${json['token'] ?? ''}~$approval~${json['account'] ?? ''}~Credit~AUTHORIZATION~${json['retref'] ?? ''}~${json['authcode'] ?? ''}~${tagNetwork ?? ''}~Chip Read~$acqRef';
          completeSaleRequest = CompleteSaleRequest(responseId: -1, transactionId: response.data?.transactionId ?? -1, invoiceNo: guid ?? '', tokenId: json['token'] ?? '', recordNo: '', dsixReturnCode: '000',
              statusId: -1, textResponse: approval, acctNo: json['account'] ?? '', cardType: 'Credit', transactionDatetime: response.data?.transactionDate, tranCode: 'AUTHORIZATION', refNo: json['retref'] ?? '', purchase: '', authorize: cardPaymentRequest.amount.toString(), authCode: json['authcode'] ?? '', processData: '', responseOrigin: '',
              userTraceData: tagNetwork ?? '', captureStatus: 'Chip Read', acqRefData: acqRef, merchantCopy: merchantReceipt, customerCopy: customerReceipt, transactionPaymentGuid: guid ?? '', creditCardName: '', nameOnCreditCard: cardPaymentRequest.nameOnCreditCard ?? '', creditCardExpiry: cardPaymentRequest.creditCardExpiry ?? '', amount: cardPaymentRequest.amount, isActive: true, synchStatus: false, siteId: -1,
              tipAmount: '', masterEntityId: -1, status: 'SUCCESS', isChanged: true,);
        } else {
          completeSaleRequest = CompleteSaleRequest(responseId: -1, transactionId: response.data?.transactionId ?? -1, invoiceNo: guid ?? '', tokenId: '', recordNo: '', dsixReturnCode: '',
              statusId: -1, textResponse: '', acctNo: '', cardType: '', transactionDatetime: response.data?.transactionDate, tranCode: '', refNo: '', purchase: '', authorize: '', authCode: '', processData: '', responseOrigin: '',
              userTraceData: '', captureStatus: '', acqRefData: '', transactionPaymentGuid: guid ?? '', creditCardName: '', nameOnCreditCard: cardPaymentRequest.nameOnCreditCard ?? '', creditCardExpiry: cardPaymentRequest.creditCardExpiry ?? '', amount: cardPaymentRequest.amount, isActive: true, synchStatus: false, siteId: -1,
              tipAmount: '', masterEntityId: -1, status: 'SUCCESS', isChanged: true);
        }

        final paymentID = response.data?.transactionPaymentDTOList.isNotEmpty == true ?
        response.data!.transactionPaymentDTOList.last.paymentId : -1;
        final completeSaleResponse = await _paymentDataBL.completePreAuth(
            paymentId: paymentID,
            completeSaleRequest: completeSaleRequest
        );
        if(completeSaleResponse.exception == null) {
          emit(state.copyWith(isLoading: false,  transactionResponse: completeSaleResponse, loadingMessage: null));
        } else {
          emit(state.copyWith(isLoading: false, transactionResponse: response, loadingMessage: null));
        }
      } else {
        emit(state.copyWith(isLoading: false, transactionResponse: null, loadingMessage: null));
      }
      Log.printMethodEnd("addPreAuthPayment()", "Payment Screen", "Apply");
      Log.printMethodReturn("addPreAuthPayment() - Pre-Auth payment added.", "Payment Screen", "Apply");
    } on DioError catch(error) {
      final errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(isLoading: false, apiError: errorString ?? '', loadingMessage: null));
    }
  }

  void addAuthPayment(int transactionId, CardPaymentRequest cardPaymentRequest, {String? authResponse}) async {
    Log.printMethodStart("addAuthPayment()", "Payment Screen", "Apply");
    try {
      emit(state.copyWith(isLoading: true, loadingMessage: MessagesProvider.get('Adding payment...')));
      final response = await _paymentDataBL.addCardPayment(
          transactionId: transactionId,
          cardPaymentRequest: cardPaymentRequest
      );
      if(response.exception == null) {
        final execContextBL = await ExecutionContextBuilder.build();
        final execContextDTO = execContextBL.getExecutionContext();
        final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
        final currency = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CURRENCY_SYMBOL') ?? '';

        CompleteSaleRequest completeSaleRequest;
        final guid = response.data?.transactionPaymentDTOList.isNotEmpty == true ? response.data!.transactionPaymentDTOList.last.guid : response.data?.guid;
        if(authResponse != null) {
          final json = jsonDecode(authResponse);
          String approval = '';
          if(json['respstat'] == 'A') {
            approval = 'Approval';
          } else if (json['respstat'] == 'B') {
            approval = 'Retry';
          } else if (json['respstat'] == 'B') {
            approval = 'Declined';
          }
          final tagData =  json['emvTagData'] == null ? null : jsonDecode(json['emvTagData']);
          String? tagNetwork =  tagData != null ? '${tagData['Network Label']}' : '';
          String? tagAID =  tagData != null ? '${tagData['AID']}' : '';
          String? tagIAD =  tagData != null ? '${tagData['IAD']}' : '';
          String? tagTVR =  tagData != null ? '${tagData['TVR']}' : '';
          final acqRef = processAcqRef(json, tagData);
          final merchantReceipt = "      Test Site Test Site Daytona\r\n           250 Daytona Blvd,\r\n             Daytona Beach,\r\n                FL 32114\r\n\r\nMerchant ID          : ${json['merchid']}\r\nTransaction Date  : ${DateFormat('MMM-dd-yyyy hh:mm a').format(DateTime.now())}\r\nTransaction Type  : AUTHORIZATION\r\nInvoice Number    : @invoiceNo\r\nAuthorization        : ${json['authcode']}\r\nCard Type             : ${tagNetwork}\r\nCardholder Name : ${cardPaymentRequest.nameOnCreditCard}\r\nPAN                      : 37XXXXXXXXXX1008\r\nEntry Mode           : Chip Read\r\nAID                       : ${tagAID}\r\nIAD                       : ${tagIAD}\r\nTVR                       : ${tagTVR}\r\n              APPROVED-000\r\n\r\nTransaction Amount : $currency ${cardPaymentRequest.amount}\r\n\r\nTip                             : _____________\r\n\r\nTotal                          : _____________\r\n\r\n\r\n\r\n        _______________________\r\n\r\n               Signature\r\n\r\nI promise to pay this total subject to and in accordance with the agreement governing the use of this Card.\r\n\r\nFor your convenience we are providing the following gratuity calculations:\r\n             23% is $currency 0.00\r\n             20% is $currency 0.00\r\n             18% is $currency 0.00\r\n\r\n\r\n           **Merchant Copy**\r\n                Thank You";
          final customerReceipt = "      Test Site Test Site Daytona\r\n           250 Daytona Blvd,\r\n             Daytona Beach,\r\n                FL 32114\r\n\r\nMerchant ID          : ${json['merchid']}\r\nTransaction Date  : ${DateFormat('MMM-dd-yyyy hh:mm a').format(DateTime.now())}\r\nTransaction Type  : AUTHORIZATION\r\nInvoice Number    : @invoiceNo\r\nAuthorization        : ${json['authcode']}\r\nCard Type             : ${tagNetwork}\r\nCardholder Name : ${cardPaymentRequest.nameOnCreditCard}\r\nPAN                      : 37XXXXXXXXXX1008\r\nEntry Mode           : Chip Read\r\nAID                       : ${tagAID}\r\nIAD                       : ${tagIAD}\r\nTVR                       : ${tagTVR}\r\n              APPROVED-000\r\n\r\nTransaction Amount : $currency ${cardPaymentRequest.amount}\r\n\r\nTip                             : _____________\r\n\r\nTotal                          : _____________\r\n\r\n\r\nIMPORTANT— retain this copy for your records\r\n\r\n          **Cardholder Copy **\r\n                Thank You";
          completeSaleRequest = CompleteSaleRequest(responseId: -1, transactionId: response.data?.transactionId ?? -1, invoiceNo: guid ?? '', tokenId: json['token'] ?? '', recordNo: '', dsixReturnCode: '000',
              statusId: -1, textResponse: approval, acctNo: json['account'] ?? '', cardType: 'Credit', transactionDatetime: response.data?.transactionDate, tranCode: 'AUTHORIZATION', refNo: json['retref'] ?? '', purchase: '', authorize: cardPaymentRequest.amount.toString() ?? '0', authCode: json['authcode'] ?? '', processData: '', responseOrigin: '',
              userTraceData: tagNetwork, captureStatus: 'Chip Read', acqRefData: acqRef, merchantCopy: merchantReceipt, customerCopy: customerReceipt, transactionPaymentGuid: guid ?? '', creditCardName: '', nameOnCreditCard: cardPaymentRequest.nameOnCreditCard ?? '', creditCardExpiry: cardPaymentRequest.creditCardExpiry ?? '', amount: cardPaymentRequest.amount, isActive: true, synchStatus: false, siteId: -1,
              tipAmount: '', masterEntityId: -1, status: 'SUCCESS', isChanged: true);
        } else {
          completeSaleRequest = CompleteSaleRequest(responseId: -1, transactionId: response.data?.transactionId ?? -1, invoiceNo: guid ?? '', tokenId: '', recordNo: '', dsixReturnCode: '',
              statusId: -1, textResponse: '', acctNo: '', cardType: '', transactionDatetime: response.data?.transactionDate, tranCode: '', refNo: '', purchase: '', authorize: '', authCode: '', processData: '', responseOrigin: '',
              userTraceData: '', captureStatus: '', acqRefData: '', transactionPaymentGuid: guid ?? '', creditCardName: '', nameOnCreditCard: cardPaymentRequest.nameOnCreditCard ?? '', creditCardExpiry: cardPaymentRequest.creditCardExpiry ?? '', amount: cardPaymentRequest.amount, isActive: true, synchStatus: false, siteId: -1,
              tipAmount: '', masterEntityId: -1, status: 'SUCCESS', isChanged: true);
        }
        final authRequest = CompleteAuthRequest(paymentTransactionDTO: completeSaleRequest);

        final paymentID = response.data?.transactionPaymentDTOList.isNotEmpty == true ?
        response.data!.transactionPaymentDTOList.last.paymentId : -1;
        final completeSaleResponse = await _paymentDataBL.completeAuth(
            paymentId: paymentID,
            completeAuthRequest: authRequest
        );
        if(completeSaleResponse.exception == null) {
          emit(state.copyWith(isLoading: false,  transactionResponse: completeSaleResponse, loadingMessage: null));
        } else {
          emit(state.copyWith(isLoading: false, transactionResponse: response, loadingMessage: null));
        }
      } else {
        emit(state.copyWith(isLoading: false, transactionResponse: null, loadingMessage: null));
      }
      Log.printMethodEnd("addAuthPayment()", "Payment Screen", "Apply");
      Log.printMethodReturn("addAuthPayment() - Auth payment added", "Payment Screen", "Apply");
    } on DioError catch(error) {
      final errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(isLoading: false, apiError: errorString ?? '', loadingMessage: null));
    }
  }

  void addCardPayment(int transactionId, CardPaymentRequest cardPaymentRequest, {String? authResponse}) async {
    Log.printMethodStart("addCardPayment()", "Payment Screen", "Apply");
    try {
      emit(state.copyWith(isLoading: true, loadingMessage: MessagesProvider.get('Adding payment...')));
      final response = await _paymentDataBL.addCardPayment(
          transactionId: transactionId,
          cardPaymentRequest: cardPaymentRequest
      );
      if(response.exception == null) {
        final execContextBL = await ExecutionContextBuilder.build();
        final execContextDTO = execContextBL.getExecutionContext();
        final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
        final currency = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CURRENCY_SYMBOL') ?? '';

        CompleteSaleRequest completeSaleRequest;
        final guid = response.data?.transactionPaymentDTOList.isNotEmpty == true ? response.data!.transactionPaymentDTOList.last.guid : response.data?.guid;
        if(authResponse != null) {
          final json = jsonDecode(authResponse);
          String approval = '';
          if(json['respstat'] == 'A') {
            approval = 'Approval';
          } else if (json['respstat'] == 'B') {
            approval = 'Retry';
          } else if (json['respstat'] == 'B') {
            approval = 'Declined';
          }
          final tagData = json['emvTagData'] == null ? null : jsonDecode(json['emvTagData']);
          String? tagNetwork =  tagData != null ? '${tagData['Network Label']}' : '';
          String? tagAID =  tagData != null ? '${tagData['AID']}' : '';
          String? tagIAD =  tagData != null ? '${tagData['IAD']}' : '';
          String? tagTVR =  tagData != null ? '${tagData['TVR']}' : '';
          final acqRef = processAcqRef(json, tagData);
          final merchantReceipt = "      Test Site Test Site Daytona\r\n           250 Daytona Blvd,\r\n             Daytona Beach,\r\n                FL 32114\r\n\r\nMerchant ID          : ${json['merchid']}\r\nTransaction Date  : ${DateFormat('MMM-dd-yyyy hh:mm a').format(DateTime.now())}\r\nTransaction Type  : AUTHORIZATION\r\nInvoice Number    : @invoiceNo\r\nAuthorization        : ${json['authcode']}\r\nCard Type             : ${tagNetwork}\r\nCardholder Name : ${cardPaymentRequest.nameOnCreditCard}\r\nPAN                      : 37XXXXXXXXXX1008\r\nEntry Mode           : Chip Read\r\nAID                       : ${tagAID}\r\nIAD                       : ${tagIAD}\r\nTVR                       : ${tagTVR}\r\n              APPROVED-000\r\n\r\nTransaction Amount : $currency ${cardPaymentRequest.amount}\r\n\r\nTip                             : _____________\r\n\r\nTotal                          : _____________\r\n\r\n\r\n\r\n        _______________________\r\n\r\n               Signature\r\n\r\nI promise to pay this total subject to and in accordance with the agreement governing the use of this Card.\r\n\r\nFor your convenience we are providing the following gratuity calculations:\r\n             23% is $currency 0.00\r\n             20% is $currency 0.00\r\n             18% is $currency 0.00\r\n\r\n\r\n           **Merchant Copy**\r\n                Thank You";
          final customerReceipt = "      Test Site Test Site Daytona\r\n           250 Daytona Blvd,\r\n             Daytona Beach,\r\n                FL 32114\r\n\r\nMerchant ID          : ${json['merchid']}\r\nTransaction Date  : ${DateFormat('MMM-dd-yyyy hh:mm a').format(DateTime.now())}\r\nTransaction Type  : AUTHORIZATION\r\nInvoice Number    : @invoiceNo\r\nAuthorization        : ${json['authcode']}\r\nCard Type             : ${tagNetwork}\r\nCardholder Name : ${cardPaymentRequest.nameOnCreditCard}\r\nPAN                      : 37XXXXXXXXXX1008\r\nEntry Mode           : Chip Read\r\nAID                       : ${tagAID}\r\nIAD                       : ${tagIAD}\r\nTVR                       : ${tagTVR}\r\n              APPROVED-000\r\n\r\nTransaction Amount : $currency ${cardPaymentRequest.amount}\r\n\r\nTip                             : _____________\r\n\r\nTotal                          : _____________\r\n\r\n\r\nIMPORTANT— retain this copy for your records\r\n\r\n          **Cardholder Copy **\r\n                Thank You";
          completeSaleRequest = CompleteSaleRequest(responseId: -1, transactionId: response.data?.transactionId ?? -1, invoiceNo: guid ?? '', tokenId: json['token'] ?? '', recordNo: '', dsixReturnCode: '000',
              statusId: -1, textResponse: approval, acctNo: json['account'] ?? '', cardType: 'Credit', transactionDatetime: response.data?.transactionDate, tranCode: 'AUTHORIZATION', refNo: json['retref'] ?? '', purchase: '', authorize: cardPaymentRequest.amount.toString(), authCode: json['authcode'] ?? '', processData: '', responseOrigin: '',
              userTraceData: tagNetwork, captureStatus: 'Chip Read', acqRefData: acqRef, merchantCopy: merchantReceipt, customerCopy: customerReceipt, transactionPaymentGuid: guid ?? '', creditCardName: '', nameOnCreditCard: cardPaymentRequest.nameOnCreditCard ?? '', creditCardExpiry: cardPaymentRequest.creditCardExpiry ?? '', amount: cardPaymentRequest.amount, isActive: true, synchStatus: false, siteId: -1,
              tipAmount: '', masterEntityId: -1, status: 'SUCCESS', isChanged: true);
        } else {
          completeSaleRequest = CompleteSaleRequest(responseId: -1, transactionId: response.data?.transactionId ?? -1, invoiceNo: guid ?? '', tokenId: '', recordNo: '', dsixReturnCode: '',
              statusId: -1, textResponse: '', acctNo: '', cardType: '', transactionDatetime: response.data?.transactionDate, tranCode: '', refNo: '', purchase: '', authorize: '', authCode: '', processData: '', responseOrigin: '',
              userTraceData: '', captureStatus: '', acqRefData: '', transactionPaymentGuid: guid ?? '', creditCardName: '', nameOnCreditCard: cardPaymentRequest.nameOnCreditCard ?? '', creditCardExpiry: cardPaymentRequest.creditCardExpiry ?? '', amount: cardPaymentRequest.amount, isActive: true, synchStatus: false, siteId: -1,
              tipAmount: '', masterEntityId: -1, status: 'SUCCESS', isChanged: true);
        }

        final paymentID = response.data?.transactionPaymentDTOList.isNotEmpty == true ?
        response.data!.transactionPaymentDTOList.last.paymentId : -1;
        final completeSaleResponse = await _paymentDataBL.completeSale(
            paymentId: paymentID,
            completeSaleRequest: completeSaleRequest
        );
        if(completeSaleResponse.exception == null) {
          emit(state.copyWith(isLoading: false, transactionResponse: completeSaleResponse, loadingMessage: null));
        } else {
          emit(state.copyWith(isLoading: false, transactionResponse: response, loadingMessage: null));
        }
      } else {
        emit(state.copyWith(isLoading: false, transactionResponse: null, loadingMessage: null));
      }
      Log.printMethodEnd("addCardPayment()", "Payment Screen", "Apply");
      Log.printMethodReturn("addCardPayment() - Settle payment added", "Payment Screen", "Apply");
    } on DioError catch(error) {
      final errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(isLoading: false, apiError: errorString ?? '', loadingMessage: null));
    }
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

  void clearError() {
    emit(state.copyWith(apiError: null));
  }

  void updateTransaction(TransactionResponse? response) {
    emit(state.copyWith(transactionResponse: response));
  }

  void setPaymentDataBL(PaymentDataBLContract paymentDataBL) {
    _paymentDataBL = paymentDataBL;
  }

  Future<http.Response?> connectISMP4device(String auth, String merchantId, String hsn) async {
    Log.printMethodStart("connectISMP4device()", "Payment Screen", "Apply");
    emit(state.copyWith(isLoading: true, loadingMessage: MessagesProvider.get('Connecting to ISMP4 terminal...')));
    var response = await Ismp4Connection.establishConnection(auth,merchantId,hsn);
    if(response?.statusCode == 200){
      Log.printMethodReturn("connectISMP4device() - connected successfully.", "Payment Screen", "Apply");
      emit(state.copyWith(isLoading: true, loadingMessage: null));
    }else{
      Log.printMethodReturn("connectISMP4device() - connection failed.", "Payment Screen", "Apply");
      emit(state.copyWith(isLoading: true, apiError: 'Connection failed', loadingMessage: null));
    }
    Log.printMethodEnd("connectISMP4device()", "Payment Screen", "Apply");
    return response;
  }

  String formatAmount(double amount) {
    final format = NumberFormat(amountFmt);
    return format.format(amount);
  }
}