import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/payment_modes_container/payment_mode_container_dto.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:payment_data/models/request/ui_argument.dart';
import 'package:payment_ui/cubits/payment_settlement/edit_payment/edit_payment_cubit.dart';
import 'package:payment_ui/cubits/payment_settlement/edit_payment/edit_payment_state.dart';
import 'package:payment_ui/screens/payment_settlement/widgets/editable_payment_widget.dart';
import 'package:payment_ui/screens/payment_summary/widgets/payment_top_tile.dart';
import 'package:payment_ui/utils/colors.dart';
import 'package:payment_ui/utils/common_widgets.dart';
import 'package:payment_ui/utils/extensions.dart';
import 'package:payment_ui/utils/styles.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/models/create_transaction/transaction_payment_dto.dart';
import 'package:widgets_library/loader_dialog.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:widgets_library/utils/keyboard_hider_widget.dart';

class EditPaymentPopup extends StatefulWidget {

  final List<TransactionPaymentDTO> paymentList;
  final int selectedPaymentMode;
  final double amountToSettle;
  
  const EditPaymentPopup({
    Key? key,
    required this.paymentList,
    required this.selectedPaymentMode,
    required this.amountToSettle
  }) : super(key: key);

  @override
  State<EditPaymentPopup> createState() => _EditPaymentPopupState();
}

class _EditPaymentPopupState extends State<EditPaymentPopup> {

