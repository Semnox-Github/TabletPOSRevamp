import 'package:customer_ui/utils/AppStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

import '../utils/AppColors.dart';

class CustomerNameCard extends StatelessWidget{

  String? name;
  String? membership;

  CustomerNameCard({this.name,this.membership});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
   return Padding(
     padding:  EdgeInsets.all(SizeConfig.getSize(8)),
     child: PhysicalModel(
       elevation: 1.0,
       color :theme.backGroundColor!,
       child: Container(
         width: MediaQuery.of(context).size.width,
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(8),
             color: theme.tableRow1,
         ),
         padding:  EdgeInsets.all(SizeConfig.getSize(8)),
         child: Row(
           children: [
              Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.only(left: 8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: theme.backGroundColor
                ),
                child: Column(
                  children: [
                    Text(MessagesProvider.get("Name"),style : theme.heading5?.copyWith(
                        fontSize: SizeConfig.getFontSize(16),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                    )),
                    Text(name ?? "-",style : theme.heading5?.copyWith(
                        fontSize: SizeConfig.getFontSize(18),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700
                    ))
                  ],
                ),
              ),
              Container(
               padding: EdgeInsets.all(8.0),
               margin: EdgeInsets.only(left: 8.0),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(8),
                   color: theme.backGroundColor
               ),
               child: Column(
                 children: [
                   Text(MessagesProvider.get("Membership"),style : theme.heading5?.copyWith(
                       fontSize: SizeConfig.getFontSize(16),
                       fontStyle: FontStyle.normal,
                       fontWeight: FontWeight.w500
                   )),
                   Text(membership ?? "-",style : theme.heading5?.copyWith(
                       fontSize: SizeConfig.getFontSize(18),
                       fontStyle: FontStyle.normal,
                       fontWeight: FontWeight.w700
                   ))
                 ],
               ),
             ),
           ],
         ),
       ),
     ),
   );
  }

}