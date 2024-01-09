enum TransactionSummaryListCtas {
  DISCOUNTS(0, "Discounts"),
  SUB_TOTAL(1, "Sub Total"),
  TAXES(2, "Taxes"),
  TOTAL(3, "Total"),
  SUMMARY(4, "Summary");

  const TransactionSummaryListCtas(this.key, this.value);

  final int key;
  final String value;
}

class TransactionFooterCtaList {
  static List<TransactionSummaryListCtas>? ctas;

  void init() {
    ctas = [
      TransactionSummaryListCtas.DISCOUNTS,
      TransactionSummaryListCtas.SUB_TOTAL,
      TransactionSummaryListCtas.TAXES,
      TransactionSummaryListCtas.TOTAL,
      TransactionSummaryListCtas.SUMMARY,
    ];
  }
}
