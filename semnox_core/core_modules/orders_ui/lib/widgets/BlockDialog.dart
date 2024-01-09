import 'package:flutter/cupertino.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:flutter/material.dart';

class BlockDialog extends StatelessWidget{

  Size? _screenSize;
  double _screenHeight = 0.0;
  double _screenWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    _screenSize = MediaQuery.of(context).size;
    _screenHeight = _screenSize!.height;
    _screenWidth = _screenSize!.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor:theme.backGroundColor,
        elevation: 0,
        automaticallyImplyLeading : false,
        titleSpacing: 0,
        title: Row(
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                  height:  AppBar().preferredSize.height,
                  padding: const EdgeInsets.only(right: 12.0),
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(8.0))
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/back_arrow_white.png'),
                        iconSize: 20.0,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(MessagesProvider.get("Transaction summary").toUpperCase(), style: theme.heading4?.copyWith(color : theme.light1)),
                    ],
                  )),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 8.0,right: 8.0),
                height:  AppBar().preferredSize.height -2,
                child: PhysicalModel(
                  elevation: 2.0,
                  color : theme.tableRow1!,
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0)),
                  child: Container(
                    height:  AppBar().preferredSize.height -2,
                    padding: const EdgeInsets.all( 8.0),
                    decoration: BoxDecoration(
                        color: theme.tableRow1,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0),bottomRight: Radius.circular(8.0))
                    ),
                    child:  const Text(""),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }

}