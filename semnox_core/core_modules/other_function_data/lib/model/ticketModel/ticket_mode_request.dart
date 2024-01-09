// To parse this JSON data, do
//
//     final ticketModeRequestModel = ticketModeRequestModelFromJson(jsonString);

import 'dart:convert';

TicketModeRequestModel ticketModeRequestModelFromJson(String str) =>
    TicketModeRequestModel.fromJson(json.decode(str));

String ticketModeRequestModelToJson(TicketModeRequestModel data) =>
    json.encode(data.toJson());

class TicketModeRequestModel {
  TicketModeRequestModel({
    this.cardId,
    this.managerId,
    this.remarks,
    this.ticketMode,
  });

  int? cardId;
  int? managerId;
  dynamic remarks;
  bool? ticketMode;

  factory TicketModeRequestModel.fromJson(Map<String, dynamic> json) =>
      TicketModeRequestModel(
        cardId: json["CardId"],
        managerId: json["ManagerId"],
        remarks: json["Remarks"],
        ticketMode: json["TicketMode"],
      );

  Map<String, dynamic> toJson() => {
        "CardId": cardId,
        "ManagerId": managerId,
        "Remarks": remarks,
        "TicketMode": ticketMode,
      };
}
