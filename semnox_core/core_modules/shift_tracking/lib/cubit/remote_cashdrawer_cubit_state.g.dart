// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_cashdrawer_cubit_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RemoteCashDrawerCubitState _$$_RemoteCashDrawerCubitStateFromJson(
        Map<String, dynamic> json) =>
    _$_RemoteCashDrawerCubitState(
      isLoading: json['isLoading'] as bool? ?? true,
      posDropdownValues: (json['posDropdownValues'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [''],
      userDropdownValues: (json['userDropdownValues'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [''],
      posCounterDropdownValues:
          (json['posCounterDropdownValues'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [''],
      tabValue: json['tabValue'] as String? ?? 'OPEN',
      openShiftList: (json['openShiftList'] as List<dynamic>?)
              ?.map((e) => ShiftDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      systemCash: json['systemCash'] as String? ?? '',
      systemCardCount: json['systemCardCount'] as String? ?? '',
      systemGameCard: json['systemGameCard'] as String? ?? '',
      systemCreditCard: json['systemCreditCard'] as String? ?? '',
      systemOthers: json['systemOthers'] as String? ?? '',
      systemCoupons: json['systemCoupons'] as String? ?? '',
      systemTicket: json['systemTicket'] as String? ?? '',
      cash: json['cash'] as String? ?? '',
      cardCount: json['cardCount'] as String? ?? '',
      gameCard: json['gameCard'] as String? ?? '',
      creditCard: json['creditCard'] as String? ?? '',
      others: json['others'] as String? ?? '',
      coupons: json['coupons'] as String? ?? '',
      ticket: json['ticket'] as String? ?? '',
      userContainer: (json['userContainer'] as List<dynamic>?)
              ?.map((e) => UserContainerDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      posMachineContainer: (json['posMachineContainer'] as List<dynamic>?)
              ?.map((e) =>
                  POSMachineContainerDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_RemoteCashDrawerCubitStateToJson(
        _$_RemoteCashDrawerCubitState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'posDropdownValues': instance.posDropdownValues,
      'userDropdownValues': instance.userDropdownValues,
      'posCounterDropdownValues': instance.posCounterDropdownValues,
      'tabValue': instance.tabValue,
      'openShiftList': instance.openShiftList,
      'systemCash': instance.systemCash,
      'systemCardCount': instance.systemCardCount,
      'systemGameCard': instance.systemGameCard,
      'systemCreditCard': instance.systemCreditCard,
      'systemOthers': instance.systemOthers,
      'systemCoupons': instance.systemCoupons,
      'systemTicket': instance.systemTicket,
      'cash': instance.cash,
      'cardCount': instance.cardCount,
      'gameCard': instance.gameCard,
      'creditCard': instance.creditCard,
      'others': instance.others,
      'coupons': instance.coupons,
      'ticket': instance.ticket,
      'userContainer': instance.userContainer,
      'posMachineContainer': instance.posMachineContainer,
    };
