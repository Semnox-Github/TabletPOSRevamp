import 'package:transaction_data/models/create_transaction/transaction_discount_applicable_line_dto.dart';

class TransactionLineDiscountDto {
  String? discountName;
  dynamic discountAmount;
  List<TransactionDiscountApplicableLineDto>? transactionDiscountDTOList;

  TransactionLineDiscountDto({this.discountName, this.discountAmount, this.transactionDiscountDTOList});

  TransactionLineDiscountDto.fromJson(Map<String, dynamic> json) {
    discountName = json['DiscountName'];
    discountAmount = json['DiscountAmount'];
    if (json['TransactionDiscountDTOList'] != null) {
      transactionDiscountDTOList = <TransactionDiscountApplicableLineDto>[];
      json['transactionLineDtoList'].forEach((v) {
        transactionDiscountDTOList?.add(TransactionDiscountApplicableLineDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DiscountPercentage'] = discountName;
    data['DiscountAmount'] = discountAmount;
    data['TransactionDiscountDTOList'] = transactionDiscountDTOList?.map((v) => v.toJson()).toList();
    return data;
  }
}
