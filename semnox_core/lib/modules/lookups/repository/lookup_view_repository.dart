import 'dart:async';
import 'package:semnox_core/modules/execution_context/model/execution_context_dto.dart';
import 'package:semnox_core/modules/lookups/model/lookup_container_dto.dart';
import 'package:semnox_core/modules/lookups/repository/request/lookup_view_service.dart';
import 'package:semnox_core/utils/parafait_cache/parafait_cache.dart';
import 'package:semnox_core/utils/parafait_cache/parafait_storage.dart';

class LookupViewRepository {
  static String get _storageKey => "lookups";
  static int get _cacheLife => 60 * 24;
  static ParafaitCache? _viewCache;
  static ParafaitStorage? _parafaitStorage;
  LookupViewRepository._internal();
  static final _singleton = LookupViewRepository._internal();

  factory LookupViewRepository() {
    _viewCache ??= ParafaitCache(_cacheLife);
    _parafaitStorage ??= ParafaitStorage(_storageKey, _cacheLife);
    return _singleton;
  }

  Future<List<LookupsContainerDTO>?> getLookupViewDTOList(
      ExecutionContextDTO executionContext) async {
    List<Object>? _lookupContainerDTOList = [];
    // check if the value is present in the cache or local storage
    _lookupContainerDTOList = await _getLocalData(executionContext);
    // If the local data is not there, get remote data
    _lookupContainerDTOList ??= await _getRemoteData(executionContext);

    var lookupContainerDTOList =
        LookupsContainerDTO.getLookupContainerDTOList(_lookupContainerDTOList);

    return lookupContainerDTOList;
  }

  static Future<List<Object>?> _getLocalData(
      ExecutionContextDTO executionContext) async {
    List<Object>? _viewDTOList = [];

    // check if the value is present in the cache
    _viewDTOList = await _viewCache?.get(_getKey("cache", executionContext));

    if (_viewDTOList == null) {
      var storedItem = await _parafaitStorage
          ?.getDataFromLocalStorage(_getKey("storage", executionContext));

      if (storedItem != null) {
        await _viewCache?.addToCache(
            _getKey("cache", executionContext), storedItem);
        _viewDTOList = storedItem.toList();
      }
    }
    return _viewDTOList;
  }

  static setLocalData(ExecutionContextDTO? executionContext, List<Object> data,
      String serverHash) async {
    await _viewCache?.addToCache(_getKey("cache", executionContext), data);
    _parafaitStorage?.addToLocalStorage(
        _getKey("storage", executionContext), data, serverHash);
  }

  static Future<List<Object>?> _getRemoteData(
      ExecutionContextDTO? executionContext) async {
    LookupViewService? _viewservice = LookupViewService(executionContext);
    var _serverHash = await _parafaitStorage
        ?.getServerHash(_getKey("storage", executionContext));
    //Create search parmeters
    Map<LookUpViewDTOSearchParameter, dynamic> searchparams = {
      LookUpViewDTOSearchParameter.HASH: _serverHash,
      LookUpViewDTOSearchParameter.SITEID: executionContext?.siteId,
      LookUpViewDTOSearchParameter.REBUILDCACHE: true,
    };

    // get sites data from API
    var apiResponse =
        await _viewservice.getCommonLookups(searchParams: searchparams);
    if (apiResponse?.data != null) {
      await setLocalData(
          executionContext, apiResponse!.data!, apiResponse.hash!);
    }
    return apiResponse?.data!;
  }

  static String _getKey(String type, ExecutionContextDTO? executionContext) {
    String storageKey = "";
    switch (type) {
      case "cache":
        storageKey = executionContext!.siteHash();
        break;
      case "storage":
        storageKey = executionContext!.siteHash();
        break;
    }
    return storageKey;
  }
}
