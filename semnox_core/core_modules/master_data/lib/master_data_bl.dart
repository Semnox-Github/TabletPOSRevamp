
import 'dart:typed_data';

import 'package:master_data/master_data_service.dart';
import 'package:master_data/models/active_printers_container/active_printers_response.dart';
import 'package:master_data/models/category_container/category_container_response.dart';
import 'package:master_data/models/configurations/configuration_response.dart';
import 'package:master_data/models/discount_container/discount_container_dto.dart';
import 'package:master_data/models/facility_table_status_container/facility_table_status_container_dto.dart';
import 'package:master_data/models/game_container/game_container_response.dart';
import 'package:master_data/models/game_profile_container/game_profile_container_response.dart';
import 'package:master_data/models/lookup_container/lookup_values_container_dto.dart';
import 'package:master_data/models/order_status_container/order_status_container_dto.dart';
import 'package:master_data/models/payment_modes_container/payment_mode_container_dto.dart';
import 'package:master_data/models/pos_machines_container/pos_machine_container_dto.dart';
import 'package:master_data/models/pos_machines_container/pos_machines_response.dart';
import 'package:master_data/models/pos_machines_container/pos_printer_dto.dart';
import 'package:master_data/models/segment_category_container/segment_category_container_response.dart';
import 'package:master_data/models/sites/site_response.dart';
import 'package:master_data/models/user_role_container/user_role_container_dto.dart';
import 'package:orders_data/models/facility_container/facility_container_dto.dart';

import 'models/order_type_container/order_type_container_response.dart';
import 'models/product_type_container/product_type_container_dto.dart';
import 'models/task_types_container/task_type_container_dto.dart';

abstract class MasterDataBLContract {
  Future<bool> sync({bool shouldCallPostLoginApis = false});
  Future<SiteResponse?> getSites({shouldRefreshByForce = false});
  String? getBrandImage();
  Future<ConfigurationResponse?> getConfigurations();
  String? getMessage(int messageKey);
  Future<List<LookupValuesContainerDTO>?> getLookUpValuesById(int lookUpId);
  Future<List<LookupValuesContainerDTO>?> getLookUpValuesByName(String lookUpName);
  Future<List<PaymentModeContainerDTO>?> getPaymentModes();
  Future<PaymentModeContainerDTO?> getPaymentModeById(int payModeId);
  Future<List<POSPrinterContainerDTO>?> getKOTPrinters();
  Future<POSMachinesResponse?> syncPosMachineContainer();
  Future<ConfigurationResponse?> syncParafaitDefaultsContainer();
  Future<List<POSMachineContainerDTO>?> getPosMachines();
  Future<List<UserRoleContainerDTO>?> getUserRoles();
  Future<UserRoleContainerDTO?> getUserRoleById(int roleId);
  Future<List<DiscountContainerDto>?> getDiscounts();
  Future<List<FacilityTableStatusContainerDTO>?> getFacilityTableStatus();
  Future<List<OrderStatusContainerDTO>?> getOrderStatus();
  Future<SegmentCategoryContainerResponse?> getSegmentCategoryContainer();
  Future<List<FacilityContainerDTO>?> getFacilities();
  Future<String?> getDefaultValuesByName({required String defaultValueName});
  Future<POSMachineContainerDTO?> getPOSMachineById({required int machineId});
  void clear();
  Future<GameProfileContainerResponse?> getGameProfileContainer();
  Future<GameContainerResponse?> getGameContainer();
  Future<CategoryContainerResponse?> getCategoryContainer();
  Future<OrderTypeContainerResponse?> getOrderTypeContainer();
  Future<int> uploadImage(
      {required Uint8List binaryImage,
        required String fileName,
        String? defaultValueName,
        bool? secure});
  Future<Uint8List> getImageData({required String fileName});
  Future<List<TaskTypeContainerDto>> getTaskTypeContainerList();
  Future<TaskTypeContainerDto?> getTaskTypeContainer({required String category, required String taskType});
  Future<List<ProductTypeContainerDto>> getProductTypeContainerList();
  Future<ActivePrintersResponse?> getActivePrinters();
}

class MasterDataBLImpl implements MasterDataBLContract {

  final MasterDataService _masterDataService;

  MasterDataBLImpl(this._masterDataService);

  @override
  Future<bool> sync({bool shouldCallPostLoginApis = false}) async {
    return await _masterDataService.sync(shouldCallPostLoginApis);
  }

  @override
  void clear() {
    _masterDataService.clear();
  }

  @override
  Future<SiteResponse?> getSites({shouldRefreshByForce = false}) async {
    return _masterDataService.getSites(shouldRefreshByForce: shouldRefreshByForce);
  }

