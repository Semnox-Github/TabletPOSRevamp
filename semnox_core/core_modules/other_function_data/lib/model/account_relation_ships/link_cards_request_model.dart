// To parse this JSON data, do
//
//     final linkCardsRequestModel = linkCardsRequestModelFromJson(jsonString);

import 'dart:convert';

List<LinkCardsRequestModel> linkCardsRequestModelFromJson(String str) =>
    List<LinkCardsRequestModel>.from(
        json.decode(str).map((x) => LinkCardsRequestModel.fromJson(x)));

String linkCardsRequestModelToJson(List<LinkCardsRequestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LinkCardsRequestModel {
  LinkCardsRequestModel({
    this.cardNumber,
    this.accountRelationShipDto,
  });

  String? cardNumber;
  AccountRelationShipDto? accountRelationShipDto;

  factory LinkCardsRequestModel.fromJson(Map<String, dynamic> json) =>
      LinkCardsRequestModel(
        cardNumber: json["CardNumber"],
        accountRelationShipDto: json["AccountRelationShipDTO"] == null
            ? null
            : AccountRelationShipDto.fromJson(json["AccountRelationShipDTO"]),
      );

  Map<String, dynamic> toJson() => {
        "CardNumber": cardNumber,
        "AccountRelationShipDTO": accountRelationShipDto?.toJson(),
      };
}

class AccountRelationShipDto {
  AccountRelationShipDto({
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
  dynamic createdBy;
  DateTime? creationDate;
  dynamic lastUpdatedBy;
  DateTime? lastUpdateDate;
  int? siteId;
  int? masterEntityId;
  bool? synchStatus;
  dynamic guid;
  int? dailyLimitPercentage;
  bool? isChanged;

  factory AccountRelationShipDto.fromJson(Map<String, dynamic> json) =>
      AccountRelationShipDto(
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
