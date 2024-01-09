import 'package:execution_context/builder.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:intl/intl.dart';
import 'package:login_ui/manager_login_popup.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/payment_modes_container/payment_mode_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:payment_data/builder.dart';
import 'package:payment_data/ismp4_connection/ismp4_connection.dart';
import 'package:payment_data/models/request/card_payment/card_payment_request.dart';
import 'package:payment_data/models/request/complete_sale/complete_sale_request.dart';
import 'package:payment_ui/cubits/payment_summary/card_screen/card_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/card_screen/card_screen_state.dart';
import 'package:payment_ui/cubits/payment_summary/cash_screen/cash_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/payment_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/payment_screen_state.dart';
import 'package:payment_ui/screens/payment_summary/payment_summary_screen.dart';
import 'package:payment_ui/screens/payment_summary/tender_screen.dart';
import 'package:payment_ui/screens/payment_summary/widgets/card_authorization_popup.dart';
import 'package:payment_ui/utils/colors.dart';
import 'package:payment_ui/utils/common_widgets.dart';
import 'package:payment_ui/utils/extensions.dart';
import 'package:payment_ui/utils/feature_not_implemented_view.dart';
import 'package:payment_ui/utils/styles.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/models/create_transaction/transaction_data.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:widgets_library/utils/keyboard_hider_widget.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../payment_mode_selection_screen.dart';

class ISMP4Screen extends StatefulWidget {

  final TransactionData? transactionData;
  final OnPaymentComplete onPaymentComplete;
  final PaymentAccessControlDTO? accessControlDTO;

  const ISMP4Screen({
    Key? key,
    required this.transactionData,
    required this.onPaymentComplete,
    this.accessControlDTO
  }) : super(key: key);

  @override
  State<ISMP4Screen> createState() => _ISMP4ScreenState();
}

class _ISMP4ScreenState extends State<ISMP4Screen> {

  final _amountTextController = TextEditingController();
  final _referenceController = TextEditingController();
  final _expiryController = TextEditingController();
  final _ccNameController = TextEditingController();
  final _cardNoController = TextEditingController();
  final _cardNameController = TextEditingController();
  final _authorizationController = TextEditingController();
  final _paymentScrollController = ScrollController();
  bool _isScrollableByDefault = false;
  bool _hasScrollBar = false;
  String? _sessionKey;
  String? _currency;
  String? _token;
  String? _cardName;
  String? _cardExp;
  bool isISMP4 = false;
  String? ismp4UserName;
  String? ismp4Password;
  String? ismp4HSN;
  String? ismp4MerchantId;
  String? ismp4Auth;
  String? ismp4BaseURL;
  String? ismp4VoidURL;

  String? retref;
  String? expiry;
  String? baseAuth;
  String? isMerchantCopy;
  String? isCustomerCopy;

  String _loadingMessage = "";
  String? sessionKey;
  var _alertContext;

