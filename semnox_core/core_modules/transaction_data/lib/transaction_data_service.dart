import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:application_prefs_data/application_prefs_data_bl.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transaction_data/api_client/transaction_api_client.dart';
import 'package:transaction_data/constants.dart';
import 'package:transaction_data/models/create_order/order_response.dart';
import 'package:transaction_data/models/create_transaction/transaction_data.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';
import 'package:transaction_data/models/discount_container/discount_container_response.dart';
import 'package:transaction_data/models/discount_coupon_summary/discount_coupon_summary_response.dart';
import 'package:transaction_data/models/request/add_line/add_line_request.dart';
import 'package:transaction_data/models/request/add_line/transaction_account_dto.dart';
import 'package:transaction_data/models/request/add_modifier_product/add_modifier_product_request.dart';
import 'package:transaction_data/models/request/add_open_line/add_open_line_request.dart';
import 'package:transaction_data/models/request/add_transaction_discount/add_transaction_request.dart';
import 'package:transaction_data/models/request/add_transaction_line_discount/add_transaction_line_discount.dart';
import 'package:transaction_data/models/request/approval_dto.dart';
import 'package:transaction_data/models/request/close_transaction/close_transaction_request.dart';
import 'package:transaction_data/models/request/create_order/order_request.dart';
import 'package:transaction_data/models/request/create_order/table_operation_details.dart';
import 'package:transaction_data/models/request/create_transaction/transaction_request.dart';
import 'package:transaction_data/models/request/order_transaction_line/order_transaction_lines_request.dart';
import 'package:transaction_data/models/request/override_price/override_price_request.dart';
import 'package:transaction_data/models/request/remove_line/remove_line_request.dart';
import 'package:transaction_data/models/request/reverse_transaction/transaction_reverse_dto.dart';
import 'package:transaction_data/models/request/set_staff/set_staff_request.dart';
import 'package:transaction_data/models/request/set_transaction_profile_id/set_transaction_profile_id_request.dart';
import 'package:transaction_data/models/request/transaction_profiles/transaction_profile_request.dart';
import 'package:transaction_data/models/request/update_line_course/line_course_request.dart';
import 'package:transaction_data/models/request/update_transaction_line_seat/update_transaction_line_seat_request.dart';
import 'package:transaction_data/models/transaction_functions/task_type_container_dto.dart';
import 'package:transaction_data/models/transaction_functions/transaction_function_response.dart';
import 'package:transaction_data/models/transaction_profiles/transaction_profile_response.dart';
import 'package:transaction_data/models/transaction_receipt/transaction_print_receipt_response.dart';
import 'models/create_transaction/transaction_line_dto.dart';
import 'models/get_clocked_in_users/get_clocked_in_users_response.dart';
import 'models/request/reverse_transaction_line/transaction_line_reverse_dto.dart';
import 'models/request/transaction_non_chargable/transaction_non_chargable_request.dart';
import 'models/request/transaction_remark_line/transaction_remark_line_request.dart';
import 'models/transaction_logs/get_transaction_logs_response.dart';
import 'models/transaction_profiles/transaction_profile_container_dto.dart';
import 'models/user_container/user_container_response.dart';
import 'models/user_role_container/user_role_container_response.dart';
import 'package:http/http.dart' as http;

class TransactionDataService {
  static const _transactionHeaderFunctionName = 'TRANSACTION HEADER FUNCTION';
  static const _transactionLineFunctionName = 'TRANSACTION LINE FUNCTION';
  static const USER_CONTAINER_FILE_NAME = 'user_container_response.json';
  static const TRX_PROFILE_FILE_NAME = 'trx_profile_response.json';

  late TransactionApiClient _transactionApiClient;
  late ExecutionContextDTO _executionContextDTO;
  late ApplicationPrefsDataBLContract _appPrefsBL;
  late SharedPreferences _preferences;

  static final TransactionDataService _instance = TransactionDataService._internal();
  TransactionDataService._internal();

  factory TransactionDataService(
      TransactionApiClient apiClient, ExecutionContextDTO executionContextDTO, SharedPreferences sharedPreferences, ApplicationPrefsDataBLContract appPrefsBL) {
    _instance._transactionApiClient = apiClient;
    _instance._executionContextDTO = executionContextDTO;
    _instance._appPrefsBL = appPrefsBL;
    _instance._preferences = sharedPreferences;
    return _instance;
  }

