import 'dart:io';

import 'package:application_prefs_data/builder.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:storage_info/storage_info.dart';
import 'package:execution_context/builder.dart';

class DeviceDetails{

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  //Map<String, dynamic> _deviceData = <String, dynamic>{};

  Map<String, dynamic> _deviceData = <String, dynamic>{};
  String _appVersion  = "";
  String _appVersionName = "";
  double? _availableCapacity;
  String? userName = "_User1@semnox.com";
  String? posName;
  String? siteName;

  Future<Map<String, dynamic>> get deviceInfo async {
    await _packageInfo;
    if(Platform.isAndroid) {
      await _capacityInfo;
    }
    await _userInfo;
    try {
      if (Platform.isAndroid) {
        _deviceData =  _readAndroidDeviceInfo(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        _deviceData = _iosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      _deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }
    return _deviceData;
  }

  Map<String, dynamic> _readAndroidDeviceInfo(AndroidDeviceInfo build) {
    return <String, dynamic>{
      '\n Manufacturer Name': build.manufacturer,
      '\n Model Name ': build.model,
      '\n Device Name ' : build.device,
      '\n Android OS Version ': build.version.release,
      '\n Device API level ': build.version.sdkInt,
      '\n App Version Code ': _appVersion,
      '\n App Version Name ': _appVersionName,
      '\n Login ID' : userName,
      '\n POS Name' : posName,
      '\n Site Name' : siteName,
      '\n Environment ': kReleaseMode? "Release" : "Debug",
      '\n Available Capacity ': "$_availableCapacity GB",
      '\n Timezone ': "${DateTime.now().timeZoneName}\n"
    };
  }

  Map<String, dynamic> _iosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      '\n Manufacturer Name': data.name,
      '\n Model Name ': data.model,
      '\n Device Name ' : data.systemName,
      '\n IOS OS Version ': data.systemVersion,
      /*'\n Device API level ': data.utsname.version,*/
      '\n App Version Code ': _appVersion,
      '\n App Version Name ': _appVersionName,
      '\n Login ID' : userName,
      '\n POS Name' : posName,
      '\n Site Name' : siteName,
      '\n Environment ': kReleaseMode? "Release" : "Debug",
      /*'\n Available Capacity ': "$_availableCapacity GB",*/
      '\n Timezone ': "${DateTime.now().timeZoneName}\n"
    };
  }

  Future<PackageInfo> get _packageInfo async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _appVersion = packageInfo.buildNumber;
    _appVersionName = "${packageInfo.version}+${packageInfo.buildNumber}";
    return packageInfo;
  }

  Future<double?> get _capacityInfo async{
    //availableCapacity = await SystemInfoPlus.physicalMemory.toString();
    _availableCapacity = await StorageInfo.getStorageFreeSpaceInGB;
    return _availableCapacity;
  }

  Future<void> get  _userInfo async {
    var execContextBL = await ExecutionContextBuilder.build();
    var appPrefsBL = await ApplicationPrefsBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    userName = execContextDTO?.userId;
    posName = execContextDTO?.posMachineName;
    if(posName == null || posName?.isEmpty == true) {
      posName = appPrefsBL.getMachineName() ?? '';
    }
    siteName = appPrefsBL.getDefaultSiteName() ?? '';
  }
}

