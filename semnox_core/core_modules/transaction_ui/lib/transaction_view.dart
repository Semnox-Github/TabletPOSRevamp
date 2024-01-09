library transaction_ui;

import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_ui/models/transaction_lines_group.dart';
import 'package:transaction_ui/transaction_summary_list_ctas.dart';
import 'package:transaction_ui/transaction_lines_list_view.dart';
import 'package:transaction_ui/transaction_summary_list_view.dart';
import 'package:widgets_library/utils/size_config.dart';

class TransactionView extends StatefulWidget {
  final Function(TransactionLinesGroup tappedTransactionLinesGroup, bool isSelected) onTransactionLineTapped;
  final Function(TransactionSummaryListCtas transactionBottomCtas) onTransactionSummaryTapped;
  final Function() onTransactionSeatNameUpdated;
  final bool bottomBar;
  final String currency;
  final String amountFmt;

  const TransactionView({
    super.key,
    required this.onTransactionLineTapped,
    required this.onTransactionSummaryTapped,
    required this.onTransactionSeatNameUpdated,
    required this.bottomBar,
    required this.currency,
    required this.amountFmt,
  });

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Column(
      children: <Widget>[
        Expanded(
          child: TransactionLinesListView(
              currency: widget.currency,
              amountFmt: widget.amountFmt,
              onTransactionLinesGroupTapped: (onTransactionLineTappedCallback, isSelected) {
            widget.onTransactionLineTapped(onTransactionLineTappedCallback, isSelected);
          }, onTransactionSeatNameUpdated: () {
            widget.onTransactionSeatNameUpdated();
          }),
        ),
        Visibility(
          visible: widget.bottomBar,
          child: Divider(
            thickness: SizeConfig.getSize(1),
            color: theme.dialogFooterInnerShadow,
            height: SizeConfig.getHeight(1),
          ),
        ),
        Visibility(
          visible: widget.bottomBar,
          child: Container(
              height: SizeConfig.getHeight(70),
              padding: EdgeInsets.only(
                  top: SizeConfig.getHeight(3.0),
                  bottom: SizeConfig.getHeight(3.0),
                  left: SizeConfig.getWidth(2.0),
                  right: SizeConfig.getWidth(2.0)),
              child: TransactionSummaryListView((TransactionSummaryListCtas tappedTransactionSummaryCta) {
                widget.onTransactionSummaryTapped(tappedTransactionSummaryCta);
              }),
          ),
        ),
      ],
    );
  }
}
