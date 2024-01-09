import 'package:transaction_data/models/create_transaction/transaction_line_dto.dart';
import 'package:transaction_ui/models/transaction_line_discount_dto.dart';
import 'modifier_transaction_lines_group.dart';

class TransactionLinesGroup {
  late String productName;
  late String seatName;
  late String remarks;
  late double amount;
  late List<TransactionLineDTO> transactionLines;
  late int productId;
  late int seatNumber;
  late String courseName;
  late int transactionLineProfileID;
  late List<ModifierTransactionLinesGroup> modifierTransactionLinesGroup;
  late String additionalLineInformation;
  late String lineStatus;
  late List<TransactionLineDiscountDto> transactionLineDiscountDto;

  TransactionLinesGroup(
      this.productName,
      this.seatName,
      this.remarks,
      this.amount,
      this.transactionLines,
      this.productId,
      this.seatNumber,
      this.courseName,
      this.transactionLineProfileID,
      this.modifierTransactionLinesGroup,
      this.additionalLineInformation,
      this.lineStatus,
      this.transactionLineDiscountDto);

  TransactionLinesGroup.fromJson(Map<String, dynamic> json) {
    productName = json['productName'];
    seatName = json['seatName'];
    remarks = json['remarks'];
    amount = json['amount'];
    transactionLines = json['transactionLines'];
    if (json['transactionLines'] != null) {
      transactionLines = <TransactionLineDTO>[];
      json['transactionLines'].forEach((v) {
        transactionLines.add(TransactionLineDTO.fromJson(v));
      });
    }
    seatNumber = json['seatNumber'];
    courseName = json['courseName'];
    transactionLineProfileID = json['transactionLineProfileID'];
    modifierTransactionLinesGroup = json['modifierTransactionLinesGroup'];
    if (json['modifierTransactionLinesGroup'] != null) {
      modifierTransactionLinesGroup = <ModifierTransactionLinesGroup>[];
      json['modifierTransactionLinesGroup'].forEach((v) {
        modifierTransactionLinesGroup.add(ModifierTransactionLinesGroup.fromJson(v));
      });
    }
    additionalLineInformation = json["additionalLineInformation"];
    lineStatus = json["lineStatus"];
    if (json['transactionLineDiscountDto'] != null) {
      transactionLineDiscountDto = <TransactionLineDiscountDto>[];
      json['transactionLineDiscountDto'].forEach((v) {
        transactionLineDiscountDto.add(TransactionLineDiscountDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productName'] = productName;
    data['seatName'] = seatName;
    data['remarks'] = remarks;
    data['amount'] = amount;
    data['transactionLines'] = transactionLines.map((v) => v.toJson()).toList();
    data['seatNumber'] = seatNumber;
    data['courseName'] = courseName;
    data['transactionLineProfileID'] = transactionLineProfileID;
    data['modifierTransactionLinesGroup'] = modifierTransactionLinesGroup.map((v) => v.toJson()).toList();
    data['additionalLineInformation'] = additionalLineInformation;
    data['lineStatus'] = lineStatus;
    data['transactionLineDiscountDto'] = transactionLineDiscountDto.map((v) => v.toJson()).toList();
    return data;
  }
}
