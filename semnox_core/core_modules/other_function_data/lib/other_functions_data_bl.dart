import 'package:other_function_data/model/account_relation_ships/link_cards_request_model.dart';
import 'package:other_function_data/model/account_relation_ships/link_cards_response_model.dart';
import 'package:other_function_data/model/balance_transfer/transfer_balance_data.dart';
import 'package:other_function_data/model/card_details_response.dart/loyalty_attribute_container.dart';
import 'package:other_function_data/model/category_container/category_container_response.dart';
import 'package:other_function_data/model/consolidate_cards/consolidate_card_request_model.dart';
import 'package:other_function_data/model/consolidate_cards/consolidate_cards_response_model.dart';
import 'package:other_function_data/model/decativate_card/deactivate_request_model.dart';
import 'package:other_function_data/model/decativate_card/deactivate_response_model.dart';
import 'package:other_function_data/model/entitlement_model/entitlement_model.dart';
import 'package:other_function_data/model/entitlement_model/entitlement_response_model.dart';
import 'package:other_function_data/model/exchangeCreditForToken/credit_for_token_request.dart';
import 'package:other_function_data/model/exchangeCreditForToken/credit_for_token_response.dart';
import 'package:other_function_data/model/master_cards_model/free_play_request_model.dart';
import 'package:other_function_data/model/master_cards_model/master_card_response_model.dart';
import 'package:other_function_data/model/menu_panel/menu_panels_response.dart';
import 'package:other_function_data/model/pause_time/pause_time_response.dart';
import 'package:other_function_data/model/pause_time/request/pause_time_request.dart';
import 'package:other_function_data/model/pos_machines/pos_machine_reponse.dart';
import 'package:other_function_data/model/redeemEntitlements/redeem_request.dart';
import 'package:other_function_data/model/redeemEntitlements/redeem_response.dart';
import 'package:other_function_data/model/redeemLotaltyPoints/redeem_loyalty_points_request_body.dart';
import 'package:other_function_data/model/redemptionRuleModel/redemption_rule_model.dart';
import 'package:other_function_data/model/refund_card/refund_card_request_model.dart';
import 'package:other_function_data/model/refund_card/refund_card_response_model.dart';
import 'package:other_function_data/model/ticketModel/ticket_mode_request.dart';
import 'package:other_function_data/model/ticketModel/ticket_mode_response_model.dart';
import 'package:other_function_data/model/transfer_card/transfer_card_model.dart';
import 'package:other_function_data/model/transfer_card/transfer_crad_response.dart';
import 'package:other_function_data/other_functions_data_service.dart';

import 'model/exchange_entitlement/exchange_entitlement_data.dart';
import 'model/exchange_entitlement/exchange_entitlement_response.dart';
import 'model/load_bonus/load_bonus_data.dart';
import 'model/load_bonus/load_bonus_response.dart';
import 'model/menu/menu_data.dart';
import 'model/menu/menu_response.dart';
import 'model/menu_panel/menu_panels_data.dart';
import 'model/pos_machines/pos_machine_data.dart';
import 'model/redeemLotaltyPoints/redeem_loyalty_points_response_body.dart';

abstract class OtherFunctionDataBLContract {
  Future<LoyaltyAttributeContainer> getAttributes();

  Future<CreditForTokenResponse> creditForTokenPost(
      CreditForTokenRequest creditForTokenRequest);

  Future<RedeemResponse> redeemEntitlement(RedeemRequest redeemRequest);
  Future<TicketModeResponseModel> postTicketMode(
      TicketModeRequestModel ticketModeRequestModel);
  Future<LoyaltyPointsResponseModel> postRedeemPoints(
      LoyaltyPointsRequestModel loyaltyPointsRequestModel);
  Future<RedemptionRuleModel> getRedeemRule();
  Future<MenuPanelsResponse> getMenuPanelsData();
  Future<MenuPanelsResponse> updateMenuPanels(
      {required List<MenuPanelsDto> listOfMenuPanelsDto});
  Future<CategoryContainerResponse> getCategoryContainer();
  Future<MenuResponse> getMenuDataList();
  Future<POSMachineResponse> getPOSMachineList();
  Future<ExchangeEntitlementResponse> exchangeEntitlements(
      {required ExchangeEntitlementData exchangeEntitlementData});
  Future<LoadBonusResponse> loadBonus({required LoadBonusData loadBonusData});
  Future<bool> transferBalance({required List<TransferBalanceData> transferBalanceData});

