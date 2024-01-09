import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:customer_data/models/address_dto.dart';
import 'package:customer_data/models/relationships/customer_relationship_data.dart';
import 'package:customer_ui/widgets/SearchItemWidget.dart';
import 'package:customer_data/models/customer_data.dart';
import 'package:customer_ui/widgets/SearchItemWidgetRelationships.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:themes_library/themes_library.dart';



import '../NewRelationshipDialog.dart';
import '../utils/AppStyle.dart';
import '../utils/size_config.dart';

class RelatioshipSearchListItem extends StatefulWidget{

  int _selectedIndex = 0;
  int _index = 0;
  List<CustomerRelationshipData?>? _data = [];
  final Function(int value) onChange;

  RelatioshipSearchListItem({super.key, required int selectedIndex, required int index,List<CustomerRelationshipData?>? data,required this.onChange}){
    _selectedIndex = selectedIndex;
    _index = index;
    _data = data;
  }

  @override
  State<RelatioshipSearchListItem> createState() => _RelatioshipSearchListItemState();
}

class _RelatioshipSearchListItemState extends State<RelatioshipSearchListItem> {
  final _addressFormKey = GlobalKey<FormState>();
  final _addressCtr = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Padding(
      padding: EdgeInsets.all(3),
      child: Container(
        alignment: Alignment.centerLeft,
        height: SizeConfig.getSize(72),
        decoration: BoxDecoration(
          border:  (widget._selectedIndex == widget._index) ? Border.all(color: theme.secondaryColor!) : null,
          borderRadius: BorderRadius.circular(8),
          color: theme.tableRow1,
        ),
        child: ListTile(
          dense:true,
          contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
          title: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: SizeConfig.getSize(60),),
                Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(40),
                  child: Text((widget._data?[widget._index]?.id).toString(),style:theme.heading5?.copyWith(
                      fontSize: SizeConfig.getFontSize(18),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700
                  ),overflow: TextOverflow.ellipsis,),
                ),
                SizedBox(width: SizeConfig.getSize(50),),
                Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(140),child: Text((widget._data?[widget._index]?.relatedCustomerName).toString(),style: theme.heading5?.copyWith(
                    fontSize: SizeConfig.getFontSize(18),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700
                ),overflow: TextOverflow.ellipsis,),),
                SizedBox(width: SizeConfig.getSize(35),),
                Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(80),child: Text((widget._data?[widget._index]?.customerRelationshipTypeId==7?'Spouse':widget._data?[widget._index]?.customerRelationshipTypeId==8?'Child':widget._data?[widget._index]?.customerRelationshipTypeId==9?'Friend':'-').toString(),style: theme.heading5?.copyWith(
                    fontSize: SizeConfig.getFontSize(18),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700
                ),overflow: TextOverflow.ellipsis,),),
                SizedBox(width: SizeConfig.getSize(30),),
                Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(100),child: Text(widget._data?[widget._index]?.effectiveDate==null?'-':(DateFormat('MM-dd-yyyy').format(DateTime.parse(widget._data?[widget._index]?.effectiveDate ?? '-')) ?? '').toString() ?? "0.0",style: theme.heading5?.copyWith(
                    fontSize: SizeConfig.getFontSize(18),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700
                ),overflow: TextOverflow.ellipsis,),),
                SizedBox(width: SizeConfig.getSize(50),),
                Container(alignment:Alignment.centerLeft,width:SizeConfig.getSize(100),child: Text(widget._data?[widget._index]?.expiryDate==null?'-':(DateFormat('MM-dd-yyyy').format(DateTime.parse(widget._data?[widget._index]?.expiryDate ?? '-')) ?? '').toString() ?? "0.0",style: theme.heading5?.copyWith(
                    fontSize: SizeConfig.getFontSize(18),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700
                ),overflow: TextOverflow.ellipsis,),),
                Container(
                  alignment:Alignment.centerLeft  ,width:SizeConfig.getSize(130),
                  child: Row(children: [
                    Container(
                      child: Visibility(
                        visible:  true,
                        child: Transform.scale(
                          scale: 1.2,
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
                            value: widget._data?[widget._index]?.isActive,
                            onChanged:(bool? value) {

                            } ,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: (){
                          setState(() {
                            _showNewRelatioshipDialog("title", null, 1, true);

                          });
                        }, icon: Image.asset('assets/ic_edit.png',color :  theme.secondaryColor )),
                  ],),
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
      ),
    );
  }

  _showNewRelatioshipDialog(String title, AddressDTO? addressList,int index,bool add){
    bool? _isChecked = widget._data?[widget._index]?.isActive;
    bool isChanged = add ? false : true;
    showDialog(context: context,
        barrierDismissible: false,
        builder: (_) => StatefulBuilder(
            builder: (context, setState) {
              return NewRelationshipDialog(
                title: "EDIT RELATIONSHIP",
                addressController: _addressCtr,
                formKey: _addressFormKey,
                isChecked : _isChecked,
                isEdit: true,
                relationData : widget._data?[widget._index],
                onCheck: (value){
                  _isChecked = value;
                },
                onPress: (){

                },
              );
            }
        ));
  }

}
