import 'package:transaction_data/models/create_transaction/transaction_data.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';
import 'package:transaction_data/models/discount_container/discount_container_response.dart';
import 'package:transaction_data/models/request/add_modifier_product/add_modifier_product_request.dart';
import 'package:transaction_data/models/transaction_functions/task_type_container_dto.dart';
import 'package:transaction_data/models/transaction_functions/transaction_function_response.dart';
import 'package:transaction_data/models/transaction_logs/get_transaction_logs_response.dart';
import 'package:transaction_data/models/transaction_receipt/transaction_print_receipt_response.dart';
import 'package:transaction_data/models/user_container/user_container_response.dart';
import 'package:transaction_data/models/user_role_container/user_role_container_response.dart';
import 'package:transaction_data/transaction_data_service.dart';
import 'models/create_transaction/transaction_line_dto.dart';
import 'models/discount_coupon_summary/discount_coupon_summary_response.dart';
import 'models/get_clocked_in_users/get_clocked_in_users_response.dart';
import 'models/transaction_profiles/transaction_profile_container_dto.dart';

abstract class TransactionDataBLContract {
  Future<List<TransactionProfileContainerDTO>> getTransactionProfiles();

  Future<TransactionResponse> initiateTransaction(
      {int? guestCount, String? guestName, String? guestContact, String? transactionIdentifier, int?tableId, int?approverID});

  TransactionResponse? getCurrentTransaction();

  Future<TransactionResponse> addProductToLine({
    required String seatName,
    required int seatNumber,
    int? transactionProfileId,
    String? remarks,
    int? lineNumber,
    required int productId,
    int? quantity,
    double? userOverriddenPrice,
    String? lineDate,
    String? approvedBy
  });

  Future<TransactionResponse> add9999ProductToLine({
    required int productId,
    required String description,
    required double price,
    required int printerId,
    required String remarks,
    required int seatNo,
    required String seatName,
    int? approverID
  });

  Future<TransactionResponse> addCardToLine({
    required String seatName,
    required int seatNumber,
    required int productId,
    List<String>? tagNumbers,
    double? userOverriddenPrice,
    bool? existingAccount,
    bool?isActive,
    String? remarks,
    required bool isSplitCard
  });

  Future<TransactionResponse> addModifierProductsToLine(List<AddModifierProductRequest> addModifierProducts);

  Future<TransactionResponse> removeProductFromLine(
      {required List<int> transactionLineIds,required int reasonId, String? reason, String? lineRemarks});

  Future<TransactionResponse> addTransactionRemark({required String remarks});

  Future<TransactionResponse> addTransactionRemarkLine(
      {int approveId,
      required List<int> transactionLineIds,
      required String lineRemarks,
      String? remarks});

  Future<TransactionResponse> updateProductToLine(List<TransactionLineDTO> transactionLines);

  Future<TransactionResponse> updateTransactionIdentifiers(
      {int? guestCount,
      String? guestName,
      String? transactionRemarks,
      int? approverId,
      String? transactionIdentifier,
      String? guestContact,
      int? transactionProfileId,
      String? transactionDateTime,
      String? remarks});

  Future<TransactionResponse> applyProfileToTransactionLine({required int profileId,
    required List<int> transactionLineIds,
    String? remarks,
    int?approverID
  });

  Future<TransactionResponse> clearTransaction();

  Future<TransactionResponse> saveTransaction();

  Future<TransactionResponse> saveAndHoldTransaction();

  Future<TransactionResponse> updateTransactionLineCourse(
      {int? approverId,
      required String courseName,
      required List<int> transactionLineIds,
      required String lineRemarks,
      String? remarks});

  Future<TransactionResponse> linkCustomerToTransaction(
      {required int customerId});

  Future<TransactionResponse> deLinkCustomerFromTransaction();

  Future<UserRoleContainerResponse> getUsersRoleContainer();

