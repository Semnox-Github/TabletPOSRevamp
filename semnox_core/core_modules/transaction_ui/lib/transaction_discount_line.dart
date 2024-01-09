import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notificationbar_ui/AppColors.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/models/create_transaction/transaction_data.dart';
import 'package:transaction_data/models/create_transaction/transaction_discount_applicable_line_dto.dart';
import 'package:transaction_data/models/create_transaction/transaction_discount_dto.dart';
import 'package:transaction_data/models/create_transaction/transaction_line_dto.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:transaction_ui/cubit/transaction_cubit_state.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:widgets_library/utils/size_config.dart';

class TransactionDiscountLine extends StatefulWidget{

  int selectedIndex = -1;
  int selectedDiscountIndex = -1;
  final String currency;
  final String amountFmt;
  final Function(int value1,int value2) onSelect;

  TransactionDiscountLine({super.key,
    required this.selectedIndex,required this.selectedDiscountIndex,
    required this.currency,required this.amountFmt,required this.onSelect});

  @override
  State<TransactionDiscountLine> createState() => _TransactionDiscountLineState();
}

class _TransactionDiscountLineState extends State<TransactionDiscountLine> {
  List<bool> _showDiscounts = [];
  List<ScrollController> _scrollController = [];
  final ScrollController _discountScrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    TransactionCubit transactionCubit = context.read<TransactionCubit>();
    List<TransactionDiscountDto> transactionDiscountDTOList = transactionCubit.state.transactionData?.transactionDiscountDTOList?? [];
    _showDiscounts = List.generate(transactionDiscountDTOList.length, (index) => false);
    _scrollController = List.generate(transactionDiscountDTOList.length, (index) => ScrollController());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionCubitState>(
        builder: (context, TransactionCubitState transactionCubitState) {
          return Container(
              child: (transactionCubitState.transactionData != null)
                  ? _createTransactionDiscountLinesList(transactionCubitState.transactionData!)
                  : null);
        });
  }


  Widget _createTransactionDiscountLinesList(TransactionData transaction) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    TransactionCubit transactionCubit = context.read<TransactionCubit>();
    List<TransactionDiscountDto> transactionDiscountDTOList = transactionCubit.state.transactionData?.transactionDiscountDTOList?? [];

    return Scrollbar(
        thumbVisibility: true,
        radius: const Radius.circular(5),
        thickness: 5,
        controller: _discountScrollController,
        child: BlocBuilder<TransactionCubit, TransactionCubitState>(
            builder: (context, TransactionCubitState transactionCubitState) {
              return GestureDetector(
                onTap: (){
                  setState(() {
                    if( widget.selectedDiscountIndex  == -1){
                      widget.selectedDiscountIndex = 0;
                      widget.selectedIndex = -1;
                    }else{
                      widget.selectedDiscountIndex = -1;
                    }
                    widget.onSelect(widget.selectedIndex,widget.selectedDiscountIndex);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
                  decoration:  BoxDecoration(
                      color: theme.tableRow1,
                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(6.0),bottomLeft: Radius.circular(6.0)),
                    border:  (widget.selectedDiscountIndex == 0 && (transactionDiscountDTOList.length > 0)) ? Border.all(color: Colors.black) : null,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: transactionDiscountDTOList.length ?? 0,
                    controller: _discountScrollController,
                    itemBuilder: (context, position) {
                      var list = transactionDiscountDTOList[position].transactionDiscountApplicableLineDTOList ;
                      String discountName =  transactionDiscountDTOList[position].discountName  ?? "" ;
                      String discountPercent = transactionDiscountDTOList[position].discountPercentage?.toStringAsFixed(1) ?? "";
                      String rate = transactionDiscountDTOList[position].discountAmount?.toStringAsFixed(2) ?? "";
                      return Container(
                        decoration: BoxDecoration(
                            border:  (widget.selectedIndex == position) ? Border.all(color: theme.secondaryColor!) : null,
                            borderRadius: BorderRadius.circular(8),
                            color: theme.tableRow1
                        ),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  for(int i =0; i < _showDiscounts.length ; i++){
                                    if(position == i){
                                      _showDiscounts[i] = !_showDiscounts[i];
                                    }else{
                                      _showDiscounts[i] = false;
                                    }
                                  }
                                  //_showDiscounts[position] = !_showDiscounts[position];
                                  widget.selectedIndex = position;
                                  widget.selectedDiscountIndex = -1;
                                  widget.onSelect(widget.selectedIndex,widget.selectedDiscountIndex);
                                 });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
                                margin: const EdgeInsets.only(top: 8.0),
                                decoration: BoxDecoration(
                                  color: theme.tableRow1,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    AutoSizeText(
                                      "${"$discountName - $discountPercent"} %",
                                      minFontSize: 14,
                                      maxFontSize: 14,
                                      style: theme.subtitle2?.copyWith(fontWeight: FontWeight.w500, fontSize: SizeConfig.getFontSize(14)),
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(width: 8.0,),
                                   (_showDiscounts[position]) ? Image.asset('assets/ic_up_arrow.png', height: 10, width: 10,color : theme.secondaryColor) : Image.asset('assets/ic_down.png', height: 10, width: 10,color : theme.secondaryColor),
                                    const Spacer(),
                                    AutoSizeText(
                                      rate,
                                      minFontSize: 8,
                                      maxFontSize: 14,
                                      style: theme.subtitle2?.copyWith(fontWeight: FontWeight.w500, fontSize: SizeConfig.getFontSize(14)),
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Visibility(
                                visible: _showDiscounts[position],
                                child: _createTransactionLinesList(transaction,list,position))
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            }));
  }

  Widget _createTransactionLinesList(TransactionData transaction, List<TransactionDiscountApplicableLineDto>? list, int position) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    TransactionCubit transactionCubit = context.read<TransactionCubit>();
    List<TransactionLineDTO> transactionLineDTOList = transactionCubit.state.transactionData?.transactionLineDTOList?? [];

    return Scrollbar(
        thumbVisibility: true,
        radius: const Radius.circular(5),
        thickness: 5,
        controller: _scrollController[position],
        child: BlocBuilder<TransactionCubit, TransactionCubitState>(
            builder: (context, TransactionCubitState transactionCubitState) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
                decoration: BoxDecoration(
                    color: theme.tableRow1,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(6.0),bottomLeft: Radius.circular(6.0))
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: list?.length ?? 0,
                  controller: _scrollController[position],
                  itemBuilder: (context, position) {
                    var amount = list?[position].discountAmount;
                    String productName  =   "";
                      for(int i = 0; i < transactionLineDTOList.length ; i++){
                        if(transactionLineDTOList[i].transactionLineId == list?[position].transactionLineId){
                          productName = transactionLineDTOList[i].productName;
                        }
                      }
                      String rate = "${widget.currency} ${formatAmount(amount)}" ;
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
                      margin: const EdgeInsets.only(top: 8.0),
                      decoration: BoxDecoration(
                        color: AppColors.taxLineBg,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            productName,
                            minFontSize: 14,
                            maxFontSize: 14,
                            style: theme.subtitleLight2?.copyWith(color : Colors.white),
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(width: 8.0,),
                          AutoSizeText(
                            rate,
                            minFontSize: 8,
                            maxFontSize: 14,
                            style: theme.subtitleLight2?.copyWith(color : Colors.white),
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
        }));
  }

  String formatAmount(double amount) {
    final format = NumberFormat(widget.amountFmt);
    return format.format(amount);
  }
}