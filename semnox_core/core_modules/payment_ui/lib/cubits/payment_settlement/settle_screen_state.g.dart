// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settle_screen_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettleScreenStateImpl _$$SettleScreenStateImplFromJson(
        Map<String, dynamic> json) =>
    _$SettleScreenStateImpl(
      loadingStatus: json['loadingStatus'] as int? ?? -1,
      settleScreenIndex: json['settleScreenIndex'] as int? ?? 1,
      maxLimitTipPC: json['maxLimitTipPC'] as int? ?? 0,
      showSideBar: json['showSideBar'] as bool? ?? true,
      showFilterSection: json['showFilterSection'] as bool? ?? true,
      authPaymentsSwitchStatus:
          json['authPaymentsSwitchStatus'] as bool? ?? false,
      tipSwitchStatus: json['tipSwitchStatus'] as bool? ?? false,
      editPaySwitchStatus: json['editPaySwitchStatus'] as bool? ?? false,
      isSettleCompleted: json['isSettleCompleted'] as bool? ?? false,
      isTipAdded: json['isTipAdded'] as bool? ?? false,
      isTipSplitAdded: json['isTipSplitAdded'] as bool? ?? false,
      searchedForSettleModes: json['searchedForSettleModes'] as bool? ?? false,
      transactionResponse: json['transactionResponse'] == null
          ? null
          : TransactionResponse.fromJson(
              json['transactionResponse'] as Map<String, dynamic>),
      selectedSettleMode: json['selectedSettleMode'] as String?,
      payModes: (json['payModes'] as List<dynamic>?)
              ?.map((e) =>
                  PaymentModeContainerDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      authorizedPayments: (json['authorizedPayments'] as List<dynamic>?)
              ?.map((e) =>
                  TransactionPaymentDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      settledPayments: (json['settledPayments'] as List<dynamic>?)
              ?.map((e) =>
                  TransactionPaymentDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      editablePayments: (json['editablePayments'] as List<dynamic>?)
              ?.map((e) =>
                  TransactionPaymentDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      exemptedPayments: (json['exemptedPayments'] as List<dynamic>?)
              ?.map((e) =>
                  TransactionPaymentDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      searchedSettlementModes:
          (json['searchedSettlementModes'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
      employeeTips: (json['employeeTips'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            int.parse(k),
            (e as List<dynamic>)
                .map((e) => EmployeeTipData.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      loadingMessage: json['loadingMessage'] as String?,
      validationError: json['validationError'] as String?,
      apiError: json['apiError'] as String?,
      notificationMessage: json['notificationMessage'] as String?,
    );

Map<String, dynamic> _$$SettleScreenStateImplToJson(
        _$SettleScreenStateImpl instance) =>
    <String, dynamic>{
      'loadingStatus': instance.loadingStatus,
      'settleScreenIndex': instance.settleScreenIndex,
      'maxLimitTipPC': instance.maxLimitTipPC,
      'showSideBar': instance.showSideBar,
      'showFilterSection': instance.showFilterSection,
      'authPaymentsSwitchStatus': instance.authPaymentsSwitchStatus,
      'tipSwitchStatus': instance.tipSwitchStatus,
      'editPaySwitchStatus': instance.editPaySwitchStatus,
      'isSettleCompleted': instance.isSettleCompleted,
      'isTipAdded': instance.isTipAdded,
      'isTipSplitAdded': instance.isTipSplitAdded,
      'searchedForSettleModes': instance.searchedForSettleModes,
      'transactionResponse': instance.transactionResponse,
      'selectedSettleMode': instance.selectedSettleMode,
      'payModes': instance.payModes,
      'authorizedPayments': instance.authorizedPayments,
      'settledPayments': instance.settledPayments,
      'editablePayments': instance.editablePayments,
      'exemptedPayments': instance.exemptedPayments,
      'searchedSettlementModes': instance.searchedSettlementModes,
      'employeeTips':
          instance.employeeTips?.map((k, e) => MapEntry(k.toString(), e)),
      'loadingMessage': instance.loadingMessage,
      'validationError': instance.validationError,
      'apiError': instance.apiError,
      'notificationMessage': instance.notificationMessage,
    };
