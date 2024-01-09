// To parse this JSON data, do
//
//     final loyaltyPointsResponseModel = loyaltyPointsResponseModelFromJson(jsonString);

import 'dart:convert';

LoyaltyPointsResponseModel loyaltyPointsResponseModelFromJson(String str) =>
    LoyaltyPointsResponseModel.fromJson(json.decode(str));

String loyaltyPointsResponseModelToJson(LoyaltyPointsResponseModel data) =>
    json.encode(data.toJson());

class LoyaltyPointsResponseModel {
  LoyaltyPointsResponseModel({
    required this.data,
  });

  Data data;

  factory LoyaltyPointsResponseModel.fromJson(Map<String, dynamic> json) =>
      LoyaltyPointsResponseModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.cardId,
    this.ruleId,
    this.loyaltyRedeemPoints,
    this.managerId,
    this.remarks,
    this.taskType,
  });

  int? cardId;
  int? ruleId;
  double? loyaltyRedeemPoints;
  int? managerId;
  String? remarks;
  String? taskType;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
