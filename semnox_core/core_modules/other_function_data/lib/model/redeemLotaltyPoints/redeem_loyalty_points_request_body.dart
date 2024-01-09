// To parse this JSON data, do
//
//     final loyaltyPointsRequestModel = loyaltyPointsRequestModelFromJson(jsonString);

import 'dart:convert';

LoyaltyPointsRequestModel loyaltyPointsRequestModelFromJson(String str) =>
    LoyaltyPointsRequestModel.fromJson(json.decode(str));

String loyaltyPointsRequestModelToJson(LoyaltyPointsRequestModel data) =>
    json.encode(data.toJson());

class LoyaltyPointsRequestModel {
  LoyaltyPointsRequestModel({
    this.cardId,
    this.ruleId,
    this.loyaltyRedeemPoints,
    this.managerId,
    this.remarks,
    this.taskType,
  });

  int? cardId;
  int? ruleId;
  int? loyaltyRedeemPoints;
  int? managerId;
  String? remarks;
  String? taskType;

  factory LoyaltyPointsRequestModel.fromJson(Map<String, dynamic> json) =>
      LoyaltyPointsRequestModel(
        cardId: json["CardId"],
        ruleId: json["RuleId"],
        loyaltyRedeemPoints: json["LoyaltyRedeemPoints"],
        managerId: json["ManagerId"],
        remarks: json["Remarks"],
        taskType: json["TaskType"],
      );

  Map<String, dynamic> toJson() => {
        "CardId": cardId,
        "RuleId": ruleId,
        "LoyaltyRedeemPoints": loyaltyRedeemPoints,
        "ManagerId": managerId,
        "Remarks": remarks,
        "TaskType": taskType,
      };
}
