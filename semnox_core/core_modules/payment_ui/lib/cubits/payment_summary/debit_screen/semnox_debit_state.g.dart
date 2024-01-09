// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semnox_debit_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SemnoxDebitStateImpl _$$SemnoxDebitStateImplFromJson(
        Map<String, dynamic> json) =>
    _$SemnoxDebitStateImpl(
      isLoading: json['isLoading'] as bool? ?? false,
      balance: (json['balance'] as num?)?.toDouble() ?? 0,
      cardDetails: json['cardDetails'] == null
          ? null
          : AccountDetailsData.fromJson(
              json['cardDetails'] as Map<String, dynamic>),
      transactionResponse: json['transactionResponse'] == null
          ? null
          : TransactionResponse.fromJson(
              json['transactionResponse'] as Map<String, dynamic>),
      loadingMessage: json['loadingMessage'] as String?,
      validationError: json['validationError'] as String?,
      apiError: json['apiError'] as String?,
    );

Map<String, dynamic> _$$SemnoxDebitStateImplToJson(
        _$SemnoxDebitStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'balance': instance.balance,
      'cardDetails': instance.cardDetails,
      'transactionResponse': instance.transactionResponse,
      'loadingMessage': instance.loadingMessage,
      'validationError': instance.validationError,
      'apiError': instance.apiError,
    };
