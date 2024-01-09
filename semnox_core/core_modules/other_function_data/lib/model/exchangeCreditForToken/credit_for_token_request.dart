// To parse this JSON data, do
//
//     final creditForTokenRequest = creditForTokenRequestFromJson(jsonString);

import 'dart:convert';

CreditForTokenRequest creditForTokenRequestFromJson(String str) =>
    CreditForTokenRequest.fromJson(json.decode(str));

String creditForTokenRequestToJson(CreditForTokenRequest data) =>
    json.encode(data.toJson());

class CreditForTokenRequest {
  CreditForTokenRequest({
    this.managerId,
    this.remarks,
    this.tokenValue,
    this.fromType,
    this.toType,
    this.cardId,
  });

  int? managerId;
  String? remarks;
  double? tokenValue;
  int? fromType;
  int? toType;
  int? cardId;

  factory CreditForTokenRequest.fromJson(Map<String, dynamic> json) =>
      CreditForTokenRequest(
        managerId: json["ManagerId"],
        remarks: json["Remarks"],
        tokenValue: json["TokenValue"],
        fromType: json["FromType"],
        toType: json["ToType"],
        cardId: json["CardId"],
      );

  Map<String, dynamic> toJson() => {
        "ManagerId": managerId,
        "Remarks": remarks,
        "TokenValue": tokenValue,
        "FromType": fromType,
        "ToType": toType,
        "CardId": cardId,
      };
}
