import 'dart:convert';

import 'package:customer_data/models/account_details/purchase_data.dart';
import 'package:customer_ui/utils/AppColors.dart';
import 'package:customer_ui/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:themes_library/themes_library.dart';

import '../utils/size_config.dart';

class PurchaseSearchListItem extends StatefulWidget{

  int _selectedIndex = 0;
  int _index = 0;
  List<PurchaseData?>? _data = [];
  final Function(int value) onChange;
  final NotificationBar notificationBar;


  PurchaseSearchListItem({super.key, required int selectedIndex, required int index,List<PurchaseData?>? data,required this.onChange, required this.notificationBar}){
    _selectedIndex = selectedIndex;
    _index = index;
    _data = data;
  }

  @override
  State<PurchaseSearchListItem> createState() => _PurchaseSearchListItemState();
}

class _PurchaseSearchListItemState extends State<PurchaseSearchListItem> {
  NotificationBar? _notificationBar;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _notificationBar = widget.notificationBar;
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // border:  (widget._selectedIndex == widget._index) ? Border.all(color: Colors.black) : null,
        borderRadius: BorderRadius.circular(8),
        color: theme.tableRow1,
      ),
      child: ListTile(
        dense:true,
        contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
        title: Padding(
          padding: EdgeInsets.only(bottom: 0,left:5 ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(210),child: Text(widget._data?[widget._index]?.date =="0001-01-01T00:00:00" ? "-" :(DateFormat('dd-MMM-yyyy HH:mm:ss a').format(DateTime.parse(widget._data?[widget._index]?.date ?? '-')) ?? '').toString() ?? "0.0",style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,),),
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(240),child: Text(widget._data?[widget._index]?.product.toString()?? "",style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,),),
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(100),child: Text(widget._data?[widget._index]?.amount?.toStringAsFixed(2)?? "",style:theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,),),
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(110),child: Text(widget._data?[widget._index]?.credits?.toStringAsFixed(2)?? "",style:theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,),),
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(110),child: Text(widget._data?[widget._index]?.courtesy?.toStringAsFixed(2)?? "",style:theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,),),
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(100),child: Text(widget._data?[widget._index]?.bonus?.toStringAsFixed(2)?? "",style:theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,),),
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(85),child: Text(widget._data?[widget._index]?.time?.toStringAsFixed(2)?? "",style:theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,),),
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(75),child: Text(widget._data?[widget._index]?.tokens?.toStringAsFixed(2)?? "",style:theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,),),
              SizedBox(width: 10,),
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(55),child: Text(widget._data?[widget._index]?.tickets?.toStringAsFixed(2)?? "",style:theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,),),
              SizedBox(width: 30,),
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(75),child: Text(widget._data?[widget._index]?.playCredits?.toStringAsFixed(2)?? "",style:theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,),),
              SizedBox(width: 30,),
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(125),child: Text(widget._data?[widget._index]?.counterItems?.toStringAsFixed(2)?? "",style:theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,),),
              SizedBox(width: 10,),
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(125),child: Text(widget._data?[widget._index]?.loyaltyPoints?.toStringAsFixed(2)?? "",style:theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,),),
              SizedBox(width: 10,),
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(130),child: Text(widget._data?[widget._index]?.virtualPoints?.toStringAsFixed(2)?? "",style:theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,),),
              SizedBox(width: 10,),
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(220),child: Text(widget._data?[widget._index]?.site?? "",style:theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,),),
              SizedBox(width: 10,),
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(100),child: Text(widget._data?[widget._index]?.POS?? "",style:theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,),),
              SizedBox(width: 10,),
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(140),child: Text(widget._data?[widget._index]?.userName?? "",style:theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,),),
              SizedBox(width: 10,),
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(100),child: Text(widget._data?[widget._index]?.quantity?.toStringAsFixed(2)?? "",style:theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,),),
              SizedBox(width: 10,),
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(80),child: Text(widget._data?[widget._index]?.price?.toStringAsFixed(2)?? "",style:theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,),),

              SizedBox(width: 10,),
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(80),child: Text(widget._data?[widget._index]?.refId?.toStringAsFixed(0)?? "",style:theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,),),
              SizedBox(width: 10,),
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(150),child: Text(widget._data?[widget._index]?.activityType?? "",style:theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,),),
              SizedBox(width: 10,),
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(100),child: Text(widget._data?[widget._index]?.status?? "",style:theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,),),


              //Container(alignment:Alignment.center,width:SizeConfig.getSize(85),child: Text(widget._data?[widget._index]?.expiryDate ?? "-",style: AppStyle.customerTextBold,overflow: TextOverflow.ellipsis,),),

              /* Container(
                alignment:Alignment.centerLeft,
                width:85,
                child: Visibility(
                  visible:  true,
                  child: Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      checkColor: Colors.grey,
                      activeColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      side: MaterialStateBorderSide.resolveWith(
                            (states) => const BorderSide(width: 0.5, color: Colors.grey),
                      ),
                      //fillColor: MaterialStateProperty.resolveWith(Colors.black),
                      value: widget._data?[widget._index]?.primaryAccount,
                      onChanged:(bool? value) {

                      } ,
                    ),
                  ),
                ),
              ),*/
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
    ).withLoader(isLoading: _isLoading,theme: theme);
  }
  _showErrorDialogView(BuildContext context, String title, String message, int type) {
    showDialog(
        context: context, builder: (_) =>  _showDialogWidget(title,message,type));
  }
  _showDialogWidget(String title,String message, int type){
    return AlertDialog(
      title:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16.0),
        child: Text(title,
          style:GoogleFonts.robotoCondensed(
              color: Colors.black, fontSize: 26.0, fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
      ),
      contentPadding: EdgeInsets.zero,
      //insetPadding: EdgeInsets.symmetric(vertical: 100),
      insetPadding: EdgeInsets.zero,
      content: _widget(context,title,message),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: (){
              Navigator.pop(context);

            },
            style: ElevatedButton.styleFrom(
              padding:  const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32),
              backgroundColor: AppColors.backgrounColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            ),
            child: Text(MessagesProvider.get("No").toUpperCase(), style: GoogleFonts.robotoCondensed(
                color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w700),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
              setLoadingStatus(true);
              _notificationBar?.showMessage(
                  'Error occurred while retrieving server error message from the response.',
                  AppColors.notificationBGRedColor);
              setLoadingStatus(false);

            },
            style: ElevatedButton.styleFrom(
              padding:  const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32),
              backgroundColor: AppColors.primaryBlack,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            ),
            child: Text(MessagesProvider.get("Yes").toUpperCase(), style: GoogleFonts.robotoCondensed(
                color: Colors.white, fontSize: 19.0, fontWeight: FontWeight.w700),),
          ),
        )
      ],
    );
  }
  Widget _widget(BuildContext context, String title, String message){
    LineSplitter ls = LineSplitter();
    List<String> lines = ls.convert(message);
    if(lines.length > 1) {
      String message1 = lines[0];
      String message2 = lines[1];
    }
    return Container(
      width: MediaQuery.of(context).size.width*0.7,
      // padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 1,color: Colors.black26,),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 50),
            child: Column(
              children: [
                Visibility(
                  visible: lines.length > 1 ? true :false,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text( lines.length > 1 ? lines[0] :"",
                        style: GoogleFonts.robotoCondensed(
                            color: Colors.black, fontSize: 26.0, fontWeight: FontWeight.w700)
                    ),
                  ),
                ),
                Text(
                    lines.length > 1 ? lines[1] : message,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.robotoCondensed(
                        color: Colors.black, fontSize: 26.0, fontWeight: FontWeight.w400)
                ),
              ],
            ),
          ),
          Container(height: 1,color: Colors.black26,),
        ],
      ),
    );
  }
  void setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }
}