import 'package:flutter/material.dart';
import 'package:payment_ui/utils/colors.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:payment_ui/utils/styles.dart';

class PaymentTopTile extends StatelessWidget {
  final String title;
  final String amount;
  final bool isLargeTile;

  const PaymentTopTile({
    Key? key,
    required this.title,
    required this.amount,
    this.isLargeTile = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Container(
      height: SizeConfig.getHeight(56),
      width: isLargeTile ? SizeConfig.getWidth(180) : SizeConfig.getWidth(140),
      decoration: BoxDecoration(
        color: theme.primaryColor ?? colorWhite,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS14W50016, overflow: TextOverflow.ellipsis, maxLines: 1),
            SizedBox(height: SizeConfig.getHeight(2)),
            Text(amount, style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)) ?? tsS14W70016, overflow: TextOverflow.ellipsis, maxLines: 1)
          ],
        ),
      ),
    );
  }
}
