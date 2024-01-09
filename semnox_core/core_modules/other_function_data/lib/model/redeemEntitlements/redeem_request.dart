// To parse this JSON data, do
//
//     final redeemRequest = redeemRequestFromJson(jsonString);

import 'dart:convert';

RedeemRequest redeemRequestFromJson(String str) =>
    RedeemRequest.fromJson(json.decode(str));

String redeemRequestToJson(RedeemRequest data) => json.encode(data.toJson());

class RedeemRequest {
  RedeemRequest({
    this.cardId,
    this.managerId,
    this.remarks,
    this.fromValue,
    this.fromType,
    this.toType,
  });

  int? cardId;
  int? managerId;
  String? remarks;
  int? fromValue;
  int? fromType;
  int? toType;

  factory RedeemRequest.fromJson(Map<String, dynamic> json) => RedeemRequest(
        cardId: json["CardId"],
        managerId: json["ManagerId"],
        remarks: json["Remarks"],
        fromValue: json["FromValue"],
        fromType: json["FromType"],
        toType: json["ToType"],
      );

  Map<String, dynamic> toJson() => {
        "CardId": cardId,
        "ManagerId": managerId,
        "Remarks": remarks,
        "FromValue": fromValue,
        "FromType": fromType,
        "ToType": toType,
      };
}
