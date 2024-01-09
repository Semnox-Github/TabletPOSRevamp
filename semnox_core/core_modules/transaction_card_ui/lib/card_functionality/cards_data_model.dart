class CardsDataModel {
  bool? isSelected;
  String? tagNumber;
  String? productName;
  bool? isApplied;
  int? productId;
  String? productType;

  CardsDataModel({required this.isSelected,required this.tagNumber,required this.productName,required this.isApplied,required this.productId,required this.productType});

  CardsDataModel.fromJson(Map<String, dynamic> json) {
    isSelected = json['isSelected'];
    tagNumber = json['tagNumber'];
    productName = json['productName'];
    isApplied = json["isApplied"];
    productId = json['productId'];
    productType = json['productType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['isSelected'] = isSelected;
    data['tagNumber'] = tagNumber;
    data['productName'] = productName;
    data['isApplied'] = isApplied;
    data['productId'] = productId;
    data['productType'] = productType;
    return data;
  }

  CardsDataModel copyWith(
      {bool? isSelected,
      String? tagNumber,
      String? productName,
      bool? isApplied,
      int? productId  ,
      String? productType,
      }) {
    return CardsDataModel(
        isSelected: isSelected ?? this.isSelected,
        tagNumber: tagNumber ?? this.tagNumber,
        productName: productName ??
            this.productName,
        isApplied: isApplied ?? this.isApplied,
        productId: productId?? this.productId,
        productType: productType ?? this.productType);
  }
}