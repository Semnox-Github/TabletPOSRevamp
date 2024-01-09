// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_screen_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VoucherScreenStateImpl _$$VoucherScreenStateImplFromJson(
        Map<String, dynamic> json) =>
    _$VoucherScreenStateImpl(
      isLoading: json['isLoading'] as bool? ?? false,
      transactionResponse: json['transactionResponse'] == null
          ? null
          : TransactionResponse.fromJson(
              json['transactionResponse'] as Map<String, dynamic>),
      couponDetails: json['couponDetails'] == null
          ? null
          : CouponDetailsResponse.fromJson(
              json['couponDetails'] as Map<String, dynamic>),
      isTaxableSelected: json['isTaxableSelected'] as bool? ?? false,
      loadingMessage: json['loadingMessage'] as String?,
      validationError: json['validationError'] as String?,
      apiError: json['apiError'] as String?,
      notificationMessage: json['notificationMessage'] as String?,
    );

Map<String, dynamic> _$$VoucherScreenStateImplToJson(
        _$VoucherScreenStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'transactionResponse': instance.transactionResponse,
      'couponDetails': instance.couponDetails,
      'isTaxableSelected': instance.isTaxableSelected,
      'loadingMessage': instance.loadingMessage,
      'validationError': instance.validationError,
      'apiError': instance.apiError,
      'notificationMessage': instance.notificationMessage,
    };
