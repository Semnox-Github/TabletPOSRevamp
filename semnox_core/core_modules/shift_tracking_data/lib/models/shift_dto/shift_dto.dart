// To parse this JSON data, do
//
//     final shiftDto = shiftDtoFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'shift_dto.freezed.dart';
part 'shift_dto.g.dart';


@freezed
class ShiftDTOResponse with _$ShiftDTOResponse {
  const factory ShiftDTOResponse({
    @JsonKey(name: 'data')
    List<ShiftDTO>? data,
    @JsonKey(name: 'Message')
    String? message,
    @JsonKey(name: 'exception')
    String? exception,

  }) = _ShiftDTOResponse;

  factory ShiftDTOResponse.fromJson(Map<String, dynamic> json) => _$ShiftDTOResponseFromJson(json);
}

@freezed
class ShiftDTO with _$ShiftDTO {
  const factory ShiftDTO({
    @JsonKey(name: "ShiftKey")
    int? shiftKey,
    @JsonKey(name: "ShiftUserName")
    String? shiftUserName,
    @JsonKey(name: "ShiftTime")
    String? shiftTime,
    @JsonKey(name: "ShiftUserType")
    String? shiftUserType,
    @JsonKey(name: "ShiftAction")
    String? shiftAction,
    @JsonKey(name: "ShiftAmount")
    double? shiftAmount,
    @JsonKey(name: "CardCount")
    double? cardCount,
    @JsonKey(name: "ShiftTicketNumber")
    String? shiftTicketNumber,
    @JsonKey(name: "ShiftRemarks")
    String? shiftRemarks,
    @JsonKey(name: "POSMachine")
    String? posMachine,
    @JsonKey(name: "ActualAmount")
    double? actualAmount,
    @JsonKey(name: "ActualCards")
    double? actualCards,
    @JsonKey(name: "ActualTickets")
    double? actualTickets,
    @JsonKey(name: "GameCardamount")
    double? gameCardamount,
    @JsonKey(name: "CreditCardamount")
    double? creditCardamount,
    @JsonKey(name: "ChequeAmount")
    double? chequeAmount,
    @JsonKey(name: "CouponAmount")
    double? couponAmount,
    @JsonKey(name: "ActualGameCardamount")
    double? actualGameCardamount,
    @JsonKey(name: "ActualCreditCardamount")
    double? actualCreditCardamount,
    @JsonKey(name: "ActualChequeAmount")
    double? actualChequeAmount,
    @JsonKey(name: "ActualCouponAmount")
    double? actualCouponAmount,
    @JsonKey(name: "ShiftLoginId")
    String? shiftLoginId,
    @JsonKey(name: "MasterEntityId")
    int? masterEntityId,
    @JsonKey(name: "CreatedBy")
    String? createdBy,
    @JsonKey(name: "CreationDate")
    String? creationDate,
    @JsonKey(name: "LastUpdatedBy")
    String? lastUpdatedBy,
    @JsonKey(name: "LastUpdatedDate")
    String? lastUpdatedDate,
    @JsonKey(name: "Guid")
    String? guid,
    @JsonKey(name: "SiteId")
    int? siteId,
    @JsonKey(name: "SynchStatus")
    bool? synchStatus,
    @JsonKey(name: "ShiftLogDTOList")
    List<dynamic>? shiftLogDtoList,
    @JsonKey(name: "Receipt")
    dynamic receipt,
    @JsonKey(name: "CashdrawerId")
    int? cashdrawerId,
    @JsonKey(name: "IsShareable")
    bool? isShareable,
    @JsonKey(name: "CashdrawerStatusId")
    int? cashdrawerStatusId,
    @JsonKey(name: "IsChanged")
    bool? isChanged,
    @JsonKey(name: "IsChangedRecursive")
    bool? isChangedRecursive,
  }) = _ShiftDTO;

  factory ShiftDTO.fromJson(Map<String, dynamic> json) => _$ShiftDTOFromJson(json);
}
