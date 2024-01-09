// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_screen_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentScreenStateImpl _$$PaymentScreenStateImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentScreenStateImpl(
      loadingStatus: json['loadingStatus'] as int? ?? -1,
      selectedPayModeIndex: json['selectedPayModeIndex'] as int? ?? 0,
      isCashScreenSelected: json['isCashScreenSelected'] as bool? ?? true,
      shouldShowSideBar: json['shouldShowSideBar'] as bool? ?? true,
      isPaymentRefreshed: json['isPaymentRefreshed'] as bool? ?? false,
      isNotificationError: json['isNotificationError'] as bool? ?? false,
      isCurrentUserManager: json['isCurrentUserManager'] as bool? ?? false,
      isSettleCompleted: json['isSettleCompleted'] as bool? ?? false,
      searchedForPayModes: json['searchedForPayModes'] as bool? ?? false,
      selectedPayMode: json['selectedPayMode'] == null
          ? null
          : PaymentModeContainerDTO.fromJson(
              json['selectedPayMode'] as Map<String, dynamic>),
      appliedPayments: (json['appliedPayments'] as List<dynamic>?)
          ?.map(
              (e) => TransactionPaymentDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      searchedPaymentModes: (json['searchedPaymentModes'] as List<dynamic>?)
              ?.map((e) =>
                  PaymentModeContainerDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      transactionResponse: json['transactionResponse'] == null
          ? null
          : TransactionResponse.fromJson(
              json['transactionResponse'] as Map<String, dynamic>),
      tenderedAmount: (json['tenderedAmount'] as num?)?.toDouble() ?? 0,
      loadingMessage: json['loadingMessage'] as String?,
      validationError: json['validationError'] as String?,
      apiError: json['apiError'] as String?,
      notificationMessage: json['notificationMessage'] as String?,
    );

Map<String, dynamic> _$$PaymentScreenStateImplToJson(
        _$PaymentScreenStateImpl instance) =>
    <String, dynamic>{
      'loadingStatus': instance.loadingStatus,
      'selectedPayModeIndex': instance.selectedPayModeIndex,
      'isCashScreenSelected': instance.isCashScreenSelected,
      'shouldShowSideBar': instance.shouldShowSideBar,
      'isPaymentRefreshed': instance.isPaymentRefreshed,
      'isNotificationError': instance.isNotificationError,
      'isCurrentUserManager': instance.isCurrentUserManager,
      'isSettleCompleted': instance.isSettleCompleted,
      'searchedForPayModes': instance.searchedForPayModes,
      'selectedPayMode': instance.selectedPayMode,
      'appliedPayments': instance.appliedPayments,
      'searchedPaymentModes': instance.searchedPaymentModes,
      'transactionResponse': instance.transactionResponse,
      'tenderedAmount': instance.tenderedAmount,
      'loadingMessage': instance.loadingMessage,
      'validationError': instance.validationError,
      'apiError': instance.apiError,
      'notificationMessage': instance.notificationMessage,
    };
