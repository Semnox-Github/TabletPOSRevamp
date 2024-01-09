import 'package:customer_data/models/account_details/account_game_dto.dart';
import 'package:customer_ui/ListViewItems/account_details/GameChildItem.dart';
import 'package:customer_ui/ListViewItems/account_details/GameChildItemHeader.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/configurations/configuration_response.dart';
import 'package:master_data/models/configurations/parafait_default_container_dto.dart';
import 'package:master_data/models/game_container/game_container_dto.dart';
import 'package:master_data/models/game_profile_container/game_profile_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

import '../../widgets/CustomerButtonWidget.dart';
import 'package:intl/intl.dart';

class GameItem extends StatefulWidget{
  int selectedIndex = 0;
  int index = 0;
  final Function(int value) onChange;
  AccountGameDTO? data;
  List<GameProfileContainerDTO>? gameProfileContainer;
  List<GameContainerDTO>? gameContainer;
  String? dateFormat;

  GameItem({super.key, required this.selectedIndex, required this.index, required this.onChange, this.data,
  this.gameProfileContainer, this.gameContainer,
  this.dateFormat});

  @override
  State<GameItem> createState() => _GameItemState();
}

class _GameItemState extends State<GameItem> {
  bool _extended = false;
  final ScrollController _gameScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    var fromDate;
    var expiryDate;
    if (widget.data?.fromDate != null && widget.data?.fromDate != "") {
      var parsedDate = DateTime.parse(widget.data?.fromDate.toString() ??
          "1974-03-20 00:00:00.000");
      fromDate = DateFormat(widget.dateFormat).format(parsedDate);
    }
    if (widget.data?.expiryDate != null && widget.data?.expiryDate != "") {
      var parsedDate = DateTime.parse(widget.data?.expiryDate.toString() ??
          "1974-03-20 00:00:00.000");
      expiryDate = DateFormat(widget.dateFormat).format(parsedDate);
    }

    String gameProfile = "";
    for (int i = 0; i < (widget.gameProfileContainer?.length ?? 0); i++) {
      if (widget.data?.gameProfileId ==
          widget.gameProfileContainer?[i].gameProfileId) {
        gameProfile = widget.gameProfileContainer?[i].profileName ?? "";
      }
    }
    String gameName = "";
    for (int i = 0; i < (widget.gameContainer?.length ?? 0); i++) {
      if (widget.data?.gameId == widget.gameContainer?[i].gameId) {
        gameProfile = widget.gameContainer?[i].gameName ?? "";
      }
    }

    String validityStatus = "";
    if(widget.data?.validityStatus == 0){
      validityStatus = "Valid";
    }else if(widget.data?.validityStatus == 1){
      validityStatus = "Hold";
    }

    String frequency = "";
      switch (widget.data?.frequency.toLowerCase()) {
        case "d":
          {
            frequency = "Daily";
          }
          break;
        case "w":
          {
            frequency = "Weekly";
          }
          break;
        case "m":
          {
            frequency = "Monthly";
          }
          break;
        case "y":
          {
            frequency = "Yearly";
          }
          break;
        case "b":
          {
            frequency = "Birthday";
          }
          break;
        case "a":
          {
            frequency = "Anniversary";
          }
          break;
      }

