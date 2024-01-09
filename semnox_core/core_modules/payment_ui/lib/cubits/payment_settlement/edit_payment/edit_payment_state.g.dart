// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_payment_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditPaymentStateImpl _$$EditPaymentStateImplFromJson(
        Map<String, dynamic> json) =>
    _$EditPaymentStateImpl(
      loadingStatus: json['loadingStatus'] as int? ?? -1,
      editSwitchStatus: json['editSwitchStatus'] as bool? ?? false,
      isEditCompleted: json['isEditCompleted'] as bool? ?? false,
      compatiblePayModes: (json['compatiblePayModes'] as List<dynamic>?)
              ?.map((e) =>
                  PaymentModeContainerDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      editablePayments: (json['editablePayments'] as List<dynamic>?)
              ?.map((e) =>
                  TransactionPaymentDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      loadingMessage: json['loadingMessage'] as String?,
      validationError: json['validationError'] as String?,
      apiError: json['apiError'] as String?,
      notificationMessage: json['notificationMessage'] as String?,
    );

Map<String, dynamic> _$$EditPaymentStateImplToJson(
        _$EditPaymentStateImpl instance) =>
    <String, dynamic>{
      'loadingStatus': instance.loadingStatus,
      'editSwitchStatus': instance.editSwitchStatus,
      'isEditCompleted': instance.isEditCompleted,
      'compatiblePayModes': instance.compatiblePayModes,
      'editablePayments': instance.editablePayments,
      'loadingMessage': instance.loadingMessage,
      'validationError': instance.validationError,
      'apiError': instance.apiError,
      'notificationMessage': instance.notificationMessage,
    };
