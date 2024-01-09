import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:logs_data/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:product_menu_data/constants.dart';
import 'package:product_menu_data/models/product_menu_panel_container_dto.dart';
import 'package:product_menu_data/models/product_menu_panel_content_container_dto.dart';
import 'package:product_menu_data/models/product_menu_response.dart';
import 'package:product_menu_data/models/product_price_container/modifier_set_container_dto.dart';
import 'package:product_menu_data/models/product_price_container/modifier_set_details_container_dto.dart';
import 'package:product_menu_data/models/product_price_container/product_price_data.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';
import 'package:product_menu_data/models/products_container/products_container_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_client/product_menu_data_api_client.dart';
import 'models/product_price_container/product_modifier_container_dto.dart';


class ProductMenuDataService {
  static const PRODUCT_MENU_FILE_NAME = 'productmenucontainer.json';
  static const PRODUCT_PRICE_FILE_NAME = 'price_container_response.json';
  static const PRODUCT_CONTAINER_FILE_NAME = 'product_container_response.json';
  static const REDEEM_PRODUCT_CONTAINER_FILE_NAME ='redeem_product_container_response.json';

  late ProductMenuDataApiClient _productMenuDataApiClient;
  late ExecutionContextDTO _executionContextDTO;
  late SharedPreferences _preferences;

  static final ProductMenuDataService _instance = ProductMenuDataService._internal();
  ProductMenuDataService._internal();

  factory ProductMenuDataService(ProductMenuDataApiClient apiClient, ExecutionContextDTO executionContextDTO, SharedPreferences sharedPreferences) {
    _instance._productMenuDataApiClient = apiClient;
    _instance._executionContextDTO = executionContextDTO;
    _instance._preferences = sharedPreferences;
    return _instance;
  }

  ProductMenuResponse? _productMenuResponse;
  Map<int,ProductPriceContainerData>? _productPriceMap;
  Map<int,ProductContainerDTO>? _productContainerMap;
  Map<int,ModifierSetContainerDTO>? _modifierSetContainerMap;
  Map<int,ProductContainerDTO>? _redeemProductContainerMap;
  Map<String,ProductContainerDTO>? _productContainerMapByBarcode;

  final _productMenuApis = <Future>[];

  Future<ProductMenuResponse?> syncProductMenu() async {

    final localPath = await _localPath;
    final shouldRefresh = _preferences.getBool(shouldRefreshLocalData) ?? false;
    _productMenuApis.clear();

    bool isProductMenuFileAvailable = await File('$localPath/files/$PRODUCT_MENU_FILE_NAME').exists();
    if(shouldRefresh || !isProductMenuFileAvailable) {
      _productMenuApis.add(_getProductMenu());
    } else {
      _productMenuResponse = await _getProductMenuFromFile();
      sortProductMenu();
    }

    bool isProductFileAvailable = await File('$localPath/files/$PRODUCT_CONTAINER_FILE_NAME').exists();
    if(shouldRefresh || !isProductFileAvailable) {
      _productMenuApis.add(_getProductsContainer());
    }else{
      _productContainerMap = await _getProductContainerFromFile();
    }

    bool isRedeemProductFileAvailable = await File('$localPath/files/$REDEEM_PRODUCT_CONTAINER_FILE_NAME').exists();
    if(shouldRefresh || !isRedeemProductFileAvailable) {
      _productMenuApis.add(_getRedeemProductsContainer());
    }else{
      _redeemProductContainerMap = await _getRedeemProductContainerFromFile();
    }


    await Future.wait(_productMenuApis);

    return _productMenuResponse;
  }

  ProductMenuResponse? getProductMenu() {
    return _productMenuResponse;
  }

  Future<ProductContainerDTO?> getProductDetails(int productId) async {
    ProductContainerDTO? productPriceDetails = _productContainerMap?[productId];
    if(productPriceDetails != null){
      return productPriceDetails;
    } else {
      _productContainerMap = await _getProductContainerFromFile();
      productPriceDetails = _productContainerMap?[productId];
      return productPriceDetails;
    }
  }

  Future<ProductContainerDTO?> getProductContainerDetails(int productId) async {
    final productDetails = _productContainerMap?[productId];
    if(productDetails != null) {
      return productDetails;
    } else {
      final localPath = await _localPath;
      bool isProductFileAvailable = await File('$localPath/files/$PRODUCT_CONTAINER_FILE_NAME').exists();
      if(!isProductFileAvailable) {
        await _getProductsContainer();
      } else {
        await _getProductContainerFromFile();
      }
      return _productContainerMap?[productId];
    }
  }

