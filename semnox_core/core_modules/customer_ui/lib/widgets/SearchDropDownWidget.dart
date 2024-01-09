import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

import '../utils/enums.dart';

class SearchDropDownWidget extends StatelessWidget{

  String hint;
  String? validationText;
  List<DropdownMenuItem>? item;
  dynamic value;
  Function(dynamic)? onChange;

  SearchDropDownWidget({super.key,
    required this.hint,
    this.validationText,
    this.item,this.value,this.onChange});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return DropdownButtonFormField(
        items: item,
        onChanged: onChange,
        value: value,
        validator: (value){
          if(value is OperatorEnum || value is FieldEnum){
            if (value == null || value.name.isEmpty) {
              return validationText;
            }
          }else if(validationText == null){
            return null;
          }else if (value == null || value.isEmpty) {
            return validationText;
          }
          return null;
        },
        hint: Text(hint, style: theme.subtitle2?.copyWith(color: theme.secondaryColor,fontSize: SizeConfig.getFontSize(18))),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        //style: AppStyle.hintTextStyle,
        isDense: true,
         decoration: value == null ?  InputDecoration(
          enabledBorder: OutlineInputBorder(
            //borderSide: BorderSide(color: AppColors.customerPageBackgroundColor),
            borderSide: BorderSide(color: theme.dividerColor!),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.dividerColor!),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.footerBG3!),
          ),
          isDense: true,
          contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        ) :
         InputDecoration(
           enabledBorder: OutlineInputBorder(
             borderSide: BorderSide(color: theme.dividerColor!),
           ),
           focusedBorder: OutlineInputBorder(
             borderSide: BorderSide(color: theme.dividerColor!),
           ),
           errorBorder: OutlineInputBorder(
             borderSide: BorderSide(color: theme.footerBG3!),
           ),
           isDense: true,
           contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
         ) ,
        icon: Image.asset('assets/down_arrow_white.png',height: 14,width: 18, color: value == null ? theme.dividerColor : theme.secondaryColor!,),
        isExpanded: true,);
  }
}