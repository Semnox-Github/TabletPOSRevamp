import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:flutter/material.dart';

import '../../../model/multi_cards_model.dart';

class ExchangeEntitlementState {
  ExchangeEntitlementState(
      {this.multiCardsData = const [],
      this.isLoading = false,
      this.isSuccess = false,
      this.isPrimaryCardApplied = false,
      this.isError = false,
      this.loaderMessage = '',
      this.primaryCardData,
      this.statusMessage = '',
      this.exchangeType = '',
      this.entitlementAvailableValue = 0,
      this.entitlementConvertValue = 0,
      this.conversionValue = 1,
      this.afterConvertedValue =0,
      this.notificationBarColor = Colors.white,
      this.isShowConvertedValue = false});

  List<MultiCardsModel> multiCardsData;

  bool isLoading;

  bool isSuccess;

  bool isError;

  String loaderMessage;
  bool isPrimaryCardApplied;
  AccountDetailsResponse? primaryCardData;
  String statusMessage;
  String exchangeType;
  int entitlementAvailableValue;
  int entitlementConvertValue;
  int conversionValue;
  int afterConvertedValue;
  Color notificationBarColor;
  bool isShowConvertedValue;

  ExchangeEntitlementState copyWith({
    List<MultiCardsModel>? multiCardsData,
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    String? loaderMessage,
    bool? isPrimaryCardApplied,
    AccountDetailsResponse? primaryCardData,
    String? statusMessage,
    String? exchangeType,
    int? entitlementAvailableValue,
    int? entitlementConvertValue,
    int? conversionValue,
    int?afterConvertedValue,
    Color? notificationBarColor,
    bool? isShowConvertedValue
  }) {
    return ExchangeEntitlementState(
        multiCardsData: multiCardsData ?? this.multiCardsData,
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
        isError: isError ?? this.isError,
        loaderMessage: loaderMessage ?? this.loaderMessage,
        isPrimaryCardApplied: isPrimaryCardApplied ?? this.isPrimaryCardApplied,
        primaryCardData: primaryCardData ?? this.primaryCardData,
        statusMessage: statusMessage ?? this.statusMessage,
        exchangeType: exchangeType ?? this.exchangeType,
        entitlementAvailableValue:
            entitlementAvailableValue ?? this.entitlementAvailableValue,
        entitlementConvertValue:
            entitlementConvertValue ?? this.entitlementConvertValue,
        conversionValue: conversionValue ?? this.conversionValue,
        afterConvertedValue: afterConvertedValue?? this.afterConvertedValue,
        notificationBarColor: notificationBarColor?? this.notificationBarColor,
        isShowConvertedValue: isShowConvertedValue?? this.isShowConvertedValue);
  }
}