  Future<ProductContainerDTO?> getProductContainerDetailsByBarcode(String inventoryCode) async {
    final productDetails = _productContainerMapByBarcode?[inventoryCode];
    if(productDetails != null) {
      return productDetails;
    } else {
      final localPath = await _localPath;
      bool isProductFileAvailable = await File('$localPath/files/$PRODUCT_CONTAINER_FILE_NAME').exists();
      if(!isProductFileAvailable) {
        await _getProductsContainer();
      } else {
        await _getProductContainerFromFile();
      }
      return _productContainerMapByBarcode?[inventoryCode];
    }
  }

  Future<List<ProductContainerDTO?>> getListOfProductContainerDetails(List<int> productIds) async {
    final productDetails = _productContainerMap?[productIds[0]];
    List<ProductContainerDTO?> _listOfProducts = [];
    if(productDetails != null) {
      for (var element in productIds) {
        _listOfProducts.add(_productContainerMap?[element]);
      }
      return _listOfProducts;
    } else {
      final localPath = await _localPath;
      bool isProductFileAvailable = await File('$localPath/files/$PRODUCT_CONTAINER_FILE_NAME').exists();
      if(!isProductFileAvailable) {
        await _getProductsContainer();
      } else {
        await _getProductContainerFromFile();
      }
      for (var element in productIds) {
        _listOfProducts.add(_productContainerMap?[element]);
      }
      return _listOfProducts;
    }
  }

  Future<List<ProductContainerDTO>> getAllProductContainerDTOs() async {
    final localPath = await _localPath;
    bool isProductFileAvailable = await File('$localPath/files/$PRODUCT_CONTAINER_FILE_NAME').exists();
    if (!isProductFileAvailable) {
      await _getProductsContainer();
    } else {
      await _getProductContainerFromFile();
    }

    List<ProductContainerDTO> productContainerDTO = [];
    _productContainerMap?.forEach((k, v) => productContainerDTO.add(v));

    return productContainerDTO;
  }

  Future<Map<int, ProductContainerDTO>> getMapOfProductContainerDetails() async {
    if((_productContainerMap?.length??0) > 0 ) {
      return _productContainerMap!;
    } else {
      final localPath = await _localPath;
      bool isProductFileAvailable = await File('$localPath/files/$PRODUCT_CONTAINER_FILE_NAME').exists();
      if(!isProductFileAvailable) {
        await _getProductsContainer();
      } else {
        await _getProductContainerFromFile();
      }
      return _productContainerMap!;
    }
  }

  Future<Map<int, ModifierSetContainerDTO>> getMapOfModifierSetContainerDetails() async {
    if((_modifierSetContainerMap?.length??0) > 0 ) {
      return _modifierSetContainerMap!;
    } else {
      final localPath = await _localPath;
      bool isProductFileAvailable = await File('$localPath/files/$PRODUCT_CONTAINER_FILE_NAME').exists();
      if(!isProductFileAvailable) {
        await _getProductsContainer();
      } else {
        await _getProductContainerFromFile();
      }
      return _modifierSetContainerMap!;
    }
  }

  Future<Map<int, ProductContainerDTO>> getMapOfRedeemProductContainerDetails() async {
    if((_redeemProductContainerMap?.length??0) > 0 ) {
      return _redeemProductContainerMap!;
    } else {
      final localPath = await _localPath;
      bool isRedeemProductFileAvailable = await File('$localPath/files/$REDEEM_PRODUCT_CONTAINER_FILE_NAME').exists();
      if(!isRedeemProductFileAvailable) {
        await _getRedeemProductsContainer();
      } else {
        await _getRedeemProductContainerFromFile();
      }
      return _redeemProductContainerMap!;
    }
  }

  void sortProductMenu() {
    if ((_productMenuResponse?.data?.productMenuContainerSnapshotDTOList ?? []).isNotEmpty) {
      _productMenuResponse = _productMenuResponse?.copyWith(
          data: _productMenuResponse!.data!.copyWith(productMenuContainerSnapshotDTOList: [
            _productMenuResponse!.data!.productMenuContainerSnapshotDTOList[0]
                .copyWith(productMenuPanelContainerDTOList: getSortedProductMenuResponse(_productMenuResponse) ?? [])
          ]));
    }
  }

