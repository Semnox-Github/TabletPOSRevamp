import 'package:dio/dio.dart';
import 'package:master_data/models/active_printers_container/active_printers_response.dart';
import 'package:master_data/models/category_container/category_container_response.dart';
import 'package:master_data/models/configurations/configuration_response.dart';
import 'package:master_data/models/facility_table_status_container/facility_table_status_container_response.dart';
import 'package:master_data/models/game_container/game_container_response.dart';
import 'package:master_data/models/game_profile_container/game_profile_container_response.dart';
import 'package:master_data/models/lookup_container/lookup_response.dart';
import 'package:master_data/models/order_status_container/order_status_container_response.dart';
import 'package:master_data/models/order_type_container/order_type_container_response.dart';
import 'package:master_data/models/payment_modes_container/payment_mode_response.dart';
import 'package:master_data/models/pos_machines_container/pos_machines_response.dart';
import 'package:master_data/models/segment_category_container/segment_category_container_response.dart';
import 'package:master_data/models/sites/site_response.dart';
import 'package:master_data/models/task_types_container/task_type_response.dart';
import 'package:master_data/models/user_role_container/user_role_container_response.dart';
import 'package:orders_data/models/facility_container/facility_container_response.dart';
import 'package:retrofit/retrofit.dart';

import '../models/discount_container/discount_container_response.dart';
import '../models/product_type_container/product_type_container_response.dart';

part 'master_data_api_client.g.dart';

@RestApi()
abstract class MasterDataApiClient {
  factory MasterDataApiClient(Dio dio, {String baseUrl}) = _MasterDataApiClient;

  static const _sitesEndPoint = "api/Organization/SiteContainer";
  static const _imageEndPoint = "api/Common/FileResource";
  static const _configurationsEndPoint =
      "api/Configuration/ParafaitDefaultContainer";
  static const _lookupsContainerEndPoint = "api/Lookups/LookupsContainer";
  static const _paymentModesContainerEndPoint =
      "api/V2/Transaction/PaymentModesContainer";
  static const _posMachinesContainerEndPoint = "api/POS/POSMachinesContainer";
  static const _userRoleContainerEndPoint = 'api/HR/UserRoleContainer';
  static const _discountContainerEndPoint = 'api/Discount/DiscountContainer';
  static const _facilityTableStatusEndPoint =
      'api/Product/FacilityTableStatusContainer';
  static const _orderStatusEndPoint = 'api/Transaction/OrderStatusContainer';
  static const _segmentCategoryContainerEndPoint =
      'api/Product/SegmentCategoryContainer';
  static const _facilityEndPoint = "api/Product/FacilityContainer";
  static const _gameProfileContainerEndPoint = "api/Game/GameProfileContainer";
  static const _gameContainerEndPoint = "api/Game/GameContainer";
  static const _categoryContainerEndPoint = "api/Inventory/CategoryContainer";
  static const _orderTypeContainerEndPoint =
      "api/Transaction/OrderTypeContainer";
  static const _taskTypesContainerEndPoint =  'api/Transaction/TaskTypesContainer';
  static const _productTypeContainerEndPoint = 'api/Product/ProductTypeContainer';
  static const _activePrintersEnPoint = "api/Print/Printers";

  @GET(_sitesEndPoint)
  Future<SiteResponse> getSites(@Queries() Map<String, dynamic> queries);

  @GET(_imageEndPoint)
  @DioResponseType(ResponseType.bytes)
  Future<List<int>> getBrandImage(@Queries() Map<String, dynamic> queries);

  @GET(_configurationsEndPoint)
  Future<ConfigurationResponse> getConfigurations(
      @Queries() Map<String, dynamic> queries);

  @GET(_lookupsContainerEndPoint)
  Future<LookupResponse> getLookupContainer(
      @Queries() Map<String, dynamic> queries);

  @GET(_paymentModesContainerEndPoint)
  Future<PaymentModesResponse> getPaymentModesContainer(
      @Queries() Map<String, dynamic> queries);

  @GET(_posMachinesContainerEndPoint)
  Future<POSMachinesResponse> getPOSMachinesContainer(
      @Queries() Map<String, dynamic> queries);

  @GET(_userRoleContainerEndPoint)
  Future<UserRoleContainerResponse> getUserRoleContainer(
      @Queries() Map<String, dynamic> queries);

  @GET(_discountContainerEndPoint)
  Future<DiscountContainerResponse> getDiscountsContainer(
      @Queries() Map<String, dynamic> queries);

  @GET(_facilityTableStatusEndPoint)
  Future<FacilityTableStatusContainerResponse> getFacilityTableStatusContainer(
      @Queries() Map<String, dynamic> queries);

  @GET(_orderStatusEndPoint)
  Future<OrderStatusContainerResponse> getOrderStatusContainer(
      @Queries() Map<String, dynamic> queries);

  @GET(_segmentCategoryContainerEndPoint)
  Future<SegmentCategoryContainerResponse> getSegmentCategoryContainer(
      @Queries() Map<String, dynamic> queries);

  @GET(_facilityEndPoint)
  Future<FacilityContainerResponse> getFacilityContainer(
      @Queries() Map<String, dynamic> queries);

  @GET(_gameProfileContainerEndPoint)
  Future<GameProfileContainerResponse> getGameProfileContainer(
      @Queries() Map<String, dynamic> queries);

  @GET(_gameContainerEndPoint)
  Future<GameContainerResponse> getGameContainer(
      @Queries() Map<String, dynamic> queries);

  @GET(_categoryContainerEndPoint)
  Future<CategoryContainerResponse> getCategoryContainer(
      @Queries() Map<String, dynamic> queries);

  @GET(_orderTypeContainerEndPoint)
  Future<OrderTypeContainerResponse> getOrderTypeContainer(
      @Queries() Map<String, dynamic> queries);

  @GET(_taskTypesContainerEndPoint)
  Future<TaskTypeContainerResponse> getTaskTypesContainer(
      @Queries() Map<String, dynamic> queries);

  @GET(_productTypeContainerEndPoint)
  Future<ProductTypeContainerResponse> getProductTypeContainer(
      @Queries() Map<String, dynamic> queries);

  @GET(_activePrintersEnPoint)
  Future<ActivePrintersResponse> getActivePrinters(@Queries() Map<String, dynamic> queries);
}
