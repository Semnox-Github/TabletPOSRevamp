// To parse this JSON data, do
//
//     final entitlementResponseModel = entitlementResponseModelFromJson(jsonString);

import 'dart:convert';

EntitlementResponseModel entitlementResponseModelFromJson(String str) =>
    EntitlementResponseModel.fromJson(json.decode(str));

String entitlementResponseModelToJson(EntitlementResponseModel data) =>
    json.encode(data.toJson());

class EntitlementResponseModel {
  EntitlementResponseModel({
    required this.data,
  });

  String data;

  factory EntitlementResponseModel.fromJson(Map<String, dynamic> json) =>
      EntitlementResponseModel(
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
      };
}