  Future<EntitlementResponseModel> postEntitlement(
      String entitlementStatus, EntitlementModel entitlementModel);

  Future<TransferCardRsponseModel> postTransferCard(
      TransferCardRequestModel transferCardRequestModel);

  Future<LinkCardsReponseModel> postAccountRelations(
      List<LinkCardsRequestModel> linkCardsRequestModel);

  Future<MenuResponse> updateProductMenu(
      {required List<MenuDto> listOfMenuDto});

  Future<POSMachineResponse> updatePosMachine(
      {required List<PosMachineDate> posMachineList});

  Future<DeactivateCardRsponseModel> deactivateCard(
      {required DeactivateCardRequestModel deactivateCardRequestModel});

  Future<ConsolidateResponseModel> consolidateCards(
      {required List<ConsolidateRequestModel> consolidateRequestModel});

  Future<MasterCardResponseModel> updateEnterFreePlayMode(
      {required FreePlayModeRequestModel freePlayModeRequestModel});
  Future<MasterCardResponseModel> updateExitFreePlayMode(
      {required FreePlayModeRequestModel freePlayModeRequestModel});
  Future<MasterCardResponseModel> invalidateFreePlayCard(
      {required FreePlayModeRequestModel freePlayModeRequestModel});
  Future<RefundCardsResponsetModel> refundCards(
      {required RefundCardsRequestModel refundCardsRequestModel});
  Future<PauseTimeResponse> pauseTime({required PauseTimeRequest pauseTimeRequest});
}

class OtherFunctionDataBlImpl implements OtherFunctionDataBLContract {
  final OtherFunctionDataService _otherFunctionDataService;

  OtherFunctionDataBlImpl(this._otherFunctionDataService);

  @override
  Future<LoyaltyAttributeContainer> getAttributes() {
    return _otherFunctionDataService.getAttributeContainer();
  }

  @override
  Future<CreditForTokenResponse> creditForTokenPost(
      CreditForTokenRequest creditForTokenRequest) {
    return _otherFunctionDataService
        .creditForTokenResponse(creditForTokenRequest);
  }

  @override
  Future<RedeemResponse> redeemEntitlement(RedeemRequest redeemRequest) {
    return _otherFunctionDataService.redeemEntitlements(redeemRequest);
  }

  @override
  Future<TicketModeResponseModel> postTicketMode(
      TicketModeRequestModel ticketModeRequestModel) {
    return _otherFunctionDataService.postTicketMode(ticketModeRequestModel);
  }

  @override
  Future<bool> transferBalance({required List<TransferBalanceData> transferBalanceData}) {
    return _otherFunctionDataService.transferBalance(transferBalanceData: transferBalanceData);
  }

  @override
  Future<LoyaltyPointsResponseModel> postRedeemPoints(
      LoyaltyPointsRequestModel loyaltyPointsRequestModel) {
    return _otherFunctionDataService
        .postRedeemLoyaltyPoints(loyaltyPointsRequestModel);
  }

  @override
  Future<RedemptionRuleModel> getRedeemRule() {
    return _otherFunctionDataService.getRedemptionRule();
  }

  @override
  Future<MenuPanelsResponse> getMenuPanelsData() {
    return _otherFunctionDataService.getMenuPanelsData();
  }

  @override
  Future<EntitlementResponseModel> postEntitlement(
      String entitlementStatus, EntitlementModel entitlementModel) {
    return _otherFunctionDataService.postEntitlement(
        entitlementStatus, entitlementModel);
  }

