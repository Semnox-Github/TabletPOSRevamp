import 'package:customer_data/models/account_details/account_game_extended_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:master_data/models/game_container/game_container_dto.dart';
import 'package:master_data/models/game_profile_container/game_profile_container_dto.dart';
import 'package:themes_library/themes_library.dart';
import 'package:flutter/material.dart';
import 'package:widgets_library/utils/size_config.dart';


class GameChildItem extends StatelessWidget{

  AccountGameExtendedDTO? data;
  int index = 0;
  List<GameProfileContainerDTO>? gameProfileContainer;
  List<GameContainerDTO>? gameContainer;

  GameChildItem({this.data, required this.index,this.gameContainer,this.gameProfileContainer});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    String gameProfile = "";
    for(int i = 0; i < (gameProfileContainer?.length ?? 0) ; i++){
      if(data?.gameProfileId == gameProfileContainer?[i].gameProfileId){
        gameProfile = gameProfileContainer?[i].profileName ?? "";
      }
    }
    String gameName = "";
    for(int i = 0; i < (gameContainer?.length ?? 0) ; i++){
      if(data?.gameId == gameContainer?[i].gameId){
        gameProfile = gameContainer?[i].gameName ?? "";
      }
    }
    return  Row(
      children: [
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(gameProfile, style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
        Container(
            width: 120,
            margin: const EdgeInsets.only(left: 12.0,),
            alignment: Alignment.center,
            child: Text(gameName, style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 12.0,),
            alignment: Alignment.center,
            child: Text(data?.exclude.toString() ?? "", style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),

      ],
    );
  }

}