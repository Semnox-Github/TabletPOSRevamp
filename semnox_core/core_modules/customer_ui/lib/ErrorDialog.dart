import 'dart:convert';

import 'package:customer_ui/utils/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';

class LoginErrorDialog extends StatelessWidget{

  String title;
  String message;

  LoginErrorDialog(this.title, this.message);

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return AlertDialog(
     title:  Padding(
       padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16.0),
       child: Text(title,
         style:GoogleFonts.robotoCondensed(
           color: theme.secondaryColor, fontSize: 26.0, fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
     ),
     contentPadding: EdgeInsets.zero,
     backgroundColor: theme.backGroundColor,
     //insetPadding: EdgeInsets.symmetric(vertical: 100),
     insetPadding: EdgeInsets.zero,
     content: _widget(context),
     actionsAlignment: MainAxisAlignment.center,
     actions: [
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: ElevatedButton(
           onPressed: (){
             Navigator.pop(context);
           },
           style: ElevatedButton.styleFrom(
             padding:  const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32),
             backgroundColor: theme.button2BG1,
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
           ),
           child: Text(MessagesProvider.get("OK"), style: GoogleFonts.robotoCondensed(
               color: Colors.white, fontSize: 19.0, fontWeight: FontWeight.w700),),
         ),
       )
     ],
   );
  }


  Widget _widget(BuildContext context){
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    LineSplitter ls = LineSplitter();
    List<String> lines = ls.convert(message);
    if(lines.length > 1) {
      String message1 = lines[0];
      String message2 = lines[1];
    }
    return Container(
      width: MediaQuery.of(context).size.width*0.7,
     // padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 1,color: theme.dividerColor,),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 50),
            child: Column(
              children: [
                Visibility(
                  visible: lines.length > 1 ? true :false,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text( lines.length > 1 ? lines[0] :"",
                        style: GoogleFonts.robotoCondensed(
                            color: theme.secondaryColor, fontSize: 26.0, fontWeight: FontWeight.w700)
                    ),
                  ),
                ),
                Text(
                    lines.length > 1 ? lines[1] : message,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.robotoCondensed(
                        color: theme.secondaryColor, fontSize: 26.0, fontWeight: FontWeight.w400)
                ),
              ],
            ),
          ),
          Container(height: 1,color: theme.dividerColor,),
        ],
      ),
    );
  }
}