// To parse this JSON data, do
//
//     final accountDetailsResponse = accountDetailsResponseFromJson(jsonString);

import 'dart:convert';

AccountDetailsResponse accountDetailsResponseFromJson(String str) =>
    AccountDetailsResponse.fromJson(json.decode(str));

String accountDetailsResponseToJson(AccountDetailsResponse data) =>
    json.encode(data.toJson());

class AccountDetailsResponse {
  AccountDetailsResponse({
    this.data,
    this.currentPageNo,
    this.totalCount,
    this.barCode,
    this.token,
  });

  List<Datum>? data;
  int? currentPageNo;
  int? totalCount;
  String? barCode;
  String? token;

  factory AccountDetailsResponse.fromJson(Map<String, dynamic> json) =>
      AccountDetailsResponse(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        currentPageNo: json["currentPageNo"],
        totalCount: json["totalCount"],
        barCode: json["barCode"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "currentPageNo": currentPageNo,
        "totalCount": totalCount,
        "barCode": barCode,
        "token": token,
      };
}

class Datum {
  Datum({
    this.accountId,
    this.tagNumber,
    this.customerName,
    this.issueDate,
    this.faceValue,
    this.credits,
    this.courtesy,
    this.bonus,
    this.time,
    this.ticketCount,
    this.loyaltyPoints,
    this.creditsPlayed,
    this.realTicketMode,
    this.vipCustomer,
    this.ticketAllowed,
    this.technicianCard,
    this.timerResetCard,
    this.techGames,
    this.validFlag,
    this.refundFlag,
    this.refundAmount,
    this.refundDate,
    this.expiryDate,
    this.startTime,
    this.lastPlayedTime,
    this.notes,
    this.lastUpdateDate,
    this.lastUpdatedBy,
    this.primaryAccount,
    this.accountIdentifier,
    this.membershipName,
    this.obligationStatus,
    this.accountType,
    this.obligationStatusId,
    this.obligationStatusChangeDate,
    this.membershipId,
    this.customerId,
    this.uploadSiteId,
    this.uploadTime,
    this.downloadBatchId,
    this.refreshFromHqTime,
    this.siteId,
    this.masterEntityId,
    this.synchStatus,
    this.guid,
    this.creationDate,
    this.createdBy,
    this.accountDiscountDtoList,
    this.accountCreditPlusDtoList,
    this.accountGameDtoList,
    this.accountRelationshipDtoList,
    this.refundAccountGameDtoList,
    this.refundAccountCreditPlusDtoList,
    this.gamePlayDtoList,
    this.accountActivityDtoList,
    this.accountSummaryDto,
    this.totalCreditPlusBalance,
    this.isChanged,
    this.totalCreditsBalance,
    this.totalBonusBalance,
    this.totalCourtesyBalance,
    this.totalTimeBalance,
    this.totalGamesBalance,
    this.totalTicketsBalance,
    this.totalVirtualPointBalance,
    this.isChangedRecursive,
  });

  int? accountId;
  String? tagNumber;
  String? customerName;
  DateTime? issueDate;
  int? faceValue;
  int? credits;
  int? courtesy;
  int? bonus;
  int? time;
  int? ticketCount;
  int? loyaltyPoints;
  int? creditsPlayed;
  bool? realTicketMode;
  bool? vipCustomer;
  bool? ticketAllowed;
  String? technicianCard;
  bool? timerResetCard;
  dynamic techGames;
  bool? validFlag;
  bool? refundFlag;
  dynamic refundAmount;
  dynamic refundDate;
  dynamic expiryDate;
  DateTime? startTime;
  DateTime? lastPlayedTime;
  String? notes;
  DateTime? lastUpdateDate;
  LastUpdatedBy? lastUpdatedBy;
  bool? primaryAccount;
  String? accountIdentifier;
  String? membershipName;
  ObligationStatus? obligationStatus;
  String? accountType;
  int? obligationStatusId;
  dynamic obligationStatusChangeDate;
  int? membershipId;
  int? customerId;
  int? uploadSiteId;
  DateTime? uploadTime;
  int? downloadBatchId;
  DateTime? refreshFromHqTime;
  int? siteId;
  int? masterEntityId;
  bool? synchStatus;
  String? guid;
  DateTime? creationDate;
  String? createdBy;
  List<AccountDiscountDtoList>? accountDiscountDtoList;
  List<AccountCreditPlusDtoList>? accountCreditPlusDtoList;
  List<AccountGameDtoList>? accountGameDtoList;
  List<AccountRelationshipDtoList>? accountRelationshipDtoList;
  dynamic refundAccountGameDtoList;
  dynamic refundAccountCreditPlusDtoList;
  dynamic gamePlayDtoList;
  dynamic accountActivityDtoList;
  AccountSummaryDto? accountSummaryDto;
  int? totalCreditPlusBalance;
  bool? isChanged;
  int? totalCreditsBalance;
  double? totalBonusBalance;
  int? totalCourtesyBalance;
  int? totalTimeBalance;
  int? totalGamesBalance;
  int? totalTicketsBalance;
  int? totalVirtualPointBalance;
  bool? isChangedRecursive;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        accountId: json["AccountId"],
        tagNumber: json["TagNumber"],
        customerName: json["CustomerName"],
        issueDate: json["IssueDate"] == null
            ? null
            : DateTime.parse(json["IssueDate"]),
        faceValue: json["FaceValue"],
        credits: json["Credits"],
        courtesy: json["Courtesy"],
        bonus: json["Bonus"],
        time: json["Time"],
        ticketCount: json["TicketCount"],
        loyaltyPoints: json["LoyaltyPoints"],
        creditsPlayed: json["CreditsPlayed"],
        realTicketMode: json["RealTicketMode"],
        vipCustomer: json["VipCustomer"],
        ticketAllowed: json["TicketAllowed"],
        technicianCard: json["TechnicianCard"],
        timerResetCard: json["TimerResetCard"],
        techGames: json["TechGames"],
        validFlag: json["ValidFlag"],
        refundFlag: json["RefundFlag"],
        refundAmount: json["RefundAmount"],
        refundDate: json["RefundDate"],
        expiryDate: json["ExpiryDate"],
        startTime: json["StartTime"] == null
            ? null
            : DateTime.parse(json["StartTime"]),
        lastPlayedTime: json["LastPlayedTime"] == null
            ? null
            : DateTime.parse(json["LastPlayedTime"]),
        notes: json["Notes"],
        lastUpdateDate: json["LastUpdateDate"] == null
            ? null
            : DateTime.parse(json["LastUpdateDate"]),
        lastUpdatedBy: lastUpdatedByValues.map[json["LastUpdatedBy"]]!,
        primaryAccount: json["PrimaryAccount"],
        accountIdentifier: json["AccountIdentifier"],
        membershipName: json["MembershipName"],
        obligationStatus: obligationStatusValues.map[json["ObligationStatus"]]!,
        accountType: json["AccountType"],
        obligationStatusId: json["ObligationStatusId"],
        obligationStatusChangeDate: json["ObligationStatusChangeDate"],
        membershipId: json["MembershipId"],
        customerId: json["CustomerId"],
        uploadSiteId: json["UploadSiteId"],
        uploadTime: json["UploadTime"] == null
            ? null
            : DateTime.parse(json["UploadTime"]),
        downloadBatchId: json["DownloadBatchId"],
        refreshFromHqTime: json["RefreshFromHQTime"] == null
            ? null
            : DateTime.parse(json["RefreshFromHQTime"]),
        siteId: json["SiteId"],
        masterEntityId: json["MasterEntityId"],
        synchStatus: json["SynchStatus"],
        guid: json["Guid"],
        creationDate: json["CreationDate"] == null
            ? null
            : DateTime.parse(json["CreationDate"]),
        createdBy: json["CreatedBy"],
        accountDiscountDtoList: json["AccountDiscountDTOList"] == null
            ? []
            : List<AccountDiscountDtoList>.from(json["AccountDiscountDTOList"]!
                .map((x) => AccountDiscountDtoList.fromJson(x))),
        accountCreditPlusDtoList: json["AccountCreditPlusDTOList"] == null
            ? []
            : List<AccountCreditPlusDtoList>.from(
                json["AccountCreditPlusDTOList"]!
                    .map((x) => AccountCreditPlusDtoList.fromJson(x))),
        accountGameDtoList: json["AccountGameDTOList"] == null
            ? []
            : List<AccountGameDtoList>.from(json["AccountGameDTOList"]!
                .map((x) => AccountGameDtoList.fromJson(x))),
        accountRelationshipDtoList: json["AccountRelationshipDTOList"] == null
            ? []
            : List<AccountRelationshipDtoList>.from(
                json["AccountRelationshipDTOList"]!
                    .map((x) => AccountRelationshipDtoList.fromJson(x))),
        refundAccountGameDtoList: json["RefundAccountGameDTOList"],
        refundAccountCreditPlusDtoList: json["RefundAccountCreditPlusDTOList"],
        gamePlayDtoList: json["GamePlayDTOList"],
        accountActivityDtoList: json["AccountActivityDTOList"],
        accountSummaryDto: json["AccountSummaryDTO"] == null
            ? null
            : AccountSummaryDto.fromJson(json["AccountSummaryDTO"]),
        totalCreditPlusBalance: json["TotalCreditPlusBalance"],
        isChanged: json["IsChanged"],
        totalCreditsBalance: json["TotalCreditsBalance"],
        totalBonusBalance: json["TotalBonusBalance"]?.toDouble(),
        totalCourtesyBalance: json["TotalCourtesyBalance"],
        totalTimeBalance: json["TotalTimeBalance"],
        totalGamesBalance: json["TotalGamesBalance"],
        totalTicketsBalance: json["TotalTicketsBalance"],
        totalVirtualPointBalance: json["TotalVirtualPointBalance"],
        isChangedRecursive: json["IsChangedRecursive"],
      );

