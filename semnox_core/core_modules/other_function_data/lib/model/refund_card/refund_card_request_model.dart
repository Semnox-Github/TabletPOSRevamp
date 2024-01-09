// To parse this JSON data, do
//
//     final refundCardsRequestModel = refundCardsRequestModelFromJson(jsonString);

import 'dart:convert';

RefundCardsRequestModel refundCardsRequestModelFromJson(String str) =>
    RefundCardsRequestModel.fromJson(json.decode(str));

String refundCardsRequestModelToJson(RefundCardsRequestModel data) =>
    json.encode(data.toJson());

class RefundCardsRequestModel {
  RefundCardsRequestModel({
    this.accountIdList,
    this.refundValue,
    this.makeNewOnFullRefund,
    this.remarks,
  });

  List<int>? accountIdList;
  int? refundValue;
  bool? makeNewOnFullRefund;
  String? remarks;

  factory RefundCardsRequestModel.fromJson(Map<String, dynamic> json) =>
      RefundCardsRequestModel(
        accountIdList: json["AccountIdList"] == null
            ? []
            : List<int>.from(json["AccountIdList"]!.map((x) => x)),
        refundValue: json["RefundValue"],
        makeNewOnFullRefund: json["MakeNewOnFullRefund"],
        remarks: json["Remarks"],
      );

  Map<String, dynamic> toJson() => {
        "AccountIdList": accountIdList == null
            ? []
            : List<dynamic>.from(accountIdList!.map((x) => x)),
        "RefundValue": refundValue,
        "MakeNewOnFullRefund": makeNewOnFullRefund,
        "Remarks": remarks,
      };
}
