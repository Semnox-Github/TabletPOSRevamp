import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:transaction_data/models/create_order/order_response.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';
import 'package:transaction_data/models/discount_container/discount_container_response.dart';
import 'package:transaction_data/models/get_clocked_in_users/get_clocked_in_users_response.dart';
import 'package:transaction_data/models/request/add_line/add_line_request.dart';
import 'package:transaction_data/models/request/add_modifier_product/add_modifier_product_request.dart';
import 'package:transaction_data/models/request/add_open_line/add_open_line_request.dart';
import 'package:transaction_data/models/request/add_transaction_line_discount/add_transaction_line_discount.dart';
import 'package:transaction_data/models/request/create_order/order_request.dart';
import 'package:transaction_data/models/request/create_transaction/transaction_request.dart';
import 'package:transaction_data/models/request/order_transaction_line/order_transaction_lines_request.dart';
import 'package:transaction_data/models/request/override_price/override_price_request.dart';
import 'package:transaction_data/models/request/remove_line/remove_line_request.dart';
import 'package:transaction_data/models/request/set_staff/set_staff_request.dart';
import 'package:transaction_data/models/request/transaction_non_chargable/transaction_non_chargable_request.dart';
import 'package:transaction_data/models/request/transaction_profiles/transaction_profile_request.dart';
import 'package:transaction_data/models/request/transaction_remark_line/transaction_remark_line_request.dart';
import 'package:transaction_data/models/request/update_line/update_line_request.dart';
import 'package:transaction_data/models/request/update_line_course/line_course_request.dart';
import 'package:transaction_data/models/transaction_functions/transaction_function_response.dart';
import 'package:transaction_data/models/transaction_logs/get_transaction_logs_response.dart';
import 'package:transaction_data/models/transaction_profiles/transaction_profile_response.dart';
import 'package:transaction_data/models/transaction_receipt/transaction_print_receipt_response.dart';
import 'package:transaction_data/models/user_container/user_container_response.dart';
import '../models/create_transaction/transaction_line_dto.dart';
import '../models/discount_coupon_summary/discount_coupon_summary_response.dart';
import '../models/request/add_transaction_discount/add_transaction_request.dart';
import '../models/request/close_transaction/close_transaction_request.dart';
import '../models/request/reverse_transaction/transaction_reverse_dto.dart';
import '../models/request/reverse_transaction_line/transaction_line_reverse_dto.dart';
import '../models/request/set_transaction_profile_id/set_transaction_profile_id_request.dart';
import '../models/request/update_transaction_line_seat/update_transaction_line_seat_request.dart';
import '../models/user_role_container/user_role_container_response.dart';

part 'transaction_api_client.g.dart';

@RestApi()
abstract class TransactionApiClient {

  factory TransactionApiClient(Dio dio, {String baseUrl}) = _TransactionApiClient;

  static const _profilesEndPoint = "api/Transaction/TransactionProfilesContainer";

  static const _orderEndPoint = "api/Transaction/Order";
  static const _transactionEndPoint = "api/Transaction/V2/Order/{orderId}/Transaction";
  static const _remarkEndPoint = 'api/Transaction/Transaction/{transactionId}/Remarks';
  static const _transactionLinesEndPoint = 'api/Transaction/Transactions/{transactionId}/TransactionLines';
  static const _lineRemarksEndPoint = 'api/Transaction/Transactions/{transactionId}/LineRemarks';

  static const _transactionIdentifiersEndPoint = 'api/Transaction/Transaction/{transactionId}/TransactionIdentifier';
  static const _linesProfileEndPoint = "api/Transaction/Transactions/{transactionId}/LinesProfile";
  static const _linesCourseEndPoint = 'api/Transaction/Transactions/{transactionId}/LinesCourse';
  static const _customerEndPoint = 'api/Transaction/Transaction/{transactionId}/Customer';
  static const _transactionStaffEndPoint = 'api/Transaction/Transaction/{transactionId}/TransactionStaff';

