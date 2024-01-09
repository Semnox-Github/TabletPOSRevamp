import 'package:flutter/cupertino.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:flutter/material.dart';
import 'package:widgets_library/utils/size_config.dart';

class TransacationListHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
   SizeConfig.init(context);
   return Row(
     children: [
       Expanded(
           flex: 1,
           child: Text(MessagesProvider.get("trx id").toUpperCase(),style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,)),
       Expanded(
           flex: 1,
           child: Text(MessagesProvider.get("trx no").toUpperCase(),style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,)),
       Expanded(
           flex: 2,
           child: Text(MessagesProvider.get("trx date").toUpperCase(),style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,)),
       Expanded(
           flex: 1,
           child: Text(MessagesProvider.get("order no").toUpperCase(),style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,)),
       Expanded(
           flex: 1,
           child: Text(MessagesProvider.get("amount").toUpperCase(),style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,)),

     ],
   );
  }

}