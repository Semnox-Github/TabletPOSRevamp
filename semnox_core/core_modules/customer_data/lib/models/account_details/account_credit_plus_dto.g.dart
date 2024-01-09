// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_credit_plus_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountCreditPlusDTO _$$_AccountCreditPlusDTOFromJson(
        Map<String, dynamic> json) =>
    _$_AccountCreditPlusDTO(
      accountCreditPlusId: json['AccountCreditPlusId'] as int,
      accountId: json['AccountId'] as int,
      creditPlusType: json['CreditPlusType'] as int,
      creditPlus: (json['CreditPlus'] as num?)?.toDouble(),
      creditPlusBalance: (json['CreditPlusBalance'] as num).toDouble(),
      periodFrom: json['PeriodFrom'] as String?,
      periodTo: json['PeriodTo'] as String?,
      extendOnReload: json['ExtendOnReload'] as bool,
      refundable: json['Refundable'] as bool,
      timeFrom: json['TimeFrom'],
      timeTo: json['TimeTo'],
      monday: json['Monday'] as bool,
      tuesday: json['Tuesday'] as bool,
      wednesday: json['Wednesday'] as bool,
      thursday: json['Thursday'] as bool,
      friday: json['Friday'] as bool,
      saturday: json['Saturday'] as bool,
      sunday: json['Sunday'] as bool,
      ticketAllowed: json['TicketAllowed'] as bool,
      pauseAllowed: json['PauseAllowed'] as bool,
      remarks: json['Remarks'] as String,
      expireWithMembership: json['ExpireWithMembership'] as bool,
      transactionId: json['TransactionId'] as int,
      transactionLineId: json['TransactionLineId'] as int,
      numberOfDays: json['NumberOfDays'] as int?,
      minimumSaleAmount: json['MinimumSaleAmount'],
      loyaltyRuleId: json['LoyaltyRuleId'] as int,
      playStartTime: json['PlayStartTime'] as String?,
      validityStatus: json['ValidityStatus'] as int,
      forMembershipOnly: json['ForMembershipOnly'] as bool,
      membershipId: json['MembershipId'] as int,
      membershipRewardsId: json['MembershipRewardsId'] as int,
      obligationStatus: json['ObligationStatus'] as String,
      obligationStatusId: json['ObligationStatusId'] as int,
      obligationStatusChangeDate: json['ObligationStatusChangeDate'],
      creationDate: json['CreationDate'] as String,
      lastUpdatedBy: json['LastUpdatedBy'] as String,
      lastUpdateDate: json['LastUpdateDate'] as String,
      siteId: json['SiteId'] as int,
      masterEntityId: json['MasterEntityId'] as int,
      synchStatus: json['SynchStatus'] as bool,
      guid: json['Guid'] as String,
      isActive: json['IsActive'] as bool,
      createdBy: json['CreatedBy'] as String,
      accountCreditPlusConsumptionDTOList:
          (json['AccountCreditPlusConsumptionDTOList'] as List<dynamic>?)
              ?.map((e) => AccountCreditPlusConsumptionDTO.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      accountCreditPlusPurchaseCriteriaDTOList:
          (json['AccountCreditPlusPurchaseCriteriaDTOList'] as List<dynamic>?)
              ?.map((e) => AccountCreditPlusPurchaseCriteriaDTO.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      entityOverrideDatesDTOList:
          json['EntityOverrideDatesDTOList'] as List<dynamic>,
      isChanged: json['IsChanged'] as bool,
      isChangedRecursive: json['IsChangedRecursive'] as bool,
      sourceCreditPlusId: json['SourceCreditPlusId'] as int,
      subscriptionBillingScheduleId:
          json['SubscriptionBillingScheduleId'] as int,
    );

Map<String, dynamic> _$$_AccountCreditPlusDTOToJson(
        _$_AccountCreditPlusDTO instance) =>
    <String, dynamic>{
      'AccountCreditPlusId': instance.accountCreditPlusId,
      'AccountId': instance.accountId,
      'CreditPlusType': instance.creditPlusType,
      'CreditPlus': instance.creditPlus,
      'CreditPlusBalance': instance.creditPlusBalance,
      'PeriodFrom': instance.periodFrom,
      'PeriodTo': instance.periodTo,
      'ExtendOnReload': instance.extendOnReload,
      'Refundable': instance.refundable,
      'TimeFrom': instance.timeFrom,
      'TimeTo': instance.timeTo,
      'Monday': instance.monday,
      'Tuesday': instance.tuesday,
      'Wednesday': instance.wednesday,
      'Thursday': instance.thursday,
      'Friday': instance.friday,
      'Saturday': instance.saturday,
      'Sunday': instance.sunday,
      'TicketAllowed': instance.ticketAllowed,
      'PauseAllowed': instance.pauseAllowed,
      'Remarks': instance.remarks,
      'ExpireWithMembership': instance.expireWithMembership,
      'TransactionId': instance.transactionId,
      'TransactionLineId': instance.transactionLineId,
      'NumberOfDays': instance.numberOfDays,
      'MinimumSaleAmount': instance.minimumSaleAmount,
      'LoyaltyRuleId': instance.loyaltyRuleId,
      'PlayStartTime': instance.playStartTime,
      'ValidityStatus': instance.validityStatus,
      'ForMembershipOnly': instance.forMembershipOnly,
      'MembershipId': instance.membershipId,
      'MembershipRewardsId': instance.membershipRewardsId,
      'ObligationStatus': instance.obligationStatus,
      'ObligationStatusId': instance.obligationStatusId,
      'ObligationStatusChangeDate': instance.obligationStatusChangeDate,
      'CreationDate': instance.creationDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdateDate': instance.lastUpdateDate,
      'SiteId': instance.siteId,
      'MasterEntityId': instance.masterEntityId,
      'SynchStatus': instance.synchStatus,
      'Guid': instance.guid,
      'IsActive': instance.isActive,
      'CreatedBy': instance.createdBy,
      'AccountCreditPlusConsumptionDTOList':
          instance.accountCreditPlusConsumptionDTOList,
      'AccountCreditPlusPurchaseCriteriaDTOList':
          instance.accountCreditPlusPurchaseCriteriaDTOList,
      'EntityOverrideDatesDTOList': instance.entityOverrideDatesDTOList,
      'IsChanged': instance.isChanged,
      'IsChangedRecursive': instance.isChangedRecursive,
      'SourceCreditPlusId': instance.sourceCreditPlusId,
      'SubscriptionBillingScheduleId': instance.subscriptionBillingScheduleId,
    };
