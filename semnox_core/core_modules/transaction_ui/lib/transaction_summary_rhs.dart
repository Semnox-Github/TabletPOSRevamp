import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/models/create_transaction/transaction_data.dart';
import 'package:transaction_data/models/create_transaction/transaction_discount_dto.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:transaction_ui/cubit/transaction_cubit_state.dart';
import 'package:transaction_ui/transaction_discount_line.dart';
import 'package:transaction_ui/transaction_tax_line_view.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:widgets_library/utils/size_config.dart';

class TransactionSummaryRHS extends StatefulWidget{
  final String currency;
  final String amountFmt;
  const TransactionSummaryRHS({super.key, required this.currency, required this.amountFmt});

  @override
  State<TransactionSummaryRHS> createState() => _TransactionSummaryRHSState();
}

class _TransactionSummaryRHSState extends State<TransactionSummaryRHS> {
  bool _showTaxLine = false;
  bool _showDiscount = false;
  int _selectedIndex = -1;
  int _selectedDiscountIndex = -1;

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
     return Stack(
       children: [
         BlocBuilder<TransactionCubit, TransactionCubitState>(
             builder:  (context, TransactionCubitState transactionCubitState) {
               return Container(
                padding: const EdgeInsets.only(right: 8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: ((_selectedIndex  != -1) || (_selectedDiscountIndex !=-1)) ? true : false,
                          child: Align(
                            alignment: Alignment.topRight,
                            child:   IconButton(onPressed: () async {
                              _removeDiscount(transactionCubitState);
                              }, icon: Image.asset('assets/ic_delete.png', height: 15, width: 15,color : theme.secondaryColor)) ,
                          ),
                        ),
                        _lineWidget(MessagesProvider.get("Sub Total").toUpperCase(),
                          transactionCubitState.transactionData?.transactionAmount ?? 0),
                        const SizedBox(height: 8.0,),
                        _lineWidget(MessagesProvider.get("Discounts").toUpperCase(),
                            transactionCubitState.transactionData?.transactionDiscountTotal ?? 0),
                        _lineDiscountListWidget(transactionCubitState.transactionData),
                        const SizedBox(height: 8.0,),
                        _lineWidget(MessagesProvider.get("Taxes").toUpperCase(),
                            transactionCubitState.transactionData?.transactionTaxTotal ?? 0),
                        _lineListWidget(transactionCubitState.transactionData),
                        Visibility(
                          visible: ((transactionCubitState.transactionData?.transactionLineDTOList.length ?? 0) > 0) ? false : true ,
                          child: Column(
                            children: [
                              const SizedBox(height: 8.0,),
                              _lineWidget(MessagesProvider.get("Service charges").toUpperCase(), -1),
                              const SizedBox(height: 8.0,),
                              _lineWidget(MessagesProvider.get("Packaging charges").toUpperCase(), -1),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8.0,),
                        _lineWidget(MessagesProvider.get("Grand Total").toUpperCase(),
                            transactionCubitState.transactionData?.transactionNetAmount ?? 0),
                      ],
                    ),
                  ),
                ),
              );
         }),
         BlocBuilder<TransactionCubit, TransactionCubitState>(
             builder: (context, transactionState) {
              /* if (transactionState.transactionDetailsUpdateStatusEnum ==
                   TransactionDetailsUpdateStatusEnum.error) {
                 WidgetsBinding.instance.addPostFrameCallback((_) {
                   _notificationBar.showMessage(
                       transactionState.transactionDetailsUpdateErrorString
                           .toString(),
                       Colors.red);
                   _initUpdateTransUpdateEnums();
                 });
               }*/
               return transactionState.transactionDetailsUpdateStatusEnum ==
                   TransactionDetailsUpdateStatusEnum.loading
                   ? Container(
                     width: MediaQuery.of(context).size.width,
                     height: MediaQuery.of(context).size.height,
                     decoration: BoxDecoration(
                       color: theme.secondaryColor?.withOpacity(.3),
                     ),
                     child: Center(
                       child: Container(
                         decoration: BoxDecoration(
                             color: theme.primaryColor,
                             borderRadius:
                             BorderRadius.all(Radius.circular(6))),
                         width: MediaQuery.of(context).size.width * .28,
                         child: Padding(
                           padding: const EdgeInsets.all(20.0),
                           child: Row(children: [
                             const SizedBox(width: 8),
                             const CircularProgressIndicator(),
                             const SizedBox(width: 24),
                             Expanded(
                               child: Text(
                                 MessagesProvider.get("Removing discount"),
                                 maxLines: 2,
                                 overflow: TextOverflow.ellipsis,
                               ),
                             ),
                           ]),
                         ),
                       ),
                     ),
                   )
                   : const SizedBox();
             })
       ],
     );
  }

  Widget _lineWidget(String title,double info,) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    var price = info == -1 ? '' : "${widget.currency} ${formatAmount(info)}";
    return GestureDetector(
      onTap: (){
        if(title == MessagesProvider.get("Taxes").toUpperCase()){
          setState((){
            _showTaxLine = !_showTaxLine;
            if(_showTaxLine == true){
              _showDiscount = false;
              _selectedIndex = -1;
              _selectedDiscountIndex = -1;
            }
          });
        }else if(title == MessagesProvider.get("Discounts").toUpperCase()){
          setState((){
            _showDiscount = !_showDiscount;
            if(_showDiscount == true){
              _showTaxLine = false;
            }else{
              _selectedIndex = -1;
              _selectedDiscountIndex = -1;
            }
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
        decoration: BoxDecoration(
          color: theme.tableRow1,
         borderRadius: (title == MessagesProvider.get("Taxes").toUpperCase() && _showTaxLine) ? BorderRadius.only(topRight: Radius.circular(4),topLeft: Radius.circular(4))
            : (title == MessagesProvider.get("Discounts").toUpperCase() && _showDiscount) ?  BorderRadius.only(topRight: Radius.circular(4),topLeft: Radius.circular(4))
             : BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            AutoSizeText(
              title,
              minFontSize: 14,
              maxFontSize: 14,
              style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(14)),
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(width: 8.0,),
            Visibility(
              visible: (title == MessagesProvider.get("Taxes").toUpperCase() || title == MessagesProvider.get("Discounts").toUpperCase() || title == MessagesProvider.get("Packaging charges").toUpperCase() ||
              title == MessagesProvider.get("Service charges").toUpperCase()) ? true : false ,
                child: ((title == MessagesProvider.get("Taxes").toUpperCase() && _showTaxLine)) ? Image.asset('assets/ic_up_arrow.png', height: 10, width: 10, color : theme.secondaryColor) : ((title == MessagesProvider.get("Discounts").toUpperCase() && _showDiscount)) ?
                Image.asset('assets/ic_up_arrow.png', height: 10, width: 10,color: theme.secondaryColor,) : Image.asset('assets/ic_down.png', height: 10, width: 10,color : theme.secondaryColor) ),
            const Spacer(),
            AutoSizeText(
              price,
              minFontSize: 14,
              maxFontSize: 14,
              style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(14)),
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

  String formatAmount(double amount) {
    final format = NumberFormat(widget.amountFmt);
    return format.format(amount);
  }

  Widget _lineDiscountListWidget(TransactionData? transactionData) {
    return Visibility(
      visible: _showDiscount,
      child: TransactionDiscountLine(selectedIndex: _selectedIndex, selectedDiscountIndex: _selectedDiscountIndex,
        currency: widget.currency,
        amountFmt: widget.amountFmt,
        onSelect: (value1,value2){
        print("values $value1 $value2");
          setState(() {
            _selectedIndex = value1;
            _selectedDiscountIndex = value2;
          });
        },
      ),
    );
  }

  Widget _lineListWidget(TransactionData? transactionData) {
    return Visibility(
      visible: _showTaxLine,
      child: TransactionTaxLine(currency: widget.currency, amountFmt: widget.amountFmt),
    );
  }

  _removeDiscount(TransactionCubitState transactionCubitState) async {
    if(_selectedDiscountIndex != -1) {
      final transactionState = context.read<TransactionCubit>();
      transactionState.initTransactionOrderDetailsErrorString();
      List<TransactionDiscountDto> transactionDiscountDTOList = transactionCubitState.transactionData?.transactionDiscountDTOList?? [];
      for(int i = 0 ; i< transactionDiscountDTOList.length ; i++){
        await transactionState.removeDiscountForTransaction(
          transactionDiscountId: transactionDiscountDTOList[i].transactionDiscountId ?? -1,
          discountAmount:0,
          discountId: transactionDiscountDTOList.isNotEmpty ? transactionDiscountDTOList[i].discountId ?? -1 : -1,
          couponNumber: transactionDiscountDTOList[i].couponNumber.toString() ,);
      }
    }
    else{
      final transactionState = context.read<TransactionCubit>();
      transactionState.initTransactionOrderDetailsErrorString();
      List<TransactionDiscountDto> transactionDiscountDTOList = transactionCubitState.transactionData?.transactionDiscountDTOList?? [];

      await transactionState.removeDiscountForTransaction(
        transactionDiscountId: transactionDiscountDTOList[_selectedIndex].transactionDiscountId ?? -1,
        discountAmount: 0,
        discountId: transactionDiscountDTOList.isNotEmpty ? transactionDiscountDTOList[_selectedIndex].discountId ?? -1 : -1,
        couponNumber: transactionDiscountDTOList[_selectedIndex].couponNumber.toString() ,);
    }
  }
}