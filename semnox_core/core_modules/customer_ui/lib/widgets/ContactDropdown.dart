import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';

import '../utils/AppStyle.dart';
import '../utils/size_config.dart';

class ContactDropDown extends StatelessWidget{

  String hint;
  String? validationText;
  List<DropdownMenuItem>? item;
  dynamic value;
  Function(dynamic)? onChange;

  ContactDropDown({required this.hint, this.validationText, this.item, this.value,
    this.onChange});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(MessagesProvider.get("Contact Type"), style: theme.heading6?.copyWith(fontSize:SizeConfig.getFontSize(20)) ),
        const SizedBox(height: 4.0,),
        DropdownButtonFormField(
          items: item,
          onChanged: onChange,
          value: value,
          validator: (value){
            if(validationText == null){
              return null;
            }else if (value == null || value.isEmpty) {
              return validationText;
            }
            return null;
          },
          hint: Text(hint,style:  theme.textFieldHintStyle?.copyWith(fontSize:SizeConfig.getFontSize(18)),),
          style: theme.textFieldStyle?.copyWith(fontWeight: FontWeight.w500,fontSize:SizeConfig.getFontSize(18)),
          isDense: true,
          decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintStyle: theme.textFieldHintStyle?.copyWith(fontSize:SizeConfig.getFontSize(18))
          ),
          icon: Image.asset('assets/down_arrow_white.png',height: 14,width: 18, color: value == null ? Colors.grey:theme.secondaryColor),
          isExpanded: true,)
      ],
    );
  }

}
