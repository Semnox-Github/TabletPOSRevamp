import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/user_role_container/user_role_container_dto.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:payment_data/models/employee_tip/employee_tip_data.dart';
import 'package:payment_ui/cubits/payment_settlement/tip_split/tip_split_cubit.dart';
import 'package:payment_ui/cubits/payment_settlement/tip_split/tip_split_state.dart';
import 'package:payment_ui/screens/payment_settlement/widgets/employee_tip_widget.dart';
import 'package:payment_ui/screens/payment_settlement/widgets/tip_numberpad.dart';
import 'package:payment_ui/screens/payment_summary/widgets/payment_top_tile.dart';
import 'package:payment_ui/utils/colors.dart';
import 'package:payment_ui/utils/common_widgets.dart';
import 'package:payment_ui/utils/extensions.dart';
import 'package:payment_ui/utils/styles.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/models/create_transaction/transaction_data.dart';
import 'package:transaction_data/models/create_transaction/transaction_payment_dto.dart';
import 'package:transaction_data/models/user_container/user_container_dto.dart';
import 'package:widgets_library/loader_dialog.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:widgets_library/utils/keyboard_hider_widget.dart';

class TipSplitScreen extends StatefulWidget {
  final TransactionData? trxData;
  final TransactionPaymentDTO paymentDTO;
  final double? tipReqAmt;
  final int currentIndex;

  const TipSplitScreen({
    Key? key,
    required this.trxData,
    required this.paymentDTO,
    required this.currentIndex,
    required this.tipReqAmt,
  }) : super(key: key);

  @override
  State<TipSplitScreen> createState() => _TipSplitScreenState();
}

class _TipSplitScreenState extends State<TipSplitScreen> {

  final _userRolesList = <DropdownMenuItem<UserRoleContainerDTO>>[];
  final _usersList = <DropdownMenuItem<UserContainerDto>>[];
  bool _isFirstTimeUserRoleSelected = false;
  String currency = '';
  String amountFmt = '#,##0.00';
  UserRoleContainerDTO? _selectedUserRole;
  UserContainerDto? _selectedUser;
  late NotificationBar _notificationBar;
  final _scrollController = ScrollController();

  final _percentageTextController = TextEditingController();
  final _tipAmtController = TextEditingController();

