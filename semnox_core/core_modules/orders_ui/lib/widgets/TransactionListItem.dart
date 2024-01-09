import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/configurations/configuration_response.dart';
import 'package:master_data/models/configurations/parafait_default_container_dto.dart';
import 'package:orders_data/models/transactions/transaction_data.dart';
import 'package:intl/intl.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class TransactionListItem extends StatefulWidget{

  int selectedIndex = 0;
  int index = 0;
  final Function(int value) onChange;
  TransactionsData? data;
  String? dateFormat;

  TransactionListItem({required this.selectedIndex, required this.index, required this.onChange,this.data,this.dateFormat});

  @override
  State<TransactionListItem> createState() => _TransactionListItemState();
}

class _TransactionListItemState extends State<TransactionListItem> {

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    var parsedDate = DateTime.parse(widget.data?.transactionDate.toString() ?? "1974-03-20 00:00:00.000");
    var trxDate = DateFormat('dd-MMM-yyyy hh:mm:ss a').format(parsedDate);
    trxDate =  DateFormat(widget.dateFormat).format(parsedDate);
    return GestureDetector(
      onTap: ()=>{
        setState((){
          widget.selectedIndex = widget.index;
          widget.onChange(widget.index);
        })
      },
      child: Container(
        margin:  EdgeInsets.only(bottom: SizeConfig.isBigDevice() ? 8.0 : 4.0),
        padding: EdgeInsets.symmetric(vertical:SizeConfig.isBigDevice() ? 10 : 8.0),
        decoration: BoxDecoration(
            border:  (widget.selectedIndex == widget.index) ? Border.all(color: theme.secondaryColor!) : null,
            borderRadius: BorderRadius.circular(8),
            color:  theme.listTileBG
        ),
        child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(widget.data?.transactionId.toString() ?? "",style: theme.subtitle3?.copyWith(color : theme.secondaryColor,fontWeight: FontWeight.w600, fontSize: SizeConfig.getFontSize(16)),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,)),
              Expanded(
                  flex: 1,
                  child: Text(widget.data?.transactionNumber.toString() ?? "",style: theme.subtitle3?.copyWith(color : theme.secondaryColor,fontWeight: FontWeight.w600, fontSize: SizeConfig.getFontSize(16)),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,)),
              Expanded(
                  flex: 2,
                  child: Text(trxDate ?? "",style: theme.subtitle3?.copyWith(color : theme.secondaryColor,fontWeight: FontWeight.w600, fontSize: SizeConfig.getFontSize(16)),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,)),
              Expanded(
                  flex: 1,
                  child: Text(widget.data?.orderId.toString() ?? "",style: theme.subtitle3?.copyWith(color : theme.secondaryColor,fontWeight: FontWeight.w600, fontSize: SizeConfig.getFontSize(16)),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,)),
              Expanded(
                  flex: 1,
                  child: Text(widget.data?.transactionAmount.toStringAsFixed(2).toString() ?? "",style: theme.subtitle3?.copyWith(color : theme.secondaryColor,fontWeight: FontWeight.w600, fontSize: SizeConfig.getFontSize(16)),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,)),
            ],
          ),


      ),
    );
  }

}