  final _payModesList = <DropdownMenuItem<PaymentModeContainerDTO>>[];
  late NotificationBar _notificationBar;
  final _scrollController = ScrollController();
  final _rightScrollController = ScrollController();
  final _selectedPayMode = ValueNotifier<PaymentModeContainerDTO?>(null);
  final _ccNameController = TextEditingController();
  final _nameOnCCController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _authorizationController = TextEditingController();
  final _referenceController = TextEditingController();
  String? dateFormat;
  bool _isCardMode = false;
  double balance = 0;
  String currency = '';
  String amountFmt = '#,##0.00';

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
      child: BlocConsumer<EditPaymentCubit, EditPaymentState>(
        listener: (ctx, state) {
          if(state.loadingStatus == 1) {
            Future.microtask(() => showLoaderDialog(context, state.loadingMessage));
          }
          if(state.loadingStatus == 0) {
            Future.microtask(() => context.read<EditPaymentCubit>().setLoadingStatus(status: -1));
            Future.microtask(() {
              hideLoaderDialog(context);
              if(state.isEditCompleted) {
                showGenericDialog(
                    context,() {
                  Navigator.pop(context, true);
                }, MessagesProvider.get('Message'), MessagesProvider.get('Payment details have been updated'), isDismissible: false);
                context.read<EditPaymentCubit>().clearEditCompleteStatus();
              }
            });
            if (state.apiError != null) {
              Future.microtask(() {
                showGenericDialog(
                    context,() {
                }, MessagesProvider.get('Message'), state.apiError ?? '',);
              });
            }
          }

          if(state.validationError != null) {
            Future.microtask(() {
              _notificationBar.showMessage(state.validationError ?? '',  colorYellow91); //todo c
              context.read<EditPaymentCubit>().setValidationError(null);
            });
          }
          if (state.notificationMessage != null) {
            Future.microtask(() {
              _notificationBar.showMessage(state.notificationMessage ?? '',  theme.footerBG4 ?? colorBlueFE);
              context.read<EditPaymentCubit>().setNotificationMessage(null);
            });
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: SizeConfig.blockSizeHorizontal * 26,
                                height: SizeConfig.blockSizeVertical * 9,
                                child: AppBar(
                                  title: Text(MessagesProvider.get('Edit Payments').toUpperCase(), style: theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(26), color: Colors.white) ?? tsS20W700FF),
                                  titleSpacing: 0,
                                  toolbarHeight: 60.0,
                                  backgroundColor: theme.button2InnerShadow1 ?? colorBlack,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topLeft: Radius.circular(6),
                                    ),),
                                  leading: IconButton(
                                    icon: Image.asset('assets/back_arrow_white.png'),
                                    iconSize: 20.0,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
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
                                          isLargeTile: true,
                                          title: MessagesProvider.get('Unmatched Balance'),
                                          amount: balance.formatToDC()),
                                      SizedBox(width: SizeConfig.getWidth(8)),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: SizeConfig.getHeight(12)),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: SizeConfig.getWidth(16)),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: SizeConfig.getWidth(10)),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      if(state.editSwitchStatus) {
                                                        context.read<EditPaymentCubit>().setEditSwitchStatus(false);
                                                      } else {
                                                        context.read<EditPaymentCubit>().setEditSwitchStatus(true);
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
                                                        child: state.editSwitchStatus ? Image.asset("assets/ic_check.png", color: theme.secondaryColor) : const SizedBox(),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: SizeConfig.getWidth(16)),
                                                  Text(MessagesProvider.get('Transaction ID'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)) ?? tsS16W70016,
                                                      maxLines: 1, overflow: TextOverflow.ellipsis),
                                                  SizedBox(width: SizeConfig.getWidth(24)),
                                                  Text(MessagesProvider.get('Payment Date'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)) ?? tsS16W70016,
                                                      maxLines: 1, overflow: TextOverflow.ellipsis),
                                                  SizedBox(width: SizeConfig.getWidth(24)),
                                                  Text(MessagesProvider.get('Payment Mode'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)) ?? tsS16W70016,
                                                      maxLines: 1, overflow: TextOverflow.ellipsis),
                                                  SizedBox(width: SizeConfig.getWidth(24)),
                                                  Text(MessagesProvider.get('Amount'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)) ?? tsS16W70016,
                                                      maxLines: 1, overflow: TextOverflow.ellipsis),
                                                  SizedBox(width: SizeConfig.getWidth(50)),
                                                  Text(MessagesProvider.get('Tip'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)) ?? tsS16W70016,
                                                      maxLines: 1, overflow: TextOverflow.ellipsis),
                                                ],
                                              )),
                                              Expanded(
                                                flex: 2,
                                                child: Row(
                                                children: [
                                                  Text(MessagesProvider.get('Compatible Payment Mode'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS16W70016,
                                                      maxLines: 1, overflow: TextOverflow.ellipsis),
                                                ],
                                              ))
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: SizeConfig.getHeight(12)),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Flexible(
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Padding(
                                                          padding: const EdgeInsets.only(right: 8),
                                                          child: Scroller(
                                                            controller: _scrollController,
                                                            child: ListView.builder(
                                                                shrinkWrap: true,
                                                                scrollDirection: Axis.vertical,
                                                                controller: _scrollController,
                                                                physics: const BouncingScrollPhysics(),
                                                                itemCount: state.editablePayments.length,
                                                                itemBuilder: (context, index) {
                                                                  return EditablePaymentWidget(
                                                                    item: state.editablePayments[index],
                                                                    currentIndex: index,
                                                                    dateFormat: dateFormat,
                                                                    currency: currency,
                                                                    amountFmt: amountFmt,
                                                                  );
                                                                }),
                                                          )),),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(right: 8),
                                                          child: Scroller(
                                                            controller: _rightScrollController,
                                                            child: ListView(
                                                              shrinkWrap: true,
                                                              scrollDirection: Axis.vertical,
                                                              controller: _rightScrollController,
                                                              padding: const EdgeInsets.only(right: 32),
                                                              children: [
                                                                customDropDown(
                                                                  hint: MessagesProvider.get('Select'),
                                                                  items: _payModesList,
                                                                  value: _selectedPayMode.value,
                                                                  onChange: (value){
                                                                    _selectedPayMode.value = value;
                                                                    if(_selectedPayMode.value != null) {
                                                                      _isCardMode = _selectedPayMode.value!.isDebitCard || _selectedPayMode.value!.isCreditCard;
                                                                    }
                                                                  },
                                                                  hintTextStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500, color: Colors.grey) ??  tsS16W50016,
                                                                  textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ??  tsS16W50016,
                                                                  height: SizeConfig.getHeight(50),
                                                                  borderColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                                                                  iconColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                                                                ),
                                                                SizedBox(height: SizeConfig.getHeight(16)),
                                                                ValueListenableBuilder<PaymentModeContainerDTO?>(
                                                                  valueListenable: _selectedPayMode,
                                                                  builder: (context, value, _) => Visibility(
                                                                    visible: _selectedPayMode.value != null,
                                                                    child: _isCardMode ? Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                      children: [
                                                                        Text(MessagesProvider.get('CC Name'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS16W70016),
                                                                        SizedBox(height: SizeConfig.getHeight(8)),
                                                                        customTextField(
                                                                          context: context,
                                                                          hint: MessagesProvider.get('Enter'),
                                                                          textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS16W50016,
                                                                          controller: _ccNameController,
                                                                          height: SizeConfig.getHeight(50),
                                                                          borderColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                                                                          fillColor: Colors.transparent,
                                                                        ),
                                                                        SizedBox(height: SizeConfig.getHeight(16)),
                                                                        Text(MessagesProvider.get('Name on CC'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS16W70016),
                                                                        SizedBox(height: SizeConfig.getHeight(8)),
                                                                        customTextField(
                                                                          context: context,
                                                                          hint: MessagesProvider.get('Enter'),
                                                                          textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS16W50016,
                                                                          controller: _nameOnCCController,
                                                                          height: SizeConfig.getHeight(50),
                                                                          borderColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                                                                          fillColor: Colors.transparent,
                                                                        ),
                                                                        SizedBox(height: SizeConfig.getHeight(16)),
                                                                        Text(MessagesProvider.get('Card Number'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS16W70016),
                                                                        SizedBox(height: SizeConfig.getHeight(8)),
                                                                        customTextField(
                                                                          context: context,
                                                                          hint: MessagesProvider.get('Enter'),
                                                                          inputFilters: [
                                                                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                                                          ],
                                                                          textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS16W50016,
                                                                          controller: _cardNumberController,
                                                                          keyboardType: const TextInputType.numberWithOptions(decimal: false, signed: false),
                                                                          maxLength: 14,
                                                                          height: SizeConfig.getHeight(50),
                                                                          borderColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                                                                          fillColor: Colors.transparent,
                                                                        ),
                                                                        SizedBox(height: SizeConfig.getHeight(16)),
                                                                        Text(MessagesProvider.get('Authorization'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS16W70016),
                                                                        SizedBox(height: SizeConfig.getHeight(8)),
                                                                        customTextField(
                                                                          context: context,
                                                                          hint: MessagesProvider.get('Enter'),
                                                                          textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS16W50016,
                                                                          controller: _authorizationController,
                                                                          height: SizeConfig.getHeight(50),
                                                                          borderColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                                                                          fillColor: Colors.transparent,
                                                                        ),
                                                                        Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom))
                                                                      ],
                                                                    ) :
                                                                        Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                          children: [
                                                                            Text(MessagesProvider.get('Reference'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS16W70016),
                                                                            SizedBox(height: SizeConfig.getHeight(8)),
                                                                            customTextField(
                                                                              context: context,
                                                                              hint: MessagesProvider.get('Enter'),
                                                                              textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS16W50016,
                                                                              controller: _referenceController,
                                                                              height: SizeConfig.getHeight(50),
                                                                              borderColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                                                                              fillColor: Colors.transparent,
                                                                            ),
                                                                          ],
                                                                        )
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              const Divider(thickness: 1),
                              SizedBox(height: SizeConfig.getHeight(8)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  containerButton(
                                      text: MessagesProvider.get('Cancel').toUpperCase(),
                                      textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(16)) ?? tsS16W70016,
                                      buttonColor: theme.footerBG1 ?? colorBlueF8,
                                      height: SizeConfig.getHeight(38),
                                      width: SizeConfig.getWidth(108),
                                      cornerRadius: 5,
                                      onTapped: () {
                                        FocusManager.instance.primaryFocus?.unfocus();
                                        Navigator.pop(context);
                                      }
                                  ),
                                  SizedBox(width: SizeConfig.getWidth(12)),
                                  containerButton(
                                      text: MessagesProvider.get('Confirm').toUpperCase(),
                                      textStyle: theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(16), color: Colors.white) ?? tsS16W70016,
                                      buttonColor: theme.button2InnerShadow1 ?? colorBlack,
                                      height: SizeConfig.getHeight(38),
                                      width: SizeConfig.getWidth(108),
                                      cornerRadius: 5,
                                      onTapped: () {
                                        final cubit = context.read<EditPaymentCubit>();
                                        final editablePayments = state.editablePayments.where((element) => element.isSelected).toList();
                                        FocusManager.instance.primaryFocus?.unfocus();
                                        if(_selectedPayMode.value == null) {
                                          _notificationBar.showMessage(MessagesProvider.get('Please select a Compatible Payment Mode to proceed.'), theme.footerBG3 ?? colorRed50);
                                          return;
                                        }
                                        if(editablePayments.isEmpty) {
                                          _notificationBar.showMessage(MessagesProvider.get('Please select a record to proceed'), theme.footerBG4 ?? colorBlueFE);
                                          return;
                                        }
                                        _notificationBar.showMessage('', theme.footerBG2 ?? colorWhite);
                                        if(_isCardMode) {
                                          final args = EditPaymentArguments(
                                              compatiblePayModeId: _selectedPayMode.value?.paymentModeId ?? -1,
                                            isCardMode: _isCardMode,
                                            creditCardName: _ccNameController.text.toString(),
                                            nameOnCreditCard: _nameOnCCController.text.toString(),
                                            cardNumber: _cardNumberController.text.toString(),
                                            authorization: _authorizationController.text.toString(),
                                          );
                                          cubit.updatePayments(editablePayments, args);
                                        } else {
                                          final args = EditPaymentArguments(
                                              compatiblePayModeId: _selectedPayMode.value?.paymentModeId ?? -1,
                                              isCardMode: _isCardMode,
                                              reference: _referenceController.text.toString()
                                          );
                                          cubit.updatePayments(editablePayments, args);
                                        }
                                      }
                                  ),
                                ],
                              ),
                              SizedBox(height: SizeConfig.getHeight(8)),
                            ],
                          )
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

    dateFormat = await masterDataBL.getDefaultValuesByName(defaultValueName: "DATE_FORMAT");
    final updatePaymentList = <TransactionPaymentDTO>[];
    var totalPaymentAmt = 0.0;
    for (var element in widget.paymentList) {
      updatePaymentList.add(element.copyWith(isSelected: false));
      totalPaymentAmt += element.amount;
    }
    balance = widget.amountToSettle - totalPaymentAmt;
    if(mounted) {
      final theme = Theme.of(context).extension<SemnoxTheme>()!;
      final editPaymentCubit = context.read<EditPaymentCubit>();
      final payModeList = <PaymentModeContainerDTO>[];
      final payModeDTO = await masterDataBL.getPaymentModeById(widget.selectedPaymentMode);
      if(payModeDTO?.compatiblePaymentModesContainerDTOList != null) {
        await Future.forEach(payModeDTO!.compatiblePaymentModesContainerDTOList!, (element) async {
          if(widget.selectedPaymentMode == 291) { /// special case for cash, because mapping is wrong for cash from backend response (using element.paymentModeId)
            final item = await masterDataBL.getPaymentModeById(element.paymentModeId);
            if(item != null) {
              payModeList.add(item);
            }
          } else {
            final item = await masterDataBL.getPaymentModeById(element.compatiblePaymentModeId);
            if(item != null) {
              payModeList.add(item);
            }
          }
        });
      }
      if (payModeList.isNotEmpty) {
        for (int i = 0; i < payModeList.length; i++) {
          final item = payModeList[i];
          _payModesList.add(DropdownMenuItem(
              value: item,
              child: Text(item.paymentMode, style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w500) ?? tsS16W50016)));
        }
        editPaymentCubit.setPaymentModes(payModeList);
        editPaymentCubit.setEditablePayments(updatePaymentList);
      }
    }
  }
}
