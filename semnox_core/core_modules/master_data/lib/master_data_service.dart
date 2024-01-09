
import 'dart:convert';
import 'dart:io';

import 'package:application_prefs_data/application_prefs_data_bl.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/api_client/master_data_api_client.dart';
import 'package:master_data/constants.dart';
import 'package:master_data/models/active_printers_container/active_printers_data.dart';
import 'package:master_data/models/active_printers_container/active_printers_response.dart';
import 'package:master_data/models/category_container/category_container_response.dart';
import 'package:master_data/models/configurations/configuration_response.dart';
import 'package:master_data/models/discount_container/discount_container_dto.dart';
import 'package:master_data/models/discount_container/discount_container_response.dart';
import 'package:master_data/models/facility_table_status_container/facility_table_status_container_dto.dart';
import 'package:master_data/models/facility_table_status_container/facility_table_status_container_response.dart';
import 'package:master_data/models/game_container/game_container_response.dart';
import 'package:master_data/models/game_profile_container/game_profile_container_response.dart';
import 'package:master_data/models/lookup_container/lookup_response.dart';
import 'package:master_data/models/lookup_container/lookup_values_container_dto.dart';
import 'package:master_data/models/message_map/message_container_map.dart';
import 'package:master_data/models/message_map/message_container_map_dto.dart';
import 'package:master_data/models/order_status_container/order_status_container_dto.dart';
import 'package:master_data/models/order_status_container/order_status_container_response.dart';
import 'package:master_data/models/payment_modes_container/payment_mode_container_dto.dart';
import 'package:master_data/models/payment_modes_container/payment_mode_response.dart';
import 'package:master_data/models/pos_machines_container/pos_machine_container_dto.dart';
import 'package:master_data/models/pos_machines_container/pos_machines_response.dart';
import 'package:master_data/models/pos_machines_container/pos_printer_dto.dart';
import 'package:master_data/models/sites/site_response.dart';
import 'package:master_data/models/user_role_container/user_role_container_dto.dart';
import 'package:master_data/models/user_role_container/user_role_container_response.dart';
import 'package:messages_data/builder.dart';
import 'package:messages_data/models/messages_container/message_response.dart';
import 'package:orders_data/models/facility_container/facility_container_dto.dart';
import 'package:orders_data/models/facility_container/facility_container_response.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/configurations/parafait_default_container_dto.dart';
import 'models/order_type_container/order_type_container_response.dart';
import 'models/product_type_container/product_type_container_dto.dart';
import 'models/product_type_container/product_type_container_response.dart';
import 'models/segment_category_container/segment_category_container_response.dart';
import 'package:http/http.dart' as http;

import 'models/task_types_container/task_type_container_dto.dart';
import 'models/task_types_container/task_type_response.dart';


class MasterDataService {
  static const SITE_FILE_NAME = 'site_container_response.json';
  static const SPLASH_FILE_NAME = 'splash.jpg';
  static const CONFIG_FILE_NAME = 'config_container_response.json';
  static const MESSAGES_FILE_NAME = 'messages_container_response.json';
  static const LOOKUP_FILE_NAME = 'lookup_response.json';
  static const PAYMENT_FILE_NAME = 'payment_response.json';
  static const POS_MACHINES_FILE_NAME = 'pos_machines_response.json';
  static const USER_ROLES_FILE_NAME = 'user_roles_response.json';
  static const DISCOUNT_FILE_NAME = 'discount_response.json';
  static const FACILITY_TABLE_STATUS_FILE_NAME = 'facility_table_status_response.json';
  static const ORDER_STATUS_FILE_NAME = 'order_status_response.json';
  static const SEGMENT_CATEGORY_CONTAINER = 'segment_category_container.json';
  static const FACILITY_CONTAINER = 'facility_container.json';
  static const GAME_PROFILE_FILE_NAME = 'game_profile_response.json';
  static const GAME_FILE_NAME = 'game_response.json';
  static const CATEGORY_CONTAINER_FILE_NAME = 'category_container_response.json';
  static const ORDER_TYPE_CONTAINER_FILE_NAME = 'order_type_container_response.json';
  static const TASK_TYPES_CONTAINER =  'task_types_container';
  static const PRODUCT_TYPE_CONTAINER = 'product_type_container';
  static const LOOKUP_PRINTER_NAME = 'PRINTER_TYPE';
  static const LOOKUP_KOT_PRINTER_VALUE_KEY = 'KOTPrinter';

  late MasterDataApiClient _masterDataApiClient;
  late ExecutionContextDTO _executionContextDTO;
  late SharedPreferences _preferences;
  late Map<String, Uint8List> _cachedImage = {};
  late ApplicationPrefsDataBLContract _appPrefsBL;

  static final MasterDataService _instance = MasterDataService._internal();
  MasterDataService._internal();

  factory MasterDataService(MasterDataApiClient masterDataApiClient, ExecutionContextDTO executionContextDTO, SharedPreferences sharedPreferences, ApplicationPrefsDataBLContract appPrefsBL) {
    _instance._masterDataApiClient = masterDataApiClient;
    _instance._executionContextDTO = executionContextDTO;
    _instance._preferences = sharedPreferences;
    _instance._appPrefsBL = appPrefsBL;
    return _instance;
  }

  SiteResponse? _siteResponse;
  ConfigurationResponse? _configurationResponse;
  String? _brandImagePath;
  Map<int,String>? _messageMap;
  Map<int, List<LookupValuesContainerDTO>>? _lookupIdMap;
  Map<String, List<LookupValuesContainerDTO>>? _lookupNameMap;
  Map<int, PaymentModeContainerDTO>? _payModeMap;
  PaymentModesResponse? _paymentModesResponse;
  POSMachinesResponse? _posMachinesResponse;
  final _kotPrintersList = <POSPrinterContainerDTO>[];
  UserRoleContainerResponse? _userRoleContainerResponse;
  Map<int, UserRoleContainerDTO>? _userRoleMap;
  DiscountContainerResponse? _discountContainerResponse;
  Map<int,DiscountContainerDto>? _discountMap;
  FacilityTableStatusContainerResponse? _facilityTableStatusContainerResponse;
  OrderStatusContainerResponse? _orderStatusContainerResponse;
  SegmentCategoryContainerResponse? _segmentCategoryContainerResponse;
  FacilityContainerResponse? _facilityContainerResponse;
  Map<String,String>? _parafaitDefaultContainerMap;
  Map<int,POSMachineContainerDTO>? _posMachineMap;
  GameProfileContainerResponse? _gameProfileContainerResponse;
  GameContainerResponse? _gameContainerResponse;
  CategoryContainerResponse? _categoryContainerResponse;
  OrderTypeContainerResponse? _orderTypeContainerResponse;
  List<TaskTypeContainerDto> _taskTypeContainerDtoList = [];
  List<ProductTypeContainerDto> _productTypeContainerDtoList = [];
  List<ActivePrintersData>? _activePrintersList;

  final _masterDataApis = <Future>[];

