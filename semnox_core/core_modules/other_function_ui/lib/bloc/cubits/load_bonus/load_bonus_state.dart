import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:flutter/material.dart';
import '../../../model/multi_cards_model.dart';

class LoadBonusState {
  LoadBonusState(
      {this.isLoading = false,
      this.isSuccess = false,
      this.isPrimaryCardApplied = false,
      this.isError = false,
      this.loaderMessage = '',
      this.primaryCardData,
      this.statusMessage = '',
      this.loadBonusType = 'CB',
      this.bonusValue = 0.00,
        this.isRemarksMandatory =  "Y",
        this.loadBonusLimit,
        this.allowManualEntryCard ="Y",
      this.notificationBarColor = Colors.white});

  bool isLoading;
  bool isSuccess;
  bool isError;
  String loaderMessage;
  bool isPrimaryCardApplied;
  AccountDetailsResponse? primaryCardData;
  String statusMessage;
  String loadBonusType;
  Color notificationBarColor;
  double bonusValue;
  String isRemarksMandatory;
  double? loadBonusLimit;
  String allowManualEntryCard;

  LoadBonusState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    String? loaderMessage,
    bool? isPrimaryCardApplied,
    AccountDetailsResponse? primaryCardData,
    String? statusMessage,
    String? loadBonusType,
    Color? notificationBarColor,
    double? bonusValue,
    String? isRemarksMandatory,
    double? loadBonusLimit,
    String? allowManualEntryCard


  }) {
    return LoadBonusState(
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
        isError: isError ?? this.isError,
        loaderMessage: loaderMessage ?? this.loaderMessage,
        isPrimaryCardApplied: isPrimaryCardApplied ?? this.isPrimaryCardApplied,
        primaryCardData: primaryCardData ?? this.primaryCardData,
        statusMessage: statusMessage ?? this.statusMessage,
        loadBonusType: loadBonusType ?? this.loadBonusType,
        notificationBarColor: notificationBarColor ?? this.notificationBarColor,
        bonusValue: bonusValue ?? this.bonusValue,
        isRemarksMandatory: isRemarksMandatory?? this.isRemarksMandatory,
        loadBonusLimit: loadBonusLimit??this.loadBonusLimit,
        allowManualEntryCard: allowManualEntryCard ??this.allowManualEntryCard);
  }
}
