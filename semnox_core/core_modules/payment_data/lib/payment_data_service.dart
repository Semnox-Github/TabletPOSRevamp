import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:payment_data/api_client/payment_api_client.dart';
import 'package:payment_data/models/coupon_details/coupon_details_response.dart';
import 'package:payment_data/models/employee_tip/employee_tip_response.dart';
import 'package:payment_data/models/request/card_payment/card_payment_request.dart';
import 'package:payment_data/models/request/cash_payment/cash_payment_request.dart';
import 'package:payment_data/models/request/complete_auth/complete_auth_request.dart';
import 'package:payment_data/models/request/complete_refund/complete_refund_request.dart';
import 'package:payment_data/models/request/complete_sale/complete_sale_request.dart';
import 'package:payment_data/models/request/complete_tip/complete_tip_request.dart';
import 'package:payment_data/models/request/coupon_payment/coupon_payment_request.dart';
import 'package:payment_data/models/request/generic_payment/generic_payment_request.dart';
import 'package:payment_data/models/request/search_transaction/transaction_search_condition.dart';
import 'package:payment_data/models/request/split_tip/split_tip_request.dart';
import 'package:payment_data/models/request/ui_argument.dart';
import 'package:payment_data/models/search_transaction/search_transaction_response.dart';
import 'package:payment_data/payment_data_bl.dart';
import 'package:transaction_data/models/create_transaction/transaction_payment_dto.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';
import 'package:payment_data/constants.dart' as constants;

class PaymentDataService {
  late PaymentApiClient _paymentApiClient;

  static final PaymentDataService _instance = PaymentDataService._internal();
  PaymentDataService._internal();

  factory PaymentDataService(PaymentApiClient apiClient) {
    _instance._paymentApiClient = apiClient;
    return _instance;
  }

  TransactionResponse? _transactionResponse;
  TransactionSearchResponse? _transactionSearchResponse;