  Future<bool> sync(bool shouldCallPostLoginApis) async {
    final localPath = await _localPath;
    final shouldRefresh = _preferences.getBool(shouldRefreshLocalData) ?? false;
    _masterDataApis.clear();

    bool isSiteFileFileAvailable = await File('$localPath/files/$SITE_FILE_NAME').exists();
    if(shouldRefresh || !isSiteFileFileAvailable) {
      _masterDataApis.add(_callSiteContainerApi());
    }

    bool isSplashFileAvailable = await File('$localPath/files/$SPLASH_FILE_NAME').exists();
    if(shouldRefresh || !isSplashFileAvailable) {
      _masterDataApis.add(_callBrandImageApi());
    } else {
      if(isSplashFileAvailable) {
        _brandImagePath = '$localPath/images/$SPLASH_FILE_NAME';
      }
    }


    if(shouldCallPostLoginApis) {
      bool isConfigFileAvailable = await File('$localPath/files/$CONFIG_FILE_NAME').exists();
      if(shouldRefresh || !isConfigFileAvailable) {
        _masterDataApis.add(_callConfigurationsContainerApi());
      }
      bool isPOSMachineFileAvailable = await File('$localPath/files/$POS_MACHINES_FILE_NAME').exists();
      if(shouldRefresh || !isPOSMachineFileAvailable) {
        _masterDataApis.add(_callPOSMachinesContainerApi());
      }
    }

    bool isMessagesFileAvailable = await File('$localPath/files/$MESSAGES_FILE_NAME').exists();
    if(shouldRefresh || !isMessagesFileAvailable) {
      _masterDataApis.add(_callMessagesContainerApi());
    } else {
      _messageMap = await _getMessagesContainerFromFile();
    }

    bool isLookUpFileAvailable = await File('$localPath/files/$LOOKUP_FILE_NAME').exists();
    if(shouldRefresh || !isLookUpFileAvailable) {
      _masterDataApis.add(_callLookupContainerApi());
    }

    bool isPaymentFileAvailable = await File('$localPath/files/$PAYMENT_FILE_NAME').exists();
    if(shouldRefresh || !isPaymentFileAvailable) {
      _masterDataApis.add(_callPaymentModesContainerApi());
    }

    bool isUserRolesFileAvailable = await File('$localPath/files/$USER_ROLES_FILE_NAME').exists();
    if(shouldRefresh || !isUserRolesFileAvailable) {
      _masterDataApis.add(_callUserRoleContainerApi());
    }

    bool isDiscountFileAvailable = await File('$localPath/files/$DISCOUNT_FILE_NAME').exists();
    if(shouldRefresh || !isDiscountFileAvailable) {
      _masterDataApis.add(_callDiscountContainerApi());
    }

    bool isFacilityFileAvailable = await File('$localPath/files/$FACILITY_TABLE_STATUS_FILE_NAME').exists();
    if(shouldRefresh || !isFacilityFileAvailable) {
      _masterDataApis.add(_callFacilityTableStatusContainerApi());
    }

    bool isOrderStatusFileAvailable = await File('$localPath/files/$ORDER_STATUS_FILE_NAME').exists();
    if(shouldRefresh || !isOrderStatusFileAvailable) {
      _masterDataApis.add(_callOrderStatusContainerApi());
    }

    bool isSegmentCategoryContainer = await File('$localPath/files/$SEGMENT_CATEGORY_CONTAINER').exists();
    if(shouldRefresh || !isSegmentCategoryContainer) {
      _masterDataApis.add(_callSegmentCategoryContainer());
    }

    bool isFacilityContainerAvailable = await File('$localPath/files/$FACILITY_CONTAINER').exists();
    if(shouldRefresh || !isFacilityContainerAvailable) {
      _masterDataApis.add(_callFacilityContainer());
    }

    bool isCategoryContainerAvailable = await File('$localPath/files/$CATEGORY_CONTAINER_FILE_NAME').exists();
    if(shouldRefresh || !isCategoryContainerAvailable) {
      _masterDataApis.add(_callCategoryContainerApi());
    }

    bool isOrderTypeContainerAvailable = await File('$localPath/files/$ORDER_TYPE_CONTAINER_FILE_NAME').exists();
    if(shouldRefresh || !isOrderTypeContainerAvailable) {
      _masterDataApis.add(_callOrderTypeContainerApi());
    }

    bool isGameProfileContainerAvailable = await File('$localPath/files/$GAME_PROFILE_FILE_NAME').exists();
    if(shouldRefresh || !isGameProfileContainerAvailable) {
      _masterDataApis.add(_callGameProfileContainerApi());
    }

    bool isGameContainerAvailable = await File('$localPath/files/$GAME_FILE_NAME').exists();
    if(shouldRefresh || !isGameContainerAvailable) {
      _masterDataApis.add(_callGameContainerApi());
    }

    bool isTaskTypeContainerAvailable = await File('$localPath/files/$TASK_TYPES_CONTAINER').exists();
    if(shouldRefresh || !isTaskTypeContainerAvailable) {
      _masterDataApis.add(_callTaskTypeContainer());
    }

    bool isProductTypeContainerAvailable = await File('$localPath/files/$PRODUCT_TYPE_CONTAINER').exists();
    if(shouldRefresh || !isProductTypeContainerAvailable) {
      _masterDataApis.add(_callProductTypeContainerAPI());
    }

    await Future.wait(_masterDataApis);
    return true;
  }

  Future<SiteResponse?> getSites({shouldRefreshByForce = false}) async {
    if(_siteResponse == null) {
      final localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$SITE_FILE_NAME').exists();
      if(!isFileAvailable || shouldRefreshByForce) {
        _siteResponse = await _callSiteContainerApi();
        return _siteResponse;
      } else {
        _siteResponse = await _getSiteContainerFromFile();
        return _siteResponse;
      }
    } else {
      if(shouldRefreshByForce) {
        _siteResponse = await _callSiteContainerApi();
      }
      return _siteResponse;
    }
  }

  String? getBrandImage() {
    return _brandImagePath;
  }

  Future<ConfigurationResponse?> getConfigurations() async {
    if(_configurationResponse == null) {
      final localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$CONFIG_FILE_NAME').exists();
      if(!isFileAvailable) {
        _configurationResponse = await _callConfigurationsContainerApi();
        return _configurationResponse;
      } else {
        _configurationResponse = await _getConfigurationsContainerFromFile();
        return _configurationResponse;
      }
    } else {
      return _configurationResponse;
    }
  }

  String? getMessage(int messageKey) {
    return _messageMap?[messageKey];
  }

  Future<List<LookupValuesContainerDTO>?> getLookUpValuesById(int lookUpId) async {
    if(_lookupIdMap == null) {
      final localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$LOOKUP_FILE_NAME').exists();
      if(!isFileAvailable) {
        await _callLookupContainerApi();
        return _lookupIdMap?[lookUpId];
      } else {
        await _getLookupContainerFromFile();
        return _lookupIdMap?[lookUpId];
      }
    } else {
      return _lookupIdMap?[lookUpId];
    }
  }

  Future<List<LookupValuesContainerDTO>?> getLookUpValuesByName(String lookUpName) async {
    if(_lookupNameMap == null) {
      final localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$LOOKUP_FILE_NAME').exists();
      if(!isFileAvailable) {
        await _callLookupContainerApi();
        return _lookupNameMap?[lookUpName];
      } else {
        await _getLookupContainerFromFile();
        return _lookupNameMap?[lookUpName];
      }
    } else {
      return _lookupNameMap?[lookUpName];
    }
  }

  Future<PaymentModeContainerDTO?> getPaymentModeById(int payModeId) async {
    if(_payModeMap == null) {
      final localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$PAYMENT_FILE_NAME').exists();
      if(!isFileAvailable) {
        await _callPaymentModesContainerApi();
        return _payModeMap?[payModeId];
      } else {
        await _getPaymentModesContainerFromFile();
        return _payModeMap?[payModeId];
      }
    } else {
      return _payModeMap?[payModeId];
    }
  }

  Future<List<PaymentModeContainerDTO>?> getPaymentModes() async {
    if(_paymentModesResponse == null) {
      final localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$PAYMENT_FILE_NAME').exists();
      if(!isFileAvailable) {
        await _callPaymentModesContainerApi();
        return _paymentModesResponse?.data?.paymentModeContainerDTOList;
      } else {
        await _getPaymentModesContainerFromFile();
        return _paymentModesResponse?.data?.paymentModeContainerDTOList;
      }
    } else {
      return _paymentModesResponse?.data?.paymentModeContainerDTOList;
    }
  }

  Future<List<POSPrinterContainerDTO>?> getKOTPrinters() async {
    if(_posMachinesResponse == null || _kotPrintersList.isEmpty) {
      await _refreshKOTPrinterList();
      return _kotPrintersList;
    } else {
      return _kotPrintersList;
    }
  }


  Future<POSMachinesResponse?> syncPosMachineContainer() async {
    final shouldRefresh = _preferences.getBool(shouldRefreshLocalData) ?? false;
    final localPath = await _localPath;
    bool isPosMachinesFileAvailable = await File('$localPath/files/$POS_MACHINES_FILE_NAME').exists();
    if(shouldRefresh || !isPosMachinesFileAvailable) {
      final response = await _callPOSMachinesContainerApi();
      return response;
    } else {
      final response = await _getPOSMachinesContainerFromFile();
      return response;
    }
  }



