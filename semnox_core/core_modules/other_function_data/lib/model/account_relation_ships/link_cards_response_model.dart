// To parse this JSON data, do
//
//     final linkCardsReponseModel = linkCardsReponseModelFromJson(jsonString);

import 'dart:convert';

LinkCardsReponseModel linkCardsReponseModelFromJson(String str) =>
    LinkCardsReponseModel.fromJson(json.decode(str));

String linkCardsReponseModelToJson(LinkCardsReponseModel data) =>
    json.encode(data.toJson());

class LinkCardsReponseModel {
  LinkCardsReponseModel({
    this.data,
  });

  List<Datum>? data;

  factory LinkCardsReponseModel.fromJson(Map<String, dynamic> json) =>
      LinkCardsReponseModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
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
  String? createdBy;
  DateTime? creationDate;
  String? lastUpdatedBy;
  DateTime? lastUpdateDate;
  int? siteId;
  int? masterEntityId;
  bool? synchStatus;
  String? guid;
  int? dailyLimitPercentage;
  bool? isChanged;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        accountRelationshipId: json["AccountRelationshipId"],
        accountId: json["AccountId"],
        relatedAccountId: json["RelatedAccountId"],
        isActive: json["IsActive"],
        createdBy: json["CreatedBy"],
        creationDate: json["CreationDate"] == null
            ? null
            : DateTime.parse(json["CreationDate"]),
        lastUpdatedBy: json["LastUpdatedBy"],
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
        "CreatedBy": createdBy,
        "CreationDate": creationDate?.toIso8601String(),
        "LastUpdatedBy": lastUpdatedBy,
        "LastUpdateDate": lastUpdateDate?.toIso8601String(),
        "SiteId": siteId,
        "MasterEntityId": masterEntityId,
        "SynchStatus": synchStatus,
        "Guid": guid,
        "DailyLimitPercentage": dailyLimitPercentage,
        "IsChanged": isChanged,
      };
}