  static const _userRoleContainerEndPoint = 'api/HR/UserRoleContainer';
  static const _userContainerListEndPoint = 'api/HR/UserContainer';
  static const _clearTransactionEndPoint = 'api/Transaction/Transaction/{transactionId}/Clear';
  static const _saveTransactionEndPoint = 'api/Transaction/Transaction/{transactionId}/Save';
  static const _saveAndHoldTransactionEndPoint = 'api/Transaction/Transaction/{transactionId}/SaveAndHold';
  static const _discountContainerEndPoint = 'api/Discount/DiscountContainer';
  static const _transactionProfileEndPoint = 'api/V2/Transaction/Transaction/{transactionId}/TransactionProfile';
  static const _taskTypeEndPoint = 'api/Transaction/TaskTypesContainer';
  static const _completeTransactionEndPoint = 'api/Transaction/Order/{orderId}/CompleteTransaction';
  static const _cancelTransactionEndPoint = 'api/Transaction/Order/{orderId}/CancelTransaction';
  static const _addTransactionDiscountEndPont = 'api/Transaction/Transactions/{transactionId}/Discount';
  static const _addTransactionLineDiscountEndPoint = 'api/Transaction/Transactions/{transactionId}/LinesDiscount';
  static const _transactionNonChargableEndPoint = 'api/Transaction/Transaction/{transactionId}/NonChargeable';
  static const _linesSeatEndPoint = 'api/Transaction/Transactions/{transactionId}/LinesSeat';
  static const _orderTransactionLineEndPoint = 'api/Transaction/Transaction/{transactionId}/OrderTransactionLine';
  static const _getCouponDiscountEndPoint = 'api/Discount/DiscountCouponSummary';
  static const _transactionPrintReceiptEndPoint = 'api/Transaction/Transactions/{transactionId}/Receipt';
  static const _overrideTransactionLinePriceEndPoint = "api/Transaction/Transactions/{transactionId}/LinesPrice";
  static const _getAllClockedInUsersEndPoint = "api/HR/User/GetAllClockedInUsers";
  static const _getTransactionLogsEndPoint = "api/Transaction/Transactions/{transactionId}/Logs";
  static const _reopenTransactionEndPoint = "/api/Transaction/Order/{orderId}/ReopenTransaction";
  static const _reverseTransactionLineEndPoint = "api/Transaction/Transactions/{transactionId}/TransactionLines/Reverse";
  static const _reverseTransactionEndPoint = "api/Transaction/Order/{orderId}/ReverseTransaction";
  static const _transactionLockEndPoint = "/api/Transaction/Transactions/{transactionId}/Lock";
  static const _openItemEndPoint = "/api/Transaction/Transactions/{transactionId}/OpenItemTransactionLines";

  @GET(_profilesEndPoint)
  Future<TransactionProfileResponse> getTransactionProfiles(@Queries() Map<String, dynamic> queries);

  @POST(_orderEndPoint)
  Future<OrderResponse> createOrder(@Body() OrderRequest orderRequest);

  @POST(_transactionEndPoint)
  Future<TransactionResponse> createTransaction(@Path() int orderId, @Body() TransactionRequest transactionRequest);

  @POST(_remarkEndPoint)
  Future<TransactionResponse> createTransactionRemark(@Path() int transactionId, @Body() String remarks);

  @POST(_transactionLinesEndPoint)
  Future<TransactionResponse> addProductToLine(@Path() int transactionId, @Body() List<AddLineRequest> addLineRequests);

  @POST(_transactionLinesEndPoint)
  Future<TransactionResponse> addModifierProductsToTransaction(@Path() int transactionId, @Body() List<AddModifierProductRequest> addModifierProductRequests);

  @DELETE(_transactionLinesEndPoint)
  Future<TransactionResponse> removeProductFromLine(@Path() int transactionId, @Body() List<RemoveLineRequest> removeLineRequests);

  @POST(_lineRemarksEndPoint)
  Future<TransactionResponse> createTransactionRemarkLine(@Path() int transactionId, @Body() List<TransactionRemarkLineRequest> transactionRemarkLineRequest);

  @PUT(_transactionLinesEndPoint)
  Future<TransactionResponse> updateProductToLineClient(@Path() int transactionId, @Body() List<TransactionLineDTO> transactionLines);

  @POST(_transactionIdentifiersEndPoint)
  Future<TransactionResponse> updateTransactionIdentifiersClient(@Path() int transactionId, @Body() TransactionRequest transactionRequest);

  @POST(_linesProfileEndPoint)
  Future<TransactionResponse> applyProfileToTransactionLines(@Path() int transactionId, @Body() TransactionProfileRequest request);

  @POST(_linesCourseEndPoint)
  Future<TransactionResponse> updateTransactionLineCourseClient(@Path() int transactionId, @Body() List<UpdateLineCourseRequest> lineCourseRequests);

  @POST(_customerEndPoint)
  Future<TransactionResponse> linkCustomerToTransaction(@Path() int transactionId, @Body() int customerId);

  @DELETE(_customerEndPoint)
  Future<TransactionResponse> deLinkCustomerFromTransaction(@Path() int transactionId);

  @GET(_userRoleContainerEndPoint)
  Future<UserRoleContainerResponse> getUsersRoleContainer(@Queries() Map<String, dynamic> queries);

  @POST(_transactionStaffEndPoint)
  Future<TransactionResponse> changeTransactionStaff(@Path() int transactionId, @Body() SetStaffRequest setStaffRequest);

  @GET(_userContainerListEndPoint)
  Future<UserContainerResponse> getUserContainerList(@Queries() Map<String, dynamic> queries);

  @POST(_clearTransactionEndPoint)
  Future<TransactionResponse> clearTransaction(@Path() int transactionId);

