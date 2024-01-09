import 'dart:convert';
import 'dart:io';

import 'package:application_prefs_data/application_prefs_data_bl.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:logs_data/logger.dart';
import 'package:orders_data/api_client/orders_api_client.dart';
import 'package:orders_data/constants.dart';
import 'package:orders_data/models/facility_container/facility_container_dto.dart';
import 'package:orders_data/models/facility_container/facility_container_response.dart';
import 'package:orders_data/models/facility_table/facility_table_response.dart';
import 'package:orders_data/models/facility_table_container/facility_table_container_dto.dart';
import 'package:orders_data/models/facility_table_container/facility_table_container_response.dart';
import 'package:orders_data/models/facility_table_current_status/facility_table_current_status_dto.dart';
import 'package:orders_data/models/facility_table_current_status/facility_table_current_status_response.dart';
import 'package:orders_data/models/orders_data_count/orders_data_count_response.dart';
import 'package:orders_data/models/orders_data_response/orders_data_response.dart';
import 'package:orders_data/models/search_count/table_search_count_response.dart';
import 'package:orders_data/models/table_search_data/table_search_data_response.dart';
import 'package:orders_data/models/transaction_data_count/transaction_count_response.dart';
import 'package:orders_data/models/transaction_status_container/transaction_status_container_dto.dart';
import 'package:orders_data/models/transaction_status_container/transaction_status_container_response.dart';
import 'package:orders_data/models/transactions/transaction_response.dart';
import 'package:orders_data/models/user_container/user_container_dto.dart';
import 'package:orders_data/models/user_container/user_container_response.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/facility_table/facility_table.dart';
import 'models/generic_response.dart';


class OrdersDataService{

  static const FACILITY_TABLE_FILE_NAME = 'facility_table_response.json';
  static const USER_CONTAINER_FILE_NAME = 'user_container_response.json';
  static const TRX_STATUS_FILE_NAME = 'trx_status_response.json';

  late OrdersApiClient _ordersDataApiClient;
  late ExecutionContextDTO _executionContextDTO;
  late ApplicationPrefsDataBLContract _appPrefsBL;
  late SharedPreferences _preferences;

  static final OrdersDataService _instance =  OrdersDataService._internal();
  OrdersDataService._internal();

  factory OrdersDataService(OrdersApiClient apiClient, ExecutionContextDTO executionContextDTO, SharedPreferences sharedPreferences, ApplicationPrefsDataBLContract appPrefsBL){
    _instance._ordersDataApiClient = apiClient;
    _instance._executionContextDTO = executionContextDTO;
    _instance._appPrefsBL = appPrefsBL;
    _instance._preferences = sharedPreferences;
    return _instance;
  }

  FacilityTableContainerResponse? _facilityTableContainerResponse;
  FacilityTableCurrentStatusResponse? _facilityTableCurrentStatusResponse;
  TableSearchCountResponse? _tableSearchCountResponse;
  TransactionStatusContainerResponse? _transactionStatusContainerResponse;
  TransactionsCountResponse? _transactionsCountResponse;
  UserContainerResponse? _userContainerResponse;
  OrdersDataResponse? _ordersDataResponse;
  OrdersDataCountResponse? _ordersDataCountResponse;
  int _pageSize = 50;


  Future<List<UserContainerDTO>?> getUserContainer() async {
    if(_userContainerResponse == null) {
      _userContainerResponse = await _getUserContainer();
      return _userContainerResponse?.data?.userContainerDTOList;
    } else {
      return _userContainerResponse?.data?.userContainerDTOList;
    }
  }

  Future<List<FacilityTableContainerDTO>?> getFacilityTableContainer() async {
    if(_facilityTableContainerResponse == null) {
      _facilityTableContainerResponse = await _getFacilitiesTable();
      return _facilityTableContainerResponse?.data?.facilityTablesContainerDTOList;
    } else {
      return _facilityTableContainerResponse?.data?.facilityTablesContainerDTOList;
    }
  }

