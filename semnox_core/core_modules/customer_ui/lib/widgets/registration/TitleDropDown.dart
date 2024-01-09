import 'package:customer_ui/utils/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';

import '../../utils/size_config.dart';


class TitleDropDown extends StatefulWidget{
  Function(dynamic)? onChange;
  String? validation;
  bool? visible;

  TitleDropDown({super.key, this.onChange,this.validation,this.visible});

  @override
  State<TitleDropDown> createState() => _TitleDropDownState();
}

class _TitleDropDownState extends State<TitleDropDown> {
  var _items = <DropdownMenuItem<String>>[];


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _dropdownItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Visibility(
      visible: widget.visible ?? true,
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(MessagesProvider.get("* ")+MessagesProvider.get("Title"), style:  theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.normal) ),
            const SizedBox(height: 4.0,),
            DropdownButtonFormField(
              items: _items,
              onChanged: widget.onChange,
              style: theme.heading6,
              isDense: true,
              validator: (value){
                if(widget.validation == null){
                  return null;
                }else if (value == null || value.isEmpty) {
                  return widget.validation;
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              hint: Text("Select Title",style: theme.textFieldHintStyle?.copyWith(fontSize: SizeConfig.getFontSize(18)),),
              decoration:  InputDecoration(
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(SizeConfig.getSize(12), SizeConfig.getSize(12), 2.0, 2.0),
              ),
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/down_arrow_white.png',height:SizeConfig.getSize(14),width:SizeConfig.getSize(18),color: AppColors.customerPageBackgroundColor,),
              ),
              isExpanded: true,
            )
          ],
        ),
      ),
    );
  }

  void _dropdownItems(){
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    _items = <DropdownMenuItem<String>>[
      DropdownMenuItem(
          value: "Mr.",
          child: Text("Mr.", style: theme.subtitle2)),
      DropdownMenuItem(
          value: "Ms.",
          child: Text("Ms.", style: theme.subtitle2)),
      DropdownMenuItem(
          value: "Mrs.",
          child: Text("Mrs.", style: theme.subtitle2))
    ];

    setState(() {

    });
  }
}
