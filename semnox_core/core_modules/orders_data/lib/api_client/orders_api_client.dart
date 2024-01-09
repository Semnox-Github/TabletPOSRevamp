
import 'package:dio/dio.dart';
import 'package:orders_data/models/facility_container/facility_container_response.dart';
import 'package:orders_data/models/facility_table/facility_table.dart';
import 'package:orders_data/models/facility_table/facility_table_response.dart';
import 'package:orders_data/models/facility_table_container/facility_table_container_data.dart';
import 'package:orders_data/models/facility_table_container/facility_table_container_response.dart';
import 'package:orders_data/models/facility_table_current_status/facility_table_current_status_response.dart';
import 'package:orders_data/models/orders_data_count/orders_data_count_response.dart';
import 'package:orders_data/models/orders_data_response/orders_data_response.dart';
import 'package:orders_data/models/search_count/table_search_count_response.dart';
import 'package:orders_data/models/table_search_data/table_search_data_response.dart';
import 'package:orders_data/models/transaction_data_count/transaction_count_response.dart';
import 'package:orders_data/models/transaction_status_container/transaction_status_container_response.dart';
import 'package:orders_data/models/transactions/transaction_response.dart';
import 'package:orders_data/models/user_container/user_container_response.dart';
import 'package:retrofit/http.dart';

import '../models/generic_response.dart';

part 'orders_api_client.g.dart';

@RestApi()
abstract class OrdersApiClient{
  factory OrdersApiClient(Dio dio,{String baseUrl}) = _OrdersApiClient;

  static const _facilityTableEndPoint = "api/Product/FacilityTableContainer";
  static const _facilityEndPoint = "api/Product/FacilityContainer";
  static const _tableSearchDataEndPoint = "api/Product/FacilityTableCurrentStatusView";
  static const _tableSearchDataCountEndPoint = "api/Product/FacilityTableCurrentStatusViewCount";
  static const _transactionStatusEndPoint = "api/Transaction/TransactionStatusContainer";
  static const _orderStatusEndPoint = "api/Transaction/OrderStatusContainer";
  static const _transactionsEndPoint = "api/Transaction/V2/Transactions";
  static const _transactionsCountEndPoint = "/api/Transaction/TransactionsCount";
  static const _userContainerEndPoint = "/api/HR/UserContainer";
  static const _ordersEndPoint = "api/Transaction/OrderHeaderView";
  static const _ordersCountEndPoint = "api/Transaction/OrdersCount";
  static const _occupyTableEndPoint = "api/Product/FacilityTable/{tableId}/Occupy";

  static const _facilityTableCurrentStatusEndPoint = "api/Product/FacilityTableCurrentStatusView";
  static const _moveOrderEndPoint = "api/Transaction/Order/{orderId}/MovetoTable";
  static const _moveTransactionEndPoint = "api/Transaction/Order/{orderId}/MoveTransactionstoTable";

  static const _tableOrderCount = "api/Transaction/OrdersCount?tableId={tableId}&orderStatusInList=ORDERED,INITIATED";
  static const _orderHeadView = "api/Transaction/OrderHeaderView?tableId={tableId}&orderStatusInList=ORDERED,INITIATED";
  static const _mergeTable = "/api/Product/FacilityTable/{tableId}/Merge";
  static const _unMergeTable = "/api/Product/FacilityTable/{tableId}/UnMerge";
  static const _clearTable = "/api/Product/FacilityTable/{tableId}/Clear";
  static const _blockTable = "/api/Product/FacilityTable/{tableId}/Block";
  static const _reserveTable = "/api/Product/FacilityTable/{tableId}/Reserve";
  static const _updatedetails = "api/Product/FacilityTable/{tableId}/Comments";

  @GET(_facilityTableEndPoint)
  Future<FacilityTableContainerResponse> getFacilityTableContainer(@Queries() Map<String, dynamic> queries);

  @GET(_facilityEndPoint)
  Future<FacilityContainerResponse> getFacilityContainer(@Queries() Map<String, dynamic> queries);

  @GET(_tableSearchDataEndPoint)
  Future<TableSearchDataResponse> getTableSearchData(@Queries() Map<String, dynamic> queries);

  @GET(_tableSearchDataCountEndPoint)
  Future<TableSearchCountResponse> getTableSearchDataCount(@Queries() Map<String, dynamic> queries);

  @GET(_transactionStatusEndPoint)
  Future<TransactionStatusContainerResponse> getTransactionStatusContainer(@Queries() Map<String, dynamic> queries);
/*
  @GET(_orderStatusEndPoint)
  Future<OrderStatusContainerResponse> getOrderStatusContainer(@Queries() Map<String, dynamic> queries);*/

  @GET(_transactionsEndPoint)
  Future<TransactionResponse> getTransactions(@Queries() Map<String, dynamic> queries);

  @GET(_transactionsCountEndPoint)
  Future<TransactionsCountResponse> getTransactionsCount(@Queries() Map<String, dynamic> queries);

  @GET(_userContainerEndPoint)
  Future<UserContainerResponse> getUserContainer(@Queries() Map<String, dynamic> queries);

  @GET(_facilityTableCurrentStatusEndPoint)
  Future<FacilityTableCurrentStatusResponse> getFacilityTableCurrentStatus(@Queries() Map<String, dynamic> queries);

  @GET(_ordersEndPoint)
  Future<OrdersDataResponse> getOrdersData(@Queries() Map<String, dynamic> queries);

  @GET(_ordersCountEndPoint)
  Future<OrdersDataCountResponse> getOrdersDataCount(@Queries() Map<String, dynamic> queries);

  @POST(_occupyTableEndPoint)
  Future<FacilityTableResponse> occupyTable(@Path() int tableId, @Body() FacilityTable facilityTable);

  @POST(_moveOrderEndPoint)
  Future<GenericResponse> moveOrder(@Path() String orderId, @Body() Map<String,dynamic> body);

  @POST(_moveTransactionEndPoint)
  Future<GenericResponse> moveTransactions(@Path() String orderId, @Body() Map<String,dynamic> body);

  @GET(_tableOrderCount)
  Future<GenericResponse> tableOrderCount(@Path() String tableId);

  @GET(_orderHeadView)
  Future<GenericResponse> orderHeadView(@Path() String tableId);

  @POST(_mergeTable)
  Future<GenericResponse> mergeTable(@Path() String tableId, @Body() Map<String,dynamic> body);

  @POST(_unMergeTable)
  Future<GenericResponse> unMergeTable(@Path() String tableId, @Body() Map<String,dynamic> body);

  @POST(_clearTable)
  Future<GenericResponse> clearTable(@Path() String tableId, @Body() Map<String,dynamic> body);

  @POST(_blockTable)
  Future<GenericResponse> blockTable(@Path() String tableId, @Body() Map<String,dynamic> body);

  @POST(_reserveTable)
  Future<GenericResponse> reserveTable(@Path() String tableId, @Body() Map<String,dynamic> body);

  @POST(_updatedetails)
  Future<GenericResponse> updateDetails(@Path() String tableId, @Body() Map<String,dynamic> body);

}