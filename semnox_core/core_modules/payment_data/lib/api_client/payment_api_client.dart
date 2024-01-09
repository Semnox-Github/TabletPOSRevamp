import 'package:dio/dio.dart';
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
import 'package:payment_data/models/search_transaction/search_transaction_response.dart';
import 'package:retrofit/http.dart';
import 'package:transaction_data/models/create_transaction/transaction_payment_dto.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';


part 'payment_api_client.g.dart';

@RestApi()
abstract class PaymentApiClient {

  factory PaymentApiClient(Dio dio, {String baseUrl}) = _PaymentApiClient;

  static const _paymentsEndPoint = "api/Transaction/Transactions/{transactionId}/Payments";
  static const _startRefundEndPoint = "api/Transaction/TransactionPayments/{paymentId}/StartRefund";
  static const _completeRefundEndPoint = "api/Transaction/TransactionPayments/{paymentId}/CompleteRefund";
  static const _trxSearchEndPoint = "api/Transaction/TransactionSearch";
  static const _startTipEndPoint = "api/Transaction/TransactionPayments/{paymentId}/StartAdjustTip";
  static const _startSettleEndPoint = "api/Transaction/TransactionPayments/{paymentId}/StartSettle";
  static const _completeTipEndPoint = "api/Transaction/TransactionPayments/{paymentId}/CompleteAdjustTip";
  static const _splitTipEndPoint = "api/Transaction/TransactionPayments/{paymentId}/TipSplit";
  static const _completeSaleEndPoint = "api/Transaction/TransactionPayments/{paymentId}/CompleteSale";
  static const _completePreAuthEndPoint = "api/Transaction/TransactionPayments/{paymentId}/CompletePreauth";
  static const _completeAuthEndPoint = "api/Transaction/TransactionPayments/{paymentId}/CompleteAuthorize";
  static const _completeSettleEndPoint = "api/Transaction/TransactionPayments/{paymentId}/CompleteSettle";
  static const _updatePaymentsEndPoint = "api/Transaction/Transactions/{transactionId}/UpdatePayments";
  static const _paymentCouponEndPoint = "api/Transaction/PaymentCoupon";

  @POST(_paymentsEndPoint)
  Future<TransactionResponse> addCashPayment(@Path() int transactionId, @Body() List<CashPaymentRequest> cashPaymentRequests);

  @POST(_paymentsEndPoint)
  Future<TransactionResponse> addGenericPayment(@Path() int transactionId, @Body() List<GenericPaymentRequest> genericPaymentRequests);

  @POST(_paymentsEndPoint)
  Future<TransactionResponse> addCardPayment(@Path() int transactionId, @Body() List<CardPaymentRequest> cardPaymentRequests);

  @POST(_startRefundEndPoint)
  Future<TransactionResponse> startRefundPayment(@Path() int paymentId);

  @POST(_completeRefundEndPoint)
  Future<TransactionResponse> completeRefundPayment(@Path() int paymentId, @Body() CompleteRefundRequest completeRefundRequest);

  @POST(_trxSearchEndPoint)
  Future<TransactionSearchResponse> searchTransaction(@Queries() Map<String, dynamic> queries, @Body() List<TransactionSearchCondition> conditions);

  @POST(_startTipEndPoint)
  Future<TransactionResponse> startAdjustTip(@Path() int paymentId);

  @POST(_completeTipEndPoint)
  Future<TransactionResponse> completeAdjustTip(@Path() int paymentId, @Body() CompleteTipRequest completeTipRequest);

  @POST(_splitTipEndPoint)
  Future<TransactionResponse> splitTip(@Path() int paymentId, @Body() List<SplitTipRequest> splitTipRequests);

  @POST(_completeSaleEndPoint)
  Future<TransactionResponse> completeSale(@Path() int paymentId, @Body() CompleteSaleRequest completeSaleRequest);

  @POST(_completePreAuthEndPoint)
  Future<TransactionResponse> completePreAuth(@Path() int paymentId, @Body() CompleteSaleRequest completeSaleRequest);

  @POST(_completeAuthEndPoint)
  Future<TransactionResponse> completeAuth(@Path() int paymentId, @Body() CompleteAuthRequest completeAuthRequest);

  @POST(_startSettleEndPoint)
  Future<TransactionResponse> startSettle(@Path() int paymentId);

  @POST(_completeSettleEndPoint)
  Future<TransactionResponse> completeSettle(@Path() int paymentId, @Body() CompleteSaleRequest? completeSaleRequest);

  @POST(_completeSettleEndPoint)
  Future<TransactionResponse> completeSettlePayment(@Path() int paymentId);

  @POST(_updatePaymentsEndPoint)
  Future<TransactionResponse> updatePayments(@Path() int transactionId, @Body() List<TransactionPaymentDTO> payments);

  @GET(_paymentCouponEndPoint)
  Future<CouponDetailsResponse> getCouponDetails(@Queries() Map<String, dynamic> queries);

  @POST(_paymentsEndPoint)
  Future<TransactionResponse> addCouponPayment(@Path() int transactionId, @Body() List<CouponPaymentRequest> couponPaymentRequests);

  @GET(_splitTipEndPoint)
  Future<EmployeeTipResponse> getEmployeeTipDetails(@Path() int paymentId);
}
