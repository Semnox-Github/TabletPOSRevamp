// To parse this JSON data, do
//
//     final redeemResponse = redeemResponseFromJson(jsonString);

import 'dart:convert';

RedeemResponse redeemResponseFromJson(String str) =>
    RedeemResponse.fromJson(json.decode(str));

String redeemResponseToJson(RedeemResponse data) => json.encode(data.toJson());

class RedeemResponse {
  RedeemResponse({
    required this.data,
  });

  Data data;

  factory RedeemResponse.fromJson(Map<String, dynamic> json) => RedeemResponse(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
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
  double? fromValue;
  int? fromType;
  int? toType;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