  @POST(_saveTransactionEndPoint)
  Future<TransactionResponse> saveTransaction(@Path() int transactionId);

  @POST(_saveAndHoldTransactionEndPoint)
  Future<TransactionResponse> saveAndHoldTransaction(@Path() int transactionId);

  @GET(_discountContainerEndPoint)
  Future<DiscountContainerResponse> getDiscountsContainer(@Queries() Map<String, dynamic> queries);

  @POST(_transactionProfileEndPoint)
  Future<TransactionResponse> setProfileIdForTransaction(@Path() int transactionId, @Body() SetTransactionProfileIdRequest setTransactionProfileIdRequest);

  @GET(_taskTypeEndPoint)
  Future<TransactionFunctionResponse> getTransactionFunctions(@Queries() Map<String, dynamic> queries);

  @POST(_completeTransactionEndPoint)
  Future<TransactionResponse> completeTransaction(@Path() int orderId, @Body() CloseTransactionRequest closeTransactionRequest);

  @POST(_cancelTransactionEndPoint)
  Future<TransactionResponse> cancelTransaction(@Path() int orderId, @Body() CloseTransactionRequest closeTransactionRequest);

  @POST(_addTransactionDiscountEndPont)
  Future<TransactionResponse> addDiscountForTransaction(@Path() int transactionId, @Body() AddTransactionDiscountRequest addTransactionDiscountRequest);

  @POST(_addTransactionLineDiscountEndPoint)
  Future<TransactionResponse> addDiscountForTransactionLine(@Path() int transactionId, @Body() AddTransactionLineDiscountRequest addTransactionLineDiscountRequest);

  @DELETE(_addTransactionDiscountEndPont)
  Future<TransactionResponse> removeDiscountForTransaction(@Path() int transactionId, @Body() AddTransactionDiscountRequest addTransactionDiscountRequest);

  @DELETE(_addTransactionLineDiscountEndPoint)
  Future<TransactionResponse> removeDiscountForTransactionLine(@Path() int transactionId, @Body() AddTransactionLineDiscountRequest addTransactionLineDiscountRequest);

  @POST(_transactionNonChargableEndPoint)
  Future<TransactionResponse> makeTransactionNonChargableClient(@Path() int transactionId, @Body() TransactionNonChargableRequest transactionNonChargableRequest);

  @POST(_linesSeatEndPoint)
  Future<TransactionResponse> updateSeatForTransactionLine(@Path() int transactionId, @Body() List<UpdateTransactionLineSeatRequest> updateTransactionLineSeatRequests);

  @POST(_orderTransactionLineEndPoint)
  Future<TransactionResponse> orderTransactionLines(@Path() int transactionId, @Body() List<OrderTransactionLinesRequest> orderTransactionLineRequests);

  @GET(_getCouponDiscountEndPoint)
  Future<DiscountCouponSummaryResponse> getDiscountsCouponSummary(@Queries() Map<String, dynamic> queries);

  @GET(_transactionPrintReceiptEndPoint)
  Future<TransactionPrintReceiptResponse> getTransactionReceipt(@Path() int transactionId, @Queries() Map<String, dynamic> queries);

  @POST(_overrideTransactionLinePriceEndPoint)
  Future<TransactionResponse> overrideTransactionLinePrice(@Path() int transactionId, @Body() OverridePriceRequest overridePriceRequest);

  @GET(_getAllClockedInUsersEndPoint)
  Future<GetClockedInUsersResponse> getAllClockedInUsers();

  @GET(_getTransactionLogsEndPoint)
  Future<GetTransactionLogsResponse> getTransactionLogs(@Path() int transactionId);

  @DELETE(_transactionNonChargableEndPoint)
  Future<TransactionResponse> makeTransactionChargableClient(@Path() int transactionId, @Body() TransactionNonChargableRequest transactionNonChargableRequest);

  @POST(_reopenTransactionEndPoint)
  Future<TransactionResponse> reopenTransaction(@Path() int orderId, @Body() CloseTransactionRequest closeTransactionRequest);

  @POST(_reverseTransactionLineEndPoint)
  Future<TransactionResponse> reverseTransactionLine(@Path() int transactionId, @Body() List<TransactionLineReverseDto> transactionLineReverseDto);

  @POST(_reverseTransactionEndPoint)
  Future<TransactionResponse> reverseTransaction(@Path() int orderId, @Body() TransactionReverseDto transactionReverseDto);

  @POST(_transactionLockEndPoint)
  Future<TransactionResponse> lockTransaction(@Path() int transactionId);

  @DELETE(_transactionLockEndPoint)
  Future<TransactionResponse> unlockTransaction(@Path() int transactionId);

  @POST(_openItemEndPoint)
  Future<TransactionResponse> add9999ProductToLine(@Path() int transactionId, @Body() List<AddOpenLineRequest> addOpenLineRequests);

}
