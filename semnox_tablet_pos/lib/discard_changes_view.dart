import 'package:customer_ui/widgets/CustomerDialogButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orders_ui/utils/AppStyle.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';


class DiscardChanges extends StatelessWidget{

  VoidCallback? onOk;

  DiscardChanges({super.key, this.onOk});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        title:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
          child: Text(MessagesProvider.get("Discard").toUpperCase(),style: AppStyle.customerTextBold.copyWith(color:theme.secondaryColor),textAlign: TextAlign.center,),
        ),
        contentPadding: EdgeInsets.zero,
        //insetPadding: EdgeInsets.symmetric(vertical: 100),
        insetPadding: EdgeInsets.zero,
        content: _widget(context,theme),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          CustomerDialogButton(text: MessagesProvider.get("No").toUpperCase(),background: false,
            onPress: (){
              Navigator.pop(context);
            },),
          CustomerDialogButton(text: MessagesProvider.get("Yes").toUpperCase(),onPress: onOk,)
        ],
      ),
    );
  }

  Widget _widget(BuildContext context,SemnoxTheme theme){
    return Container(
      width: MediaQuery.of(context).size.width*0.5,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(height: 1,color: theme.dividerColor,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Text(MessagesProvider.get("There are changes that have been not saved, do you want to discard these changes?"),style: theme.subtitle1?.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.center,)),
                const SizedBox(width: 8.0,),
              ],
            ),

            Container(height: 1,
              color: theme.dividerColor,),
          ],
        ),
      ),
    );
  }
}