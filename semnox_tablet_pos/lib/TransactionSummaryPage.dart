import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:semnox_tablet_pos/AppStyle.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_functions/cubit/transaction_functions_cubit.dart';
import 'package:transaction_functions/transaction_function_dto.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:transaction_ui/transaction_header_view.dart';
import 'package:transaction_ui/models/transaction_lines_group.dart';
import 'package:transaction_ui/transaction_summary_list_ctas.dart';
import 'package:transaction_ui/transaction_view.dart';
import 'package:transaction_ui/transaction_summary_rhs.dart';


class TransactionSummaryScreen extends StatefulWidget {
  const TransactionSummaryScreen({super.key});

  @override
  State<TransactionSummaryScreen> createState() => _TransactionSummaryScreenState();
}

class _TransactionSummaryScreenState extends State<TransactionSummaryScreen> {

  late NotificationBar _notificationBar;

  TransactionLinesGroup? _selectedTransactionLinesGroup;
  String currency = '';
  String amountFmt = '#,##0.00';

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final execContextBL = await ExecutionContextBuilder.build();
      final masterDataBL = await MasterDataBuilder.build(execContextBL.getExecutionContext()!);
      currency = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CURRENCY_SYMBOL') ?? '';
      amountFmt = await masterDataBL.getDefaultValuesByName(defaultValueName: 'AMOUNT_FORMAT') ?? '#,##0.00';
      setState(() {});
    });
    _notificationBar = NotificationBar(showHideSideBar: false);
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: theme.backGroundColor,
        appBar: AppBar(
          backgroundColor:theme.backGroundColor,
          elevation: 0,
          automaticallyImplyLeading : false,
          titleSpacing: 0,
          title: Row(
            children: [
              Container(
                  height:  AppBar().preferredSize.height,
                  padding: const EdgeInsets.only(right: 12.0),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(8.0))
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/back_arrow_white.png'),
                        iconSize: 20.0,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(MessagesProvider.get("Transaction summary").toUpperCase(), style: theme.heading4?.copyWith(color : theme.light1)),
                    ],
                  )),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 8.0,right: 8.0),
                  height:  AppBar().preferredSize.height -2,
                  child: PhysicalModel(
                    elevation: 2.0,
                    color : theme.tableRow1!,
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0)),
                    child: Container(
                      height:  AppBar().preferredSize.height -2,
                      padding: const EdgeInsets.all( 8.0),
                      decoration: BoxDecoration(
                          color: theme.tableRow1,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0),bottomRight: Radius.circular(8.0))
                      ),
                      child:  const Text(""),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(child: Row(
              children: [
                Expanded(
                  flex : 5,
                    child: Container(
                      margin: const EdgeInsets.only(top: 8.0,left: 8.0),
                      color: theme.tableRow1,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: TransactionHeaderView(),
                          ),
                          Container(
                            height: 1,
                            color: Colors.black38,
                          ),
                          Expanded(
                            child: _getTransactionView(),
                          )
                        ],
                      ),
                    )),
                Expanded(
                  flex: 8,
                    child: Container(
                      margin: const EdgeInsets.only(top: 8.0,left: 8.0),
                      color: theme.backGroundColor,
                      child: TransactionSummaryRHS(currency: currency, amountFmt: amountFmt),
                    ))
              ],
            )),
            Container(
              color: Colors.green,
              child: _notificationBar,
            ),
          ],
        ),
      ),
    );
  }

  _getTransactionView() {
    return TransactionView(
      bottomBar: false,
      currency: currency,
      amountFmt: amountFmt,
      onTransactionLineTapped: (TransactionLinesGroup transactionLinesGroup, bool isSelected) {
        _selectedTransactionLinesGroup = isSelected ? transactionLinesGroup : null;
      },
      onTransactionSummaryTapped: (TransactionSummaryListCtas transactionBottomCtas) {},
      onTransactionSeatNameUpdated: () {},
    );
  }
}
