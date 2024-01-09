import 'package:customer_ui/utils/AppColors.dart';
import 'package:execution_context/builder.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
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
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/models/create_transaction/transaction_data.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:widgets_library/utils/keyboard_hider_widget.dart';


import '../../payment_mode_selection_screen.dart';

class CreditDebitScreen extends StatefulWidget {

  final TransactionData? transactionData;
  final OnPaymentComplete onPaymentComplete;
  final PaymentAccessControlDTO? accessControlDTO;

  const CreditDebitScreen({
    Key? key,
    required this.transactionData,
    required this.onPaymentComplete,
    this.accessControlDTO
  }) : super(key: key);

  @override
  State<CreditDebitScreen> createState() => _CreditDebitScreenState();
}

class _CreditDebitScreenState extends State<CreditDebitScreen> {

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

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 200),() => _showTenderPopup(context));
    Future.microtask(() => _initPaymentTotals());
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
                                showDialog(context: context, builder: (_) {
                                  return CardAuthorizationPopup(
                                    onPreAuthClicked: () {
                                      final status = transaction?.data?.transactionStatus;
                                      if(status == 'PENDING_CLOSE' || status == 'CANCELLED' || status == 'CLOSED' || status == 'ABANDONED' || status == 'REVERSED') {
                                        context.read<PaymentScreenCubit>().setValidationError(MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.",[status,'PRE-AUTHORIZE']));
                                        return;
                                      }
                                      _processCardPayment(paymentMethod, execContext, paymentStatus: 'PRE_AUTHORIZATION_INITIATED');
                                    },
                                    onAuthClicked: () {
                                      final status = transaction?.data?.transactionStatus;
                                      if(status == 'PENDING_CLOSE' || status == 'CLOSED' || status == 'ABANDONED' || status == 'CANCELLED'
                                          || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
                                        context.read<PaymentScreenCubit>().setValidationError(MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.",[status,'AUTHORIZE']));
                                        return;
                                      }
                                      _processCardPayment(paymentMethod, execContext, paymentStatus: 'AUTHORIZATION_INITIATED');
                                    },
                                    onSettleClicked: () {
                                      final status = transaction?.data?.transactionStatus;
                                      if(status == 'PENDING_CLOSE' || status == 'CLOSED' || status == 'CANCELLED' || status == 'ABANDONED'
                                          || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
                                        context.read<PaymentScreenCubit>().setValidationError(MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.",[status,'SALE PAYMENT']));
                                        return;
                                      }
                                      _processCardPayment(paymentMethod, execContext);
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
                                _processCardPayment(paymentMethod, execContext);
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

  void _processCardPayment(PaymentModeContainerDTO? paymentMethod, ExecutionContextDTO execContext, {String paymentStatus = 'SALE_INITIATED'}) {
    final cardCubit = context.read<CardScreenCubit>();
    final isCurrentUserManager = context.read<PaymentScreenCubit>().state.isCurrentUserManager;
    final paymentMethodId = paymentMethod?.paymentModeId;
    final reference = _referenceController.text.toString();
    final amount = double.parse(_amountTextController.text.toString());
    final tenderAmt = context.read<PaymentScreenCubit>().state.tenderedAmount == 0 ? null : context.read<PaymentScreenCubit>().state.tenderedAmount.toString();
    CardPaymentRequest? cardPayment;
    if(paymentMethod?.allowCustomerToDecideEntryMode == true){
      showDialog(
          context: context, barrierDismissible: false, builder: (_) =>  PaymentModeSelectionDialog(
        onSwipeSelected: () {
          cardPayment = CardPaymentRequest(paymentId: -1, approverId: execContext.userPKId ?? -1,
            transactionId: -1, paymentModeId: paymentMethodId ?? -1, paymentStatusId: -1,
            creditCardNumber: _cardNoController.text.toString(), creditCardExpiry: _expiryController.text.toString(),
            creditCardName: _cardNameController.text.toString(), nameOnCreditCard: _cardNameController.text.toString(), tenderedAmount: tenderAmt,
            amount: amount, cashDrawerId: -1, tipAmount: 0.0, reference: reference, cardId: -1,
            ccResponseId: -1, paymentStatus: paymentStatus, isKeyedMode: false, isChanged: true, isChangedRecursive: true,
          );
        },
        onKeyedSelected:(){
          cardPayment = CardPaymentRequest(paymentId: -1, approverId: execContext.userPKId ?? -1,
            transactionId: -1, paymentModeId: paymentMethodId ?? -1, paymentStatusId: -1,
            creditCardNumber: _cardNoController.text.toString(), creditCardExpiry: _expiryController.text.toString(),
            creditCardName: _cardNameController.text.toString(), nameOnCreditCard: _cardNameController.text.toString(), tenderedAmount: tenderAmt,
            amount: amount, cashDrawerId: -1, tipAmount: 0.0, reference: reference, cardId: -1,
            ccResponseId: -1, paymentStatus: paymentStatus, isKeyedMode: true, isChanged: true, isChangedRecursive: true,
          );
        },
        onOkSelected: () {
          if(((widget.accessControlDTO?.managerApprovalRequired ?? false)) && !isCurrentUserManager) {
            _showManagerLoginPopup(onAuthSuccess: (managerApproverId) {
              cardPayment = cardPayment?.copyWith(approverId: managerApproverId);
              context.read<PaymentScreenCubit>().setLoadingStatus(status: 1, message: 'Adding payment...');
              if(paymentStatus == 'PRE_AUTHORIZATION_INITIATED') {
                cardCubit.addPreAuthPayment(widget.transactionData?.transactionId ?? -1, cardPayment!);
              } else if(paymentStatus == 'AUTHORIZATION_INITIATED') {
                cardCubit.addAuthPayment(widget.transactionData?.transactionId ?? -1, cardPayment!);
              } else {
                cardCubit.addCardPayment(widget.transactionData?.transactionId ?? -1, cardPayment!);
              }
            });
          } else {
            context.read<PaymentScreenCubit>().setLoadingStatus(status: 1, message: 'Adding payment...');
            if(paymentStatus == 'PRE_AUTHORIZATION_INITIATED') {
              cardCubit.addPreAuthPayment(widget.transactionData?.transactionId ?? -1, cardPayment!);
            } else if(paymentStatus == 'AUTHORIZATION_INITIATED') {
              cardCubit.addAuthPayment(widget.transactionData?.transactionId ?? -1, cardPayment!);
            } else {
              cardCubit.addCardPayment(widget.transactionData?.transactionId ?? -1, cardPayment!);
            }
          }
        },
      ));
    } else {
      CardPaymentRequest? cardPaymentRequest;
      cardPaymentRequest = CardPaymentRequest(paymentId: -1, approverId: execContext.userPKId ?? -1,
        transactionId: -1, paymentModeId: paymentMethodId ?? -1, paymentStatusId: -1,
        creditCardNumber: _cardNoController.text.toString(), creditCardExpiry: _expiryController.text.toString(),
        creditCardName: _cardNameController.text.toString(), nameOnCreditCard: _cardNameController.text.toString(), tenderedAmount: tenderAmt,
        amount: amount, cashDrawerId: -1, tipAmount: 0.0, reference: reference, cardId: -1,
        ccResponseId: -1, paymentStatus: paymentStatus, isKeyedMode: false, isChanged: true, isChangedRecursive: true,
      );

      if((widget.accessControlDTO?.managerApprovalRequired ?? false) && !isCurrentUserManager) {
        _showManagerLoginPopup(onAuthSuccess: (managerApproverId) {
          cardPaymentRequest = cardPaymentRequest?.copyWith(approverId: managerApproverId);
          context.read<PaymentScreenCubit>().setLoadingStatus(status: 1, message: 'Adding payment...');
          if(paymentStatus == 'PRE_AUTHORIZATION_INITIATED') {
            cardCubit.addPreAuthPayment(widget.transactionData?.transactionId ?? -1, cardPaymentRequest!);
          } else if(paymentStatus == 'AUTHORIZATION_INITIATED') {
            cardCubit.addAuthPayment(widget.transactionData?.transactionId ?? -1, cardPaymentRequest!);
          } else {
            cardCubit.addCardPayment(widget.transactionData?.transactionId ?? -1, cardPaymentRequest!);
          }
        });
      } else {
        context.read<PaymentScreenCubit>().setLoadingStatus(status: 1, message: 'Adding payment...');
        if(paymentStatus == 'PRE_AUTHORIZATION_INITIATED') {
          cardCubit.addPreAuthPayment(widget.transactionData?.transactionId ?? -1, cardPaymentRequest);
        } else if(paymentStatus == 'AUTHORIZATION_INITIATED') {
          cardCubit.addAuthPayment(widget.transactionData?.transactionId ?? -1, cardPaymentRequest);
        } else {
          cardCubit.addCardPayment(widget.transactionData?.transactionId ?? -1, cardPaymentRequest);
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
    _showNumberPadDialog();
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
          return Padding(
            padding: EdgeInsets.only(left: SizeConfig.getWidth(16), top: SizeConfig.getHeight(16), right: SizeConfig.getWidth(16), bottom: SizeConfig.blockSizeVertical * 10.8),
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(8),
              child: BlocProvider.value(
                    value: BlocProvider.of<CashScreenCubit>(context),
                    child: TenderScreen(initialAmt: double.parse(_amountTextController.text.toString()), totalAmt: double.parse(_amountTextController.text.toString()))),
            ),
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
}