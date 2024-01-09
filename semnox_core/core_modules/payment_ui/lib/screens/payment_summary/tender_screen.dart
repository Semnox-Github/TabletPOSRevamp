import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:master_data/builder.dart';
import 'package:payment_data/builder.dart';
import 'package:payment_data/models/request/cash_payment/cash_payment_request.dart';
import 'package:payment_ui/cubits/payment_summary/cash_screen/cash_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/cash_screen/cash_screen_state.dart';
import 'package:payment_ui/cubits/payment_summary/payment_screen_cubit.dart';
import 'package:payment_ui/screens/payment_summary/widgets/add_quantity_widget.dart';
import 'package:payment_ui/screens/payment_summary/widgets/denomination_widget.dart';
import 'package:payment_ui/screens/payment_summary/widgets/quantity_edit_widget.dart';
import 'package:payment_ui/utils/colors.dart';
import 'package:payment_ui/utils/common_widgets.dart';
import 'package:payment_ui/utils/extensions.dart';
import 'package:payment_ui/utils/styles.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:widgets_library/utils/keyboard_hider_widget.dart';

class TenderScreen extends StatefulWidget {
  final double initialAmt;
  final double totalAmt;
  final bool isFromSalesScreen;
  final int trxId;

  const TenderScreen({
    Key? key,
    required this.initialAmt,
    required this.totalAmt,
    this.isFromSalesScreen = false,
    this.trxId = -1
  }) : super(key: key);

  @override
  State<TenderScreen> createState() => _TenderScreenState();
}

class _TenderScreenState extends State<TenderScreen> {

  bool _isLoading = false;
  String currency = '';
  String amountFmt = '#,##0.00';

