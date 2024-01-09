// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_function_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _OtherFunctionApiClient implements OtherFunctionApiClient {
  _OtherFunctionApiClient(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CreditForTokenResponse> postCreditForToken(
      creditForTokenRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(creditForTokenRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CreditForTokenResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Task/ExchangeTokens',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CreditForTokenResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RedeemResponse> postRedeemEntitlements(redeemRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(redeemRequest.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RedeemResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Task/RedeemEntitlements',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RedeemResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TicketModeResponseModel> postTicketMode(ticketModeRequestModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(ticketModeRequestModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TicketModeResponseModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Task/TicketMode',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TicketModeResponseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransferBalanceResponse> postBalanceTransfer(
      transferBalanceData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = transferBalanceData.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransferBalanceResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Customer/Account/AccountTask/TransferAccountBalance',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransferBalanceResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoyaltyPointsResponseModel> postRedeemLoyalty(
      loyaltyPointsRequestModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(loyaltyPointsRequestModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoyaltyPointsResponseModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Transaction/LoyaltyRedemption',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoyaltyPointsResponseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RedemptionRuleModel> getRedemptionRule() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RedemptionRuleModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Promotion/LoyaltyRedemptionRulesContainer',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RedemptionRuleModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MenuPanelsResponse> getMenuPanelsResponse(queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MenuPanelsResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Product/MenuPanels',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MenuPanelsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<EntitlementResponseModel> postEntitlement(
    entitlementStatus,
    entitlementModel,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(entitlementModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EntitlementResponseModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Customer/Account/AccountTask/${entitlementStatus}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EntitlementResponseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MenuPanelsResponse> updateMenuPanels(listOfMenuPanelsDtos) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = listOfMenuPanelsDtos.map((e) => e.toJson()).toList();
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MenuPanelsResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Product/MenuPanels',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MenuPanelsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CategoryContainerResponse> getCategoryContainer(queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CategoryContainerResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Inventory/CategoryContainer',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CategoryContainerResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransferCardRsponseModel> postTransferCard(
      transferCardRequestModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(transferCardRequestModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransferCardRsponseModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Customer/Account/AccountTask/AccountTransfer',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransferCardRsponseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LinkCardsReponseModel> postAccountRelations(
      linkCardsRequestModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = linkCardsRequestModel.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LinkCardsReponseModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Customer/Account/AccountRelationships',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LinkCardsReponseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoyaltyAttributeContainer> getAttributes() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoyaltyAttributeContainer>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Promotion/LoyaltyAttributesContainer',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoyaltyAttributeContainer.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MenuResponse> getMenuDataList(queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MenuResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Product/Menus',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MenuResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<POSMachineResponse> getPosMachineList(queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<POSMachineResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/POS/POSMachines',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = POSMachineResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ExchangeEntitlementResponse> exchangeEntitlementsApi(
      exchangeEntitlementData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(exchangeEntitlementData.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ExchangeEntitlementResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Task/ExchangeEntitlements',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ExchangeEntitlementResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MenuResponse> updateMenuApi(menuDtoList) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = menuDtoList.map((e) => e.toJson()).toList();
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MenuResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Product/Menus',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MenuResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<POSMachineResponse> updatePOSMachine(
    queries,
    posMachineList,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _headers = <String, dynamic>{};
    final _data = posMachineList.map((e) => e.toJson()).toList();
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<POSMachineResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/POS/POSMachines',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = POSMachineResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoadBonusResponse> loadBonusApi(loadBonusData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(loadBonusData.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoadBonusResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Task/LoadBonus',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoadBonusResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DeactivateCardRsponseModel> deactivateCards(
      deactivateCardRequestModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(deactivateCardRequestModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DeactivateCardRsponseModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Customer/Account/AccountTask/DeactivateCard',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DeactivateCardRsponseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ConsolidateResponseModel> postConsolidate(
      consolidateRequestModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = consolidateRequestModel.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ConsolidateResponseModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Customer/Account/AccountTask/ConsolidateCard',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ConsolidateResponseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MasterCardResponseModel> updateEnterFreePlayMode(
      freePlayModeRequestModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(freePlayModeRequestModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MasterCardResponseModel>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Task/MasterCard/UpdateEnterFreePlayMode',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MasterCardResponseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MasterCardResponseModel> updateExitFreeFreePlayMode(
      freePlayModeRequestModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(freePlayModeRequestModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MasterCardResponseModel>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Task/MasterCard/UpdateExitFreePlayMode',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MasterCardResponseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MasterCardResponseModel> invalidateFreePlayCard(
      freePlayModeRequestModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(freePlayModeRequestModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MasterCardResponseModel>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Task/MasterCard/InvalidateFreePlayCard',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MasterCardResponseModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RefundCardsResponsetModel> refundCard(freePlayModeRequestModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(freePlayModeRequestModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RefundCardsResponsetModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Task/RefundCard',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RefundCardsResponsetModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PauseTimeResponse> pauseTime(pauseTimeRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(pauseTimeRequest.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<PauseTimeResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Task/Time/Status',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PauseTimeResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
