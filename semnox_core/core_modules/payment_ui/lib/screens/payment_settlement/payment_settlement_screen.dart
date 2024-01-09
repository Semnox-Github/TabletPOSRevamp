import 'package:customer_data/models/customer_data.dart';
import 'package:customer_ui/customer_lookup_screen.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/payment_modes_container/payment_mode_container_dto.dart';
import 'package:master_data/models/user_role_container/management_form_access_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:payment_data/models/request/ui_argument.dart';
import 'package:payment_ui/cubits/payment_settlement/edit_payment/edit_payment_cubit.dart';
import 'package:payment_ui/cubits/payment_settlement/settle_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_settlement/settle_screen_state.dart';
import 'package:payment_ui/cubits/payment_summary/payment_screen_cubit.dart';
import 'package:payment_ui/screens/payment_settlement/edit_payment_popup.dart';
import 'package:payment_ui/screens/payment_settlement/trx_listing_screen.dart';
import 'package:payment_ui/screens/payment_settlement/widgets/settlement_nav_bar_widget.dart';
import 'package:payment_ui/screens/payment_summary/payment_summary_screen.dart';
import 'package:payment_ui/utils/colors.dart';
import 'package:payment_ui/utils/common_widgets.dart';
import 'package:payment_ui/utils/extensions.dart';
import 'package:payment_ui/utils/feature_not_implemented_view.dart';
import 'package:payment_ui/utils/styles.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/models/create_transaction/transaction_data.dart';
import 'package:transaction_data/models/create_transaction/transaction_payment_dto.dart';
import 'package:widgets_library/loader_dialog.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/utils/keyboard_hider_widget.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:widgets_library/utils/stack_collection.dart';

class PaymentSettlementScreen extends StatefulWidget {
  final TransactionData? transactionData;
  final int? transactionId;
  final int initialPage ;

  const PaymentSettlementScreen({Key? key, this.transactionData, this.transactionId,this.initialPage = 0})
      : super(key: key);

  @override
  State<PaymentSettlementScreen> createState() =>
      _PaymentSettlementScreenState();
}

class _PaymentSettlementScreenState extends State<PaymentSettlementScreen> {
  late NotificationBar _notificationBar;
  final _trxDataNotifier = ValueNotifier<TransactionData?>(null);
  final _filterNotifier = ValueNotifier<bool>(true);

