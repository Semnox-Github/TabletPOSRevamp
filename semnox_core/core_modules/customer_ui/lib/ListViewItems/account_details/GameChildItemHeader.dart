import 'package:flutter/cupertino.dart';
import 'package:messages_data/builder.dart';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';


class GameChildItemHeader extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
   return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: 80,
            alignment: Alignment.center,
            child: Text(MessagesProvider.get("Extended"), style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
        const SizedBox(height: 4.0,),
        Row(
          children: [
            Container(
                width: 100,
                margin: const EdgeInsets.only(left: 8.0,),
                alignment: Alignment.center,
                child: Text(MessagesProvider.get("Profile Name"), style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
            Container(
                width: 120,
                margin: const EdgeInsets.only(left: 12.0,),
                alignment: Alignment.center,
                child: Text(MessagesProvider.get("Game Name"), style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
            Container(
                width: 100,
                margin: const EdgeInsets.only(left: 12.0,),
                alignment: Alignment.center,
                child: Text(MessagesProvider.get("Excluded?"), style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),

          ],
        ),
      ],
    );
  }

}