// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_screen_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardScreenStateImpl _$$CardScreenStateImplFromJson(
        Map<String, dynamic> json) =>
    _$CardScreenStateImpl(
      isLoading: json['isLoading'] as bool? ?? false,
      transactionResponse: json['transactionResponse'] == null
          ? null
          : TransactionResponse.fromJson(
              json['transactionResponse'] as Map<String, dynamic>),
      loadingMessage: json['loadingMessage'] as String?,
      validationError: json['validationError'] as String?,
      apiError: json['apiError'] as String?,
    );

Map<String, dynamic> _$$CardScreenStateImplToJson(
        _$CardScreenStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'transactionResponse': instance.transactionResponse,
      'loadingMessage': instance.loadingMessage,
      'validationError': instance.validationError,
      'apiError': instance.apiError,
    };
