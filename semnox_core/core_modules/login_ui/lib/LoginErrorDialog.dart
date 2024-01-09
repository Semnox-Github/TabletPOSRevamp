import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/AppColors.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class LoginErrorDialog extends StatelessWidget {
  String title;
  String message;

  LoginErrorDialog(this.title, this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        title: Padding(
          padding: EdgeInsets.only(bottom: SizeConfig.getHeight(28)),
          child: Text(
            title,
            style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(26)),
            textAlign: TextAlign.center,
          ),
        ),
        contentPadding: EdgeInsets.zero,
        //insetPadding: EdgeInsets.symmetric(vertical: 100),
        insetPadding: EdgeInsets.zero,
        content: _widget(context),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              // padding: EdgeInsets.symmetric(vertical: SizeConfig.getHeight(8.0), horizontal: SizeConfig.getWidth(8)),
              backgroundColor: theme.footerBG1 ?? AppColors.backgrounColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeConfig.getSize(4.0))),
            ),
            child: Text(MessagesProvider.get("OK"), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(22))),
          )
        ],
      ),
    );
  }

  Widget _widget(BuildContext context) {
    LineSplitter ls = const LineSplitter();
    List<String> lines = ls.convert(message);
    if (lines.length > 1) {
      String message1 = lines[0];
      String message2 = lines[1];
    }
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return SizedBox(
      width: SizeConfig.getWidth(649),
      // padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: SizeConfig.getHeight(1),
            color: theme.darkTextColor ?? Colors.black26,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: SizeConfig.getHeight(39.0), horizontal: SizeConfig.getWidth(50)),
            child: Column(
              children: [
                Visibility(
                  visible: lines.length > 1 ? true : false,
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.getSize(8.0)),
                    child: Text(lines.length > 1 ? lines[0] : "", style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(26))),
                  ),
                ),
                Text(lines.length > 1 ? lines[1] : message,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(26), fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          Container(
            height: SizeConfig.getHeight(1),
            color: theme.darkTextColor ?? Colors.black26,
          ),
        ],
      ),
    );
  }
}