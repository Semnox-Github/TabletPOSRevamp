
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';

import '../utils/AppColors.dart';
import '../utils/AppStyle.dart';
import '../utils/size_config.dart';

class CustomerDetailTitle extends StatefulWidget{

  String title;
  String buttonText;
  VoidCallback? onPress;
  VoidCallback? onPressIcon;
  bool? active = true;
  var icon;
  Function(bool? value)? onCheck;


  CustomerDetailTitle({required this.title,required this.buttonText,this.onPress,this.active,this.onPressIcon,this.icon,
  this.onCheck});

  @override
  State<CustomerDetailTitle> createState() => _CustomerDetailTitleState();
}

class _CustomerDetailTitleState extends State<CustomerDetailTitle> {
  bool _isChecked = true;

  @override
  Widget build(BuildContext context) {
   SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
   SizeConfig.init(context);
   return Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
       Expanded(
         child: PhysicalModel(
           elevation:   0,
           color : theme.backGroundColor!,
           child: Container(
             //width: MediaQuery.of(context).size.width * 0.8,
             color: theme.backGroundColor!,
             //margin: const EdgeInsets.symmetric(vertical: 8.0),
             padding: const EdgeInsets.all(10.0),
             child: Text(widget.title,style: theme.heading4?.copyWith(color: theme.secondaryColor,fontSize: SizeConfig.getFontSize(20)),),
           ),
         ),
       ),
       Visibility(
         visible: widget.active  ?? true,
         child: Checkbox(
           checkColor: theme.secondaryColor,
           activeColor: theme.backGroundColor,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(5.0),
           ),
           side: MaterialStateBorderSide.resolveWith(
                 (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
           ),
           //fillColor: MaterialStateProperty.resolveWith(Colors.black),
           value: _isChecked,
           onChanged:(bool? value) {
             setState(() {
               _isChecked = value!;
               widget.onCheck!(_isChecked);
             });
           } ,
         ),
       ),
       Visibility(
           visible: widget.active  ?? true,
           child: Text(MessagesProvider.get("Active Only"),style: theme.subtitle2?.copyWith(color: theme.secondaryColor,fontSize: SizeConfig.getFontSize(18)),)),
       Container(
        // height:  MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width * 0.10,
         padding:  const EdgeInsets.only(left: 8.0,right: 8.0),
         child: ElevatedButton(
           onPressed: widget.onPress,
           style: ElevatedButton.styleFrom(
             padding:  const EdgeInsets.all(8.0),
             backgroundColor: theme.button2BG1,
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
           ),
           child: Text(widget.buttonText, style: AppStyle.customerTextBoldWhite.copyWith(fontSize: SizeConfig.getFontSize(18)),),),
       ),
       Padding(
         padding: EdgeInsets.all(5),
         child: Container(
           width: 36,
           height: 36,
           decoration: BoxDecoration(border: Border.all(color: theme.secondaryColor!,width: 2,),borderRadius: BorderRadius.circular(100)),
           child: IconButton(onPressed:widget.onPressIcon, icon: widget.icon),
         ),
       ),
     ],
   );
  }
}