  Map<String, dynamic> toJson() => {
        "AccountId": accountId,
        "TagNumber": tagNumber,
        "CustomerName": customerName,
        "IssueDate": issueDate?.toIso8601String(),
        "FaceValue": faceValue,
        "Credits": credits,
        "Courtesy": courtesy,
        "Bonus": bonus,
        "Time": time,
        "TicketCount": ticketCount,
        "LoyaltyPoints": loyaltyPoints,
        "CreditsPlayed": creditsPlayed,
        "RealTicketMode": realTicketMode,
        "VipCustomer": vipCustomer,
        "TicketAllowed": ticketAllowed,
        "TechnicianCard": technicianCard,
        "TimerResetCard": timerResetCard,
        "TechGames": techGames,
        "ValidFlag": validFlag,
        "RefundFlag": refundFlag,
        "RefundAmount": refundAmount,
        "RefundDate": refundDate,
        "ExpiryDate": expiryDate,
        "StartTime": startTime?.toIso8601String(),
        "LastPlayedTime": lastPlayedTime?.toIso8601String(),
        "Notes": notes,
        "LastUpdateDate": lastUpdateDate?.toIso8601String(),
        "LastUpdatedBy": lastUpdatedByValues.reverse[lastUpdatedBy],
        "PrimaryAccount": primaryAccount,
        "AccountIdentifier": accountIdentifier,
        "MembershipName": membershipName,
        "ObligationStatus": obligationStatusValues.reverse[obligationStatus],
        "AccountType": accountType,
        "ObligationStatusId": obligationStatusId,
        "ObligationStatusChangeDate": obligationStatusChangeDate,
        "MembershipId": membershipId,
        "CustomerId": customerId,
        "UploadSiteId": uploadSiteId,
        "UploadTime": uploadTime?.toIso8601String(),
        "DownloadBatchId": downloadBatchId,
        "RefreshFromHQTime": refreshFromHqTime?.toIso8601String(),
        "SiteId": siteId,
        "MasterEntityId": masterEntityId,
        "SynchStatus": synchStatus,
        "Guid": guid,
        "CreationDate": creationDate?.toIso8601String(),
        "CreatedBy": createdBy,
        "AccountDiscountDTOList": accountDiscountDtoList == null
            ? []
            : List<dynamic>.from(
                accountDiscountDtoList!.map((x) => x.toJson())),
        "AccountCreditPlusDTOList": accountCreditPlusDtoList == null
            ? []
            : List<dynamic>.from(
                accountCreditPlusDtoList!.map((x) => x.toJson())),
        "AccountGameDTOList": accountGameDtoList == null
            ? []
            : List<dynamic>.from(accountGameDtoList!.map((x) => x.toJson())),
        "AccountRelationshipDTOList": accountRelationshipDtoList == null
            ? []
            : List<dynamic>.from(
                accountRelationshipDtoList!.map((x) => x.toJson())),
        "RefundAccountGameDTOList": refundAccountGameDtoList,
        "RefundAccountCreditPlusDTOList": refundAccountCreditPlusDtoList,
        "GamePlayDTOList": gamePlayDtoList,
        "AccountActivityDTOList": accountActivityDtoList,
        "AccountSummaryDTO": accountSummaryDto?.toJson(),
        "TotalCreditPlusBalance": totalCreditPlusBalance,
        "IsChanged": isChanged,
        "TotalCreditsBalance": totalCreditsBalance,
        "TotalBonusBalance": totalBonusBalance,
        "TotalCourtesyBalance": totalCourtesyBalance,
        "TotalTimeBalance": totalTimeBalance,
        "TotalGamesBalance": totalGamesBalance,
        "TotalTicketsBalance": totalTicketsBalance,
        "TotalVirtualPointBalance": totalVirtualPointBalance,
        "IsChangedRecursive": isChangedRecursive,
      };
}

