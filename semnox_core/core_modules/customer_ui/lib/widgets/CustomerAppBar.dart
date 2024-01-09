import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:customer_ui/providers/SelectedCardDetailsProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:provider/provider.dart';


class CustomerAppbar extends StatelessWidget{

  String title;
  AccountDetailsData? accountDetailsData;

  CustomerAppbar(this.title, {this.accountDetailsData });

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
   return AppBar(
     title: Text(title, style: theme.heading4?.copyWith(color: theme.light1,fontSize: SizeConfig.getFontSize(20)),overflow: TextOverflow.ellipsis,
       textAlign: TextAlign.justify,),
     titleSpacing: 0,
     toolbarHeight: SizeConfig.getFontSize(100),
     backgroundColor: Colors.black54,
     shape: const RoundedRectangleBorder(
       borderRadius: BorderRadius.only(
         bottomRight: Radius.circular(10),
       ),),
     leading: IconButton(
       icon: Image.asset('assets/back_arrow_white.png'),
       iconSize: SizeConfig.getSize(26),
       onPressed: () {
         if(accountDetailsData != null){
           context.read<SelectedCardDetails>().updateData(accountDetailsData);
         }
         Navigator.pop(context);
       },
     ),
   );
  }
}