  Future<TransactionResponse> changeTransactionStaff({required int userId,int?approverID});

  Future<UserContainerResponse> getUserContainerList();

  Future<DiscountContainerResponse> getDiscountsContainer();

  Future<TransactionResponse> setTransactionProfileId({required int transactionProfileId,int?approverID});

  void clearTransactionFunctions();

  Future<TransactionResponse> completeTransaction({
    int?approverID,
   String? reason, String? remarks}
      );

  Future<TransactionResponse> cancelTransaction({
    int?approverID,
    String? reason, String? remarks});

  Future<TransactionResponse> reopenTransaction({
    String? reason, String? remarks,int?approverID});

  Future<TransactionResponse>  addDiscountForTransaction({
    int?approverID,
        required int discountId,String? couponNumber, int? transactionDiscountId, double? discountAmount}
      );

  Future<TransactionResponse>  addDiscountForTransactionLine({
    int?approverID,
    required int discountId,String? couponNumber,String?remarks,required int transactionLineId, double? discountAmount}
      );

  Future<TransactionResponse>  removeDiscountForTransaction({
    int?approverID,
    required int discountId,String? couponNumber, int? transactionDiscountId, double? discountAmount}
      );

  Future<TransactionResponse>  removeDiscountForTransactionLine({int?approverID,
    required int discountId,String? couponNumber,String?remarks,required int transactionLineId, double? discountAmount}
      );

  Future<TransactionResponse> makeTransactionNonChargable({String? remarks,int?approverID});

  Future<TransactionResponse> updateTransactionLinesSeat(List<int> transactionLineIds, String seatName, String seatNumber,{int?approverID});

  Future<TransactionResponse> orderTransactionLines(List<TransactionLineDTO> transactionLines,{int?approverID});

  TransactionResponse saveToTransactionResponse(TransactionData? transactionData);

  Future<DiscountCouponSummaryResponse> getDiscountCouponSummary({required String couponNumber });

  Future<TransactionPrintReceiptResponse> getTransactionPrintReceipt({required String format});

  Future<TransactionResponse> overrideTransactionLinePrice(List<int> transactionLineIds, double overriddenPrice, String lineRemarks,{int?approverID});

  Future<GetClockedInUsersResponse> getClockedInUsers();

  Future<GetTransactionLogsResponse> getTransactionLogs();

  Future<TransactionResponse> makeTransactionChargable({String? remarks,int?approverID});

  Future<TransactionResponse> reverseTransactionLine(
      List<int> transactionLineIds, int reasonId, String remarks, bool reverseObligations, bool forceReverseUsedObligations,{int?approverID});

  Future<TransactionResponse> reverseTransaction(int reasonId, String remarks, bool reverseObligations, bool forceReverseUsedObligations,{int?approverID});

  Future<TransactionResponse> lockTransaction();

  Future<TransactionResponse> unlockTransaction();

  void clear();
}

class TransactionDataBLImpl implements TransactionDataBLContract {
  final TransactionDataService _transactionDataService;

  TransactionDataBLImpl(this._transactionDataService);

  @override
  Future<List<TransactionProfileContainerDTO>> getTransactionProfiles() {
    return _transactionDataService.getTransactionProfiles();
  }

  @override
  void clear() {
    _transactionDataService.clear();
  }

  @override
  Future<TransactionResponse> initiateTransaction(
      {int? guestCount, String? guestName, String? guestContact, String? transactionIdentifier, int?tableId,int?approverID}) {
    return _transactionDataService.initiateTransaction(
        approverID:approverID,
        guestCount: guestCount,
        guestName: guestName,
        guestContact: guestContact,
        transactionIdentifier: transactionIdentifier,
        tableId:tableId);
  }

  @override
  TransactionResponse? getCurrentTransaction() {
    return _transactionDataService.getCurrentTransaction();
  }