  List<ProductMenuPanelContainerDTO>? getSortedProductMenuResponse(ProductMenuResponse? productMenuResponse) {
    List<ProductMenuPanelContainerDTO>? sortedList = productMenuResponse
        ?.data?.productMenuContainerSnapshotDTOList[0].productMenuPanelContainerDTOList
        .map((productMenuPanelContainerDTO) => productMenuPanelContainerDTO.copyWith(
        productMenuPanelContainerDTOList:
        productMenuPanelContainerDTO.productMenuPanelContainerDTOList.map((e) => e.copyWith()).toList()
          ..sort((a, b) => a.displayOrder.compareTo(b.displayOrder))))
        .toList();
    sortedList?.sort((a, b) {
      int comparison = a.displayOrder.compareTo(b.displayOrder);

      if (comparison == 0) {
        return a.name.compareTo(b.name);
      }
      return comparison;
    });
    return sortedList;
  }


  Future<void> clear() async {
    _productMenuResponse = null;
    _productPriceMap = null;
    _productContainerMap = null;
  }

  Future<void> _getProductMenu() async {
    final currentTime = DateTime.now().toUtc();
    final startDate = currentTime.toIso8601String();
    final endDate = currentTime.add(const Duration(hours: 1)).toIso8601String();
    final startDateString = startDate.substring(0, startDate.indexOf('.'));
    final endDateString = endDate.substring(0, endDate.indexOf('.'));
    final refreshServer = _preferences.getBool(shouldRefreshServer) ?? false;
    final productMenuHash = _preferences.getString(productMenuHashKey);

    try {
      _productMenuResponse = await _productMenuDataApiClient.getProductMenu({
        'siteId' : '${_executionContextDTO.siteId}',
        'userRoleId': '${_executionContextDTO.userRoleId}',
        'posMachineId': '${_executionContextDTO.machineId}',
        'languageId': '${_executionContextDTO.languageId}',
        'menuType' : 'O',
        'startDateTime' : startDateString,
        'endDateTime' : endDateString,
        'hash': productMenuHash,
        'rebuildCache': refreshServer,
      });
      if(_productMenuResponse!.data != null && _productMenuResponse!.exception == null) {
        var responseString = json.encode(_productMenuResponse!.toJson());
        await _preferences.setString(productMenuHashKey, _productMenuResponse!.data?.hash ?? '');
        await _deleteFile(PRODUCT_MENU_FILE_NAME);
        await _saveResponseToJsonFile(responseString, PRODUCT_MENU_FILE_NAME);
        sortProductMenu();
      }
    } on DioError catch (error) {
      Log.e('Api error: ${error.response?.data['data'].toString()}');
    }
  }


  Future<ProductsContainerResponse?> _getProductsContainer() async {

    final refreshServer = _preferences.getBool(shouldRefreshServer) ?? false;
    final productHash = _preferences.getString(productHashKey);

    try {
      final response = await _productMenuDataApiClient.getProductsContainer({
        'siteId': _executionContextDTO.siteId ?? 0,
        'manualType': 'SELLABLE',
        'hash': productHash,
        'rebuildCache': refreshServer,
      });

      if(response.data != null) {
        _productContainerMap = <int, ProductContainerDTO>{};
        _productContainerMapByBarcode = <String, ProductContainerDTO>{};
        _modifierSetContainerMap = <int, ModifierSetContainerDTO>{};
        for(int i = 0; i < response.data!.productContainerDTOList.length; i++) {
          var item = response.data!.productContainerDTOList[i];
          _productContainerMap?[item.productId] = item;

          for (var element in item.productModifierContainerDTOList) {
            if(element.modifierSetContainerDTO != null) {
              _modifierSetContainerMap?[element.modifierSetId] = element.modifierSetContainerDTO!;
            }
          }

          if(item.inventoryItemContainerDTO != null) {
            item.inventoryItemContainerDTO?.productBarcodeContainerDtoList?.forEach((productBarcodeContainer) {
              _productContainerMapByBarcode?[productBarcodeContainer.barCode] = item;
            });
          }
        }

        if(response.data != null && response.exception == null) {
          var responseString = json.encode(response.toJson());
          await _preferences.setString(productHashKey, response.data?.hash ?? '');
          await _deleteFile(PRODUCT_CONTAINER_FILE_NAME);
          await _saveResponseToJsonFile(responseString, PRODUCT_CONTAINER_FILE_NAME);
        }
      }

      return response;
    } on DioError catch (error) {
      Log.e('Api error: ${error.response?.data['data'].toString()}');
      return null;
    }
  }

