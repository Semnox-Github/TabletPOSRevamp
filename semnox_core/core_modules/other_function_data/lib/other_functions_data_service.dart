import 'dart:convert';
import 'dart:ffi';

import 'package:application_prefs_data/application_prefs_data_bl.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:flutter/services.dart';
import 'package:other_function_data/api_client/other_function_api_client.dart';
import 'package:other_function_data/model/account_relation_ships/link_cards_request_model.dart';
import 'package:other_function_data/model/account_relation_ships/link_cards_response_model.dart';
import 'package:other_function_data/model/balance_transfer/balance_transfer_response.dart';
import 'package:other_function_data/model/balance_transfer/transfer_balance_data.dart';
import 'package:other_function_data/model/balance_transfer/transfer_balance_response.dart';
import 'package:other_function_data/model/card_details_response.dart/loyalty_attribute_container.dart';
import 'package:other_function_data/model/consolidate_cards/consolidate_card_request_model.dart';
import 'package:other_function_data/model/consolidate_cards/consolidate_cards_response_model.dart';
import 'package:other_function_data/model/decativate_card/deactivate_request_model.dart';
import 'package:other_function_data/model/decativate_card/deactivate_response_model.dart';
import 'package:other_function_data/model/entitlement_model/entitlement_model.dart';
import 'package:other_function_data/model/entitlement_model/entitlement_response_model.dart';
import 'package:other_function_data/model/exchangeCreditForToken/credit_for_token_request.dart';
import 'package:other_function_data/model/exchangeCreditForToken/credit_for_token_response.dart';
import 'package:other_function_data/model/exchange_entitlement/exchange_entitlement_data.dart';
import 'package:other_function_data/model/load_bonus/load_bonus_data.dart';
import 'package:other_function_data/model/load_bonus/load_bonus_response.dart';
import 'package:other_function_data/model/master_cards_model/free_play_request_model.dart';
import 'package:other_function_data/model/master_cards_model/master_card_response_model.dart';
import 'package:other_function_data/model/menu/menu_data.dart';
import 'package:other_function_data/model/menu/menu_response.dart';
import 'package:other_function_data/model/menu_panel/menu_panels_response.dart';
import 'package:other_function_data/model/pause_time/pause_time_response.dart';
import 'package:other_function_data/model/pause_time/request/pause_time_request.dart';
import 'package:other_function_data/model/redeemEntitlements/redeem_request.dart';
import 'package:other_function_data/model/redeemEntitlements/redeem_response.dart';
import 'package:other_function_data/model/redeemLotaltyPoints/redeem_loyalty_points_request_body.dart';
import 'package:other_function_data/model/redeemLotaltyPoints/redeem_loyalty_points_response_body.dart';
import 'package:other_function_data/model/redemptionRuleModel/redemption_rule_model.dart';
import 'package:other_function_data/model/refund_card/refund_card_request_model.dart';
import 'package:other_function_data/model/refund_card/refund_card_response_model.dart';
import 'package:other_function_data/model/ticketModel/ticket_mode_request.dart';
import 'package:other_function_data/model/ticketModel/ticket_mode_response_model.dart';
import 'package:other_function_data/model/transfer_card/transfer_card_model.dart';
import 'package:other_function_data/model/transfer_card/transfer_crad_response.dart';

import 'model/balance_transfer/blanance_transfer_data.dart';
import 'model/balance_transfer/transfer_details_dto.dart';
import 'model/category_container/category_container_response.dart';
import 'model/exchange_entitlement/exchange_entitlement_response.dart';
import 'model/menu_panel/menu_panels_data.dart';
import 'model/pos_machines/pos_machine_data.dart';
import 'model/pos_machines/pos_machine_reponse.dart';

class OtherFunctionDataService {
  late OtherFunctionApiClient _otherFunctionApiClient;
  late ExecutionContextDTO _executionContextDTO;
  late ApplicationPrefsDataBLContract _appPrefsBL;
  static final OtherFunctionDataService _instance =
      OtherFunctionDataService._internal();
  OtherFunctionDataService._internal();