class AccountCreditPlusDtoList {
  AccountCreditPlusDtoList({
    this.accountCreditPlusId,
    this.accountId,
    this.creditPlusType,
    this.creditPlus,
    this.sourceCreditPlusValue,
    this.creditPlusBalance,
    this.periodFrom,
    this.periodTo,
    this.extendOnReload,
    this.refundable,
    this.timeFrom,
    this.timeTo,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
    this.ticketAllowed,
    this.pauseAllowed,
    this.remarks,
    this.expireWithMembership,
    this.transactionId,
    this.transactionLineId,
    this.numberOfDays,
    this.minimumSaleAmount,
    this.loyaltyRuleId,
    this.playStartTime,
    this.validityStatus,
    this.forMembershipOnly,
    this.membershipId,
    this.membershipRewardsId,
    this.obligationStatus,
    this.obligationStatusId,
    this.obligationStatusChangeDate,
    this.creationDate,
    this.lastUpdatedBy,
    this.lastUpdateDate,
    this.siteId,
    this.masterEntityId,
    this.synchStatus,
    this.guid,
    this.isActive,
    this.createdBy,
    this.accountCreditPlusConsumptionDtoList,
    this.accountCreditPlusPurchaseCriteriaDtoList,
    this.entityOverrideDatesDtoList,
    this.isChanged,
    this.isChangedRecursive,
    this.sourceCreditPlusId,
    this.subscriptionBillingScheduleId,
  });

  int? accountCreditPlusId;
  int? accountId;
  int? creditPlusType;
  double? creditPlus;
  int? sourceCreditPlusValue;
  double? creditPlusBalance;
  DateTime? periodFrom;
  DateTime? periodTo;
  bool? extendOnReload;
  bool? refundable;
  dynamic timeFrom;
  dynamic timeTo;
  bool? monday;
  bool? tuesday;
  bool? wednesday;
  bool? thursday;
  bool? friday;
  bool? saturday;
  bool? sunday;
  bool? ticketAllowed;
  bool? pauseAllowed;
  String? remarks;
  bool? expireWithMembership;
  int? transactionId;
  int? transactionLineId;
  dynamic numberOfDays;
  dynamic minimumSaleAmount;
  int? loyaltyRuleId;
  dynamic playStartTime;
  int? validityStatus;
  bool? forMembershipOnly;
  int? membershipId;
  int? membershipRewardsId;
  ObligationStatus? obligationStatus;
  int? obligationStatusId;
  DateTime? obligationStatusChangeDate;
  DateTime? creationDate;
  LastUpdatedBy? lastUpdatedBy;
  DateTime? lastUpdateDate;
  int? siteId;
  int? masterEntityId;
  bool? synchStatus;
  String? guid;
  bool? isActive;
  LastUpdatedBy? createdBy;
  List<dynamic>? accountCreditPlusConsumptionDtoList;
  List<dynamic>? accountCreditPlusPurchaseCriteriaDtoList;
  List<dynamic>? entityOverrideDatesDtoList;
  bool? isChanged;
  bool? isChangedRecursive;
  int? sourceCreditPlusId;
  int? subscriptionBillingScheduleId;

  factory AccountCreditPlusDtoList.fromJson(Map<String, dynamic> json) =>
      AccountCreditPlusDtoList(
        accountCreditPlusId: json["AccountCreditPlusId"],
        accountId: json["AccountId"],
        creditPlusType: json["CreditPlusType"],
        creditPlus: json["CreditPlus"]?.toDouble(),
        sourceCreditPlusValue: json["SourceCreditPlusValue"],
        creditPlusBalance: json["CreditPlusBalance"]?.toDouble(),
        periodFrom: json["PeriodFrom"] == null
            ? null
            : DateTime.parse(json["PeriodFrom"]),
        periodTo:
            json["PeriodTo"] == null ? null : DateTime.parse(json["PeriodTo"]),
        extendOnReload: json["ExtendOnReload"],
        refundable: json["Refundable"],
        timeFrom: json["TimeFrom"],
        timeTo: json["TimeTo"],
        monday: json["Monday"],
        tuesday: json["Tuesday"],
        wednesday: json["Wednesday"],
        thursday: json["Thursday"],
        friday: json["Friday"],
        saturday: json["Saturday"],
        sunday: json["Sunday"],
        ticketAllowed: json["TicketAllowed"],
        pauseAllowed: json["PauseAllowed"],
        remarks: json["Remarks"],
        expireWithMembership: json["ExpireWithMembership"],
        transactionId: json["TransactionId"],
        transactionLineId: json["TransactionLineId"],
        numberOfDays: json["NumberOfDays"],
        minimumSaleAmount: json["MinimumSaleAmount"],
        loyaltyRuleId: json["LoyaltyRuleId"],
        playStartTime: json["PlayStartTime"],
        validityStatus: json["ValidityStatus"],
        forMembershipOnly: json["ForMembershipOnly"],
        membershipId: json["MembershipId"],
        membershipRewardsId: json["MembershipRewardsId"],
        obligationStatus: obligationStatusValues.map[json["ObligationStatus"]]!,
        obligationStatusId: json["ObligationStatusId"],
        obligationStatusChangeDate: json["ObligationStatusChangeDate"] == null
            ? null
            : DateTime.parse(json["ObligationStatusChangeDate"]),
        creationDate: json["CreationDate"] == null
            ? null
            : DateTime.parse(json["CreationDate"]),
        lastUpdatedBy: lastUpdatedByValues.map[json["LastUpdatedBy"]]!,
        lastUpdateDate: json["LastUpdateDate"] == null
            ? null
            : DateTime.parse(json["LastUpdateDate"]),
        siteId: json["SiteId"],
        masterEntityId: json["MasterEntityId"],
        synchStatus: json["SynchStatus"],
        guid: json["Guid"],
        isActive: json["IsActive"],
        createdBy: lastUpdatedByValues.map[json["CreatedBy"]]!,
        accountCreditPlusConsumptionDtoList:
            json["AccountCreditPlusConsumptionDTOList"] == null
                ? []
                : List<dynamic>.from(
                    json["AccountCreditPlusConsumptionDTOList"]!.map((x) => x)),
        accountCreditPlusPurchaseCriteriaDtoList:
            json["AccountCreditPlusPurchaseCriteriaDTOList"] == null
                ? []
                : List<dynamic>.from(
                    json["AccountCreditPlusPurchaseCriteriaDTOList"]!
                        .map((x) => x)),
        entityOverrideDatesDtoList: json["EntityOverrideDatesDTOList"] == null
            ? []
            : List<dynamic>.from(
                json["EntityOverrideDatesDTOList"]!.map((x) => x)),
        isChanged: json["IsChanged"],
        isChangedRecursive: json["IsChangedRecursive"],
        sourceCreditPlusId: json["SourceCreditPlusId"],
        subscriptionBillingScheduleId: json["SubscriptionBillingScheduleId"],
      );

