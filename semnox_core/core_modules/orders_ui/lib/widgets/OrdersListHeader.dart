import 'package:flutter/cupertino.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:flutter/material.dart';
import 'package:widgets_library/utils/size_config.dart';

class OrderListHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Container()),
        Expanded(
            flex: 2,
            child: Text(MessagesProvider.get("Id").toUpperCase(),style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,)),
        Expanded(
            flex: 2,
            child: Text(MessagesProvider.get("Order Status"),style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign : TextAlign.center,overflow: TextOverflow.ellipsis,)),
        Expanded(
            flex: 2,
            child: Text(MessagesProvider.get("Tent No"),style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign : TextAlign.center,overflow: TextOverflow.ellipsis,)),
        Expanded(
            flex: 2,
            child: Text(MessagesProvider.get("Guest Name"),style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign : TextAlign.center,overflow: TextOverflow.ellipsis,)),
        Expanded(
            flex: 2,
            child: Text(MessagesProvider.get("Contact"),style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign : TextAlign.center,overflow: TextOverflow.ellipsis,)),
        Expanded(
            flex: 3,
            child: Text(MessagesProvider.get("Ordered Time"),style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign : TextAlign.center,overflow: TextOverflow.ellipsis,)),
        Expanded(
            flex: 2,
            child: Text(MessagesProvider.get("Trx Id"),style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign : TextAlign.center,overflow: TextOverflow.ellipsis,)),
        Expanded(
            flex: 2,
            child: Text(MessagesProvider.get("Amount"),style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign : TextAlign.center,overflow: TextOverflow.ellipsis,)),

      ],
    );
  }

}