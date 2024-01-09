import 'package:dio/dio.dart';
import 'package:orders_data/models/facility_container/facility_container_dto.dart';
import 'package:orders_data/models/facility_table/facility_table.dart';
import 'package:orders_data/models/facility_table_container/facility_table_container_dto.dart';
import 'package:orders_data/models/facility_table_current_status/facility_table_current_status_dto.dart';
import 'package:orders_data/models/orders_data_response/orders_data_response.dart';
import 'package:orders_data/models/table_search_data/table_search_data_response.dart';
import 'package:orders_data/models/transaction_status_container/transaction_status_container_dto.dart';
import 'package:orders_data/models/transactions/transaction_response.dart';
import 'package:orders_data/models/user_container/user_container_dto.dart';
import 'package:orders_data/orders_data_service.dart';

import 'models/facility_table/facility_table_response.dart';
import 'models/generic_response.dart';
import 'models/transaction_data_count/transaction_count_response.dart';

abstract class OrdersDataBLContract {
  Future<List<FacilityTableContainerDTO>?> getFacilityTableContainer();
  Future<List<TransactionStatusContainerDTO>?> getTransactionStatus();
  Future<List<UserContainerDTO>?> getUserContainer();
  Future<List<FacilityTableCurrentStatusDTO>?> getFacilityTableCurrentStatuses();
  Future<OrdersDataResponse> getOrdersData({
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
  });
  Future<OrdersDataResponse> getOrderHeadView({required Map<String,dynamic>queries});
  Future<TableSearchDataResponse> getTableSearchData(
      {int currentPage = 0,
      int pageSize = 20,
      int facilityId = -1,
      String? facilityIdList,
      int posMachineId = -1,
      String? status,
      String? capacity});
  Future<TransactionResponse> getTransaction(
      {int currentPage = 0,
      int pageSize = 20,
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
      bool hasHoldLines = false});

  Future<TransactionsCountResponse> getTransactionCountOnly({
    String? fromDate,
    String? toDate,
    String? status,
  });

  int? getTotalPages();
  int? getTotalTransactionPages();
  int? getTotalOrderPages();
  Future<FacilityTableResponse> occupyTable({required int tableId,required FacilityTable facilityTable});

  Future<GenericResponse> moveOrder({required String orderId, required Map<String,dynamic> body});
  Future<GenericResponse> moveTransaction({required String orderId, required Map<String,dynamic> body});
  Future<GenericResponse> tableOrderCount({required String tableId});
  Future<GenericResponse> orderHeadView({required String tableId});
  Future<GenericResponse> mergeTable({required String tableId, required Map<String,dynamic> body});
  Future<GenericResponse> unMergeTable({required String tableId, required Map<String,dynamic> body});
  Future<GenericResponse> clearTable({required String tableId, required Map<String,dynamic> body});
  Future<GenericResponse> blockTable({required String tableId, required Map<String,dynamic> body});
  Future<GenericResponse> reserveTable({required String tableId, required Map<String,dynamic> body});
  Future<GenericResponse> updateDetails({required String tableId, required Map<String,dynamic> body});

}

class OrdersDataBLImpl implements OrdersDataBLContract{

  final OrdersDataService _ordersDataService;

  OrdersDataBLImpl(this._ordersDataService);

  @override
  Future<TableSearchDataResponse> getTableSearchData({
    int currentPage = 0, int pageSize = 20,
    int facilityId = -1,
    String? facilityIdList,
    int posMachineId = -1,
    String? status,
    String? capacity}) async{
   return await _ordersDataService.getTableSearchData(
     currentPage: currentPage,
     pageSize: pageSize,
     facilityId : facilityId,
     facilityIdList : facilityIdList,
     posMachineId : posMachineId,
     status : status,
     capacity : capacity);
  }

  @override
  int? getTotalPages() {
   return _ordersDataService.getTotalPages();
  }

  @override
  Future<List<TransactionStatusContainerDTO>?> getTransactionStatus() async{
    return await _ordersDataService.getTransactionStatus();
  }



  @override
  int? getTotalTransactionPages() {
    return _ordersDataService.getTotalTransactionPages();
  }