  Map<String, dynamic> toJson() => {
        "AccountCreditPlusId": accountCreditPlusId,
        "AccountId": accountId,
        "CreditPlusType": creditPlusType,
        "CreditPlus": creditPlus,
        "SourceCreditPlusValue": sourceCreditPlusValue,
        "CreditPlusBalance": creditPlusBalance,
        "PeriodFrom": periodFrom?.toIso8601String(),
        "PeriodTo": periodTo?.toIso8601String(),
        "ExtendOnReload": extendOnReload,
        "Refundable": refundable,
        "TimeFrom": timeFrom,
        "TimeTo": timeTo,
        "Monday": monday,
        "Tuesday": tuesday,
        "Wednesday": wednesday,
        "Thursday": thursday,
        "Friday": friday,
        "Saturday": saturday,
        "Sunday": sunday,
        "TicketAllowed": ticketAllowed,
        "PauseAllowed": pauseAllowed,
        "Remarks": remarks,
        "ExpireWithMembership": expireWithMembership,
        "TransactionId": transactionId,
        "TransactionLineId": transactionLineId,
        "NumberOfDays": numberOfDays,
        "MinimumSaleAmount": minimumSaleAmount,
        "LoyaltyRuleId": loyaltyRuleId,
        "PlayStartTime": playStartTime,
        "ValidityStatus": validityStatus,
        "ForMembershipOnly": forMembershipOnly,
        "MembershipId": membershipId,
        "MembershipRewardsId": membershipRewardsId,
        "ObligationStatus": obligationStatusValues.reverse[obligationStatus],
        "ObligationStatusId": obligationStatusId,
        "ObligationStatusChangeDate":
            obligationStatusChangeDate?.toIso8601String(),
        "CreationDate": creationDate?.toIso8601String(),
        "LastUpdatedBy": lastUpdatedByValues.reverse[lastUpdatedBy],
        "LastUpdateDate": lastUpdateDate?.toIso8601String(),
        "SiteId": siteId,
        "MasterEntityId": masterEntityId,
        "SynchStatus": synchStatus,
        "Guid": guid,
        "IsActive": isActive,
        "CreatedBy": lastUpdatedByValues.reverse[createdBy],
        "AccountCreditPlusConsumptionDTOList":
            accountCreditPlusConsumptionDtoList == null
                ? []
                : List<dynamic>.from(
                    accountCreditPlusConsumptionDtoList!.map((x) => x)),
        "AccountCreditPlusPurchaseCriteriaDTOList":
            accountCreditPlusPurchaseCriteriaDtoList == null
                ? []
                : List<dynamic>.from(
                    accountCreditPlusPurchaseCriteriaDtoList!.map((x) => x)),
        "EntityOverrideDatesDTOList": entityOverrideDatesDtoList == null
            ? []
            : List<dynamic>.from(entityOverrideDatesDtoList!.map((x) => x)),
        "IsChanged": isChanged,
        "IsChangedRecursive": isChangedRecursive,
        "SourceCreditPlusId": sourceCreditPlusId,
        "SubscriptionBillingScheduleId": subscriptionBillingScheduleId,
      };
}

enum LastUpdatedBy { SEMNOX, EMPTY }

final lastUpdatedByValues =
    EnumValues({"": LastUpdatedBy.EMPTY, "semnox": LastUpdatedBy.SEMNOX});

enum ObligationStatus { ACTIVATED }

final obligationStatusValues =
    EnumValues({"ACTIVATED": ObligationStatus.ACTIVATED});

class AccountDiscountDtoList {
  AccountDiscountDtoList({
    this.accountDiscountId,
    this.accountId,
    this.discountId,
    this.expiryDate,
    this.createdBy,
    this.creationDate,
    this.lastUpdatedUser,
    this.lastUpdatedDate,
    this.internetKey,
    this.accountTypeId,
    this.transactionId,
    this.lineId,
    this.taskId,
    this.obligationStatus,
    this.obligationStatusId,
    this.obligationStatusChangeDate,
    this.isActive,
    this.siteId,
    this.masterEntityId,
    this.synchStatus,
    this.guid,
    this.expireWithMembership,
    this.validityStatus,
    this.membershipRewardsId,
    this.membershipId,
    this.subscriptionBillingScheduleId,
    this.isChanged,
  });

  int? accountDiscountId;
  int? accountId;
  int? discountId;
  dynamic expiryDate;
  LastUpdatedBy? createdBy;
  DateTime? creationDate;
  LastUpdatedBy? lastUpdatedUser;
  DateTime? lastUpdatedDate;
  int? internetKey;
  int? accountTypeId;
  int? transactionId;
  int? lineId;
  int? taskId;
  ObligationStatus? obligationStatus;
  int? obligationStatusId;
  DateTime? obligationStatusChangeDate;
  bool? isActive;
  int? siteId;
  int? masterEntityId;
  bool? synchStatus;
  String? guid;
  String? expireWithMembership;
  int? validityStatus;
  int? membershipRewardsId;
  int? membershipId;
  int? subscriptionBillingScheduleId;
  bool? isChanged;