  @override
  String? getBrandImage() {
    return _masterDataService.getBrandImage();
  }

  @override
  Future<ConfigurationResponse?> getConfigurations() async {
    return _masterDataService.getConfigurations();
  }

  @override
  String? getMessage(int messageKey) {
    return _masterDataService.getMessage(messageKey);
  }

  @override
  Future<List<LookupValuesContainerDTO>?> getLookUpValuesById(int lookUpId) {
    return _masterDataService.getLookUpValuesById(lookUpId);
  }

  @override
  Future<List<LookupValuesContainerDTO>?> getLookUpValuesByName(String lookUpName) {
    return _masterDataService.getLookUpValuesByName(lookUpName);
  }

  @override
  Future<PaymentModeContainerDTO?> getPaymentModeById(int payModeId) {
    return _masterDataService.getPaymentModeById(payModeId);
  }

  @override
  Future<List<PaymentModeContainerDTO>?> getPaymentModes() {
    return _masterDataService.getPaymentModes();
  }

  @override
  Future<List<POSPrinterContainerDTO>?> getKOTPrinters() {
    return _masterDataService.getKOTPrinters();
  }

  @override
  Future<POSMachinesResponse?> syncPosMachineContainer() {
    return _masterDataService.syncPosMachineContainer();
  }

  @override
  Future<List<UserRoleContainerDTO>?> getUserRoles() {
    return _masterDataService.getUserRoles();
  }

  @override
  Future<UserRoleContainerDTO?> getUserRoleById(int roleId) {
    return _masterDataService.getUserRoleById(roleId);
  }

  @override
  Future<List<DiscountContainerDto>?> getDiscounts() {
    return _masterDataService.getDiscounts();
  }

  @override
  Future<List<FacilityTableStatusContainerDTO>?> getFacilityTableStatus() {
    return _masterDataService.getFacilityTableStatus();
  }

  @override
  Future<List<OrderStatusContainerDTO>?> getOrderStatus() {
    return _masterDataService.getOrderStatus();
  }

  @override
  Future<SegmentCategoryContainerResponse?> getSegmentCategoryContainer(){
    return _masterDataService.getSegmentCategoryContainer();
  }

  @override
  Future<List<FacilityContainerDTO>?> getFacilities() {
    return _masterDataService.getFacilities();
  }

  @override
  Future<List<POSMachineContainerDTO>?> getPosMachines() {
   return _masterDataService.getPosMachineContainer();
  }

  @override
  Future<String?> getDefaultValuesByName({required String defaultValueName}) {
    return _masterDataService.getDefaultValuesByName(defaultValueName:defaultValueName);
  }

  @override
  Future<POSMachineContainerDTO?> getPOSMachineById({required int machineId}){
    return _masterDataService.getPOSMachineById(machineId: machineId);
  }

  @override
  Future<GameContainerResponse?> getGameContainer() {
    return _masterDataService.getGameContainer();
  }

  @override
  Future<GameProfileContainerResponse?> getGameProfileContainer() {
    return _masterDataService.getGameProfileContainer();
  }

  @override
  Future<CategoryContainerResponse?> getCategoryContainer() {
    return _masterDataService.getCategoryContainer();
  }

  @override
  Future<OrderTypeContainerResponse?> getOrderTypeContainer() {
   return _masterDataService.getOrderTypeContainer();
  }

  @override
  Future<int> uploadImage(
      {required Uint8List binaryImage,
        required String fileName,
        String? defaultValueName,
        bool? secure}) {
    return _masterDataService.uploadImage(
        binaryImage: binaryImage,
        fileName: fileName,
        defaultValueName: defaultValueName,
        secure: secure);
  }

  @override
  Future<Uint8List> getImageData({required String fileName}) {
    return _masterDataService.getImageData(fileName: fileName);
  }

  @override
  Future<List<TaskTypeContainerDto>> getTaskTypeContainerList(){
    return _masterDataService.getTaskTypeContainerList();
  }

  @override
  Future<TaskTypeContainerDto?> getTaskTypeContainer({required String category, required String taskType}){
    return _masterDataService.getTaskTypeContainer(category: category, taskType: taskType);
  }

  @override
  Future<List<ProductTypeContainerDto>> getProductTypeContainerList(){
    return _masterDataService.getProductTypeContainerList();
  }

  @override
  Future<ActivePrintersResponse?> getActivePrinters() {
    return _masterDataService.getActivePrinters();
  }

  @override
  Future<ConfigurationResponse?> syncParafaitDefaultsContainer() {
    return _masterDataService.syncParafaitDefaultsContainer();
  }
}