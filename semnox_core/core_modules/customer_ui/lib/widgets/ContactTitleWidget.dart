import 'package:flutter/cupertino.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:flutter/material.dart';

import '../utils/size_config.dart';


class ContactTitleWidget extends StatelessWidget{

  String type;
  ContactTitleWidget(this.type);

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Row(
      children: [
        SizedBox(width: 10,),
        Visibility(
          visible:true,
          child: Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(MessagesProvider.get("Type"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20)),maxLines: 1,),
            ),
          ),
        ),
        Visibility(
          visible: (type == MessagesProvider.get("Address")) ? true : false,
          child: Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(MessagesProvider.get("Default"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20)),maxLines: 1,),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(MessagesProvider.get("Value"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20)),maxLines: 1,),
          ),
        ),
        //Spacer(),
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(MessagesProvider.get("Active"), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign: TextAlign.right,maxLines: 1,),
          ),
        ),
        Expanded(
          flex: 1,
            child: Container())
      ],
    );
  }

}