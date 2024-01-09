import 'dart:convert';

import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:customer_data/models/account_details/account_discount_dto.dart';
import 'package:customer_data/models/account_details/summaries_data.dart';
import 'package:customer_ui/utils/AppColors.dart';
import 'package:customer_ui/utils/extensions.dart';
import 'package:customer_ui/widgets/SearchItemWidget.dart';
import 'package:customer_data/models/customer_data.dart';
import 'package:customer_ui/widgets/SearchItemWidgetAccounts.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/discount_container/discount_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:themes_library/themes_library.dart';



import '../utils/AppStyle.dart';
import '../utils/size_config.dart';

class DiscountsSearchItem extends StatefulWidget{

  int _selectedIndex = 0;
  int _index = 0;
  List<AccountDiscountData?>? _data = [];
  final Function(int value) onChange;
  final NotificationBar notificationBar;


  DiscountsSearchItem({super.key, required int selectedIndex, required int index,List<AccountDiscountData?>? data,required this.onChange, required this.notificationBar}){
    _selectedIndex = selectedIndex;
    _index = index;
    _data = data;
  }

  @override
  State<DiscountsSearchItem> createState() => _DiscountsSearchItemState();
}

class _DiscountsSearchItemState extends State<DiscountsSearchItem> {
  NotificationBar? _notificationBar;
  bool _isLoading = false;
  List<DiscountContainerDto>? _discountListValues;
  DiscountContainerDto? _selectedDiscountData;

  @override
  void initState() {
    super.initState();
    _notificationBar = widget.notificationBar;
    getDiscountContainerData(context);
  }

  Future getDiscountContainerData(BuildContext context) async {
    var execContextBL = await ExecutionContextBuilder.build();
    var sysExecContext = execContextBL.getExecutionContext();
    var masterDataBl = await MasterDataBuilder.build(sysExecContext!);
    _discountListValues = await masterDataBl.getDiscounts();
    setState(() {
      _selectedDiscountData = _discountListValues?.firstWhere((element) => element.discountId == widget._data?[widget._index]?.discountId );
    });
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
         border:  (widget._selectedIndex == widget._index) ? Border.all(color: theme.tableRowSelectedState1!) : null,
        borderRadius: BorderRadius.circular(8),
        color: theme.tableRow1,
      ),
      child: ListTile(
        dense:true,
        contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
        title: Padding(
          padding: EdgeInsets.only(bottom: 0,left: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(100),child: Text(_selectedDiscountData?.discountName ?? '',style: theme.heading5?.copyWith(
                                      fontSize: SizeConfig.getFontSize(18),
                                      fontWeight: FontWeight.w700
                                  ),overflow: TextOverflow.ellipsis,),),
              SizedBox(width: SizeConfig.getSize(25),),
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(80),child: Text(widget._data?[widget._index]?.expiryDate =="0001-01-01T00:00:00" ||widget._data?[widget._index]?.expiryDate == null ? "-" :(DateFormat('dd-MMM-yyyy HH:mm:ss a').format(DateTime.parse(widget._data?[widget._index]?.expiryDate ?? '-')) ?? '').toString() ?? "0.0",style: theme.heading5?.copyWith(
                                      fontSize: SizeConfig.getFontSize(18),
                                      fontWeight: FontWeight.w700
                                  ),overflow: TextOverflow.ellipsis,),),
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(100),child: Text((_selectedDiscountData?.discountPercentage).toString(),style: theme.heading5?.copyWith(
                                      fontSize: SizeConfig.getFontSize(18),
                                      fontWeight: FontWeight.w700
                                  ),overflow: TextOverflow.ellipsis,),),
              SizedBox(width: SizeConfig.getSize(30),),
              Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(60),child: Text(_selectedDiscountData?.discountAmount ?? '',style: theme.heading5?.copyWith(
                                      fontSize: SizeConfig.getFontSize(18),
                                      fontWeight: FontWeight.w700
                                  ),overflow: TextOverflow.ellipsis,),),
              Container(alignment:Alignment.center,width:SizeConfig.getSize(80),child: Text(_selectedDiscountData?.discountType ?? '',style: theme.heading5?.copyWith(
                                      fontSize: SizeConfig.getFontSize(18),
                                      fontWeight: FontWeight.w700
                                  ),overflow: TextOverflow.ellipsis,),),
              Container(alignment:Alignment.center,width:SizeConfig.getSize(65),child: Text(_selectedDiscountData?.minimumSaleAmount ?? '',style: theme.heading5?.copyWith(
                                      fontSize: SizeConfig.getFontSize(18),
                                      fontWeight: FontWeight.w700
                                  ),overflow: TextOverflow.ellipsis,),),
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