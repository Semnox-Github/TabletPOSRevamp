import 'dart:io';

import 'package:startup_data/models/app_versions/app_versions_response.dart';
import 'package:startup_data/models/generic/generic_response.dart';
import 'package:startup_data/startup_data_service.dart';

abstract class StartupDataBLContract {
  Future<bool> isServerAvailable();
  Future<bool> isRemoteServerOnline();
  Future<bool> uploadLogFiles(File file);
  Future<AppVersionsResponse> checkAppVersions();
  Future<GenericResponse> validateLicense();
  Future<GenericResponse> validatePosMachineCount(int machineCount);
  Future<GenericResponse> validateMaxCard();
  Future<GenericResponse> validateTransactionNumber();
  Future<GenericResponse> checkVersion(String appVersion);
  void clear();
}

class StartupDataBLImpl implements StartupDataBLContract {

  final StartupDataService _startupDataService;

  StartupDataBLImpl(this._startupDataService);

  @override
  Future<bool> isRemoteServerOnline() {
    return _startupDataService.isRemoteServerOnline();
  }

  @override
  Future<bool> isServerAvailable() {
    return _startupDataService.isServerAvailable();
  }

  @override
  Future<GenericResponse> validateLicense() {
    return _startupDataService.validateLicense();
  }

  @override
  Future<GenericResponse> validatePosMachineCount(int machineCount) {
    return _startupDataService.validatePosMachineCount(machineCount);
  }

  @override
  Future<GenericResponse> validateMaxCard() {
    return _startupDataService.validateMaxCard();
  }

  @override
  Future<GenericResponse> validateTransactionNumber() {
    return _startupDataService.validateTransactionNumber();
  }

  @override
  Future<GenericResponse> checkVersion(String appVersion) {
    return _startupDataService.checkVersion(appVersion);
  }

  @override
  Future<AppVersionsResponse> checkAppVersions() {
    return _startupDataService.checkAppVersions();
  }

  @override
  void clear() {
    _startupDataService.clear();
  }

  @override
  Future<bool> uploadLogFiles(File file) {
    return _startupDataService.uploadLogFiles(file);
  }
}
