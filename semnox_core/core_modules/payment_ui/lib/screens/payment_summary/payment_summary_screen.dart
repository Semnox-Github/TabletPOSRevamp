import 'package:customer_data/builder.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:login_ui/manager_login_popup.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/payment_modes_container/payment_mode_container_dto.dart';
import 'package:master_data/models/pos_machines_container/pos_payment_mode_inclusion_dto.dart';
import 'package:master_data/models/user_role_container/management_form_access_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:payment_data/builder.dart';
import 'package:payment_ui/cubits/payment_settlement/settle_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/card_screen/card_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/cash_screen/cash_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/debit_screen/semnox_debit_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/generic_screen/generic_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/payment_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/payment_screen_state.dart';
import 'package:payment_ui/cubits/payment_summary/voucher_screen/voucher_screen_cubit.dart';
import 'package:payment_ui/screens/payment_settlement/payment_settlement_screen.dart';
import 'package:payment_ui/screens/payment_summary/cash_screen.dart';
import 'package:payment_ui/screens/payment_summary/credit_debit_screen.dart';
import 'package:payment_ui/screens/payment_summary/generic_screen.dart';
import 'package:payment_ui/screens/payment_summary/ismp4_screen.dart';
import 'package:payment_ui/screens/payment_summary/semnox_debit_screen.dart';
import 'package:payment_ui/screens/payment_summary/voucher_screen.dart';
import 'package:payment_ui/screens/payment_summary/widgets/applied_payment_bottom_card.dart';
import 'package:payment_ui/screens/payment_summary/widgets/tip_popup.dart';
import 'package:payment_ui/screens/payment_summary/widgets/payment_nav_bar_widget.dart';
import 'package:payment_ui/screens/payment_summary/widgets/payment_summary_item.dart';
import 'package:payment_ui/screens/payment_summary/widgets/payment_top_tile.dart';
import 'package:payment_ui/utils/common_widgets.dart';
import 'package:payment_ui/utils/extensions.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/models/create_transaction/transaction_data.dart';
import 'package:payment_ui/utils/colors.dart';
import 'package:payment_ui/utils/styles.dart';
import 'package:transaction_data/models/create_transaction/transaction_payment_dto.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';
import 'package:widgets_library/cubits/device_interface_cubit.dart';
import 'package:widgets_library/loader_dialog.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:widgets_library/utils/keyboard_hider_widget.dart';

class PaymentSummaryScreen extends StatefulWidget {
  final TransactionData? transactionData;

  const PaymentSummaryScreen({Key? key, this.transactionData})
      : super(key: key);

  @override
  State<PaymentSummaryScreen> createState() => _PaymentSummaryScreenState();
}

class _PaymentSummaryScreenState extends State<PaymentSummaryScreen> {
  late NotificationBar _notificationBar;
  final _paymentScrollController = ScrollController();
  final _trxDataNotifier = ValueNotifier<TransactionData?>(null);
  final _refreshNotifier = ValueNotifier<bool>(false);
  final _paymentModeNotifier = ValueNotifier<List<PaymentModeContainerDTO>?>([]);
  final _payModeMap = <int, PaymentModeContainerDTO>{};
  bool _isCurrentUserManager = true;
  String? dateFormat;
  bool _isParentScreenOpened = false;
  bool _isLocked = false;
  String currency = '';
  String amountFmt = '#,##0.00';

  ///Access controls
  PaymentAccessControlDTO? applyAccessDTO;
  PaymentAccessControlDTO? refundAccessDTO;
  PaymentAccessControlDTO? tipAdjustAccessDTO;