  @override
  Future<TransactionResponse> getTransaction({int currentPage = 0, int pageSize = 20, String? trxNumber, int trxId = 0, int? orderNo, int? posMachine, String? status, String? otp, String? reference, String? customerName, String? fromDate, String? toDate,
    String? guestName,
    String? contact, int? staff, int? ccNumber, bool hasHoldLines = false}) async{
    return await _ordersDataService.getTransactions(currentPage: currentPage, pageSize: pageSize,
      trxNumber: trxNumber, trxId: trxId,orderNo: orderNo,posMachine: posMachine,status: status,otp: otp,reference: reference,
    customerName: customerName,fromDate: fromDate,toDate: toDate,
        guestName: guestName,
        contact : contact , staff: staff,ccNumber: ccNumber,hasHoldLines: hasHoldLines);
  }

  @override
  Future<List<UserContainerDTO>?> getUserContainer() async{
    return await _ordersDataService.getUserContainer();
  }

  @override
  Future<List<FacilityTableCurrentStatusDTO>?> getFacilityTableCurrentStatuses() {
    return _ordersDataService.getFacilityTableCurrentStatuses();
  }

  @override
  Future<List<FacilityTableContainerDTO>?> getFacilityTableContainer() {
    return _ordersDataService.getFacilityTableContainer();
  }


  @override
  Future<OrdersDataResponse> getOrdersData({int currentPage = 0, int pageSize = 50, int tableId = -1, int orderId = -1,
    int posMachineId = -1, String? status, String? orderStatus, int? staff, String? tentNumber, String? guestContact, String? customerName, String? fromDate, String? toDate}) {
    return _ordersDataService.getOrders(currentPage: currentPage,pageSize: pageSize,tableId: tableId,orderId: orderId,
      posMachineId: posMachineId,status: status,orderStatus: orderStatus,staff: staff,tentNumber: tentNumber,guestContact: guestContact,customerName: customerName,
      fromDate: fromDate,toDate: toDate
    );
  }

  @override
  int? getTotalOrderPages() {
   return _ordersDataService.getTotalOrderPages();
  }

  @override
  Future<FacilityTableResponse> occupyTable(
      {required int tableId, required FacilityTable facilityTable}) {
    return _ordersDataService.occupyTable(
        tableId: tableId, facilityTable: facilityTable);
  }

  @override
  Future<TransactionsCountResponse> getTransactionCountOnly({
    String? fromDate,
    String? toDate,
    String? status,
  }) async {
    return await _ordersDataService.getTransactionCountOnly(
      fromDate: fromDate,
      toDate: toDate,
      status: status,
    );
  }

  @override
  Future<GenericResponse> moveOrder({required String orderId, required Map<String, dynamic> body}) async {
   return await _ordersDataService.moveOrder(orderId: orderId, body: body);
  }

  @override
  Future<GenericResponse> moveTransaction({required String orderId, required Map<String, dynamic> body}) async {
    return await _ordersDataService.moveTransaction(orderId: orderId, body: body);
  }

  @override
  Future<GenericResponse> tableOrderCount({required String tableId}) async {
    return await _ordersDataService.getTableOrderCount(tableId:tableId);
  }

  @override
  Future<GenericResponse> orderHeadView({required String tableId}) async{
    return await _ordersDataService.orderHeadView(tableId:tableId);
  }

  @override
  Future<GenericResponse> mergeTable({required String tableId, required Map<String, dynamic> body}) async {
   return await _ordersDataService.mergeTable(tableId: tableId, body: body);
  }

  @override
  Future<GenericResponse> unMergeTable({required String tableId, required Map<String, dynamic> body}) async {
    return await _ordersDataService.unMergeTable(tableId: tableId, body: body);
  }

  @override
  Future<GenericResponse> clearTable({required String tableId, required Map<String, dynamic> body}) async{
    return await _ordersDataService.clearTable(tableId: tableId, body: body);
  }

  @override
  Future<GenericResponse> blockTable({required String tableId, required Map<String, dynamic> body}) async {
    return await _ordersDataService.blockTable(tableId: tableId, body: body);

  }

  @override
  Future<GenericResponse> reserveTable({required String tableId, required Map<String, dynamic> body}) async{
    return await _ordersDataService.reserveTable(tableId: tableId, body: body);

  }

  @override
  Future<GenericResponse> updateDetails({required String tableId, required Map<String, dynamic> body}) async{
    return await _ordersDataService.updateDetails(tableId: tableId, body: body);
  }

  @override
  Future<OrdersDataResponse> getOrderHeadView({required Map<String, dynamic> queries}) async {
    print(queries);
   return await _ordersDataService.getOrderHeadView(queries: queries);
  }

}