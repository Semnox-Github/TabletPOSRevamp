import 'package:customer_ui/utils/AppStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';

import '../utils/size_config.dart';

class CustomerFormDropDown extends StatelessWidget{

  String title;
  String? hint;
  TextEditingController? controller;
  bool enable = true;
  String? validation;
  int? maxLength;
  TextInputType? keyboardType;

  CustomerFormDropDown({required this.title, this.hint, this.controller,required this.enable,this.validation,this.maxLength,
    this.keyboardType});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: enable ? theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.normal) : AppStyle.customerDisableText?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.normal),),
        const SizedBox(height: 4.0,),
        Padding(
          padding: const EdgeInsets.only(left: 0),
          child: DropdownButtonFormField<String>(
            style: theme.heading5?.copyWith(
                fontSize:SizeConfig.getFontSize(18),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
               EdgeInsets.fromLTRB(2, SizeConfig.getSize(5), 0, SizeConfig.getSize(10)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            items: <String>[MessagesProvider.get('Mr'), MessagesProvider.get('Mrs'), MessagesProvider.get('Ms')]
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                    padding:EdgeInsets.only(left:5),child: Text(value)),
              );
            }).toList(),
            icon:  Icon(
              Icons.arrow_drop_down,
              color: theme.secondaryColor,
            ),
            hint:  Padding(
              padding: EdgeInsets.only(left:5),
              child: Text(
                controller?.text ?? MessagesProvider.get('Mr'),
                style: TextStyle(color: theme.secondaryColor)?.copyWith(fontSize: SizeConfig.getFontSize(18)),
              ),
            ),
            onChanged: (value) {
                controller?.text = value!;
            },
          ),
        ),
        const SizedBox(height: 10.0,)
      ],
    );
  }

}