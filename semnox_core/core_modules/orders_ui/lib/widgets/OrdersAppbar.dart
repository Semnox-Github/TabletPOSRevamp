import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class OrdersAppbar extends StatelessWidget{
  String title;
  final VoidCallback? onPressed;

  OrdersAppbar({required this.title,this.onPressed});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return AppBar(
      title: Text(title, style: theme.heading4?.copyWith(color: theme.light1,fontSize: SizeConfig.getFontSize(22)),overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.justify,),
      titleSpacing: 0,
      toolbarHeight: 80.0,
      backgroundColor: Colors.black54,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
        ),),
      leading: IconButton(
        icon: Image.asset('assets/back_arrow_white.png'),
        iconSize: 20.0,
        onPressed: onPressed,
      ),
    );
  }

}