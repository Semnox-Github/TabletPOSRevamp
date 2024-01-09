// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShiftDTOResponse _$$_ShiftDTOResponseFromJson(Map<String, dynamic> json) =>
    _$_ShiftDTOResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ShiftDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['Message'] as String?,
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_ShiftDTOResponseToJson(_$_ShiftDTOResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'Message': instance.message,
      'exception': instance.exception,
    };

_$_ShiftDTO _$$_ShiftDTOFromJson(Map<String, dynamic> json) => _$_ShiftDTO(
      shiftKey: json['ShiftKey'] as int?,
      shiftUserName: json['ShiftUserName'] as String?,
      shiftTime: json['ShiftTime'] as String?,
      shiftUserType: json['ShiftUserType'] as String?,
      shiftAction: json['ShiftAction'] as String?,
      shiftAmount: (json['ShiftAmount'] as num?)?.toDouble(),
      cardCount: (json['CardCount'] as num?)?.toDouble(),
      shiftTicketNumber: json['ShiftTicketNumber'] as String?,
      shiftRemarks: json['ShiftRemarks'] as String?,
      posMachine: json['POSMachine'] as String?,
      actualAmount: (json['ActualAmount'] as num?)?.toDouble(),
      actualCards: (json['ActualCards'] as num?)?.toDouble(),
      actualTickets: (json['ActualTickets'] as num?)?.toDouble(),
      gameCardamount: (json['GameCardamount'] as num?)?.toDouble(),
      creditCardamount: (json['CreditCardamount'] as num?)?.toDouble(),
      chequeAmount: (json['ChequeAmount'] as num?)?.toDouble(),
      couponAmount: (json['CouponAmount'] as num?)?.toDouble(),
      actualGameCardamount: (json['ActualGameCardamount'] as num?)?.toDouble(),
      actualCreditCardamount:
          (json['ActualCreditCardamount'] as num?)?.toDouble(),
      actualChequeAmount: (json['ActualChequeAmount'] as num?)?.toDouble(),
      actualCouponAmount: (json['ActualCouponAmount'] as num?)?.toDouble(),
      shiftLoginId: json['ShiftLoginId'] as String?,
      masterEntityId: json['MasterEntityId'] as int?,
      createdBy: json['CreatedBy'] as String?,
      creationDate: json['CreationDate'] as String?,
      lastUpdatedBy: json['LastUpdatedBy'] as String?,
      lastUpdatedDate: json['LastUpdatedDate'] as String?,
      guid: json['Guid'] as String?,
      siteId: json['SiteId'] as int?,
      synchStatus: json['SynchStatus'] as bool?,
      shiftLogDtoList: json['ShiftLogDTOList'] as List<dynamic>?,
      receipt: json['Receipt'],
      cashdrawerId: json['CashdrawerId'] as int?,
      isShareable: json['IsShareable'] as bool?,
      cashdrawerStatusId: json['CashdrawerStatusId'] as int?,
      isChanged: json['IsChanged'] as bool?,
      isChangedRecursive: json['IsChangedRecursive'] as bool?,
    );

Map<String, dynamic> _$$_ShiftDTOToJson(_$_ShiftDTO instance) =>
    <String, dynamic>{
      'ShiftKey': instance.shiftKey,
      'ShiftUserName': instance.shiftUserName,
      'ShiftTime': instance.shiftTime,
      'ShiftUserType': instance.shiftUserType,
      'ShiftAction': instance.shiftAction,
      'ShiftAmount': instance.shiftAmount,
      'CardCount': instance.cardCount,
      'ShiftTicketNumber': instance.shiftTicketNumber,
      'ShiftRemarks': instance.shiftRemarks,
      'POSMachine': instance.posMachine,
      'ActualAmount': instance.actualAmount,
      'ActualCards': instance.actualCards,
      'ActualTickets': instance.actualTickets,
      'GameCardamount': instance.gameCardamount,
      'CreditCardamount': instance.creditCardamount,
      'ChequeAmount': instance.chequeAmount,
      'CouponAmount': instance.couponAmount,
      'ActualGameCardamount': instance.actualGameCardamount,
      'ActualCreditCardamount': instance.actualCreditCardamount,
      'ActualChequeAmount': instance.actualChequeAmount,
      'ActualCouponAmount': instance.actualCouponAmount,
      'ShiftLoginId': instance.shiftLoginId,
      'MasterEntityId': instance.masterEntityId,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdatedDate': instance.lastUpdatedDate,
      'Guid': instance.guid,
      'SiteId': instance.siteId,
      'SynchStatus': instance.synchStatus,
      'ShiftLogDTOList': instance.shiftLogDtoList,
      'Receipt': instance.receipt,
      'CashdrawerId': instance.cashdrawerId,
      'IsShareable': instance.isShareable,
      'CashdrawerStatusId': instance.cashdrawerStatusId,
      'IsChanged': instance.isChanged,
      'IsChangedRecursive': instance.isChangedRecursive,
    };
