import 'package:network_info_plus/network_info_plus.dart';
import 'package:universal_platform/universal_platform.dart';

class NetworkConnectivityProvider {
  NetworkInfo? _networkInfo;
  NetworkConnectivityProvider() {
    _networkInfo = NetworkInfo();
  }
  getNetworkSSID() async {
    return UniversalPlatform.isWeb ? "--" : await _networkInfo?.getWifiName();
  }

  getDeviceIpAddress() async {
    return UniversalPlatform.isWeb ? "--" : await _networkInfo?.getWifiIP();
  }
}
