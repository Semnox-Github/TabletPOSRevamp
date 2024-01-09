// To parse this JSON data, do
//
//     final entitlementModel = entitlementModelFromJson(jsonString);

import 'dart:convert';

EntitlementModel entitlementModelFromJson(String str) =>
    EntitlementModel.fromJson(json.decode(str));

String entitlementModelToJson(EntitlementModel data) =>
    json.encode(data.toJson());

class EntitlementModel {
  EntitlementModel({
    this.accountTaskId,
    this.sourceAccountId,
    this.sourceCreditPlusId,
    this.destinationAccountId,
    this.legacyCardId,
    this.activityType,
    this.valueLoaded,
    this.guid,
    this.remarks,
    this.synchStatus,
    this.siteId,
    this.activityDate,
    this.approvalDate,
    this.approvedBy,
    this.sourceAccountNumber,
    this.destinationAccountNumber,
    this.posMachineId,
    this.cashDrawerId,
    this.userId,
    this.groupTaskGuid,
    this.invalidateAccount,
    this.masterEntityId,
    this.entitlementType,
    this.isActive,
    this.createdBy,
    this.creationDate,
    this.lastUpdatedBy,
    this.lastUpdateDate,
    this.isChanged,
  });

  int? accountTaskId;
  int? sourceAccountId;
  int? sourceCreditPlusId;
  int? destinationAccountId;
  int? legacyCardId;
  int? activityType;
  dynamic valueLoaded;
  dynamic guid;
  dynamic remarks;
  bool? synchStatus;
  int? siteId;
  DateTime? activityDate;
  dynamic approvalDate;
  String? approvedBy;
  String? sourceAccountNumber;
  String? destinationAccountNumber;
  int? posMachineId;
  int? cashDrawerId;
  int? userId;
  String? groupTaskGuid;
  bool? invalidateAccount;
  int? masterEntityId;
  dynamic entitlementType;
  bool? isActive;
  dynamic createdBy;
  DateTime? creationDate;
  dynamic lastUpdatedBy;
  DateTime? lastUpdateDate;
  bool? isChanged;

  factory EntitlementModel.fromJson(Map<String, dynamic> json) =>
      EntitlementModel(
        accountTaskId: json["AccountTaskId"],
        sourceAccountId: json["SourceAccountId"],
        sourceCreditPlusId: json["SourceCreditPlusId"],
        destinationAccountId: json["DestinationAccountId"],
        legacyCardId: json["LegacyCardId"],
        activityType: json["ActivityType"],
        valueLoaded: json["ValueLoaded"],
        guid: json["Guid"],
        remarks: json["Remarks"],
        synchStatus: json["SynchStatus"],
        siteId: json["SiteId"],
        activityDate: DateTime.parse(json["ActivityDate"]),
        approvalDate: json["ApprovalDate"],
        approvedBy: json["ApprovedBy"],
        sourceAccountNumber: json["SourceAccountNumber"],
        destinationAccountNumber: json["DestinationAccountNumber"],
        posMachineId: json["POSMachineId"],
        cashDrawerId: json["CashDrawerId"],
        userId: json["UserId"],
        groupTaskGuid: json["GroupTaskGuid"],
        invalidateAccount: json["InvalidateAccount"],
        masterEntityId: json["MasterEntityId"],
        entitlementType: json["EntitlementType"],
        isActive: json["IsActive"],
        createdBy: json["CreatedBy"],
        creationDate: DateTime.parse(json["CreationDate"]),
        lastUpdatedBy: json["LastUpdatedBy"],
        lastUpdateDate: DateTime.parse(json["LastUpdateDate"]),
        isChanged: json["IsChanged"],
      );

  Map<String, dynamic> toJson() => {
        "AccountTaskId": accountTaskId,
        "SourceAccountId": sourceAccountId,
        "SourceCreditPlusId": sourceCreditPlusId,
        "DestinationAccountId": destinationAccountId,
        "LegacyCardId": legacyCardId,
        "ActivityType": activityType,
        "ValueLoaded": valueLoaded,
        "Guid": guid,
        "Remarks": remarks,
        "SynchStatus": synchStatus,
        "SiteId": siteId,
        "ActivityDate": activityDate?.toIso8601String(),
        "ApprovalDate": approvalDate,
        "ApprovedBy": approvedBy,
        "SourceAccountNumber": sourceAccountNumber,
        "DestinationAccountNumber": destinationAccountNumber,
        "POSMachineId": posMachineId,
        "CashDrawerId": cashDrawerId,
        "UserId": userId,
        "GroupTaskGuid": groupTaskGuid,
        "InvalidateAccount": invalidateAccount,
        "MasterEntityId": masterEntityId,
        "EntitlementType": entitlementType,
        "IsActive": isActive,
        "CreatedBy": createdBy,
        "CreationDate": creationDate?.toIso8601String(),
        "LastUpdatedBy": lastUpdatedBy,
        "LastUpdateDate": lastUpdateDate?.toIso8601String(),
        "IsChanged": isChanged,
      };
}
