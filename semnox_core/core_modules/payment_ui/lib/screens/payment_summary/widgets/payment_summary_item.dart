import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:payment_ui/utils/colors.dart';
import 'package:payment_ui/utils/extensions.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:payment_ui/utils/styles.dart';
import 'package:messages_data/builder.dart';
import 'package:transaction_data/models/create_transaction/transaction_payment_dto.dart';

class PaymentSummaryItem extends StatelessWidget {
  final TransactionPaymentDTO? data;
  final String? dateFormat;
  final String currency;
  final String amountFmt;

  const PaymentSummaryItem({
    Key? key,
    required this.data,
    required this.currency,
    required this.amountFmt,
    this.dateFormat
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Container(
      color: theme.primaryColor ?? colorWhite,
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(12), vertical: SizeConfig.getHeight(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(MessagesProvider.get('Date'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w500) ?? tsS14W50016),
          Text(_getDate(data?.paymentDate ?? '2023-01-20T01:29:43.5651246'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
          SizedBox(height: SizeConfig.getHeight(8)),
          Text(MessagesProvider.get('Reference'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(22), fontWeight: FontWeight.w500) ?? tsS14W50016),
          Text(data?.reference?.toString() ?? '', style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
          SizedBox(height: SizeConfig.getHeight(8)),
          Text(MessagesProvider.get('Tip'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(22), fontWeight: FontWeight.w500) ?? tsS14W50016),
          Text('$currency ${formatAmount(data?.tipAmount ?? 0)}', style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
          SizedBox(height: SizeConfig.getHeight(8)),
          Text(MessagesProvider.get('Payment Status'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(22), fontWeight: FontWeight.w500) ?? tsS14W50016),
          Text(data?.paymentStatus ?? '', style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
        ],
      ),
    );
  }

  String formatAmount(double amount) {
    final format = NumberFormat(amountFmt);
    return format.format(amount);
  }

  String _getDate(String date) {
    final format = dateFormat ?? 'dd-MMM-yyyy hh:mm a';
    final dateTime = DateFormat(format).format(DateTime.parse(date));
    return dateTime;
  }
}
