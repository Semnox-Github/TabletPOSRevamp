import 'package:flutter/material.dart';
import 'package:other_function_ui/widgets/of_content_widgets/general/card_balance_column.dart';

class CardBalance extends StatelessWidget {
  final double? textSize ;
  final String firsttitle, firstdesc, secondtitle, seconddesc;
  const CardBalance(
      {super.key,
        this.textSize,
      required this.firsttitle,
      required this.firstdesc,
      required this.secondtitle,
      required this.seconddesc});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardBalanceColumn(
          textSize: textSize,
          title: firsttitle,
          desc: firstdesc,
        ),
        CardBalanceColumn(textSize:textSize,title: secondtitle, desc: seconddesc)
      ],
    );
  }
}
