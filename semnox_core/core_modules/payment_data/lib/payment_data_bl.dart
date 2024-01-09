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
import 'package:payment_data/models/request/split_tip/split_tip_request.dart';
import 'package:payment_data/models/request/ui_argument.dart';
import 'package:payment_data/models/search_transaction/search_transaction_response.dart';
import 'package:payment_data/payment_data_service.dart';
import 'package:transaction_data/models/create_transaction/transaction_payment_dto.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';


abstract class PaymentDataBLContract {
  Future<TransactionResponse> addCashPayment({required int transactionId, required CashPaymentRequest cashPaymentRequest});
  Future<TransactionResponse> addGenericPayment({required int transactionId, required GenericPaymentRequest genericPaymentRequest});
  Future<TransactionResponse> addCardPayment({required int transactionId, required CardPaymentRequest cardPaymentRequest});
  Future<TransactionResponse> completeSale({required int paymentId, required CompleteSaleRequest completeSaleRequest});
  Future<TransactionResponse> completePreAuth({required int paymentId, required CompleteSaleRequest completeSaleRequest});
  Future<TransactionResponse> completeAuth({required int paymentId, required CompleteAuthRequest completeAuthRequest});
  Future<TransactionResponse> startRefundPayment({required int paymentId});
  Future<TransactionResponse> completeRefundPayment({required int paymentId, required CompleteRefundRequest completeRefundRequest});
  Future<TransactionResponse> startSettle({required int paymentId});
  Future<TransactionResponse> completeSettle({required int paymentId, required CompleteSaleRequest? completeSaleRequest});
  Future<TransactionResponse> completeSettlePayment({required int paymentId, required CompleteSaleRequest completeSaleRequest});
  Future<TransactionResponse> startTipAdjust({required int paymentId});
  Future<TransactionResponse> completeTipAdjust({required int paymentId, required CompleteTipRequest completeTipRequest});
  Future<TransactionResponse> splitTip({required int paymentId, required List<SplitTipRequest> splitTipRequests});
  Future<TransactionSearchResponse> searchTransactions({required TransactionSearchArguments arguments, bool shouldIncludeDate = true});
  Future<TransactionResponse> updatePayments({required int transactionId, required List<TransactionPaymentDTO> payments});
  Future<CouponDetailsResponse> getCouponDetails({required String couponNumber, required int payModeId});
  Future<TransactionResponse> addCouponPayment({required int transactionId, required CouponPaymentRequest couponPaymentRequest});
  Future<EmployeeTipResponse> getEmployeeTipDetails({required int paymentId});
}

class PaymentDataBLImpl implements PaymentDataBLContract {

  final PaymentDataService _paymentDataService;


  PaymentDataBLImpl(this._paymentDataService);

  @override
  Future<TransactionResponse> addCashPayment({required int transactionId, required CashPaymentRequest cashPaymentRequest}) {
    return _paymentDataService.addCashPayment(transactionId: transactionId, cashPaymentRequest: cashPaymentRequest);
  }

  @override
  Future<TransactionResponse> addGenericPayment({required int transactionId, required GenericPaymentRequest genericPaymentRequest}) {
    return _paymentDataService.addGenericPayment(transactionId: transactionId, genericPaymentRequest: genericPaymentRequest);
  }

  @override
  Future<TransactionResponse> addCardPayment({required int transactionId, required CardPaymentRequest cardPaymentRequest}) {
    return _paymentDataService.addCardPayment(transactionId: transactionId, cardPaymentRequest: cardPaymentRequest);
  }

  @override
  Future<TransactionResponse> startRefundPayment({required int paymentId}) {
    return _paymentDataService.startRefundPayment(paymentId: paymentId);
  }

  @override
  Future<TransactionResponse> completeRefundPayment({required int paymentId, required CompleteRefundRequest completeRefundRequest}) {
    return _paymentDataService.completeRefundPayment(paymentId: paymentId, completeRefundRequest: completeRefundRequest);
  }

  @override
  Future<TransactionResponse> startTipAdjust({required int paymentId}) {
    return _paymentDataService.startTipAdjust(paymentId: paymentId);
  }

  @override
  Future<TransactionResponse> completeTipAdjust({required int paymentId, required CompleteTipRequest completeTipRequest}) {
    return _paymentDataService.completeTipAdjust(paymentId: paymentId, completeTipRequest: completeTipRequest);
  }

  @override
  Future<TransactionSearchResponse> searchTransactions({required TransactionSearchArguments arguments, bool shouldIncludeDate = true}) {
    return _paymentDataService.searchTransactions(arguments: arguments, shouldIncludeDate: shouldIncludeDate);
  }

  @override
  Future<TransactionResponse> splitTip({required int paymentId, required List<SplitTipRequest> splitTipRequests}) {
    return _paymentDataService.splitTip(paymentId: paymentId, splitTipRequests: splitTipRequests);
  }

  @override
  Future<TransactionResponse> completeSale({required int paymentId, required CompleteSaleRequest completeSaleRequest}) {
    return _paymentDataService.completeSale(paymentId: paymentId, completeSaleRequest: completeSaleRequest);
  }

  @override
  Future<TransactionResponse> completeAuth({required int paymentId, required CompleteAuthRequest completeAuthRequest}) {
    return _paymentDataService.completeAuth(paymentId: paymentId, completeAuthRequest: completeAuthRequest);
  }

  @override
  Future<TransactionResponse> completePreAuth({required int paymentId, required CompleteSaleRequest completeSaleRequest}) {
    return _paymentDataService.completePreAuth(paymentId: paymentId, completeSaleRequest: completeSaleRequest);
  }

  @override
  Future<TransactionResponse> updatePayments({required int transactionId, required List<TransactionPaymentDTO> payments}) {
    return _paymentDataService.updatePayments(transactionId: transactionId, payments: payments);
  }

  @override
  Future<TransactionResponse> startSettle({required int paymentId}) {
    return _paymentDataService.startSettle(paymentId: paymentId);
  }

  @override
  Future<TransactionResponse> completeSettle({required int paymentId, required CompleteSaleRequest? completeSaleRequest}) {
    return _paymentDataService.completeSettle(paymentId: paymentId, completeSaleRequest: completeSaleRequest);
  }

  @override
  Future<CouponDetailsResponse> getCouponDetails({required String couponNumber, required int payModeId}) {
    return _paymentDataService.getCouponDetails(couponNumber: couponNumber, payModeId: payModeId);
  }

  @override
  Future<TransactionResponse> addCouponPayment({required int transactionId, required CouponPaymentRequest couponPaymentRequest}) {
    return _paymentDataService.addCouponPayment(transactionId: transactionId, couponPaymentRequest: couponPaymentRequest);
  }

  @override
  Future<EmployeeTipResponse> getEmployeeTipDetails({required int paymentId}) {
   return _paymentDataService.getEmployeeTipDetails(paymentId: paymentId);
  }

  @override
  Future<TransactionResponse> completeSettlePayment({required int paymentId, required CompleteSaleRequest completeSaleRequest}) {
    return _paymentDataService.completeSettlePayment(paymentId: paymentId, completeSaleRequest: completeSaleRequest);
  }
}
