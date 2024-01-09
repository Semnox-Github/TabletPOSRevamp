import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:customer_ui/widgets/SearchItemWidget.dart';
import 'package:customer_data/models/customer_data.dart';
import 'package:customer_ui/widgets/SearchItemWidgetAccounts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';



class AccountsSearchListItem extends StatefulWidget{

  int _selectedIndex = 0;
  int _index = 0;
  List<AccountDetailsData?>? _data = [];
  final Function(int value) onChange;
  String dateFormat = "";


  AccountsSearchListItem({super.key, required int selectedIndex, required int index,List<AccountDetailsData?>? data,required this.onChange,required this.dateFormat}){
    _selectedIndex = selectedIndex;
    _index = index;
    _data = data;
  }

  @override
  State<AccountsSearchListItem> createState() => _AccountsSearchListItemState();
}

class _AccountsSearchListItemState extends State<AccountsSearchListItem> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Container(
      height: SizeConfig.getSize(80),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border:  (widget._selectedIndex == widget._index) ? Border.all(color: theme.secondaryColor!) : null,
          borderRadius: BorderRadius.circular(8),
          color: theme.tableRow1,
      ),
      child: ListTile(
        dense:true,
        contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
        title: Padding(
          padding: EdgeInsets.only(bottom: SizeConfig.getSize(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(alignment:Alignment.center,width:SizeConfig.getSize(140),child: Text(widget._data?[widget._index]?.tagNumber.toString()?? "",style: theme.heading5?.copyWith(
                  fontSize: SizeConfig.getFontSize(18),
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700
              ),overflow: TextOverflow.ellipsis,),),
              Container(alignment:Alignment.center,width:SizeConfig.getSize(140),child: Text((widget._data?[widget._index]?.creationDate == "0001-01-01T00:00:00"  || widget._data?[widget._index]?.creationDate == null) ? "-" :(DateFormat(widget.dateFormat).format(DateTime.parse(widget._data?[widget._index]?.creationDate ?? '0001-01-01T00:00:00')) ?? '').toString() ?? "0.0",style:theme.heading5?.copyWith(
                  fontSize: SizeConfig.getFontSize(18),
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700
              ),overflow: TextOverflow.ellipsis,),),
              Container(alignment:Alignment.center,width:SizeConfig.getSize(140),child: Text((widget._data?[widget._index]?.expiryDate == "0001-01-01T00:00:00" || widget._data?[widget._index]?.expiryDate == null) ? "-" :(DateFormat(widget.dateFormat).format(DateTime.parse(widget._data?[widget._index]?.expiryDate ?? '0001-01-01T00:00:00')) ?? '').toString() ?? "0.0",style: theme.heading5?.copyWith(
                  fontSize: SizeConfig.getFontSize(18),
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700
              ),overflow: TextOverflow.ellipsis,),),

          Container(
            alignment:Alignment.centerLeft,
            width:90,
            child: Visibility(
              visible:  true,
              child: Transform.scale(
                scale: SizeConfig.getSize(2.9),
                child: Checkbox(
                  checkColor:theme.secondaryColor,
                  activeColor: theme.backGroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  side: MaterialStateBorderSide.resolveWith(
                        (states) =>  BorderSide(width: 1.0, color: theme.secondaryColor!),
                  ),
                  //fillColor: MaterialStateProperty.resolveWith(Colors.black),
                  value: widget._data?[widget._index]?.primaryAccount,
                  onChanged:(bool? value) {

                  } ,
                ),
              ),
            ),
          ),
            ],
          ),
        ),
        onTap: () =>{
          setState(() {
            widget._selectedIndex = widget._index;
            widget.onChange(widget._index);
          })
        },
      ),
    );
  }
}