  @override
  void initState() {
    Future.microtask(() async {
      final execContextBL = await ExecutionContextBuilder.build();
      final masterDataBL = await MasterDataBuilder.build(execContextBL.getExecutionContext()!);
      currency = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CURRENCY_SYMBOL') ?? '';
      amountFmt = await masterDataBL.getDefaultValuesByName(defaultValueName: 'AMOUNT_FORMAT') ?? '#,##0.00';
      setState(() {});
    });
    _initTenderAmount(context);
    _clearDenominations(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return KeyboardHider(
      child: LayoutBuilder(
        builder: (context, _) => WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            backgroundColor: theme.backGroundColor,
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 28,
                        height: SizeConfig.blockSizeVertical * 8,
                        child: AppBar(
                          title: Text(MessagesProvider.get('Tender Payments').toUpperCase(), style: theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(26), color: Colors.white) ?? tsS20W700FF),
                          titleSpacing: 0,
                          toolbarHeight: 60.0,
                          backgroundColor: theme.button2InnerShadow1 ?? Colors.black87,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                            ),),
                          leading: IconButton(
                            icon: Image.asset('assets/back_arrow_white.png'),
                            iconSize: 20.0,
                            onPressed: () {
                              context.read<CashScreenCubit>().updateTenderAmt('0.00');
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: SizeConfig.getWidth(16)),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: theme.footerBG1 ?? colorBlueFA,
                              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(6))),
                          height: SizeConfig.blockSizeVertical * 8,
                          width: SizeConfig.blockSizeHorizontal * 68,
                        ),
                      )
                    ],
                  ),
                  BlocBuilder<CashScreenCubit, CashScreenState>(
                    builder: (ctx, state) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: SizeConfig.blockSizeHorizontal * 68,
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(16)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(height: SizeConfig.getHeight(32)),
                              Text(MessagesProvider.get('Select Denominations'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(26)) ?? tsS20W70016),
                              SizedBox(height: SizeConfig.getHeight(8)),
                              Row(
                                children: [
                                  Container(
                                    height: SizeConfig.getHeight(88),
                                    width: SizeConfig.getWidth(363),
                                    decoration: BoxDecoration(
                                        color: theme.footerBG1 ?? colorBlueF8,
                                        border: Border.all(color: theme.scrollDisabled ?? colorGreyD8),
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: Center(child: Text('$currency ${formatAmount(context.read<CashScreenCubit>().state.selectedDenomination.toDouble())}', style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(30)) ?? tsS24W70016)),
                                  ),
                                  const Spacer(),
                                  AddQuantityWidget(
                                    initialQuantity: _getSelectedDenominationCount(context),
                                    onQtyUpdated: (qty) {
                                      _updateSelectedDenominationCount(context, qty);
                                    },
                                  )
                                ],
                              ),
                              SizedBox(height: SizeConfig.getHeight(40)),
                              Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                children: [
                                  DenominationWidget(
                                    isSelected: context.read<CashScreenCubit>().state.selectedDenomination == 100,
                                    title: '100.00',
                                    denominationCount: context.read<CashScreenCubit>().state.hundredDenominationCount,
                                    currency: currency,
                                    amountFmt: amountFmt,
                                    onTap: () {
                                      context.read<CashScreenCubit>().updateSelectedDenomination(100);
                                    },
                                  ),
                                  DenominationWidget(
                                    isSelected: context.read<CashScreenCubit>().state.selectedDenomination == 50,
                                    title: '50.00',
                                    denominationCount: context.read<CashScreenCubit>().state.fiftyDenominationCount,
                                    currency: currency,
                                    amountFmt: amountFmt,
                                    onTap: () {
                                      context.read<CashScreenCubit>().updateSelectedDenomination(50);
                                    },
                                  ),
                                  DenominationWidget(
                                    isSelected: context.read<CashScreenCubit>().state.selectedDenomination == 20,
                                    title: '20.00',
                                    denominationCount: context.read<CashScreenCubit>().state.twentyDenominationCount,
                                    currency: currency,
                                    amountFmt: amountFmt,
                                    onTap: () {
                                      context.read<CashScreenCubit>().updateSelectedDenomination(20);
                                    },
                                  ),
                                  DenominationWidget(
                                    isSelected: context.read<CashScreenCubit>().state.selectedDenomination == 10,
                                    title: '10.00',
                                    denominationCount: context.read<CashScreenCubit>().state.tenDenominationCount,
                                    currency: currency,
                                    amountFmt: amountFmt,
                                    onTap: () {
                                      context.read<CashScreenCubit>().updateSelectedDenomination(10);
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: SizeConfig.getHeight(16)),
                              Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                children: [
                                  DenominationWidget(
                                    isSelected: context.read<CashScreenCubit>().state.selectedDenomination == 5,
                                    title: '5.00',
                                    denominationCount: context.read<CashScreenCubit>().state.fiveDenominationCount,
                                    currency: currency,
                                    amountFmt: amountFmt,
                                    onTap: () {
                                      context.read<CashScreenCubit>().updateSelectedDenomination(5);
                                    },
                                  ),
                                  DenominationWidget(
                                    isSelected: context.read<CashScreenCubit>().state.selectedDenomination == 1,
                                    title: '1.00',
                                    denominationCount: context.read<CashScreenCubit>().state.oneDenominationCount,
                                    currency: currency,
                                    amountFmt: amountFmt,
                                    onTap: () {
                                      context.read<CashScreenCubit>().updateSelectedDenomination(1);
                                    },
                                  ),
                                  SizedBox(
                                    width: SizeConfig.getWidth(200),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.getWidth(200),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(16)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(height: SizeConfig.getHeight(16)),
                                QuantityEditWidget(
                                  totalAmt: widget.initialAmt,
                                  tenderedAmt: context.read<CashScreenCubit>().state.tenderedAmount,
                                  onOkClicked: () {
                                    _updateTenderAndPop(context);
                                  },
                                ),
                                SizedBox(height: SizeConfig.getHeight(16)),
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 1),
                                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(16), vertical: SizeConfig.getHeight(12)),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: theme.secondaryColor ?? colorBlack)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(MessagesProvider.get('Change'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(28)) ?? tsS22W70016),
                                      Text('$currency ${formatAmount(_getChangeAmount(context.read<CashScreenCubit>().state.tenderedAmount))}', style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(28)) ?? tsS22W70016),
                                    ],
                                  ),
                                ),
                                SizedBox(height: SizeConfig.getHeight(16)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    containerButton(
                                        text: MessagesProvider.get('Cancel'),
                                        textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(26)) ?? tsS20W70016,
                                        buttonColor: theme.footerBG1 ?? colorBlueFA,
                                        height: SizeConfig.getHeight(60),
                                        width: SizeConfig.getWidth(150),
                                        cornerRadius: 5,
                                        onTapped: () {
                                          FocusManager.instance.primaryFocus?.unfocus();
                                          context.read<CashScreenCubit>().updateTenderAmt('0.00');
                                          Navigator.pop(context);
                                        }
                                    ),
                                    containerButton(
                                        text: MessagesProvider.get('OK'),
                                        textStyle: theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(26), color: Colors.white) ?? tsS20W700FF,
                                        height: SizeConfig.getHeight(60),
                                        width: SizeConfig.getWidth(150),
                                        cornerRadius: 5,
                                        onTapped: () async {
                                          FocusManager.instance.primaryFocus?.unfocus();
                                          if(widget.isFromSalesScreen) {
                                            if(!_isLoading) {
                                              final provider = context.read<CashScreenCubit>();
                                              final tenderedAmount = provider.state.tenderedAmount;
                                              final isInvalidAmt = tenderedAmount.length >= 2 && tenderedAmount.substring(tenderedAmount.length-2, tenderedAmount.length-1) == '.';
                                              if(isInvalidAmt) {
                                                provider.updateTenderAmt(tenderedAmount.substring(0, tenderedAmount.length-2));
                                              }
                                              final tenderAmt = double.parse(provider.state.tenderedAmount);
                                              _setLoadingStatus(true);
                                              final execContextBL = await ExecutionContextBuilder.build();
                                              final execContext = execContextBL.getExecutionContext();
                                              final paymentDataBL = await PaymentDataBuilder.build(execContext!);
                                              provider.setPaymentDataBL(paymentDataBL);
                                              CashPaymentRequest? cashPaymentRequest;
                                              cashPaymentRequest = CashPaymentRequest(paymentId: -1, approverId: execContext.userPKId ?? -1,
                                                  transactionId: -1, paymentModeId: 291,
                                                  amount: tenderAmt, cashDrawerId: -1, parentPaymentId: -1, tipAmount: 0.0,
                                                  tenderedAmount: tenderAmt, reference: ''
                                              );
                                              await provider.addCashPayment(widget.trxId, cashPaymentRequest);
                                              final updatedTrx = provider.state.transactionResponse;
                                              if(mounted) {
                                                _setLoadingStatus(false);
                                                if(updatedTrx != null) {
                                                  context.read<PaymentScreenCubit>().updateTransaction(updatedTrx);
                                                }
                                                _updateTenderAndPop(context);
                                              }

                                            }
                                          } else {
                                            _updateTenderAndPop(context);
                                          }
                                        }, buttonColor: theme.button2InnerShadow1 ?? colorBlack
                                    ),
                                  ],
                                ),
                                SizedBox(height: SizeConfig.getHeight(12)),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ).withLoader(isLoading: _isLoading, theme: theme),
        ),
      ),
    );
  }

  void _setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }

  void _initTenderAmount(BuildContext context) {
    final amount = widget.initialAmt;
    context.read<CashScreenCubit>().updateTenderAmt(amount.formatToDC());
  }

  int _getSelectedDenominationCount(BuildContext context) {
    final provider = context.read<CashScreenCubit>();
    switch(provider.state.selectedDenomination) {
      case 100: return provider.state.hundredDenominationCount;
      case 50:  return provider.state.fiftyDenominationCount;
      case 20:  return provider.state.twentyDenominationCount;
      case 10:  return provider.state.tenDenominationCount;
      case 5:   return provider.state.fiveDenominationCount;
      case 1:   return provider.state.oneDenominationCount;
      default:  return provider.state.hundredDenominationCount;
    }
  }

  String formatAmount(double amount) {
    final format = NumberFormat(amountFmt);
    return format.format(amount);
  }

  void _updateSelectedDenominationCount(BuildContext context, int qty) {
    final provider = context.read<CashScreenCubit>();
    switch(provider.state.selectedDenomination) {
      case 100: provider.updateHundredDenominationCount(qty);
      break;
      case 50: provider.updateFiftyDenominationCount(qty);
      break;
      case 20: provider.updateTwentyDenominationCount(qty);
      break;
      case 10: provider.updateTenDenominationCount(qty);
      break;
      case 5: provider.updateFiveDenominationCount(qty);
      break;
      case 1: provider.updateOneDenominationCount(qty);
      break;
      default: provider.updateHundredDenominationCount(qty);
    }
    final totalTenderedAmt = (100 * provider.state.hundredDenominationCount) +
        (50 * provider.state.fiftyDenominationCount) +
        (20 * provider.state.twentyDenominationCount) +
        (10 * provider.state.tenDenominationCount) +
        (5 * provider.state.fiveDenominationCount) + (1 * provider.state.oneDenominationCount);

    provider.updateTenderAmt(totalTenderedAmt.toString());
  }

  void _clearDenominations(BuildContext context) {
    final provider = context.read<CashScreenCubit>();
    provider.updateHundredDenominationCount(0);
    provider.updateFiftyDenominationCount(0);
    provider.updateTwentyDenominationCount(0);
    provider.updateTenDenominationCount(0);
    provider.updateFiveDenominationCount(0);
    provider.updateOneDenominationCount(0);
    provider.updateSelectedDenomination(100);
    provider.updateTenderAmt('0.00');
  }

  double _getChangeAmount(String tenderedAmount) {

    final isInvalidAmt = tenderedAmount.length >= 2 && tenderedAmount.substring(tenderedAmount.length-2, tenderedAmount.length-1) == '.';
    if(isInvalidAmt) {
      final change = double.parse(tenderedAmount.substring(0, tenderedAmount.length-2)) - widget.totalAmt;
      return change > 0 ? change : 0;
    } else {
      final change = double.parse(tenderedAmount) - widget.totalAmt;
      return change > 0 ? change : 0;
    }
  }

  void _updateTenderAndPop(BuildContext context) {
    final provider = context.read<CashScreenCubit>();
    final tenderedAmount = provider.state.tenderedAmount;
    final isInvalidAmt = tenderedAmount.length >= 2 && tenderedAmount[tenderedAmount.length-1] == '.';
    if(isInvalidAmt) {
      provider.updateTenderAmt(tenderedAmount.substring(0, tenderedAmount.length-1));
    }
    Navigator.pop(context);
  }

}
