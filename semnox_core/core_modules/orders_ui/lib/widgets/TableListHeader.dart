import 'package:flutter/cupertino.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:flutter/material.dart';
import 'package:widgets_library/utils/size_config.dart';

class TableListHeader extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 1,
            child: Text(MessagesProvider.get("Id").toUpperCase(),style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,)),
        Expanded(
            flex: 2,
            child: Text(MessagesProvider.get("Table Name"),style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign : TextAlign.center,overflow: TextOverflow.ellipsis,)),
        Expanded(
            flex: 2,
            child: Text(MessagesProvider.get("Capacity"),style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign : TextAlign.center,overflow: TextOverflow.ellipsis,)),
        Expanded(
            flex: 2,
            child: Text(MessagesProvider.get("Facility"),style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign : TextAlign.center,overflow: TextOverflow.ellipsis,)),
        Expanded(
            flex: 3,
            child: Text(MessagesProvider.get("Current Status"),style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign : TextAlign.center,overflow: TextOverflow.ellipsis,)),
          Expanded(
            flex: 3,
            child: Text(MessagesProvider.get("Elapsed Time"),style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign : TextAlign.center,overflow: TextOverflow.ellipsis,)),
        Expanded(
            flex: 3,
            child: Text(MessagesProvider.get("Merged With"),style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign : TextAlign.center,overflow: TextOverflow.ellipsis,)),

      ],
    );
  }

}