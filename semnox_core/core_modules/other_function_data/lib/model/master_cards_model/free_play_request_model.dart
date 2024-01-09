// To parse this JSON data, do
//
//     final freePlayModeRequestModel = freePlayModeRequestModelFromJson(jsonString);

import 'dart:convert';

FreePlayModeRequestModel freePlayModeRequestModelFromJson(String str) =>
    FreePlayModeRequestModel.fromJson(json.decode(str));

String freePlayModeRequestModelToJson(FreePlayModeRequestModel data) =>
    json.encode(data.toJson());

class FreePlayModeRequestModel {
  FreePlayModeRequestModel({
    this.cardNumber,
    this.command,
    this.approvalId,
  });

  dynamic cardNumber;
  dynamic command;
  int? approvalId;

  factory FreePlayModeRequestModel.fromJson(Map<String, dynamic> json) =>
      FreePlayModeRequestModel(
        cardNumber: json["CardNumber"],
        command: json["Command"],
        approvalId: json["ApprovalId"],
      );

  Map<String, dynamic> toJson() => {
        "CardNumber": cardNumber,
        "Command": command,
        "ApprovalId": approvalId,
      };
}
