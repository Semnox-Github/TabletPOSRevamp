import 'package:transaction_data/models/create_transaction/transaction_line_dto.dart';

class ModifierTransactionLinesGroup {
  late String modifierName;
  late int modifierProductId;
  late int modifierSetId;
  late int modifierSetDetailId;
  late double amount;
  late List<TransactionLineDTO> transactionLineDtoList;
  late List<ModifierTransactionLinesGroup> parentModifiersDtoList;

  ModifierTransactionLinesGroup(
      this.modifierName,
      this.modifierProductId,
      this.modifierSetId,
      this.modifierSetDetailId,
      this.amount,
      this.transactionLineDtoList,
      {this.parentModifiersDtoList = const []});

  ModifierTransactionLinesGroup.fromJson(Map<String, dynamic> json) {
    modifierName = json['modifierName'];
    amount = json['amount'];
    modifierProductId = json['modifierProductId'];
    modifierSetId = json['modifierSetId'];
    modifierSetDetailId = json['modifierSetDetailId'];
    if (json['transactionLineDtoList'] != null) {
      transactionLineDtoList = <TransactionLineDTO>[];
      json['transactionLineDtoList'].forEach((v) {
        transactionLineDtoList.add(TransactionLineDTO.fromJson(v));
      });
    }
    if (json['parentModifiersDtoList'] != null) {
      parentModifiersDtoList = <ModifierTransactionLinesGroup>[];
      json['parentModifiersDtoList'].forEach((v) {
        parentModifiersDtoList.add(ModifierTransactionLinesGroup.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['modifierName'] = modifierName;
    data['amount'] = amount;
    data['modifierProductId'] = modifierProductId;
    data['modifierSetId'] = modifierSetId;
    data['modifierSetDetailId'] = modifierSetDetailId;
    data['transactionLineDtoList'] = transactionLineDtoList.map((v) => v.toJson()).toList();
    data['parentModifiersDtoList'] = parentModifiersDtoList.map((v) => v.toJson()).toList();
    return data;
  }
}