  TransactionProfileResponse? _transactionProfileResponse;
  OrderResponse? _orderResponse;
  TransactionResponse? _transactionResponse;
  UserRoleContainerResponse? _userRoleContainerResponse;
  UserContainerResponse? _userContainerResponse;
  DiscountContainerResponse? _discountContainerResponse;
  TransactionFunctionResponse? _transactionFunctionResponse;
  DiscountCouponSummaryResponse? _discountCouponSummaryResponse;
  TransactionPrintReceiptResponse? _transactionPrintReceiptResponse;
  GetClockedInUsersResponse? _getClockedInUsersResponse;
  GetTransactionLogsResponse? _getTransactionLogsResponse;
  final _trxLineFunctions = <TaskTypesContainerDTO>[];
  final _trxHeaderFunctions = <TaskTypesContainerDTO>[];
  final _sortedTransactionProfiles = <TransactionProfileContainerDTO>[];

  Future<List<TransactionProfileContainerDTO>> getTransactionProfiles() async {
    try {
      final trxProfileHash = _preferences.getString(trxProfileHashKey);
      _transactionProfileResponse ??= await _transactionApiClient.getTransactionProfiles({
            'siteId': _executionContextDTO.siteId ?? -1,
            'hash': trxProfileHash,
            'rebuildCache': false,
          });

      if(_transactionProfileResponse?.data != null && _transactionProfileResponse?.exception == null) {
        var responseString = json.encode(_transactionProfileResponse!.toJson());
        await _preferences.setString(trxProfileHashKey, _transactionProfileResponse?.data?.hash ?? '');
        await _deleteFile(TRX_PROFILE_FILE_NAME);
        await _saveResponseToJsonFile(responseString, TRX_PROFILE_FILE_NAME);
      } else {
        _transactionProfileResponse = await getResponseFromFile<TransactionProfileResponse>(TRX_PROFILE_FILE_NAME, (json) => TransactionProfileResponse.fromJson(json));
        _transactionProfileResponse ??= await _transactionApiClient.getTransactionProfiles({
          'siteId': _executionContextDTO.siteId ?? -1
        });
      }

      if(_transactionProfileResponse != null) {
        _sortedTransactionProfiles.clear();
        final list = _transactionProfileResponse!.data?.transactionProfileContainerDTOList;
        if(list != null) {
          _sortedTransactionProfiles.addAll(list);
          _sortedTransactionProfiles.sort((first, second) => first.profileName.compareTo(second.profileName));
        }
      }

      return _sortedTransactionProfiles;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> initiateTransaction(
      {int? guestCount, String? guestName, String? guestContact, String? transactionIdentifier, int? tableId, int?approverID}) async {
    try {
      final approverDTO = ApprovalDTO(
          approverId:approverID?? _executionContextDTO.userPKId ?? 0, remarks: '');
      final tableOperationDetails = TableOperationDetails(
          reason: '', additionalComments: '', approvalDTO: approverDTO);
      final orderRequest = OrderRequest(
          tableId: tableId??-1,
          tableOperationDetails: tableOperationDetails,
          approvalDTO: approverDTO);

      final transactionRequest = TransactionRequest(
          guestCount: guestCount ?? 1,
          transactionProfileId: -1,
          primaryAccountNumber: '',
          guestName: guestName ?? '',
          transactionIdentifier: transactionIdentifier ?? '',
          guestContact: guestContact ?? '',
          tentNumber: '-1',
          remarks: '',
          transactionDateTime: null,
          approvalDTO: approverDTO);

      _orderResponse = await _transactionApiClient.createOrder(orderRequest);
      _transactionResponse = await _transactionApiClient.createTransaction(
          _orderResponse!.data?.orderId ?? 0, transactionRequest);

      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  TransactionResponse? getCurrentTransaction() {
    return _transactionResponse;
  }

  Future<TransactionResponse> addProductToLine(
      {required String seatName,
      required int seatNumber,
      int? transactionProfileId,
      String? remarks,
      int? lineNumber,
      required int productId,
      int? quantity,
      bool? existingAccount,
      double? userOverriddenPrice,
      String? lineDate,
      String? approvedBy}) async {
    final addLineDTO = AddLineRequest(
        seatName: seatName,
        courseName: null,
        comboProductId: 0,
        modifierSetId: -1,
        isNonChargeable: false,
        orderTypeId: 0,
        isReversed: false,
        onPrintHold: false,
        is9999Product: false,
        isCrossSellProduct: false,
        isUpsellProduct: false,
        userOverriddenPrice: userOverriddenPrice,
        transactionProfileId: transactionProfileId ?? -1,
        seatNumber: seatNumber,
        lineNumber: lineNumber ?? 0,
        lineDate: lineDate??null,
        productId: productId,
        quantity: quantity ?? 1,
        remarks: remarks ?? '',
        tagNumber: "",
        approvedBy: approvedBy
    );

    final requests = <AddLineRequest>[];
    requests.add(addLineDTO);

    try {
      _transactionResponse = await _transactionApiClient.addProductToLine(
          _transactionResponse?.data?.transactionId ?? 0, requests);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> add9999ProductToLine({
    required int productId,
    required String description,
    required double price,
    required int printerId,
    required String remarks,
    required int seatNo,
    required String seatName,
    int? approverID
  }) async {

    final approverDTO = ApprovalDTO(
        approverId: approverID?? _executionContextDTO.userPKId ?? 0, remarks: '');

    final addLineDTO = AddOpenLineRequest(
      productId: productId,
      description: description,
      price: price,
      printerId: printerId,
      remarks: remarks,
      approvalDTO: approverDTO,
      seatNo: seatNo,
      seatName: seatName,
    );

    try {
      _transactionResponse = await _transactionApiClient.add9999ProductToLine(
          _transactionResponse?.data?.transactionId ?? 0, [addLineDTO]);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> addCardToLine(
      {required String seatName,
        required int seatNumber,
        required int productId,
        List<String>? tagNumbers,
        double? userOverriddenPrice,
        bool? existingAccount,
        bool?isActive,
        String? remarks,
      required bool isSplitCard}) async {
    final requests = <AddLineRequest>[];
    if (tagNumbers != null && tagNumbers.isNotEmpty) {
      if(isSplitCard){
        final transactionAccountDtoList = <TransactionAccountDto>[];
        for (var tagNumber in tagNumbers) {
          final transactionAccountDto = TransactionAccountDto(
              transactionAccountId: -1,
              transactionId: _transactionResponse?.data?.transactionId ?? 0,
              transactionLineId: -1,
              accountId: -1,
              tagNumber: tagNumber ?? "",
              serialNumber: "",
              existingAccount: existingAccount ?? false,
              isActive: isActive ?? true);
          transactionAccountDtoList.add(transactionAccountDto);
        }
        final addLineDTO = AddLineRequest(
            seatName: seatName,
            courseName: null,
            comboProductId: 0,
            modifierSetId: -1,
            isNonChargeable: false,
            orderTypeId: 0,
            isReversed: false,
            onPrintHold: false,
            is9999Product: false,
            isCrossSellProduct: false,
            isUpsellProduct: false,
            approvedBy: _executionContextDTO.userId.toString(),
            userOverriddenPrice: userOverriddenPrice,
            seatNumber: seatNumber,
            lineNumber: 0,
            productId: productId,
            transactionAccountDTO: transactionAccountDtoList,
            quantity: 1,
            remarks: remarks??'');
        requests.add(addLineDTO);
      }else{
        for (var tagNumber in tagNumbers) {
          final transactionAccountDto = TransactionAccountDto(
              transactionAccountId: -1,
              transactionId: _transactionResponse?.data?.transactionId ?? 0,
              transactionLineId: -1,
              accountId: -1,
              tagNumber: tagNumber ?? "",
              serialNumber: "",
              existingAccount: existingAccount ?? false,
              isActive: isActive ?? true);
          // transactionAccountDtoList.add(transactionAccountDto);
          final addLineDTO = AddLineRequest(
              seatName: seatName,
              courseName: null,
              comboProductId: 0,
              modifierSetId: -1,
              isNonChargeable: false,
              orderTypeId: 0,
              isReversed: false,
              onPrintHold: false,
              is9999Product: false,
              isCrossSellProduct: false,
              isUpsellProduct: false,
              userOverriddenPrice: userOverriddenPrice,
              seatNumber: seatNumber,
              approvedBy: _executionContextDTO.userId.toString(),
              lineNumber: 0,
              productId: productId,
              transactionAccountDTO: [transactionAccountDto],
              quantity: 1,
              remarks: remarks??'');
          requests.add(addLineDTO);
        }
      }
    }

      try {
        _transactionResponse = await _transactionApiClient.addProductToLine(
            _transactionResponse?.data?.transactionId ?? 0, requests);
        return _transactionResponse!;
      } on DioError {
        rethrow;
      }
  }

  Future<TransactionResponse> removeProductFromLine(
      {required List<int> transactionLineIds,
        required int reasonId,
        int?approverID,
      String? reason,
      String? lineRemarks}) async {
    final approverDTO = ApprovalDTO(
        approverId:approverID?? _executionContextDTO.userPKId ?? 0, remarks: '');
    final requests = <RemoveLineRequest>[];
    for(int ids in transactionLineIds) {
      final removeLineDTO = RemoveLineRequest(
          transactionLineId: ids,
          reason: reason ?? '',
          reasonId: reasonId ,
          lineRemarks: lineRemarks ?? '',
          approvalDTO: approverDTO);
      requests.add(removeLineDTO);
    }

    try {
      _transactionResponse = await _transactionApiClient.removeProductFromLine(
          _transactionResponse?.data?.transactionId ?? 0, requests);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> addTransactionRemark(
      {required String remarks}) async {
    try {
      // Parsing "Remarks" string as body was not able to implement using Retrofit and Dio , So we used Regular http method .
      var headers = {
        'Authorization': _executionContextDTO.webApiToken ?? '',
      'Content-Type': 'application/json'
      };
      var url = Uri.parse('${_appPrefsBL.getServerUrl()}/api/Transaction/Transaction/${_transactionResponse?.data?.transactionId ?? 0}/Remarks');
      var response = await http.post(url,headers: headers, body:json.encode(remarks));
      if(response.statusCode == 200){
        _transactionResponse =  TransactionResponse.fromJson(jsonDecode(response.body)) ;
      }
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> addTransactionRemarkLine(
      {int? approverId,
      required List<int> transactionLineIds,
      required String lineRemarks,
      String? remarks}) async {
    try {
      final approverDTO = ApprovalDTO(
          approverId: approverId ?? _executionContextDTO.userPKId ?? 0,
          remarks: remarks ?? '');
      final requests = <TransactionRemarkLineRequest>[];
    for(int ids in transactionLineIds){
      final transactionRemarkLineRequest = TransactionRemarkLineRequest(
          lineRemarks: lineRemarks,
          transactionLineId: ids,
          approvalDTO: approverDTO);
      requests.add(transactionRemarkLineRequest);
    }

      _transactionResponse =
          await _transactionApiClient.createTransactionRemarkLine(
              _transactionResponse?.data?.transactionId ?? 0, requests);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> updateProductToLine(List<TransactionLineDTO> transactionLines) async {
    try {
      _transactionResponse =
          await _transactionApiClient.updateProductToLineClient(
              _transactionResponse?.data?.transactionId ?? 0, transactionLines);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> applyProfileToTransactionLine({required int profileId,
    required List<int> transactionLineIds,
    String? remarks,
    int?approverID
  }) async {
    try {
      final approverDTO = ApprovalDTO(
          approverId:approverID?? _executionContextDTO.userPKId ?? 0, remarks: '');

      final transactionRemarkLineRequest = TransactionProfileRequest(
          transactionLineIdList: transactionLineIds,
          remarks: remarks ?? '',
          profileId: profileId,
          name: '',
          identification: '',
          approvalDTO: approverDTO);

      _transactionResponse =
          await _transactionApiClient.applyProfileToTransactionLines(
              _transactionResponse?.data?.transactionId ?? 0,
              transactionRemarkLineRequest);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> updateTransactionIdentifiers(
      {int? guestCount,
      String? guestName,
      String? transactionRemarks,
      int? approverId,
      String? transactionIdentifier,
      String? guestContact,
      int? transactionProfileId,
      String? transactionDateTime,
      String? remarks}) async {
    try {
      final approverDTO = ApprovalDTO(
          approverId: approverId ?? _executionContextDTO.userPKId ?? 0,
          remarks: remarks ?? '');

      final transactionRequest = TransactionRequest(
          guestCount: guestCount ?? _transactionResponse?.data?.guestCount ?? 1,
          transactionProfileId: transactionProfileId ?? -1,
          primaryAccountNumber: '',
          guestName: guestName ?? _transactionResponse?.data?.guestName ?? '',
          transactionIdentifier: transactionIdentifier ??
              _transactionResponse?.data?.transactionIdentifier ??
              '',
          guestContact: guestContact ??
              _transactionResponse?.data?.guestContactNumber ??
              '',
          tentNumber: '-1',
          remarks:
              transactionRemarks ?? _transactionResponse?.data?.remarks ?? '',
          transactionDateTime: transactionDateTime ??
              _transactionResponse?.data?.transactionDate ??
              '',
          approvalDTO: approverDTO);

      _transactionResponse =
          await _transactionApiClient.updateTransactionIdentifiersClient(
              _transactionResponse?.data?.transactionId ?? 0,
              transactionRequest);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> updateTransactionLineCourse(
      {int? approverId,
      required String courseName,
      required List<int> transactionLineIds,
      required String lineRemarks,
      String? remarks}) async {
    try {
      final approverDTO = ApprovalDTO(
          approverId: approverId ?? _executionContextDTO.userPKId ?? 0,
          remarks: remarks ?? '');

      final requests = <UpdateLineCourseRequest>[];
      for(int ids in transactionLineIds){
      final transactionLineCourseRequest = UpdateLineCourseRequest(
          courseName: courseName,
          lineRemarks: lineRemarks,
          transactionLineId: ids,
          approvalDTO: approverDTO);
      requests.add(transactionLineCourseRequest);
      }


      _transactionResponse =
          await _transactionApiClient.updateTransactionLineCourseClient(
              _transactionResponse?.data?.transactionId ?? 0, requests);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> clearTransaction() async {
    try {
      _transactionResponse = await _transactionApiClient
          .clearTransaction(_transactionResponse?.data?.transactionId ?? 0);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> saveTransaction() async {
    try {
      _transactionResponse = await _transactionApiClient
          .saveTransaction(_transactionResponse?.data?.transactionId ?? 0);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> saveAndHoldTransaction() async {
    try {
      _transactionResponse = await _transactionApiClient.saveAndHoldTransaction(
          _transactionResponse?.data?.transactionId ?? 0);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> linkCustomerToTransaction(
      {required int customerId}) async {
    try {
      _transactionResponse =
          await _transactionApiClient.linkCustomerToTransaction(
              _transactionResponse?.data?.transactionId ?? 0, customerId);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> deLinkCustomerFromTransaction() async {
    try {
      _transactionResponse =
          await _transactionApiClient.deLinkCustomerFromTransaction(
              _transactionResponse?.data?.transactionId ?? 0);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> changeTransactionStaff(
      {required int userId, int?approverID}) async {
    try {
      final approverDTO = ApprovalDTO(
          approverId:approverID?? _executionContextDTO.userPKId ?? 0, remarks: '');
      final staffRequest =
          SetStaffRequest(userId: userId, approvalDTO: approverDTO);
      _transactionResponse = await _transactionApiClient.changeTransactionStaff(
          _transactionResponse?.data?.transactionId ?? 0, staffRequest);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<UserRoleContainerResponse> getUsersRoleContainer() async {
    try {
      _userRoleContainerResponse = await _transactionApiClient
          .getUsersRoleContainer({'siteId': _executionContextDTO.siteId});
      return _userRoleContainerResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<UserContainerResponse> getUserContainer() async {
    try {
      final userContainerHash = _preferences.getString(userContainerHashKey);
      _userContainerResponse = await _transactionApiClient.getUserContainerList({
        'siteId': _executionContextDTO.siteId,
        'hash': userContainerHash,
        'rebuildCache': false,
      });
      if(_userContainerResponse?.data != null && _userContainerResponse?.exception == null) {
        var responseString = json.encode(_userContainerResponse!.toJson());
        await _preferences.setString(userContainerHashKey, _userContainerResponse?.data?.hash ?? '');
        await _deleteFile(USER_CONTAINER_FILE_NAME);
        await _saveResponseToJsonFile(responseString, USER_CONTAINER_FILE_NAME);
        return _userContainerResponse!;
      } else {
        _userContainerResponse = await getResponseFromFile<UserContainerResponse>(USER_CONTAINER_FILE_NAME, (p0) => UserContainerResponse.fromJson(p0));
        _userContainerResponse ??= await _transactionApiClient.getUserContainerList({'siteId': _executionContextDTO.siteId});
        return _userContainerResponse!;
      }
    } on DioError {
      rethrow;
    }
  }

  Future<T?> getResponseFromFile<T>(String fileName, T Function(Map<String, dynamic>) fromJson) async {
    var localPath = await _localPath;
    bool isFileAvailable = await File('$localPath/files/$fileName').exists();
    if(isFileAvailable) {
      final file = File('$localPath/files/$fileName');
      var fileContent = await file.readAsString();
      final responseMap = json.decode(fileContent) as Map<String, dynamic>;
      final response = fromJson(responseMap);
      return response;
    } else {
      return null;
    }
  }

  Future<int> _deleteFile(String fileName) async {
    try {
      var localPath = await _localPath;
      final file = File('$localPath/files/$fileName');
      await file.delete();
      return 1;
    } catch (e) {
      return 0;
    }
  }


  Future<void> _saveResponseToJsonFile(String response, String fileName) async {
    var localPath = await _localPath;
    await Directory('$localPath/files').create(recursive: false);
    await File('$localPath/files/$fileName').writeAsString(response);
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<DiscountContainerResponse> getDiscountsContainer() async {
    try {
      if (_discountContainerResponse == null){
        _discountContainerResponse = await _transactionApiClient
            .getDiscountsContainer({'siteId': _executionContextDTO.siteId});
      return _discountContainerResponse!;
    }else{
      return _discountContainerResponse!;
    }
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> setTransactionProfileId(
      {required int transactionProfileId, int?approverID}) async {
    try {
      final approverDTO = ApprovalDTO(
          approverId:approverID?? _executionContextDTO.userPKId ?? 0, remarks: '');
      final setTransactionProfileIdRequest = SetTransactionProfileIdRequest(
          transactionProfileId: transactionProfileId, approvalDTO: approverDTO);
      _transactionResponse =
          await _transactionApiClient.setProfileIdForTransaction(
              _transactionResponse?.data?.transactionId ?? 0,
              setTransactionProfileIdRequest);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  void clearTransactionFunctions() {
    _transactionFunctionResponse = null;
  }


  Future<TransactionResponse> completeTransaction({
     String? reason, String? remarks, int?approverID}) async {
    try {
      final approverDTO = ApprovalDTO(
          approverId:approverID?? _executionContextDTO.userPKId ?? 0, remarks: '');
      final completeTransactionRequest = CloseTransactionRequest(
          transactionId: _transactionResponse?.data?.transactionId?? 0,reason: reason ??'',remarks: remarks??'', approvalDTO: approverDTO);
      _transactionResponse =
      await _transactionApiClient.completeTransaction(
          _transactionResponse?.data?.orderId ?? 0,
          completeTransactionRequest);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> cancelTransaction({
    String? reason, String? remarks,int?approverID}) async {
    try {
      final approverDTO = ApprovalDTO(
          approverId:approverID?? _executionContextDTO.userPKId ?? 0, remarks: '');
      final cancelTransactionRequest = CloseTransactionRequest(
          transactionId: _transactionResponse?.data?.transactionId??0,reason: reason ??'',remarks: remarks??'', approvalDTO: approverDTO);
      _transactionResponse =
      await _transactionApiClient.cancelTransaction(
          _transactionResponse?.data?.orderId ?? 0,
          cancelTransactionRequest);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> reopenTransaction({
    String? reason, String? remarks, int?approverID}) async {
    try {
      final approverDTO = ApprovalDTO(
          approverId:approverID?? _executionContextDTO.userPKId ?? 0, remarks: '');
      final cancelTransactionRequest = CloseTransactionRequest(
          transactionId: _transactionResponse?.data?.transactionId??0,reason: reason ??'',remarks: remarks??'', approvalDTO: approverDTO);
      _transactionResponse =
      await _transactionApiClient.reopenTransaction(
          _transactionResponse?.data?.orderId ?? 0,
          cancelTransactionRequest);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> addTransactionDiscount({
    required int discountId,String? couponNumber, int? transactionDiscountId, double? discountAmount,int?approverID, String? remarks}) async {
    try {
      final approverDTO = ApprovalDTO(
          approverId:approverID?? _executionContextDTO.userPKId ?? 0, remarks: remarks ?? '');
      final addDiscountRequest = AddTransactionDiscountRequest(
          approvalDTO: approverDTO,
          transactionDiscountId: transactionDiscountId??-1,
          discountId: discountId,
          discountAmount: discountAmount??0,
          couponNumber: couponNumber??'');
      _transactionResponse =
      await _transactionApiClient.addDiscountForTransaction(
          _transactionResponse?.data?.transactionId ?? 0,
          addDiscountRequest);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> addTransactionLineDiscount({
    required int discountId,String? couponNumber,String? remarks,required int transactionLineId, double? discountAmount,int?approverID}) async {
    try {
      final approverDTO = ApprovalDTO(
          approverId:approverID?? _executionContextDTO.userPKId ?? 0, remarks: '');
      final addDiscountRequest = AddTransactionLineDiscountRequest(
          approvalDTO: approverDTO,
          transactionLineId: transactionLineId,
          discountId: discountId,
          discountAmount: discountAmount??0,
          couponNumber: couponNumber??'', remarks:remarks??'' );
      _transactionResponse =
      await _transactionApiClient.addDiscountForTransactionLine(
          _transactionResponse?.data?.transactionId ?? 0,
          addDiscountRequest);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> removeTransactionDiscount({
    required int discountId,String? couponNumber, int? transactionDiscountId, double? discountAmount, int?approverID}) async {
    try {
      final approverDTO = ApprovalDTO(
          approverId:approverID?? _executionContextDTO.userPKId ?? 0, remarks: '');
      final addDiscountRequest = AddTransactionDiscountRequest(
          approvalDTO: approverDTO,
          transactionDiscountId: transactionDiscountId??-1,
          discountId: discountId,
          discountAmount: discountAmount??0,
          couponNumber: couponNumber??'');
      _transactionResponse =
      await _transactionApiClient.removeDiscountForTransaction(
          _transactionResponse?.data?.transactionId ?? 0,
          addDiscountRequest);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> removeTransactionLineDiscount({
    required int discountId,String? couponNumber,String? remarks,required int transactionLineId, double? discountAmount,int?approverID}) async {
    try {
      final approverDTO = ApprovalDTO(
          approverId:approverID?? _executionContextDTO.userPKId ?? 0, remarks: '');
      final addDiscountRequest = AddTransactionLineDiscountRequest(
          approvalDTO: approverDTO,
          transactionLineId: transactionLineId,
          discountId: discountId,
          discountAmount: discountAmount??0,
          couponNumber: couponNumber??'', remarks:remarks??'' );
      _transactionResponse =
      await _transactionApiClient.removeDiscountForTransactionLine(
          _transactionResponse?.data?.transactionId ?? 0,
          addDiscountRequest);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> addModifierProductsToLine(List<AddModifierProductRequest> addModifierProducts) async {
    try {
      _transactionResponse =
          await _transactionApiClient.addModifierProductsToTransaction(
          _transactionResponse?.data?.transactionId ?? 0, addModifierProducts);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> makeTransactionNonChargable(String? remarks,{int?approverID}) async {
    try {
      final transactionNonChargableRequest = TransactionNonChargableRequest(
          approverId:approverID?? _executionContextDTO.userPKId ?? 0,
          remarks:remarks??""
      );
      _transactionResponse =
      await _transactionApiClient.makeTransactionNonChargableClient(
          _transactionResponse?.data?.transactionId ?? 0,transactionNonChargableRequest);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> updateTransactionLinesSeat(
      List<int> transactionLineIds, String seatName, String seatNumber,
      {int?approverID}) async {
    try {

      final requests = <UpdateTransactionLineSeatRequest>[];
      for (var transactionLineId in transactionLineIds) {
        final updateTransactionLineSeatRequest = UpdateTransactionLineSeatRequest(
            transactionLineId: transactionLineId,
            seatName: seatName,
            seatNumber: seatNumber,
            lineRemarks: '',
            approvalDto: ApprovalDTO(approverId:approverID?? _executionContextDTO.userPKId ?? 0, remarks: ''));
        requests.add(updateTransactionLineSeatRequest);
      }

      _transactionResponse = await _transactionApiClient.updateSeatForTransactionLine(
          _transactionResponse?.data?.transactionId ?? 0,  requests);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> orderTransactionLines(List<TransactionLineDTO> transactionLines,{int?approverID}) async {
    try {
      final requests = <OrderTransactionLinesRequest>[];
      for (TransactionLineDTO transactionLine in transactionLines) {
        final transactionAccountDtoList = <TransactionAccountDto>[];
        // transactionAccountDtoList.add(TransactionLineAccountDto(
        //     transactionAccountId: -1,
        //     transactionId: _transactionResponse?.data?.transactionId ?? 0,
        //     transactionLineId: transactionLine.transactionLineId,
        //     accountId: -1,
        //     tagNumber: transactionLine.tagNumber ?? "",
        //     serialNumber: "",
        //     existingAccount: false,
        //     isActive: false
        // ));
        final orderTransactionLineRequest = OrderTransactionLinesRequest(
            transactionLineId: transactionLine.transactionLineId,
            transactionAccountDtoList: transactionLine.transactionAccountDTOList??[],
            approvalDto: ApprovalDTO(approverId:approverID?? _executionContextDTO.userPKId ?? 0, remarks: ''));
        requests.add(orderTransactionLineRequest);
      }

      _transactionResponse = await _transactionApiClient.orderTransactionLines(
          _transactionResponse?.data?.transactionId ?? 0,
          requests);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  TransactionResponse saveToTransactionResponse(TransactionData? transactionData)  {
    try {
      if(_transactionResponse != null){
        _transactionResponse = _transactionResponse?.copyWith(data: transactionData);
      }else{
        _transactionResponse = TransactionResponse(data: transactionData);
      }
      //TransactionResponse.fromJson(jsonDecode(transactionData!));
      print("$_transactionResponse");
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<DiscountCouponSummaryResponse> getDiscountCouponDetails({required String couponNumber}) async {
    try {
      _discountCouponSummaryResponse = await _transactionApiClient
          .getDiscountsCouponSummary({'couponNumber': couponNumber??''});
      return _discountCouponSummaryResponse!;
    } on DioError {
      rethrow;
    }
  }


  Future<TransactionPrintReceiptResponse> getTransactionPrintReceipt(String format) async {
    try {
      _transactionPrintReceiptResponse = await _transactionApiClient.getTransactionReceipt(
          _transactionResponse?.data?.transactionId ?? -1, {
            'TransactionId': _transactionResponse?.data?.transactionId ?? 0,
            'formats': format,
          });

      return _transactionPrintReceiptResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> overrideTransactionLinePrice(List<int> transactionLineIds, double overriddenPrice, String lineRemarks,
      {int? approverID}) async {
    try {
      final overridePriceRequest = OverridePriceRequest(
          transactionLineIds: transactionLineIds,
          lineRemarks: lineRemarks ?? "",
          overridePrice: overriddenPrice,
          approvalDto: ApprovalDTO(approverId:approverID?? _executionContextDTO.userPKId ?? 0, remarks: ''));
      _transactionResponse = await _transactionApiClient.overrideTransactionLinePrice(
          _transactionResponse?.data?.transactionId ?? 0,
          overridePriceRequest);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<GetClockedInUsersResponse> getClockedInUsers() async {
    try {
      _getClockedInUsersResponse = await _transactionApiClient.getAllClockedInUsers();
      return _getClockedInUsersResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<GetTransactionLogsResponse> getTransactionLogs() async {
    try {
      _getTransactionLogsResponse = await _transactionApiClient.getTransactionLogs(_transactionResponse?.data?.transactionId ?? 0);
      return _getTransactionLogsResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> makeTransactionChargable(String? remarks,{int?approverID}) async {
    try {
      final transactionNonChargableRequest = TransactionNonChargableRequest(
          approverId:approverID?? _executionContextDTO.userPKId ?? 0,
          remarks:remarks??""
      );
      _transactionResponse =
      await _transactionApiClient.makeTransactionChargableClient(
          _transactionResponse?.data?.transactionId ?? 0,transactionNonChargableRequest);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> reverseTransactionLine(
      List<int> transactionLineIds, int reasonId, String remarks, bool reverseObligations, bool forceReverseUsedObligations,
      {int? approverID}) async {
    try {
      final approvalDto = ApprovalDTO(approverId:approverID?? _executionContextDTO.userPKId ?? 0, remarks: '');
      final requests = <TransactionLineReverseDto>[];
      for(int ids in transactionLineIds) {
        final transactionLineReverseDto = TransactionLineReverseDto(
            transactionLineId: ids,
          reasonId: reasonId,
          remarks: remarks,
          reverseObligations: reverseObligations,
          forceReverseUsedObligations: forceReverseUsedObligations,
          approvalDTO: approvalDto
        );
        requests.add(transactionLineReverseDto);
      }

      _transactionResponse = await _transactionApiClient.reverseTransactionLine(
          _transactionResponse?.data?.transactionId ?? 0,
          requests);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> reverseTransaction(int reasonId, String remarks, bool reverseObligations, bool forceReverseUsedObligations,
      {int? approverID}) async {
    try {
      final approvalDto = ApprovalDTO(approverId:approverID?? _executionContextDTO.userPKId ?? 0, remarks: '');
      final transactionReverseDto = TransactionReverseDto(
          transactionId: _transactionResponse?.data?.transactionId ?? 0,
          reasonId: reasonId,
          remarks: remarks,
          reverseObligations: reverseObligations,
          forceReverseUsedObligations: forceReverseUsedObligations,
          transactionLineIdList: [],
          approvalDTO: approvalDto);

      _transactionResponse = await _transactionApiClient.reverseTransaction(
        _transactionResponse?.data?.orderId ?? 0,
         transactionReverseDto);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> lockTransaction() async {
    try {
      _transactionResponse = await _transactionApiClient
          .lockTransaction(_transactionResponse?.data?.transactionId ?? 0);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionResponse> unlockTransaction() async {
    try {
      _transactionResponse = await _transactionApiClient
          .unlockTransaction(_transactionResponse?.data?.transactionId ?? 0);
      return _transactionResponse!;
    } on DioError {
      rethrow;
    }
  }

  void clear() {
    _transactionProfileResponse = null;
    _orderResponse = null;
    _transactionResponse = null;
    _userRoleContainerResponse = null;
    _userContainerResponse = null;
    _discountContainerResponse = null;
    _transactionPrintReceiptResponse = null;
    _getClockedInUsersResponse = null;
    _getTransactionLogsResponse = null;
  }
}
