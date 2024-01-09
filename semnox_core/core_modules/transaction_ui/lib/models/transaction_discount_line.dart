class TransactionLineDiscount {
  String? discountName;
  dynamic discountAmount;
  int? lineId;

  TransactionLineDiscount(
      {this.discountName, this.discountAmount, this.lineId});

  TransactionLineDiscount.fromJson(Map<String, dynamic> json) {
    discountName = json['DiscountName'];
    discountAmount = json['DiscountAmount'];
    lineId = json['LineId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DiscountPercentage'] = this.discountName;
    data['DiscountAmount'] = this.discountAmount;
    data['LineId'] = this.lineId;
    return data;
  }
}
