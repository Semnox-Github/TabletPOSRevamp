// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tip_split_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TipSplitStateImpl _$$TipSplitStateImplFromJson(Map<String, dynamic> json) =>
    _$TipSplitStateImpl(
      loadingStatus: json['loadingStatus'] as int? ?? -1,
      isPercentageCompleted: json['isPercentageCompleted'] as bool? ?? false,
      isClockedInUser: json['isClockedInUser'] as bool? ?? false,
      enteredAmount: (json['enteredAmount'] as num?)?.toDouble() ?? 0,
      tipAmount: (json['tipAmount'] as num?)?.toDouble() ?? 0,
      transactionResponse: json['transactionResponse'] == null
          ? null
          : TransactionResponse.fromJson(
              json['transactionResponse'] as Map<String, dynamic>),
      userRoles: (json['userRoles'] as List<dynamic>?)
              ?.map((e) =>
                  UserRoleContainerDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      users: (json['users'] as List<dynamic>?)
              ?.map((e) => UserContainerDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      employeeTips: (json['employeeTips'] as List<dynamic>?)
              ?.map((e) => EmployeeTipData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      loadingMessage: json['loadingMessage'] as String?,
      validationError: json['validationError'] as String?,
      apiError: json['apiError'] as String?,
      notificationMessage: json['notificationMessage'] as String?,
    );

Map<String, dynamic> _$$TipSplitStateImplToJson(_$TipSplitStateImpl instance) =>
    <String, dynamic>{
      'loadingStatus': instance.loadingStatus,
      'isPercentageCompleted': instance.isPercentageCompleted,
      'isClockedInUser': instance.isClockedInUser,
      'enteredAmount': instance.enteredAmount,
      'tipAmount': instance.tipAmount,
      'transactionResponse': instance.transactionResponse,
      'userRoles': instance.userRoles,
      'users': instance.users,
      'employeeTips': instance.employeeTips,
      'loadingMessage': instance.loadingMessage,
      'validationError': instance.validationError,
      'apiError': instance.apiError,
      'notificationMessage': instance.notificationMessage,
    };