  factory AccountDiscountDtoList.fromJson(Map<String, dynamic> json) =>
      AccountDiscountDtoList(
        accountDiscountId: json["AccountDiscountId"],
        accountId: json["AccountId"],
        discountId: json["DiscountId"],
        expiryDate: json["ExpiryDate"],
        createdBy: lastUpdatedByValues.map[json["CreatedBy"]]!,
        creationDate: json["CreationDate"] == null
            ? null
            : DateTime.parse(json["CreationDate"]),
        lastUpdatedUser: lastUpdatedByValues.map[json["LastUpdatedUser"]]!,
        lastUpdatedDate: json["LastUpdatedDate"] == null
            ? null
            : DateTime.parse(json["LastUpdatedDate"]),
        internetKey: json["InternetKey"],
        accountTypeId: json["AccountTypeId"],
        transactionId: json["TransactionId"],
        lineId: json["LineId"],
        taskId: json["TaskId"],
        obligationStatus: obligationStatusValues.map[json["ObligationStatus"]]!,
        obligationStatusId: json["ObligationStatusId"],
        obligationStatusChangeDate: json["ObligationStatusChangeDate"] == null
            ? null
            : DateTime.parse(json["ObligationStatusChangeDate"]),
        isActive: json["IsActive"],
        siteId: json["SiteId"],
        masterEntityId: json["MasterEntityId"],
        synchStatus: json["SynchStatus"],
        guid: json["Guid"],
        expireWithMembership: json["ExpireWithMembership"],
        validityStatus: json["ValidityStatus"],
        membershipRewardsId: json["MembershipRewardsId"],
        membershipId: json["MembershipId"],
        subscriptionBillingScheduleId: json["SubscriptionBillingScheduleId"],
        isChanged: json["IsChanged"],
      );

  Map<String, dynamic> toJson() => {
        "AccountDiscountId": accountDiscountId,
        "AccountId": accountId,
        "DiscountId": discountId,
        "ExpiryDate": expiryDate,
        "CreatedBy": lastUpdatedByValues.reverse[createdBy],
        "CreationDate": creationDate?.toIso8601String(),
        "LastUpdatedUser": lastUpdatedByValues.reverse[lastUpdatedUser],
        "LastUpdatedDate": lastUpdatedDate?.toIso8601String(),
        "InternetKey": internetKey,
        "AccountTypeId": accountTypeId,
        "TransactionId": transactionId,
        "LineId": lineId,
        "TaskId": taskId,
        "ObligationStatus": obligationStatusValues.reverse[obligationStatus],
        "ObligationStatusId": obligationStatusId,
        "ObligationStatusChangeDate":
            obligationStatusChangeDate?.toIso8601String(),
        "IsActive": isActive,
        "SiteId": siteId,
        "MasterEntityId": masterEntityId,
        "SynchStatus": synchStatus,
        "Guid": guid,
        "ExpireWithMembership": expireWithMembership,
        "ValidityStatus": validityStatus,
        "MembershipRewardsId": membershipRewardsId,
        "MembershipId": membershipId,
        "SubscriptionBillingScheduleId": subscriptionBillingScheduleId,
        "IsChanged": isChanged,
      };
}

class AccountGameDtoList {
  AccountGameDtoList({
    this.accountGameId,
    this.gameProfileId,
    this.gameId,
    this.quantity,
    this.frequency,
    this.balanceGames,
    this.lastPlayedTime,
    this.fromDate,
    this.expiryDate,
    this.entitlementType,
    this.ticketAllowed,
    this.optionalAttribute,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
    this.expireWithMembership,
    this.validityStatus,
    this.accountId,
    this.transactionId,
    this.transactionLineId,
    this.customDataSetId,
    this.membershipId,
    this.membershipRewardsId,
    this.createdBy,
    this.creationDate,
    this.lastUpdatedBy,
    this.lastUpdateDate,
    this.siteId,
    this.masterEntityId,
    this.synchStatus,
    this.guid,
    this.isActive,
    this.obligationStatus,
    this.obligationStatusId,
    this.obligationStatusChangeDate,
    this.accountGameExtendedDtoList,
    this.entityOverrideDatesDtoList,
    this.subscriptionBillingScheduleId,
    this.isChanged,
    this.isChangedRecursive,
  });

  int? accountGameId;
  int? gameProfileId;
  int? gameId;
  int? quantity;
  String? frequency;
  int? balanceGames;
  dynamic lastPlayedTime;
  DateTime? fromDate;
  DateTime? expiryDate;
  String? entitlementType;
  bool? ticketAllowed;
  String? optionalAttribute;
  bool? monday;
  bool? tuesday;
  bool? wednesday;
  bool? thursday;
  bool? friday;
  bool? saturday;
  bool? sunday;
  bool? expireWithMembership;
  int? validityStatus;
  int? accountId;
  int? transactionId;
  int? transactionLineId;
  int? customDataSetId;
  int? membershipId;
  int? membershipRewardsId;
  LastUpdatedBy? createdBy;
  DateTime? creationDate;
  LastUpdatedBy? lastUpdatedBy;
  DateTime? lastUpdateDate;
  int? siteId;
  int? masterEntityId;
  bool? synchStatus;
  String? guid;
  bool? isActive;
  ObligationStatus? obligationStatus;
  int? obligationStatusId;
  DateTime? obligationStatusChangeDate;
  dynamic accountGameExtendedDtoList;
  dynamic entityOverrideDatesDtoList;
  int? subscriptionBillingScheduleId;
  bool? isChanged;
  bool? isChangedRecursive;

  factory AccountGameDtoList.fromJson(Map<String, dynamic> json) =>
      AccountGameDtoList(
        accountGameId: json["AccountGameId"],
        gameProfileId: json["GameProfileId"],
        gameId: json["GameId"],
        quantity: json["Quantity"],
        frequency: json["Frequency"],
        balanceGames: json["BalanceGames"],
        lastPlayedTime: json["LastPlayedTime"],
        fromDate:
            json["FromDate"] == null ? null : DateTime.parse(json["FromDate"]),
        expiryDate: json["ExpiryDate"] == null
            ? null
            : DateTime.parse(json["ExpiryDate"]),
        entitlementType: json["EntitlementType"],
        ticketAllowed: json["TicketAllowed"],
        optionalAttribute: json["OptionalAttribute"],
        monday: json["Monday"],
        tuesday: json["Tuesday"],
        wednesday: json["Wednesday"],
        thursday: json["Thursday"],
        friday: json["Friday"],
        saturday: json["Saturday"],
        sunday: json["Sunday"],
        expireWithMembership: json["ExpireWithMembership"],
        validityStatus: json["ValidityStatus"],
        accountId: json["AccountId"],
        transactionId: json["TransactionId"],
        transactionLineId: json["TransactionLineId"],
        customDataSetId: json["CustomDataSetId"],
        membershipId: json["MembershipId"],
        membershipRewardsId: json["MembershipRewardsId"],
        createdBy: lastUpdatedByValues.map[json["CreatedBy"]]!,
        creationDate: json["CreationDate"] == null
            ? null
            : DateTime.parse(json["CreationDate"]),
        lastUpdatedBy: lastUpdatedByValues.map[json["LastUpdatedBy"]]!,
        lastUpdateDate: json["LastUpdateDate"] == null
            ? null
            : DateTime.parse(json["LastUpdateDate"]),
        siteId: json["SiteId"],
        masterEntityId: json["MasterEntityId"],
        synchStatus: json["SynchStatus"],
        guid: json["Guid"],
        isActive: json["IsActive"],
        obligationStatus: obligationStatusValues.map[json["ObligationStatus"]]!,
        obligationStatusId: json["ObligationStatusId"],
        obligationStatusChangeDate: json["ObligationStatusChangeDate"] == null
            ? null
            : DateTime.parse(json["ObligationStatusChangeDate"]),
        accountGameExtendedDtoList: json["AccountGameExtendedDTOList"],
        entityOverrideDatesDtoList: json["EntityOverrideDatesDTOList"],
        subscriptionBillingScheduleId: json["SubscriptionBillingScheduleId"],
        isChanged: json["IsChanged"],
        isChangedRecursive: json["IsChangedRecursive"],
      );

