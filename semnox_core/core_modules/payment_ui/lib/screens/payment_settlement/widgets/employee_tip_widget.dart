import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:payment_data/models/employee_tip/employee_tip_data.dart';
import 'package:payment_ui/cubits/payment_settlement/tip_split/tip_split_cubit.dart';
import 'package:payment_ui/utils/extensions.dart';
import 'package:payment_ui/utils/styles.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class EmployeeTipWidget extends StatelessWidget {
  final EmployeeTipData model;
  final int currentIndex;
  final String currency;
  final String amountFmt;

  const EmployeeTipWidget({
    Key? key,
    required this.model,
    required this.currentIndex,
    required this.currency,
    required this.amountFmt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              final tipSplitCubit = context.read<TipSplitCubit>();
              tipSplitCubit.removeTipAtIndex(currentIndex);
            },
            child: Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                  Border.all(color: theme.secondaryColor ?? Colors.black, width: 0.8)),
              child: Image.asset('assets/xmark-large.png',width: 24,height: 24, color: theme.secondaryColor),
            ),
          ),
          SizedBox(width: SizeConfig.getWidth(16)),
          SizedBox(
            width: SizeConfig.getWidth(90),
              child: Text((model.userName ?? '').replaceSpace(), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w500) ?? tsS14W50016,
                maxLines: 1, overflow: TextOverflow.ellipsis,)),

          SizedBox(
              width: SizeConfig.getWidth(50),
              child: Text(model.splitByPercentage?.toString() ?? '', style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w500) ?? tsS14W50016)),
          SizedBox(width: SizeConfig.getWidth(75)),
          Text('$currency ${formatAmount((model.tipAmount ?? 0))}', style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w500) ?? tsS14W50016),
          SizedBox(width: SizeConfig.getWidth(32)),
        ],
      ),
    );
  }

  String formatAmount(double amount) {
    final format = NumberFormat(amountFmt);
    return format.format(amount);
  }
}