  @override
  Future<TransactionResponse> addProductToLine(
      {required String seatName,
      required int seatNumber,
      int? transactionProfileId,
      String? remarks,
      int? lineNumber,
      required int productId,
      int? quantity,
      double? userOverriddenPrice,
      String? lineDate,
      String? approvedBy}) {
    return _transactionDataService.addProductToLine(
      seatName: seatName,
      seatNumber: seatNumber,
      transactionProfileId: transactionProfileId,
      remarks: remarks,
      lineNumber: lineNumber,
      productId: productId,
      quantity: quantity,
      lineDate: lineDate,
      userOverriddenPrice: userOverriddenPrice,
      approvedBy : approvedBy
    );
  }

  @override
  Future<TransactionResponse> add9999ProductToLine({
    required int productId,
    required String description,
    required double price,
    required int printerId,
    required String remarks,
    required int seatNo,
    required String seatName,
    int? approverID
  }) {
    return _transactionDataService.add9999ProductToLine(
        productId: productId,
        description: description,
        price: price,
        printerId: printerId,
        remarks: remarks,
        seatNo: seatNo,
        seatName: seatName,
        approverID: approverID);
  }

  @override
  Future<TransactionResponse> addCardToLine({
    required String seatName,
    required int seatNumber,
    required int productId,
    List<String>? tagNumbers,
    double? userOverriddenPrice,
    bool? existingAccount,
    bool?isActive,
    String? remarks,
    required bool isSplitCard  }){
    return _transactionDataService.addCardToLine(
        seatName: seatName,
        seatNumber: seatNumber,
        productId: productId,
        tagNumbers: tagNumbers,
        userOverriddenPrice:userOverriddenPrice,
        existingAccount:existingAccount,
        isActive:isActive,
      isSplitCard: isSplitCard,
      remarks: remarks
    );
  }

  @override
  Future<TransactionResponse> removeProductFromLine(
      {required List<int> transactionLineIds,required int reasonId, String? reason, String? lineRemarks, int?approverID}) {
    return _transactionDataService.removeProductFromLine(
        approverID:approverID,
        transactionLineIds: transactionLineIds,
        reason: reason,
        reasonId: reasonId,
        lineRemarks: lineRemarks);
  }

  @override
  Future<TransactionResponse> addTransactionRemark({required String remarks}) {
    return _transactionDataService.addTransactionRemark(remarks: remarks);
  }

  @override
  Future<TransactionResponse> addTransactionRemarkLine(
      {int? approveId,
      required List<int> transactionLineIds,
      required String lineRemarks,
      String? remarks,}) {
    return _transactionDataService.addTransactionRemarkLine(
        transactionLineIds: transactionLineIds,
        approverId: approveId,
        lineRemarks: lineRemarks,
        remarks: remarks);
  }

  @override
  Future<TransactionResponse> updateProductToLine(List<TransactionLineDTO> transactionLines) {
    return _transactionDataService.updateProductToLine(transactionLines);
  }

  @override
  Future<TransactionResponse> updateTransactionIdentifiers(
      {int? guestCount,
      String? guestName,
      String? transactionRemarks,
      int? approverId,
      String? transactionIdentifier,
      String? guestContact,
      int? transactionProfileId,
      String? transactionDateTime,
      String? remarks}) {
    return _transactionDataService.updateTransactionIdentifiers(
        guestCount: guestCount,
        guestName: guestName,
        transactionDateTime: transactionDateTime,
        transactionIdentifier: transactionIdentifier,
        guestContact: guestContact,
        transactionRemarks: transactionRemarks,
        remarks: remarks,
        transactionProfileId: transactionProfileId,
        approverId: approverId);
  }

  @override
  Future<TransactionResponse> applyProfileToTransactionLine({required int profileId,
    required List<int> transactionLineIds,
    String? remarks,
    int?approverID
  }) {
    return _transactionDataService.applyProfileToTransactionLine(
        approverID:approverID,
        profileId: profileId, transactionLineIds: transactionLineIds);
  }

