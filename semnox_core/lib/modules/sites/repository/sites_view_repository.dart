/*
********************************************************************************************
 * Project Name - Site
 * Description  - SiteViewRepository class
 *
 **************
 **Version Log
 **************
 *Version     Date             Modified By               Remarks
 *********************************************************************************************
                                Yathish
 ********************************************************************************************
 */
import 'dart:async';
import 'package:semnox_core/modules/execution_context/model/execution_context_dto.dart';
import 'package:semnox_core/modules/sites/model/site_view_dto.dart';
import 'package:semnox_core/modules/sites/repository/request/site_view_service.dart';
import 'package:semnox_core/utils/parafait_cache/parafait_cache.dart';
import 'package:semnox_core/utils/parafait_cache/parafait_storage.dart';

class SiteViewRepository {
  static String get _storageKey => "site";
  static int get _cacheLife => 60 * 24;
  static ParafaitCache? _viewCache;
  static ParafaitStorage? _parafaitStorage;
  SiteViewRepository._internal();
  static final _singleton = SiteViewRepository._internal();

  factory SiteViewRepository() {
    _viewCache ??= ParafaitCache(_cacheLife);
    _parafaitStorage ??= ParafaitStorage(_storageKey, _cacheLife);
    return _singleton;
  }

  Future<List<SiteViewDTO>> getSiteViewDTOList(
      ExecutionContextDTO executionContext) async {
    List<Object>? _siteViewDTOList = [];
    // check if the value is present in the cache or local storage
    _siteViewDTOList = await _getLocalData(executionContext);

    // If the local data is not there, get remote data
    _siteViewDTOList ??= await _getRemoteData(executionContext);

    var siteViewListDTO = SiteViewDTO.getSiteDTOList(_siteViewDTOList);

    return siteViewListDTO!;
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

  static setLocalData(ExecutionContextDTO executionContext, List<Object> data,
      String serverHash) async {
    await _viewCache?.addToCache(_getKey("cache", executionContext), data);
    _parafaitStorage?.addToLocalStorage(
        _getKey("storage", executionContext), data, serverHash);
  }

  static Future<List<Object>?> _getRemoteData(
      ExecutionContextDTO? executionContext) async {
    SiteViewService? _viewservice = SiteViewService(executionContext);
    // var _serverHash = LocalStorage().get(_getKey("serverhash"));
    var _serverHash = await _parafaitStorage
        ?.getServerHash(_getKey("storage", executionContext!));

    //Create search parmeters
    Map<SiteViewDTOSearchParameter, dynamic> searchparams = {
      SiteViewDTOSearchParameter.HASH: _serverHash,
      SiteViewDTOSearchParameter.SITEID: executionContext?.siteId,
      SiteViewDTOSearchParameter.REBUILDCACHE: true,
    };

    // get sites data from API
    var apiResponse = await _viewservice.getSites(searchParams: searchparams);

    if (apiResponse?.data != null) {
      await setLocalData(
          executionContext!, apiResponse!.data!, apiResponse.hash!);
    }

    return apiResponse?.data!;
  }

  static String _getKey(String type, ExecutionContextDTO executionContext) {
    String storageKey = "";
    switch (type) {
      case "cache":
        storageKey = executionContext.siteHash();
        break;
      case "storage":
        storageKey = executionContext.siteHash();
        break;
    }
    return storageKey;
  }

  SiteViewDTO? getSiteById(int id) {
    return null;
  }
}
