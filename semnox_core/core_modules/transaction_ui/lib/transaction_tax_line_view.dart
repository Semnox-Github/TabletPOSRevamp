import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notificationbar_ui/AppColors.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/models/create_transaction/transaction_data.dart';
import 'package:transaction_data/models/create_transaction/transaction_line_dto.dart';
import 'package:transaction_data/models/create_transaction/transaction_tax_line_dto.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'cubit/transaction_cubit.dart';
import 'cubit/transaction_cubit_state.dart';

class TransactionTaxLine extends StatefulWidget{
  final String currency;
  final String amountFmt;
  const TransactionTaxLine({super.key, required this.currency, required this.amountFmt});

  @override
  State<TransactionTaxLine> createState() => _TransactionTaxLineState();
}

class _TransactionTaxLineState extends State<TransactionTaxLine> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionCubitState>(
        builder: (context, TransactionCubitState transactionCubitState) {
      return Container(
          child: (transactionCubitState.transactionData != null)
              ? _createTransactionLinesList(transactionCubitState.transactionData!)
             : null);
    });
  }

  Widget _createTransactionLinesList(TransactionData transaction) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    TransactionCubit transactionCubit = context.read<TransactionCubit>();
    List<TransactionLineDTO> transactionLineDTOList = transactionCubit.state.transactionData?.transactionLineDTOList?? [];

    return Scrollbar(
        thumbVisibility: true,
        radius: const Radius.circular(5),
        thickness: 5,
        controller: _scrollController,
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
                  itemCount: transactionLineDTOList.length ?? 0,
                  controller: _scrollController,
                  itemBuilder: (context, position) {
                    List<TransactionTaxLineDTO> taxLineDTO = transactionLineDTOList[position].transactionTaxLineDTOList;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: taxLineDTO.length ?? 0,
                      itemBuilder: (context, index) {
                        String rate =  "${widget.currency} ${formatAmount(taxLineDTO[index].taxAmount)}" ;
                        String productName  ="${taxLineDTO[index].taxName} - ${transactionLineDTOList[position].productName ?? ""}";
                        return GestureDetector(
                          onTap: (){

                          },
                          child: Container(
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
                                  style: theme.subtitleLight2?.copyWith(color : Colors.white, fontSize: SizeConfig.getFontSize(14)),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(width: 8.0,),
                                AutoSizeText(
                                  rate,
                                  minFontSize: 8,
                                  maxFontSize: 14,
                                  style: theme.subtitleLight2?.copyWith(color : Colors.white,fontSize: SizeConfig.getFontSize(14)),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        );
                      }
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