  Map<String, dynamic> toJson() => {
        "AccountGameId": accountGameId,
        "GameProfileId": gameProfileId,
        "GameId": gameId,
        "Quantity": quantity,
        "Frequency": frequency,
        "BalanceGames": balanceGames,
        "LastPlayedTime": lastPlayedTime,
        "FromDate": fromDate?.toIso8601String(),
        "ExpiryDate": expiryDate?.toIso8601String(),
        "EntitlementType": entitlementType,
        "TicketAllowed": ticketAllowed,
        "OptionalAttribute": optionalAttribute,
        "Monday": monday,
        "Tuesday": tuesday,
        "Wednesday": wednesday,
        "Thursday": thursday,
        "Friday": friday,
        "Saturday": saturday,
        "Sunday": sunday,
        "ExpireWithMembership": expireWithMembership,
        "ValidityStatus": validityStatus,
        "AccountId": accountId,
        "TransactionId": transactionId,
        "TransactionLineId": transactionLineId,
        "CustomDataSetId": customDataSetId,
        "MembershipId": membershipId,
        "MembershipRewardsId": membershipRewardsId,
        "CreatedBy": lastUpdatedByValues.reverse[createdBy],
        "CreationDate": creationDate?.toIso8601String(),
        "LastUpdatedBy": lastUpdatedByValues.reverse[lastUpdatedBy],
        "LastUpdateDate": lastUpdateDate?.toIso8601String(),
        "SiteId": siteId,
        "MasterEntityId": masterEntityId,
        "SynchStatus": synchStatus,
        "Guid": guid,
        "IsActive": isActive,
        "ObligationStatus": obligationStatusValues.reverse[obligationStatus],
        "ObligationStatusId": obligationStatusId,
        "ObligationStatusChangeDate":
            obligationStatusChangeDate?.toIso8601String(),
        "AccountGameExtendedDTOList": accountGameExtendedDtoList,
        "EntityOverrideDatesDTOList": entityOverrideDatesDtoList,
        "SubscriptionBillingScheduleId": subscriptionBillingScheduleId,
        "IsChanged": isChanged,
        "IsChangedRecursive": isChangedRecursive,
      };
}

class AccountRelationshipDtoList {
  AccountRelationshipDtoList({
    this.accountRelationshipId,
    this.accountId,
    this.relatedAccountId,
    this.isActive,
    this.createdBy,
    this.creationDate,
    this.lastUpdatedBy,
    this.lastUpdateDate,
    this.siteId,
    this.masterEntityId,
    this.synchStatus,
    this.guid,
    this.dailyLimitPercentage,
    this.isChanged,
  });

  int? accountRelationshipId;
  int? accountId;
  int? relatedAccountId;
  bool? isActive;
  LastUpdatedBy? createdBy;
  DateTime? creationDate;
  LastUpdatedBy? lastUpdatedBy;
  DateTime? lastUpdateDate;
  int? siteId;
  int? masterEntityId;
  bool? synchStatus;
  String? guid;
  int? dailyLimitPercentage;
  bool? isChanged;

  factory AccountRelationshipDtoList.fromJson(Map<String, dynamic> json) =>
      AccountRelationshipDtoList(
        accountRelationshipId: json["AccountRelationshipId"],
        accountId: json["AccountId"],
        relatedAccountId: json["RelatedAccountId"],
        isActive: json["IsActive"],
        createdBy: lastUpdatedByValues.map[json["CreatedBy"]]!,
        creationDate: json["CreationDate"] == null
            ? null
            : DateTime.parse(json["CreationDate"]),
        lastUpdatedBy: lastUpdatedByValues.map[json["LastUpdatedBy"]]!,
        lastUpdateDate: json["LastUpdateDate"] == null
            ? null
            : DateTime.parse(json["LastUpdateDate"]),
        siteId: json["SiteId"],
        masterEntityId: json["MasterEntityId"],
        synchStatus: json["SynchStatus"],
        guid: json["Guid"],
        dailyLimitPercentage: json["DailyLimitPercentage"],
        isChanged: json["IsChanged"],
      );

  Map<String, dynamic> toJson() => {
        "AccountRelationshipId": accountRelationshipId,
        "AccountId": accountId,
        "RelatedAccountId": relatedAccountId,
        "IsActive": isActive,
        "CreatedBy": lastUpdatedByValues.reverse[createdBy],
        "CreationDate": creationDate?.toIso8601String(),
        "LastUpdatedBy": lastUpdatedByValues.reverse[lastUpdatedBy],
        "LastUpdateDate": lastUpdateDate?.toIso8601String(),
        "SiteId": siteId,
        "MasterEntityId": masterEntityId,
        "SynchStatus": synchStatus,
        "Guid": guid,
        "DailyLimitPercentage": dailyLimitPercentage,
        "IsChanged": isChanged,
      };
}

