import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:customer_ui/providers/SelectedCardDetailsProvider.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_ui/manager_login_popup.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:payment_data/builder.dart';
import 'package:payment_data/models/request/card_payment/card_payment_request.dart';
import 'package:payment_ui/cubits/payment_summary/cash_screen/cash_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/debit_screen/semnox_debit_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/debit_screen/semnox_debit_state.dart';
import 'package:payment_ui/cubits/payment_summary/payment_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/payment_screen_state.dart';
import 'package:payment_ui/screens/payment_summary/payment_summary_screen.dart';
import 'package:payment_ui/screens/payment_summary/tender_screen.dart';
import 'package:payment_ui/screens/payment_summary/widgets/card_entry_popup.dart';
import 'package:payment_ui/utils/colors.dart';
import 'package:payment_ui/utils/common_widgets.dart';
import 'package:payment_ui/utils/extensions.dart';
import 'package:payment_ui/utils/styles.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/models/create_transaction/transaction_data.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:widgets_library/cubits/device_interface_cubit.dart';
import 'package:widgets_library/cubits/device_interface_state.dart';

class SemnoxDebitScreen extends StatefulWidget {
  final TransactionData? transactionData;
  final OnPaymentComplete onPaymentComplete;
  final VoidCallback onClearErrorMessage;
  final PaymentAccessControlDTO? accessControlDTO;

  const SemnoxDebitScreen({
    Key? key,
    required this.transactionData,
    required this.onPaymentComplete,
    required this.onClearErrorMessage,
    this.accessControlDTO
  }) : super(key: key);

  @override
  State<SemnoxDebitScreen> createState() => _SemnoxDebitScreenState();
}

class _SemnoxDebitScreenState extends State<SemnoxDebitScreen> {

