// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _TransactionApiClient implements TransactionApiClient {
  _TransactionApiClient(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<TransactionProfileResponse> getTransactionProfiles(queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionProfileResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/TransactionProfilesContainer',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionProfileResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<OrderResponse> createOrder(orderRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(orderRequest.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<OrderResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Order',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OrderResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> createTransaction(
    orderId,
    transactionRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(transactionRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/V2/Order/${orderId}/Transaction',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> createTransactionRemark(
    transactionId,
    remarks,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = remarks;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transaction/${transactionId}/Remarks',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> addProductToLine(
    transactionId,
    addLineRequests,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = addLineRequests.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transactions/${transactionId}/TransactionLines',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> addModifierProductsToTransaction(
    transactionId,
    addModifierProductRequests,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = addModifierProductRequests.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transactions/${transactionId}/TransactionLines',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> removeProductFromLine(
    transactionId,
    removeLineRequests,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = removeLineRequests.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transactions/${transactionId}/TransactionLines',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> createTransactionRemarkLine(
    transactionId,
    transactionRemarkLineRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = transactionRemarkLineRequest.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transactions/${transactionId}/LineRemarks',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> updateProductToLineClient(
    transactionId,
    transactionLines,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = transactionLines.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transactions/${transactionId}/TransactionLines',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> updateTransactionIdentifiersClient(
    transactionId,
    transactionRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(transactionRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transaction/${transactionId}/TransactionIdentifier',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> applyProfileToTransactionLines(
    transactionId,
    request,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transactions/${transactionId}/LinesProfile',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> updateTransactionLineCourseClient(
    transactionId,
    lineCourseRequests,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = lineCourseRequests.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transactions/${transactionId}/LinesCourse',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> linkCustomerToTransaction(
    transactionId,
    customerId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = customerId;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transaction/${transactionId}/Customer',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> deLinkCustomerFromTransaction(
      transactionId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transaction/${transactionId}/Customer',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserRoleContainerResponse> getUsersRoleContainer(queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserRoleContainerResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/HR/UserRoleContainer',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserRoleContainerResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> changeTransactionStaff(
    transactionId,
    setStaffRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(setStaffRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transaction/${transactionId}/TransactionStaff',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserContainerResponse> getUserContainerList(queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserContainerResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/HR/UserContainer',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserContainerResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> clearTransaction(transactionId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transaction/${transactionId}/Clear',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> saveTransaction(transactionId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transaction/${transactionId}/Save',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> saveAndHoldTransaction(transactionId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transaction/${transactionId}/SaveAndHold',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DiscountContainerResponse> getDiscountsContainer(queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DiscountContainerResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Discount/DiscountContainer',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DiscountContainerResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> setProfileIdForTransaction(
    transactionId,
    setTransactionProfileIdRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(setTransactionProfileIdRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/V2/Transaction/Transaction/${transactionId}/TransactionProfile',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionFunctionResponse> getTransactionFunctions(queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionFunctionResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/TaskTypesContainer',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionFunctionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> completeTransaction(
    orderId,
    closeTransactionRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(closeTransactionRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Order/${orderId}/CompleteTransaction',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> cancelTransaction(
    orderId,
    closeTransactionRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(closeTransactionRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Order/${orderId}/CancelTransaction',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> addDiscountForTransaction(
    transactionId,
    addTransactionDiscountRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(addTransactionDiscountRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transactions/${transactionId}/Discount',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> addDiscountForTransactionLine(
    transactionId,
    addTransactionLineDiscountRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(addTransactionLineDiscountRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transactions/${transactionId}/LinesDiscount',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> removeDiscountForTransaction(
    transactionId,
    addTransactionDiscountRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(addTransactionDiscountRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transactions/${transactionId}/Discount',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> removeDiscountForTransactionLine(
    transactionId,
    addTransactionLineDiscountRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(addTransactionLineDiscountRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transactions/${transactionId}/LinesDiscount',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> makeTransactionNonChargableClient(
    transactionId,
    transactionNonChargableRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(transactionNonChargableRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transaction/${transactionId}/NonChargeable',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> updateSeatForTransactionLine(
    transactionId,
    updateTransactionLineSeatRequests,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data =
        updateTransactionLineSeatRequests.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transactions/${transactionId}/LinesSeat',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> orderTransactionLines(
    transactionId,
    orderTransactionLineRequests,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = orderTransactionLineRequests.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transaction/${transactionId}/OrderTransactionLine',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DiscountCouponSummaryResponse> getDiscountsCouponSummary(
      queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DiscountCouponSummaryResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Discount/DiscountCouponSummary',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DiscountCouponSummaryResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionPrintReceiptResponse> getTransactionReceipt(
    transactionId,
    queries,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionPrintReceiptResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transactions/${transactionId}/Receipt',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionPrintReceiptResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> overrideTransactionLinePrice(
    transactionId,
    overridePriceRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(overridePriceRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transactions/${transactionId}/LinesPrice',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetClockedInUsersResponse> getAllClockedInUsers() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetClockedInUsersResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/HR/User/GetAllClockedInUsers',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetClockedInUsersResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetTransactionLogsResponse> getTransactionLogs(transactionId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetTransactionLogsResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transactions/${transactionId}/Logs',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetTransactionLogsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> makeTransactionChargableClient(
    transactionId,
    transactionNonChargableRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(transactionNonChargableRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transaction/${transactionId}/NonChargeable',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> reopenTransaction(
    orderId,
    closeTransactionRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(closeTransactionRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Transaction/Order/${orderId}/ReopenTransaction',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> reverseTransactionLine(
    transactionId,
    transactionLineReverseDto,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = transactionLineReverseDto.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transactions/${transactionId}/TransactionLines/Reverse',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> reverseTransaction(
    orderId,
    transactionReverseDto,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(transactionReverseDto.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Order/${orderId}/ReverseTransaction',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> lockTransaction(transactionId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Transaction/Transactions/${transactionId}/Lock',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> unlockTransaction(transactionId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Transaction/Transactions/${transactionId}/Lock',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> add9999ProductToLine(
    transactionId,
    addOpenLineRequests,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = addOpenLineRequests.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/Transaction/Transactions/${transactionId}/OpenItemTransactionLines',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
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