class AccountSummaryDto {
  AccountSummaryDto({
    this.creditPlusConsumptionBalance,
    this.creditPlusCardBalance,
    this.creditPlusGamePlayCredits,
    this.creditPlusItemPurchase,
    this.creditPlusBonus,
    this.creditPlusLoyaltyPoints,
    this.creditPlusTickets,
    this.creditPlusVirtualPoints,
    this.creditPlusTime,
    this.creditPlusRefundableBalance,
    this.redeemableCreditPlusLoyaltyPoints,
    this.accountGameBalance,
    this.totalCardBalance,
    this.totalCreditBalance,
    this.totalGamePlayCreditsBalance,
    this.totalBonusBalance,
    this.totalBonusAndCourtesyBalance,
    this.totalCourtesyBalance,
    this.totalTimeBalance,
    this.totalVirtualPointBalance,
    this.totalGamesBalance,
    this.totalTicketsBalance,
    this.totalLoyaltyPointBalance,
    this.accountExpiryDate,
    this.expiringCpTotalCredits,
    this.expiringCpBonus,
    this.expiringCpLoyalty,
    this.expiringCpTickets,
    this.expiringCpCardBalance,
    this.expiringCpGamePlayCredits,
    this.expiringCpCounterItem,
    this.cpTotalCreditsExpiryDate,
    this.cpBonusExpiryDate,
    this.cpLoyaltyExpiryDate,
    this.cpTicketsExpiryDate,
    this.cpCardBalanceExpiryDate,
    this.cpGamePlayCreditsExpiryDate,
    this.cpCounterItemExpiryDate,
    this.formattedCreditPlusCardBalance,
    this.formattedCreditPlusVirtualPointBalance,
    this.formattedCreditPlusGamePlayCredits,
    this.formattedCreditPlusItemPurchase,
    this.formattedCreditPlusBonus,
    this.formattedCreditPlusLoyaltyPoints,
    this.formattedCreditPlusTickets,
    this.formattedCreditPlusTime,
    this.formattedCreditPlusRefundableBalance,
    this.formattedRedeemableCreditPlusLoyaltyPoints,
    this.formattedTotalGamePlayCreditsBalance,
    this.formattedTotalBonusBalance,
    this.formattedTotalCourtesyBalance,
    this.formattedTotalTimeBalance,
    this.formattedTotalGamesBalance,
    this.formattedTotalTicketsBalance,
    this.formattedTotalLoyaltyPointBalance,
    this.formattedAccountExpiryDate,
  });

  int? creditPlusConsumptionBalance;
  int? creditPlusCardBalance;
  int? creditPlusGamePlayCredits;
  int? creditPlusItemPurchase;
  double? creditPlusBonus;
  int? creditPlusLoyaltyPoints;
  int? creditPlusTickets;
  int? creditPlusVirtualPoints;
  int? creditPlusTime;
  int? creditPlusRefundableBalance;
  int? redeemableCreditPlusLoyaltyPoints;
  int? accountGameBalance;
  double? totalCardBalance;
  int? totalCreditBalance;
  int? totalGamePlayCreditsBalance;
  double? totalBonusBalance;
  double? totalBonusAndCourtesyBalance;
  int? totalCourtesyBalance;
  int? totalTimeBalance;
  int? totalVirtualPointBalance;
  int? totalGamesBalance;
  int? totalTicketsBalance;
  int? totalLoyaltyPointBalance;
  dynamic accountExpiryDate;
  int? expiringCpTotalCredits;
  int? expiringCpBonus;
  int? expiringCpLoyalty;
  int? expiringCpTickets;
  int? expiringCpCardBalance;
  int? expiringCpGamePlayCredits;
  int? expiringCpCounterItem;
  dynamic cpTotalCreditsExpiryDate;
  dynamic cpBonusExpiryDate;
  dynamic cpLoyaltyExpiryDate;
  dynamic cpTicketsExpiryDate;
  dynamic cpCardBalanceExpiryDate;
  dynamic cpGamePlayCreditsExpiryDate;
  dynamic cpCounterItemExpiryDate;
  String? formattedCreditPlusCardBalance;
  String? formattedCreditPlusVirtualPointBalance;
  String? formattedCreditPlusGamePlayCredits;
  String? formattedCreditPlusItemPurchase;
  String? formattedCreditPlusBonus;
  String? formattedCreditPlusLoyaltyPoints;
  String? formattedCreditPlusTickets;
  String? formattedCreditPlusTime;
  String? formattedCreditPlusRefundableBalance;
  String? formattedRedeemableCreditPlusLoyaltyPoints;
  String? formattedTotalGamePlayCreditsBalance;
  String? formattedTotalBonusBalance;
  String? formattedTotalCourtesyBalance;
  String? formattedTotalTimeBalance;
  String? formattedTotalGamesBalance;
  String? formattedTotalTicketsBalance;
  String? formattedTotalLoyaltyPointBalance;
  String? formattedAccountExpiryDate;

  factory AccountSummaryDto.fromJson(Map<String, dynamic> json) =>
      AccountSummaryDto(
        creditPlusConsumptionBalance: json["CreditPlusConsumptionBalance"],
        creditPlusCardBalance: json["CreditPlusCardBalance"],
        creditPlusGamePlayCredits: json["CreditPlusGamePlayCredits"],
        creditPlusItemPurchase: json["CreditPlusItemPurchase"],
        creditPlusBonus: json["CreditPlusBonus"]?.toDouble(),
        creditPlusLoyaltyPoints: json["CreditPlusLoyaltyPoints"],
        creditPlusTickets: json["CreditPlusTickets"],
        creditPlusVirtualPoints: json["CreditPlusVirtualPoints"],
        creditPlusTime: json["CreditPlusTime"],
        creditPlusRefundableBalance: json["CreditPlusRefundableBalance"],
        redeemableCreditPlusLoyaltyPoints:
            json["RedeemableCreditPlusLoyaltyPoints"],
        accountGameBalance: json["AccountGameBalance"],
        totalCardBalance: json["TotalCardBalance"]?.toDouble(),
        totalCreditBalance: json["TotalCreditBalance"],
        totalGamePlayCreditsBalance: json["TotalGamePlayCreditsBalance"],
        totalBonusBalance: json["TotalBonusBalance"]?.toDouble(),
        totalBonusAndCourtesyBalance:
            json["TotalBonusAndCourtesyBalance"]?.toDouble(),
        totalCourtesyBalance: json["TotalCourtesyBalance"],
        totalTimeBalance: json["TotalTimeBalance"],
        totalVirtualPointBalance: json["TotalVirtualPointBalance"],
        totalGamesBalance: json["TotalGamesBalance"],
        totalTicketsBalance: json["TotalTicketsBalance"],
        totalLoyaltyPointBalance: json["TotalLoyaltyPointBalance"],
        accountExpiryDate: json["AccountExpiryDate"],
        expiringCpTotalCredits: json["ExpiringCPTotalCredits"],
        expiringCpBonus: json["ExpiringCPBonus"],
        expiringCpLoyalty: json["ExpiringCPLoyalty"],
        expiringCpTickets: json["ExpiringCPTickets"],
        expiringCpCardBalance: json["ExpiringCPCardBalance"],
        expiringCpGamePlayCredits: json["ExpiringCPGamePlayCredits"],
        expiringCpCounterItem: json["ExpiringCPCounterItem"],
        cpTotalCreditsExpiryDate: json["CPTotalCreditsExpiryDate"],
        cpBonusExpiryDate: json["CPBonusExpiryDate"],
        cpLoyaltyExpiryDate: json["CPLoyaltyExpiryDate"],
        cpTicketsExpiryDate: json["CPTicketsExpiryDate"],
        cpCardBalanceExpiryDate: json["CPCardBalanceExpiryDate"],
        cpGamePlayCreditsExpiryDate: json["CPGamePlayCreditsExpiryDate"],
        cpCounterItemExpiryDate: json["CPCounterItemExpiryDate"],
        formattedCreditPlusCardBalance: json["FormattedCreditPlusCardBalance"],
        formattedCreditPlusVirtualPointBalance:
            json["FormattedCreditPlusVirtualPointBalance"],
        formattedCreditPlusGamePlayCredits:
            json["FormattedCreditPlusGamePlayCredits"],
        formattedCreditPlusItemPurchase:
            json["FormattedCreditPlusItemPurchase"],
        formattedCreditPlusBonus: json["FormattedCreditPlusBonus"],
        formattedCreditPlusLoyaltyPoints:
            json["FormattedCreditPlusLoyaltyPoints"],
        formattedCreditPlusTickets: json["FormattedCreditPlusTickets"],
        formattedCreditPlusTime: json["FormattedCreditPlusTime"],
        formattedCreditPlusRefundableBalance:
            json["FormattedCreditPlusRefundableBalance"],
        formattedRedeemableCreditPlusLoyaltyPoints:
            json["FormattedRedeemableCreditPlusLoyaltyPoints"],
        formattedTotalGamePlayCreditsBalance:
            json["FormattedTotalGamePlayCreditsBalance"],
        formattedTotalBonusBalance: json["FormattedTotalBonusBalance"],
        formattedTotalCourtesyBalance: json["FormattedTotalCourtesyBalance"],
        formattedTotalTimeBalance: json["FormattedTotalTimeBalance"],
        formattedTotalGamesBalance: json["FormattedTotalGamesBalance"],
        formattedTotalTicketsBalance: json["FormattedTotalTicketsBalance"],
        formattedTotalLoyaltyPointBalance:
            json["FormattedTotalLoyaltyPointBalance"],
        formattedAccountExpiryDate: json["FormattedAccountExpiryDate"],
      );