  Future<List<UserRoleContainerDTO>?> getUserRoles() async {
    if(_userRoleContainerResponse == null) {
      final localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$USER_ROLES_FILE_NAME').exists();
      if(!isFileAvailable) {
        _userRoleContainerResponse = await _callUserRoleContainerApi();
        return _userRoleContainerResponse?.data?.userRoleContainerDTOList;
      } else {
        _userRoleContainerResponse = await _getUserRoleContainerFromFile();
        return _userRoleContainerResponse?.data?.userRoleContainerDTOList;
      }
    } else {
      return _userRoleContainerResponse?.data?.userRoleContainerDTOList;
    }
  }

  Future<UserRoleContainerDTO?> getUserRoleById(int roleId) async {
    if(_userRoleMap == null) {
      final localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$USER_ROLES_FILE_NAME').exists();
      if(!isFileAvailable) {
        await _callUserRoleContainerApi();
        return _userRoleMap?[roleId];
      } else {
        await _getUserRoleContainerFromFile();
        return _userRoleMap?[roleId];
      }
    } else {
      return _userRoleMap?[roleId];
    }
  }

  Future<List<FacilityTableStatusContainerDTO>?> getFacilityTableStatus() async {
    if(_facilityTableStatusContainerResponse == null) {
      final localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$FACILITY_TABLE_STATUS_FILE_NAME').exists();
      if(!isFileAvailable) {
        _facilityTableStatusContainerResponse = await _callFacilityTableStatusContainerApi();
        return _facilityTableStatusContainerResponse?.data?.facilityTableStatusContainerDTOList;
      } else {
        _facilityTableStatusContainerResponse = await _getFacilityTableStatusContainerFromFile();
        return _facilityTableStatusContainerResponse?.data?.facilityTableStatusContainerDTOList;
      }
    } else {
      return _facilityTableStatusContainerResponse?.data?.facilityTableStatusContainerDTOList;
    }
  }

  Future<List<OrderStatusContainerDTO>?> getOrderStatus() async {
    if(_orderStatusContainerResponse == null) {
      final localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$ORDER_STATUS_FILE_NAME').exists();
      if(!isFileAvailable) {
        _orderStatusContainerResponse = await _callOrderStatusContainerApi();
        return _orderStatusContainerResponse?.data?.orderStatusContainerDTOList;
      } else {
        _orderStatusContainerResponse = await _getOrderStatusContainerFromFile();
        return _orderStatusContainerResponse?.data?.orderStatusContainerDTOList;
      }
    } else {
      return _orderStatusContainerResponse?.data?.orderStatusContainerDTOList;
    }
  }

  void clear() {
    _siteResponse = null;
    _configurationResponse = null;
    _brandImagePath = null;
    _messageMap = null;
    _lookupIdMap = null;
    _lookupNameMap = null;
    _payModeMap = null;
    _paymentModesResponse = null;
    _posMachinesResponse = null;
    _kotPrintersList.clear();
    _userRoleContainerResponse = null;
    _userRoleMap = null;
    _discountContainerResponse = null;
    _discountMap = null;
    _facilityTableStatusContainerResponse = null;
    _orderStatusContainerResponse = null;
    _segmentCategoryContainerResponse = null;
    _facilityContainerResponse = null;
    _parafaitDefaultContainerMap = null;
    _posMachineMap = null;
    _cachedImage = {};
  }

  Future<SiteResponse?> _callSiteContainerApi() async {
    try {
      final refreshServer = _preferences.getBool(shouldRefreshServer) ?? false;
      final siteHash = _preferences.getString(siteHashKey);
      final response = await _masterDataApiClient.getSites({
        'hash': refreshServer ? null : siteHash,
        'rebuildCache': refreshServer,
      });
      if(response.data != null && response.exception == null) {
        var responseString = json.encode(response.toJson());
        await _preferences.setString(siteHashKey, response.data?.hash ?? '');
        await _deleteFile(SITE_FILE_NAME);
        await _saveResponseToJsonFile(responseString, SITE_FILE_NAME);
      }
      return response;
    } on DioError catch (error) {
      Log.e('Api error: ${error.response?.data['data'].toString()}');
      return null;
    }
  }

  Future<ConfigurationResponse?> syncParafaitDefaultsContainer() async {
    var response = await _callConfigurationsContainerApi();
    if(response?.data == null || response?.exception != null) {
     response = await _getConfigurationsContainerFromFile();
    }
    return response;
  }

  Future<ConfigurationResponse?> _callConfigurationsContainerApi() async {
    try {
      final refreshServer = _preferences.getBool(shouldRefreshServer) ?? false;
      final configHash = _preferences.getString(configHashKey);
      final response = await _masterDataApiClient.getConfigurations({
        'siteId': _executionContextDTO.siteId ?? 0,
        'hash': configHash,
        'rebuildCache': refreshServer,
        'userPkId': _executionContextDTO.userPKId ?? -1,
        'machineId': _executionContextDTO.machineId ?? -1,
        'transactionProfileId': -1,
      });
      if(response.data != null && response.exception == null) {

        _parafaitDefaultContainerMap = <String,String>{};
        final defaultsList = response.data?.parafaitDefaultContainerDtoList;
        if (defaultsList != null) {
          for (int i = 0; i < defaultsList.length; i++) {
            final item = defaultsList[i];
            _parafaitDefaultContainerMap?[item.defaultValueName] = item.defaultValue;
          }
        }
        final defTimeOut = _parafaitDefaultContainerMap?['POS_INACTIVE_TIMEOUT'];
        if(defTimeOut != null) {
          await _saveDefaultTimeOut(defTimeOut);
        }
        var responseString = json.encode(response.toJson());
        await _preferences.setString(configHashKey, response.data?.hash ?? '');
        await _deleteFile(CONFIG_FILE_NAME);
        await _saveResponseToJsonFile(responseString, CONFIG_FILE_NAME);
      }
      return response;
    } on DioError catch (error) {
      Log.e('Api error: ${error.response?.data['data'].toString()}');
      return null;
    }
  }

  Future<void> _saveDefaultTimeOut(String defTimeOut) async {
    var timeOut = 0;
    timeOut = int.tryParse(defTimeOut) ?? 999;
    await _preferences.setInt(posInactiveTimeOut, timeOut);
  }

  Future<void> _callBrandImageApi() async {
    try {
      final response = await _masterDataApiClient.getBrandImage({
        'defaultValueName': 'IMAGE_DIRECTORY',
        'fileName': 'POS_ScreenSaverLogo.png',
        'secure': 'true'
      });
      await _deleteFile(SPLASH_FILE_NAME);
      await _saveImage(response);
    } on DioError catch (error) {
      Log.e('Master Data sync error: ${error.error.toString()}');
    }
  }

  Future<MessagesResponse?> _callMessagesContainerApi() async {
    try {
      final executionContextBL = await ExecutionContextBuilder.build();
      final executionContext = executionContextBL.getExecutionContext();
      final messagesDataBL = await MessagesProvider.build(executionContext!);

      final response = await messagesDataBL.sync();
      final messageList = response?.data?.messageContainerDTOList;
      if (messageList != null) {
        _messageMap = <int, String>{};
        for (int i = 0; i < messageList.length; i++) {
          final item = messageList[i];
          if(item.translatedMessage.isNotEmpty) {
            _messageMap?[item.messageId] = item.translatedMessage;
          } else {
            _messageMap?[item.messageId] = item.message;
          }
        }
      } else {
        _messageMap = await _getMessagesContainerFromFile();
      }
      return response;
    } on DioError catch (error) {
      Log.e('Api error: ${error.response?.data['data'].toString()}');
      return null;
    }
  }

  Future<SiteResponse?> _getSiteContainerFromFile() async {
    var localPath = await _localPath;
    bool isFileAvailable = await File('$localPath/files/$SITE_FILE_NAME').exists();
    if(isFileAvailable) {
      final file = File('$localPath/files/$SITE_FILE_NAME');
      var fileContent = await file.readAsString();
      final responseMap = json.decode(fileContent) as Map<String, dynamic>;
      final response = SiteResponse.fromJson(responseMap);
      return response;
    } else {
      return null;
    }
  }

