// To parse this JSON data, do
//
//     final transferCardRsponseModel = transferCardRsponseModelFromJson(jsonString);

import 'dart:convert';

TransferCardRsponseModel transferCardRsponseModelFromJson(String str) =>
    TransferCardRsponseModel.fromJson(json.decode(str));

String transferCardRsponseModelToJson(TransferCardRsponseModel data) =>
    json.encode(data.toJson());

class TransferCardRsponseModel {
  TransferCardRsponseModel({
    this.data,
  });

  String? data;

  factory TransferCardRsponseModel.fromJson(Map<String, dynamic> json) =>
      TransferCardRsponseModel(
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
      };
}
