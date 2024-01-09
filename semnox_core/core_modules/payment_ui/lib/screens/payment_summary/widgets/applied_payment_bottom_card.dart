import 'package:flutter/material.dart';
import 'package:payment_ui/utils/colors.dart';
import 'package:payment_ui/utils/styles.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class AppliedPaymentBottomCard extends StatelessWidget {
  final String title;
  final String amount;
  final bool isBold;
  
  const AppliedPaymentBottomCard({
    Key? key,
    required this.title,
    required this.amount,
    this.isBold = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Container(
      padding: EdgeInsets.all(SizeConfig.getHeight(16)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: theme.primaryColor ?? colorWhite
      ),
      child: Row(
        children: [
          Text(title, style: isBold ? (theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W60016) : (theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS14W50016), maxLines: 1, overflow: TextOverflow.ellipsis),
          const Spacer(),
          Text(amount, style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w600) ?? tsS16W60016, maxLines: 1, overflow: TextOverflow.ellipsis)
        ],
      ),
    );
  }
}
