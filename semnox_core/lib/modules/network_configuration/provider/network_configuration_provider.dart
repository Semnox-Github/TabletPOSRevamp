import 'dart:convert';
import 'package:semnox_core/modules/network_configuration/model/network_configuration_dto.dart';
import 'package:semnox_core/modules/utilities/api_service_library/server_exception.dart';
import 'package:semnox_core/utils/storage_service/local_storage.dart';

class NetworkConfigurationProvider {
  static String get _storageKey => "networkconnection";
  static NetworkConfigurationDTO? _networkConfigurationDTO;

  Future<NetworkConfigurationDTO?> getNetworkConfiguration() async {
    if (_networkConfigurationDTO == null) {
      var storageData = LocalStorage().get(_storageKey);
      if (storageData != null) {
        _networkConfigurationDTO =
            NetworkConfigurationDTO.fromJson(json.decode(storageData));
      }
    }

    if (_networkConfigurationDTO == null ||
        _networkConfigurationDTO!.serverUrl == null ||
        _networkConfigurationDTO!.serverUrl == "") {
      throw NetworkConfigurationNotFoundException(
          "Network Configuration Not Found Exception");
    }
    return _networkConfigurationDTO;
  }

  storeNetworkConfiguration(
      NetworkConfigurationDTO? networkConfigurationDTO) async {
    LocalStorage()
        .save(_storageKey, json.encode(networkConfigurationDTO!.toMap()));
  }
}
