import 'package:customer_ui/utils/AppColors.dart';
import 'package:customer_ui/utils/AppStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themes_library/themes_library.dart';

import '../utils/size_config.dart';


class CustomerDetailPageListItem extends StatefulWidget{
  int index = 0;
  int selectedIndex = 0;
  String title = "";
  final Function(int value) onChange;

  CustomerDetailPageListItem({required this.index, required this.selectedIndex, required this.title,required this.onChange});

  @override
  State<CustomerDetailPageListItem> createState() => _CustomerDetailPageListItemState();
}

class _CustomerDetailPageListItemState extends State<CustomerDetailPageListItem> {
  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Container(
      alignment: Alignment.centerLeft,
      height: SizeConfig.getSize(70),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: (widget.selectedIndex == widget.index) ?  AppColors.customerPageBackgroundColor: Colors.black ,
      ),
      child: ListTile(
          dense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 4.0),
          title: Text(widget.title,style : theme.heading2?.copyWith(
              color: Colors.white,
              fontSize: SizeConfig.getFontSize(22),
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500)),
      onTap: () =>{
        setState(() {
          widget.selectedIndex = widget.index;
          widget.onChange(widget.index);
        })
      },),
    );
  }
}