  @override
  void initState() {
    Future.microtask(() => _initPaymentTotals());
    Future.microtask(() => _checkPaymentMode());
   // Future.microtask(() => _checkForISMP4Mode());
    WidgetsBinding.instance.endOfFrame.then(
          (_) {
        if (mounted) {
          setState(() {
            _hasScrollBar = _paymentScrollController.position.maxScrollExtent != 0;
            _isScrollableByDefault = _hasScrollBar;
          });
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return BlocConsumer<CardScreenCubit, CardScreenState>(builder: (ctx, state) {
      return KeyboardVisibilityBuilder(
          builder: (context, isKeyboardVisible) {
            if(!_isScrollableByDefault) {
              _hasScrollBar = isKeyboardVisible;
            }
            return Container(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(12)),
          child: WillPopScope(
            onWillPop: ()  async => false,
            child: Stack(
              children: [
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 68,
                  child: Scroller(
                    controller: _paymentScrollController,
                    child: ListView(
                      controller: _paymentScrollController,
                      padding: EdgeInsets.only(right: _hasScrollBar ? SizeConfig.getWidth(60) : 0),
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: SizeConfig.getHeight(40),
                                child: Focus(
                                  onFocusChange: (hasFocus) {
                                    if(!hasFocus) {
                                      if(_amountTextController.text.toString().isEmpty) {
                                        _amountTextController.text = '0';
                                      } else {

                                      }
                                    }
                                  },
                                  child: amountTextField(controller: _amountTextController, onTap: () {
                                    _showNumberPadDialog();
                                  },borderColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                                      textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w500) ?? tsS14W50016),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.getHeight(12)),
                        Text(MessagesProvider.get('Reference'), style:  theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
                        SizedBox(height: SizeConfig.getHeight(8)),
                        customTextField(
                          context: context,
                          hint: MessagesProvider.get('Enter'),
                          textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(22), fontWeight: FontWeight.w500) ?? tsS16W50016,
                          controller: _referenceController,
                          height: SizeConfig.getHeight(40),
                          width: SizeConfig.blockSizeHorizontal * 45,
                          borderColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                          fillColor: theme.primaryColor ?? colorWhite,
                        ),
                        SizedBox(height: SizeConfig.getHeight(12)),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(MessagesProvider.get('Card Number'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
                                  SizedBox(height: SizeConfig.getHeight(8)),
                                  customTextField(
                                    context: context,
                                    hint: MessagesProvider.get('Enter'),
                                    textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W50016,
                                    controller: _cardNoController,
                                    maxLength: 4,
                                    keyboardType: const TextInputType.numberWithOptions(decimal: false, signed: false),
                                    height: SizeConfig.getHeight(40),
                                    borderColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                                    fillColor: theme.primaryColor ?? colorWhite,
                                  ),
                                  SizedBox(height: SizeConfig.getHeight(12)),
                                  Text(MessagesProvider.get('Expiry'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
                                  SizedBox(height: SizeConfig.getHeight(8)),
                                  customTextField(
                                    context: context,
                                    hint: MessagesProvider.get('Enter'),
                                    textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W50016,
                                    controller: _expiryController,
                                    maxLength: 20,
                                    height: SizeConfig.getHeight(40),
                                    borderColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                                    fillColor: theme.primaryColor ?? colorWhite,
                                  ),
                                  SizedBox(height: SizeConfig.getHeight(12)),
                                  Text(MessagesProvider.get('CC Name'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
                                  SizedBox(height: SizeConfig.getHeight(8)),
                                  customTextField(
                                    context: context,
                                    hint: MessagesProvider.get('Enter'),
                                    textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W50016,
                                    controller: _ccNameController,
                                    height: SizeConfig.getHeight(40),
                                    borderColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                                    fillColor: theme.primaryColor ?? colorWhite,
                                  ),
                                  SizedBox(height: SizeConfig.getHeight(12)),
                                  Text(MessagesProvider.get('Surch Amount'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
                                  SizedBox(height: SizeConfig.getHeight(8)),
                                  Container(
                                    height: SizeConfig.getHeight(40),
                                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(12)),
                                    decoration: BoxDecoration(
                                        color: theme.footerBG1 ?? colorBlueF7,
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Text(_calculateSurchAmount().formatToDC(), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS14W50016)
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: SizeConfig.getWidth(12)),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(MessagesProvider.get('Name on Card'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
                                  SizedBox(height: SizeConfig.getHeight(8)),
                                  customTextField(
                                    context: context,
                                    hint: MessagesProvider.get('Enter'),
                                    textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W50016,
                                    controller: _cardNameController,
                                    height: SizeConfig.getHeight(40),
                                    borderColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                                    fillColor: theme.primaryColor ?? colorWhite,
                                  ),
                                  SizedBox(height: SizeConfig.getHeight(12)),
                                  Text(MessagesProvider.get('Authorization'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
                                  SizedBox(height: SizeConfig.getHeight(8)),
                                  customTextField(
                                    context: context,
                                    hint: MessagesProvider.get('Enter'),
                                    textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W50016,
                                    controller: _authorizationController,
                                    height: SizeConfig.getHeight(40),
                                    borderColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                                    fillColor: theme.primaryColor ?? colorWhite,
                                  ),
                                  SizedBox(height: SizeConfig.getHeight(12)),
                                  Text(MessagesProvider.get('Surch Percentage'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
                                  SizedBox(height: SizeConfig.getHeight(8)),
                                  Container(
                                    height: SizeConfig.getHeight(40),
                                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(12)),
                                    decoration: BoxDecoration(
                                        color: theme.footerBG1 ?? colorBlueF7,
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Text(_getSurchPercentage().toString(), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W50016)
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: SizeConfig.getHeight(12)),
                                  Text(MessagesProvider.get('Total CC Amount'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
                                  SizedBox(height: SizeConfig.getHeight(8)),
                                  Container(
                                    height: SizeConfig.getHeight(40),
                                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(12)),
                                    decoration: BoxDecoration(
                                        color: theme.footerBG1 ?? colorBlueF7,
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Text(_getTotalPendingAmount().formatToDC(), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w500) ?? tsS14W50016)
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                        BlocConsumer<PaymentScreenCubit, PaymentScreenState>(builder: (ctx, state) => const SizedBox(), listener: (ctx, state) {
                          if(state.transactionResponse != null) {
                            if(state.isPaymentRefreshed) {
                              final pendingTotal = (state.transactionResponse?.data?.transactionNetAmount ?? 0) - (state.transactionResponse?.data?.transactionPaymentTotal ?? 0);
                              _amountTextController.text = pendingTotal.formatToDC();
                            }
                          }
                        })
                      ],
                    ),
                  ),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: SizeConfig.getHeight(8),
                    child: Visibility(
                      visible: widget.accessControlDTO?.shouldDisplayTask ?? true,
                      child: containerButton(
                          text: MessagesProvider.get('APPLY'),
                          textStyle: theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(22), fontWeight: FontWeight.w500, color: Colors.white) ?? tsS16W500FF,
                          height: SizeConfig.getHeight(52),
                          cornerRadius: 6,
                          width: SizeConfig.blockSizeHorizontal * 50,
                          onTapped: () async {
                            if(!(widget.accessControlDTO?.isTaskEnabled ?? false)) {
                              return;
                            }
                            final textAmt = _amountTextController.text.toString();
                            final isInvalidAmt = textAmt.length >= 2 && textAmt.substring(textAmt.length-2, textAmt.length-1) == '.';
                            if(isInvalidAmt) {
                              _amountTextController.text = textAmt.substring(0, textAmt.length-2);
                            }
                            final amount = double.parse(_amountTextController.text.toString());
                            if(widget.transactionData == null) {
                              return;
                            }
                            if(amount != 0) {
                              final paymentMethod = context.read<PaymentScreenCubit>().state.selectedPayMode;
                              if(paymentMethod?.creditCardDetailsMandatory == true) {
                                if(_cardNoController.text.toString().isEmpty) {
                                  context.read<PaymentScreenCubit>().setNotificationMessage(MessagesProvider.get('Enter Credit Card Number'), isErrorMode: true);
                                  return;
                                }
                                if(_expiryController.text.toString().isEmpty) {
                                  context.read<PaymentScreenCubit>().setNotificationMessage(MessagesProvider.get('Enter Credit Card Expiry Month / Year'), isErrorMode: true);
                                  return;
                                }
                                if(_cardNameController.text.toString().isEmpty) {
                                  context.read<PaymentScreenCubit>().setNotificationMessage(MessagesProvider.get('Enter Name on Credit Card'), isErrorMode: true);
                                  return;
                                }
                              }
                              final cardCubit = context.read<CardScreenCubit>();
                              final execContextBL = await ExecutionContextBuilder.build();
                              final execContext = execContextBL.getExecutionContext();
                              final paymentDataBL = await PaymentDataBuilder.build(execContext!);
                              cardCubit.setPaymentDataBL(paymentDataBL);
                              final reference = _referenceController.text.toString();
                              if(mounted) {
                                context.read<PaymentScreenCubit>().setNotificationMessage('', isErrorMode: false);
                                if(paymentMethod?.paymentReferenceMandatory == true) {
                                  if(reference.isEmpty) {
                                    context.read<PaymentScreenCubit>().setNotificationMessage(MessagesProvider.get('Payment Reference is Mandatory. Please enter Payment Reference to complete the transaction.'));
                                    return;
                                  }
                                }
                                bool isPreAuthDisabled = false;
                                final transaction = context.read<PaymentScreenCubit>().state.transactionResponse;
                                if(transaction?.data != null) {
                                  for (var element in transaction!.data!.transactionPaymentDTOList) {
                                    if(element.paymentStatus == 'PRE_AUTHORIZED') {
                                      isPreAuthDisabled = true;
                                      break;
                                    }
                                  }
                                }
                                if(paymentMethod?.allowCreditCardAuthorization == true) {
                                  showDialog(context: context, barrierDismissible: false, builder: (_) {
                                    return CardAuthorizationPopup(
                                      onPreAuthClicked: () {
                                        final status = transaction?.data?.transactionStatus;
                                        if(status == 'PENDING_CLOSE' || status == 'CANCELLED' || status == 'CLOSED' || status == 'ABANDONED' || status == 'REVERSED') {
                                          context.read<PaymentScreenCubit>().setValidationError(MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.",[status,'PRE-AUTHORIZE']));
                                          return;
                                        }
                                        if(isISMP4){
                                          _checkForISMP4Mode(paymentMethod,paymentStatus: 'PRE_AUTHORIZATION_INITIATED',"0.0");
                                         // _autherizeISMP4Payment(paymentMethod,paymentStatus: 'PRE_AUTHORIZATION_INITIATED',"0.0");
                                        }else{
                                          _processCardPayment(paymentMethod, execContext, paymentStatus: 'PRE_AUTHORIZATION_INITIATED');
                                        }
                                      },
                                      onAuthClicked: () {
                                        final status = transaction?.data?.transactionStatus;
                                        if(status == 'PENDING_CLOSE' || status == 'CLOSED' || status == 'ABANDONED' || status == 'CANCELLED'
                                            || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
                                          context.read<PaymentScreenCubit>().setValidationError(MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.",[status,'AUTHORIZE']));
                                          return;
                                        }
                                        if(isISMP4){
                                          _checkForISMP4Mode(paymentMethod,paymentStatus: 'AUTHORIZATION_INITIATED',_amountTextController.text);
                                          //_autherizeISMP4Payment(paymentMethod,paymentStatus: 'AUTHORIZATION_INITIATED', _amountTextController.text);
                                        }else {
                                          _processCardPayment(
                                              paymentMethod, execContext,
                                              paymentStatus: 'AUTHORIZATION_INITIATED');
                                        }
                                      },
                                      onSettleClicked: () {
                                        final status = transaction?.data?.transactionStatus;
                                        if(status == 'PENDING_CLOSE' || status == 'CLOSED' || status == 'CANCELLED' || status == 'ABANDONED'
                                            || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
                                          context.read<PaymentScreenCubit>().setValidationError(MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.",[status,'SALE PAYMENT']));
                                          return;
                                        }
                                        if(isISMP4){
                                          print("payment clicked");
                                          _checkForISMP4Mode(paymentMethod,paymentStatus: 'SALE_INITIATED',_amountTextController.text);
                                          //_autherizeISMP4Payment(paymentMethod,paymentStatus: "SALE_INITIATED", _amountTextController.text, capture: "Y");
                                        }else {
                                          _processCardPayment(paymentMethod, execContext);
                                        }
                                      },
                                      onCancelClicked: () {

                                      },
                                      isPreAuthDisabled: isPreAuthDisabled,
                                    );
                                  });
                                } else {
                                  final status = transaction?.data?.transactionStatus;
                                  if(status == 'CLOSED' || status == 'CANCELLED' || status == 'ABANDONED' || status == 'PENDING_CLOSE' || status == 'REVERSED') {
                                    context.read<PaymentScreenCubit>().setValidationError(MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.",[status,'ADD PAYMENT']));
                                    return;
                                  }
                                  if(isISMP4){
                                    print("payment clicked");
                                    _checkForISMP4Mode(paymentMethod,paymentStatus: 'SALE_INITIATED',_amountTextController.text);
                                   // _autherizeISMP4Payment(paymentMethod,_amountTextController.text);
                                  }else {
                                    _processCardPayment(paymentMethod, execContext);
                                  }
                                }
                              }
                            } else {
                              final paymentCubit = context.read<PaymentScreenCubit>();
                              paymentCubit.setValidationError(MessagesProvider.get('Cannot proceed. Payment Amount is 0.'));
                            }
                          }, buttonColor: (widget.accessControlDTO?.isTaskEnabled ?? false) ? (theme.button2InnerShadow1 ?? colorBlack) : (theme.button2InnerShadow1?.withOpacity(0.5) ?? colorBlack.withOpacity(0.5))
                      ),
                    ))
              ],
            ),
          ),
        );
          },
      );
    }, listener: (ctx, state) {

      if(mounted) {

        if(state.transactionResponse != null) {
          final response = state.transactionResponse;
          context.read<CardScreenCubit>().updateTransaction(null);
          final pendingTotal = (response?.data?.transactionNetAmount ?? 0) - (response?.data?.transactionPaymentTotal ?? 0);
          _amountTextController.text = pendingTotal.formatToDC();
          widget.onPaymentComplete(response);
        }

        if(state.apiError != null) {
          context.read<PaymentScreenCubit>().setApiError(state.apiError);
          Future.delayed(const Duration(milliseconds: 150), () {
            context.read<PaymentScreenCubit>().setLoadingStatus(status: 0);
          });
          context.read<CardScreenCubit>().clearError();
        }
      }
    });
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

  void _processCardPayment(PaymentModeContainerDTO? paymentMethod, ExecutionContextDTO execContext, {String? paymentStatus = 'SALE_INITIATED', String? authResponse,String? amountPaid}) {
    final cardCubit = context.read<CardScreenCubit>();
    final isCurrentUserManager = context.read<PaymentScreenCubit>().state.isCurrentUserManager;
    final paymentMethodId = paymentMethod?.paymentModeId;
    final reference = _referenceController.text.toString();
    final amount = double.parse(amountPaid ?? _amountTextController.text.toString());
    print("paid amount $amountPaid $amount");
    final tenderAmt = context.read<PaymentScreenCubit>().state.tenderedAmount == 0 ? null : context.read<PaymentScreenCubit>().state.tenderedAmount.toString();
    CardPaymentRequest? cardPayment;
    {
      CardPaymentRequest? cardPaymentRequest;
      var attr1 = '', attr2 = '', attr3 = '', attr4 = '';
      if(authResponse != null) {
        final json = jsonDecode(authResponse);
        final tagData = amountPaid == "0.0" ? null :  (json['emvTagData'] == null ? null : jsonDecode(json['emvTagData']));
        String approval = '';
        if(json['respstat'] == 'A') {
          approval = 'Approval';
        } else if (json['respstat'] == 'B') {
          approval = 'Retry';
        } else if (json['respstat'] == 'C') {
          approval = 'Declined';
        }
        attr1 = '$retref~$expiry~$baseAuth~$ismp4MerchantId~$_currency';
        attr2 = '${json['token'] ?? ''}~$approval~${json['account'] ?? ''}~Credit';
        attr3 = 'AUTHORIZATION~${json['authcode'] ?? ''}';
        attr4 = tagData == null ? '${''}~Chip Read' : '${tagData['Network Label'] ?? ''}~Chip Read';
      } else {
        attr1 = '$retref~$expiry~$baseAuth~$ismp4MerchantId~$_currency';
      }
      cardPaymentRequest = CardPaymentRequest(paymentId: -1, approverId: execContext.userPKId ?? -1,
        transactionId: -1, paymentModeId: paymentMethodId ?? -1, paymentStatusId: -1,
        creditCardNumber: _token, creditCardExpiry: _cardExp,
        creditCardName: _cardName, nameOnCreditCard: _cardName, tenderedAmount: tenderAmt,
        amount: amount, cashDrawerId: -1, tipAmount: 0.0, reference: reference, cardId: -1,
        ccResponseId: -1, paymentStatus: paymentStatus!, isKeyedMode: false, isChanged: true, isChangedRecursive: true,
        attribute1: attr1, attribute2: attr2, attribute3: attr3, attribute4: attr4);

      if((widget.accessControlDTO?.managerApprovalRequired ?? false) && !isCurrentUserManager) {
        _showManagerLoginPopup(onAuthSuccess: (managerApproverId) {
          cardPaymentRequest = cardPaymentRequest?.copyWith(approverId: managerApproverId);
          context.read<PaymentScreenCubit>().setLoadingStatus(status: 1, message: 'Adding payment...');
          if(paymentStatus == 'PRE_AUTHORIZATION_INITIATED') {
            cardCubit.addPreAuthPayment(widget.transactionData?.transactionId ?? -1, cardPaymentRequest!, authResponse: authResponse);
          } else if(paymentStatus == 'AUTHORIZATION_INITIATED') {
            cardCubit.addAuthPayment(widget.transactionData?.transactionId ?? -1, cardPaymentRequest!, authResponse: authResponse);
          } else {
            cardCubit.addCardPayment(widget.transactionData?.transactionId ?? -1, cardPaymentRequest!, authResponse: authResponse);
          }
        });
      } else {
        context.read<PaymentScreenCubit>().setLoadingStatus(status: 1, message: 'Adding payment...');
        if(paymentStatus == 'PRE_AUTHORIZATION_INITIATED') {
          cardCubit.addPreAuthPayment(widget.transactionData?.transactionId ?? -1, cardPaymentRequest, authResponse: authResponse);
        } else if(paymentStatus == 'AUTHORIZATION_INITIATED') {
          cardCubit.addAuthPayment(widget.transactionData?.transactionId ?? -1, cardPaymentRequest, authResponse: authResponse);
        } else {
          cardCubit.addCardPayment(widget.transactionData?.transactionId ?? -1, cardPaymentRequest, authResponse: authResponse);
        }
      }
    }
  }

  Future<void> _initPaymentTotals() async {

    if(widget.transactionData?.transactionPaymentDTOList.isNotEmpty == true) {
      var totalPaidAmt = 0.0;
      totalPaidAmt = widget.transactionData?.transactionPaymentTotal ?? 0;
      final pendingTotal = _getTotalAmount() - totalPaidAmt;
      final positivePendingTotal = pendingTotal > 0 ? pendingTotal : 0.0;
      _amountTextController.text = positivePendingTotal.formatToDC();
    } else {
      final amount = _getTotalAmount();
      _amountTextController.text = amount.formatToDC();
    }
  }

  double _calculateSurchAmount() {
    final mode = _getSelectedMode();
    if(mode != null) {
      if(mode.creditCardSurchargePercentage == -1) {
        return 0;
      } else {
        final totalAmt = _getTotalAmount();
        final surchAmount = (totalAmt * mode.creditCardSurchargePercentage) / 100;
        return surchAmount;
      }
    } else {
      return 0;
    }
  }

  double _getTotalAmount() {
    return (widget.transactionData?.transactionNetAmount ?? 0);
  }

  double _getTotalPendingAmount() {
    return (widget.transactionData?.transactionNetAmount ?? 0) - (widget.transactionData?.transactionPaymentTotal ?? 0);
  }

  PaymentModeContainerDTO? _getSelectedMode() {
    return context.read<PaymentScreenCubit>().state.selectedPayMode;
  }

  int _getSurchPercentage() {
    final surchPercentage = (_getSelectedMode()?.creditCardSurchargePercentage ?? -1).toInt();
    return surchPercentage == -1 ? 0 : surchPercentage;
  }

  void _showNumberPadDialog() {
    var amount = 0.0;
    try {
      amount = double.parse(_amountTextController.text);
    } on Exception {
      amount = 0;
    }
    showDialog(
        context: context,
        barrierColor: const Color(0x01000000),
        builder: (_) {
          return NumberPad(
            initialOffset: Offset(SizeConfig.screenWidth / 2, SizeConfig.screenHeight / 10),
            isDecimalRequired: true,
            isInitialRequired: true,
            barrierDismissible: true,
            initialDecimalValue: amount,
            title: null,
            onOkPressed: (value)  {
              final amt = value as double;
              _amountTextController.text = amt.formatToDC();
            },
          );
        });
  }

  void _showTenderPopup(BuildContext context) {
    final paymentMethod = context.read<PaymentScreenCubit>().state.selectedPayMode;
    if(paymentMethod?.autoShowTenderedAmountKeyPad == true) {
      if(mounted) {
        showDialog(context: context, barrierDismissible: false, builder: (_) {
          return ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
                padding: EdgeInsets.only(left: SizeConfig.getWidth(16), top: SizeConfig.getHeight(16), right: SizeConfig.getWidth(16), bottom: SizeConfig.blockSizeVertical * 10.8),
                child: BlocProvider.value(
                    value: BlocProvider.of<CashScreenCubit>(context),
                    child: TenderScreen(initialAmt: double.parse(_amountTextController.text.toString()), totalAmt: double.parse(_amountTextController.text.toString())))),
          );
        }).then((value) {
          final paymentBloc = context.read<PaymentScreenCubit>();
          final tenderAmt = double.parse(context.read<CashScreenCubit>().state.tenderedAmount);
          if(tenderAmt != 0) {
            Log.v('Tendered amount: $tenderAmt, \t Total: ${(widget.transactionData?.transactionNetAmount ?? 0)}');
            if(tenderAmt > (widget.transactionData?.transactionNetAmount ?? 0)) {
              _amountTextController.text = (widget.transactionData?.transactionNetAmount ?? 0).formatToDC();
            } else {
              _amountTextController.text = tenderAmt.formatToDC();
            }
          }
          paymentBloc.updateTenderAmt(tenderAmt);
        });
      }
    }
  }

 void  _checkPaymentMode(){
    final paymentCubit = context.read<PaymentScreenCubit>();
    if(paymentCubit.state.selectedPayMode?.paymentMode == "ISMP4" || paymentCubit.state.selectedPayMode?.paymentMode == "Card Connect") {
      isISMP4 = true;
    }
  }

  Future<void> _checkForISMP4Mode(PaymentModeContainerDTO? paymentMethod,String amountt, {String? paymentStatus, String? capture}) async {
    final paymentCubit = context.read<PaymentScreenCubit>();
    _loadingMessage = 'Connecting to ISMP4 terminal...';
    if(paymentCubit.state.selectedPayMode?.paymentMode == "ISMP4" || paymentCubit.state.selectedPayMode?.paymentMode == "Card Connect"){
      paymentCubit.showLoader(message: _loadingMessage);
      isISMP4 = true;
      await _getDefaults();
      var response = await Ismp4Connection.establishConnection(ismp4Auth!,ismp4MerchantId!,ismp4HSN!);
      if(response?.statusCode == 200){
         paymentCubit.hideLoader();
        sessionKey = response?.headers['x-cardconnect-sessionkey'];
        sessionKey = sessionKey?.substring(0, sessionKey!.indexOf(';'));
        _sessionKey = sessionKey;

         bool preAutherized = false;
         var paymentDTOLIst = widget.transactionData?.transactionPaymentDTOList;
         if((widget.transactionData?.transactionPaymentDTOList.length ?? 0) > 0 ){
           for(int i = 0; i < (widget.transactionData?.transactionPaymentDTOList.length ?? 0) ; i++){
             if(paymentDTOLIst?[i].paymentModeId == 439 || paymentDTOLIst?[i].paymentModeId  == 440){
               preAutherized = true;
               final attrList1 = widget.transactionData?.transactionPaymentDTOList[i].attribute1?.toString().split('~') ?? [];
               final attrList2 = widget.transactionData?.transactionPaymentDTOList[i].attribute2?.toString().split('~') ?? [];
               if(attrList1.length == 5) {
                 _cardExp = attrList1[1];
               }
               if(attrList2.length == 4) {
                 _token = attrList2[0];
               }
               /*_cardNameController.text = widget.transactionData?.transactionPaymentDTOList[i].nameOnCreditCard ?? "";
               _cardNoController.text = _token ?? '';
               _expiryController.text = widget.transactionData?.transactionPaymentDTOList[i].creditCardExpiry ?? "";*/
             }
           }
         }
         if(preAutherized){
           if(paymentStatus == 'AUTHORIZATION_INITIATED' || paymentStatus == 'REFUNDED' || paymentStatus == 'AUTHORIZATION_DECLINED' || paymentStatus == 'VOIDED'
               || paymentStatus == 'PRE_AUTHORIZED' || paymentStatus == 'ADJUSTMENT_INITIATED' || paymentStatus == 'SETTLEMENT_DECLINED' || paymentStatus == 'SALE_DECLINED'
               || paymentStatus == 'REVERSE_INITIATED' || paymentStatus == 'VOID_DECLINED' || paymentStatus == 'SALE_INITIATED' || paymentStatus == 'REFUND_INITIATED'
               || paymentStatus == 'REVERSE_DECLINED' || paymentStatus == 'REVERSED' || paymentStatus == 'VOID_INITIATED' || paymentStatus == 'REFUND_DECLINED'
               || paymentStatus == 'SETTLEMENT_INITIATED' || paymentStatus == 'AUTHORIZED' || paymentStatus == 'SETTLED' || paymentStatus == 'PRE_AUTHORIZATION_DECLINED') {
             context.read<PaymentScreenCubit>().setValidationError(MessagesProvider.get('&1 operation is not allowed when &2 status is &3.', ["Pre-Authorize", "Payment", paymentStatus]));
             return;
           }
           _autherizeISMP4Payment(paymentMethod,paymentStatus: paymentStatus,amountt);
         }else{
           //  _loadingMessage = "Please Swipe/Tap/Insert the card on ISMP4 terminal  ";
           _loadingMessage = "Please Swipe/Tap/Insert your card ";
           //paymentCubit.showLoader(message: _loadingMessage);
           _showSwipeDialog(_loadingMessage);
           var cardResponse = await Ismp4Connection.readCard(ismp4Auth!,ismp4MerchantId!,ismp4HSN!,
               sessionKey!, amountt);
           if(cardResponse?.statusCode == 200){
             Navigator.pop(_alertContext);
             // paymentCubit.hideLoader();
             _loadingMessage = "Please add a tip ISMP4 reader";
             Log.i("read card response ${cardResponse!.body}");
             var cardBody = jsonDecode(cardResponse.body);
             //_cardNameController.text = cardBody["name"] ?? '';
             //_cardNoController.text = cardBody["token"] ?? '';
             //_expiryController.text = cardBody["expiry"];
             _token =  cardBody["token"] ?? '';
             _cardName = cardBody["name"] ?? '';
             _cardExp = cardBody["expiry"] ?? '';
             _autherizeISMP4Payment(paymentMethod,paymentStatus: paymentStatus,amountt);
             /*var tipResponse = await Ismp4Connection.leaveTip(ismp4Auth!,ismp4MerchantId!,ismp4HSN!,
              sessionKey!,amountt);
          if(tipResponse?.statusCode == 200){
            Log.i("tip card response ${tipResponse!.body}");
            var tipBody = jsonDecode(tipResponse.body);
            var amount = tipBody["total"];
            amount = (double.parse(amount)/100).toString();
            //_amountTextController.text = amount;
            // amount = (int.parse(amount) / 100).toDouble().toString();
            paymentCubit.hideLoader();
            _autherizeISMP4Payment(paymentMethod,paymentStatus: paymentStatus,amount);
          }*/
           } else{
             Navigator.pop(_alertContext);
             _loadingMessage = "";
             context.read<PaymentScreenCubit>().setApiError("Declined");
             //context.read<PaymentScreenCubit>().setNotificationMessage(MessagesProvider.get('Declined'), isErrorMode: true);
           }
         }

      }else{
        _loadingMessage = "Connection failed";
       // context.read<PaymentScreenCubit>().setNotificationMessage(MessagesProvider.get('Connection failed'), isErrorMode: true);
        context.read<PaymentScreenCubit>().setApiError("Connection failed");
        paymentCubit.hideLoader();

      }
    }
    else{
      isISMP4 = false;
      if(_sessionKey != null){
        Ismp4Connection.disconnect(_sessionKey!,ismp4Auth!,ismp4MerchantId!,ismp4HSN!);
      }
    }
  }

  _autherizeISMP4Payment(PaymentModeContainerDTO? paymentMethod,String amount, {String? paymentStatus, String? capture}) async {
    final paymentCubit = context.read<PaymentScreenCubit>();
    _loadingMessage = "Applying payment. Please wait.. ";
    paymentCubit.showLoader(message: _loadingMessage);
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
      String authCode = generateBasicAuth(ismp4UserName!,ismp4Password!);

    if(paymentStatus == 'REVERSE_INITIATED' || paymentStatus == 'VOID_DECLINED' || paymentStatus == 'SALE_INITIATED' || paymentStatus == 'REVERSED'
        || paymentStatus == 'SALE_DECLINED' || paymentStatus == 'REFUND_DECLINED' || paymentStatus == 'PRE_AUTHORIZATION_DECLINED' || paymentStatus == 'ADJUSTMENT_INITIATED'
        || paymentStatus == 'REVERSE_DECLINED' || paymentStatus == 'REFUNDED' || paymentStatus == 'SETTLEMENT_DECLINED' || paymentStatus == 'VOIDED'
        || paymentStatus == 'VOID_INITIATED' || paymentStatus == 'SETTLEMENT_INITIATED' || paymentStatus == 'SETTLEMENT_DECLINED' || paymentStatus == 'SETTLED'
        || paymentStatus == 'REFUND_INITIATED' || paymentStatus == 'AUTHORIZED' || paymentStatus == 'PRE_AUTHORIZATION_INITIATED' || paymentStatus == 'PRE_AUTHORIZED') {
      context.read<PaymentScreenCubit>().setValidationError(MessagesProvider.get('&1 operation is not allowed when &2 status is &3.', ["Authorize", "Payment", paymentStatus]));
      return;
    }

    if(paymentStatus == 'PRE_AUTHORIZATION_INITIATED'){
      capture = null;
    }else{
      capture = "Y";
    }
    print("card_details $_token $_cardExp");
    var response = await  Ismp4Connection.autherize(authCode, ismp4MerchantId!,amount, _token!, _cardExp!, _currency!,capture);
    if(response?.statusCode == 200){
      paymentCubit.hideLoader();
      Log.i("autherization response ${response!.body}");
      if(jsonDecode(response.body)['respstat'] == 'A') {
        retref = jsonDecode(response.body)['retref'];
        expiry = jsonDecode(response.body)['expiry'];
        baseAuth = authCode;
        Ismp4Connection.displayAmount((_sessionKey ?? ""), ismp4Auth!,amount, MessagesProvider.get("Approved"));

        Future.microtask(() => showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) {
            return FutureBuilder(
              future: Future.delayed(const Duration(milliseconds: 3000)).then((value) => true),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Future.microtask(() => {
                    _processCardPayment(paymentMethod, execContext!, paymentStatus: paymentStatus, authResponse: response.body,amountPaid: amount),
                    Ismp4Connection.disconnect(_sessionKey!,ismp4Auth!,ismp4MerchantId!,ismp4HSN!),
                  });
                  Navigator.of(ctx).pop();
                }
                return const AlertDialog(
                  content: Text("Approved", textAlign: TextAlign.center,),
                );
              },
            );
          },
        ));

      }else if(jsonDecode(response.body)['respstat'] == 'C') {
        _loadingMessage = "Declined";
        Ismp4Connection.displayAmount((_sessionKey ?? ""),ismp4Auth!, amount, "Declined");
        context.read<PaymentScreenCubit>().setApiError(_loadingMessage);
      //  context.read<PaymentScreenCubit>().setNotificationMessage(MessagesProvider.get('Declined'), isErrorMode: true);

      }else{
        _loadingMessage = "Retry";
        Ismp4Connection.displayAmount((_sessionKey ?? ""), ismp4Auth!,amount, "Retry");
        context.read<PaymentScreenCubit>().setApiError(_loadingMessage);
      }
    }
  }

  _getDefaults() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    _currency = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CURRENCY_CODE');
    ismp4MerchantId = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CARD_CONNECT_HOSTED_PAYMENT_MERCHANT_ID');
    ismp4HSN = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CREDIT_CARD_TERMINAL_ID');
    ismp4Auth = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CREDIT_CARD_TOKEN_ID');
    ismp4UserName = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CARD_CONNECT_HOSTED_PAYMENT_USER_NAME');
    ismp4Password = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CARD_CONNECT_HOSTED_PAYMENT_PASSWORD');
    ismp4BaseURL = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CARD_CONNECT_HOSTED_PAYMENT_BASE_URL');
    ismp4VoidURL = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CREDIT_CARD_VOID_URL');
    isMerchantCopy = (await masterDataBL.getDefaultValuesByName(defaultValueName: 'PRINT_MERCHANT_RECEIPT'));
    isCustomerCopy = (await masterDataBL.getDefaultValuesByName(defaultValueName: 'PRINT_CUSTOMER_RECEIPT'));
    Log.i("auth : $ismp4Auth \n merchant_id : $ismp4MerchantId \n hsn : $ismp4HSN \n mechnatCopy : $isMerchantCopy");
  }

  _showSwipeDialog(String message){
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    Future.microtask(() => showDialog(
        context: context,
        builder: (ctx) {
          _alertContext = ctx;
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Text(
                      message,
                      style: theme.subtitle1,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(width: 8.0,),
                    ElevatedButton(
                        onPressed: () async {
                          context.read<PaymentScreenCubit>().setNotificationMessage(MessagesProvider.get('Command is canceled or error in executing the command.'), isErrorMode: true);
                          Ismp4Connection.cancelCommand(_sessionKey!,ismp4Auth!,ismp4MerchantId!,ismp4HSN!);
                          Navigator.pop(ctx);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                          backgroundColor:  theme.tableRow1,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                        ),
                        child: Text(
                          MessagesProvider.get("Cancel"),
                          style: theme.title2?.copyWith(fontSize: SizeConfig.getFontSize(18), fontWeight: FontWeight.w700 ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ))
                  ],
                ),
              ),
            ),
          );
        },
        barrierDismissible: false));
  }

  String generateBasicAuth(String userName, String password) {
    String mydata = "$userName:$password";
    var bytes = utf8.encode(mydata);
    var base64Str = base64.encode(bytes);
    var apiKey = "Basic $base64Str";
    return apiKey;
  }


}