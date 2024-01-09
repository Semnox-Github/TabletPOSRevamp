import 'package:dio/dio.dart';
import 'package:other_function_data/model/account_relation_ships/link_cards_request_model.dart';
import 'package:other_function_data/model/account_relation_ships/link_cards_response_model.dart';
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
import 'package:other_function_data/model/master_cards_model/free_play_request_model.dart';
import 'package:other_function_data/model/master_cards_model/master_card_response_model.dart';
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
import 'package:retrofit/http.dart';

import '../model/balance_transfer/transfer_balance_data.dart';
import '../model/category_container/category_container_response.dart';
import '../model/exchange_entitlement/exchange_entitlement_response.dart';
import '../model/load_bonus/load_bonus_response.dart';
import '../model/menu/menu_data.dart';
import '../model/menu/menu_response.dart';
import '../model/menu_panel/menu_panels_data.dart';
import '../model/pos_machines/pos_machine_data.dart';
import '../model/pos_machines/pos_machine_reponse.dart';

part 'other_function_api_client.g.dart';

@RestApi()
abstract class OtherFunctionApiClient {
  factory OtherFunctionApiClient(Dio dio, {String baseUrl}) =
      _OtherFunctionApiClient;

  static const _exchangeCreditForToken = 'api/Task/ExchangeTokens';
  static const _redeemEntitlements = 'api/Task/RedeemEntitlements';
  static const _ticketMode = 'api/Task/TicketMode';
  //static const _balanceTransferEndPont = 'api/Task/BalanceTransfer';
  static const _transferBalanceEndPoint =  '/api/Customer/Account/AccountTask/TransferAccountBalance';
  static const _redeemLoyaltyPoints = '/api/Transaction/LoyaltyRedemption';
  static const _loyaltyPointsSetUp =
      'api/Promotion/LoyaltyRedemptionRulesContainer';
  static const _menuPanelsDataEndPoint = 'api/Product/MenuPanels';
  static const _entitlementsEndPoint =
      'api/Customer/Account/AccountTask/{entitlementStatus}';
  static const _categoryContainerEndPoint = 'api/Inventory/CategoryContainer';
  static const _transferCard =
      'api/Customer/Account/AccountTask/AccountTransfer';
  static const _linkCards = 'api/Customer/Account/AccountRelationships';
  static const _loyaltyAttribute = "api/Promotion/LoyaltyAttributesContainer";
  static const _menuListEndPoint = "api/Product/Menus";
  static const _posMachineListEndPoint = '/api/POS/POSMachines';
  static const _exchangeEntitlementsEndPoint = 'api/Task/ExchangeEntitlements';
  static const _loadBonusEndPoint = 'api/Task/LoadBonus';
  static const _deactivateCards =
      'api/Customer/Account/AccountTask/DeactivateCard';
  static const _consolidateCards =
      'api/Customer/Account/AccountTask/ConsolidateCard';
  static const enterFreePlayMode =
      'api/Task/MasterCard/UpdateEnterFreePlayMode';
  static const exitFreePlayMode = 'api/Task/MasterCard/UpdateExitFreePlayMode';
  static const invalidateCardCalls =
      'api/Task/MasterCard/InvalidateFreePlayCard';
  static const _refundCard = 'api/Transaction/Task/RefundCard';
  static const _timeStatus = 'api/Task/Time/Status';

  // @GET(_accountsEndPoint)
  // Future<AccountDetailsResponse> getCustomerAccounts(
  //     @Queries() Map<String, dynamic> queries);

  @POST(_exchangeCreditForToken)
  Future<CreditForTokenResponse> postCreditForToken(
      @Body() CreditForTokenRequest creditForTokenRequest);

  @POST(_redeemEntitlements)
  Future<RedeemResponse> postRedeemEntitlements(
      @Body() RedeemRequest redeemRequest);

  @POST(_ticketMode)
  Future<TicketModeResponseModel> postTicketMode(
      @Body() TicketModeRequestModel ticketModeRequestModel);

