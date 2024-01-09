import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';

ValueNotifier<bool> visibleSideBar = ValueNotifier(true);

class Topbar extends StatefulWidget{
   bool isShowHeader;
  Topbar({super.key,required this.isShowHeader});

  @override
  State<Topbar> createState() => _TopbarState();
}

class _TopbarState extends State<Topbar> {

  @override
  void initState() {
    super.initState();
    visibleSideBar.value = true;
  }

  @override
  Widget build(BuildContext context) {
   SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
   return Container(
     color :Colors.transparent,
     height: AppBar().preferredSize.height ,
     child: Row(
       //alignment: Alignment.topRight,
       children:[
         ValueListenableBuilder(
             valueListenable: visibleSideBar,
             builder: (BuildContext context, bool value,Widget? child){
               return   Visibility(
                 visible: visibleSideBar.value == false ? true : false,
                 child: Container(
                   margin: const EdgeInsets.only(right: 10.0),
                   decoration:  BoxDecoration(
                       color:  theme.button2BG1!,
                       borderRadius: const BorderRadius.only(bottomRight: Radius.circular(8.0))
                   ),
                   child: IconButton(
                     icon: Image.asset('assets/back_arrow_white.png',color: theme.primaryColor,),
                     iconSize: 20.0,
                     onPressed: () {
                       Navigator.pop(context);
                     },
                   ),
                 ),
               );
             }),
         Expanded(
           child: PhysicalModel(
             elevation: 1.0,
             color :theme.tableRow1!,
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
         ),
       ]
     ),
   );
  }
}