  @override
  void initState() {
    _notificationBar = NotificationBar(showHideSideBar: false);
    Future.microtask(() => _init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SizeConfig.init(context);
    return KeyboardHider(
      child: BlocConsumer<TipSplitCubit, TipSplitState>(
        listener: (ctx, state) {
          if(state.loadingStatus == 1) {
            Future.microtask(() => showLoaderDialog(context, state.loadingMessage));
          }
          if(state.loadingStatus == 0) {
            Future.microtask(() => context.read<TipSplitCubit>().setLoadingStatus(status: -1));
            Future.microtask(() => hideLoaderDialog(context));
          }

          if(state.validationError != null) {
            _notificationBar.showMessage(state.validationError ?? '',  colorYellow91); //todo c
            context.read<TipSplitCubit>().setValidationError(null);
          } else if (state.apiError != null) {
            Future.microtask(() => showErrorDialog(
                context, MessagesProvider.get("Error"), state.apiError ?? '',
              theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(30)) ?? tsS16W70016,
              theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(23)) ?? tsS16W70016,));
            context.read<TipSplitCubit>().setApiError(null);
          } else if (state.notificationMessage != null) {
            _notificationBar.showMessage(state.notificationMessage ?? '',  theme.footerBG4 ?? colorBlueFE);
            context.read<TipSplitCubit>().setNotificationMessage(null);
          }

          _processUserRoleList(state.userRoles);
          if(_selectedUserRole != null) {
            _processUserList(state.users);
          }
        },
        builder: (ctx, state) {
          return LayoutBuilder(
            builder: (context, _) => Material(
              color: Colors.transparent,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                resizeToAvoidBottomInset: false,
                body: Column(
                  children: [
                    Expanded(child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: theme.backGroundColor ?? colorWhite
                      ),
                      margin: EdgeInsets.symmetric(horizontal: SizeConfig.getSize(16), vertical: SizeConfig.getSize(16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap:(){
                                  Navigator.of(context).pop();
                                  },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  height: SizeConfig.getSize(65),
                                  decoration: BoxDecoration(
                                    color: theme.button2InnerShadow1,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(SizeConfig.getSize(8)),
                                      bottomRight: Radius.circular(SizeConfig.getSize(8)),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_back_ios,
                                          color: Colors.white, size: SizeConfig.getSize(30)),
                                      const SizedBox(width: 5,),
                                      Center(
                                        child: Text(
                                          'Tip Amount',
                                          style: theme.headingLight4?.copyWith(
                                              color: Colors.white,
                                              fontSize: SizeConfig.getFontSize(26)),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: SizeConfig.getWidth(16)),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: theme.tableRow1 ?? colorBlueFA,
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(6),
                                        topRight: Radius.circular(6),
                                      )),
                                  height: SizeConfig.blockSizeVertical * 9,
                                  width: SizeConfig.blockSizeHorizontal * 68,
                                  child:  Row(
                                    children: [
                                      SizedBox(width: SizeConfig.getWidth(6)),
                                      PaymentTopTile(
                                          title: MessagesProvider.get('Card Number'),
                                          isLargeTile: widget.paymentDTO.creditCardNumber?.isNotEmpty == true,
                                          amount: widget.paymentDTO.creditCardNumber?.isNotEmpty == true?
                                          'XXXXXXXXXXXX${widget.paymentDTO.creditCardNumber}' : ''),
                                      SizedBox(width: SizeConfig.getWidth(8)),
                                      PaymentTopTile(
                                          title: MessagesProvider.get('Trx Amount'),
                                          amount: '$currency ${formatAmount(_getTotalAmount())}'),
                                      SizedBox(width: SizeConfig.getWidth(8)),
                                      PaymentTopTile(
                                          title: MessagesProvider.get('Tips'),
                                          amount: '$currency ${formatAmount(_getTotalTipAmount())}'),
                                      SizedBox(width: SizeConfig.getWidth(8)),
                                      PaymentTopTile(
                                        title: MessagesProvider.get('Transaction Total'),
                                        amount: '$currency ${formatAmount(_getNetAmount())}',
                                        isLargeTile: true,
                                      ),
                                      SizedBox(width: SizeConfig.getWidth(8)),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: SizeConfig.getHeight(8)),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: SizeConfig.getSize(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text('', style: tsS14W50016),
                                    SizedBox(height: SizeConfig.getHeight(8)),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            _selectedUserRole = null;
                                            _selectedUser = null;
                                            _userRolesList.clear();
                                            _usersList.clear();
                                            await context.read<TipSplitCubit>().toggleClockedInStatus();
                                          },
                                          child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                borderRadius: const BorderRadius.all(Radius.circular(6)),
                                                border: Border.all(width: 1, color: theme.secondaryColor ?? colorBlack),
                                              ),
                                              child: state.isClockedInUser
                                                  ? Center(
                                                child: Image.asset("assets/ic_check.png", color: theme.secondaryColor),
                                              )
                                                  : const SizedBox()),
                                        ),
                                        SizedBox(width: SizeConfig.getWidth(8)),
                                        Text(MessagesProvider.get('Show Clocked In Users'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w500) ?? tsS14W50016),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(width: SizeConfig.getWidth(21)),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(MessagesProvider.get('User Role'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w500) ?? tsS14W50016),
                                      SizedBox(height: SizeConfig.getHeight(8)),
                                      customDropDown(
                                        hint: MessagesProvider.get('Select'),
                                        items: _userRolesList,
                                        value: _selectedUserRole,
                                        onChange: (value) {
                                          _selectedUserRole = value;
                                          _isFirstTimeUserRoleSelected = true;
                                          context.read<TipSplitCubit>().filterUserByRole(_selectedUserRole);
                                        },
                                        hintTextStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ??  tsS16W50016,
                                        textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ??  tsS16W50016,
                                        height: SizeConfig.getHeight(56),
                                        borderColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                                        iconColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: SizeConfig.getWidth(12)),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(MessagesProvider.get('Staff'), style:theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w500)),
                                      SizedBox(height: SizeConfig.getHeight(8)),
                                      customDropDown(
                                        hint: MessagesProvider.get('Select'),
                                        items: _usersList,
                                        value: _selectedUser,
                                        onChange: (value){
                                          _selectedUser = value;
                                        },
                                        hintTextStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ??  tsS16W50016,
                                        textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ??  tsS16W50016,
                                        height: SizeConfig.getHeight(56),
                                        borderColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                                        iconColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: SizeConfig.getWidth(12)),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('%', style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w500)),
                                      SizedBox(height: SizeConfig.getHeight(8)),
                                      SizedBox(
                                        height: SizeConfig.getHeight(56),
                                        child: amountTextField(controller: _percentageTextController, onTap: () {
                                          var amount = 0;
                                          try {
                                            amount = int.parse(_percentageTextController.text);
                                          } on Exception {
                                            amount = 0;
                                          }
                                          showDialog(
                                              context: context,
                                              barrierColor: const Color(0x01000000),
                                              builder: (_) {
                                                return NumberPad(
                                                  initialOffset: Offset(SizeConfig.screenWidth / 2, SizeConfig.screenHeight / 10),
                                                  isDecimalRequired: false,
                                                  isInitialRequired: true,
                                                  initialIntValue: amount,
                                                  title: null,
                                                  onOkPressed: (value)  {
                                                    final amt = value as int;
                                                    _percentageTextController.text = amt.toString();
                                                  },
                                                );
                                              });
                                        }, borderColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                                            textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w500) ?? tsS14W50016),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: SizeConfig.getWidth(12)),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Text('', style: tsS14W50016),
                                      SizedBox(height: SizeConfig.getHeight(10)),
                                      containerButton(
                                          text: MessagesProvider.get('Add').toUpperCase(),
                                          textStyle: tsS20W700FF.copyWith(fontSize: SizeConfig.getFontSize(20), color: Colors.white),
                                          height: SizeConfig.getHeight(68),
                                          width: SizeConfig.getWidth(100),
                                          cornerRadius: 5,
                                          onTapped: () {
                                            FocusManager.instance.primaryFocus?.unfocus();
                                            final tipSplitCubit = context.read<TipSplitCubit>();
                                            final percentage = int.parse(_percentageTextController.text.toString());
                                            if(percentage == 0) {
                                              tipSplitCubit.setNotificationMessage(MessagesProvider.get('Please enter Tip Percentage.'));
                                              return;
                                            }
                                            if(_selectedUser == null) {
                                              tipSplitCubit.setNotificationMessage(MessagesProvider.get('Please select a Staff to proceed.'));
                                              return;
                                            }
                                            var totalPC = 0;
                                            final list = tipSplitCubit.state.employeeTips.where((element) => element.shouldRemoveFromBackend == false).toList();
                                            for (var element in list) {
                                              totalPC += (element.splitByPercentage ?? 0);
                                            }
                                            totalPC += percentage;
                                            if(totalPC > 100) {
                                              tipSplitCubit.setNotificationMessage(MessagesProvider.get('Tip Percentage Sum must be less than or equal to 100'));
                                              return;
                                            }
                                            _notificationBar.showMessage('', theme.footerBG2 ?? colorWhite);
                                            tipSplitCubit.addEmployeeTip(_selectedUserRole, _selectedUser, percentage);
                                          }, buttonColor: theme.button2InnerShadow1 ?? colorBlack
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: SizeConfig.getHeight(8)),
                          const Divider(),
                          SizedBox(height: SizeConfig.getHeight(8)),
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.only(left: SizeConfig.getWidth(16)),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: SizeConfig.getHeight(8)),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  final tipSplitCubit = context.read<TipSplitCubit>();
                                                  tipSplitCubit.removeAllTips();
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
                                              Text(MessagesProvider.get('Staff'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(22)) ?? tsS16W70016),
                                              SizedBox(width: SizeConfig.getWidth(48)),
                                              Text(MessagesProvider.get('Percentage'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(22)) ?? tsS16W70016),
                                              SizedBox(width: SizeConfig.getWidth(32)),
                                              Text(MessagesProvider.get('Tip'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(22)) ?? tsS16W70016),
                                              SizedBox(width: SizeConfig.getWidth(32)),
                                            ],
                                          ),
                                          Flexible(
                                            child: Scroller(
                                              controller: _scrollController,
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  controller: _scrollController,
                                                  physics: const BouncingScrollPhysics(),
                                                  itemCount: state.employeeTips.where((element) => element.shouldRemoveFromBackend == false).toList().length,
                                                  itemBuilder: (context, index) {
                                                    final list = state.employeeTips.where((element) => element.shouldRemoveFromBackend == false).toList();
                                                    return EmployeeTipWidget(
                                                      model: list[index],
                                                      currentIndex: index,
                                                      currency: currency,
                                                      amountFmt: amountFmt,
                                                    );
                                                  }),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: SizeConfig.blockSizeHorizontal * 28,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          SizedBox(height: SizeConfig.getHeight(8)),
                                          Padding(
                                            padding: EdgeInsets.only(left: SizeConfig.getSize(8)),
                                              child: Text(MessagesProvider.get('Tip Amount'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(22)) ?? tsS16W70016)),
                                          SizedBox(height: SizeConfig.getHeight(8)),
                                          Container(
                                            height: SizeConfig.getSize(70),
                                            margin: EdgeInsets.only(left: SizeConfig.getSize(8)),
                                            padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(16)),
                                            decoration: BoxDecoration(color: theme.customerDetailBG ?? colorBlack, borderRadius: BorderRadius.circular(8)),
                                            child: Center(
                                              child: TextFormField(
                                                controller: _tipAmtController,
                                                enabled: false,
                                                style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(22), fontWeight: FontWeight.w600),
                                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                                validator: (value) {
                                                  return null;
                                                },
                                                decoration: const InputDecoration(
                                                  border: InputBorder.none,
                                                  counterText: '',
                                                  contentPadding: EdgeInsets.only(bottom:10)
                                                ),
                                                maxLength: 15,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter.deny(
                                                      RegExp(r'\s')),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: SizeConfig.getWidth(24))
                                  ],
                                )
                            ),
                          ),
                          SizedBox(height: SizeConfig.getHeight(12)),
                          SizedBox(
                            width: SizeConfig.getWidth(308),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                containerButton(
                                    text: MessagesProvider.get('Cancel'),
                                    textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS20W70016,
                                    buttonColor: theme.footerBG1 ?? colorBlueF8,
                                    height: SizeConfig.getHeight(68),
                                    width: SizeConfig.getWidth(140),
                                    cornerRadius: 5,
                                    onTapped: () {
                                      FocusManager.instance.primaryFocus?.unfocus();
                                      Navigator.pop(context);
                                    }
                                ),
                                SizedBox(width: SizeConfig.getSize(24)),
                                containerButton(
                                    text: MessagesProvider.get('OK'),
                                    textStyle: theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(20), color: Colors.white) ?? tsS20W700FF,
                                    height: SizeConfig.getHeight(68),
                                    width: SizeConfig.getWidth(140),
                                    cornerRadius: 5,
                                    onTapped: () {
                                      FocusManager.instance.primaryFocus?.unfocus();
                                      _processTipAndPop();
                                    }, buttonColor: theme.button2InnerShadow1 ?? colorBlack
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: SizeConfig.getHeight(8)),
                        ],
                      ),
                    )),
                    Container(
                      child: _notificationBar,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _init() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    currency = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CURRENCY_SYMBOL') ?? '';
    amountFmt = await masterDataBL.getDefaultValuesByName(defaultValueName: 'AMOUNT_FORMAT') ?? '#,##0.00';
    _percentageTextController.text = '0';
    final tipSplitCubit = context.read<TipSplitCubit>();
    _tipAmtController.text = '${formatAmount((widget.tipReqAmt ?? widget.paymentDTO.tipAmount))} ';
    tipSplitCubit.updateTipAmount(widget.tipReqAmt ?? widget.paymentDTO.tipAmount);
    await tipSplitCubit.fetchAllList();
    await tipSplitCubit.fetchAppliedTipList(widget.paymentDTO, widget.tipReqAmt);
  }

  String formatAmount(double amount) {
    final format = NumberFormat(amountFmt);
    return format.format(amount);
  }

  void _processUserList(List<UserContainerDto> users) {
    _usersList.clear();
    for (int i = 0; i < users.length; i++) {
      final item = users[i];
      _usersList.add(DropdownMenuItem(
          value: item,
          child: Text(item.userName ?? '', style: Theme.of(context).extension<SemnoxTheme>()!.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS16W50016)));
    }
    if(_isFirstTimeUserRoleSelected) {
      _selectedUser = users.isNotEmpty ? users.first : null;
    }
  }

  void _processUserRoleList(List<UserRoleContainerDTO> userRoles) {
    _userRolesList.clear();
    for (int i = 0; i < userRoles.length; i++) {
      final item = userRoles[i];
      _userRolesList.add(DropdownMenuItem(
          value: item,
          child: Text(item.role ?? '', style: Theme.of(context).extension<SemnoxTheme>()!.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS16W50016)));
    }
  }

  double _getNetAmount() {
    return (widget.trxData?.transactionNetAmount ?? 0);
  }

  double _getTotalAmount() {
    return (widget.trxData?.transactionAmount ?? 0);
  }

  double _getTotalTipAmount() {
    return widget.tipReqAmt ?? widget.paymentDTO.tipAmount;
  }

  void _processTipAndPop() {
    FocusManager.instance.primaryFocus?.unfocus();
    final tipSplitCubit = context.read<TipSplitCubit>();
    final list = tipSplitCubit.state.employeeTips.where((element) => element.shouldRemoveFromBackend == false);
    if(list.isNotEmpty) {
      var totalPC = 0;
      for (var element in list) {
        totalPC += (element.splitByPercentage ?? 0);
      }
      if(totalPC != 100) {
        tipSplitCubit.setValidationError(MessagesProvider.get('Tip Percentage should be equal to 100'));
        return;
      }
      final tipList = tipSplitCubit.state.employeeTips;
      final amount = tipSplitCubit.state.enteredAmount;
      final returnData = TipSplitReturnData(widget.currentIndex, tipList, amount);
      Navigator.pop(context, returnData);
    } else {
      final tipList = tipSplitCubit.state.employeeTips;
      final amount = tipSplitCubit.state.enteredAmount;
      final returnData = TipSplitReturnData(widget.currentIndex, tipList, amount);
      Navigator.pop(context, returnData);
    }
  }

}

class TipSplitReturnData {
  int currIndex;
  List<EmployeeTipData> tipSplits;
  double tipAmount;

  TipSplitReturnData(this.currIndex, this.tipSplits, this.tipAmount);
}