  Future<ConfigurationResponse?> _getConfigurationsContainerFromFile() async {
    var localPath = await _localPath;
    bool isFileAvailable = await File('$localPath/files/$CONFIG_FILE_NAME').exists();
    if(isFileAvailable) {
      final file = File('$localPath/files/$CONFIG_FILE_NAME');
      var fileContent = await file.readAsString();
      final responseMap = json.decode(fileContent) as Map<String, dynamic>;
      final response = ConfigurationResponse.fromJson(responseMap);
      return response;
    } else {
      return null;
    }
  }

  Future<Map<int,String>?> _getMessagesContainerFromFile() async {

    final executionContextBL = await ExecutionContextBuilder.build();
    final executionContext = executionContextBL.getExecutionContext();
    final messagesDataBL = await MessagesProvider.build(executionContext!);
    await messagesDataBL.syncFromLocal();

    var localPath = await _localPath;
    bool isFileAvailable = await File('$localPath/files/$MESSAGES_FILE_NAME').exists();
    if(isFileAvailable) {
      final file = File('$localPath/files/$MESSAGES_FILE_NAME');
      var fileContent = await file.readAsString();
      final responseMap = json.decode(fileContent) as Map<String, dynamic>;
      final messageContainerMapDTO = MessagesResponse.fromJson(responseMap);
      final messages = messageContainerMapDTO.data?.messageContainerDTOList;
      var messageContainerMap = <int, String>{};

      if(messages != null) {
        for(int i=0; i<messages.length; i++) {
          final item = messages[i];
          if(item.translatedMessage.isNotEmpty) {
            messageContainerMap[item.messageId] = item.translatedMessage;
          } else {
            messageContainerMap[item.messageId] = item.message;
          }
        }
      }
      return messageContainerMap;
    } else {
      return null;
    }
  }

  Future<LookupResponse?> _callLookupContainerApi() async {
    try {
      final refreshServer = _preferences.getBool(shouldRefreshServer) ?? false;
      final lookUpHash = _preferences.getString(lookUpHashKey);
      final response = await _masterDataApiClient.getLookupContainer({
        'siteId': _executionContextDTO.siteId ?? 0,
        'hash': lookUpHash,
        'rebuildCache': refreshServer,
      });
      if(response.data != null && response.exception == null) {
        _lookupIdMap = <int, List<LookupValuesContainerDTO>>{};
        _lookupNameMap = <String, List<LookupValuesContainerDTO>>{};
        final lookupList = response.data?.lookupsContainerDTOList;
        if (lookupList != null) {
          for (int i = 0; i < lookupList.length; i++) {
            final item = lookupList[i];
            _lookupIdMap?[item.lookupId] = item.lookupValuesContainerDTOList;
            _lookupNameMap?[item.lookupName] = item.lookupValuesContainerDTOList;
          }
        }
        var responseString = json.encode(response.toJson());
        await _preferences.setString(lookUpHashKey, response.data?.hash ?? '');
        await _deleteFile(LOOKUP_FILE_NAME);
        await _saveResponseToJsonFile(responseString, LOOKUP_FILE_NAME);
      }
      return response;
    } on DioError catch (error) {
      Log.e('Api error: ${error.response?.data['data'].toString()}');
      return null;
    }
  }

  Future<void> _getLookupContainerFromFile() async {
    var localPath = await _localPath;
    bool isFileAvailable = await File('$localPath/files/$LOOKUP_FILE_NAME').exists();
    if(isFileAvailable) {
      final file = File('$localPath/files/$LOOKUP_FILE_NAME');
      var fileContent = await file.readAsString();
      final responseMap = json.decode(fileContent) as Map<String, dynamic>;
      final response = LookupResponse.fromJson(responseMap);

      final lookupList = response.data?.lookupsContainerDTOList;
      _lookupIdMap = <int, List<LookupValuesContainerDTO>>{};
      _lookupNameMap = <String, List<LookupValuesContainerDTO>>{};
      if (lookupList != null) {
        for (int i = 0; i < lookupList.length; i++) {
          final item = lookupList[i];
          _lookupIdMap?[item.lookupId] = item.lookupValuesContainerDTOList;
          _lookupNameMap?[item.lookupName] = item.lookupValuesContainerDTOList;
        }
      }
    }
  }

  Future<PaymentModesResponse?> _callPaymentModesContainerApi() async {
    try {
      final refreshServer = _preferences.getBool(shouldRefreshServer) ?? false;
      final payModeHash = _preferences.getString(payModeHashKey);
      final response = await _masterDataApiClient.getPaymentModesContainer({
        'siteId': _executionContextDTO.siteId ?? 0,
        'hash': payModeHash,
        'rebuildCache': refreshServer,
      });
        if(response.data != null && response.exception == null) {
          _paymentModesResponse = response;
          _payModeMap = <int, PaymentModeContainerDTO>{};
          final paymentList = response.data?.paymentModeContainerDTOList;
          if (paymentList != null) {
            for (int i = 0; i < paymentList.length; i++) {
              final item = paymentList[i];
              _payModeMap?[item.paymentModeId] = item;
            }
          var responseString = json.encode(response.toJson());
          await _preferences.setString(payModeHashKey, response.data?.hash ?? '');
          await _deleteFile(PAYMENT_FILE_NAME);
          await _saveResponseToJsonFile(responseString, PAYMENT_FILE_NAME);
        }
      }
      return response;
    } on DioError catch (error) {
      Log.e('Api error: ${error.response?.data['data'].toString()}');
      return null;
    }
  }

  Future<void> _getPaymentModesContainerFromFile() async {
    var localPath = await _localPath;
    bool isFileAvailable = await File('$localPath/files/$PAYMENT_FILE_NAME').exists();
    if(isFileAvailable) {
      final file = File('$localPath/files/$PAYMENT_FILE_NAME');
      var fileContent = await file.readAsString();
      final responseMap = json.decode(fileContent) as Map<String, dynamic>;
      final response = PaymentModesResponse.fromJson(responseMap);
      _paymentModesResponse = response;

      _payModeMap = <int, PaymentModeContainerDTO>{};
      final paymentList = response.data?.paymentModeContainerDTOList;
      if (paymentList != null) {
        for (int i = 0; i < paymentList.length; i++) {
          final item = paymentList[i];
          _payModeMap?[item.paymentModeId] = item;
        }
      }
    }
  }

  Future<POSMachinesResponse?> _callPOSMachinesContainerApi() async {
    try {
      final refreshServer = _preferences.getBool(shouldRefreshServer) ?? false;
      final posMachineHash = _preferences.getString(posMachineHashKey);
      var response = await _masterDataApiClient.getPOSMachinesContainer({
        'siteId': _executionContextDTO.siteId ?? 0,
        'hash': posMachineHash,
        'rebuildCache': refreshServer,
      });

      if(response.data != null && response.exception == null) {
        _posMachinesResponse = response;
        await _refreshKOTPrinterList();

        var responseString = json.encode(response.toJson());
        await _preferences.setString(posMachineHashKey, response.data?.hash ?? '');
        await _deleteFile(POS_MACHINES_FILE_NAME);
        await _saveResponseToJsonFile(responseString, POS_MACHINES_FILE_NAME);
      }
      final lookupList = response.data?.posMachineContainerDTOList;
      _posMachineMap = <int,POSMachineContainerDTO>{};
      if (lookupList != null) {
        for (int i = 0; i < lookupList.length; i++) {
          final item = lookupList[i];
          _posMachineMap?[item.posMachineId] = item;
        }
      }
      if(response.data == null) {
        final resp = await _getPOSMachinesContainerFromFile();
        if(resp != null) {
          response = resp;
        }
      }
      return response;
    } on DioError catch (error) {
      Log.e('Api error: ${error.response?.data['data'].toString()}');
      return null;
    }
  }

  Future<List<POSMachineContainerDTO>?> getPosMachineContainer() async{
    if(_posMachinesResponse == null) {
      var localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$POS_MACHINES_FILE_NAME').exists();
      if(isFileAvailable) {
        _posMachinesResponse = await _getPOSMachinesContainerFromFile();
        return _posMachinesResponse?.data?.posMachineContainerDTOList;
      } else {
        _posMachinesResponse = await _callPOSMachinesContainerApi();
        return _posMachinesResponse?.data?.posMachineContainerDTOList;
      }
    }else{
      return _posMachinesResponse?.data?.posMachineContainerDTOList;
    }
  }

