// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_screen_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenericScreenStateImpl _$$GenericScreenStateImplFromJson(
        Map<String, dynamic> json) =>
    _$GenericScreenStateImpl(
      isLoading: json['isLoading'] as bool? ?? false,
      transactionResponse: json['transactionResponse'] == null
          ? null
          : TransactionResponse.fromJson(
              json['transactionResponse'] as Map<String, dynamic>),
      tenderedAmount: json['tenderedAmount'] as String? ?? '0.00',
      loadingMessage: json['loadingMessage'] as String?,
      validationError: json['validationError'] as String?,
      apiError: json['apiError'] as String?,
    );

Map<String, dynamic> _$$GenericScreenStateImplToJson(
        _$GenericScreenStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'transactionResponse': instance.transactionResponse,
      'tenderedAmount': instance.tenderedAmount,
      'loadingMessage': instance.loadingMessage,
      'validationError': instance.validationError,
      'apiError': instance.apiError,
    };
