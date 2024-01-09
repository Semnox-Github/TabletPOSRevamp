// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_details_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountDetailsData _$$_AccountDetailsDataFromJson(
        Map<String, dynamic> json) =>
    _$_AccountDetailsData(
      accountId: json['AccountId'] as int,
      tagNumber: json['TagNumber'] as String,
      customerName: json['CustomerName'] as String?,
      issueDate: json['IssueDate'] as String?,
      faceValue: json['FaceValue'],
      credits: (json['Credits'] as num?)?.toDouble(),
      courtesy: (json['Courtesy'] as num?)?.toDouble(),
      bonus: (json['Bonus'] as num?)?.toDouble(),
      time: (json['Time'] as num?)?.toDouble(),
      ticketCount: json['TicketCount'] as int?,
      loyaltyPoints: (json['LoyaltyPoints'] as num?)?.toDouble(),
      creditsPlayed: (json['CreditsPlayed'] as num?)?.toDouble(),
      realTicketMode: json['RealTicketMode'] as bool?,
      vipCustomer: json['VipCustomer'] as bool?,
      ticketAllowed: json['TicketAllowed'] as bool?,
      technicianCard: json['TechnicianCard'] as String?,
      timerResetCard: json['TimerResetCard'] as bool?,
      techGames: json['TechGames'],
      validFlag: json['ValidFlag'] as bool?,
      refundFlag: json['RefundFlag'] as bool?,
      refundAmount: json['RefundAmount'],
      refundDate: json['RefundDate'],
      expiryDate: json['ExpiryDate'],
      startTime: json['StartTime'] as String?,
      lastPlayedTime: json['LastPlayedTime'] as String?,
      notes: json['Notes'] as String?,
      lastUpdateDate: json['LastUpdateDate'] as String?,
      lastUpdatedBy: json['LastUpdatedBy'] as String?,
      primaryAccount: json['PrimaryAccount'] as bool?,
      accountIdentifier: json['AccountIdentifier'] as String?,
      membershipName: json['MembershipName'] as String?,
      obligationStatus: json['ObligationStatus'] as String?,
      accountType: json['AccountType'] as String?,
      obligationStatusId: json['ObligationStatusId'] as int?,
      obligationStatusChangeDate: json['ObligationStatusChangeDate'],
      membershipId: json['MembershipId'] as int?,
      customerId: json['CustomerId'] as int?,
      uploadSiteId: json['UploadSiteId'] as int?,
      uploadTime: json['UploadTime'] as String?,
      downloadBatchId: json['DownloadBatchId'] as int?,
      refreshFromHqTime: json['RefreshFromHQTime'] as String?,
      siteId: json['SiteId'] as int?,
      masterEntityId: json['MasterEntityId'] as int?,
      synchStatus: json['SynchStatus'] as bool?,
      guid: json['Guid'] as String?,
      creationDate: json['CreationDate'] as String?,
      createdBy: json['CreatedBy'] as String?,
      accountDiscountDTOList: (json['AccountDiscountDTOList'] as List<dynamic>?)
          ?.map((e) => AccountDiscountData.fromJson(e as Map<String, dynamic>))
          .toList(),
      accountCreditPlusDTOList: (json['AccountCreditPlusDTOList']
              as List<dynamic>?)
          ?.map((e) => AccountCreditPlusDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      accountGameDTOList: (json['AccountGameDTOList'] as List<dynamic>?)
          ?.map((e) => AccountGameDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      accountRelationshipDTOList: (json['AccountRelationshipDTOList']
              as List<dynamic>?)
          ?.map((e) =>
              AccountRelationshipDTOList.fromJson(e as Map<String, dynamic>))
          .toList(),
      refundAccountGameDTOList: json['RefundAccountGameDTOList'],
      refundAccountCreditPlusDTOList: json['RefundAccountCreditPlusDTOList'],
      gamePlayDTOList: json['GamePlayDTOList'],
      accountActivityDTOList: json['AccountActivityDTOList'],
      accountSummaryDTO: json['AccountSummaryDTO'] == null
          ? null
          : AccountSummaryDTO.fromJson(
              json['AccountSummaryDTO'] as Map<String, dynamic>),
      totalCreditPlusBalance:
          (json['TotalCreditPlusBalance'] as num?)?.toDouble(),
      isChanged: json['IsChanged'] as bool?,
      totalCreditsBalance: (json['TotalCreditsBalance'] as num?)?.toDouble(),
      totalBonusBalance: (json['TotalBonusBalance'] as num?)?.toDouble(),
      totalCourtesyBalance: (json['TotalCourtesyBalance'] as num?)?.toDouble(),
      totalTimeBalance: (json['TotalTimeBalance'] as num?)?.toDouble(),
      totalGamesBalance: (json['TotalGamesBalance'] as num?)?.toDouble(),
      totalTicketsBalance: (json['TotalTicketsBalance'] as num?)?.toDouble(),
      totalVirtualPointBalance:
          (json['TotalVirtualPointBalance'] as num?)?.toDouble(),
      isChangedRecursive: json['IsChangedRecursive'] as bool?,
    );

Map<String, dynamic> _$$_AccountDetailsDataToJson(
        _$_AccountDetailsData instance) =>
    <String, dynamic>{
      'AccountId': instance.accountId,
      'TagNumber': instance.tagNumber,
      'CustomerName': instance.customerName,
      'IssueDate': instance.issueDate,
      'FaceValue': instance.faceValue,
      'Credits': instance.credits,
      'Courtesy': instance.courtesy,
      'Bonus': instance.bonus,
      'Time': instance.time,
      'TicketCount': instance.ticketCount,
      'LoyaltyPoints': instance.loyaltyPoints,
      'CreditsPlayed': instance.creditsPlayed,
      'RealTicketMode': instance.realTicketMode,
      'VipCustomer': instance.vipCustomer,
      'TicketAllowed': instance.ticketAllowed,
      'TechnicianCard': instance.technicianCard,
      'TimerResetCard': instance.timerResetCard,
      'TechGames': instance.techGames,
      'ValidFlag': instance.validFlag,
      'RefundFlag': instance.refundFlag,
      'RefundAmount': instance.refundAmount,
      'RefundDate': instance.refundDate,
      'ExpiryDate': instance.expiryDate,
      'StartTime': instance.startTime,
      'LastPlayedTime': instance.lastPlayedTime,
      'Notes': instance.notes,
      'LastUpdateDate': instance.lastUpdateDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'PrimaryAccount': instance.primaryAccount,
      'AccountIdentifier': instance.accountIdentifier,
      'MembershipName': instance.membershipName,
      'ObligationStatus': instance.obligationStatus,
      'AccountType': instance.accountType,
      'ObligationStatusId': instance.obligationStatusId,
      'ObligationStatusChangeDate': instance.obligationStatusChangeDate,
      'MembershipId': instance.membershipId,
      'CustomerId': instance.customerId,
      'UploadSiteId': instance.uploadSiteId,
      'UploadTime': instance.uploadTime,
      'DownloadBatchId': instance.downloadBatchId,
      'RefreshFromHQTime': instance.refreshFromHqTime,
      'SiteId': instance.siteId,
      'MasterEntityId': instance.masterEntityId,
      'SynchStatus': instance.synchStatus,
      'Guid': instance.guid,
      'CreationDate': instance.creationDate,
      'CreatedBy': instance.createdBy,
      'AccountDiscountDTOList': instance.accountDiscountDTOList,
      'AccountCreditPlusDTOList': instance.accountCreditPlusDTOList,
      'AccountGameDTOList': instance.accountGameDTOList,
      'AccountRelationshipDTOList': instance.accountRelationshipDTOList,
      'RefundAccountGameDTOList': instance.refundAccountGameDTOList,
      'RefundAccountCreditPlusDTOList': instance.refundAccountCreditPlusDTOList,
      'GamePlayDTOList': instance.gamePlayDTOList,
      'AccountActivityDTOList': instance.accountActivityDTOList,
      'AccountSummaryDTO': instance.accountSummaryDTO,
      'TotalCreditPlusBalance': instance.totalCreditPlusBalance,
      'IsChanged': instance.isChanged,
      'TotalCreditsBalance': instance.totalCreditsBalance,
      'TotalBonusBalance': instance.totalBonusBalance,
      'TotalCourtesyBalance': instance.totalCourtesyBalance,
      'TotalTimeBalance': instance.totalTimeBalance,
      'TotalGamesBalance': instance.totalGamesBalance,
      'TotalTicketsBalance': instance.totalTicketsBalance,
      'TotalVirtualPointBalance': instance.totalVirtualPointBalance,
      'IsChangedRecursive': instance.isChangedRecursive,
    };
