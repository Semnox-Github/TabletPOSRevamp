import 'dart:math';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:master_data/builder.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:transaction_ui/cubit/transaction_cubit_state.dart';
import 'package:transaction_ui/transaction_summary_list_ctas.dart';
import 'package:widgets_library/utils/size_config.dart';

class TransactionSummaryListView extends StatefulWidget {
  final Function(TransactionSummaryListCtas transactionBottomCtas) _bottomCtasTappedCallback;

  const TransactionSummaryListView(this._bottomCtasTappedCallback, {super.key});

  @override
  State<StatefulWidget> createState() => _TransactionSummaryListViewState();
}

class _TransactionSummaryListViewState extends State<TransactionSummaryListView> {
  SemnoxTheme? theme;
  String currency = '';
  String amountFmt = '#,##0.00';

  @override
  void initState() {
    Future.microtask(() async {
      final execContextBL = await ExecutionContextBuilder.build();
      final masterDataBL = await MasterDataBuilder.build(execContextBL.getExecutionContext()!);
      currency = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CURRENCY_SYMBOL') ?? '';
      amountFmt = await masterDataBL.getDefaultValuesByName(defaultValueName: 'AMOUNT_FORMAT') ?? '#,##0.00';
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    theme = Theme.of(context).extension<SemnoxTheme>()!;
    return BlocBuilder<TransactionCubit, TransactionCubitState>(
        builder: (context, TransactionCubitState transactionCubitState) {
      return Container(
        padding: EdgeInsets.all(SizeConfig.getSize(1.0)),
        child: Row(
          children: [
            Expanded(
              flex: 10,
              child: IntrinsicWidth(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: _createBottomCtasView(MessagesProvider.get("Sub Total"),
                          transactionCubitState.transactionData?.transactionAmount ?? 0,
                              (dynamic callback) {
                            widget._bottomCtasTappedCallback(TransactionSummaryListCtas.SUB_TOTAL);
                          },TransactionSummaryListCtas.SUB_TOTAL),
                    ),
                    Expanded(
                      child: _createBottomCtasView(MessagesProvider.get("Discounts"),
                          transactionCubitState.transactionData?.transactionDiscountTotal ?? 0,
                          (dynamic callback) {
                        widget._bottomCtasTappedCallback(TransactionSummaryListCtas.DISCOUNTS);
                      },TransactionSummaryListCtas.DISCOUNTS),
                    ),
                    Expanded(
                      child: _createBottomCtasView(MessagesProvider.get("Taxes"),
                          transactionCubitState.transactionData?.transactionTaxTotal ?? 0,
                          (dynamic callback) {
                        widget._bottomCtasTappedCallback(TransactionSummaryListCtas.TAXES);
                      },TransactionSummaryListCtas.TAXES),
                    ),
                    Expanded(
                      child: _createBottomCtasView(MessagesProvider.get("Grand Total"),
                          transactionCubitState.transactionData?.transactionNetAmount ?? 0,
                          (dynamic callback) {
                        widget._bottomCtasTappedCallback(TransactionSummaryListCtas.TOTAL);
                      },TransactionSummaryListCtas.TOTAL),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  widget._bottomCtasTappedCallback(TransactionSummaryListCtas.SUMMARY);
                },
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.getSize(3.5)),
                  child: Image.asset(
                    'assets/ic_right_arrow_1.png',
                    color: theme?.secondaryColor,
                    width: SizeConfig.getWidth(24),
                    height: SizeConfig.getHeight(24),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _createBottomCtasView(String title, double info, dynamic onTapped, TransactionSummaryListCtas ctas) {
    return Container(
      margin: EdgeInsets.only(left: SizeConfig.getWidth(2.0), right: SizeConfig.getWidth(2.0)),
      decoration: BoxDecoration(
        color: theme?.cartItemCardBG,
        borderRadius: BorderRadius.circular(SizeConfig.getSize(4)),
      ),
      child: GestureDetector(
        onTap: () {
          widget._bottomCtasTappedCallback(ctas);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.getWidth(5.0),
                  top: SizeConfig.getHeight(5.0),
                  bottom: SizeConfig.getHeight(0.0),
                  right: SizeConfig.getWidth(5.0)),
              child: Text(
                title,
                style: theme?.textFieldStyle?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.getWidth(5.0),
                top: SizeConfig.getHeight(0),
                bottom: SizeConfig.getHeight(5.0),
                right: SizeConfig.getWidth(5.0)),
              child: Text(
                "$currency ${formatAmount(info)}",
                style: theme?.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w600, ),
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }

  String formatAmount(double amount) {
    final format = NumberFormat(amountFmt);
    return format.format(amount);
  }
}
