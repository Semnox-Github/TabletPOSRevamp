// To parse this JSON data, do
//
//     final ticketModeResponseModel = ticketModeResponseModelFromJson(jsonString);

import 'dart:convert';

TicketModeResponseModel ticketModeResponseModelFromJson(String str) =>
    TicketModeResponseModel.fromJson(json.decode(str));

String ticketModeResponseModelToJson(TicketModeResponseModel data) =>
    json.encode(data.toJson());

class TicketModeResponseModel {
  TicketModeResponseModel({
    required this.data,
  });

  Data data;

  factory TicketModeResponseModel.fromJson(Map<String, dynamic> json) =>
      TicketModeResponseModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.cardId,
    required this.managerId,
    this.remarks,
    required this.ticketMode,
  });

  int cardId;
  int managerId;
  dynamic remarks;
  bool ticketMode;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
