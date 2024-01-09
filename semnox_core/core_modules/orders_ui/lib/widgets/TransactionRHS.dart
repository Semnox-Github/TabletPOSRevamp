import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:orders_data/models/transactions/transaction_data.dart';
import 'package:orders_ui/widgets/TransactionDetailItem.dart';
import 'package:sprintf/sprintf.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';

class TransactionRHS  extends StatelessWidget{

  int selectedIndex = -1;
  int currentPage = 0;
  int pageSize = 50;
  int? totalData = 0;
  TransactionsData? data;
  VoidCallback? onPrevious;
  VoidCallback? onNext;
  String? dateFormat;

  TransactionRHS({super.key, required this.selectedIndex, required this.currentPage, required this.pageSize,
      this.totalData, this.data,this.onPrevious,this.onNext,this.dateFormat});

  final ScrollController _transactionScroll = ScrollController();
  final ScrollController _horizonatlScroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Column(
      children: [
        Container(
          color:  theme.tableRow1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: onPrevious ,
                icon: Image.asset('assets/back_arrow_white.png', color : selectedIndex != 0 ? theme.secondaryColor : Colors.black26),),
              Visibility(
                visible: totalData! > 0 ?  true : false,
                child: AutoSizeText("${sprintf(MessagesProvider.get("%s"),[totalData == 0 ? "": data?.transactionNumber.toString()])}\n${MessagesProvider.get("${((currentPage+1)*pageSize-pageSize+selectedIndex+1)} of $totalData")}",
                  style: theme.subtitle2?.copyWith(color : theme.secondaryColor, fontSize: SizeConfig.getFontSize(14)),),
              ),
              IconButton(onPressed: onNext,
                icon: Image.asset('assets/ic_right_arrow.png',color : selectedIndex+1 < (totalData ?? 0) ? theme.secondaryColor : Colors.black26),),
            ],
          ),
        ),
        Container(height: 1, color: Colors.black26,),
        Expanded(
          child: Visibility(
            visible:  totalData! > 0,
            child: Container(
              color: theme.tableRow1,
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0,left: 4.0,top: 4.0),
                child: RawScrollbar(
                  controller: _horizonatlScroll,
                  thumbVisibility: true,
                  trackVisibility: true,
                  trackBorderColor: theme.scrollBarHandle,
                  trackColor: theme.scrollArea,
                  thickness: 10,
                  thumbColor: theme.scrollBarHandle,
                  child: Container(
                    color: theme.backGroundColor,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: _horizonatlScroll,
                        child:  SizedBox(
                          width: 280,
                          child: Scroller(
                            controller: _transactionScroll,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              controller:_transactionScroll,
                              physics: const ScrollPhysics(),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0),
                                  child: TransactionDetailItem(data: data,index: 0,dateFormat: dateFormat,),
                                )
                              ],
                            )
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}