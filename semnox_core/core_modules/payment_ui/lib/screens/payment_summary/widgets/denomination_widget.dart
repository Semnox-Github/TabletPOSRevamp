import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:payment_ui/utils/colors.dart';
import 'package:payment_ui/utils/styles.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class DenominationWidget extends StatelessWidget {
  final bool isSelected;
  final String title;
  final int denominationCount;
  final VoidCallback onTap;
  final String currency;
  final String amountFmt;

  const DenominationWidget({
    Key? key,
    required this.isSelected,
    required this.title,
    required this.denominationCount,
    required this.currency,
    required this.amountFmt,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: SizeConfig.getHeight(88),
        width: SizeConfig.getWidth(200),
        decoration: BoxDecoration(
          color: isSelected ? (theme.secondaryColor ?? colorBlack) : (theme.footerBG1 ?? colorBlueF8),
          border: Border.all(color: theme.scrollDisabled ?? colorGreyD8),
          borderRadius: BorderRadius.circular(6)
        ),
        child: Center(
          child: Text(
            '$currency ${formatAmount(title)} ${denominationCount != 0 ? 'x $denominationCount' : ''}',
            style: isSelected ? (theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(26)) ?? tsS20W700FF) : (theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(26)) ?? tsS20W70016),
          ),
        ),
      ),
    );
  }

  String formatAmount(String amount) {
    var amt = double.parse(amount);
    final format = NumberFormat(amountFmt);
    return format.format(amt);
  }
}
