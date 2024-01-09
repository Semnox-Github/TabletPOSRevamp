// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _PaymentApiClient implements PaymentApiClient {
  _PaymentApiClient(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<TransactionResponse> addCashPayment(
    transactionId,
    cashPaymentRequests,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = cashPaymentRequests.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transactions/${transactionId}/Payments',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> addGenericPayment(
    transactionId,
    genericPaymentRequests,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = genericPaymentRequests.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transactions/${transactionId}/Payments',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> addCardPayment(
    transactionId,
    cardPaymentRequests,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = cardPaymentRequests.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transactions/${transactionId}/Payments',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> startRefundPayment(paymentId) async {
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
              'api/Transaction/TransactionPayments/${paymentId}/StartRefund',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> completeRefundPayment(
    paymentId,
    completeRefundRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(completeRefundRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/TransactionPayments/${paymentId}/CompleteRefund',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionSearchResponse> searchTransaction(
    queries,
    conditions,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _headers = <String, dynamic>{};
    final _data = conditions.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionSearchResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/TransactionSearch',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionSearchResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> startAdjustTip(paymentId) async {
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
              'api/Transaction/TransactionPayments/${paymentId}/StartAdjustTip',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> completeAdjustTip(
    paymentId,
    completeTipRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(completeTipRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/TransactionPayments/${paymentId}/CompleteAdjustTip',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> splitTip(
    paymentId,
    splitTipRequests,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = splitTipRequests.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/TransactionPayments/${paymentId}/TipSplit',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> completeSale(
    paymentId,
    completeSaleRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(completeSaleRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/TransactionPayments/${paymentId}/CompleteSale',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> completePreAuth(
    paymentId,
    completeSaleRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(completeSaleRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/TransactionPayments/${paymentId}/CompletePreauth',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> completeAuth(
    paymentId,
    completeAuthRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(completeAuthRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/TransactionPayments/${paymentId}/CompleteAuthorize',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> startSettle(paymentId) async {
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
              'api/Transaction/TransactionPayments/${paymentId}/StartSettle',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> completeSettle(
    paymentId,
    completeSaleRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(completeSaleRequest?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/TransactionPayments/${paymentId}/CompleteSettle',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> completeSettlePayment(paymentId) async {
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
              'api/Transaction/TransactionPayments/${paymentId}/CompleteSettle',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> updatePayments(
    transactionId,
    payments,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = payments.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transactions/${transactionId}/UpdatePayments',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CouponDetailsResponse> getCouponDetails(queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CouponDetailsResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/PaymentCoupon',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CouponDetailsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransactionResponse> addCouponPayment(
    transactionId,
    couponPaymentRequests,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = couponPaymentRequests.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransactionResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/Transactions/${transactionId}/Payments',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransactionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<EmployeeTipResponse> getEmployeeTipDetails(paymentId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EmployeeTipResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/Transaction/TransactionPayments/${paymentId}/TipSplit',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EmployeeTipResponse.fromJson(_result.data!);
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
