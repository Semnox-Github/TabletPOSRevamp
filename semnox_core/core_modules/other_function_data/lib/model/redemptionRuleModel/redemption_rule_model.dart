// To parse this JSON data, do
//
//     final redemptionRuleModel = redemptionRuleModelFromJson(jsonString);

import 'dart:convert';

RedemptionRuleModel redemptionRuleModelFromJson(String str) =>
    RedemptionRuleModel.fromJson(json.decode(str));

String redemptionRuleModelToJson(RedemptionRuleModel data) =>
    json.encode(data.toJson());

class RedemptionRuleModel {
  RedemptionRuleModel({
    required this.data,
  });

  Data data;

  factory RedemptionRuleModel.fromJson(Map<String, dynamic> json) =>
      RedemptionRuleModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.loyaltyRedemptionRuleContainerDtoList,
    required this.hash,
  });

  List<LoyaltyRedemptionRuleContainerDtoList>
      loyaltyRedemptionRuleContainerDtoList;
  String hash;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        loyaltyRedemptionRuleContainerDtoList:
            List<LoyaltyRedemptionRuleContainerDtoList>.from(
                json["LoyaltyRedemptionRuleContainerDTOList"].map(
                    (x) => LoyaltyRedemptionRuleContainerDtoList.fromJson(x))),
        hash: json["Hash"],
      );

  Map<String, dynamic> toJson() => {
        "LoyaltyRedemptionRuleContainerDTOList": List<dynamic>.from(
            loyaltyRedemptionRuleContainerDtoList.map((x) => x.toJson())),
        "Hash": hash,
      };
}

class LoyaltyRedemptionRuleContainerDtoList {
  LoyaltyRedemptionRuleContainerDtoList({
    this.redemptionRuleId,
    this.loyaltyAttributeId,
    this.loyaltyPoints,
    this.redemptionValue,
    this.expiryDate,
    this.activeFlag,
    this.minimumPoints,
    this.maximiumPoints,
    this.multiplesOnly,
    this.virtualLoyaltyPoints,
    this.attributeName = '',
  });

  int? redemptionRuleId;
  int? loyaltyAttributeId;
  double? loyaltyPoints;
  dynamic redemptionValue;
  DateTime? expiryDate;
  bool? activeFlag;
  dynamic minimumPoints;
  dynamic maximiumPoints;
  String? multiplesOnly;
  dynamic virtualLoyaltyPoints;
  String? attributeName;

  factory LoyaltyRedemptionRuleContainerDtoList.fromJson(
          Map<String, dynamic> json) =>
      LoyaltyRedemptionRuleContainerDtoList(
        redemptionRuleId: json["RedemptionRuleId"],
        loyaltyAttributeId: json["LoyaltyAttributeId"],
        loyaltyPoints: json["LoyaltyPoints"],
        redemptionValue: json["RedemptionValue"],
        expiryDate: DateTime.parse(json["ExpiryDate"]),
        activeFlag: json["ActiveFlag"],
        minimumPoints: json["MinimumPoints"],
        maximiumPoints: json["MaximiumPoints"],
        multiplesOnly: json["MultiplesOnly"],
        virtualLoyaltyPoints: json["VirtualLoyaltyPoints"],
      );

  Map<String, dynamic> toJson() => {
        "RedemptionRuleId": redemptionRuleId,
        "LoyaltyAttributeId": loyaltyAttributeId,
        "LoyaltyPoints": loyaltyPoints,
        "RedemptionValue": redemptionValue,
        "ExpiryDate": expiryDate?.toIso8601String(),
        "ActiveFlag": activeFlag,
        "MinimumPoints": minimumPoints,
        "MaximiumPoints": maximiumPoints,
        "MultiplesOnly": multiplesOnly,
        "VirtualLoyaltyPoints": virtualLoyaltyPoints,
      };
}