  final _amountTextController = TextEditingController();
  final _referenceController = TextEditingController();
  final cardDetails = ValueNotifier<AccountDetailsData?>(null);
  final NFCManager nfcManager = NFCManager();
  late Stream<NFCReadData> nfcReadDataStream;
  bool isNfcAvailable = false;
  bool autoLoadGameCard = false;
  bool manualCardEntryEnabled = true;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 200),() => _showTenderPopup(context));
    Future.microtask(() => _initPaymentTotals());
    Future.microtask(() => _checkAutoLoadGameConfig());
    Future.microtask(() async {
      isNfcAvailable = await nfcManager.isNfcAvailable();
      if(isNfcAvailable) {
        _startListeningForCardTaps();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if(isNfcAvailable) {
      nfcManager.stop();
    }
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return BlocConsumer<SemnoxDebitCubit, SemnoxDebitState>(builder: (ctx, state) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(12)),
        child: ValueListenableBuilder(
          valueListenable: cardDetails,
          builder: (context, cardData, _) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: SizeConfig.getHeight(40),
                      child: amountTextField(controller: _amountTextController, onTap: () {
                        _showNumberPadDialog();
                      },borderColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                          textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w500) ?? tsS14W50016),
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.getHeight(12)),
              Text(MessagesProvider.get('Reference'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
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
              SizedBox(height: SizeConfig.getHeight(32)),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('', style: tsS22W70016.copyWith(fontSize: SizeConfig.getFontSize(28))),
                        SizedBox(height: SizeConfig.getHeight(12)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(MessagesProvider.get('Tap Card'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(28)) ?? tsS22W70016),
                            SizedBox(width: SizeConfig.getWidth(12)),
                            Text(MessagesProvider.get('or'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(28)) ?? tsS22W70016),
                          ],
                        ),
                        SizedBox(height: SizeConfig.getHeight(24)),
                        Text(MessagesProvider.get('Available'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
                        SizedBox(height: SizeConfig.getHeight(12)),
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
                                Text((cardData?.totalCreditPlusBalance ?? 0).formatToDC(), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w500) ?? tsS14W50016)
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(MessagesProvider.get('Enter Card Number'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
                        SizedBox(height: SizeConfig.getHeight(12)),
                        InkWell(
                          onTap: () {
                            if(!manualCardEntryEnabled) {
                              return;
                            }
                            widget.onClearErrorMessage();
                            context.read<SemnoxDebitCubit>().resetCardInfo();
                            cardDetails.value = null;
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (ctx) {
                                return CardEntryPopup(
                                  onCardNumEntered: (cardNo) {
                                    Future.delayed(const Duration(milliseconds: 300), () {
                                      context.read<PaymentScreenCubit>().setLoadingStatus(status: 1, message: 'Fetching card details...');
                                      context.read<SemnoxDebitCubit>().fetchCardInfo(cardNo);
                                    });
                                  },
                                );
                              },
                            );
                          },
                          child: Container(
                            height: SizeConfig.getHeight(40),
                            padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(12)),
                            decoration: BoxDecoration(
                                color: theme.footerBG1 ?? colorBlueF7,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Text(cardData?.tagNumber ?? '', style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS14W50016)
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.getHeight(24)),
                        Text(MessagesProvider.get('Balance'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
                        SizedBox(height: SizeConfig.getHeight(12)),
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
                                Text(_getBalance(cardData?.totalCreditPlusBalance ?? 0).formatToDC(), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS14W50016)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Visibility(
                visible: widget.accessControlDTO?.shouldDisplayTask ?? true,
                child: containerButton(
                    text: MessagesProvider.get('APPLY'),
                    textStyle:  theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(22), fontWeight: FontWeight.w500, color: Colors.white) ?? tsS16W500FF,
                    height: SizeConfig.getHeight(52),
                    cornerRadius: 6,
                    width: SizeConfig.blockSizeHorizontal * 50,
                    onTapped: () async {
                      if(!(widget.accessControlDTO?.isTaskEnabled ?? false)) {
                        return;
                      }
                      widget.onClearErrorMessage();
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
                        if(cardData != null) {
                          final semnoxDebitCubit = context.read<SemnoxDebitCubit>();
                          final execContextBL = await ExecutionContextBuilder.build();
                          final execContext = execContextBL.getExecutionContext();
                          final paymentDataBL = await PaymentDataBuilder.build(execContext!);
                          semnoxDebitCubit.setPaymentDataBL(paymentDataBL);
                          final reference = _referenceController.text.toString();
                          if(mounted) {
                            final paymentMethod = context.read<PaymentScreenCubit>().state.selectedPayMode;
                            final isCurrentUserManager = context.read<PaymentScreenCubit>().state.isCurrentUserManager;
                            final paymentMethodId = paymentMethod?.paymentModeId;
                            final tenderAmt = context.read<PaymentScreenCubit>().state.tenderedAmount == 0 ? null : context.read<PaymentScreenCubit>().state.tenderedAmount.toString();
                            if(paymentMethod?.paymentReferenceMandatory == true) {
                              if(reference.isEmpty) {
                                context.read<PaymentScreenCubit>().setNotificationMessage(MessagesProvider.get('Payment Reference is Mandatory. Please enter Payment Reference to complete the transaction.'));
                                return;
                              }
                            }
                            final transaction = context.read<PaymentScreenCubit>().state.transactionResponse;
                            final status = transaction?.data?.transactionStatus;
                            if(status == 'CLOSED' || status == 'CANCELLED' || status == 'ABANDONED' || status == 'PENDING_CLOSE' || status == 'REVERSED') {
                              context.read<PaymentScreenCubit>().setValidationError(MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.",[status,'ADD PAYMENT']));
                              return;
                            }
                            CardPaymentRequest? cardPaymentRequest;
                            cardPaymentRequest = CardPaymentRequest(paymentId: -1, approverId: execContext.userPKId ?? -1,
                              transactionId: -1, paymentModeId: paymentMethodId ?? -1, paymentStatusId: -1, tenderedAmount: tenderAmt,
                              amount: amount, cashDrawerId: -1, tipAmount: 0.0, reference: reference, cardId: cardData.accountId ?? -1,
                              ccResponseId: -1, paymentStatus: 'SALE_INITIATED', isKeyedMode: true, isChanged: true, isChangedRecursive: true,
                            );

                            if((widget.accessControlDTO?.managerApprovalRequired ?? false) && !isCurrentUserManager) {
                              _showManagerLoginPopup(onAuthSuccess: (managerApproverId) {
                                cardPaymentRequest = cardPaymentRequest?.copyWith(approverId: managerApproverId);
                                context.read<PaymentScreenCubit>().setLoadingStatus(status: 1, message: 'Adding payment...');
                                semnoxDebitCubit.addPayment(widget.transactionData?.transactionId ?? -1, cardPaymentRequest!);
                              });
                            } else {
                              context.read<PaymentScreenCubit>().setLoadingStatus(status: 1, message: 'Adding payment...');
                              semnoxDebitCubit.addPayment(widget.transactionData?.transactionId ?? -1, cardPaymentRequest);
                            }
                          }
                        } else {
                          final paymentCubit = context.read<PaymentScreenCubit>();
                          paymentCubit.setNotificationMessage(MessagesProvider.get('Please Tap an Issued Card...'), isErrorMode: true);
                        }
                      } else {
                        final paymentCubit = context.read<PaymentScreenCubit>();
                        paymentCubit.setValidationError(MessagesProvider.get('Cannot proceed. Payment Amount is 0.'));
                      }
                    }, buttonColor: (widget.accessControlDTO?.isTaskEnabled ?? false) ? (theme.button2InnerShadow1 ?? colorBlack) : (theme.button2InnerShadow1?.withOpacity(0.5) ?? colorBlack.withOpacity(0.5))
                ),
              ),
              SizedBox(height: SizeConfig.getHeight(8)),
              BlocConsumer<PaymentScreenCubit, PaymentScreenState>(builder: (ctx, state) => const SizedBox(), listener: (ctx, state) {
                if(state.transactionResponse != null) {
                  if(state.isPaymentRefreshed) {
                    final pendingTotal = (state.transactionResponse?.data?.transactionNetAmount ?? 0) - (state.transactionResponse?.data?.transactionPaymentTotal ?? 0);
                    _amountTextController.text = pendingTotal.formatToDC();
                  }
                }
              }),
              BlocConsumer<DeviceInterfaceCubit, DeviceInterfaceState>(builder: (ctx, state) => const SizedBox(), listener: (ctx, state) {
                if(state.barCodeResult != null) {
                  context.read<PaymentScreenCubit>().setLoadingStatus(status: 1, message: 'Fetching card details...');
                  context.read<SemnoxDebitCubit>().fetchCardInfo(state.barCodeResult!);
                }
              })
            ],
          ),
        ),
      );
    }, listener: (context, state) {

      if(mounted) {

        if(!state.isLoading) {
          if(state.transactionResponse != null) {
            final response = state.transactionResponse;
            context.read<SemnoxDebitCubit>().updateTransaction(null);
            final pendingTotal = (response?.data?.transactionNetAmount ?? 0) - (response?.data?.transactionPaymentTotal ?? 0);
            _amountTextController.text = pendingTotal.formatToDC();
            widget.onPaymentComplete(response);
          }

          if(state.cardDetails != null) {
            cardDetails.value = state.cardDetails;
            context.read<SemnoxDebitCubit>().resetCardInfo();
            _startListeningForCardTaps();
            Future.delayed(const Duration(milliseconds: 150), () {
              if(context.read<PaymentScreenCubit>().state.loadingStatus == 1) {
                context.read<PaymentScreenCubit>().setLoadingStatus(status: 0);
              }
            });
          }
        }

        if(state.apiError != null) {
          context.read<PaymentScreenCubit>().setNotificationMessage(state.apiError, isErrorMode: true);
          _startListeningForCardTaps();
          Future.delayed(const Duration(milliseconds: 150), () {
            if(context.read<PaymentScreenCubit>().state.loadingStatus == 1) {
              context.read<PaymentScreenCubit>().setLoadingStatus(status: 0);
            }
          });
          context.read<SemnoxDebitCubit>().clearError();
        }
      }

    },);
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

  Future<void> _initPaymentTotals() async {

    if(widget.transactionData?.transactionPaymentDTOList.isNotEmpty == true) {
      final pendingTotal = _getTotalAmount() - (widget.transactionData?.transactionPaymentTotal ?? 0);
      _amountTextController.text = pendingTotal.formatToDC();
    } else {
      final amount = _getTotalAmount();
      _amountTextController.text = amount.formatToDC();
    }
    _showNumberPadDialog();
  }

  double _getTotalAmount() {
    return (widget.transactionData?.transactionNetAmount ?? 0);
  }

  double _getBalance(double total) {
    final currTotal = _amountTextController.text.isNotEmpty ? double.parse(_amountTextController.text) : 0;
    final balance = total - currTotal;
    return balance >= 0 ? balance : 0;
  }

  _startListeningForCardTaps() async {
    nfcReadDataStream = nfcManager.startScan();
    nfcReadDataStream.listen((data) {
      nfcManager.stop();
      String cardId = data.readableData;
      if (cardId.length != 8) {

      } else {
        if(mounted) {
          context.read<PaymentScreenCubit>().setLoadingStatus(status: 1, message: 'Fetching card details...');
          context.read<SemnoxDebitCubit>().fetchCardInfo(cardId);
        }
      }
    });
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

  Future<void> _checkAutoLoadGameConfig() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    var autoLoadGameValue = await masterDataBL.getDefaultValuesByName(defaultValueName: 'AUTOLOAD_GAMECARD_IN_PAYMENT_SCREEN');
    var manualCardEntryValue = await masterDataBL.getDefaultValuesByName(defaultValueName: 'ENABLE_GAMECARD_KEYIN_FOR_PAYMENT');
    autoLoadGameCard = autoLoadGameValue == 'Y';
    manualCardEntryEnabled = manualCardEntryValue == 'Y';
    if(autoLoadGameCard) {
      if(mounted) {
        final semnoxDebitCubit = context.read<SemnoxDebitCubit>();
        final selectedCard = context.read<SelectedCardDetails>().data;
        if(selectedCard != null && selectedCard.accountId != -1) {
          semnoxDebitCubit.updateCardInfo(selectedCard);
        }
      }
    }
  }

}