    return Container(
     decoration: BoxDecoration(
         border:  (widget.selectedIndex == widget.index) ? Border.all(color: Colors.black) : null,
         borderRadius: BorderRadius.circular(8),
         color: theme.tableRow1
     ),
     child: ListTile(
       dense: true,
       contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
       title: Column(
         children: [
           Row(
             children: [
               Container(
                   width: 100,
                   margin: const EdgeInsets.only(left: 12.0,),
                   alignment: Alignment.center,
                   child: Text(gameProfile, style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
               Container(
                   width: 100,
                   margin: const EdgeInsets.only(left: 8.0,),
                   alignment: Alignment.center,
                   child: Text(gameName, style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
               Container(
                   width: 80,
                   margin: const EdgeInsets.only(left: 8.0,),
                   alignment: Alignment.center,
                   child: Text(widget.data?.quantity.toString() ?? "", style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
               Container(
                   width: 80,
                   margin: const EdgeInsets.only(left: 8.0,),
                   alignment: Alignment.center,
                   child: Text(widget.data?.balanceGames.toString() ?? "", style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
               Container(
                   width: 100,
                   margin: const EdgeInsets.only(left: 8.0,),
                   alignment: Alignment.center,
                   child: Text(frequency, style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
               Container(
                 width: 100,
                 alignment: Alignment.center,
                 margin: const EdgeInsets.only(left: 8.0,),
                 child: SizedBox(
                   height: 10,
                   width: 10,
                   child: Checkbox(
                     checkColor: theme.secondaryColor,
                     activeColor: theme.backGroundColor,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(5.0),
                     ),
                     side: MaterialStateBorderSide.resolveWith(
                           (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                     ),
                     value: widget.data?.monday ?? false,
                     onChanged:(bool? value) {
                       /* setState(() {
                                    _isCheckedPrimary = value!;
                                    _addSearchFilter();
                                  });*/
                     } ,
                   ),
                 ),),
               Container(
                 width: 100,
                 margin: const EdgeInsets.only(left: 8.0,),
                 alignment: Alignment.center,
                 child: SizedBox(
                   height: 10,
                   width: 10,
                   child: Checkbox(
                     checkColor: theme.secondaryColor,
                     activeColor: theme.backGroundColor,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(5.0),
                     ),
                     side: MaterialStateBorderSide.resolveWith(
                           (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                     ),
                     value: widget.data?.tuesday ?? false,
                     onChanged:(bool? value) {
                     } ,
                   ),
                 ),),
               Container(
                   width: 100,
                   margin: const EdgeInsets.only(left: 8.0,),
                   alignment: Alignment.center,
                   child: SizedBox(
                     height: 10,
                     width: 10,
                     child: Checkbox(
                       checkColor: theme.secondaryColor,
                       activeColor: theme.backGroundColor,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(5.0),
                       ),
                       side: MaterialStateBorderSide.resolveWith(
                             (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                       ),
                       value: widget.data?.wednesday ?? false,
                       onChanged:(bool? value) {
                       } ,
                     ),
                   )),
               Container(
                   width: 100,
                   margin: const EdgeInsets.only(left: 8.0,),
                   alignment: Alignment.center,
                   child: SizedBox(
                     height: 10,
                     width: 10,
                     child: Checkbox(
                       checkColor: theme.secondaryColor,
                       activeColor: theme.backGroundColor,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(5.0),
                       ),
                       side: MaterialStateBorderSide.resolveWith(
                             (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                       ),
                       value: widget.data?.thursday ?? false,
                       onChanged:(bool? value) {
                       } ,
                     ),
                   )),
               Container(
                   width: 100,
                   margin: const EdgeInsets.only(left: 8.0,),
                   alignment: Alignment.center,
                   child: SizedBox(
                     height: 10,
                     width: 10,
                     child: Checkbox(
                       checkColor: theme.secondaryColor,
                       activeColor: theme.backGroundColor,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(5.0),
                       ),
                       side: MaterialStateBorderSide.resolveWith(
                             (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                       ),
                       value: widget.data?.friday ?? false,
                       onChanged:(bool? value) {
                       } ,
                     ),
                   )),
               Container(
                   width: 100,
                   margin: const EdgeInsets.only(left: 8.0,),
                   alignment: Alignment.center,
                   child: SizedBox(
                     height: 10,
                     width: 10,
                     child: Checkbox(
                       checkColor: theme.secondaryColor,
                       activeColor: theme.backGroundColor,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(5.0),
                       ),
                       side: MaterialStateBorderSide.resolveWith(
                             (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                       ),
                       value: widget.data?.saturday ?? false,
                       onChanged:(bool? value) {
                       } ,
                     ),
                   )),
               Container(
                   width: 100,
                   margin: const EdgeInsets.only(left: 8.0,),
                   alignment: Alignment.center,
                   child: SizedBox(
                     height: 10,
                     width: 10,
                     child: Checkbox(
                       checkColor: theme.secondaryColor,
                       activeColor: theme.backGroundColor,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(5.0),
                       ),
                       side: MaterialStateBorderSide.resolveWith(
                             (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                       ),
                       value: widget.data?.sunday ?? false,
                       onChanged:(bool? value) {
                       } ,
                     ),
                   )),
               Container(
                   width: 150,
                   margin: const EdgeInsets.only(left: 8.0,),
                   alignment: Alignment.center,
                   child: Text(fromDate ?? "", style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
               Container(
                   width: 150,
                   margin: const EdgeInsets.only(left: 8.0,),
                   alignment: Alignment.center,
                   child: Text(expiryDate ?? "", style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
               Container(
                   width: 120,
                   margin: const EdgeInsets.only(left: 8.0,),
                   alignment: Alignment.center,
                   child: Text(widget.data?.lastPlayedTime ?? "", style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),

               Container(
                   width: 100,
                   margin: const EdgeInsets.only(left: 8.0,),
                   alignment: Alignment.center,
                   child: SizedBox(
                     height: 10,
                     width: 10,
                     child: Checkbox(
                       checkColor: theme.secondaryColor,
                       activeColor: theme.backGroundColor,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(5.0),
                       ),
                       side: MaterialStateBorderSide.resolveWith(
                             (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                       ),
                       value: widget.data?.ticketAllowed ?? false,
                       onChanged:(bool? value) {
                       } ,
                     ),
                   )),
               Container(
                   width: 120,
                   margin: const EdgeInsets.only(left: 8.0,),
                   alignment: Alignment.center,
                   child: Text(widget.data?.entitlementType.toString() ?? "", style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
               Container(
                   width: 100,
                   margin: const EdgeInsets.only(left: 8.0,),
                   alignment: Alignment.center,
                   child: Text(validityStatus, style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
               Container(
                   width: 100,
                   margin: const EdgeInsets.only(left: 8.0,),
                   alignment: Alignment.center,
                   child:  CustomerButtonWidget(text:MessagesProvider.get("Extended").toUpperCase(),
                     page : "accounts",onPress: (){
                     setState(() {
                         _extended = true;
                     });
                   },)),
             ],
           ),
           Visibility(
             visible: ((widget.selectedIndex == widget.index) && (_extended == true)) ? true : false,
             child: Container(
               margin: const EdgeInsets.all(8.0),
               padding: const EdgeInsets.symmetric(vertical: 8.0),
               decoration: BoxDecoration(
                   border: Border.all(color: theme.secondaryColor!) ,
                   borderRadius: BorderRadius.circular(8),
                   color: theme.backGroundColor
               ),
               child:Column(
                 children: [
                   GameChildItemHeader(),
                   const SizedBox(height: 4.0,),
                   RawScrollbar(
                     controller:_gameScrollController,
                     thumbVisibility: true,
                     trackVisibility: true,
                     trackColor: Colors.white,
                     thickness: 10,
                     child: ListView.builder(
                         shrinkWrap: true,
                         controller:_gameScrollController,
                         physics: const ScrollPhysics(),
                         itemCount: widget.data?.accountGameExtendedDTOList?.length ?? 0,
                         itemBuilder: (BuildContext context, int index) {
                           return Padding(
                             padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 3.0),
                             child: GameChildItem(
                               index: index,
                               gameContainer: widget.gameContainer,
                               gameProfileContainer: widget.gameProfileContainer,
                               data: widget.data?.accountGameExtendedDTOList?[index],
                             ),
                           );
                         }),
                   ),
                 ],
               ),
             ),
           )
         ],
       ),
       onTap: () =>{
         setState(() {
           widget.selectedIndex = widget.index;
           widget.onChange(widget.index);
           _extended = false;
         })
       },
     ),
   );
  }

}