  Future<TransactionResponse> addCashPayment({required int transactionId, required CashPaymentRequest cashPaymentRequest}) async {
    try {
      _transactionResponse = await _paymentApiClient.addCashPayment(
          transactionId, [cashPaymentRequest]);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> addGenericPayment({required int transactionId, required GenericPaymentRequest genericPaymentRequest}) async {
    try {
      _transactionResponse = await _paymentApiClient.addGenericPayment(
          transactionId, [genericPaymentRequest]);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> addCardPayment({required int transactionId, required CardPaymentRequest cardPaymentRequest}) async {
    try {
      _transactionResponse = await _paymentApiClient.addCardPayment(
          transactionId, [cardPaymentRequest]);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> startRefundPayment({required int paymentId}) async {
    try {
      _transactionResponse = await _paymentApiClient.startRefundPayment(paymentId);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> completeRefundPayment({required int paymentId, required CompleteRefundRequest completeRefundRequest}) async {
    try {
      _transactionResponse = await _paymentApiClient.completeRefundPayment(
          paymentId, completeRefundRequest);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> startTipAdjust({required int paymentId}) async {
    try {
      _transactionResponse = await _paymentApiClient.startAdjustTip(paymentId);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> completeTipAdjust({required int paymentId, required CompleteTipRequest completeTipRequest}) async {
    try {
      _transactionResponse = await _paymentApiClient.completeAdjustTip(paymentId, completeTipRequest);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionSearchResponse> searchTransactions({required TransactionSearchArguments arguments, bool shouldIncludeDate = true}) async {
    try {
      final conditions = <TransactionSearchCondition>[];

      if(arguments.transactionId != -1) {
        final trxIdCondition = TransactionSearchCondition(
          criteria: constants.AND,
          operator: constants.EQUAL_TO,
          column: constants.TRANSACTION_ID,
          parameter: arguments.transactionId.toString(),
          sortByColumn: null,
        );
        conditions.add(trxIdCondition);
      }

      if(arguments.paymentStatus != null) {
        final statusCondition = TransactionSearchCondition(
          criteria: constants.AND,
          operator: arguments.paymentStatus == 'AUTHORIZED' ? constants.IN : constants.EQUAL_TO,
          column: constants.PAYMENT_STATUS,
          parameter: arguments.paymentStatus ?? 'SETTLED',
          sortByColumn: null,
        );
        conditions.add(statusCondition);
      }

      if(shouldIncludeDate) {
        if(arguments.fromDate != null) {
          final condition = TransactionSearchCondition(
            criteria: constants.AND,
            operator: constants.GREATER_THAN_OR_EQUAL_TO,
            column: constants.TRANSACTION_DATE,
            parameter: arguments.fromDate ?? '',
            sortByColumn: null,
          );
          conditions.add(condition);
        }

        if(arguments.toDate != null) {
          final condition = TransactionSearchCondition(
            criteria: constants.AND,
            operator: constants.LESSER_THAN_OR_EQUAL_TO,
            column: constants.TRANSACTION_DATE,
            parameter: arguments.toDate ?? '',
            sortByColumn: null,
          );
          conditions.add(condition);
        }
      }

      if(arguments.paymentModeId != null) {
        final condition = TransactionSearchCondition(
          criteria: constants.AND,
          operator: constants.EQUAL_TO,
          column: constants.PAYMENT_MODE_ID,
          parameter: arguments.paymentModeId?.toString() ?? '',
          sortByColumn: null,
        );
        conditions.add(condition);
      }

      if(arguments.transactionStatus != null) {
        final condition = TransactionSearchCondition(
          criteria: constants.AND,
          operator: constants.IN,
          column: constants.TRANSACTION_STATUS,
          parameter: arguments.transactionStatus ?? '',
          sortByColumn: null,
        );
        conditions.add(condition);
      }

      _transactionSearchResponse = await _paymentApiClient.searchTransaction({
        'currentPage' : 0,
        'pageSize' : 5,
        'isAscending': true,
      }, conditions);
      return _transactionSearchResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> splitTip({required int paymentId, required List<SplitTipRequest> splitTipRequests}) async {
    try {
      _transactionResponse = await _paymentApiClient.splitTip(paymentId, splitTipRequests);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> completeSale({required int paymentId, required CompleteSaleRequest completeSaleRequest}) async {
    try {
      _transactionResponse = await _paymentApiClient.completeSale(paymentId, completeSaleRequest);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> completeAuth({required int paymentId, required CompleteAuthRequest completeAuthRequest}) async {
    try {
      _transactionResponse = await _paymentApiClient.completeAuth(paymentId, completeAuthRequest);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> completePreAuth({required int paymentId, required CompleteSaleRequest completeSaleRequest}) async {
    try {
      _transactionResponse = await _paymentApiClient.completePreAuth(paymentId, completeSaleRequest);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> updatePayments({required int transactionId, required List<TransactionPaymentDTO> payments}) async {
    try {
      _transactionResponse = await _paymentApiClient.updatePayments(
          transactionId, payments);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> startSettle({required int paymentId}) async {
    try {
      _transactionResponse = await _paymentApiClient.startSettle(paymentId);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> completeSettle({required int paymentId, required CompleteSaleRequest? completeSaleRequest}) async {
    try {
      _transactionResponse = await _paymentApiClient.completeSettle(paymentId, completeSaleRequest);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> completeSettlePayment({required int paymentId, required CompleteSaleRequest completeSaleRequest}) async {
    try {
      _transactionResponse = await _paymentApiClient.completeSettlePayment(paymentId);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<CouponDetailsResponse> getCouponDetails({required String couponNumber, required int payModeId}) async {
    final currentTime = DateTime.now().toUtc();
    final inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    final date = inputFormat.format(currentTime);
    try {
      final response = await _paymentApiClient.getCouponDetails({
        'paymentModeId': payModeId,
        'couponSetId': -1,
        'siteId': -1,
        'masterEntityId': -1,
        'buildChildRecords': true,
        'expiryDateGreaterthan': date,
        'startDateLessThan': date,
        'couponNumber': couponNumber,
      });
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> addCouponPayment({required int transactionId, required CouponPaymentRequest couponPaymentRequest}) async {
    try {
      _transactionResponse = await _paymentApiClient.addCouponPayment(
          transactionId, [couponPaymentRequest]);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<EmployeeTipResponse> getEmployeeTipDetails({required int paymentId}) async {
    try {
      final response = await _paymentApiClient.getEmployeeTipDetails(paymentId);
      return response;
    } on DioError {
      rethrow;
    }
  }
}
