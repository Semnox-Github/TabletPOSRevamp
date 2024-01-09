import 'package:application_prefs_data/builder.dart';
import 'package:attendance_data/api_client/attendance_api_client.dart';
import 'package:attendance_data/attendance_data_bl.dart';
import 'package:attendance_data/attendance_data_interceptor.dart';
import 'package:attendance_data/attendance_data_service.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:network_module/builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AttendanceDataBuilder {
  static Future<AttendanceDataBLContract> build(ExecutionContextDTO executionContextDTO) async {
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final networkModuleBL = await NetworkModuleBuilder.build();

    final sharedPreferences = await SharedPreferences.getInstance();
    networkModuleBL.addInterceptor(AttendanceInterceptor(executionContextDTO.webApiToken ?? ''));

    final attendanceDataApiClient = AttendanceApiClient(networkModuleBL.getDioClient(), baseUrl: appPrefsBL.getServerUrl());
    final attendanceDataService = AttendanceDataService(attendanceDataApiClient, executionContextDTO, sharedPreferences);
    final attendanceDataBL = AttendanceDataBLImpl(attendanceDataService);
    return attendanceDataBL;
  }
}
