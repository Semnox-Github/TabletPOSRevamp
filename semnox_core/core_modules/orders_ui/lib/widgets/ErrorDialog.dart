import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:orders_ui/utils/AppStyle.dart';
import 'package:themes_library/themes_library.dart';

showErrorDialog(BuildContext context, String title, String message) {
  SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
  showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(title,style: AppStyle.titleStyle,),
        ),
        content: Text(message,style: AppStyle.titleStyle,),
        actions: [
          CupertinoDialogAction(
            child: Text(MessagesProvider.get("Ok"),style: AppStyle.titleStyle,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      barrierDismissible: true);
}