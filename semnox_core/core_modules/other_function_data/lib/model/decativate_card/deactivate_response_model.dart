// To parse this JSON data, do
//
//     final deactivateCardRsponseModel = deactivateCardRsponseModelFromJson(jsonString);

import 'dart:convert';

DeactivateCardRsponseModel deactivateCardRsponseModelFromJson(String str) =>
    DeactivateCardRsponseModel.fromJson(json.decode(str));

String deactivateCardRsponseModelToJson(DeactivateCardRsponseModel data) =>
    json.encode(data.toJson());

class DeactivateCardRsponseModel {
  DeactivateCardRsponseModel({
    this.data,
  });

  String? data;

  factory DeactivateCardRsponseModel.fromJson(Map<String, dynamic> json) =>
      DeactivateCardRsponseModel(
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
      };
}
