class TransactionSearchArguments {
  int transactionId;
  String? fromDate;
  String? toDate;
  int? paymentModeId;
  String? paymentStatus;
  String? transactionStatus;

  TransactionSearchArguments({required this.transactionId, this.fromDate,
    this.toDate, this.paymentModeId, this.paymentStatus, this.transactionStatus});
}

class EditPaymentArguments {
  bool isCardMode;
  int compatiblePayModeId;
  String? reference;
  String? creditCardName;
  String? nameOnCreditCard;
  String? cardNumber;
  String? authorization;

  EditPaymentArguments({
    required this.isCardMode,
    required this.compatiblePayModeId,
    this.reference,
    this.creditCardName,
    this.nameOnCreditCard,
    this.cardNumber,
    this.authorization
  });
}