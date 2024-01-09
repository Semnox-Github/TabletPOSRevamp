import 'package:execution_context/models/execution_context_dto.dart';
import 'package:network_module/builder.dart';
import 'package:application_prefs_data/builder.dart';
import 'package:shift_tracking_data/api_client/shift_track_api_client.dart';
import 'package:shift_tracking_data/shift_track_data_bl.dart';
import 'package:shift_tracking_data/shift_track_data_interceptor.dart';
import 'package:shift_tracking_data/shift_track_data_service.dart';

class ShiftTrackDataBuilder {
  static Future<ShiftTrackDataBLContract> build(ExecutionContextDTO executionContextDTO) async {

    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final networkModuleBL = await NetworkModuleBuilder.build();

    networkModuleBL.addInterceptor(ShiftTrackDataInterceptor(executionContextDTO.webApiToken ?? ''));
    final shiftApiClient = ShiftTrackingApiClient(networkModuleBL.getDioClient(), baseUrl: appPrefsBL.getServerUrl());
    final shiftDataService = ShiftTrackDataService(shiftApiClient);
    final shiftDataBL = ShiftTrackDataBLImpl(shiftDataService);
    return shiftDataBL;
  }
}