import 'package:application_prefs_data/application_prefs_service_helper.dart';

class ApplicationPrefsDataService {

  late ApplicationPrefsServiceHelper applicationPrefsServiceHelper;

  static final ApplicationPrefsDataService _instance = ApplicationPrefsDataService._internal();
  ApplicationPrefsDataService._internal();

  factory ApplicationPrefsDataService(ApplicationPrefsServiceHelper serviceHelper) {
    _instance.applicationPrefsServiceHelper = serviceHelper;
    return _instance;
  }

  String? getMachineName() {
    var machineName = applicationPrefsServiceHelper.getMachineName();
    return machineName;
  }

  Future<void> setMachineName(String machineName) async {
    await applicationPrefsServiceHelper.setMachineName(machineName);
  }

  Future<void> setServerUrl(String url) async {
    await applicationPrefsServiceHelper.setServerUrl(url);
  }

  String? getServerUrl() {
    return applicationPrefsServiceHelper.getServerUrl();
  }

  Future<void> setDefaultSiteId(int siteId) async {
    await applicationPrefsServiceHelper.setDefaultSiteId(siteId);
  }

  int getDefaultSiteId() {
    return applicationPrefsServiceHelper.getDefaultSiteId();
  }

  Future<void> setDefaultSiteName(String siteName) async {
    await applicationPrefsServiceHelper.setDefaultSiteName(siteName);
  }

  String getDefaultSiteName() {
    return applicationPrefsServiceHelper.getDefaultSiteName();
  }

  Future<void> setSystemUserName(String userName) async {
    await applicationPrefsServiceHelper.setSystemUserName(userName);
  }

  String? getSystemUserName() {
    return applicationPrefsServiceHelper.getSystemUserName();
  }

  Future<void> setSystemPassword(String password) async {
    await applicationPrefsServiceHelper.setSystemPassword(password);
  }

  String? getSystemPassword() {
    return applicationPrefsServiceHelper.getSystemPassword();
  }

}
