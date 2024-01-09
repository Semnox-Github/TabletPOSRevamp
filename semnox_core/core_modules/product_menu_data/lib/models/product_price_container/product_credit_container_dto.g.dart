// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_credit_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductCreditPlusContainerDTO _$$_ProductCreditPlusContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_ProductCreditPlusContainerDTO(
      productCreditPlusId: json['ProductCreditPlusId'] as int,
      creditPlus: (json['CreditPlus'] as num).toDouble(),
      refundable: json['Refundable'] as bool,
      remarks: json['Remarks'] as String,
      productId: json['Product_id'] as int,
      creditPlusType: json['CreditPlusType'] as String,
      guid: json['Guid'],
      periodFrom: json['PeriodFrom'] as String,
      periodTo: json['PeriodTo'] as String,
      validForDays: json['ValidForDays'] as int,
      extendOnReload: json['ExtendOnReload'] as bool,
      timeFrom: json['TimeFrom'],
      timeTo: json['TimeTo'],
      minutes: json['Minutes'] as int,
      monday: json['Monday'] as bool,
      tuesday: json['Tuesday'] as bool,
      wednesday: json['Wednesday'] as bool,
      thursday: json['Thursday'] as bool,
      friday: json['Friday'] as bool,
      saturday: json['Saturday'] as bool,
      sunday: json['Sunday'] as bool,
      ticketAllowed: json['TicketAllowed'] as bool,
      frequency: json['Frequency'] as String,
      pauseAllowed: json['PauseAllowed'] as bool,
      creditPlusConsumptionRulesContainerDTOList:
          json['CreditPlusConsumptionRulesContainerDTOList'] as List<dynamic>,
      entityOverrideDateContainerDTOList:
          json['EntityOverrideDateContainerDTOList'] as List<dynamic>,
      effectiveAfterMinutes: json['EffectiveAfterMinutes'] as int,
    );

Map<String, dynamic> _$$_ProductCreditPlusContainerDTOToJson(
        _$_ProductCreditPlusContainerDTO instance) =>
    <String, dynamic>{
      'ProductCreditPlusId': instance.productCreditPlusId,
      'CreditPlus': instance.creditPlus,
      'Refundable': instance.refundable,
      'Remarks': instance.remarks,
      'Product_id': instance.productId,
      'CreditPlusType': instance.creditPlusType,
      'Guid': instance.guid,
      'PeriodFrom': instance.periodFrom,
      'PeriodTo': instance.periodTo,
      'ValidForDays': instance.validForDays,
      'ExtendOnReload': instance.extendOnReload,
      'TimeFrom': instance.timeFrom,
      'TimeTo': instance.timeTo,
      'Minutes': instance.minutes,
      'Monday': instance.monday,
      'Tuesday': instance.tuesday,
      'Wednesday': instance.wednesday,
      'Thursday': instance.thursday,
      'Friday': instance.friday,
      'Saturday': instance.saturday,
      'Sunday': instance.sunday,
      'TicketAllowed': instance.ticketAllowed,
      'Frequency': instance.frequency,
      'PauseAllowed': instance.pauseAllowed,
      'CreditPlusConsumptionRulesContainerDTOList':
          instance.creditPlusConsumptionRulesContainerDTOList,
      'EntityOverrideDateContainerDTOList':
          instance.entityOverrideDateContainerDTOList,
      'EffectiveAfterMinutes': instance.effectiveAfterMinutes,
    };
