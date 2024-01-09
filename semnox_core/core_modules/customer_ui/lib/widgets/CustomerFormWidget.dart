import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:themes_library/themes_library.dart';

import '../utils/size_config.dart';

class CustomerFormWidget extends StatelessWidget{

  String title;
  String? hint;
  TextEditingController? controller;
  bool enable = true;
  String? validation;
  int? maxLength;
  TextInputType? keyboardType;
  bool? visible;
  bool? noSpace;

  CustomerFormWidget({super.key, required this.title, this.hint, this.controller,required this.enable,this.validation,this.maxLength,
  this.keyboardType,this.visible,this.noSpace});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Visibility(
      visible: visible ?? true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: enable ? theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.normal) : theme.heading6?.copyWith(color : Colors.grey,fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.normal),),
          const SizedBox(height: 4.0,),
          TextFormField(
            enabled: enable,
            keyboardType: keyboardType,
            controller: controller,
            maxLength:  maxLength,
            textAlign: TextAlign.start,
            style: enable ? theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize:SizeConfig.getFontSize(18)) : theme.textFieldHintStyle?.copyWith(fontSize:SizeConfig.getFontSize(16),color : Colors.grey),
            inputFormatters: [ FilteringTextInputFormatter.deny(RegExp(r'\s')),],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value){
              if(validation == null || validation == ''){
                return null;
              }else if (value == null || value.isEmpty) {
                return validation;
              }
              return null;
            },
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              counterText: "",
              hintText: hint,
              hintStyle: theme.textFieldHintStyle?.copyWith(color : Colors.grey,fontSize:SizeConfig.getFontSize(18)),
          ),),
          (noSpace ?? false) ? const SizedBox(height: 0.0,) : const SizedBox(height: 10.0,)
        ],
      ),
    );
  }

}