  Map<String, dynamic> toJson() => {
        "CreditPlusConsumptionBalance": creditPlusConsumptionBalance,
        "CreditPlusCardBalance": creditPlusCardBalance,
        "CreditPlusGamePlayCredits": creditPlusGamePlayCredits,
        "CreditPlusItemPurchase": creditPlusItemPurchase,
        "CreditPlusBonus": creditPlusBonus,
        "CreditPlusLoyaltyPoints": creditPlusLoyaltyPoints,
        "CreditPlusTickets": creditPlusTickets,
        "CreditPlusVirtualPoints": creditPlusVirtualPoints,
        "CreditPlusTime": creditPlusTime,
        "CreditPlusRefundableBalance": creditPlusRefundableBalance,
        "RedeemableCreditPlusLoyaltyPoints": redeemableCreditPlusLoyaltyPoints,
        "AccountGameBalance": accountGameBalance,
        "TotalCardBalance": totalCardBalance,
        "TotalCreditBalance": totalCreditBalance,
        "TotalGamePlayCreditsBalance": totalGamePlayCreditsBalance,
        "TotalBonusBalance": totalBonusBalance,
        "TotalBonusAndCourtesyBalance": totalBonusAndCourtesyBalance,
        "TotalCourtesyBalance": totalCourtesyBalance,
        "TotalTimeBalance": totalTimeBalance,
        "TotalVirtualPointBalance": totalVirtualPointBalance,
        "TotalGamesBalance": totalGamesBalance,
        "TotalTicketsBalance": totalTicketsBalance,
        "TotalLoyaltyPointBalance": totalLoyaltyPointBalance,
        "AccountExpiryDate": accountExpiryDate,
        "ExpiringCPTotalCredits": expiringCpTotalCredits,
        "ExpiringCPBonus": expiringCpBonus,
        "ExpiringCPLoyalty": expiringCpLoyalty,
        "ExpiringCPTickets": expiringCpTickets,
        "ExpiringCPCardBalance": expiringCpCardBalance,
        "ExpiringCPGamePlayCredits": expiringCpGamePlayCredits,
        "ExpiringCPCounterItem": expiringCpCounterItem,
        "CPTotalCreditsExpiryDate": cpTotalCreditsExpiryDate,
        "CPBonusExpiryDate": cpBonusExpiryDate,
        "CPLoyaltyExpiryDate": cpLoyaltyExpiryDate,
        "CPTicketsExpiryDate": cpTicketsExpiryDate,
        "CPCardBalanceExpiryDate": cpCardBalanceExpiryDate,
        "CPGamePlayCreditsExpiryDate": cpGamePlayCreditsExpiryDate,
        "CPCounterItemExpiryDate": cpCounterItemExpiryDate,
        "FormattedCreditPlusCardBalance": formattedCreditPlusCardBalance,
        "FormattedCreditPlusVirtualPointBalance":
            formattedCreditPlusVirtualPointBalance,
        "FormattedCreditPlusGamePlayCredits":
            formattedCreditPlusGamePlayCredits,
        "FormattedCreditPlusItemPurchase": formattedCreditPlusItemPurchase,
        "FormattedCreditPlusBonus": formattedCreditPlusBonus,
        "FormattedCreditPlusLoyaltyPoints": formattedCreditPlusLoyaltyPoints,
        "FormattedCreditPlusTickets": formattedCreditPlusTickets,
        "FormattedCreditPlusTime": formattedCreditPlusTime,
        "FormattedCreditPlusRefundableBalance":
            formattedCreditPlusRefundableBalance,
        "FormattedRedeemableCreditPlusLoyaltyPoints":
            formattedRedeemableCreditPlusLoyaltyPoints,
        "FormattedTotalGamePlayCreditsBalance":
            formattedTotalGamePlayCreditsBalance,
        "FormattedTotalBonusBalance": formattedTotalBonusBalance,
        "FormattedTotalCourtesyBalance": formattedTotalCourtesyBalance,
        "FormattedTotalTimeBalance": formattedTotalTimeBalance,
        "FormattedTotalGamesBalance": formattedTotalGamesBalance,
        "FormattedTotalTicketsBalance": formattedTotalTicketsBalance,
        "FormattedTotalLoyaltyPointBalance": formattedTotalLoyaltyPointBalance,
        "FormattedAccountExpiryDate": formattedAccountExpiryDate,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
