// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_game_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountGameDTO _$$_AccountGameDTOFromJson(Map<String, dynamic> json) =>
    _$_AccountGameDTO(
      accountGameId: json['AccountGameId'] as int,
      gameProfileId: json['GameProfileId'] as int,
      gameId: json['GameId'] as int,
      quantity: (json['Quantity'] as num).toDouble(),
      frequency: json['Frequency'] as String,
      balanceGames: json['BalanceGames'] as int,
      lastPlayedTime: json['LastPlayedTime'],
      fromDate: json['FromDate'] as String,
      expiryDate: json['ExpiryDate'] as String,
      entitlementType: json['EntitlementType'] as String,
      ticketAllowed: json['TicketAllowed'] as bool,
      optionalAttribute: json['OptionalAttribute'] as String,
      monday: json['Monday'] as bool,
      tuesday: json['Tuesday'] as bool,
      wednesday: json['Wednesday'] as bool,
      thursday: json['Thursday'] as bool,
      friday: json['Friday'] as bool,
      saturday: json['Saturday'] as bool,
      sunday: json['Sunday'] as bool,
      expireWithMembership: json['ExpireWithMembership'] as bool,
      validityStatus: json['ValidityStatus'] as int,
      accountId: json['AccountId'] as int,
      transactionId: json['TransactionId'] as int,
      transactionLineId: json['TransactionLineId'] as int,
      customDataSetId: json['CustomDataSetId'] as int,
      membershipId: json['MembershipId'] as int,
      membershipRewardsId: json['MembershipRewardsId'] as int,
      createdBy: json['CreatedBy'] as String,
      creationDate: json['CreationDate'] as String,
      lastUpdatedBy: json['LastUpdatedBy'] as String,
      lastUpdateDate: json['LastUpdateDate'] as String,
      siteId: json['SiteId'] as int,
      masterEntityId: json['MasterEntityId'] as int,
      synchStatus: json['SynchStatus'] as bool,
      guid: json['Guid'] as String,
      isActive: json['IsActive'] as bool,
      obligationStatus: json['ObligationStatus'] as String,
      obligationStatusId: json['ObligationStatusId'] as int,
      obligationStatusChangeDate: json['ObligationStatusChangeDate'] as String,
      accountGameExtendedDTOList: (json['AccountGameExtendedDTOList']
              as List<dynamic>?)
          ?.map(
              (e) => AccountGameExtendedDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      entityOverrideDatesDTOList: json['EntityOverrideDatesDTOList'],
      subscriptionBillingScheduleId:
          json['SubscriptionBillingScheduleId'] as int,
      isChanged: json['IsChanged'] as bool,
      isChangedRecursive: json['IsChangedRecursive'] as bool,
    );

Map<String, dynamic> _$$_AccountGameDTOToJson(_$_AccountGameDTO instance) =>
    <String, dynamic>{
      'AccountGameId': instance.accountGameId,
      'GameProfileId': instance.gameProfileId,
      'GameId': instance.gameId,
      'Quantity': instance.quantity,
      'Frequency': instance.frequency,
      'BalanceGames': instance.balanceGames,
      'LastPlayedTime': instance.lastPlayedTime,
      'FromDate': instance.fromDate,
      'ExpiryDate': instance.expiryDate,
      'EntitlementType': instance.entitlementType,
      'TicketAllowed': instance.ticketAllowed,
      'OptionalAttribute': instance.optionalAttribute,
      'Monday': instance.monday,
      'Tuesday': instance.tuesday,
      'Wednesday': instance.wednesday,
      'Thursday': instance.thursday,
      'Friday': instance.friday,
      'Saturday': instance.saturday,
      'Sunday': instance.sunday,
      'ExpireWithMembership': instance.expireWithMembership,
      'ValidityStatus': instance.validityStatus,
      'AccountId': instance.accountId,
      'TransactionId': instance.transactionId,
      'TransactionLineId': instance.transactionLineId,
      'CustomDataSetId': instance.customDataSetId,
      'MembershipId': instance.membershipId,
      'MembershipRewardsId': instance.membershipRewardsId,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdateDate': instance.lastUpdateDate,
      'SiteId': instance.siteId,
      'MasterEntityId': instance.masterEntityId,
      'SynchStatus': instance.synchStatus,
      'Guid': instance.guid,
      'IsActive': instance.isActive,
      'ObligationStatus': instance.obligationStatus,
      'ObligationStatusId': instance.obligationStatusId,
      'ObligationStatusChangeDate': instance.obligationStatusChangeDate,
      'AccountGameExtendedDTOList': instance.accountGameExtendedDTOList,
      'EntityOverrideDatesDTOList': instance.entityOverrideDatesDTOList,
      'SubscriptionBillingScheduleId': instance.subscriptionBillingScheduleId,
      'IsChanged': instance.isChanged,
      'IsChangedRecursive': instance.isChangedRecursive,
    };
