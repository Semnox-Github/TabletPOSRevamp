import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class NewDropDownWidget extends StatelessWidget{

  String title;
  String hint;
  Function(dynamic)? onChange;
  String? validation;
  List<DropdownMenuItem>? item;
  dynamic value;

  NewDropDownWidget({super.key, required this.title, required this.hint, this.onChange, this.validation,
    this.item, this.value});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Expanded(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style:  theme.heading5?.copyWith(fontSize:  SizeConfig.getFontSize(20), fontWeight: FontWeight.normal) ),
        const SizedBox(height: 4.0,),
        DropdownButtonFormField(
          items: item,
          onChanged: onChange,
          style: theme.textFieldStyle,
          isDense: true,
          value : value,
          validator: (value){
            if(validation == null || validation == ''){
              return null;
            }else if (value == null ) {
              return validation;
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          hint: Text(hint, style: theme.textFieldHintStyle?.copyWith(fontSize: SizeConfig.getFontSize(16)), overflow: TextOverflow.ellipsis,),
          decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            isDense: true,
            contentPadding: EdgeInsets.fromLTRB(10, 10, 2.0, 2.0),
          ),
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/down_arrow_white.png',color: theme.dividerColor,),
          ),
          isExpanded: true,
        ),
        const SizedBox(height: 10.0,)
      ],
    ));
  }

}