  @override
  void initState() {
    _notificationBar = NotificationBar(showHideSideBar: true, onSideBarStatusUpdate: (shouldShowSidebar) {
      context.read<PaymentScreenCubit>().setSideBarStatus(shouldShowSidebar);
    },);
    Future.delayed(const Duration(milliseconds: 500), () {
      _isParentScreenOpened = true;
    });
    Future.microtask(() => _checkAccessControls());
    Future.microtask(() async => await _checkCurrentUserPrivileges());
    Future.microtask(() =>   context.read<DeviceInterfaceCubit>().setPaymentScannerStatus(true));
    _trxDataNotifier.value = widget.transactionData;
    context.read<PaymentScreenCubit>().updateAppliedPayments(_trxDataNotifier.value?.transactionPaymentDTOList);
    context.read<PaymentScreenCubit>().updateTransaction(TransactionResponse(data: _trxDataNotifier.value));
    Future.microtask(() => _filterPaymentModes());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: KeyboardHider(
        child: BlocConsumer<PaymentScreenCubit, PaymentScreenState>(
          listener: (ctx, state) {
            if(state.loadingStatus == 1) {
              if(!_isLocked){
                _isLocked = true;
                Future.microtask(() => showLoaderDialog(context, state.loadingMessage));
              }
            }
            if(state.loadingStatus == 0) {
              _isLocked = false;
              context.read<PaymentScreenCubit>().setLoadingStatus(status: -1, message: null);
              hideLoaderDialog(context);
              Future.microtask(() {
                if (state.apiError != null) {
                  context.read<PaymentScreenCubit>().setApiError(null);
                  Future.microtask(() => showErrorDialog(
                    context, MessagesProvider.get("Error"), state.apiError ?? '',
                    theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(30)) ?? tsS16W70016,
                    theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(23)) ?? tsS16W70016,));
                }

                if(state.transactionResponse != null) {
                  _trxDataNotifier.value = state.transactionResponse?.data;
                  if(state.isPaymentRefreshed) {
                    context.read<PaymentScreenCubit>().updateAppliedPayments(_trxDataNotifier.value?.transactionPaymentDTOList);
                    context.read<PaymentScreenCubit>().resetRefreshPaymentStatus();
                  }
                }
              });
            }

            if(state.validationError != null) {
              _notificationBar.showMessage(state.validationError ?? '',  theme.footerBG5 ?? colorBlueFE);
              context.read<PaymentScreenCubit>().setValidationError(null);
            }

            if (state.notificationMessage != null) {
              _notificationBar.showMessage(state.notificationMessage ?? '', state.isNotificationError ? (theme.footerBG3 ?? colorRed50) : (theme.footerBG4 ?? colorBlueFE));
              context.read<PaymentScreenCubit>().setNotificationMessage(null, isErrorMode: false);
              if(state.notificationMessage?.isEmpty == true) {
                _notificationBar.showMessage('', theme.footerBG2 ?? colorWhite);
              }
            }

            if(state.searchedForPayModes) {
              setState(() {
                _paymentModeNotifier.value = state.searchedPaymentModes;
                context.read<PaymentScreenCubit>().updatePaymentModes([], searchedForPayModes: false);
              });
            }
          },
          builder: (ctx, state) => Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: theme.backGroundColor,
            body: LayoutBuilder(
              builder: (context, _) {
                return Column(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Visibility(
                            visible: _isSideBarVisible(),
                            child: SizedBox(
                              width: SizeConfig.blockSizeHorizontal * 18,
                              child: ValueListenableBuilder<List<PaymentModeContainerDTO>?>(
                                valueListenable: _paymentModeNotifier,
                                builder: (context, modes, _) => PaymentNavBarWidget(
                                  paymentModes: modes,
                                  onPaymentNavItemClicked: (paymentModeDTO) {
                                    context.read<PaymentScreenCubit>().setSelectedPayMode(paymentModeDTO);
                                    _notificationBar.showMessage('', theme.footerBG2 ?? colorWhite);
                                    if(_refreshNotifier.value) {
                                      _refreshNotifier.value = false;
                                    } else {
                                      _refreshNotifier.value = true;
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 88,
                            width: _isSideBarVisible() ? SizeConfig.blockSizeHorizontal * 82 : SizeConfig.blockSizeHorizontal * 100,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: SizeConfig.getWidth(8)),
                                  decoration: BoxDecoration(
                                      color: theme.tableRow1 ?? colorBlueFA,
                                      borderRadius: BorderRadius.circular(6)),
                                  height: SizeConfig.getHeight(70),
                                  child: ValueListenableBuilder<TransactionData?>(
                                    valueListenable: _trxDataNotifier,
                                    builder: (ctx, trxData, _) => Row(
                                      children: [
                                        SizedBox(width: SizeConfig.getWidth(6)),
                                        PaymentTopTile(
                                            title: MessagesProvider.get('Total'),
                                            amount:
                                            '$currency ${formatAmount(_getTotalAmount())}'),
                                        SizedBox(width: SizeConfig.getWidth(6)),
                                        PaymentTopTile(
                                            title: MessagesProvider.get('Trx Amount'),
                                            amount:
                                            '$currency ${formatAmount((trxData?.transactionAmount ?? 0))}'),
                                        SizedBox(width: SizeConfig.getWidth(6)),
                                        PaymentTopTile(
                                            title: MessagesProvider.get('Tips'),
                                            amount: '$currency ${formatAmount(_getTotalTipAmount())}'),
                                        SizedBox(width: SizeConfig.getWidth(6)),
                                        PaymentTopTile(
                                            title: MessagesProvider.get('Total Paid'),
                                            amount: '$currency ${formatAmount(_getTotalPaidAmount())}'),
                                        SizedBox(width: SizeConfig.getWidth(6)),
                                        PaymentTopTile(
                                            title: MessagesProvider.get('Tendered'),
                                            amount: '$currency ${formatAmount(context.read<PaymentScreenCubit>().state.tenderedAmount)}'),
                                        SizedBox(width: SizeConfig.getWidth(6)),
                                        PaymentTopTile(
                                            title: MessagesProvider.get('Balance'),
                                            amount: '$currency ${formatAmount(_getBalanceAmount(context))}'),
                                        SizedBox(width: SizeConfig.getWidth(6)),
                                        PaymentTopTile(
                                            title: MessagesProvider.get('Change'),
                                            amount: '$currency ${formatAmount(_getChangeAmount(context))}'),
                                        SizedBox(width: SizeConfig.getWidth(6)),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: SizeConfig.getHeight(12)),
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      ValueListenableBuilder<bool>(
                                        valueListenable: _refreshNotifier,
                                        builder: (context, val, _) => SizedBox(
                                          height: SizeConfig.blockSizeVertical * 80,
                                          width:_isSideBarVisible() ? SizeConfig.blockSizeHorizontal * 53 : SizeConfig.blockSizeHorizontal * 66,
                                          child:  _getSelectedPaymentWidget(context.read<PaymentScreenCubit>().state.selectedPayMode, theme),
                                        ),
                                      ),
                                      SizedBox(
                                        height: SizeConfig.blockSizeVertical * 80,
                                        width: _isSideBarVisible() ? SizeConfig.blockSizeHorizontal * 29 : SizeConfig.blockSizeHorizontal * 34,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: theme.tableRow1 ?? colorBlueFA,
                                              borderRadius: BorderRadius.circular(6)),
                                          child: ValueListenableBuilder<TransactionData?>(
                                            valueListenable: _trxDataNotifier,
                                            builder: (ctx, trxData, _) => Column(
                                              children: [
                                                SizedBox(
                                                  height:
                                                  SizeConfig.blockSizeVertical * 49.2,
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(14), vertical: SizeConfig.getHeight(12)),
                                                        child: Row(
                                                          children: [
                                                            Text(MessagesProvider.get('Applied Payments'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(22), fontWeight: FontWeight.w600) ?? tsS16W60016, maxLines: 1),
                                                            SizedBox(width: SizeConfig.getWidth(4)),
                                                            Text(
                                                                '(${trxData?.transactionPaymentDTOList.length ?? 0} ${MessagesProvider.get('items')})',
                                                                style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(22), fontWeight: FontWeight.w500) ?? tsS16W50016, maxLines: 1, overflow: TextOverflow.ellipsis),
                                                            const Spacer(),
                                                            Visibility(
                                                              visible: refundAccessDTO?.shouldDisplayTask ?? true,
                                                              child: InkWell(
                                                                onTap: () {
                                                                  final transaction = context.read<PaymentScreenCubit>().state.transactionResponse?.data;
                                                                  final status = transaction?.transactionStatus;
                                                                  if(status == 'PENDING_CLOSE' || status == 'CLOSED' || status == 'ABANDONED' || status == 'CLOSED'
                                                                      || status == 'CANCELLED' || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
                                                                    _notificationBar.showMessage(
                                                                        MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "REFUND PAYMENT"]),
                                                                        theme.footerBG5 ?? colorYellow91);
                                                                    return;
                                                                  }
                                                                  if(refundAccessDTO?.isTaskEnabled ?? false) {
                                                                    if(refundAccessDTO?.managerApprovalRequired ?? false) {
                                                                      _showManagerLoginPopup(onAuthSuccess: (id) {
                                                                        context.read<PaymentScreenCubit>().reverseSelectedPayments();
                                                                      });
                                                                    } else {
                                                                      context.read<PaymentScreenCubit>().reverseSelectedPayments();
                                                                    }
                                                                  }
                                                                },
                                                                child: Image.asset(
                                                                    'assets/ic_trash.png', color: (refundAccessDTO?.isTaskEnabled ?? false) ? (theme.secondaryColor ?? colorBlack) : (theme.secondaryColor?.withOpacity(0.5) ?? colorBlack.withOpacity(0.5))),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const Divider(),
                                                      Expanded(
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(right: 6),
                                                          child: Scroller(
                                                            controller: _paymentScrollController,
                                                            child: ListView.builder(
                                                                shrinkWrap: true,
                                                                controller: _paymentScrollController,
                                                                padding: EdgeInsets.only(left: SizeConfig.getWidth(8), right: SizeConfig.getWidth(16)),
                                                                scrollDirection: Axis.vertical,
                                                                itemCount: state.appliedPayments?.length ?? 0,
                                                                itemBuilder: (context, pos) {
                                                                  return FutureBuilder(
                                                                      future: _getPayModeById(state.appliedPayments?[pos].paymentModeId ?? -1),
                                                                      builder: (context, snapshot) {
                                                                        String cardNumber = _cardNumber(state.appliedPayments?[pos]);
                                                                        return Padding(
                                                                          key: UniqueKey(),
                                                                          padding: EdgeInsets.only(top: SizeConfig.getHeight(8), right: SizeConfig.getWidth(26)),
                                                                          child: Card(
                                                                            elevation: 0,
                                                                            shape: RoundedRectangleBorder(
                                                                              side: BorderSide(
                                                                                width: 2,
                                                                                color: (state.appliedPayments?[pos].isSelected == true) ? (theme.sideNavListBGSelectedState ?? colorBlack3D) : Colors.transparent,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(4),
                                                                            ),
                                                                            clipBehavior: Clip.antiAlias,
                                                                            child: InkWell(
                                                                              onTap: () {
                                                                                context.read<PaymentScreenCubit>().togglePaymentCardSelection(pos);
                                                                              },
                                                                              child: FutureBuilder(
                                                                                  future: _getTagName(state.appliedPayments?[pos].cardId ?? -1),
                                                                                  builder: (context, debitSnap) => ExpansionTile(
                                                                                  backgroundColor: _isRefunded(state.appliedPayments?[pos]) ? (theme.sideNavListBGSelectedState ?? colorBlack3D).withOpacity(0.5) : (theme.sideNavListBGSelectedState ?? colorBlack3D),
                                                                                  collapsedBackgroundColor: _isRefunded(state.appliedPayments?[pos]) ? (theme.sideNavListBGSelectedState ?? colorBlack3D).withOpacity(0.5) : (theme.sideNavListBGSelectedState ?? colorBlack3D),
                                                                                  iconColor: colorWhite,
                                                                                  collapsedIconColor: colorWhite,
                                                                                  initiallyExpanded: true,
                                                                                  maintainState: true,
                                                                                  key: PageStorageKey<String>('$pos'),
                                                                                  title: Text('${snapshot.data ?? ''} - $cardNumber ${debitSnap.data ?? ''}$currency ${formatAmount(state.appliedPayments?[pos].amount ?? 0)}', style: theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(24), color: Colors.white) ?? tsS16W700FF),
                                                                                  children: [
                                                                                    PaymentSummaryItem(
                                                                                      data: state.appliedPayments?[pos],
                                                                                      dateFormat: dateFormat,
                                                                                      currency: currency,
                                                                                      amountFmt: amountFmt,
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      });
                                                                }),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Spacer(),
                                                ValueListenableBuilder<TransactionData?>(
                                                  valueListenable: _trxDataNotifier,
                                                  builder: (ctx, trxData, _) => SizedBox(
                                                    height: SizeConfig.blockSizeVertical * 28.8,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(left: SizeConfig.getWidth(10), right: SizeConfig.getWidth(10),
                                                          bottom: SizeConfig.getHeight(8), top: SizeConfig.getHeight(5)),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Row(
                                                            mainAxisSize: MainAxisSize.min,
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                flex: 1,
                                                                child:
                                                                FutureBuilder(
                                                                  future: _getTotalPaidCashAmount(),
                                                                  builder: (context, snapshot) => AppliedPaymentBottomCard(
                                                                    title: MessagesProvider.get('Cash'),
                                                                    amount: '$currency ${formatAmount((snapshot.data ?? 0.00))}',
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width:
                                                                  SizeConfig.getWidth(
                                                                      12)),
                                                              Expanded(
                                                                flex: 1,
                                                                child:
                                                                FutureBuilder(
                                                                  future: _getTotalPaidDebitAmount(),
                                                                  builder: (context, snapshot) => AppliedPaymentBottomCard(
                                                                    title: MessagesProvider.get('Debit'),
                                                                    amount: '$currency ${formatAmount((snapshot.data ?? 0.00))}',
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                              height:
                                                              SizeConfig.getHeight(8)),
                                                          Row(
                                                            mainAxisSize: MainAxisSize.min,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                flex: 1,
                                                                child:
                                                                FutureBuilder(
                                                                  future: _getTotalPaidCreditAmount(),
                                                                  builder: (context, snapshot) => AppliedPaymentBottomCard(
                                                                    title: MessagesProvider.get('Credit'),
                                                                    amount: '$currency ${formatAmount((snapshot.data ?? 0.00))}',
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: SizeConfig.getWidth(12)),
                                                              Expanded(
                                                                flex: 1,
                                                                child:
                                                                FutureBuilder(
                                                                  future: _getTotalPaidOthersAmount(),
                                                                  builder: (context, snapshot) => AppliedPaymentBottomCard(
                                                                    title: MessagesProvider.get('Others'),
                                                                    amount: '$currency ${formatAmount((snapshot.data ?? 0.00))}',
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                              height:
                                                              SizeConfig.getHeight(8)),
                                                          AppliedPaymentBottomCard(
                                                              title: MessagesProvider.get('Total Paid'),
                                                              amount: '$currency ${formatAmount(_getTotalPaidAmount())}',
                                                              isBold: true),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal * 100,
                      child: Container(
                        child: _notificationBar,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      )
    );
  }

  void _clearTransactionData() {
    context.read<PaymentScreenCubit>().clear();
  }

  double _getTotalAmount() {
    return (_trxDataNotifier.value?.transactionNetAmount ?? 0);
  }

  double _getTotalPaidAmount() {
    final totalPaidAmt = _trxDataNotifier.value?.transactionPaymentTotal ?? 0;
    return totalPaidAmt;
  }

  double _getTotalTipAmount() {
    if(_trxDataNotifier.value?.transactionPaymentDTOList.isNotEmpty == true) {
      var total = 0.0;
      for (var element in _trxDataNotifier.value!.transactionPaymentDTOList) {
        if(element.paymentStatus != 'REFUNDED') {
          total += element.tipAmount;
        }
      }
      return total;
    } else {
      return 0;
    }
  }

  Future<double> _getTotalPaidCashAmount() async {
    var totalAmount = 0.0;

    _trxDataNotifier.value?.transactionPaymentDTOList.forEach((element) {
      final mode = _payModeMap[element.paymentModeId];
      if(mode?.isCash == true && element.paymentStatus != 'REFUNDED') {
        totalAmount += element.amount;
      }
    });
    return totalAmount;
  }

  Future<double> _getTotalPaidDebitAmount() async {
    var totalAmount = 0.0;

    _trxDataNotifier.value?.transactionPaymentDTOList.forEach((element) async {
      final mode = _payModeMap[element.paymentModeId];
      if(mode?.isDebitCard == true) {
        totalAmount += element.amount;
      }
    });
    return totalAmount;
  }

  Future<double> _getTotalPaidCreditAmount() async {
    var totalAmount = 0.0;

    _trxDataNotifier.value?.transactionPaymentDTOList.forEach((element) async {
      final mode = _payModeMap[element.paymentModeId];
      if(mode?.isCreditCard == true) {
        totalAmount += element.amount;
      }
    });
    return totalAmount;
  }

  Future<double> _getTotalPaidOthersAmount() async {
    var totalAmount = 0.0;

    _trxDataNotifier.value?.transactionPaymentDTOList.forEach((element) {
      final mode = _payModeMap[element.paymentModeId];
      if(mode?.isCreditCard != true && mode?.isDebitCard != true && mode?.isCash != true) {
        totalAmount += element.amount;
      }
    });
    return totalAmount;
  }

  double _getBalanceAmount(BuildContext context) {
    var balance = 0.0;
    var totalPaid = 0.0;
    if(_trxDataNotifier.value?.transactionPaymentDTOList.isNotEmpty == true) {
      totalPaid = _trxDataNotifier.value?.transactionPaymentTotal ?? 0;
      balance = _getTotalAmount() - totalPaid;
      return balance.toInt() == 0 ? 0 : balance;
    } else {
      final tenderedAmt = context.read<PaymentScreenCubit>().state.tenderedAmount;
      balance = _getTotalAmount() - tenderedAmt;
      return balance > 0 ? balance : 0;
    }
  }

  double _getChangeAmount(BuildContext context) {
    var changeAmt = 0.0;
    final tenderedAmt = context.read<PaymentScreenCubit>().state.tenderedAmount;
    if(tenderedAmt != 0) {
      changeAmt = tenderedAmt - _getTotalAmount();
      return changeAmt > 0 ? changeAmt : 0;
    } else {
      return 0.0;
    }
  }

  Future<String> _getPayModeById(int mode) async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    try {
      final payMode = await masterDataBL.getPaymentModeById(mode);
      return payMode?.paymentMode ?? '';
    } on DioError catch(error) {
      return '';
    }
  }

  Future<String> _getTagName(int cardID) async {
    if(cardID == -1) {
      return ' ';
    }
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final customerDataBl = await CustomerDataBuilder.build(execContext!);
    try {
      final response = await customerDataBl.getCustomerAccounts(
          customerId: -1 ,
          buildChildRecords: false,
          activeRecordsOnly: false,
          accountId: cardID
      );
      return (response.data?.isNotEmpty == true) ? '${response.data![0].tagNumber} ' : ' ';
    } on DioError catch(error) {
      return ' ';
    }
  }

  String formatAmount(double amount) {
    final format = NumberFormat(amountFmt);
    return format.format(amount);
  }

  Future<void> _checkCurrentUserPrivileges() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final userRoleDTO = await masterDataBL.getUserRoleById(execContext.userRoleId ?? -1);
    _isCurrentUserManager = userRoleDTO?.selfApprovalAllowed == true;
    if(mounted) {
      context.read<PaymentScreenCubit>().updateCurrentUserPrivileges(_isCurrentUserManager);
    }
  }

  Future<void> _checkAccessControls() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final totalTasks = await masterDataBL.getTaskTypeContainerList();
    final userRoleDTO = await masterDataBL.getUserRoleById(execContext.userRoleId ?? -1);
    currency = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CURRENCY_SYMBOL') ?? '';
    amountFmt = await masterDataBL.getDefaultValuesByName(defaultValueName: 'AMOUNT_FORMAT') ?? '#,##0.00';
    final paymentTasks = totalTasks.where((element) => element.category?.toLowerCase() == 'PAYMENT FUNCTION'.toLowerCase());
    final paymentFormAccessDTOList = userRoleDTO?.managementFormAccessContainerDTOList.where((element) => element.mainMenu.toLowerCase() == 'PAYMENT FUNCTION'.toLowerCase());
    for (ManagementFormAccessContainerDTO mangerDto in (paymentFormAccessDTOList ?? [])) {
      if (mangerDto.formName.toLowerCase() == 'Apply'.toLowerCase()) {
        final applyTasks = paymentTasks.where((element) => element.taskTypeName?.toLowerCase() == 'Apply'.toLowerCase()).toList();
        if(applyTasks.isNotEmpty) {
          applyAccessDTO = PaymentAccessControlDTO(
              shouldDisplayTask: applyTasks.first.displayInPos == 'Y',
              managerApprovalRequired: applyTasks.first.requiresManagerApproval == 'Y',
              isTaskEnabled: true);
        }
      }
      if (mangerDto.formName.toLowerCase() == 'Refund Payment'.toLowerCase()) {
        final refundTasks = paymentTasks.where((element) => element.taskTypeName?.toLowerCase() == 'Refund Payment'.toLowerCase()).toList();
        if(refundTasks.isNotEmpty) {
          refundAccessDTO = PaymentAccessControlDTO(
              shouldDisplayTask: refundTasks.first.displayInPos == 'Y',
              managerApprovalRequired: refundTasks.first.requiresManagerApproval == 'Y',
              isTaskEnabled: true);
        }
      }
      if (mangerDto.formName.toLowerCase() == 'Tip Adjust'.toLowerCase()) {
        final tipAdjustTasks = paymentTasks.where((element) => element.taskTypeName?.toLowerCase() == 'Tip Adjust'.toLowerCase()).toList();
        if(tipAdjustTasks.isNotEmpty) {
          tipAdjustAccessDTO = PaymentAccessControlDTO(
              shouldDisplayTask: tipAdjustTasks.first.displayInPos == 'Y',
              managerApprovalRequired: tipAdjustTasks.first.requiresManagerApproval == 'Y',
              isTaskEnabled: true);
        }
      }
    }
    if(applyAccessDTO == null) {
      final applyTasks = paymentTasks.where((element) => element.taskTypeName?.toLowerCase() == 'Apply'.toLowerCase()).toList();
      if(applyTasks.isNotEmpty) {
        applyAccessDTO = PaymentAccessControlDTO(
            shouldDisplayTask: applyTasks.first.displayInPos == 'Y',
            managerApprovalRequired: applyTasks.first.requiresManagerApproval == 'Y',
            isTaskEnabled: false);
      } else {
        applyAccessDTO = PaymentAccessControlDTO(
            shouldDisplayTask: true,
            managerApprovalRequired: false,
            isTaskEnabled: false);
      }
    }
    if(refundAccessDTO == null) {
      final refundTasks = paymentTasks.where((element) => element.taskTypeName?.toLowerCase() == 'Refund Payment'.toLowerCase()).toList();
      if(refundTasks.isNotEmpty) {
        refundAccessDTO = PaymentAccessControlDTO(
            shouldDisplayTask: refundTasks.first.displayInPos == 'Y',
            managerApprovalRequired: refundTasks.first.requiresManagerApproval == 'Y',
            isTaskEnabled: false);
      } else {
        refundAccessDTO = PaymentAccessControlDTO(
            shouldDisplayTask: true,
            managerApprovalRequired: false,
            isTaskEnabled: false);
      }
    }
    if(tipAdjustAccessDTO == null) {
      final tipAdjustTasks = paymentTasks.where((element) => element.taskTypeName?.toLowerCase() == 'Tip Adjust'.toLowerCase()).toList();
      if(tipAdjustTasks.isNotEmpty) {
        tipAdjustAccessDTO = PaymentAccessControlDTO(
            shouldDisplayTask: tipAdjustTasks.first.displayInPos == 'Y',
            managerApprovalRequired: tipAdjustTasks.first.requiresManagerApproval == 'Y',
            isTaskEnabled: false);
      } else {
        tipAdjustAccessDTO = PaymentAccessControlDTO(
            shouldDisplayTask: true,
            managerApprovalRequired: false,
            isTaskEnabled: false);
      }
    }
    setState(() {});
  }

  void _filterPaymentModes() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final allModes = await masterDataBL.getPaymentModes();
    final machineDTO = await masterDataBL.getPOSMachineById(machineId: execContext.machineId ?? -1);
    final modes = <PaymentModeContainerDTO>[];
    if(allModes != null) {
      for (var includedPayment in (machineDTO?.posPaymentModeInclusionContainerDTOList ?? <POSPaymentModeInclusionContainerDTO>[])) {
        final mode = allModes.where((element) => element.paymentModeId == includedPayment.paymentModeId).toList();
        modes.addAll(mode);
      }
    }
    final defMode = await masterDataBL.getDefaultValuesByName(defaultValueName: "DEFAULT_PAYMENT_MODE");
    dateFormat = await masterDataBL.getDefaultValuesByName(defaultValueName: "DATE_FORMAT");
    if(dateFormat != null) {
      dateFormat = '$dateFormat hh:mm a';
    }
    if(modes.isNotEmpty) {
      var cashIndex = 0;
      final newList = modes.toList();
      for(int i=0; i<newList.length; i++) {
        if(newList[i].paymentMode == 'Cash') {
          cashIndex = i;
          break;
        }
      }
      final firstItem = newList.first;
      final cashItem = newList[cashIndex];
      newList[0] = cashItem;
      newList[cashIndex] = firstItem;
      if(defMode != null && defMode.isNotEmpty) {
        final selectedMode = modes.where((element) => element.guid.toUpperCase() == defMode.toUpperCase());
        if(selectedMode.isNotEmpty) {
          var selIndex = 0;
          if(selectedMode.first.paymentModeId == 291) { /// cash payment so set index to zero
            selIndex = 0;
          } else {
            selIndex = modes.indexOf(selectedMode.first);
          }
          if(mounted) {
            context.read<PaymentScreenCubit>().setSelectedPayModeIndex(selIndex);
          }
        }
      }
      _paymentModeNotifier.value = newList;
      if(mounted) {
        context.read<PaymentScreenCubit>().setSelectedPayMode(cashItem);
        context.read<PaymentScreenCubit>().updateGlobalPaymentModes(newList);

        for(int i=0; i<newList.length; i++) {
          final item = newList[i];
          _payModeMap[item.paymentModeId] = item;
        }
      }
    }
  }

  Widget _getSelectedPaymentWidget(PaymentModeContainerDTO? selectedPayMode, SemnoxTheme theme) {
    if (selectedPayMode?.paymentMode == 'ISMP4' || selectedPayMode?.paymentMode == 'Card Connect') {
      return BlocProvider<CardScreenCubit>(create: (ctx) => CardScreenCubit(),
        child: ISMP4Screen(
          key: ValueKey(_refreshNotifier.value),
          transactionData: _trxDataNotifier.value,
          accessControlDTO: applyAccessDTO,
          onPaymentComplete: (response) {
            if(response != null) {
              final lastPayment = response.data?.transactionPaymentDTOList.last;
              if(lastPayment?.paymentStatus == 'PRE_AUTHORIZED') {
                _notificationBar.showMessage(MessagesProvider.get('Payment has been Successfully processed'), colorBlueFE);
                context.read<PaymentScreenCubit>().updateTransaction(response);
                context.read<PaymentScreenCubit>().updateAppliedPayments(response.data?.transactionPaymentDTOList);
                _trxDataNotifier.value = response.data;
                context.read<PaymentScreenCubit>().setLoadingStatus(status: 0);
                printReceipt(selectedPayMode?.paymentModeId,  response.data);
              } else if (lastPayment?.paymentStatus == 'AUTHORIZED') {
                _notificationBar.showMessage(MessagesProvider.get('Payment has been Successfully processed'), colorBlueFE);
                context.read<PaymentScreenCubit>().updateTransaction(response);
                context.read<PaymentScreenCubit>().updateAppliedPayments(response.data?.transactionPaymentDTOList);
                _trxDataNotifier.value = response.data;
                context.read<PaymentScreenCubit>().setLoadingStatus(status: 0);
                printReceipt(selectedPayMode?.paymentModeId,  response.data);
                Future.delayed(const Duration(milliseconds: 100), () {
                  _checkAmtAndPop();
                });
              } else {
                _doPostPaymentProcess(response);
              }
            }
          },
        ),
      );
    }
    else if(selectedPayMode?.isDebitCard == true) {
      return BlocProvider<SemnoxDebitCubit>(create: (ctx) => SemnoxDebitCubit(),
        child: SemnoxDebitScreen(
          key: ValueKey(_refreshNotifier.value),
          transactionData: _trxDataNotifier.value,
          accessControlDTO: applyAccessDTO,
          onClearErrorMessage: () {
            _notificationBar.showMessage('', Theme.of(context).extension<SemnoxTheme>()!.footerBG2 ?? colorWhite);
          },
          onPaymentComplete: (response) {
            if(response != null) {
              _doPostPaymentProcess(response);
            }
          },
        ),
      );
    }
    else if (selectedPayMode?.isCreditCard == true) {
      return BlocProvider<CardScreenCubit>(create: (ctx) => CardScreenCubit(),
      child: CreditDebitScreen(
        key: ValueKey(_refreshNotifier.value),
        transactionData: _trxDataNotifier.value,
        accessControlDTO: applyAccessDTO,
        onPaymentComplete: (response) {
          if(response != null) {
            final lastPayment = response.data?.transactionPaymentDTOList.last;
            if(lastPayment?.paymentStatus == 'PRE_AUTHORIZED') {
              _notificationBar.showMessage(MessagesProvider.get('Payment has been Successfully processed'), colorBlueFE);
              context.read<PaymentScreenCubit>().updateTransaction(response);
              context.read<PaymentScreenCubit>().updateAppliedPayments(response.data?.transactionPaymentDTOList);
              _trxDataNotifier.value = response.data;
              context.read<PaymentScreenCubit>().setLoadingStatus(status: 0);
            } else if (lastPayment?.paymentStatus == 'AUTHORIZED') {
              _notificationBar.showMessage(MessagesProvider.get('Payment has been Successfully processed'), colorBlueFE);
              context.read<PaymentScreenCubit>().updateTransaction(response);
              context.read<PaymentScreenCubit>().updateAppliedPayments(response.data?.transactionPaymentDTOList);
              _trxDataNotifier.value = response.data;
              context.read<PaymentScreenCubit>().setLoadingStatus(status: 0);
              Future.delayed(const Duration(milliseconds: 100), () {
                _checkAmtAndPop();
              });
            } else {
              _doPostPaymentProcess(response);
            }
          }
        },
      ),
      );
    }
    else if (selectedPayMode?.isCoupon == true) {
      return BlocProvider<VoucherScreenCubit>(create: (ctx) => VoucherScreenCubit(),
      child: VoucherScreen(
        key: ValueKey(_refreshNotifier.value),
        transactionData: _trxDataNotifier.value,
        accessControlDTO: applyAccessDTO,
        onPaymentComplete: (response) {
          if(response != null) {
            _doPostPaymentProcess(response);
          }
        },
      ),
      );
    }
    else if (selectedPayMode?.isCash == true) {
      if(selectedPayMode?.paymentMode == 'Cash') { /// Cash screen
        return BlocProvider<CashScreenCubit>(
          create: (ctx) =>
              CashScreenCubit(),
          child: CashScreen(
            key: ValueKey(_refreshNotifier.value),
            transactionData: _trxDataNotifier.value,
            accessControlDTO: applyAccessDTO,
            isParentScreenOpened: _isParentScreenOpened,
            onPaymentComplete: (response) {
              if(response != null) {
                _doPostPaymentProcess(response);
              }
            },
          ),
        );
      } else { /// Generic screens
        return BlocProvider<GenericScreenCubit>(
          create: (ctx) =>
              GenericScreenCubit(),
          child: GenericPaymentScreen(
            key: ValueKey(_refreshNotifier.value),
            transactionData: _trxDataNotifier.value,
            accessControlDTO: applyAccessDTO,
            onPaymentComplete: (response) {
              if(response != null) {
                _doPostPaymentProcess(response);
              }
            },
          ),
        );
      }
    } else { /// Generic screens
      if(selectedPayMode == null) {
        return Center(
          child: Text(MessagesProvider.get('No Payment Modes available'), style: theme.heading2),
        );
      } else {
        return BlocProvider<GenericScreenCubit>(
          create: (ctx) =>
              GenericScreenCubit(),
          child: GenericPaymentScreen(
            key: ValueKey(_refreshNotifier.value),
            transactionData: _trxDataNotifier.value,
            accessControlDTO: applyAccessDTO,
            onPaymentComplete: (response) {
              if(response != null) {
                _doPostPaymentProcess(response);
              }
            },
          ),
        );
      }
    }
  }

  Future<void> _doPostPaymentProcess(TransactionResponse response) async {
    context.read<PaymentScreenCubit>().updateTransaction(response);
    context.read<PaymentScreenCubit>().updateAppliedPayments(response.data?.transactionPaymentDTOList);
    _trxDataNotifier.value = response.data;

    if(mounted) {
      context.read<PaymentScreenCubit>().setLoadingStatus(status: 0);
      _notificationBar.showMessage(MessagesProvider.get('Payment has been Successfully processed'), colorBlueFE);

      final paymentCubit = context.read<PaymentScreenCubit>();
      final selectedPayMode = paymentCubit.state.selectedPayMode;

      printReceipt(selectedPayMode?.paymentModeId,  response.data);

      Future.delayed(const Duration(milliseconds: 250), () {
        if(selectedPayMode?.enableTipAllocation == true) {
          showDialog(context: context, builder: (ctx) {
            return Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(260)),
              child: TipPopup(
                onTapYes: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BlocProvider<SettleScreenCubit>(
                      create: (context) => SettleScreenCubit(),
                      child: PaymentSettlementScreen(
                        transactionData: _trxDataNotifier.value,
                        initialPage: 1,
                      )))).then((value) {
                    _trxDataNotifier.value = paymentCubit.state.transactionResponse?.data;
                    _checkAmtAndPop();
                  });
                },
                onTapNo: () {
                  _checkAmtAndPop();
                },
              ),
            );
          }, barrierDismissible: false);
        } else {
          _checkAmtAndPop();
        }
      });
    }
  }


  void _checkAmtAndPop() {
    final totalPaidAmt = _trxDataNotifier.value?.transactionPaymentTotal ?? 0.0;
    final totalAmt = _trxDataNotifier.value?.transactionNetAmount ?? 0.0;

    Log.v('paid: $totalPaidAmt, total: $totalAmt, ${totalPaidAmt == totalAmt}');
    if(totalPaidAmt == totalAmt) {
      Navigator.pop(context);
    }
  }

  bool _isSideBarVisible() {
    return context.read<PaymentScreenCubit>().state.shouldShowSideBar;
  }

  bool _isRefunded(TransactionPaymentDTO? paymentDTO) {
    if(paymentDTO != null) {
      return paymentDTO.paymentStatus.toLowerCase().contains('refund');
    } else {
      return false;
    }
  }

  String _cardNumber(TransactionPaymentDTO? paymentDTO){
    if(paymentDTO != null) {
      var acctNo = "";
      final attrList2 = paymentDTO.attribute2?.toString().split('~') ?? [];
      if(attrList2.length == 4) {
        var acctNo = attrList2[2];
        acctNo = "${acctNo.substring(acctNo.length - 4)} - ";
        if(paymentDTO.paymentStatus == 'PRE_AUTHORIZED') {
          return acctNo;
        }else {
          return "";
        }
      }
      return acctNo;
    } else {
      return "";

    }
  }

  void printReceipt(int? paymentModeId, TransactionData? transactionData) async{
    if(paymentModeId == 439 || paymentModeId  == 440)  {
      final execContextBL = await ExecutionContextBuilder.build();
      final execContextDTO = execContextBL.getExecutionContext();
      final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
      String? isMerchantCopy = await masterDataBL.getDefaultValuesByName(defaultValueName: 'PRINT_MERCHANT_RECEIPT');
      String? isCustomerCopy = await masterDataBL.getDefaultValuesByName(defaultValueName: 'PRINT_CUSTOMER_RECEIPT');

      Log.v("PAYPRINT: PRINT RECEIPT");
      if(isMerchantCopy == 'Y'){
        String merchantCopy = transactionData?.transactionPaymentDTOList.last.paymentTransactionDTOList.last.merchantCopy;
        if(merchantCopy != null && merchantCopy != ''){
          context.read<DeviceInterfaceCubit>().setPrinterContent(merchantCopy);
        }
      }
      if(isCustomerCopy == 'Y'){
        String customerCopy = transactionData?.transactionPaymentDTOList.last.paymentTransactionDTOList.last.customerCopy;

        if(customerCopy != null && customerCopy != ''){
          context.read<DeviceInterfaceCubit>().setPrinterContent(customerCopy);
        }
      }

    }
  }

  void _showManagerLoginPopup({required Function(int) onAuthSuccess}) {
    showDialog(context: context, barrierDismissible: false, builder: (ctx) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: SizeConfig.getSize(220)),
        child: ManagerLoginView(
          onLoginSuccess: (response) {
            onAuthSuccess(response.data?.userPKId ?? -1);
          },
          onLoginError: (err) {},
        ),
      );
    });
  }
}

class PaymentAccessControlDTO {
  bool shouldDisplayTask;
  bool managerApprovalRequired;
  bool isTaskEnabled;

  PaymentAccessControlDTO({required this.shouldDisplayTask, required this.managerApprovalRequired,
    required this.isTaskEnabled});
}