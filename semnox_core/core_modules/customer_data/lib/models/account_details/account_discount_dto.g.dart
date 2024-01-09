// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_discount_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountDiscountData _$$_AccountDiscountDataFromJson(
        Map<String, dynamic> json) =>
    _$_AccountDiscountData(
      accountDiscountId: json['AccountDiscountId'] as int,
      accountId: json['AccountId'] as int,
      discountId: json['DiscountId'] as int,
      expiryDate: json['ExpiryDate'] as String?,
      CreatedBy: json['CreatedBy'] as String?,
      creationDate: json['CreationDate'] as String?,
      lastUpdatedUser: json['LastUpdatedUser'] as String?,
      lastUpdatedDate: json['LastUpdatedDate'] as String?,
      internetKey: json['InternetKey'] as int,
      accountTypeId: json['AccountTypeId'] as int,
      transactionId: json['TransactionId'] as int,
      lineId: json['LineId'] as int,
      taskId: json['TaskId'] as int,
      obligationStatus: json['ObligationStatus'] as String?,
      obligationStatusId: json['ObligationStatusId'] as int,
      obligationStatusChangeDate: json['ObligationStatusChangeDate'] as String?,
      isActive: json['IsActive'] as bool?,
      siteId: json['SiteId'] as int,
      masterEntityId: json['MasterEntityId'] as int,
      synchStatus: json['SynchStatus'] as bool?,
      guid: json['Guid'] as String?,
      expireWithMembership: json['ExpireWithMembership'] as String?,
      validityStatus: json['ValidityStatus'] as int,
      membershipRewardsId: json['MembershipRewardsId'] as int,
      membershipId: json['MembershipId'] as int,
      subscriptionBillingScheduleId:
          json['SubscriptionBillingScheduleId'] as int,
      isChanged: json['IsChanged'] as bool?,
    );

Map<String, dynamic> _$$_AccountDiscountDataToJson(
        _$_AccountDiscountData instance) =>
    <String, dynamic>{
      'AccountDiscountId': instance.accountDiscountId,
      'AccountId': instance.accountId,
      'DiscountId': instance.discountId,
      'ExpiryDate': instance.expiryDate,
      'CreatedBy': instance.CreatedBy,
      'CreationDate': instance.creationDate,
      'LastUpdatedUser': instance.lastUpdatedUser,
      'LastUpdatedDate': instance.lastUpdatedDate,
      'InternetKey': instance.internetKey,
      'AccountTypeId': instance.accountTypeId,
      'TransactionId': instance.transactionId,
      'LineId': instance.lineId,
      'TaskId': instance.taskId,
      'ObligationStatus': instance.obligationStatus,
      'ObligationStatusId': instance.obligationStatusId,
      'ObligationStatusChangeDate': instance.obligationStatusChangeDate,
      'IsActive': instance.isActive,
      'SiteId': instance.siteId,
      'MasterEntityId': instance.masterEntityId,
      'SynchStatus': instance.synchStatus,
      'Guid': instance.guid,
      'ExpireWithMembership': instance.expireWithMembership,
      'ValidityStatus': instance.validityStatus,
      'MembershipRewardsId': instance.membershipRewardsId,
      'MembershipId': instance.membershipId,
      'SubscriptionBillingScheduleId': instance.subscriptionBillingScheduleId,
      'IsChanged': instance.isChanged,
    };