  factory OtherFunctionDataService(
      OtherFunctionApiClient apiClient,
      ExecutionContextDTO executionContextDTO,
      ApplicationPrefsDataBLContract appPrefsBL) {
    _instance._otherFunctionApiClient = apiClient;
    _instance._executionContextDTO = executionContextDTO;
    _instance._appPrefsBL = appPrefsBL;
    return _instance;
  }

  BalanceTransferResponse? _balanceTransferResponse;
  MenuPanelsResponse? _menuPanelsResponse;
  CategoryContainerResponse? _categoryContainerResponse;
  MenuResponse? _menuResponse;
  final Map<String, Uint8List> _cachedImage = {};
  ExchangeEntitlementResponse? _exchangeEntitlementResponse;
  LoadBonusResponse? _loadBonusResponse;

  POSMachineResponse? _posMachineResponse;

  Future<LoyaltyAttributeContainer> getAttributeContainer() async {
    try {
      var response = await _otherFunctionApiClient.getAttributes();
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<CreditForTokenResponse> creditForTokenResponse(
      CreditForTokenRequest creditForTokenRequest) async {
    try {
      var response = await _otherFunctionApiClient
          .postCreditForToken(creditForTokenRequest);
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<RedeemResponse> redeemEntitlements(RedeemRequest redeemRequest) async {
    try {
      var response =
          await _otherFunctionApiClient.postRedeemEntitlements(redeemRequest);
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<TicketModeResponseModel> postTicketMode(
      TicketModeRequestModel ticketModeRequestModel) async {
    try {
      var response =
          await _otherFunctionApiClient.postTicketMode(ticketModeRequestModel);
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<LoyaltyPointsResponseModel> postRedeemLoyaltyPoints(
      LoyaltyPointsRequestModel loyaltyPointsRequestModel) async {
    try {
      var response = await _otherFunctionApiClient
          .postRedeemLoyalty(loyaltyPointsRequestModel);
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<RedemptionRuleModel> getRedemptionRule() async {
    try {
      var response = await _otherFunctionApiClient.getRedemptionRule();
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<bool> transferBalance({required List<TransferBalanceData> transferBalanceData}) async {
    try {
       TransferBalanceResponse transferBalanceResponse = await _otherFunctionApiClient.postBalanceTransfer(transferBalanceData);
       return transferBalanceResponse.data != null;
    } on DioError {
      rethrow;
    }
  }

  Future<MenuPanelsResponse> getMenuPanelsData() async {
    try {
      _menuPanelsResponse =
          await _otherFunctionApiClient.getMenuPanelsResponse({
        'siteId': _executionContextDTO.siteId ?? 0,
      });
      return _menuPanelsResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<void> clear() async {
    _menuPanelsResponse = null;
    _balanceTransferResponse = null;
  }

  Future<EntitlementResponseModel> postEntitlement(
      String entitlementStatus, EntitlementModel entitlementModel) async {
    try {
      var response = await _otherFunctionApiClient.postEntitlement(
          entitlementStatus, entitlementModel);
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<MenuPanelsResponse> updateMenuPanels(
      {required List<MenuPanelsDto> listOfMenuPanelsDto}) async {
    try {
      _menuPanelsResponse =
          await _otherFunctionApiClient.updateMenuPanels(listOfMenuPanelsDto);
      return _menuPanelsResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<CategoryContainerResponse> getCategoryContainer() async {
    try {
      _categoryContainerResponse =
          await _otherFunctionApiClient.getCategoryContainer({
        'siteId': _executionContextDTO.siteId ?? 0,
      });
      return _categoryContainerResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<TransferCardRsponseModel> postTransferCard(
      TransferCardRequestModel transferCardRequestModel) async {
    try {
      var response = await _otherFunctionApiClient
          .postTransferCard(transferCardRequestModel);
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<LinkCardsReponseModel> postAccountRelations(
      List<LinkCardsRequestModel> linkCardsRequestModel) async {
    try {
      var response = await _otherFunctionApiClient
          .postAccountRelations(linkCardsRequestModel);
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<MenuResponse> getMenuDataList() async {
    try {
      _menuResponse = await _otherFunctionApiClient.getMenuDataList({
        'siteId': _executionContextDTO.siteId ?? 0,
        'loadChildRecords': true,
        'loadActiveChildRecords': true
      });
      return _menuResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<POSMachineResponse> getPOSMachineList() async {
    try {
      _posMachineResponse = await _otherFunctionApiClient.getPosMachineList({
        'siteId': _executionContextDTO.siteId ?? 0,
        'buildChildRecords': true,
        'loadActiveChildRecords': true,
        'isActive': true
      });
      return _posMachineResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<ExchangeEntitlementResponse> exchangeEntitlementAPI(
      {required ExchangeEntitlementData exchangeEntitlementData}) async {
    try {
      _exchangeEntitlementResponse =
          await _otherFunctionApiClient.exchangeEntitlementsApi(exchangeEntitlementData);
      return _exchangeEntitlementResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<MenuResponse> updateProductMenu(
      {required List<MenuDto> listOfMenuDto}) async {
    try {
      _menuResponse =
          await _otherFunctionApiClient.updateMenuApi(listOfMenuDto);
      return _menuResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<POSMachineResponse> updatePosMachine(
      {required List<PosMachineDate> posMachineList}) async {
    try {
      _posMachineResponse = await _otherFunctionApiClient
          .updatePOSMachine({"isLicensedPOSMachines": true}, posMachineList);
      return _posMachineResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<LoadBonusResponse> loadBonus(
      {required LoadBonusData loadBonusData}) async {
    try {
      _loadBonusResponse = await _otherFunctionApiClient.loadBonusApi(loadBonusData);
      return _loadBonusResponse!;
    } on DioError {
      rethrow;
    }
  }

  Future<DeactivateCardRsponseModel> deactivateCardResponse(
      {required DeactivateCardRequestModel deactivateCardRequestModel}) async {
    try {
      var response = await _otherFunctionApiClient
          .deactivateCards(deactivateCardRequestModel);
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<ConsolidateResponseModel> consolidateCards(
      {required List<ConsolidateRequestModel> consolidateRequestModel}) async {
    try {
      var response = await _otherFunctionApiClient
          .postConsolidate(consolidateRequestModel);
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<MasterCardResponseModel> updateEnterFreePlayMode(
      {required FreePlayModeRequestModel freePlayModeRequestModel}) async {
    try {
      var response = await _otherFunctionApiClient
          .updateEnterFreePlayMode(freePlayModeRequestModel);
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<MasterCardResponseModel> updateExitFreePlayMode(
      {required FreePlayModeRequestModel freePlayModeRequestModel}) async {
    try {
      var response = await _otherFunctionApiClient
          .updateExitFreeFreePlayMode(freePlayModeRequestModel);
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<MasterCardResponseModel> invalidateFreePlayCard(
      {required FreePlayModeRequestModel freePlayModeRequestModel}) async {
    try {
      var response = await _otherFunctionApiClient
          .invalidateFreePlayCard(freePlayModeRequestModel);
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<RefundCardsResponsetModel> refundCards(
      {required RefundCardsRequestModel refundCardsRequestModel}) async {
    try {
      var response =
          await _otherFunctionApiClient.refundCard(refundCardsRequestModel);
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<PauseTimeResponse> pauseTime({required PauseTimeRequest pauseTimeRequest}) async {
    try {
      var response =
          await _otherFunctionApiClient.pauseTime(pauseTimeRequest);
      return response;
    } on DioError {
      rethrow;
    }
  }
}
