import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/utils/size_config.dart';

class TransactionInputForm extends StatelessWidget{

  TextEditingController? inputController;
  TextInputType? keyboardType;
  String? inputFormatter;
  String title;
  bool? numberPad;


  TransactionInputForm({this.inputController, required this.title,this.keyboardType,this.inputFormatter,this.numberPad});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Expanded(
      child: Column(
         crossAxisAlignment:  CrossAxisAlignment.start,
         children: [
           Text(title, style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,),
           const SizedBox(height: 4.0,),
           TextFormField(
             controller: inputController,
            // expands: true,
             readOnly: (numberPad ?? false ) ? true : false,
             showCursor: true,
             onTap: () => (numberPad ?? false ) ?
             showDialog(
                 barrierDismissible: true,
                 context: context,
                 barrierColor: const Color(0x01000000),
                 builder: (BuildContext context) {
                   return NumberPad(
                     initialOffset: Offset(50,50),
                     title:'',
                     isInitialRequired: true,
                     initialIntValue:  int.parse(inputController?.text != '' ? (inputController?.text  ?? '0')  : '0'),
                     onOkPressed: ( value) {
                       /*if(value >= totalPage){
                         currentPageController.text = totalPage.toString();
                       }else{
                         currentPageController.text = value.toString();
                       }*/
                       inputController?.text = value.toString();
                     },
                   );
                 }) : null,
             inputFormatters: inputFormatter != null ? [FilteringTextInputFormatter.allow(RegExp(inputFormatter!)),] : null,
             keyboardType: keyboardType ?? TextInputType.number,
             autovalidateMode: AutovalidateMode.onUserInteraction,
             style: theme.subtitle3?.copyWith(color : theme.secondaryColor,fontWeight: FontWeight.w500, fontSize: SizeConfig.getFontSize(16)),
             decoration: InputDecoration(
               enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(8.0),
                 borderSide: BorderSide(color: theme.dividerColor!, width: 1.0),
               ),
               focusedBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(8.0),
                 borderSide: BorderSide(color: theme.dividerColor!, width: 1.0),
               ),
               hintText: MessagesProvider.get("Enter"),
               hintStyle: theme.subtitle3?.copyWith(color : theme.dividerColor,fontWeight: FontWeight.w500, fontSize: SizeConfig.getFontSize(16)),
               isDense: true,
               contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
             ),
           )
         ],
      ),
    );
  }

}