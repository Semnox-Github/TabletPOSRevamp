// To parse this JSON data, do
//
//     final loyaltyAttributeContainer = loyaltyAttributeContainerFromJson(jsonString);

import 'dart:convert';

LoyaltyAttributeContainer loyaltyAttributeContainerFromJson(String str) =>
    LoyaltyAttributeContainer.fromJson(json.decode(str));

String loyaltyAttributeContainerToJson(LoyaltyAttributeContainer data) =>
    json.encode(data.toJson());

class LoyaltyAttributeContainer {
  LoyaltyAttributeContainer({
    this.data,
  });

  Data? data;

  factory LoyaltyAttributeContainer.fromJson(Map<String, dynamic> json) =>
      LoyaltyAttributeContainer(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.loyaltyAttributeContainerDtoList,
    this.hash,
  });

  List<LoyaltyAttributeContainerDtoList>? loyaltyAttributeContainerDtoList;
  String? hash;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        loyaltyAttributeContainerDtoList:
            json["LoyaltyAttributeContainerDTOList"] == null
                ? []
                : List<LoyaltyAttributeContainerDtoList>.from(
                    json["LoyaltyAttributeContainerDTOList"]!.map(
                        (x) => LoyaltyAttributeContainerDtoList.fromJson(x))),
        hash: json["Hash"],
      );

  Map<String, dynamic> toJson() => {
        "LoyaltyAttributeContainerDTOList":
            loyaltyAttributeContainerDtoList == null
                ? []
                : List<dynamic>.from(
                    loyaltyAttributeContainerDtoList!.map((x) => x.toJson())),
        "Hash": hash,
      };
}

class LoyaltyAttributeContainerDtoList {
  LoyaltyAttributeContainerDtoList({
    this.loyaltyAttributeId,
    this.attribute,
    this.purchaseApplicable,
    this.consumptionApplicable,
    this.dbColumnName,
    this.creditPlusType,
  });

  int? loyaltyAttributeId;
  String? attribute;
  Applicable? purchaseApplicable;
  Applicable? consumptionApplicable;
  String? dbColumnName;
  String? creditPlusType;

  factory LoyaltyAttributeContainerDtoList.fromJson(
          Map<String, dynamic> json) =>
      LoyaltyAttributeContainerDtoList(
        loyaltyAttributeId: json["LoyaltyAttributeId"],
        attribute: json["Attribute"],
        purchaseApplicable: applicableValues.map[json["PurchaseApplicable"]]!,
        consumptionApplicable:
            applicableValues.map[json["ConsumptionApplicable"]]!,
        dbColumnName: json["DBColumnName"],
        creditPlusType: json["CreditPlusType"],
      );

  Map<String, dynamic> toJson() => {
        "LoyaltyAttributeId": loyaltyAttributeId,
        "Attribute": attribute,
        "PurchaseApplicable": applicableValues.reverse[purchaseApplicable],
        "ConsumptionApplicable":
            applicableValues.reverse[consumptionApplicable],
        "DBColumnName": dbColumnName,
        "CreditPlusType": creditPlusType,
      };
}

enum Applicable { Y, N }

final applicableValues = EnumValues({"N": Applicable.N, "Y": Applicable.Y});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
