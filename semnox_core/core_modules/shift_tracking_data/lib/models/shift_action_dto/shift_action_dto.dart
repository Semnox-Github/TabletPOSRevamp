// ignore_for_file: invalid_annotation_target

import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift_action_dto.freezed.dart';
part 'shift_action_dto.g.dart';

@freezed
class ShiftActionDTO with _$ShiftActionDTO {
  const factory ShiftActionDTO({
    @JsonKey(name: 'ShiftId')
    required int shiftId,
    @JsonKey(name: 'ShiftLogId')
    required int shiftLogId,
    @JsonKey(name: 'ShiftAction')
    String? shiftAction,
    @JsonKey(name: 'ShiftAmount')
    required double? shiftAmount,
    @JsonKey(name: 'Cardcount')
    required int cardcount,
    @JsonKey(name: 'ShiftTicketNumber')
    String? shiftTicketNumber,
    @JsonKey(name: 'ShiftRemarks')
    String? shiftRemarks,
    @JsonKey(name: 'ActualAmount')
    double? actualAmount,
    @JsonKey(name: 'ActualCards')
    int? actualCards,
    @JsonKey(name: 'ActualTickets')
    int? actualTickets,
    @JsonKey(name: 'GameCardAmount')
    int? gameCardAmount,
    @JsonKey(name: 'CreditCardAmount')
    double? creditCardAmount,
    @JsonKey(name: 'ChequeAmount')
    double? chequeAmount,
    @JsonKey(name: 'CouponAmount')
    double? couponAmount,
    @JsonKey(name: 'ActualGameCardAmount')
    double? actualGameCardAmount,
    @JsonKey(name: 'ActualCreditCardAmount')
    double? actualCreditCardAmount,
    @JsonKey(name: 'ActualChequeAmount')
    double? actualChequeAmount,
    @JsonKey(name: 'ActualCouponAmount')
    double? actualCouponAmount,
    @JsonKey(name: 'ShiftReason')
    String? shiftReason,
    @JsonKey(name: 'CashDRawerId')
    required int cashDRawerId,
    @JsonKey(name: 'ShiftUserName')
    String? shiftUserName,
    @JsonKey(name: 'ShiftLoginId')
    required String? shiftLoginId,
    @JsonKey(name: 'PosMachineName')
    required String? posMachineName,
    @JsonKey(name: 'IsShareable')
    required bool isShareable,
    @JsonKey(name: 'CashDrawerStatusId')
    required int cashDrawerStatusId,
  }) = _ShiftActionDTO;

 factory ShiftActionDTO.fromJson(Map<String, Object?> json) => _$ShiftActionDTOFromJson(json);
}