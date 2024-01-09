
import 'package:application_prefs_data/builder.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:membership_data/api_client/membership_api_client.dart';
import 'package:membership_data/membership_data_bl.dart';
import 'package:membership_data/membership_data_interceptor.dart';
import 'package:membership_data/membership_data_service.dart';
import 'package:network_module/builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MembershipDataBuilder {
  static Future<MembershipDataBLContract> build(ExecutionContextDTO executionContextDTO) async {
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final networkModuleBL = await NetworkModuleBuilder.build();

    final sharedPreferences = await SharedPreferences.getInstance();
    networkModuleBL.addInterceptor(MembershipDataInterceptor(executionContextDTO.webApiToken ?? ''));
    final memberShipApiClient = MemberShipApiClient(networkModuleBL.getDioClient(), baseUrl: appPrefsBL.getServerUrl());
    final membershipDataService = MembershipDataService(memberShipApiClient, sharedPreferences, executionContextDTO);
    final membershipDataBL = MembershipDataBLImpl(membershipDataService);
    return membershipDataBL;
  }
}