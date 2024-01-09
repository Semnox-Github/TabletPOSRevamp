import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class TransactionDropDownForm extends StatelessWidget{

  Function(dynamic)? onChange;
  String title;
  var items;
  var value;
  /* = [
    DropdownMenuItem(value: StringsProvider.get("all"),child: Text(StringsProvider.get("all")),),
    DropdownMenuItem(value: StringsProvider.get("restaurant"),child: Text(StringsProvider.get("restaurant")),)
  ];*/
  TransactionDropDownForm({super.key, required this.title,this.onChange,required this.items,this.value});

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
           DropdownButtonFormField(
             items: items,
             onChanged: onChange,
             value: value,
             isDense: true,
             isExpanded: true,
             enableFeedback: true,
             style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(16)),
             decoration: InputDecoration(
               hintText: "All",
               hintStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(16), color: theme.dividerColor),
               enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(8.0),
                 borderSide: BorderSide(color: theme.dividerColor!, width: 1.0),
               ),
               focusedBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(8.0),
                 borderSide: BorderSide(color: theme.dividerColor!, width: 1.0),
               ),
               isDense: true,
               contentPadding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
             ),
           )
         ],
     ),
   );
  }

}