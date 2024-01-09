import 'package:customer_data/models/address_dto.dart';
import 'package:customer_ui/utils/AppStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';


class AddressItem extends StatefulWidget{

  int selectedIndex = 0;
  int index = 0;
  AddressDTO? addressDTO;
  final Function(int value) onChange;
  VoidCallback? onPress;
  bool? isChecked = true;
  bool? isActive = true;

  AddressItem({required this.selectedIndex, required this.index,this.addressDTO,required this.onChange,this.onPress,
    this.isChecked,this.isActive});

  @override
  State<AddressItem> createState() => _AddressItemState();
}

class _AddressItemState extends State<AddressItem> {

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    bool _isChecked = widget.addressDTO?.isActive ?? true;
    return Visibility(
      visible: (widget.isActive == widget.isChecked) ? true : false,
      child: Container(
        decoration: BoxDecoration(
            //border:  (widget.selectedIndex == widget.index) ? Border.all(color: Colors.black) : null,
            borderRadius: BorderRadius.circular(8),
            color: theme.tableRow1
        ),
        padding: const EdgeInsets.symmetric(vertical: 0),
        margin:  const EdgeInsets.symmetric(vertical: 4.0,horizontal: 8.0),
        child: ListTile(
          dense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 0),
          visualDensity: const VisualDensity(horizontal: 0, vertical: 0),
          title: Row(
            children: [
              Expanded(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 5,),
                      Text(widget.addressDTO?.addressType == 1?MessagesProvider.get('Work'):MessagesProvider.get('Home'), style: AppStyle.customerText.copyWith(color: theme.secondaryColor,fontSize: SizeConfig.getFontSize(20)),maxLines: 1,),
                      SizedBox(width: SizeConfig.getSize(40),),
                      SizedBox(
                        height:SizeConfig.getSize(24),
                        width:SizeConfig.getSize(24),
                        child: Checkbox(
                          value:  widget.addressDTO?.isDefault,
                          onChanged: (bool? value){
                            setState(() {
                              //widget.isChecked = value!;
                            });
                          },
                          checkColor: theme.secondaryColor,
                          activeColor: theme.backGroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          side: MaterialStateBorderSide.resolveWith(
                                (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                          ),),
                      ),
                      SizedBox(width:  SizeConfig.getSize(50),),
                      Text('${widget.addressDTO?.line1},${widget.addressDTO?.city},${widget.addressDTO?.countryName}' ?? "", style: AppStyle.customerText.copyWith(color: theme.secondaryColor,fontSize: SizeConfig.getFontSize(20)),maxLines: 1,),
                    ],
                  ),
                ),
              ),
              //Spacer(),
              Expanded(
                flex: 1,
                  child: Container()),
              Expanded(
                flex: 1,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Checkbox(value:  _isChecked,
                onChanged: (bool? value){
                    setState(() {
                      //widget.isChecked = value!;
                    });
                },
                        checkColor: theme.secondaryColor,
                        activeColor: theme.backGroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                        ),),
                  ))
              ,
              Expanded(
                flex: 1,
                  child: IconButton(onPressed: widget.onPress, icon: Image.asset("assets/ic_edit.png", color : theme.secondaryColor)))
            ],
          ),
          onTap: (){
            setState(() {
              widget.selectedIndex = widget.index;
              widget.onChange(widget.index);
            });
          },
        ),
      ),
    );

  }
}