import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_ui/manager_login_popup.dart';
import 'package:logs_data/logger.dart';
import 'package:messages_data/builder.dart';
import 'package:payment_data/builder.dart';
import 'package:payment_data/models/request/generic_payment/generic_payment_request.dart';
import 'package:payment_ui/cubits/payment_summary/cash_screen/cash_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/generic_screen/generic_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/generic_screen/generic_screen_state.dart';
import 'package:payment_ui/cubits/payment_summary/payment_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/payment_screen_state.dart';
import 'package:payment_ui/screens/payment_summary/payment_summary_screen.dart';
import 'package:payment_ui/screens/payment_summary/tender_screen.dart';
import 'package:payment_ui/utils/colors.dart';
import 'package:payment_ui/utils/common_widgets.dart';
import 'package:payment_ui/utils/extensions.dart';
import 'package:payment_ui/utils/styles.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/models/create_transaction/transaction_data.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:widgets_library/utils/keyboard_hider_widget.dart';

class GenericPaymentScreen extends StatefulWidget {
  final TransactionData? transactionData;
  final OnPaymentComplete onPaymentComplete;
  final PaymentAccessControlDTO? accessControlDTO;

  const GenericPaymentScreen({
    Key? key,
    required this.transactionData,
    required this.onPaymentComplete,
    this.accessControlDTO
  }) : super(key: key);

  @override
  State<GenericPaymentScreen> createState() => _GenericPaymentScreenState();
}

class _GenericPaymentScreenState extends State<GenericPaymentScreen> {

  final _amountTextController = TextEditingController();
  final _referenceController = TextEditingController();

  @override
  void initState() {
    Future.microtask(() => _showTenderPopup(context));
    Future.microtask(() => _initPaymentTotals());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return BlocConsumer<GenericScreenCubit, GenericScreenState>(builder: (ctx, state) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            const Spacer(),
            Visibility(
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
                      final genericCubit = context.read<GenericScreenCubit>();
                      final execContextBL = await ExecutionContextBuilder.build();
                      final execContext = execContextBL.getExecutionContext();
                      final paymentDataBL = await PaymentDataBuilder.build(execContext!);
                      genericCubit.setPaymentDataBL(paymentDataBL);
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
                        GenericPaymentRequest? genericPaymentRequest;
                        genericPaymentRequest = GenericPaymentRequest(paymentId: -1, approverId: execContext.userPKId ?? -1,
                            transactionId: -1, paymentModeId: paymentMethodId ?? -1,
                            amount: amount, cashDrawerId: -1, parentPaymentId: -1, tipAmount: 0.0,
                            tenderedAmount: tenderAmt, reference: reference
                        );

                        if((widget.accessControlDTO?.managerApprovalRequired ?? false) && !isCurrentUserManager) {
                          _showManagerLoginPopup(onAuthSuccess: (managerApproverId) {
                            genericPaymentRequest = genericPaymentRequest?.copyWith(approverId: managerApproverId);
                            context.read<PaymentScreenCubit>().setLoadingStatus(status: 1, message: 'Adding payment...');
                            genericCubit.addPayment(widget.transactionData?.transactionId ?? -1, genericPaymentRequest!);
                          });
                        } else {
                          context.read<PaymentScreenCubit>().setLoadingStatus(status: 1, message: 'Adding payment...');
                          genericCubit.addPayment(widget.transactionData?.transactionId ?? -1, genericPaymentRequest);
                        }
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
            })
          ],
        ),
      );
    }, listener: (context, state) {

      if(mounted) {
        if(state.transactionResponse != null) {
          final response = state.transactionResponse;
          context.read<GenericScreenCubit>().updateTransaction(null);
          final pendingTotal = (response?.data?.transactionNetAmount ?? 0) - (response?.data?.transactionPaymentTotal ?? 0);
          _amountTextController.text = pendingTotal.formatToDC();
          widget.onPaymentComplete(response);
        }

        if(state.apiError != null) {
          context.read<PaymentScreenCubit>().setApiError(state.apiError);
          Future.delayed(const Duration(milliseconds: 150), () {
            context.read<PaymentScreenCubit>().setLoadingStatus(status: 0);
          });
          context.read<GenericScreenCubit>().clearError();
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

  }

  double _getTotalAmount() {
    return (widget.transactionData?.transactionNetAmount ?? 0);
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