  @override
  Future<MenuPanelsResponse> updateMenuPanels(
      {required List<MenuPanelsDto> listOfMenuPanelsDto}) {
    return _otherFunctionDataService.updateMenuPanels(
        listOfMenuPanelsDto: listOfMenuPanelsDto);
  }

  @override
  Future<CategoryContainerResponse> getCategoryContainer() {
    return _otherFunctionDataService.getCategoryContainer();
  }

  @override
  Future<TransferCardRsponseModel> postTransferCard(
      TransferCardRequestModel transferCardRequestModel) {
    return _otherFunctionDataService.postTransferCard(transferCardRequestModel);
  }

  @override
  Future<LinkCardsReponseModel> postAccountRelations(
      List<LinkCardsRequestModel> linkCardsRequestModel) {
    return _otherFunctionDataService
        .postAccountRelations(linkCardsRequestModel);
  }

  @override
  Future<MenuResponse> getMenuDataList() {
    return _otherFunctionDataService.getMenuDataList();
  }

  @override
  Future<POSMachineResponse> getPOSMachineList() {
    return _otherFunctionDataService.getPOSMachineList();
  }

  @override
  Future<ExchangeEntitlementResponse> exchangeEntitlements(
      {required ExchangeEntitlementData exchangeEntitlementData}) {
    return _otherFunctionDataService.exchangeEntitlementAPI(
        exchangeEntitlementData: exchangeEntitlementData);
  }

  @override
  Future<MenuResponse> updateProductMenu(
      {required List<MenuDto> listOfMenuDto}) {
    return _otherFunctionDataService.updateProductMenu(
        listOfMenuDto: listOfMenuDto);
  }

  @override
  Future<POSMachineResponse> updatePosMachine(
      {required List<PosMachineDate> posMachineList}) {
    return _otherFunctionDataService.updatePosMachine(
        posMachineList: posMachineList);
  }

  @override
  Future<LoadBonusResponse> loadBonus({required LoadBonusData loadBonusData}) {
    return _otherFunctionDataService.loadBonus(loadBonusData: loadBonusData);
  }

  @override
  Future<DeactivateCardRsponseModel> deactivateCard(
      {required DeactivateCardRequestModel deactivateCardRequestModel}) {
    return _otherFunctionDataService.deactivateCardResponse(
        deactivateCardRequestModel: deactivateCardRequestModel);
  }

  @override
  Future<ConsolidateResponseModel> consolidateCards(
      {required List<ConsolidateRequestModel> consolidateRequestModel}) {
    return _otherFunctionDataService.consolidateCards(
        consolidateRequestModel: consolidateRequestModel);
  }

  @override
  Future<MasterCardResponseModel> updateEnterFreePlayMode(
      {required FreePlayModeRequestModel freePlayModeRequestModel}) {
    return _otherFunctionDataService.updateEnterFreePlayMode(
        freePlayModeRequestModel: freePlayModeRequestModel);
  }

  @override
  Future<MasterCardResponseModel> updateExitFreePlayMode(
      {required FreePlayModeRequestModel freePlayModeRequestModel}) {
    return _otherFunctionDataService.updateExitFreePlayMode(
        freePlayModeRequestModel: freePlayModeRequestModel);
  }

  @override
  Future<MasterCardResponseModel> invalidateFreePlayCard(
      {required FreePlayModeRequestModel freePlayModeRequestModel}) {
    return _otherFunctionDataService.invalidateFreePlayCard(
        freePlayModeRequestModel: freePlayModeRequestModel);
  }

  @override
  Future<RefundCardsResponsetModel> refundCards(
      {required RefundCardsRequestModel refundCardsRequestModel}) {
    return _otherFunctionDataService.refundCards(
        refundCardsRequestModel: refundCardsRequestModel);
  }

  @override
  Future<PauseTimeResponse> pauseTime({required PauseTimeRequest pauseTimeRequest}) {
    return _otherFunctionDataService.pauseTime(pauseTimeRequest: pauseTimeRequest);
  }
}
