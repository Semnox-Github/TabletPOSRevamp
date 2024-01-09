import 'package:semnox_core/modules/execution_context/model/execution_context_dto.dart';
import 'package:semnox_core/modules/pos_machines/model/pos_machine_dto.dart';
import 'package:semnox_core/modules/pos_machines/repository/request/pos_machine_service.dart';
import 'package:semnox_core/utils/parafait_cache/parafait_cache.dart';
import 'package:semnox_core/utils/parafait_cache/parafait_storage.dart';

class PosMachineViewRespository {
  static String get _storageKey => "posMachine";
  static int get _cacheLife => 60 * 24;
  static ParafaitCache? _viewCache;
  static ParafaitStorage? _parafaitStorage;
  PosMachineViewRespository._internal();
  static final _singleton = PosMachineViewRespository._internal();

  factory PosMachineViewRespository() {
    _viewCache ??= ParafaitCache(_cacheLife);
    _parafaitStorage ??= ParafaitStorage(_storageKey, _cacheLife);
    return _singleton;
  }

  Future<List<PosMachineDTO>> getPosMachineViewDTOList(
      ExecutionContextDTO executionContext) async {
    List<Object>? _posMachineViewDTOList = [];
    // check if the value is present in the cache or local storage
    _posMachineViewDTOList = await _getLocalData(executionContext);

    // If the local data is not there, get remote data
    _posMachineViewDTOList ??= await _getRemoteData(executionContext);

    var posMachineViewListDTO =
        PosMachineDTO.getPosMachineDTOList(_posMachineViewDTOList);

    return posMachineViewListDTO!;
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
    PosMachineViewService? _viewservice =
        PosMachineViewService(executionContext);
    // var _serverHash = LocalStorage().get(_getKey("serverhash"));
    var _serverHash = await _parafaitStorage
        ?.getServerHash(_getKey("storage", executionContext!));

    //Create search parmeters
    Map<PosMachineDTOSearchParameter, dynamic> searchparams = {
      PosMachineDTOSearchParameter.hash: _serverHash,
      PosMachineDTOSearchParameter.siteId: executionContext?.siteId,
    };

    // get sites data from API
    var apiResponse =
        await _viewservice.getPosMachines(searchParams: searchparams);

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
}