  Future<void> _refreshKOTPrinterList() async {
    POSMachinesResponse response;
    if(_posMachinesResponse == null) {
      var localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$POS_MACHINES_FILE_NAME').exists();
      if(isFileAvailable) {
        _posMachinesResponse = await _getPOSMachinesContainerFromFile();
        response = _posMachinesResponse!;
      } else {
        _posMachinesResponse = await _callPOSMachinesContainerApi();
        response = _posMachinesResponse!;
      }
    } else {
      response = _posMachinesResponse!;
    }
    _kotPrintersList.clear();
    final list = await getLookUpValuesByName(LOOKUP_PRINTER_NAME);
    final item = list?.where((element) => element.lookupValue == LOOKUP_KOT_PRINTER_VALUE_KEY);
    if(item != null && item.isNotEmpty) {
      final kotItem = item.first;
      final listLength = response.data?.posMachineContainerDTOList.length ?? 0;
      for(int i = 0; i < listLength; i++) {
        final printerDTOList = response.data!.posMachineContainerDTOList[i].posPrinterContainerDTOList;
        final filteredKOTPrinterList = printerDTOList.where((element) => element.printerTypeId == kotItem.lookupValueId);
        _kotPrintersList.addAll(filteredKOTPrinterList);
      }
    }
  }

  Future<POSMachinesResponse?> _getPOSMachinesContainerFromFile() async {
    var localPath = await _localPath;
    bool isFileAvailable = await File('$localPath/files/$POS_MACHINES_FILE_NAME').exists();
    if(isFileAvailable) {
      final file = File('$localPath/files/$POS_MACHINES_FILE_NAME');
      var fileContent = await file.readAsString();
      final responseMap = json.decode(fileContent) as Map<String, dynamic>;
      final response = POSMachinesResponse.fromJson(responseMap);
      final lookupList = response.data?.posMachineContainerDTOList;
      _posMachineMap = <int,POSMachineContainerDTO>{};
      if (lookupList != null) {
        for (int i = 0; i < lookupList.length; i++) {
          final item = lookupList[i];
          _posMachineMap?[item.posMachineId] = item;
        }
      }
      return response;
    } else {
      return null;
    }
  }

  Future<UserRoleContainerResponse?> _callUserRoleContainerApi() async {
    try {
      final refreshServer = _preferences.getBool(shouldRefreshServer) ?? false;
      final userRoleHash = _preferences.getString(userRoleHashKey);
      final response = await _masterDataApiClient.getUserRoleContainer({
        'siteId': _executionContextDTO.siteId ?? 0,
        'hash': userRoleHash,
        'rebuildCache': refreshServer,
      });

      if(response.data != null && response.exception == null) {
        _userRoleMap = <int, UserRoleContainerDTO>{};
        final userRoleList = response.data?.userRoleContainerDTOList;
        if (userRoleList != null) {
          for (int i = 0; i < userRoleList.length; i++) {
            final item = userRoleList[i];
            _userRoleMap?[item.roleId] = item;
          }
        }

        _userRoleContainerResponse = response;
        var responseString = json.encode(response.toJson());
        await _preferences.setString(userRoleHashKey, response.data?.hash ?? '');
        await _deleteFile(USER_ROLES_FILE_NAME);
        await _saveResponseToJsonFile(responseString, USER_ROLES_FILE_NAME);
      }
      return response;
    } on DioError catch (error) {
      Log.e('Api error: ${error.response?.data['data'].toString()}');
      return null;
    }
  }

  Future<UserRoleContainerResponse?> _getUserRoleContainerFromFile() async {
    var localPath = await _localPath;
    bool isFileAvailable = await File('$localPath/files/$USER_ROLES_FILE_NAME').exists();
    if(isFileAvailable) {
      final file = File('$localPath/files/$USER_ROLES_FILE_NAME');
      var fileContent = await file.readAsString();
      final responseMap = json.decode(fileContent) as Map<String, dynamic>;
      final response = UserRoleContainerResponse.fromJson(responseMap);

      _userRoleMap = <int, UserRoleContainerDTO>{};
      final userRoleList = response.data?.userRoleContainerDTOList;
      if (userRoleList != null) {
        for (int i = 0; i < userRoleList.length; i++) {
          final item = userRoleList[i];
          _userRoleMap?[item.roleId] = item;
        }
      }
      return response;
    } else {
      return null;
    }
  }

  Future<FacilityTableStatusContainerResponse?> _callFacilityTableStatusContainerApi() async {
    try {
      final refreshServer = _preferences.getBool(shouldRefreshServer) ?? false;
      final facilityTableHash = _preferences.getString(facilityTableHashKey);
      final response = await _masterDataApiClient.getFacilityTableStatusContainer({
        'siteId': _executionContextDTO.siteId ?? 0,
        'hash': facilityTableHash,
        'rebuildCache': refreshServer,
      });
      if(response.data != null && response.exception == null) {
        _facilityTableStatusContainerResponse = response;
        var responseString = json.encode(response.toJson());
        await _preferences.setString(facilityTableHashKey, response.data?.hash ?? '');
        await _deleteFile(FACILITY_TABLE_STATUS_FILE_NAME);
        await _saveResponseToJsonFile(responseString, FACILITY_TABLE_STATUS_FILE_NAME);
      }
      return response;
    } on DioError catch (error) {
      Log.e('Api error: ${error.response?.data['data'].toString()}');
      return null;
    }
  }

  Future<FacilityTableStatusContainerResponse?> _getFacilityTableStatusContainerFromFile() async {
    var localPath = await _localPath;
    bool isFileAvailable = await File('$localPath/files/$FACILITY_TABLE_STATUS_FILE_NAME').exists();
    if(isFileAvailable) {
      final file = File('$localPath/files/$FACILITY_TABLE_STATUS_FILE_NAME');
      var fileContent = await file.readAsString();
      final responseMap = json.decode(fileContent) as Map<String, dynamic>;
      final response = FacilityTableStatusContainerResponse.fromJson(responseMap);

      return response;
    } else {
      return null;
    }
  }

  Future<OrderStatusContainerResponse?> _callOrderStatusContainerApi() async {
    try {
      final refreshServer = _preferences.getBool(shouldRefreshServer) ?? false;
      final orderStatusHash = _preferences.getString(orderStatusHashKey);
      final response = await _masterDataApiClient.getOrderStatusContainer({
        'siteId': _executionContextDTO.siteId ?? 0,
        'hash': orderStatusHash,
        'rebuildCache': refreshServer,
      });
      if(response.data != null && response.exception == null) {
        _orderStatusContainerResponse = response;
        var responseString = json.encode(response.toJson());
        await _preferences.setString(orderStatusHashKey, response.data?.hash ?? '');
        await _deleteFile(ORDER_STATUS_FILE_NAME);
        await _saveResponseToJsonFile(responseString, ORDER_STATUS_FILE_NAME);
      }
      return response;
    } on DioError catch (error) {
      Log.e('Api error: ${error.response?.data['data'].toString()}');
      return null;
    }
  }

