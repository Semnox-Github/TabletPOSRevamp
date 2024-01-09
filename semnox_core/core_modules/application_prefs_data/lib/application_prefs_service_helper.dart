import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

const MACHINE_NAME_KEY = "MACHINE_NAME_KEY";
const SERVER_URL_KEY = "SERVER_URL_KEY";
const SITE_ID_KEY = "SITE_ID_KEY";
const SITE_NAME_KEY = "SITE_NAME_KEY";
const SYSTEM_USER_NAME = "SYSTEM_USER_NAME";
const SYSTEM_PASSWORD = "SYSTEM_PASSWORD";

class ApplicationPrefsServiceHelper {

  final SharedPreferences preferences;

  ApplicationPrefsServiceHelper(this.preferences);

  Future<void> setMachineName(String machineName) async {
    await preferences.setString(MACHINE_NAME_KEY, machineName);
  }

  String? getMachineName() {
    return preferences.getString(MACHINE_NAME_KEY);
  }

  Future<void> setServerUrl(String url) async {
    await preferences.setString(SERVER_URL_KEY, url);
  }

  String? getServerUrl() {
    return preferences.getString(SERVER_URL_KEY);
  }

  Future<void> setDefaultSiteId(int siteId) async {
    await preferences.setInt(SITE_ID_KEY, siteId);
  }

  int getDefaultSiteId() {
    return preferences.getInt(SITE_ID_KEY) ?? -1;
  }

  Future<void> setDefaultSiteName(String siteName) async {
    await preferences.setString(SITE_NAME_KEY, siteName);
  }

  String getDefaultSiteName() {
    return preferences.getString(SITE_NAME_KEY) ?? '';
  }

  Future<void> setSystemUserName(String userName) async {
    await preferences.setString(SYSTEM_USER_NAME, userName);
  }

  String? getSystemUserName() {
    return preferences.getString(SYSTEM_USER_NAME);
  }

  Future<void> setSystemPassword(String password) async {
    await preferences.setString(SYSTEM_PASSWORD, password);
  }

  String? getSystemPassword() {
    return preferences.getString(SYSTEM_PASSWORD);
  }

}