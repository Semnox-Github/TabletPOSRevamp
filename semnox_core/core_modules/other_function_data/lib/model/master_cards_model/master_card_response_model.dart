// To parse this JSON data, do
//
//     final masterCardResponseModel = masterCardResponseModelFromJson(jsonString);

import 'dart:convert';

MasterCardResponseModel masterCardResponseModelFromJson(String str) =>
    MasterCardResponseModel.fromJson(json.decode(str));

String masterCardResponseModelToJson(MasterCardResponseModel data) =>
    json.encode(data.toJson());

class MasterCardResponseModel {
  MasterCardResponseModel({
    this.data,
  });

  String? data;

  factory MasterCardResponseModel.fromJson(Map<String, dynamic> json) =>
      MasterCardResponseModel(
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
      };
}
