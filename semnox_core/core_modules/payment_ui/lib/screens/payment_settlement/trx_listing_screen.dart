import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:master_data/builder.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:payment_ui/cubits/payment_settlement/settle_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_settlement/tip_split/tip_split_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/payment_screen_cubit.dart';
import 'package:payment_ui/screens/payment_settlement/tip_split_screen.dart';
import 'package:payment_ui/utils/colors.dart';
import 'package:payment_ui/utils/extensions.dart';
import 'package:payment_ui/utils/styles.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/models/create_transaction/transaction_payment_dto.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/scroller.dart';

class TrxListingScreen extends StatefulWidget {
  final List<TransactionPaymentDTO> list;
  final String? dateFormat;
  final bool isExpanded;
  final String currency;
  final String amountFmt;

  const TrxListingScreen({
    Key? key,
    required this.list,
    required this.isExpanded,
    required this.currency,
    required this.amountFmt,
    this.dateFormat
  }) : super(key: key);

  @override
  State<TrxListingScreen> createState() => _TrxListingScreenState();
}

class _TrxListingScreenState extends State<TrxListingScreen> {

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scroller(
      controller: _scrollController,
      child: ListView.builder(
          shrinkWrap: true,
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            return TrxItem(
              item: widget.list[index],
              currentIndex: index,
              dateFormat: widget.dateFormat,
              currency: widget.currency,
              amountFmt: widget.amountFmt,
            );
          }),
    );
  }
}

class TrxItem extends StatelessWidget {
  final TransactionPaymentDTO item;
  final int currentIndex;
  final String? dateFormat;
  final String currency;
  final String amountFmt;

  const TrxItem({
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
      margin: EdgeInsets.only(left: SizeConfig.getWidth(12), right: SizeConfig.getWidth(50), bottom: SizeConfig.getWidth(12)),
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
              final cubit = context.read<SettleScreenCubit>();
              if(cubit.state.settleScreenIndex == 0) {
                if(item.isSelected) {
                  cubit.updateAuthorizedPaymentStatus(currentIndex, false);
                } else {
                  cubit.updateAuthorizedPaymentStatus(currentIndex, true);
                }
              } else if(cubit.state.settleScreenIndex == 1) {
                if(item.isSelected) {
                  cubit.updateSettledPaymentStatus(currentIndex, false);
                } else {
                  cubit.updateSettledPaymentStatus(currentIndex, true);
                }
              } else {
                if(item.isSelected) {
                  cubit.updateEditablePaymentStatus(currentIndex, false);
                } else {
                  cubit.updateEditablePaymentStatus(currentIndex, true);
                }
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
          SizedBox(width: SizeConfig.getSize(16)),
          Text('${item.transactionId}', style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w500) ?? tsS16W50016,
              maxLines: 1, overflow: TextOverflow.ellipsis),
          SizedBox(width: SizeConfig.getSize(70)),
          SizedBox(
            width: SizeConfig.getSize(95),
            child: Text(item.transactionNumber ?? '', style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w500) ?? tsS16W50016,
                maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
          SizedBox(width: SizeConfig.getSize(105)),
          Text(_getTime(item.paymentDate), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w500) ?? tsS16W50016,
              maxLines: 1, overflow: TextOverflow.ellipsis),
          SizedBox(width: SizeConfig.getSize(32)),
          SizedBox(
            width: SizeConfig.getSize(100),
            child: FutureBuilder(
                future: _getPayModeById(item.paymentModeId),
                builder: (context, snapshot) => Text((snapshot.data ?? '').replaceSpace(), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w500) ?? tsS16W50016,
                  maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ),
          SizedBox(width: SizeConfig.getSize(65)),
          SizedBox(
            width: SizeConfig.getSize(120),
            child: Text('$currency ${formatAmount(item.amount)}'.replaceSpace(), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w500) ?? tsS16W50016,
                maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
          SizedBox(width: SizeConfig.getSize(36)),
          InkWell(
            onTap: () {
              context.read<SettleScreenCubit>().resetTipSplitStatus();
              showDialog(
                  context: context,
                  barrierColor: const Color(0x01000000), //todo c
                  builder: (_) {
                return NumberPad(
                  initialOffset: Offset(SizeConfig.screenWidth / 2, SizeConfig.screenHeight / 10),
                  isDecimalRequired: true,
                  isInitialRequired: true,
                  initialDecimalValue: item.tipReqAmt ?? item.tipAmount,
                  title: null,
                  onOkPressed: (value)  {
                   final amt = value as double;
                   if(amt != 0 && amt != -1) {
                     if(context.read<SettleScreenCubit>().state.settleScreenIndex == 0) {
                       context.read<SettleScreenCubit>().updateTipReqAuthAmount(currentIndex, amt);
                     }else{
                       context.read<SettleScreenCubit>().updateTipReqAmount(currentIndex, amt);
                     }
                   } else {
                        if(context.read<SettleScreenCubit>().state.settleScreenIndex == 0) {
                        context.read<SettleScreenCubit>().updateTipReqAuthAmount(currentIndex, 0);
                        }else {
                          context.read<SettleScreenCubit>().updateTipReqAmount(currentIndex, 0);
                        }
                   }
                  },
                );
              });
            },
            child: Container(
              width: SizeConfig.getSize(70),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
              decoration: BoxDecoration(
                color: theme.primaryColor ?? colorWhite,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text((item.tipReqAmt ?? item.tipAmount).formatToDC(), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w500) ?? tsS16W50016,
                  maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ),
          SizedBox(width: SizeConfig.getSize(12)),
          InkWell(
              onTap: () {
                final transactionData = context.read<PaymentScreenCubit>().state.transactionResponse?.data;
                showDialog(context: context, builder: (_) {
                  return BlocProvider<TipSplitCubit>(
                    create: (ctx) => TipSplitCubit(),
                      child: TipSplitScreen(trxData: transactionData,
                          paymentDTO: item,
                          currentIndex: currentIndex,
                          tipReqAmt: item.tipReqAmt,
                      )
                  );
                }).then((value) {
                  final data = value as TipSplitReturnData?;
                  if(data != null) {
                    final settleScreenCubit = context.read<SettleScreenCubit>();
                    if(data.tipSplits.isNotEmpty) {
                      context.read<SettleScreenCubit>().updateSettledPaymentStatus(currentIndex, true);
                    }
                    settleScreenCubit.updateEmployeeTips(data.currIndex, data.tipSplits, data.tipAmount);
                  }
                });
              },
            child: Icon(
              Icons.account_circle,
              size: 24,
              color: theme.secondaryColor,
            ),  ),
          SizedBox(width: SizeConfig.getSize(20)),
          Flexible(child: SizedBox(
              width: SizeConfig.getSize(80),
              child: Text((item.reference?.toString() ?? '').replaceSpace(), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w500) ?? tsS16W50016,
                  maxLines: 1, overflow: TextOverflow.ellipsis)
          )),
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
    final format = dateFormat ?? 'dd-MM-yyyy hh:mm:ss';
    final outputFormat = DateFormat(format);
    final date = inputFormat.parse(inputDate);
    return outputFormat.format(date);
  }
}

