import 'package:customer_ui/utils/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:themes_library/themes_library.dart';

class CustomerDialogFormWidget extends StatelessWidget{
  String title;
  String? hint;
  TextEditingController? controller;
  bool? enable = true;
  String? validation;
  TextInputType? keyboardType;
  var inputFormatter;
  int? maxLength;

  CustomerDialogFormWidget({super.key,
    this.maxLength,
      required this.title, this.hint, this.controller, this.enable, this.validation,this.keyboardType,this.inputFormatter});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: (enable ?? true) ? theme.heading6 : theme.heading6?.copyWith(color: theme.dividerColor),),
        const SizedBox(height: 4.0,),
        TextFormField(
          enabled: enable,
          controller: controller,
          textAlign: TextAlign.start,
          style: theme.subtitle2?.copyWith(color : Colors.black),
          keyboardType: keyboardType,
          inputFormatters: [ FilteringTextInputFormatter.allow(RegExp(inputFormatter)),],
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLength: maxLength,
          validator: (value){
            if(validation == null){
              return null;
            }else if (value == null || value.isEmpty) {
              return validation;
            }
            return null;
          },
          decoration: InputDecoration(
              isDense: true,
              fillColor: AppColors.buttonBackgrounColor,
              filled: true,
              contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              hintText: hint,
              counterText: '',
              hintStyle: theme.subtitle2?.copyWith(color : Colors.black),
          ),),
        const SizedBox(height: 10.0,)
      ],
    );
  }

}