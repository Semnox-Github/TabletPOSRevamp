import 'package:flutter/material.dart';
import 'package:other_function_ui/widgets/of_content_widgets/redeem_ticket_widget/redeem_card_widget.dart';
import 'package:themes_library/themes_library.dart';

class RedeemCardRow extends StatelessWidget {
  final String selectedCard;
  final Function(String) onTap;
  const RedeemCardRow(
      {Key? key, required this.selectedCard, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RedeemCard(
          onTap: () => onTap('Bonus'),
          text: 'Bonus',
          color: selectedCard == 'Bonus'
              ? theme.button2InnerShadow1
              : theme.button1BG1,
          textColor: selectedCard == 'Bonus'
              ? theme.light1 ?? Colors.white
              : theme.primaryOpposite ?? Colors.black,
        ),
        RedeemCard(
          onTap: () => onTap('Card Balance'),
          text: 'Card Balance',
          color: selectedCard == 'Card Balance'
              ? theme.button2InnerShadow1
              : theme.button1BG1,
          textColor: selectedCard == 'Card Balance'
              ? theme.light1 ?? Colors.white
              : theme.primaryOpposite ?? Colors.black,
        )
      ],
    );
  }
}