  @POST(_transferBalanceEndPoint)
  Future<TransferBalanceResponse> postBalanceTransfer(
      @Body() List<TransferBalanceData> transferBalanceData);


  @POST(_redeemLoyaltyPoints)
  Future<LoyaltyPointsResponseModel> postRedeemLoyalty(
      @Body() LoyaltyPointsRequestModel loyaltyPointsRequestModel);

  @GET(_loyaltyPointsSetUp)
  Future<RedemptionRuleModel> getRedemptionRule();

  @GET(_menuPanelsDataEndPoint)
  Future<MenuPanelsResponse> getMenuPanelsResponse(
      @Queries() Map<String, dynamic> queries);

  @POST(_entitlementsEndPoint)
  Future<EntitlementResponseModel> postEntitlement(
      @Path() String entitlementStatus,
      @Body() EntitlementModel entitlementModel);

  @POST(_menuPanelsDataEndPoint)
  Future<MenuPanelsResponse> updateMenuPanels(
      @Body() List<MenuPanelsDto> listOfMenuPanelsDtos);

  @GET(_categoryContainerEndPoint)
  Future<CategoryContainerResponse> getCategoryContainer(
      @Queries() Map<String, dynamic> queries);

  @POST(_transferCard)
  Future<TransferCardRsponseModel> postTransferCard(
      @Body() TransferCardRequestModel transferCardRequestModel);

  @POST(_linkCards)
  Future<LinkCardsReponseModel> postAccountRelations(
      @Body() List<LinkCardsRequestModel> linkCardsRequestModel);

  @GET(_loyaltyAttribute)
  Future<LoyaltyAttributeContainer> getAttributes();

  @GET(_menuListEndPoint)
  Future<MenuResponse> getMenuDataList(@Queries() Map<String, dynamic> queries);

  @GET(_posMachineListEndPoint)
  Future<POSMachineResponse> getPosMachineList(
      @Queries() Map<String, dynamic> queries);

  @POST(_exchangeEntitlementsEndPoint)
  Future<ExchangeEntitlementResponse> exchangeEntitlementsApi(
      @Body() ExchangeEntitlementData exchangeEntitlementData);

  @POST(_menuListEndPoint)
  Future<MenuResponse> updateMenuApi(@Body() List<MenuDto> menuDtoList);

  @POST(_posMachineListEndPoint)
  Future<POSMachineResponse> updatePOSMachine(
      @Queries() Map<String, dynamic> queries,
      @Body() List<PosMachineDate> posMachineList);

  @POST(_loadBonusEndPoint)
  Future<LoadBonusResponse> loadBonusApi(@Body() LoadBonusData loadBonusData);

  @POST(_deactivateCards)
  Future<DeactivateCardRsponseModel> deactivateCards(
      @Body() DeactivateCardRequestModel deactivateCardRequestModel);

  @POST(_consolidateCards)
  Future<ConsolidateResponseModel> postConsolidate(
      @Body() List<ConsolidateRequestModel> consolidateRequestModel);

  @PUT(enterFreePlayMode)
  Future<MasterCardResponseModel> updateEnterFreePlayMode(
      @Body() FreePlayModeRequestModel freePlayModeRequestModel);

  @PUT(exitFreePlayMode)
  Future<MasterCardResponseModel> updateExitFreeFreePlayMode(
      @Body() FreePlayModeRequestModel freePlayModeRequestModel);

  @PUT(invalidateCardCalls)
  Future<MasterCardResponseModel> invalidateFreePlayCard(
      @Body() FreePlayModeRequestModel freePlayModeRequestModel);

  @POST(_refundCard)
  Future<RefundCardsResponsetModel> refundCard(
      @Body() RefundCardsRequestModel freePlayModeRequestModel);

  @POST(_timeStatus)
  Future<PauseTimeResponse> pauseTime(@Body() PauseTimeRequest pauseTimeRequest);
}
