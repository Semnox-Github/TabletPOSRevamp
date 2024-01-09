import 'package:application_prefs_data/application_prefs_service.dart';
import 'package:application_prefs_data/environment.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApplicationPrefsDataBLContract {

  String? getMachineName();
  Future<void> setMachineName(String machineName);

  String getServerUrl();
  Future<void> setServerUrl(String url);

  Future<void> setDefaultSiteName(String siteName);
  String getDefaultSiteName();

  Future<void> setDefaultSiteId(int siteId);
  int getDefaultSiteId();

  Future<void> setSystemUserName(String userName);
  String getSystemUserName();

  Future<void> setSystemPassword(String password);
  String getSystemPassword();
}

class ApplicationPrefsDataBLImpl implements ApplicationPrefsDataBLContract {

  final ApplicationPrefsDataService applicationPrefsDataService;

  ApplicationPrefsDataBLImpl(this.applicationPrefsDataService);

  @override
  String? getMachineName() {
    return applicationPrefsDataService.getMachineName();
  }

  @override
  Future<void> setMachineName(String machineName) async {
    await applicationPrefsDataService.setMachineName(machineName);
  }

  @override
  String getServerUrl() {
    String? serverUrl = applicationPrefsDataService.getServerUrl();
    if (serverUrl == null || serverUrl.isEmpty) {
      // return Environment.baseUrl; //uncomment if need to autofill baseUrl from config
      return '';
    }
    return serverUrl;
  }

  @override
  Future<void> setServerUrl(String url) async {
    await applicationPrefsDataService.setServerUrl(url);
  }

  @override
  int getDefaultSiteId() {
    return applicationPrefsDataService.getDefaultSiteId();
  }

  @override
  String getSystemPassword() {
    String? password = applicationPrefsDataService.getSystemPassword();
    if(password == null || password.isEmpty) {
      // return Environment.systemUserPassword; //uncomment if need to autofill password from config
      return '';
    }
    return password;
  }

  @override
  String getSystemUserName() {
    String? userName = applicationPrefsDataService.getSystemUserName();
    if(userName == null || userName.isEmpty) {
      // return Environment.systemUserName; //uncomment if need to autofill userName from config
      return '';
    }
    return userName;
  }

  @override
  Future<void> setDefaultSiteId(int siteId) async {
    await applicationPrefsDataService.setDefaultSiteId(siteId);
  }

  @override
  Future<void> setSystemPassword(String password) async {
    await applicationPrefsDataService.setSystemPassword(password);
  }

  @override
  Future<void> setSystemUserName(String userName) async {
    await applicationPrefsDataService.setSystemUserName(userName);
  }

  @override
  Future<void> setDefaultSiteName(String siteName) async {
    await applicationPrefsDataService.setDefaultSiteName(siteName);
  }

  @override
  String getDefaultSiteName() {
    return applicationPrefsDataService.getDefaultSiteName();
  }

}