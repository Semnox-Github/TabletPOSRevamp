import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:master_data/builder.dart';
import 'package:payment_ui/cubits/payment_settlement/edit_payment/edit_payment_cubit.dart';
import 'package:payment_ui/utils/extensions.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/models/create_transaction/transaction_payment_dto.dart';
import 'package:widgets_library/utils/size_config.dart';

import '../../../utils/colors.dart';
import '../../../utils/styles.dart';

class EditablePaymentWidget extends StatelessWidget {
  final TransactionPaymentDTO item;
  final int currentIndex;
  final String? dateFormat;
  final String currency;
  final String amountFmt;

  const EditablePaymentWidget({
    Key? key,
    required this.item,
    required this.currentIndex,
    required this.currency,
    required this.amountFmt,
    this.dateFormat
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Container(
      margin: EdgeInsets.only(right: SizeConfig.getWidth(40), bottom: SizeConfig.getWidth(12)),
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(12), vertical: SizeConfig.getWidth(6)),
      decoration: BoxDecoration(
          color: theme.footerBG1 ?? colorBlueF8,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: item.isSelected ? (theme.secondaryColor ?? colorBlack) : Colors.transparent)
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              if(item.isSelected) {
                context.read<EditPaymentCubit>().updateEditablePaymentStatus(currentIndex, false);
              } else {
                context.read<EditPaymentCubit>().updateEditablePaymentStatus(currentIndex, true);
              }
            },
            child: Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                border: Border.all(width: 1, color: theme.secondaryColor ?? colorBlack),
              ),
              child: Center(
                child: item.isSelected ? Image.asset("assets/ic_check.png", color: theme.secondaryColor) : const SizedBox(),
              ),
            ),
          ),
          SizedBox(width: SizeConfig.getWidth(16)),
          Text('${item.transactionId}', style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS16W50016,
              maxLines: 1, overflow: TextOverflow.ellipsis),
          SizedBox(width: SizeConfig.getWidth(60)),
          Text(_getTime(item.paymentDate), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS16W50016,
              maxLines: 1, overflow: TextOverflow.ellipsis),
          SizedBox(width: SizeConfig.getWidth(44)),
          SizedBox(
            width: SizeConfig.getWidth(100),
            child: FutureBuilder(
              future: _getPayModeById(item.paymentModeId),
              builder: (context, snapshot) => Text((snapshot.data ?? '').replaceSpace(), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS16W50016,
                  maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ),
          SizedBox(width: SizeConfig.getWidth(36)),
          SizedBox(
            width: SizeConfig.getWidth(90),
            child: Text('$currency ${formatAmount(item.amount)}'.replaceSpace(), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS16W50016,
                maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
          SizedBox(width: SizeConfig.getWidth(10)),
          SizedBox(
            width: SizeConfig.getWidth(90),
            child: Text('$currency ${formatAmount(item.tipAmount)}'.replaceSpace(), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS16W50016,
                maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }

  String formatAmount(double amount) {
    final format = NumberFormat(amountFmt);
    return format.format(amount);
  }

  Future<String> _getPayModeById(int mode) async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final payMode = await masterDataBL.getPaymentModeById(mode);
    return payMode?.paymentMode ?? '';
  }

  String _getTime(String inputDate) {
    final inputFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
    final format = dateFormat ?? 'dd-MM-yyyy';
    final outputFormat = DateFormat(format);
    final date = inputFormat.parse(inputDate);
    return outputFormat.format(date);
  }
}
