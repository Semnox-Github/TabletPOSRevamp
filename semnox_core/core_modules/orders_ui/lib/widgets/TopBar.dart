import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';

class Topbar extends StatelessWidget{

  VoidCallback? onPress;
  bool? up;

  Topbar({super.key, this.onPress,this.up});

  @override
  Widget build(BuildContext context) {
   SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
   return Container(
     color :Colors.transparent,
     height: AppBar().preferredSize.height ,
     child: Stack(
       //alignment: Alignment.topRight,
       children:[
         PhysicalModel(
           elevation: 1.0,
           color :theme.cardStateUnselectedLight!,
           borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8.0),bottomRight: Radius.circular(8.0)),
           child: Container(
             //width: MediaQuery.of(context).size.width * 0.8,
             width: double.infinity,
             height: AppBar().preferredSize.height -12,
             decoration: BoxDecoration(
                 color: theme.tableRow1!,
                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0),bottomRight: Radius.circular(8.0))
             ),
             //margin: const EdgeInsets.symmetric(vertical: 8.0),
             padding: const EdgeInsets.all(10.0),
           ),
         ),
         Visibility(
           visible: onPress != null ? true : false,
           child: Positioned(
             right: -4,
             bottom: -6,
             child: ElevatedButton.icon(
               icon: (up ?? false) ? Image.asset("assets/ic_up_double_arrow.png", color: Colors.white,) : Image.asset("assets/ic_down_arrow.png", color: Colors.white,),
                 onPressed:onPress,
                 style: ElevatedButton.styleFrom(
                   minimumSize: Size.zero,
                   padding:  const EdgeInsets.only(left : 12.0, right: 4.0,top : 8.0, bottom : 8.0),
                   backgroundColor: Colors.black,
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                 ),
                 label: Text("", style:theme.subtitle3?.copyWith(fontWeight: FontWeight.w500,color: theme.primaryColor),textAlign: TextAlign.center,)),
           ),
         ),
       ]
     ),
   );
  }

}