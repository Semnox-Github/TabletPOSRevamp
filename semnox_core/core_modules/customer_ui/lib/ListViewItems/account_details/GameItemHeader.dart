import 'package:flutter/cupertino.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';

import 'package:flutter/material.dart';
import 'package:widgets_library/utils/size_config.dart';

class GameItemHeader extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Row(
      children: [
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 12.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Game Profile"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Game"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 80,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Total"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 80,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Balance"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Frequency"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Monday"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Tuesday"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Wednesday"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Thursday"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Friday"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Saturday"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Sunday"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 150,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("From Date"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 150,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Expiry"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 120,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Last Played Time"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Ticket Allowed"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 120,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Entitlement Type"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Validity"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,),
      ],
    );
  }

}