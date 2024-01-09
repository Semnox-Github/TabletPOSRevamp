
import 'package:application_prefs_data/application_prefs_data_bl.dart';
import 'package:application_prefs_data/application_prefs_service_helper.dart';
import 'package:application_prefs_data/application_prefs_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplicationPrefsBuilder {

  static Future<ApplicationPrefsDataBLContract> build() async {
    final preferences = await SharedPreferences.getInstance();
    final applicationPrefsServiceHelper = ApplicationPrefsServiceHelper(preferences);
    final applicationPrefsDataService = ApplicationPrefsDataService(applicationPrefsServiceHelper);
    final applicationPrefsDataBL = ApplicationPrefsDataBLImpl(applicationPrefsDataService);

    return applicationPrefsDataBL;
  }
}