  @override
  Future<TransactionResponse> clearTransaction() {
    return _transactionDataService.clearTransaction();
  }

  @override
  Future<TransactionResponse> saveTransaction() {
    return _transactionDataService.saveTransaction();
  }

  @override
  Future<TransactionResponse> saveAndHoldTransaction() {
    return _transactionDataService.saveAndHoldTransaction();
  }

  @override
  Future<TransactionResponse> updateTransactionLineCourse(
      {int? approverId,
      required String courseName,
      required List<int> transactionLineIds,
      required String lineRemarks,
      String? remarks}) {
    return _transactionDataService.updateTransactionLineCourse(
        courseName: courseName,
        transactionLineIds: transactionLineIds,
        approverId: approverId,
        lineRemarks: lineRemarks,
        remarks: remarks);
  }

  @override
  Future<TransactionResponse> linkCustomerToTransaction(
      {required int customerId}) {
    return _transactionDataService.linkCustomerToTransaction(
        customerId: customerId);
  }

  @override
  Future<TransactionResponse> deLinkCustomerFromTransaction() {
    return _transactionDataService.deLinkCustomerFromTransaction();
  }

  @override
  Future<UserRoleContainerResponse> getUsersRoleContainer() {
    return _transactionDataService.getUsersRoleContainer();
  }

  @override
  Future<TransactionResponse> changeTransactionStaff({required int userId,int?approverID}) {
    return _transactionDataService.changeTransactionStaff(userId: userId,approverID:approverID);
  }

  @override
  Future<UserContainerResponse> getUserContainerList() {
    return _transactionDataService.getUserContainer();
  }

  @override
  Future<DiscountContainerResponse> getDiscountsContainer() {
    return _transactionDataService.getDiscountsContainer();
  }

  @override
  Future<TransactionResponse> setTransactionProfileId({required int transactionProfileId,int?approverID}) {
    return _transactionDataService.setTransactionProfileId(transactionProfileId: transactionProfileId,approverID:approverID);
  }


  @override
  void clearTransactionFunctions() {
    _transactionDataService.clearTransactionFunctions();
  }

  @override
  Future<TransactionResponse> completeTransaction({
     String? reason, String? remarks, int?approverID}){
    return _transactionDataService.completeTransaction(
      remarks: remarks,reason: reason,approverID:approverID
    );
  }

  @override
  Future<TransactionResponse> cancelTransaction({
    String? reason, String? remarks,int?approverID}){
    return _transactionDataService.cancelTransaction(
        remarks: remarks,reason: reason,approverID:approverID
    );
  }

  @override
  Future<TransactionResponse>  addDiscountForTransaction({
    required int discountId,String? couponNumber, int? transactionDiscountId, double? discountAmount, int?approverID, String? remarks}
      ){
    return _transactionDataService.addTransactionDiscount(discountId: discountId, couponNumber: couponNumber,transactionDiscountId: transactionDiscountId,discountAmount: discountAmount,approverID:approverID, remarks: remarks);
  }

  @override
  Future<TransactionResponse>  addDiscountForTransactionLine({
    required int discountId,String? couponNumber,String?remarks,required int transactionLineId, double? discountAmount, int?approverID}
      ){
    return _transactionDataService.addTransactionLineDiscount(discountId: discountId, couponNumber: couponNumber,remarks:remarks,transactionLineId: transactionLineId,discountAmount: discountAmount,approverID:approverID);
  }


  @override
  Future<TransactionResponse> removeDiscountForTransaction({required int discountId, String? couponNumber, int? transactionDiscountId, double? discountAmount,int?approverID}) {
    return _transactionDataService.removeTransactionDiscount(discountId: discountId, couponNumber: couponNumber,transactionDiscountId: transactionDiscountId,discountAmount: discountAmount, approverID:approverID);
  }

