// To parse this JSON data, do
//
//     final creditForTokenResponse = creditForTokenResponseFromJson(jsonString);

import 'dart:convert';

CreditForTokenResponse creditForTokenResponseFromJson(String str) =>
    CreditForTokenResponse.fromJson(json.decode(str));

String creditForTokenResponseToJson(CreditForTokenResponse data) =>
    json.encode(data.toJson());

class CreditForTokenResponse {
  CreditForTokenResponse({
    required this.data,
  });

  Data data;

  factory CreditForTokenResponse.fromJson(Map<String, dynamic> json) =>
      CreditForTokenResponse(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.managerId,
    required this.remarks,
    required this.tokenValue,
    required this.fromType,
    required this.toType,
    required this.cardId,
  });

  int managerId;
  String remarks;
  double tokenValue;
  int fromType;
  int toType;
  int cardId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
