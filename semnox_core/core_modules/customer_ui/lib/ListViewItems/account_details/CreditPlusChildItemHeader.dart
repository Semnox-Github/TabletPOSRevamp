import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';


class CreditPlusChildItemHeader extends StatelessWidget{
  bool rules = false;


  CreditPlusChildItemHeader({super.key, required this.rules});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: 60,
            alignment: Alignment.center,
            child: Text((rules == true) ? MessagesProvider.get("Rules") : MessagesProvider.get("Criteria"), style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
        const SizedBox(height: 4.0,),
        Row(
          children: [
            Visibility(
              visible : rules == true ? true:false,
              child: Container(
                  width: 100,
                  alignment: Alignment.center,
                  child: Text(MessagesProvider.get("Category"), style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
            ),
            Container(
                width: 100,
                margin: const EdgeInsets.only(left: 8.0,),
                alignment: Alignment.center,
                child: Text(MessagesProvider.get("Product Name"), style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
            Visibility(
              visible : rules == true ? true:false,
              child: Container(
                  width: 100,
                  margin: const EdgeInsets.only(left: 12.0,),
                  alignment: Alignment.center,
                  child: Text(MessagesProvider.get("Order Type"), style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
            ),
            Visibility(
              visible : rules == true ? true:false,
              child: Container(
                  width: 100,
                  margin: const EdgeInsets.only(left: 12.0,),
                  alignment: Alignment.center,
                  child: Text(MessagesProvider.get("Game Profile"), style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
            ),
            Visibility(
              visible : rules == true ? true:false,
              child: Container(
                  width: 100,
                  margin: const EdgeInsets.only(left: 12.0,),
                  alignment: Alignment.center,
                  child: Text(MessagesProvider.get("Game Name"), style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
            ),
            Visibility(
              visible : rules == true ? true:false,
              child: Container(
                  width: 120,
                  margin: const EdgeInsets.only(left: 12.0,),
                  alignment: Alignment.center,
                  child: Text(MessagesProvider.get("Discount Percentage"), style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
            ),
            Visibility(
              visible : rules == true ? true:false,
              child: Container(
                  width: 100,
                  margin: const EdgeInsets.only(left: 12.0,),
                  alignment: Alignment.center,
                  child: Text(MessagesProvider.get("Discount Amount"), style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
            ),
            Visibility(
              visible : rules == true ? true:false,
              child: Container(
                  width: 100,
                  margin: const EdgeInsets.only(left: 12.0,),
                  alignment: Alignment.center,
                  child: Text(MessagesProvider.get("Discount Price"), style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
            ),
            Visibility(
              visible : rules == true ? true:false,
              child: Container(
                  width: 100,
                  margin: const EdgeInsets.only(left: 12.0,),
                  alignment: Alignment.center,
                  child: Text(MessagesProvider.get("Consumption Qty"), style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
            ),
            Visibility(
              visible : rules == true ? true:false,
              child: Container(
                  width: 100,
                  margin: const EdgeInsets.only(left: 12.0,),
                  alignment: Alignment.center,
                  child: Text(MessagesProvider.get("Balance"), style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
            ),
            Visibility(
              visible : rules == true ? true:false,
              child: Container(
                  width: 100,
                  margin: const EdgeInsets.only(left: 12.0,),
                  alignment: Alignment.center,
                  child: Text(MessagesProvider.get("Expiry Date"), style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
            ),
            Visibility(
              visible : rules == true ? true:false,
              child: Container(
                  width: 100,
                  margin: const EdgeInsets.only(left: 12.0,),
                  alignment: Alignment.center,
                  child: Text(MessagesProvider.get("Quality Limit"), style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
            ),
          ],
        ),
      ],
    );
  }

}