  @override
  Future<TransactionResponse> removeDiscountForTransactionLine({required int discountId, String? couponNumber, String? remarks, required int transactionLineId, double? discountAmount,int?approverID}) {
    return _transactionDataService.removeTransactionLineDiscount(discountId: discountId, couponNumber: couponNumber,remarks:remarks,transactionLineId: transactionLineId,discountAmount: discountAmount,approverID:approverID);
  }

  @override
  Future<TransactionResponse> addModifierProductsToLine(List<AddModifierProductRequest> addModifierProducts) {
    return _transactionDataService.addModifierProductsToLine(addModifierProducts);
  }

  @override
  Future<TransactionResponse> makeTransactionNonChargable({String? remarks,int?approverID}){
    return _transactionDataService.makeTransactionNonChargable(remarks,approverID:approverID);
  }

  @override
  Future<TransactionResponse> updateTransactionLinesSeat(List<int> transactionLineIds, String seatName, String seatNumber,
      {int? approverID}) {
    return _transactionDataService.updateTransactionLinesSeat(transactionLineIds, seatName, seatNumber,approverID:approverID);
  }

  @override
  Future<TransactionResponse> orderTransactionLines(List<TransactionLineDTO> transactionLines,{int?approverID}) {
    return _transactionDataService.orderTransactionLines(transactionLines,approverID:approverID);
  }

  @override
  TransactionResponse saveToTransactionResponse(TransactionData? transactionData) {
    return _transactionDataService.saveToTransactionResponse(transactionData);

  }

  @override
  Future<DiscountCouponSummaryResponse> getDiscountCouponSummary({required String couponNumber }){
    return _transactionDataService.getDiscountCouponDetails(couponNumber: couponNumber);
  }

  @override
  Future<TransactionPrintReceiptResponse> getTransactionPrintReceipt({required String format}) {
    return _transactionDataService.getTransactionPrintReceipt(format);
  }

  @override
  Future<TransactionResponse> overrideTransactionLinePrice(List<int> transactionLineIds, double overriddenPrice, String lineRemarks,{int?approverID}){
    return _transactionDataService.overrideTransactionLinePrice(transactionLineIds, overriddenPrice, lineRemarks,approverID:approverID);
  }

  @override
  Future<GetClockedInUsersResponse> getClockedInUsers() {
    return _transactionDataService.getClockedInUsers();
  }

  @override
  Future<GetTransactionLogsResponse> getTransactionLogs() {
    return _transactionDataService.getTransactionLogs();
  }

  @override
  Future<TransactionResponse> makeTransactionChargable({String? remarks,int?approverID}){
    return _transactionDataService.makeTransactionChargable(remarks,approverID:approverID);
  }

  @override
  Future<TransactionResponse> reopenTransaction({String? reason, String? remarks,int?approverID}) {
    return _transactionDataService.reopenTransaction(
        remarks: remarks,reason: reason,approverID:approverID
    );
  }

  @override
  Future<TransactionResponse> reverseTransactionLine(
      List<int> transactionLineIds, int reasonId, String remarks, bool reverseObligations, bool forceReverseUsedObligations,{int?approverID}) {
    return _transactionDataService.reverseTransactionLine(
        transactionLineIds, reasonId, remarks, reverseObligations, forceReverseUsedObligations,approverID:approverID);
  }

  @override
  Future<TransactionResponse> lockTransaction() {
    return _transactionDataService.lockTransaction();
  }

  @override
  Future<TransactionResponse> unlockTransaction() {
    return _transactionDataService.unlockTransaction();
  }

  Future<TransactionResponse> reverseTransaction(int reasonId, String remarks, bool reverseObligations, bool forceReverseUsedObligations,{int?approverID}) {
    return _transactionDataService.reverseTransaction(reasonId, remarks, reverseObligations, forceReverseUsedObligations,approverID:approverID);
  }
}