  final _trxIdController = TextEditingController();
  final _customerNameController = TextEditingController();
  final _cardNoController = TextEditingController();
  final _settleAmtController = TextEditingController();
  var _currentDateTime = DateTime.now();
  final _fromDateController = TextEditingController(text: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0).toString());
  final _toDateController = TextEditingController(text: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0).add(const Duration(days: 1)).toString());

  final _payModesList = <PaymentModeContainerDTO>[];
  final _selectedPayMode = ValueNotifier<PaymentModeContainerDTO?>(null);
  final _settleModesNotifier = ValueNotifier<List<String>>([]);
  CustomerData? _selectedCustomerData;
  final _scrollController = ScrollController();
  String? dateFormat;
  String currency = '';
  String amountFmt = '#,##0.00';

  ///Access controls
  PaymentAccessControlDTO? settlePaymentAccessDTO;
  PaymentAccessControlDTO? tipAdjustAccessDTO;
  PaymentAccessControlDTO? editPaymentAccessDTO;

  @override
  void initState() {
    initializeDateFormatting('pt_BR');
    Future.microtask(() => _initPayModes());
    Future.microtask(() => _checkAccessControls());
    Future.microtask(() => _initPaymentEntries());
    Future.microtask(() => _setSettleModes());
    _notificationBar = NotificationBar(
      showHideSideBar: true,
      onSideBarStatusUpdate: (shouldShowSidebar) {
        context.read<SettleScreenCubit>().setSideBarStatus(shouldShowSidebar);
      },
    );
    _settleAmtController.text = '0';
    _trxIdController.text = widget.transactionData?.transactionId.toString() ?? '';
    if(widget.transactionId != null) {
      _trxIdController.text = widget.transactionId.toString() ?? '';
    }
    _trxDataNotifier.value = widget.transactionData;
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
          child: BlocConsumer<SettleScreenCubit, SettleScreenState>(
            listener: (ctx, state) {

              if(state.loadingStatus == 1) {
                Future.microtask(() => showLoaderDialog(context, state.loadingMessage));
              }

              if(state.loadingStatus == 0) {
                context.read<SettleScreenCubit>().setLoadingStatus(status: -1, message: null);
                hideLoaderDialog(context);
                Future.microtask(() {
                  if (state.apiError != null) {
                    Future.microtask(() => showErrorDialog(
                      context, MessagesProvider.get("Error"), state.apiError ?? '',
                      theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(30)) ?? tsS16W70016,
                      theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(23)) ?? tsS16W70016,
                    ));
                    context.read<SettleScreenCubit>().setApiError(null);
                  }

                  if (state.isTipAdded) {
                    final checkedPayments = state.settledPayments
                    .where((element) => element.isSelected == true);
                    final ids = StringBuffer();
                    for (var element in checkedPayments) {
                      ids.write('${element.paymentId}, ');
                    }
                    final updatedIds = ids.toString().substring(0, ids.length - 2);
                    final tipMsg = MessagesProvider.get(
                    'Tip has been adjusted for the selected Payment/s with Ids : &1',
                    [updatedIds.toString()]);

                    if(widget.transactionData?.transactionId == state.transactionResponse?.data?.transactionId) {
                      _trxDataNotifier.value = state.transactionResponse?.data;
                      context.read<PaymentScreenCubit>().updateTransaction(state.transactionResponse);
                      context.read<PaymentScreenCubit>().updateAppliedPayments(state.transactionResponse?.data?.transactionPaymentDTOList);
                    }
                    Future.microtask(() => showGenericDialog(
                        context,() {
                          context.read<SettleScreenCubit>().setTipAddedStatus(false);
                          if(widget.transactionData != null) {
                            Navigator.pop(context);
                          } else {
                            _processSearchTransaction(state.selectedSettleMode!);
                          }
                    }, MessagesProvider.get('Message'), tipMsg, isDismissible: false));
                  }

                  if(state.isSettleCompleted) {
                    final checkedPayments = state.authorizedPayments.where((element) => element.isSelected == true);
                    final ids = StringBuffer();
                    for (var element in checkedPayments) {
                      ids.write('${element.paymentId}, ');
                    }
                    final updatedIds = ids.toString().substring(0, ids.length - 2);
                    final msg = MessagesProvider.get('Payment Id: ${updatedIds.toString()} have been settled.');
                    context.read<PaymentScreenCubit>().updateTransaction(state.transactionResponse, isSettleCompleted: true);
                    context.read<SettleScreenCubit>().resetSettlePaymentStatus();
                    Future.microtask(() => showGenericDialog(
                        context,() {
                          if(widget.transactionData != null){
                            Navigator.pop(context);
                          }else{
                            _searchAuthTransactions();
                          }
                    }, MessagesProvider.get('Message'), msg, isDismissible: false));
                  }
                 });

                if(state.exemptedPayments.isNotEmpty) {
                  Future.microtask(() async {
                    final msgBuff = StringBuffer();
                    final stack = StackCollection<String>();
                    await Future.forEach(state.exemptedPayments, (element) {
                      msgBuff.write('Payment Id: ${element.paymentId}, Message: Tip amount is higher than ${state.maxLimitTipPC}% of transaction amount. Please try lesser amount.\n');
                      final tipAmtLimit = element.amount * (state.maxLimitTipPC / 100);
                      final msg = 'Transaction Id: ${element.transactionId}\nPayment Id: ${element.paymentId}\nTotal Transaction Amount: $currency${formatAmount(element.amount)}\nTip Amount Limit: ${formatAmount(tipAmtLimit)}\nTip amount is higher than the ${state.maxLimitTipPC}% of transaction amount. Please try lesser amount.';
                      stack.push(msg);
                    });
                    stack.insertAtStart(msgBuff.toString());
                    await Future.doWhile(() async {
                      final msg = stack.pop();
                      if(stack.length == 0) {
                        await showGenericDialog(
                            context,() {
                              if(!state.isTipAdded) {
                                _processSearchTransaction(state.selectedSettleMode!);
                              }
                        }, MessagesProvider.get('Message').toUpperCase(), msgBuff.toString(), isDismissible: false);
                        return false;
                      } else {
                        await showGenericDialog(
                            context,() {}, MessagesProvider.get('Tip Limit Validation').toUpperCase(), msg ?? '', isDismissible: false);
                        return true;
                      }
                    });
                    if(mounted) {
                      context.read<SettleScreenCubit>().clearExemptedPayments();
                    }
                  });
                }
              }

              if(state.validationError != null) {
                _notificationBar.showMessage(state.validationError ?? '', theme.footerBG5 ?? colorBlueFE);
                context.read<SettleScreenCubit>().setValidationError(null);
              }

              if (state.notificationMessage != null) {
                _notificationBar.showMessage(state.notificationMessage ?? '', theme.footerBG4 ?? colorBlueFE);
                context.read<SettleScreenCubit>().setNotificationMessage(null);
              }

              if(state.searchedForSettleModes) {
                _settleModesNotifier.value = state.searchedSettlementModes;
                context.read<SettleScreenCubit>().updateSettlementModes([], searchedForSettleModes: false);
              }
            },
            builder: (ctx, state) => Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.white,
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
                                child: ValueListenableBuilder<List<String>>(
                                  valueListenable: _settleModesNotifier,
                                  builder: (ctx, modes, _) => SettlementNavBarWidget(
                                    settleModes: modes,
                                    onPageSwitched: (currPage) {
                                      _selectedPayMode.value = null;
                                      if(currPage == 'Settle') {
                                        context.read<SettleScreenCubit>().clearEditablePayments();
                                        _notificationBar.showMessage('',
                                            theme.footerBG2 ?? colorWhite);
                                        _processSearchTransaction('Settle');
                                      } else if (currPage == 'Adjust Tip') {
                                        context.read<SettleScreenCubit>().clearEditablePayments();
                                        _notificationBar.showMessage('',
                                            theme.footerBG2 ?? colorWhite);
                                        _processSearchTransaction('Adjust Tip');
                                      } else if (currPage == 'Edit') {
                                        _notificationBar.showMessage(
                                            MessagesProvider.get(
                                                'Please select Payment Mode to proceed.'),
                                            theme.footerBG4 ?? colorBlueFE);
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              color: theme.backGroundColor,
                              width: _isSideBarVisible()
                                  ? SizeConfig.blockSizeHorizontal * 82
                                  : SizeConfig.blockSizeHorizontal * 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(8)),
                                            decoration: BoxDecoration(
                                                color: theme.footerBG1,
                                                borderRadius: BorderRadius.circular(6)),
                                            height: SizeConfig.getHeight(60),
                                            child: const SizedBox(),
                                          ),
                                          SizedBox(height: SizeConfig.getHeight(12)),
                                          ValueListenableBuilder<bool>(
                                            valueListenable: _filterNotifier,
                                            builder: (context, value, _) =>
                                                Visibility(
                                              visible: context.read<SettleScreenCubit>().state.showFilterSection,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(8)),
                                                decoration: BoxDecoration(
                                                    color: theme.primaryColor,
                                                    borderRadius: BorderRadius.circular(6),
                                                    border: Border.all(color: theme.light2 ?? colorGreyD8)),
                                                height: SizeConfig.isBigDevice() ? SizeConfig.getHeight(170) : SizeConfig.getHeight(235),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 2,
                                                          child: Padding(
                                                            padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(12)),
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                                              children: [
                                                                SizedBox(height: SizeConfig.getHeight(12)),
                                                                Text(MessagesProvider.get('Transaction ID'), style: theme.heading5?.copyWith(fontWeight: FontWeight.w400,
                                                                    fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
                                                                SizedBox(height: SizeConfig.getHeight(8)),
                                                                customTextField(
                                                                  context: context,
                                                                  hint: MessagesProvider.get('Enter TrxId'),
                                                                  textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18),
                                                                      fontWeight: FontWeight.w500) ?? tsS16W50016,
                                                                  controller: _trxIdController,
                                                                  keyboardType: const TextInputType.numberWithOptions(decimal: false, signed: false),
                                                                  maxLength: 10,
                                                                  readOnly: true,
                                                                  onTap: () {
                                                                    _showNumberPadDialog();
                                                                  },
                                                                  height: SizeConfig
                                                                      .getHeight(
                                                                      56),
                                                                  borderColor: theme.dividerColor ?? colorBlack3D,
                                                                  fillColor: theme.primaryColor ?? colorWhite,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Padding(
                                                            padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(8)),
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                                              children: [
                                                                SizedBox(
                                                                    height: SizeConfig.getHeight(12)),
                                                                Text(
                                                                    MessagesProvider.get('Payment Modes'),
                                                                    style: theme.heading5?.copyWith(fontWeight: FontWeight.w400,fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
                                                                SizedBox(height: SizeConfig.getHeight(8)),
                                                                ValueListenableBuilder<PaymentModeContainerDTO?>(
                                                                  valueListenable: _selectedPayMode,
                                                                  builder: (context, value, _) => customDropDown(
                                                                    hint: MessagesProvider.get('Select'),
                                                                    items: _payModesList.map((item) => DropdownMenuItem(
                                                                        value: item,
                                                                        child: Text(item.paymentMode,
                                                                            style: theme.heading5?.copyWith(
                                                                                fontSize: SizeConfig.getFontSize(18),
                                                                                fontWeight: FontWeight.w500) ??
                                                                                tsS16W50016))).toList(),
                                                                    value: _selectedPayMode.value,
                                                                    onChange: (value) {
                                                                      _selectedPayMode.value = value;
                                                                      _processSearchTransaction(state.selectedSettleMode!);
                                                                    },
                                                                    hintTextStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18),
                                                                        fontWeight: FontWeight.w500,
                                                                        color: Colors.grey) ?? tsS16W50016,
                                                                    textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18),
                                                                        fontWeight: FontWeight.w500) ?? tsS16W50016,
                                                                    height: SizeConfig.getHeight(56),
                                                                    borderColor: theme.dividerColor ?? colorBlack3D,
                                                                    iconColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Padding(
                                                            padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(8)),
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                                              children: [SizedBox(height: SizeConfig.getHeight(12)),
                                                                Text(MessagesProvider.get('Channel'),
                                                                    style: theme.heading5?.copyWith(fontWeight: FontWeight.w400,fontSize: SizeConfig.getFontSize(20),
                                                                        color: Colors.grey.withOpacity(0.5)) ?? tsS16W70016),
                                                                SizedBox(height: SizeConfig.getHeight(8)),
                                                                customDropDown(
                                                                  hint: MessagesProvider.get('Select'),
                                                                  hintTextStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18),
                                                                      fontWeight: FontWeight.w500,
                                                                      color: Colors.grey.withOpacity(0.5)) ?? tsS16W50016,
                                                                  textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18),
                                                                      fontWeight: FontWeight.w500,
                                                                      color: Colors.grey.withOpacity(0.5)) ?? tsS16W50016,
                                                                  borderColor: Colors.grey.withOpacity(0.2),
                                                                  iconColor: Colors.grey.withOpacity(0.5),
                                                                  height: SizeConfig.getHeight(56),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Padding(
                                                            padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(8)),
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                                              children: [
                                                                SizedBox(height: SizeConfig.getHeight(12)),
                                                                Text(MessagesProvider.get('CC Number (last 4 digits)'), style: theme.heading5?.copyWith(fontWeight: FontWeight.w400,fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
                                                                SizedBox(height: SizeConfig.getHeight(8)),
                                                                customTextField(
                                                                  context: context,
                                                                  hint: MessagesProvider.get('Enter'),
                                                                  borderColor: theme.dividerColor ?? colorBlack3D,
                                                                  fillColor: theme.primaryColor ?? colorWhite,
                                                                  textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18),
                                                                      fontWeight: FontWeight.w500) ?? tsS16W50016,
                                                                  controller: _cardNoController,
                                                                  maxLength: 4,
                                                                  height: SizeConfig.getHeight(56),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Padding(
                                                            padding: EdgeInsets.only(  right: SizeConfig.getWidth(8)),
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                    height: SizeConfig.getHeight(12)),
                                                                Text('', style: tsS16W70016.copyWith(fontSize: SizeConfig.getFontSize(20))),
                                                                SizedBox(height: SizeConfig.getHeight(8)),
                                                                containerButton(text: MessagesProvider.get('Search').toUpperCase(),
                                                                    textStyle: theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(18),
                                                                        color: Colors.white) ?? tsS20W700FF,
                                                                    height: SizeConfig.getHeight(68),
                                                                    width: SizeConfig.getWidth(100),
                                                                    buttonColor: theme.button2InnerShadow1 ?? colorBlack,
                                                                    cornerRadius: 5,
                                                                    onTapped: () {
                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                      _processSearchTransaction(state.selectedSettleMode!);
                                                                    }),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: SizeConfig.getHeight(12)),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 5,
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                flex: 1,
                                                                child: Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(12)),
                                                                  child: Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                    children: [
                                                                      Text(MessagesProvider.get('From'), style: theme.heading5?.copyWith(fontWeight: FontWeight.w400,fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
                                                                      SizedBox(height: SizeConfig.getHeight(8)),
                                                                      dateTextField(
                                                                        context: context,
                                                                        theme: theme,
                                                                        hint: MessagesProvider.get('From'),
                                                                        textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18),
                                                                            fontWeight: FontWeight.w500) ?? tsS16W50016,
                                                                        controller: _fromDateController,
                                                                        maxLength: 20,
                                                                        dateTimeFormat: dateFormat,
                                                                        height: SizeConfig.getHeight(56),
                                                                        borderColor: theme.dividerColor ?? colorBlack3D,
                                                                        iconColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child: Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(8)),
                                                                  child: Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                    children: [
                                                                      Text(MessagesProvider.get('To'), style: theme.heading5?.copyWith(fontWeight: FontWeight.w400,fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
                                                                      SizedBox(height: SizeConfig.getHeight(8)),
                                                                      dateTextField(
                                                                        theme: theme,
                                                                        context: context,
                                                                        hint: MessagesProvider.get('To'),
                                                                        textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18),
                                                                            fontWeight: FontWeight.w500) ?? tsS16W50016,
                                                                        controller: _toDateController,
                                                                        maxLength: 20,
                                                                        dateTimeFormat: dateFormat,
                                                                        height: SizeConfig.getHeight(56),
                                                                        borderColor: theme.dividerColor ?? colorBlack3D,
                                                                        iconColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child: Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(8)),
                                                                  child: Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                    children: [
                                                                      Text(
                                                                          MessagesProvider.get('Customer Name'),
                                                                          style: theme.heading5?.copyWith(fontWeight: FontWeight.w400,fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
                                                                      SizedBox(height: SizeConfig.getHeight(8)),
                                                                      customTextField(
                                                                        context: context,
                                                                        hint: MessagesProvider.get('Enter'),
                                                                        borderColor: theme.dividerColor ?? colorBlack3D,
                                                                        fillColor: theme.primaryColor ?? colorWhite,
                                                                        suffixIcon: InkWell(
                                                                          onTap: () {
                                                                            showDialog(context: context,
                                                                                builder:
                                                                                    (_) {
                                                                                  return Padding(
                                                                                      padding: const EdgeInsets.only(
                                                                                          left: 16,
                                                                                          right: 16,
                                                                                          top: 12,
                                                                                          bottom: 60),
                                                                                      child: CustomerLookUpScreen(
                                                                                        isShowHeader:true,
                                                                                        isNameSelect: false,
                                                                                        onCustomerSelected: (customer) {
                                                                                          _selectedCustomerData = customer;
                                                                                          _customerNameController.text = customer?.firstName ?? '';
                                                                                        },
                                                                                      ));
                                                                                }, barrierDismissible: false);
                                                                          },
                                                                          child: Padding(
                                                                            padding: EdgeInsets.only(right: SizeConfig.getSize(12), top: SizeConfig.getSize(5), bottom: SizeConfig.getSize(5)),
                                                                            child: Container(
                                                                              height: SizeConfig.getHeight(24),
                                                                              width: SizeConfig.getWidth(24),
                                                                              decoration: BoxDecoration(
                                                                                  color: colorBlack,
                                                                                  borderRadius: BorderRadius.circular(3)),
                                                                              child: Center(
                                                                                  child: Image.asset(
                                                                                    'assets/customer_search.png',
                                                                                    height: SizeConfig.getHeight(20),
                                                                                    width: SizeConfig.getWidth(20),
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        textStyle: theme.heading5?.copyWith(
                                                                            fontSize: SizeConfig.getFontSize(18),
                                                                            fontWeight: FontWeight.w500) ?? tsS16W50016,
                                                                        controller: _customerNameController,
                                                                        keyboardType: TextInputType.name,
                                                                        height: SizeConfig.getHeight(56),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ]
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Padding(
                                                            padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(8)),
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Visibility(
                                                                      visible: state.settleScreenIndex == 2,
                                                                      child: Expanded(
                                                                        flex: 1,
                                                                        child: Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                        Text('Amount to Settle', style: theme.heading5?.copyWith(fontWeight: FontWeight.w400,fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
                                                                        SizedBox(height: SizeConfig.getHeight(8)),
                                                                        customTextField(
                                                                          context: context,
                                                                          hint: MessagesProvider.get('Enter'),
                                                                          borderColor: theme.dividerColor ?? colorBlack3D,
                                                                          fillColor: theme.primaryColor ?? colorWhite,
                                                                          inputFilters: [
                                                                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                                                          ],
                                                                          readOnly: true,
                                                                          onTap: () {
                                                                            _showNumberPadDialog(isSettleAmtMode: true);
                                                                          },
                                                                          textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS16W50016,
                                                                          controller: _settleAmtController,
                                                                          keyboardType: const TextInputType.numberWithOptions(decimal: false, signed: false),
                                                                          height: SizeConfig.getHeight(56),
                                                                        ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(width: state.settleScreenIndex == 2 ? SizeConfig.getSize(12) : SizeConfig.getSize(10)),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                        children: [
                                                                          Text('', style: tsS16W70016.copyWith(fontSize: SizeConfig.getFontSize(20))),
                                                                          SizedBox(height: SizeConfig.getHeight(8)),
                                                                          containerButton(
                                                                              text: MessagesProvider.get('Advanced Filters').toUpperCase(),
                                                                              textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18),
                                                                                  color: Colors.white) ?? tsS20W700FF,
                                                                              height: SizeConfig.getHeight(68),
                                                                              width: SizeConfig.getWidth(115),
                                                                              buttonColor: theme.button2InnerShadow1 ?? colorBlack,
                                                                              cornerRadius: 5,
                                                                              onTapped: () {
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                                showDialog(
                                                                                    context: context,
                                                                                    builder: (BuildContext context) {
                                                                                      return FeatureNotImplementedView(MessagesProvider.get('Advanced Filters'));
                                                                                    }, barrierDismissible: false);
                                                                              }),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Visibility(
                                                                        visible: state.settleScreenIndex != 2,
                                                                        child: const Expanded(
                                                                            flex: 1,
                                                                            child: SizedBox()
                                                                        )
                                                                    )
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Padding(
                                                            padding: EdgeInsets.only(  right: SizeConfig.getWidth(8)),
                                                            child: Column(
                                                              children: [
                                                                Text('', style: tsS16W70016.copyWith(fontSize: SizeConfig.getFontSize(20))),
                                                                SizedBox(height: SizeConfig.getHeight(8)),
                                                                containerButton(text: MessagesProvider.get('Clear').toUpperCase(),
                                                                    buttonColor: theme.footerBG1 ?? colorBlueF8,
                                                                    textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)) ?? tsS20W700FF,
                                                                    height: SizeConfig.getHeight(68),
                                                                    width: SizeConfig.getWidth(100),
                                                                    cornerRadius: 5,
                                                                    onTapped: () {
                                                                      var currentDateTime = DateTime.now();
                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                      _trxIdController.clear();
                                                                      _customerNameController.clear();
                                                                      _selectedPayMode.value = null;
                                                                      _fromDateController.text = DateTime(currentDateTime.year, currentDateTime.month, currentDateTime.day, 0, 0, 0).toString();
                                                                      _toDateController.text = DateTime(currentDateTime.year, currentDateTime.month, currentDateTime.day, 0, 0, 0).add(const Duration(days: 1)).toString();
                                                                      _cardNoController.clear();
                                                                      if (_filterNotifier.value) {
                                                                        /// for initiating filter form refresh
                                                                        _filterNotifier.value = false;
                                                                      } else {
                                                                        _filterNotifier.value = true;
                                                                      }
                                                                    }),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: SizeConfig.getHeight(2)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                           visible: !context.read<SettleScreenCubit>().state.showFilterSection,
                                           child: SizedBox(height: SizeConfig.getHeight(16)),
                                          )
                                        ],
                                      ),
                                      Positioned(
                                        top:10,
                                        right: 4,
                                        child: ElevatedButton.icon(
                                            icon: (context.read<SettleScreenCubit>().state.showFilterSection) ? Image.asset("assets/ic_up_double_arrow.png", color: Colors.white,) : Image.asset("assets/ic_down_arrow.png", color: Colors.white,),
                                            onPressed:(){
                                              if (state.showFilterSection) {
                                                context.read<SettleScreenCubit>().setFilterSectionStatus(false);
                                              } else {
                                                context.read<SettleScreenCubit>().setFilterSectionStatus(true);
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: Size.zero,
                                              padding:  const EdgeInsets.only(left : 12.0, right: 4.0,top : 8.0, bottom : 8.0),
                                              backgroundColor: Colors.black,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                                            ),
                                            label: Text("", style:theme.subtitle3?.copyWith(fontWeight: FontWeight.w500,color: theme.primaryColor),textAlign: TextAlign.center,)),
                                      ),
                                   ],
                                  ),
                                  SizedBox(height: SizeConfig.getHeight(24)),
                                  Expanded(child: Scrollbar(
                                    thumbVisibility: true,
                                    controller: _scrollController,
                                    child: ListView(
                                      shrinkWrap: true,
                                      controller: _scrollController,
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      children: [
                                        SizedBox(
                                          width: _isSideBarVisible() ? SizeConfig.getWidth(1200)
                                              : MediaQuery.of(context).size.width,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(24)),
                                                child: Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        if (state.settleScreenIndex == 0) {
                                                          if (state.authPaymentsSwitchStatus) {
                                                            context.read<SettleScreenCubit>().setAuthPaymentsSwitchStatus(false);
                                                          } else {
                                                            context.read<SettleScreenCubit>().setAuthPaymentsSwitchStatus(true);
                                                          }
                                                        } else if (state.settleScreenIndex == 1) {
                                                          if (state.tipSwitchStatus) {
                                                            context.read<SettleScreenCubit>().setTipSwitchStatus(false);
                                                          } else {
                                                            context.read<SettleScreenCubit>().setTipSwitchStatus(true);
                                                          }
                                                        } else {
                                                          if (state.editPaySwitchStatus) {
                                                            context.read<SettleScreenCubit>().setEditPaySwitchStatus(false);
                                                          } else {
                                                            context.read<SettleScreenCubit>().setEditPaySwitchStatus(true);
                                                          }
                                                        }
                                                      },
                                                      child: Container(
                                                        height: 26,
                                                        width: 26,
                                                        decoration:
                                                            BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(6)),
                                                          border: Border.all(width: 1, color: theme.secondaryColor ?? colorBlack),
                                                        ),
                                                        child: Center(
                                                          child: _getEditSwitchStatus(state.settleScreenIndex)
                                                              ? Image.asset("assets/ic_check.png", color: theme.secondaryColor)
                                                              : const SizedBox(),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: SizeConfig.getWidth(16)),
                                                    Text(MessagesProvider.get('Transaction ID'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016, maxLines: 1,
                                                        overflow: TextOverflow.ellipsis),
                                                    SizedBox(width: SizeConfig.getWidth(24)),
                                                    Text(MessagesProvider.get('Transaction Number'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016,
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis),
                                                    SizedBox(width: SizeConfig.getWidth(40)),
                                                    Text(MessagesProvider.get('Transaction Date'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016,
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis),
                                                    SizedBox(width: SizeConfig.getWidth(60)),
                                                    Text(MessagesProvider.get('Payment Mode'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016,
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis),
                                                    SizedBox(width: SizeConfig.getWidth(50)),
                                                    Text(MessagesProvider.get('Amount'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016,
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis),
                                                    SizedBox(width: SizeConfig.getWidth(100)),
                                                    Text(MessagesProvider.get('Tip'),
                                                        style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016,
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis),
                                                    SizedBox(width: SizeConfig.getWidth(95)),
                                                    Text(MessagesProvider.get('Reference'),
                                                        style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016,
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: SizeConfig.getHeight(12)),
                                              Flexible(child: Padding(padding: const EdgeInsets.only(right: 6),
                                                    child: _getSelectedSettlementWidget(state.selectedSettleMode ?? '', state.showFilterSection)),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                                  Column(
                                    children: [
                                      const Divider(thickness: 1),
                                      SizedBox(height: SizeConfig.getHeight(8)),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          containerButton(text: MessagesProvider.get('Cancel').toUpperCase(),
                                              textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)) ?? tsS16W70016,
                                              buttonColor: theme.footerBG1 ?? colorBlueF8,
                                              height: SizeConfig.getHeight(68),
                                              width: SizeConfig.getWidth(115),
                                              cornerRadius: 5,
                                              onTapped: () {
                                                FocusManager.instance.primaryFocus?.unfocus();
                                                Navigator.pop(context);
                                              }),
                                          SizedBox(width: SizeConfig.getWidth(12)),
                                          containerButton(
                                              text: _getActionBtnTitle(state.settleScreenIndex),
                                              textStyle: theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(18), color: Colors.white) ?? tsS16W70016,
                                              buttonColor: _getActionBtnColor(state.settleScreenIndex, theme),
                                              height: SizeConfig.getHeight(68),
                                              width: SizeConfig.getWidth(115),
                                              cornerRadius: 5,
                                              onTapped: () {
                                                FocusManager.instance.primaryFocus?.unfocus();
                                                if (state.settleScreenIndex == 0) {
                                                  final payments = state.authorizedPayments.where((element) => element.isSelected).toList();
                                                  if (payments.isEmpty) {
                                                    _notificationBar.showMessage(MessagesProvider.get('Please select a record to proceed'), theme.footerBG4 ?? colorBlueFE);
                                                    return;
                                                  }
                                                  _notificationBar.showMessage('', theme.primaryColor ?? colorWhite);
                                                  context.read<SettleScreenCubit>().settleAuthPayments(payments);
                                                } else if (state.settleScreenIndex == 1) {
                                                  final payments = state.settledPayments.where((element) => element.isSelected).toList();
                                                  if (payments.isEmpty) {
                                                    _notificationBar.showMessage(MessagesProvider.get('Please select a record to proceed'), theme.footerBG4 ?? colorBlueFE);
                                                    return;
                                                  }
                                                  _notificationBar.showMessage('', theme.primaryColor ?? colorWhite);
                                                  context.read<SettleScreenCubit>().addTip();
                                                } else {
                                                  final payments = state.editablePayments.where((element) => element.isSelected).toList();
                                                  final amtToSettle = double.parse(_settleAmtController.text.toString());
                                                  if (payments.isEmpty) {
                                                    _notificationBar.showMessage(MessagesProvider.get('Please select a record to proceed'), theme.footerBG4 ?? colorBlueFE);
                                                    return;
                                                  }
                                                  _notificationBar.showMessage('', theme.primaryColor ?? colorWhite);
                                                  showDialog(
                                                      context: context,
                                                      builder: (_) {
                                                        return BlocProvider<EditPaymentCubit>(
                                                            create: (ctx) => EditPaymentCubit(),
                                                            child: EditPaymentPopup(
                                                              paymentList: payments,
                                                              selectedPaymentMode: _selectedPayMode.value?.paymentModeId ?? -1,
                                                              amountToSettle: amtToSettle,
                                                            ));
                                                      }, barrierDismissible: false).then((value) {
                                                    final isEdited = value as bool?;
                                                    if (isEdited == true) {
                                                      _processSearchTransaction(state.selectedSettleMode!);
                                                    }
                                                  });
                                                }
                                              }),
                                        ],
                                      ),
                                      SizedBox(height: SizeConfig.getHeight(8)),
                                    ],
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
        ));
  }

  Widget _getSelectedSettlementWidget(String settlementMode, bool showFilterSection) {
    switch (settlementMode) {
      case 'Settle':
        return TrxListingScreen(
          list: context.read<SettleScreenCubit>().state.authorizedPayments,
          isExpanded: !showFilterSection,
          dateFormat: dateFormat,
          currency: currency,
          amountFmt: amountFmt,
        );
      case 'Adjust Tip':
        return TrxListingScreen(
          list: context.read<SettleScreenCubit>().state.settledPayments,
          isExpanded: !showFilterSection,
          dateFormat: dateFormat,
          currency: currency,
          amountFmt: amountFmt,
        );
      case 'Edit':
        return TrxListingScreen(
          list: context.read<SettleScreenCubit>().state.editablePayments,
          isExpanded: !showFilterSection,
          dateFormat: dateFormat,
          currency: currency,
          amountFmt: amountFmt,
        );
      default:
        return TrxListingScreen(
          list: const [],
          isExpanded: !showFilterSection,
          currency: currency,
          amountFmt: amountFmt,
        );
    }
  }

  void _showNumberPadDialog({isSettleAmtMode = false}) {
    var entry = 0;
    var decimalEntry = 0.0;
    try {
      if(isSettleAmtMode) {
        decimalEntry = double.parse(_settleAmtController.text);
      } else {
        entry = int.parse(_trxIdController.text);
      }
    } on Exception {
      entry = 0;
    }
    showDialog(
        context: context,
        barrierColor: const Color(0x01000000),
        barrierDismissible: true,
        builder: (_) {
          return NumberPad(
            initialOffset: Offset(SizeConfig.screenWidth / 2, SizeConfig.screenHeight / 10),
            isDecimalRequired: isSettleAmtMode == true,
            isInitialRequired: true,
            initialIntValue: entry,
            initialDecimalValue: decimalEntry,
            shouldReturnEmptySpace: true,
            title: null,
            onOkPressed: (value) {
              if(isSettleAmtMode) {
                if(value.toString().isEmpty) {
                  _settleAmtController.text = '0';
                } else {
                  _settleAmtController.text = value.toString();
                }
              } else {
                _trxIdController.text = value.toString();
              }
            },
          );
        });
  }

  String formatAmount(double amount) {
    final format = NumberFormat(amountFmt);
    return format.format(amount);
  }

  Future<void> _initPaymentEntries() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContextDTO!);

    if (mounted) {
      context.read<SettleScreenCubit>().setSettleScreenIndex(widget.initialPage, selectedMode: widget.initialPage == 1 ? 'Adjust Tip': 'Settle');

      if(widget.initialPage == 0){
        final list = widget.transactionData?.transactionPaymentDTOList;
        final authPayments = <TransactionPaymentDTO>[];
        if (list != null) {
          list.forEach((element) {
            if( element.paymentStatus == 'AUTHORIZED') {
              authPayments.add(element.copyWith(isSelected: true));
            }
          });
        }
        context.read<SettleScreenCubit>().setAuthPayments(authPayments);
        if(widget.transactionData == null) {
          _searchAuthTransactions();
        }
      }else{
        final list = widget.transactionData?.transactionPaymentDTOList;
        final settledPayments = <TransactionPaymentDTO>[];
        if (list != null) {
          await Future.forEach(list, (element) async {
            final payMode =
            await masterDataBL.getPaymentModeById(element.paymentModeId);
            final isAllowed = element.paymentStatus == 'SETTLED' &&
                (payMode?.enableTipAllocation ?? false);
            if (isAllowed) {
              settledPayments.add(element.copyWith(isSelected: true));
            }
          });
        }
        for (int i = 0; i < settledPayments.length; i++) {
          settledPayments[i] = settledPayments[i].copyWith(
              transactionNumber: widget.transactionData?.transactionNumber);
        }
        if (settledPayments.isNotEmpty) {
          settledPayments[settledPayments.length - 1] =
              settledPayments[settledPayments.length - 1]
                  .copyWith(isSelected: true);
        }
        if (mounted) {
          context.read<SettleScreenCubit>().setSettledPayments(settledPayments);
        }
      }


    }


  }

  void _searchAuthTransactions() {
    final cubit = context.read<SettleScreenCubit>();
    int trxId = -1;
    if (_trxIdController.text.isNotEmpty) {
      trxId = int.parse(_trxIdController.text);
    }
    final startDate = _getDate(_fromDateController.text);
    final endDate = _getDate(_toDateController.text);
    final transactionArgs = TransactionSearchArguments(
      transactionId: trxId,
      fromDate: startDate,
      toDate: endDate,
      paymentStatus: 'AUTHORIZED',
      paymentModeId: _selectedPayMode.value?.paymentModeId,
    );
    _notificationBar.showMessage('',
        Theme.of(context).extension<SemnoxTheme>()!.footerBG2 ?? colorWhite);
    cubit.searchTransaction(transactionArgs);
  }

  void _processSearchTransaction(String screenName) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    final cubit = context.read<SettleScreenCubit>();
    int trxId = -1;
    if (_trxIdController.text.isNotEmpty) {
      trxId = int.parse(_trxIdController.text);
    }
    final startDate = _getDate(_fromDateController.text);
    final endDate = _getDate(_toDateController.text);
    final transactionArgs = TransactionSearchArguments(
        transactionId: trxId,
        fromDate: startDate,
        toDate: endDate,
        paymentStatus: screenName == 'Settle' ? 'AUTHORIZED' : 'SETTLED',
        paymentModeId: _selectedPayMode.value?.paymentModeId,
        transactionStatus: screenName == 'Edit' ? 'CLOSED' : null);
    if (screenName == 'Edit') {
      if (_selectedPayMode.value == null) {
        _notificationBar.showMessage(
            MessagesProvider.get('Please select Payment Mode to proceed.'),
            theme.footerBG4 ?? colorBlueFE);
        return;
      }
    }
    _notificationBar.showMessage('', theme.footerBG2 ?? colorWhite);
    cubit.searchTransaction(transactionArgs);
  }

  bool _isSideBarVisible() =>
      context.read<SettleScreenCubit>().state.showSideBar;

  Future<void> _initPayModes() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    final payModes = await masterDataBL.getPaymentModes();
    dateFormat = await masterDataBL.getDefaultValuesByName(
        defaultValueName: "DATE_FORMAT");
    if (dateFormat != null) {
      dateFormat = '$dateFormat hh:mm a';
    }
    if (mounted) {

      if (payModes != null) {
        _payModesList.addAll(payModes);
        context.read<SettleScreenCubit>().setPaymentModes(payModes);
      }
    }
  }

  String _getDate(String date) {
    const format = 'yyyy-MM-dd HH:mm:ss';
    final dateTime = DateFormat(format).format(DateTime.parse(date));
    return dateTime;
  }

  String _getActionBtnTitle(int settleScreenIndex) {
    switch (settleScreenIndex) {
      case 0:
        return MessagesProvider.get('Settle').toUpperCase();
      case 1:
        return MessagesProvider.get('Tip Adjust').toUpperCase();
      case 2:
        return MessagesProvider.get('Edit').toUpperCase();
      default:
        return MessagesProvider.get('Tip Adjust').toUpperCase();
    }
  }

  Color _getActionBtnColor(int settleScreenIndex, SemnoxTheme theme) {
    switch (settleScreenIndex) {
      case 0:
        return (settlePaymentAccessDTO?.isTaskEnabled ?? false) ? (theme.button2InnerShadow1 ?? colorBlack) : (theme.button2InnerShadow1?.withOpacity(0.5) ?? colorBlack.withOpacity(0.5));
      case 1:
        return (tipAdjustAccessDTO?.isTaskEnabled ?? false) ? (theme.button2InnerShadow1 ?? colorBlack) : (theme.button2InnerShadow1?.withOpacity(0.5) ?? colorBlack.withOpacity(0.5));
      case 2:
        return (editPaymentAccessDTO?.isTaskEnabled ?? false) ? (theme.button2InnerShadow1 ?? colorBlack) : (theme.button2InnerShadow1?.withOpacity(0.5) ?? colorBlack.withOpacity(0.5));
      default:
        return theme.button2InnerShadow1 ?? colorBlack;
    }
  }

  bool _getEditSwitchStatus(int settleScreenIndex) {
    switch (settleScreenIndex) {
      case 0:
        return context.read<SettleScreenCubit>().state.authPaymentsSwitchStatus;
      case 1:
        return context.read<SettleScreenCubit>().state.tipSwitchStatus;
      case 2:
        return context.read<SettleScreenCubit>().state.editPaySwitchStatus;
      default:
        return false;
    }
  }

  void _setSettleModes() {
    final list = ['Settle', 'Adjust Tip', 'Edit'];
    _settleModesNotifier.value = list;
    context.read<SettleScreenCubit>().updateGlobalSettleModes(list);
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
      if (mangerDto.formName.toLowerCase() == 'Settle Payment'.toLowerCase()) {
        final settleTasks = paymentTasks.where((element) => element.taskTypeName?.toLowerCase() == 'Settle Payment'.toLowerCase()).toList();
        if(settleTasks.isNotEmpty) {
          settlePaymentAccessDTO = PaymentAccessControlDTO(
              shouldDisplayTask: settleTasks.first.displayInPos == 'Y',
              managerApprovalRequired: settleTasks.first.requiresManagerApproval == 'Y',
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
      if (mangerDto.formName.toLowerCase() == 'Edit Payment'.toLowerCase()) {
        final editPaymentTasks = paymentTasks.where((element) => element.taskTypeName?.toLowerCase() == 'Edit Payment'.toLowerCase()).toList();
        if(editPaymentTasks.isNotEmpty) {
          editPaymentAccessDTO = PaymentAccessControlDTO(
              shouldDisplayTask: editPaymentTasks.first.displayInPos == 'Y',
              managerApprovalRequired: editPaymentTasks.first.requiresManagerApproval == 'Y',
              isTaskEnabled: true);
        }
      }
    }
    if(settlePaymentAccessDTO == null) {
      final settleTasks = paymentTasks.where((element) => element.taskTypeName?.toLowerCase() == 'Settle Payment'.toLowerCase()).toList();
      if(settleTasks.isNotEmpty) {
        settlePaymentAccessDTO = PaymentAccessControlDTO(
            shouldDisplayTask: settleTasks.first.displayInPos == 'Y',
            managerApprovalRequired: settleTasks.first.requiresManagerApproval == 'Y',
            isTaskEnabled: false);
      } else {
        settlePaymentAccessDTO = PaymentAccessControlDTO(
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
    if(editPaymentAccessDTO == null) {
      final editPaymentTasks = paymentTasks.where((element) => element.taskTypeName?.toLowerCase() == 'Edit Payment'.toLowerCase()).toList();
      if(editPaymentTasks.isNotEmpty) {
        editPaymentAccessDTO = PaymentAccessControlDTO(
            shouldDisplayTask: editPaymentTasks.first.displayInPos == 'Y',
            managerApprovalRequired: editPaymentTasks.first.requiresManagerApproval == 'Y',
            isTaskEnabled: false);
      } else {
        editPaymentAccessDTO = PaymentAccessControlDTO(
            shouldDisplayTask: true,
            managerApprovalRequired: false,
            isTaskEnabled: false);
      }
    }
    setState(() {});
  }
}