  Future<OrderStatusContainerResponse?> _getOrderStatusContainerFromFile() async {
    var localPath = await _localPath;
    bool isFileAvailable = await File('$localPath/files/$ORDER_STATUS_FILE_NAME').exists();
    if(isFileAvailable) {
      final file = File('$localPath/files/$ORDER_STATUS_FILE_NAME');
      var fileContent = await file.readAsString();
      final responseMap = json.decode(fileContent) as Map<String, dynamic>;
      final response = OrderStatusContainerResponse.fromJson(responseMap);

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

  Future<void> _saveImage(List<int> response) async {
    if(response.isEmpty) return;
    final imageResponse = Uint8List.fromList(response);
    final localPath = await _localPath;
    await Directory('$localPath/images').create(recursive: false);
    await File('$localPath/images/$SPLASH_FILE_NAME').writeAsBytes(imageResponse);
    _brandImagePath = '$localPath/images/$SPLASH_FILE_NAME';
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

  Future<DiscountContainerResponse?> _callDiscountContainerApi() async {
    try {
      final refreshServer = _preferences.getBool(shouldRefreshServer) ?? false;
      final discountHash = _preferences.getString(discountHashKey);
      final response = await _masterDataApiClient.getDiscountsContainer({
        'siteId': _executionContextDTO.siteId ?? 0,
        'hash': discountHash,
        'rebuildCache': refreshServer,
      });

      if(response.data != null && response.exception == null) {
        _discountMap = <int, DiscountContainerDto>{};
        final discountList = response.data?.discountContainerDtoList;
        if (discountList != null) {
          for (int i = 0; i < discountList.length; i++) {
            final item = discountList[i];
            _discountMap?[item.discountId!] = item;
          }
        }
        _discountContainerResponse = response;
        var responseString = json.encode(response.toJson());
        await _preferences.setString(discountHashKey, response.data?.hash ?? '');
        await _deleteFile(DISCOUNT_FILE_NAME);
        await _saveResponseToJsonFile(responseString, DISCOUNT_FILE_NAME);
      }
      return response;
    } on DioError catch (error) {
      Log.e('Api error: ${error.response?.data['data'].toString()}');
      return null;
    }
  }

  Future<DiscountContainerResponse?> _getDiscountContainerFromFile() async {
    var localPath = await _localPath;
    bool isFileAvailable = await File('$localPath/files/$DISCOUNT_FILE_NAME').exists();
    if(isFileAvailable) {
      final file = File('$localPath/files/$DISCOUNT_FILE_NAME');
      var fileContent = await file.readAsString();
      final responseMap = json.decode(fileContent) as Map<String, dynamic>;
      final response = DiscountContainerResponse.fromJson(responseMap);

      _discountMap = <int, DiscountContainerDto>{};
      final discountDtoList = response.data?.discountContainerDtoList;
      if (discountDtoList != null) {
        for (int i = 0; i < discountDtoList.length; i++) {
          final item = discountDtoList[i];
          _discountMap?[item.discountId!] = item;
        }
      }
      return response;
    } else {
      return null;
    }
  }

  Future<List<DiscountContainerDto>?> getDiscounts() async {
    if(_discountContainerResponse == null) {
      final localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$DISCOUNT_FILE_NAME').exists();
      if(!isFileAvailable) {
        _discountContainerResponse = await _callDiscountContainerApi();
        return _discountContainerResponse?.data?.discountContainerDtoList;
      } else {
        _discountContainerResponse = await _getDiscountContainerFromFile();
        return _discountContainerResponse?.data?.discountContainerDtoList;
      }
    } else {
      return _discountContainerResponse?.data?.discountContainerDtoList;
    }
  }

  Future<SegmentCategoryContainerResponse?> _callSegmentCategoryContainer() async {
    try {
      final refreshServer = _preferences.getBool(shouldRefreshServer) ?? false;
      final segmentHash = _preferences.getString(segmentHashKey);
      final response = await _masterDataApiClient.getSegmentCategoryContainer({
        'siteId': _executionContextDTO.siteId ?? 0,
        'hash': segmentHash,
        'rebuildCache': refreshServer,
      });

      final segmentCategoryData = response.data?.segmentCategoryContainerDTOList;
      if (segmentCategoryData != null) {
        if(response.data != null && response.exception == null) {
          _segmentCategoryContainerResponse = response;
          var responseString = json.encode(response.toJson());
          await _preferences.setString(segmentHashKey, response.data?.hash ?? '');
          await _deleteFile(SEGMENT_CATEGORY_CONTAINER);
          await _saveResponseToJsonFile(responseString, SEGMENT_CATEGORY_CONTAINER);
        }
      }
      return response;
    } on DioError catch (error) {
      Log.e('Api error: ${error.response?.data['data'].toString()}');
      return null;
    }
  }

  Future<SegmentCategoryContainerResponse?> _getSegmentCategoryContainerFromFile() async {
    var localPath = await _localPath;
    bool isFileAvailable = await File('$localPath/files/$SEGMENT_CATEGORY_CONTAINER').exists();
    if(isFileAvailable) {
      final file = File('$localPath/files/$SEGMENT_CATEGORY_CONTAINER');
      var fileContent = await file.readAsString();
      final responseMap = json.decode(fileContent) as Map<String, dynamic>;
      final response = SegmentCategoryContainerResponse.fromJson(responseMap);
      return response;
    } else {
      return null;
    }
  }


  Future<SegmentCategoryContainerResponse?> getSegmentCategoryContainer() async {
    if(_segmentCategoryContainerResponse == null) {
      final localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$SEGMENT_CATEGORY_CONTAINER').exists();
      if(!isFileAvailable) {
        _segmentCategoryContainerResponse = await _callSegmentCategoryContainer();
        return _segmentCategoryContainerResponse!;
      } else {
        _segmentCategoryContainerResponse = await _getSegmentCategoryContainerFromFile();
        return _segmentCategoryContainerResponse!;
      }
    } else {
      return _segmentCategoryContainerResponse!;
    }
  }

  Future<FacilityContainerResponse?> _callFacilityContainer() async {
    try {
      final refreshServer = _preferences.getBool(shouldRefreshServer) ?? false;
      final facilityHash = _preferences.getString(facilityHashKey);
      final response = await _masterDataApiClient.getFacilityContainer({
        'siteId': _executionContextDTO.siteId ?? 0,
        'hash': facilityHash,
        'rebuildCache': refreshServer,
      });
      if(response.data != null && response.exception == null) {
        _facilityContainerResponse = response;
        var responseString = json.encode(response.toJson());
        await _preferences.setString(facilityHashKey, response.data?.hash ?? '');
        await _deleteFile(FACILITY_CONTAINER);
        await _saveResponseToJsonFile(responseString, FACILITY_CONTAINER);
      }
      return response;
    } on DioError catch (error) {
      Log.e('Api error: ${error.response?.data['data'].toString()}');
      return null;
    }
  }

  Future<FacilityContainerResponse?> _getFacilityContainerFromFile() async {
    var localPath = await _localPath;
    bool isFileAvailable = await File('$localPath/files/$FACILITY_CONTAINER').exists();
    if(isFileAvailable) {
      final file = File('$localPath/files/$FACILITY_CONTAINER');
      var fileContent = await file.readAsString();
      final responseMap = json.decode(fileContent) as Map<String, dynamic>;
      final response = FacilityContainerResponse.fromJson(responseMap);
      return response;
    } else {
      return null;
    }
  }

  Future<List<FacilityContainerDTO>?> getFacilities() async {
    if(_facilityContainerResponse == null) {
      final localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$FACILITY_CONTAINER').exists();
      if(!isFileAvailable) {
        _facilityContainerResponse = await _callFacilityContainer();
        return _facilityContainerResponse?.data?.facilitysContainerDTOList;
      } else {
        _facilityContainerResponse = await _getFacilityContainerFromFile();
        return _facilityContainerResponse?.data?.facilitysContainerDTOList;
      }
    } else {
      return _facilityContainerResponse?.data?.facilitysContainerDTOList;
    }
  }

  Future<String?> getDefaultValuesByName({required String defaultValueName}) async {
    if(_parafaitDefaultContainerMap == null) {
      final localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$CONFIG_FILE_NAME').exists();
      if(!isFileAvailable) {
        await _callConfigurationsContainerApi();
        return _parafaitDefaultContainerMap?[defaultValueName];
      } else {
        await _getDefaultConfigurationFromFile();
        return _parafaitDefaultContainerMap?[defaultValueName];
      }
    } else {
      return _parafaitDefaultContainerMap?[defaultValueName];
    }
  }

  Future<void> _getDefaultConfigurationFromFile() async {
    var localPath = await _localPath;
    bool isFileAvailable = await File('$localPath/files/$CONFIG_FILE_NAME').exists();
    if(isFileAvailable) {
      final file = File('$localPath/files/$CONFIG_FILE_NAME');
      var fileContent = await file.readAsString();
      final responseMap = json.decode(fileContent) as Map<String, dynamic>;
      final response = ConfigurationResponse.fromJson(responseMap);

      final defaultsList = response.data?.parafaitDefaultContainerDtoList;
      _parafaitDefaultContainerMap = <String,String>{};
      if (defaultsList != null) {
        for (int i = 0; i < defaultsList.length; i++) {
          final item = defaultsList[i];
          _parafaitDefaultContainerMap?[item.defaultValueName] = item.defaultValue;
        }
      }
    }
  }

  Future<POSMachineContainerDTO?> getPOSMachineById({required int machineId}) async {
    if(_posMachineMap == null) {
      final localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$POS_MACHINES_FILE_NAME').exists();
      if(!isFileAvailable) {
        await _callPOSMachinesContainerApi();
        return _posMachineMap?[machineId];
      } else {
        await _getPOSMachinesContainerFromFile();
        return _posMachineMap?[machineId];
      }
    } else {
      return _posMachineMap?[machineId];
    }
  }

  Future<GameProfileContainerResponse?> getGameProfileContainer() async {
    if(_gameProfileContainerResponse == null) {
      final localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$GAME_PROFILE_FILE_NAME').exists();
      if(!isFileAvailable) {
        _gameProfileContainerResponse = await _callGameProfileContainerApi();
        return _gameProfileContainerResponse!;
      } else {
        _gameProfileContainerResponse = await _getGameProfileContainerFromFile();
        return _gameProfileContainerResponse!;
      }
    } else {
      return _gameProfileContainerResponse!;
    }
  }

  Future<GameProfileContainerResponse?> _callGameProfileContainerApi() async {
    try {
      final refreshServer = _preferences.getBool(shouldRefreshServer) ?? false;
      final gameProfileHash = _preferences.getString(gameProfileHashKey);
      final response = await _masterDataApiClient.getGameProfileContainer({
        'siteId': _executionContextDTO.siteId ?? 0,
        'hash': gameProfileHash,
        'rebuildCache': refreshServer,
      });

      if(response.data != null && response.exception == null) {
        _gameProfileContainerResponse = response;
        var responseString = json.encode(response.toJson());
        await _preferences.setString(gameProfileHashKey, response.data?.hash ?? '');
        await _deleteFile(GAME_PROFILE_FILE_NAME);
        await _saveResponseToJsonFile(responseString, GAME_PROFILE_FILE_NAME);
      }

      return response;
    } on DioError catch (error) {
      Log.e('Api error: ${error.response?.data['data'].toString()}');
      return null;
    }
  }

  Future<GameProfileContainerResponse?> _getGameProfileContainerFromFile() async {
    var localPath = await _localPath;
    bool isFileAvailable = await File('$localPath/files/$GAME_PROFILE_FILE_NAME').exists();
    if(isFileAvailable) {
      final file = File('$localPath/files/$GAME_PROFILE_FILE_NAME');
      var fileContent = await file.readAsString();
      final responseMap = json.decode(fileContent) as Map<String, dynamic>;
      final response = GameProfileContainerResponse.fromJson(responseMap);
      return response;
    } else {
      return null;
    }
  }

  Future<GameContainerResponse?> getGameContainer() async {
    if(_gameContainerResponse == null) {
      final localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$GAME_FILE_NAME').exists();
      if(!isFileAvailable) {
        _gameContainerResponse = await _callGameContainerApi();
        return _gameContainerResponse!;
      } else {
        _gameContainerResponse = await _getGameContainerFromFile();
        return _gameContainerResponse!;
      }
    } else {
      return _gameContainerResponse!;
    }
  }

  Future<GameContainerResponse?> _callGameContainerApi() async {
    try {
      final refreshServer = _preferences.getBool(shouldRefreshServer) ?? false;
      final gameHash = _preferences.getString(gameHashKey);
      final response = await _masterDataApiClient.getGameContainer({
        'siteId': _executionContextDTO.siteId ?? 0,
        'hash': gameHash,
        'rebuildCache': refreshServer,
      });

      if(response.data != null && response.exception == null) {
        _gameContainerResponse = response;
        var responseString = json.encode(response.toJson());
        await _preferences.setString(gameHashKey, response.data?.hash ?? '');
        await _deleteFile(GAME_FILE_NAME);
        await _saveResponseToJsonFile(responseString, GAME_FILE_NAME);
      }

      return response;
    } on DioError catch (error) {
      Log.e('Api error: ${error.response?.data['data'].toString()}');
      return null;
    }
  }

  Future<GameContainerResponse?> _getGameContainerFromFile() async {
    var localPath = await _localPath;
    bool isFileAvailable = await File('$localPath/files/$GAME_FILE_NAME').exists();
    if(isFileAvailable) {
      final file = File('$localPath/files/$GAME_FILE_NAME');
      var fileContent = await file.readAsString();
      final responseMap = json.decode(fileContent) as Map<String, dynamic>;
      final response = GameContainerResponse.fromJson(responseMap);
      return response;
    } else {
      return null;
    }
  }

  Future<CategoryContainerResponse?> getCategoryContainer() async {
    if(_categoryContainerResponse == null) {
      final localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$CATEGORY_CONTAINER_FILE_NAME').exists();
      if(!isFileAvailable) {
        _categoryContainerResponse = await _callCategoryContainerApi();
        return _categoryContainerResponse!;
      } else {
        _categoryContainerResponse = await _getCategoryContainerFromFile();
        return _categoryContainerResponse!;
      }
    } else {
      return _categoryContainerResponse!;
    }
  }

  Future<CategoryContainerResponse?> _callCategoryContainerApi() async {
    try {
      final refreshServer = _preferences.getBool(shouldRefreshServer) ?? false;
      final categoryContainerHash = _preferences.getString(categoryContainerHashKey);
      final response = await _masterDataApiClient.getCategoryContainer({
        'siteId': _executionContextDTO.siteId ?? 0,
        'hash': categoryContainerHash,
        'rebuildCache': refreshServer,
      });

      if(response.data != null && response.exception == null) {
        _categoryContainerResponse = response;
        var responseString = json.encode(response.toJson());
        await _preferences.setString(categoryContainerHashKey, response.data?.hash ?? '');
        await _deleteFile(CATEGORY_CONTAINER_FILE_NAME);
        await _saveResponseToJsonFile(responseString, CATEGORY_CONTAINER_FILE_NAME);
      }

      return response;
    } on DioError catch (error) {
      Log.e('Api error: ${error.response?.data['data'].toString()}');
      return null;
    }
  }

  Future<CategoryContainerResponse?> _getCategoryContainerFromFile() async {
    var localPath = await _localPath;
    bool isFileAvailable = await File('$localPath/files/$CATEGORY_CONTAINER_FILE_NAME').exists();
    if(isFileAvailable) {
      final file = File('$localPath/files/$CATEGORY_CONTAINER_FILE_NAME');
      var fileContent = await file.readAsString();
      final responseMap = json.decode(fileContent) as Map<String, dynamic>;
      final response = CategoryContainerResponse.fromJson(responseMap);
      return response;
    } else {
      return null;
    }
  }

  Future<OrderTypeContainerResponse?> getOrderTypeContainer() async {
    if(_orderTypeContainerResponse == null) {
      final localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$ORDER_TYPE_CONTAINER_FILE_NAME').exists();
      if(!isFileAvailable) {
        _orderTypeContainerResponse = await _callOrderTypeContainerApi();
        return _orderTypeContainerResponse!;
      } else {
        _orderTypeContainerResponse = await _getOrderTypeContainerFromFile();
        return _orderTypeContainerResponse!;
      }
    } else {
      return _orderTypeContainerResponse!;
    }
  }

  Future<OrderTypeContainerResponse?> _callOrderTypeContainerApi() async {
    try {
      final refreshServer = _preferences.getBool(shouldRefreshServer) ?? false;
      final orderTypeHash = _preferences.getString(orderTypeHashKey);
      final response = await _masterDataApiClient.getOrderTypeContainer({
        'siteId': _executionContextDTO.siteId ?? 0,
        'hash': orderTypeHash,
        'rebuildCache': refreshServer,
      });

      if(response.data != null && response.exception == null) {
        _orderTypeContainerResponse = response;
        var responseString = json.encode(response.toJson());
        await _preferences.setString(orderTypeHashKey, response.data?.hash ?? '');
        await _deleteFile(ORDER_TYPE_CONTAINER_FILE_NAME);
        await _saveResponseToJsonFile(responseString, ORDER_TYPE_CONTAINER_FILE_NAME);
      }

      return response;
    } on DioError catch (error) {
      Log.e('Api error: ${error.response?.data['data'].toString()}');
      return null;
    }
  }

  Future<OrderTypeContainerResponse?> _getOrderTypeContainerFromFile() async {
    var localPath = await _localPath;
    bool isFileAvailable = await File('$localPath/files/$ORDER_TYPE_CONTAINER_FILE_NAME').exists();
    if(isFileAvailable) {
      final file = File('$localPath/files/$ORDER_TYPE_CONTAINER_FILE_NAME');
      var fileContent = await file.readAsString();
      final responseMap = json.decode(fileContent) as Map<String, dynamic>;
      final response = OrderTypeContainerResponse.fromJson(responseMap);
      return response;
    } else {
      return null;
    }
  }

  // could not able to achieve it using dio , so we have implemented using http method
  Future<Uint8List> getImageData({required String fileName}) async {
    try {
      if (_cachedImage[fileName] != null) {
        List<int> list = utf8.encode('');
        Uint8List bytes = Uint8List.fromList(list);
        return _cachedImage[fileName] ?? bytes;
      } else {
        final response = await http.get(
          Uri.parse(
              '${_appPrefsBL.getServerUrl()}/api/Common/FileResource?defaultValueName=IMAGE_DIRECTORY&fileName=$fileName&secure=true'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': _executionContextDTO.webApiToken ?? ''
          },
        );

        if (response.statusCode == 200) {
          print("Successfully fetched image");
          _cachedImage[fileName] = response.bodyBytes;
          Uint8List bytes = response.bodyBytes;
          return bytes;
        } else {
          List<int> list = utf8.encode('');
          Uint8List bytes = Uint8List.fromList(list);
          return bytes;
        }
      }
    } on DioError {
      rethrow;
    } catch (err) {
      List<int> list = utf8.encode('');
      Uint8List bytes = Uint8List.fromList(list);
      return bytes;
    }
  }

  // could not able to achieve it using dio , so we have implemented using http method
  Future<int> uploadImage(
      {required Uint8List binaryImage,
        required String fileName,
        String? defaultValueName,
        bool? secure}) async {
    try {
      final response = await http.post(
        Uri.parse(
            '${_appPrefsBL.getServerUrl()}/api/Common/FileResource?defaultValueName=${defaultValueName ?? 'IMAGE_DIRECTORY'}&fileName=$fileName&secure=${secure ?? true}'),
        headers: {
          'Content-Type': "text/plain",
          'Accept': "*/*",
          'Content-Length': binaryImage.length.toString(),
          'Connection': 'keep-alive',
          'Authorization': _executionContextDTO.webApiToken ?? ''
        },
        body: binaryImage,
      );

      if (response.statusCode == 200) {
        print("Successfully uploaded image");
        return response.statusCode;// if the response code is 200, then the image uploaded successfully
      } else {
        return response.statusCode;
      }
    } on DioError {
      // return false;
      rethrow;
    } catch (err) {
      return 500; // server Error
    }
  }


  Future<TaskTypeContainerResponse?> _callTaskTypeContainer() async {
    try {
      final refreshServer = _preferences.getBool(shouldRefreshServer) ?? false;
      final taskTypeHash = _preferences.getString(taskTypeHashKey);
      final response = await _masterDataApiClient.getTaskTypesContainer({
        'siteId': _executionContextDTO.siteId ?? 0,
        'hash': taskTypeHash,
        'rebuildCache': refreshServer,
      });
      if(response.data != null && response.exception == null) {
        _taskTypeContainerDtoList = response.data?.taskTypesContainerDTOList??[];
        var responseString = json.encode(response.toJson());
        await _preferences.setString(taskTypeHashKey, response.data?.hash ?? '');
        await _deleteFile(TASK_TYPES_CONTAINER);
        await _saveResponseToJsonFile(responseString, TASK_TYPES_CONTAINER);
      }
      return response;
    } on DioError catch (error) {
      Log.e('Api error: ${error.response?.data['data'].toString()}');
      return null;
    }
  }


  Future<List<TaskTypeContainerDto>> getTaskTypeContainerList() async {
    if(_taskTypeContainerDtoList.isNotEmpty){
      return _taskTypeContainerDtoList;
    }else{
      var localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$TASK_TYPES_CONTAINER').exists();
      if(isFileAvailable) {
        final file = File('$localPath/files/$TASK_TYPES_CONTAINER');
        var fileContent = await file.readAsString();
        final responseMap = json.decode(fileContent) as Map<String, dynamic>;
        final response = TaskTypeContainerResponse.fromJson(responseMap);
        _taskTypeContainerDtoList = response.data?.taskTypesContainerDTOList??[];
        return _taskTypeContainerDtoList;
      } else {
        return [];
      }
    }
  }

  Future<TaskTypeContainerDto?> getTaskTypeContainer({required String category, required String taskType}) async {
    if(_taskTypeContainerDtoList.isNotEmpty){
    final List<TaskTypeContainerDto> filteredTaskType =   _taskTypeContainerDtoList.where((e) => e.category == category && e.taskType ==taskType).toList();
    if(filteredTaskType.isNotEmpty){
      return filteredTaskType[0];
    }
    }else{
      var localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$TASK_TYPES_CONTAINER').exists();
      if(isFileAvailable) {
        final file = File('$localPath/files/$TASK_TYPES_CONTAINER');
        var fileContent = await file.readAsString();
        final responseMap = json.decode(fileContent) as Map<String, dynamic>;
        final response = TaskTypeContainerResponse.fromJson(responseMap);
        _taskTypeContainerDtoList = response.data?.taskTypesContainerDTOList??[];
        final List<TaskTypeContainerDto> filteredTaskType =   _taskTypeContainerDtoList.where((e) => e.category == category && e.taskType == taskType).toList();
        if(filteredTaskType.isNotEmpty){
          return filteredTaskType[0];
        }
      }
    }
    return null;
  }

  Future<ProductTypeContainerResponse?> _callProductTypeContainerAPI() async {
    try {
      final refreshServer = _preferences.getBool(shouldRefreshServer) ?? false;
      final productTypeHash = _preferences.getString(productTypeHashKey);
      final response = await _masterDataApiClient.getProductTypeContainer({
        'siteId': _executionContextDTO.siteId ?? 0,
        'hash': productTypeHash,
        'rebuildCache': refreshServer,
      });
      if(response.data != null && response.exception == null) {
        _productTypeContainerDtoList = response.data?.productTypeContainerDtoList??[];
        var responseString = json.encode(response.toJson());
        await _preferences.setString(productTypeHashKey, response.data?.hash ?? '');
        await _deleteFile(PRODUCT_TYPE_CONTAINER);
        await _saveResponseToJsonFile(responseString, PRODUCT_TYPE_CONTAINER);
      }
      return response;
    } on DioError catch (error) {
      Log.e('Api error: ${error.response?.data['data'].toString()}');
      return null;
    }
  }

  Future<List<ProductTypeContainerDto>> getProductTypeContainerList() async {
    if(_productTypeContainerDtoList.isNotEmpty){
      return _productTypeContainerDtoList;
    }else{
      var localPath = await _localPath;
      bool isFileAvailable = await File('$localPath/files/$PRODUCT_TYPE_CONTAINER').exists();
      if(isFileAvailable) {
        final file = File('$localPath/files/$PRODUCT_TYPE_CONTAINER');
        var fileContent = await file.readAsString();
        final responseMap = json.decode(fileContent) as Map<String, dynamic>;
        final response = ProductTypeContainerResponse.fromJson(responseMap);
        _productTypeContainerDtoList = response.data?.productTypeContainerDtoList??[];
        return _productTypeContainerDtoList;
      } else {
        return [];
      }
    }
  }

  Future<ActivePrintersResponse?> getActivePrinters() async {
    try {
      final response = await _masterDataApiClient.getActivePrinters({'isActive': true,});
      if(response.data != null && response.exception == null) {
        _activePrintersList = response.data;
      }
      return response;
    } on DioError catch (error) {
      Log.e('Api error: ${error.response?.data['data'].toString()}');
      return null;
    }
  }
}
