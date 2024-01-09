import 'package:customer_ui/widgets/CustomerDialogButton.dart';
import 'package:customer_ui/widgets/CustomerDialogFormWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';

class VerifyCustomer extends StatelessWidget{

  var formKey = GlobalKey<FormState>();
  TextEditingController? controller;
  VoidCallback? onConfirm;
  VoidCallback? onSend;

  VerifyCustomer({required this.formKey,this.onSend,this.onConfirm,this.controller});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return AlertDialog(
        title:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15.0),
          child: Text(MessagesProvider.get("Verify Customer").toUpperCase(),style: theme.titleLight3?.copyWith(color : theme.secondaryColor),textAlign: TextAlign.center,),
        ),

        contentPadding: EdgeInsets.zero,
        //insetPadding: EdgeInsets.symmetric(vertical: 100),
        insetPadding: EdgeInsets.zero,
        content: _widget(context,theme),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          CustomerDialogButton(text: MessagesProvider.get("Cancel").toUpperCase(),background: false,
            onPress: (){
            Navigator.pop(context);
          },),
          CustomerDialogButton(text: MessagesProvider.get("Confirm").toUpperCase(),onPress: onConfirm,)
        ],
    );
  }

  Widget _widget(BuildContext context, SemnoxTheme theme){
    return Container(
      width: MediaQuery.of(context).size.width*0.5,
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(height: 1,color: theme.dividerColor,),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.2,
                      child: CustomerDialogFormWidget(title : MessagesProvider.get("*")+MessagesProvider.get("Verification Code"),
                          hint : MessagesProvider.get("Enter")+MessagesProvider.get("Verification Code"),
                          validation:MessagesProvider.get("Enter") +MessagesProvider.get("Verification Code"),
                          controller : controller,keyboardType: TextInputType.number,inputFormatter: "[0-9]",
                      maxLength: 10,),
                    ),
                    const SizedBox(width: 8.0,),
                    Column(
                      children: [
                        const SizedBox(height: 8.0,),
                        CustomerDialogButton(text: MessagesProvider.get("Send").toUpperCase(),
                          onPress:onSend,),
                      ],
                    )
                  ],
                ),
              ),
              Container(height: 1, color: theme.dividerColor,),
            ],
          ),
        ),
      ),
    );
  }
}