  Future<ProductsContainerResponse?> _getRedeemProductsContainer() async {

    final refreshServer = _preferences.getBool(shouldRefreshServer) ?? false;
    final redeemProductHash = _preferences.getString(redeemProductHashKey);

    try {
      final response = await _productMenuDataApiClient.getProductsContainer({
        'siteId': _executionContextDTO.siteId ?? 0,
        'manualType': 'REDEEMABLE',
        'hash': redeemProductHash,
        'rebuildCache': refreshServer,
      });

      if(response.data != null) {
        _redeemProductContainerMap = <int, ProductContainerDTO>{};

        for(int i = 0; i < response.data!.productContainerDTOList.length; i++) {
          var item = response.data!.productContainerDTOList[i];
          _redeemProductContainerMap?[item.productId] = item;
        }

        if(response.data != null && response.exception == null) {
          var responseString = json.encode(response.toJson());
          await _preferences.setString(redeemProductHashKey, response.data?.hash ?? '');
          await _deleteFile(REDEEM_PRODUCT_CONTAINER_FILE_NAME);
          await _saveResponseToJsonFile(responseString, REDEEM_PRODUCT_CONTAINER_FILE_NAME);
        }

      }

      return response;
    } on DioError catch (error) {
      Log.e('Api error: ${error.response?.data['data'].toString()}');
      return null;
    }
  }

  Future<Map<int,ProductContainerDTO>?> _getRedeemProductContainerFromFile() async {
    var localPath = await _localPath;
    bool isFileAvailable = await File('$localPath/files/$REDEEM_PRODUCT_CONTAINER_FILE_NAME').exists();
    if(isFileAvailable) {
      final file = File('$localPath/files/$REDEEM_PRODUCT_CONTAINER_FILE_NAME');
      var fileContent = await file.readAsString();
      final responseMap = json.decode(fileContent) as Map<String, dynamic>;
      final response = ProductsContainerResponse.fromJson(responseMap);

      _redeemProductContainerMap = <int, ProductContainerDTO>{};

      if(response.data != null) {
        for(int i = 0; i< response.data!.productContainerDTOList.length; i++) {
          final item = response.data!.productContainerDTOList[i];
          _redeemProductContainerMap?[item.productId] = item;
        }
      }

      return _redeemProductContainerMap;
    } else {
      return null;
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


  Future<Map<int,ProductContainerDTO>?> _getProductContainerFromFile() async {
    var localPath = await _localPath;
    bool isFileAvailable = await File('$localPath/files/$PRODUCT_CONTAINER_FILE_NAME').exists();
    if(isFileAvailable) {
      final file = File('$localPath/files/$PRODUCT_CONTAINER_FILE_NAME');
      var fileContent = await file.readAsString();
      final responseMap = json.decode(fileContent) as Map<String, dynamic>;
      final response = ProductsContainerResponse.fromJson(responseMap);

      _productContainerMap = <int, ProductContainerDTO>{};
      _productContainerMapByBarcode = <String, ProductContainerDTO>{};
      _modifierSetContainerMap = <int, ModifierSetContainerDTO>{};

      if(response.data != null) {
        for(int i = 0; i< response.data!.productContainerDTOList.length; i++) {
          final item = response.data!.productContainerDTOList[i];
          _productContainerMap?[item.productId] = item;

          for (var element in item.productModifierContainerDTOList) {
            if(element.modifierSetContainerDTO != null) {
              _modifierSetContainerMap?[element.modifierSetId] = element.modifierSetContainerDTO!;
            }
          }

          if(item.inventoryItemContainerDTO != null) {
            item.inventoryItemContainerDTO?.productBarcodeContainerDtoList?.forEach((productBarcodeContainer) {
              _productContainerMapByBarcode?[productBarcodeContainer.barCode] = item;
            });
          }
        }
      }

      return _productContainerMap;
    } else {
      return null;
    }
  }

  Future<ProductMenuResponse?> _getProductMenuFromFile() async {
    var localPath = await _localPath;
    bool isFileAvailable = await File('$localPath/files/$PRODUCT_MENU_FILE_NAME').exists();
    if(isFileAvailable) {
      final file = File('$localPath/files/$PRODUCT_MENU_FILE_NAME');
      var fileContent = await file.readAsString();
      final responseMap = json.decode(fileContent) as Map<String, dynamic>;
      final response = ProductMenuResponse.fromJson(responseMap);
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

  Future<Map<int,ProductContainerDTO>> getInstantMapOfProductContainerDetails() async{
    if((_productContainerMap?.length??0) > 0 ) {
      return _productContainerMap!;
    }else{
      _productContainerMap = await _getProductContainerFromFile();
      return _productContainerMap!;
    }
  }

}
