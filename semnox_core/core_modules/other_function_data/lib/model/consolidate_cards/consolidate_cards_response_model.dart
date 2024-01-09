// To parse this JSON data, do
//
//     final consolidateResponseModel = consolidateResponseModelFromJson(jsonString);

import 'dart:convert';

ConsolidateResponseModel consolidateResponseModelFromJson(String str) =>
    ConsolidateResponseModel.fromJson(json.decode(str));

String consolidateResponseModelToJson(ConsolidateResponseModel data) =>
    json.encode(data.toJson());

class ConsolidateResponseModel {
  ConsolidateResponseModel({
    this.data,
  });

  String? data;

  factory ConsolidateResponseModel.fromJson(Map<String, dynamic> json) =>
      ConsolidateResponseModel(
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
      };
}
