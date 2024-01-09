import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class PageItem extends StatefulWidget{

  int index = 0;
  int selectedIndex = 0;
  final Function(int value) onChange;
  final Function(bool value1,bool value2,bool value3) onTap;
  Map<String,dynamic>? pageLists;
  bool? tableView = true;
  bool? orderView = true;
  bool? transactionView = true;

  PageItem({super.key, required this.index, required this.selectedIndex, required this.onChange,this.pageLists,
  this.tableView,this.orderView,this.transactionView,required this.onTap});

  @override
  State<PageItem> createState() => _PageItemState();
}

class _PageItemState extends State<PageItem> {

  bool _tableView = true;
  bool _orderView = true;
  bool _transactionView = true;

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    _tableView = ((widget.tableView ?? false) && widget.pageLists?['key'] == MessagesProvider.get("Table"));
    _orderView =  ((widget.orderView ?? false) && widget.pageLists?['key'] == MessagesProvider.get("Orders"));
    _transactionView =  ((widget.transactionView ?? false) && widget.pageLists?['key'] == MessagesProvider.get("Transactions"));

    return Column(
      children: [
        Visibility(
            visible: widget.pageLists?['visible'],
            child: ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 8.0),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(widget.pageLists?['key'],style : theme.title2?.copyWith( color: Colors.white,
                        fontSize: SizeConfig.getFontSize(27),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,),
                  ),
                  (_tableView || _orderView || _transactionView) ? Image.asset("assets/ic_up_arrow.png",color: Colors.white) : Image.asset("assets/ic_down.png",color: Colors.white),
                ],
              ),
              onTap: () =>{
                setState((){
                  if(widget.pageLists?['key'] == MessagesProvider.get("Table")){
                    widget.tableView = !widget.tableView!;
                  }else if(widget.pageLists?['key'] == MessagesProvider.get("Orders")){
                     widget.orderView = !widget.orderView!;
                  }else{
                     widget.transactionView = !widget.transactionView!;
                  }
                  if(widget.orderView == null && widget.tableView == null){
                    widget.onTap(false,false,widget.transactionView!);
                  }else{
                    widget.onTap(widget.tableView!,widget.orderView!,widget.transactionView!);
                  }
               })
              },
            )),
        Visibility(
          visible:  (_tableView || _orderView || _transactionView),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: (widget.selectedIndex == widget.index) ?  theme.sideNavListBGSelectedState: Colors.black ,
            ),
            child: ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 8.0),
              title: Text(widget.pageLists?['value'],style : theme.title3?.copyWith(
                  color: Colors.white,
                  fontSize: SizeConfig.getFontSize(25),
                  fontWeight: FontWeight.w500
              ),
                overflow: TextOverflow.ellipsis,),
              onTap: () =>{
                setState(() {
                  widget.selectedIndex = widget.index;
                  widget.onChange(widget.index);
                })
              },),
          ),
        ),
      ],
    );
  }
}