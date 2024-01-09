import 'package:customer_ui/widgets/CustomerDialogButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:sprintf/sprintf.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';


class AllowOverride extends StatelessWidget{

  VoidCallback? onOk;
  String? status;

  AllowOverride({super.key, this.onOk,this.status});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        title:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
          child: Text(MessagesProvider.get("Allowed Override").toUpperCase(),style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)),textAlign: TextAlign.center,),
        ),
        contentPadding: EdgeInsets.zero,
        //insetPadding: EdgeInsets.symmetric(vertical: 100),
        insetPadding: EdgeInsets.zero,
        content: _widget(context,theme),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          CustomerDialogButton(text: MessagesProvider.get("cancel").toUpperCase(),background: false,
            onPress: (){
              Navigator.pop(context);
            },),
          CustomerDialogButton(text: MessagesProvider.get("ok").toUpperCase(),onPress: onOk,)
        ],
      ),
    );
  }

  Widget _widget(BuildContext context,SemnoxTheme theme){
    SizeConfig.init(context);
    return Container(
      width: MediaQuery.of(context).size.width*0.5,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(height: 1,color: Colors.black45,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Text(sprintf(MessagesProvider.get("The current state of the table is %s. Do you want to proceed?"),[status]),style:theme.subtitle1?.copyWith(fontWeight: FontWeight.w500, fontSize: SizeConfig.getFontSize(16)),textAlign: TextAlign.center,)),
                const SizedBox(width: 8.0,),
              ],
            ),

            Container(height: 1,
              color: Colors.black45,),
          ],
        ),
      ),
    );
  }
}