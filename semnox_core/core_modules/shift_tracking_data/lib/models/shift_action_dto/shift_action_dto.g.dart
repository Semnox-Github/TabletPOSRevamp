// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_action_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShiftActionDTO _$$_ShiftActionDTOFromJson(Map<String, dynamic> json) =>
    _$_ShiftActionDTO(
      shiftId: json['ShiftId'] as int,
      shiftLogId: json['ShiftLogId'] as int,
      shiftAction: json['ShiftAction'] as String?,
      shiftAmount: (json['ShiftAmount'] as num?)?.toDouble(),
      cardcount: json['Cardcount'] as int,
      shiftTicketNumber: json['ShiftTicketNumber'] as String?,
      shiftRemarks: json['ShiftRemarks'] as String?,
      actualAmount: (json['ActualAmount'] as num?)?.toDouble(),
      actualCards: json['ActualCards'] as int?,
      actualTickets: json['ActualTickets'] as int?,
      gameCardAmount: json['GameCardAmount'] as int?,
      creditCardAmount: (json['CreditCardAmount'] as num?)?.toDouble(),
      chequeAmount: (json['ChequeAmount'] as num?)?.toDouble(),
      couponAmount: (json['CouponAmount'] as num?)?.toDouble(),
      actualGameCardAmount: (json['ActualGameCardAmount'] as num?)?.toDouble(),
      actualCreditCardAmount:
          (json['ActualCreditCardAmount'] as num?)?.toDouble(),
      actualChequeAmount: (json['ActualChequeAmount'] as num?)?.toDouble(),
      actualCouponAmount: (json['ActualCouponAmount'] as num?)?.toDouble(),
      shiftReason: json['ShiftReason'] as String?,
      cashDRawerId: json['CashDRawerId'] as int,
      shiftUserName: json['ShiftUserName'] as String?,
      shiftLoginId: json['ShiftLoginId'] as String?,
      posMachineName: json['PosMachineName'] as String?,
      isShareable: json['IsShareable'] as bool,
      cashDrawerStatusId: json['CashDrawerStatusId'] as int,
    );

Map<String, dynamic> _$$_ShiftActionDTOToJson(_$_ShiftActionDTO instance) =>
    <String, dynamic>{
      'ShiftId': instance.shiftId,
      'ShiftLogId': instance.shiftLogId,
      'ShiftAction': instance.shiftAction,
      'ShiftAmount': instance.shiftAmount,
      'Cardcount': instance.cardcount,
      'ShiftTicketNumber': instance.shiftTicketNumber,
      'ShiftRemarks': instance.shiftRemarks,
      'ActualAmount': instance.actualAmount,
      'ActualCards': instance.actualCards,
      'ActualTickets': instance.actualTickets,
      'GameCardAmount': instance.gameCardAmount,
      'CreditCardAmount': instance.creditCardAmount,
      'ChequeAmount': instance.chequeAmount,
      'CouponAmount': instance.couponAmount,
      'ActualGameCardAmount': instance.actualGameCardAmount,
      'ActualCreditCardAmount': instance.actualCreditCardAmount,
      'ActualChequeAmount': instance.actualChequeAmount,
      'ActualCouponAmount': instance.actualCouponAmount,
      'ShiftReason': instance.shiftReason,
      'CashDRawerId': instance.cashDRawerId,
      'ShiftUserName': instance.shiftUserName,
      'ShiftLoginId': instance.shiftLoginId,
      'PosMachineName': instance.posMachineName,
      'IsShareable': instance.isShareable,
      'CashDrawerStatusId': instance.cashDrawerStatusId,
    };
