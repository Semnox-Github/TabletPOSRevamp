import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';


class SearchTextFormWidget extends StatelessWidget{

  String? hintText;
  String? validationText;
  TextEditingController? controller;
  TextInputType? keyboardType;
  String? inputFormatter;

  SearchTextFormWidget({super.key,
      this.hintText,
      this.validationText,
      this.controller,
      this.keyboardType,
      this.inputFormatter
  });

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return TextFormField(
      controller: controller,
      validator: (value){
        if(validationText == null){
          return null;
        }else if (value == null || value.isEmpty) {
          return validationText;
        }
        return null;
      },
      inputFormatters: inputFormatter != null ? [FilteringTextInputFormatter.allow(RegExp(inputFormatter!))] : null,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.dividerColor!),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.dividerColor!),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.footerBG3!),
        ),
        hintText: hintText,
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),
      style: theme.subtitle1?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(18)),
    );
  }


  /*if(hintText == "Enter Email" && controller!.text.isNotEmpty){
  if(!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(controller!.text))
  return "Enter valid email";
  }else*/
}