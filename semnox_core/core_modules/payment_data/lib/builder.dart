
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:network_module/builder.dart';
import 'package:application_prefs_data/builder.dart';
import 'package:payment_data/api_client/payment_api_client.dart';
import 'package:payment_data/payment_data_bl.dart';
import 'package:payment_data/payment_data_interceptor.dart';
import 'package:payment_data/payment_data_service.dart';

class PaymentDataBuilder {
  static Future<PaymentDataBLContract> build(ExecutionContextDTO executionContextDTO) async {

    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final networkModuleBL = await NetworkModuleBuilder.build();

    networkModuleBL.addInterceptor(PaymentDataInterceptor(executionContextDTO.webApiToken ?? ''));
    final paymentApiClient = PaymentApiClient(networkModuleBL.getDioClient(), baseUrl: appPrefsBL.getServerUrl());
    final paymentDataService = PaymentDataService(paymentApiClient);
    final paymentDataBL = PaymentDataBLImpl(paymentDataService);
    return paymentDataBL;
  }
}