  Future<FacilityTableContainerResponse> _getFacilitiesTable() async{
    try{
      final facilitiesTableHash = _preferences.getString(facilitiesTableHashKey);
      Log.printMethodStart('_getFacilities()', 'Orders Screen','init');
      final response = await _ordersDataApiClient.getFacilityTableContainer({
        'siteId': _executionContextDTO.siteId,
        'hash': facilitiesTableHash,
        'rebuildCache': false,
      });

      if(response.data != null && response.exception == null) {
        var responseString = json.encode(response.toJson());
        await _preferences.setString(facilitiesTableHashKey, response.data?.hash ?? '');
        await _deleteFile(FACILITY_TABLE_FILE_NAME);
        await _saveResponseToJsonFile(responseString, FACILITY_TABLE_FILE_NAME);
        Log.printMethodEnd('_getFacilities()', 'Orders Screen','init');
        _facilityTableContainerResponse = response;
        Log.printMethodReturn('_getFacilities() - getFacilityContainer done', 'Orders Screen','init');
        return response;
      } else {
        var resp = await getResponseFromFile<FacilityTableContainerResponse>(FACILITY_TABLE_FILE_NAME, (p0) => FacilityTableContainerResponse.fromJson(p0));
        resp ??= await _ordersDataApiClient.getFacilityTableContainer({
          'siteId': _executionContextDTO.siteId ?? 0
        });
        Log.printMethodEnd('_getFacilities()', 'Orders Screen','init');
        _facilityTableContainerResponse = response;
        Log.printMethodReturn('_getFacilities() - getFacilityContainer done', 'Orders Screen','init');
        return resp;
      }
    }on DioError {
      rethrow;
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

  Future<UserContainerResponse> _getUserContainer() async{
    try{
      final userContainerHash = _preferences.getString(userContainerHashKey);
      Log.printMethodStart('_getUserContainer()', 'Orders Screen','init');
      final response = await _ordersDataApiClient.getUserContainer({
        'siteId': _executionContextDTO.siteId,
        'hash': userContainerHash,
        'rebuildCache': false,
      });
      if(response.data != null && response.exception == null) {
        var responseString = json.encode(response.toJson());
        await _preferences.setString(userContainerHashKey, response.data?.hash ?? '');
        await _deleteFile(USER_CONTAINER_FILE_NAME);
        await _saveResponseToJsonFile(responseString, USER_CONTAINER_FILE_NAME);
        Log.printMethodEnd('_getUserContainer()', 'Orders Screen','init');
        _userContainerResponse = response;
        Log.printMethodReturn('_getUserContainer() - _getUserContainer done', 'Orders Screen','init');
        return response;
      } else {
        var resp = await getResponseFromFile<UserContainerResponse>(USER_CONTAINER_FILE_NAME, (p0) => UserContainerResponse.fromJson(p0));
        resp ??= await _ordersDataApiClient.getUserContainer({
          'siteId': _executionContextDTO.siteId ?? 0
        });
        Log.printMethodEnd('_getUserContainer()', 'Orders Screen','init');
        _userContainerResponse = response;
        Log.printMethodReturn('_getUserContainer() - _getUserContainer done', 'Orders Screen','init');
        return resp;
      }
    }on DioError {
      rethrow;
    }
  }


  Future<TableSearchDataResponse> getTableSearchData({
    int currentPage = 0,
    int pageSize = 50,
    int facilityId = 0,
    String? facilityIdList,
    int posMachineId = -1,
    String? status,
    String? capacity,}) async{
    _pageSize = pageSize;
    try{
     _tableSearchCountResponse = await _ordersDataApiClient.getTableSearchDataCount({
       'siteId': _executionContextDTO.siteId ?? 0,
       'facilityId': facilityId,
       'facilityIdList' : facilityIdList,
       'posMachineId' : posMachineId,
       'tableStatusInList':status,
       'capacity':(capacity == '0') ? null : capacity,
     });

     return _ordersDataApiClient.getTableSearchData({
       'siteId': _executionContextDTO.siteId ?? 0,
       'pageNumber': currentPage,
       'pageSize': pageSize,
       'posMachineId' : posMachineId,
       'facilityId': facilityId,
       'facilityIdList' : facilityIdList,
       'tableStatusInList':status,
       'capacity':(capacity == '0') ? null : capacity,
     },);
    }on DioError {
      rethrow;
    }
  }

  int? getTotalCount() {
    return _tableSearchCountResponse?.data;
  }

  int? getTotalPages() {
    var total = getTotalCount()?.toInt() ?? 50;
    var pages = total/_pageSize;
    return pages.ceil();
  }

  Future<List<TransactionStatusContainerDTO>?> getTransactionStatus() async {
    if(_transactionStatusContainerResponse == null) {
      _transactionStatusContainerResponse = await _getTransactionStatus();
      return _transactionStatusContainerResponse?.data?.transactionStatusContainerDTO;
    } else {
      return _transactionStatusContainerResponse?.data?.transactionStatusContainerDTO;
    }
  }

  Future<TransactionStatusContainerResponse> _getTransactionStatus() async{
    try{
      final trxStatusHash = _preferences.getString(trxStatusHashKey);
      Log.printMethodStart('_getTransactionStatus()', 'Orders Screen','init');
      final response = await _ordersDataApiClient.getTransactionStatusContainer({
        'siteId': _executionContextDTO.siteId,
        'hash': trxStatusHash,
        'rebuildCache': false,
      });
      if(response.data != null && response.exception == null) {
        var responseString = json.encode(response.toJson());
        await _preferences.setString(trxStatusHashKey, response.data?.hash ?? '');
        await _deleteFile(TRX_STATUS_FILE_NAME);
        await _saveResponseToJsonFile(responseString, TRX_STATUS_FILE_NAME);
        Log.printMethodEnd('_getTransactionStatus()', 'Orders Screen','init');
        _transactionStatusContainerResponse = response;
        Log.printMethodReturn('_getTransactionStatus() - Get Transaction Status done!', 'Orders Screen','init');
        return response;
      } else {
        var resp = await getResponseFromFile<TransactionStatusContainerResponse>(TRX_STATUS_FILE_NAME, (json) => TransactionStatusContainerResponse.fromJson(json));
        resp ??= await _ordersDataApiClient.getTransactionStatusContainer({
          'siteId': _executionContextDTO.siteId ?? 0
        });
        Log.printMethodEnd('_getTransactionStatus()', 'Orders Screen','init');
        _transactionStatusContainerResponse = response;
        Log.printMethodReturn('_getTransactionStatus() - Get Transaction Status done!', 'Orders Screen','init');
        return resp;
      }
    }on DioError {
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

  /*Future<List<OrderStatusContainerDTO>?> getOrderStatus() async {
    if(_orderStatusContainerResponse == null) {
      _orderStatusContainerResponse = await _getOrderStatus();
      return _orderStatusContainerResponse?.data?.orderStatusContainerDTO;
    } else {
      return _orderStatusContainerResponse?.data?.orderStatusContainerDTO;
    }
  }


  Future<OrderStatusContainerResponse> _getOrderStatus() async{
    try{
      final response = await _ordersDataApiClient.getOrderStatusContainer({
        'siteId': _executionContextDTO.siteId ?? 0
      });
      _orderStatusContainerResponse = response;
      return response;
    }on DioError {
      rethrow;
    }
  }*/

  Future<TransactionResponse> getTransactions({
    int currentPage = 0,
    int pageSize = 50,
    String? trxNumber,
    int trxId = 0,
    int? orderNo,
    int? posMachine,
    String? status,
    String? otp,
    String? reference,
    String? customerName,
    String? fromDate,
    String? toDate,
    String? guestName,
    String? contact,
    int? staff,
    int? ccNumber,
    bool hasHoldLines = false
  }) async{
    _pageSize = pageSize;
    try{
      _transactionsCountResponse = await _ordersDataApiClient.getTransactionsCount({
        'siteId': _executionContextDTO.siteId ?? 0,
        if(trxNumber != null) 'transactionNumber':trxNumber,
        if(trxId != 0) 'transactionId':trxId,
        //"order_no"
        if(orderNo != 0) 'orderId':orderNo,
        //if(posMachine != 'All') 'posName': posMachine,
        'posMachineId': posMachine,
        if(status != null) 'transactionStatusInList':status,
        if(otp != null) 'transactionOTP':otp,
        //"reference"
        if(reference != null) "externalSystemReference":reference,
        //customer_name
        //'customerId':customerName ?? -1,
        if(fromDate != null) 'fromDateTime':fromDate,
        'guestName' : guestName,
        if(contact != null) 'guestContactHash': contact,
        if(toDate != null) 'toDateTime':toDate,
        if(staff != null) 'userId':staff,
        if(ccNumber != 0) 'creditCardNumber':ccNumber,
        'hasHoldLines' : hasHoldLines
      });

      return _ordersDataApiClient.getTransactions({
        'siteId': _executionContextDTO.siteId ?? 0,
        'pageNumber': currentPage,
        'pageSize': pageSize,
        if(trxNumber != null) 'transactionNumber':trxNumber,
        if(trxId != 0) 'transactionId':trxId,
        if(orderNo != 0)'orderId':orderNo,
        'posMachineId': posMachine,
        //if(posMachine != "All") 'posName': posMachine,
        if(status != null) 'transactionStatusInList':status,
        if(otp != null) 'transactionOTP':otp,
        //"reference"
        if(reference != null) "externalSystemReference":reference,
        //customer_name
        //'customerId':customerName ?? -1,
        if(fromDate != null) 'fromDateTime':fromDate,
        if(toDate != null) 'toDateTime':toDate,
        'guestName' : guestName,
        if(contact != null) 'guestContactHash': contact,
        if(staff != null) 'userId':staff,
        if(ccNumber != 0) 'creditCardNumber':ccNumber,
        'hasHoldLines' : hasHoldLines
      },);
    }on DioError {
      rethrow;
    }
  }

  int? getTotalTransactionCount() {
    return _transactionsCountResponse?.data;
  }

  int? getTotalTransactionPages() {
    var total = getTotalTransactionCount()?.toInt() ?? 50;
    var pages = total/_pageSize;
    return pages.ceil();
  }

  int? getTotalOrdersCount() {
    return _ordersDataCountResponse?.data;
  }

  int? getTotalOrderPages() {
    var total = getTotalOrdersCount()?.toInt() ?? 50;
    var pages = total/_pageSize;
    return pages.ceil();
  }

  Future<List<FacilityTableCurrentStatusDTO>?> getFacilityTableCurrentStatuses() async {
    try{
      Log.printMethodStart('getFacilityTableCurrentStatuses()', 'Orders Screen','init');
      _facilityTableCurrentStatusResponse = await _ordersDataApiClient.getFacilityTableCurrentStatus({
        'siteId': _executionContextDTO.siteId ?? 0
      });
      Log.printMethodEnd('getFacilityTableCurrentStatuses()', 'Orders Screen','init');
      return _facilityTableCurrentStatusResponse?.data;
    } on DioError {
      rethrow;
    }
  }

  Future<OrdersDataResponse> getOrders({
    int currentPage = 0,
    int pageSize = 50,
    int tableId = -1,
    int orderId = -1,
    int posMachineId =-1,
    String? status,
    String? orderStatus,
    int? staff,
    String? tentNumber,
    String? guestContact,
    String? customerName,
    String? fromDate,
    String? toDate,
  }) async {
    _pageSize = pageSize;

    try{
      Log.printMethodStart('getFacilityTableCurrentStatuses()', 'Orders Screen','All');
      _ordersDataCountResponse = await _ordersDataApiClient.getOrdersDataCount({
        'siteId': _executionContextDTO.siteId ?? 0,
        if(customerName != null) 'guestName':customerName,
        if(guestContact != null) 'guestContact':guestContact,
        if(tentNumber  != null) 'tentNumber':tentNumber,
        if(orderId != 0) 'orderId':orderId,
        if(tableId  != 0) 'tableId':tableId ,
        if(posMachineId != 0) 'posMachineId': posMachineId,
       // if(status != null) 'orderStatus ':status,
        if(status != null) 'orderStatusInList':status,
        if(staff != null) 'userId':staff,
        if(fromDate != null) 'fromDateTime':fromDate,
        if(toDate != null) 'toDateTime':toDate,
      });
      Log.printMethodEnd('getFacilityTableCurrentStatuses()', 'Orders Screen','All');
      return _ordersDataApiClient.getOrdersData({
        'siteId': _executionContextDTO.siteId ?? 0,
        'pageNumber': currentPage,
        'pageSize': pageSize,
        if(customerName != null) 'guestName':customerName,
        if(guestContact != null) 'guestContact':guestContact,
        if(tentNumber  != null) 'tentNumber':tentNumber,
        if(orderId != 0) 'orderId':orderId,
        if(tableId  != 0) 'tableId':tableId ,
        if(posMachineId != 0) 'posMachineId': posMachineId,
        // if(status != null) 'orderStatus ':status,
        if(status != null) 'orderStatusInList':status,
        if(orderStatus != null)  'orderStatus' : orderStatus,
        if(staff != null) 'userId':staff,
        if(fromDate != null) 'fromDateTime':fromDate,
        if(toDate != null) 'toDateTime':toDate,
      },);
    }on DioError {
      rethrow;
    }
  }

  Future<OrdersDataResponse> getOrderHeadView({required Map<String,dynamic>queries}) async {

    try{
      return _ordersDataApiClient.getOrdersData(queries);
    }on DioError {
      rethrow;
    }
  }

  Future<FacilityTableResponse> occupyTable(
      {required int tableId, required FacilityTable facilityTable}) {
    try {
      return _ordersDataApiClient.occupyTable(tableId, facilityTable);
    } on DioError {
      rethrow;
    }
  }

  Future<TransactionsCountResponse> getTransactionCountOnly({
    int trxId = -1,
    int? orderID = -1,
    int tableId = -1,
    String? fromDate,
    String? toDate,
    String? status,
    int? posMachineID,
    int posTypeId = -1,
    int? userId,
    int siteId = -1,
    int customerId = -1,
    originalTransactionId = -1,
    int linkedBillCycleTransactionForSubscriptionHeaderId = -1,
    bool onlineOnly = false,
    bool reservationTransactionOnly = false,
    bool hasAttractionBookings = false,
    bool hasExternalSystemReference = false,
    int customerSignedWaiverId = -1,
    bool needsOrderDispensing = false,
    int transactionPaymentModeId = -1,
    bool hasHoldLines = false,
  }) async {
    try {
      Log.printMethodStart('getTransactionCountOnly()', 'Orders Screen','init');
      _transactionsCountResponse =
          await _ordersDataApiClient.getTransactionsCount({
        'siteId': _executionContextDTO.siteId,
        'fromDateTime': fromDate,
        'toDateTime': toDate,
        'transactionStatusInList': status,
        'posName': _executionContextDTO.posMachineName,
        'hasHoldLines': hasHoldLines
      });
      Log.printMethodEnd('getTransactionCountOnly()', 'Orders Screen','init');
      return _transactionsCountResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<GenericResponse> moveOrder({required String orderId, required Map<String,dynamic> body})async{
    try {
      return _ordersDataApiClient.moveOrder(orderId, body);
    } on DioError {
      rethrow;
    }
  }

  Future<GenericResponse> moveTransaction({required String orderId, required Map<String,dynamic> body})async{
    try {
      return _ordersDataApiClient.moveTransactions(orderId, body);
    } on DioError {
      rethrow;
    }
  }

  Future<GenericResponse> getTableOrderCount({required String tableId})async{
    try{
      return _ordersDataApiClient.tableOrderCount(tableId);
    }on DioError{
      rethrow;
    }
  }

  Future<GenericResponse> orderHeadView({required String tableId})async{
    try{
      return _ordersDataApiClient.orderHeadView(tableId);
    }on DioError{
      rethrow;
    }
  }

  Future<GenericResponse> mergeTable({required String tableId, required Map<String,dynamic> body})async{
    try{
      return _ordersDataApiClient.mergeTable(tableId,body);
    }on DioError{
      rethrow;
    }
  }

  Future<GenericResponse> unMergeTable({required String tableId, required Map<String,dynamic> body})async{
    try{
      return _ordersDataApiClient.unMergeTable(tableId,body);
    }on DioError{
      rethrow;
    }
  }

  Future<GenericResponse> clearTable({required String tableId, required Map<String,dynamic> body})async{
    try{
      return _ordersDataApiClient.clearTable(tableId,body);
    }on DioError{
      rethrow;
    }
  }
  Future<GenericResponse> blockTable({required String tableId, required Map<String,dynamic> body})async{
    try{
      return _ordersDataApiClient.blockTable(tableId,body);
    }on DioError{
      rethrow;
    }
  }

  Future<GenericResponse> reserveTable({required String tableId, required Map<String,dynamic> body})async{
    try{
      return _ordersDataApiClient.reserveTable(tableId,body);
    }on DioError{
      rethrow;
    }
  }
  Future<GenericResponse> updateDetails({required String tableId, required Map<String,dynamic> body})async{
    try{
      return _ordersDataApiClient.updateDetails(tableId,body);
    }on DioError{
      rethrow;
    }
  }
}
