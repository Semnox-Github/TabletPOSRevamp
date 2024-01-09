// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_screen_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CashScreenStateImpl _$$CashScreenStateImplFromJson(
        Map<String, dynamic> json) =>
    _$CashScreenStateImpl(
      isLoading: json['isLoading'] as bool? ?? false,
      transactionResponse: json['transactionResponse'] == null
          ? null
          : TransactionResponse.fromJson(
              json['transactionResponse'] as Map<String, dynamic>),
      tenderedAmount: json['tenderedAmount'] as String? ?? '0.00',
      selectedDenomination: json['selectedDenomination'] as int? ?? 100,
      hundredDenominationCount: json['hundredDenominationCount'] as int? ?? 0,
      fiftyDenominationCount: json['fiftyDenominationCount'] as int? ?? 0,
      twentyDenominationCount: json['twentyDenominationCount'] as int? ?? 0,
      tenDenominationCount: json['tenDenominationCount'] as int? ?? 0,
      fiveDenominationCount: json['fiveDenominationCount'] as int? ?? 0,
      oneDenominationCount: json['oneDenominationCount'] as int? ?? 0,
      loadingMessage: json['loadingMessage'] as String?,
      shouldShowTenderButton: json['shouldShowTenderButton'] as bool? ?? false,
      validationError: json['validationError'] as String?,
      apiError: json['apiError'] as String?,
    );

Map<String, dynamic> _$$CashScreenStateImplToJson(
        _$CashScreenStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'transactionResponse': instance.transactionResponse,
      'tenderedAmount': instance.tenderedAmount,
      'selectedDenomination': instance.selectedDenomination,
      'hundredDenominationCount': instance.hundredDenominationCount,
      'fiftyDenominationCount': instance.fiftyDenominationCount,
      'twentyDenominationCount': instance.twentyDenominationCount,
      'tenDenominationCount': instance.tenDenominationCount,
      'fiveDenominationCount': instance.fiveDenominationCount,
      'oneDenominationCount': instance.oneDenominationCount,
      'loadingMessage': instance.loadingMessage,
      'shouldShowTenderButton': instance.shouldShowTenderButton,
      'validationError': instance.validationError,
      'apiError': instance.apiError,
    };
