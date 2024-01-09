import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:instant/instant.dart';
import 'package:login_ui/manager_login_popup.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:messages_data/builder.dart';
import 'package:payment_data/models/coupon_details/coupon_details_response.dart';
import 'package:payment_data/models/request/coupon_payment/coupon_payment_request.dart';
import 'package:payment_ui/cubits/payment_summary/cash_screen/cash_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/payment_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/payment_screen_state.dart';
import 'package:payment_ui/cubits/payment_summary/voucher_screen/voucher_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/voucher_screen/voucher_screen_state.dart';
import 'package:payment_ui/screens/payment_summary/payment_summary_screen.dart';
import 'package:payment_ui/screens/payment_summary/tender_screen.dart';
import 'package:payment_ui/screens/payment_summary/widgets/coupon_number_popup.dart';
import 'package:payment_ui/utils/colors.dart';
import 'package:payment_ui/utils/common_widgets.dart';
import 'package:payment_ui/utils/extensions.dart';
import 'package:payment_ui/utils/styles.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/models/create_transaction/transaction_data.dart';
import 'package:widgets_library/generic_dialog.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:widgets_library/utils/time_zones.dart';

class VoucherScreen extends StatefulWidget {
  final TransactionData? transactionData;
  final OnPaymentComplete onPaymentComplete;
  final PaymentAccessControlDTO? accessControlDTO;

  const VoucherScreen({
    Key? key,
    required this.transactionData,
    required this.onPaymentComplete,
    this.accessControlDTO
  }) : super(key: key);

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {

  final _amountTextController = TextEditingController();
  final _couponValTextController = TextEditingController();
  final _referenceController = TextEditingController();
  bool _isNumberPadShown = false;
  final enteredCouponNumber = ValueNotifier<String?>(null);
  final validatedCouponNumber = ValueNotifier<String?>(null);
  final couponDetails = ValueNotifier<CouponDetailsResponse?>(null);
  String? _timeZoneName;

  @override
  void initState() {
    Future.microtask(() => _showVoucherDialog());
    Future.microtask(() => _initPaymentTotals());
    Future.microtask(() => _initTimeZone());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return BlocConsumer<VoucherScreenCubit, VoucherScreenState>(builder: (ctx, state) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(12)),
        child: ValueListenableBuilder(
          valueListenable: couponDetails,
          builder: (context, couponData, _) => Column(
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
              SizedBox(height: SizeConfig.getHeight(24)),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(MessagesProvider.get('Coupon Value'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w500) ?? tsS16W70016),
                        SizedBox(height: SizeConfig.getHeight(12)),
                        SizedBox(
                          height: SizeConfig.getHeight(40),
                          child: ValueListenableBuilder(
                            valueListenable: validatedCouponNumber,
                            builder: (context, value, _) => amountTextField(
                                controller: _couponValTextController,
                                onTap: () {
                                  _showNumberPadDialog(isFromCouponText: true);
                                },
                                borderColor: theme.sideNavListBGSelectedState ?? colorBlack3D,
                                textStyle: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w500) ?? tsS14W50016),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: SizeConfig.getSize(16)),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(MessagesProvider.get('Is Taxable?'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w500) ?? tsS16W70016),
                        SizedBox(height: SizeConfig.getHeight(12)),
                        Padding(
                          padding: EdgeInsets.only(left: SizeConfig.getSize(16)),
                          child: InkWell(
                            onTap: () {
                              if(state.isTaxableSelected) {
                                context.read<VoucherScreenCubit>().setTaxableStatus(false);
                              } else {
                                context.read<VoucherScreenCubit>().setTaxableStatus(true);
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
                                child: state.isTaxableSelected ? Image.asset("assets/ic_check.png", color: theme.secondaryColor) : const SizedBox(),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: SizeConfig.getHeight(24)),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(MessagesProvider.get('* Coupon Number'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
                        SizedBox(height: SizeConfig.getHeight(12)),
                        InkWell(
                          onTap: () {
                            _showVoucherDialog();
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
                                  ValueListenableBuilder(
                                      valueListenable: validatedCouponNumber,
                                      builder: (context, value, _) => Text(validatedCouponNumber.value ?? '', style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS14W50016))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: SizeConfig.getSize(16)),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(MessagesProvider.get('Coupon Amount'), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS16W70016),
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
                                Text(_getCouponAmount(couponData), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)) ?? tsS14W50016)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
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
                        final cubit = context.read<VoucherScreenCubit>();
                        final execContextBL = await ExecutionContextBuilder.build();
                        final execContext = execContextBL.getExecutionContext();
                        final reference = _referenceController.text.toString();
                        if(mounted) {
                          final paymentMethod = context.read<PaymentScreenCubit>().state.selectedPayMode;
                          final isCurrentUserManager = context.read<PaymentScreenCubit>().state.isCurrentUserManager;
                          final paymentMethodId = paymentMethod?.paymentModeId;
                          if(paymentMethod?.paymentReferenceMandatory == true) {
                            if(reference.isEmpty) {
                              context.read<PaymentScreenCubit>().setNotificationMessage(MessagesProvider.get('Payment Reference is Mandatory. Please enter Payment Reference to complete the transaction.'));
                              return;
                            }
                          }
                          if(validatedCouponNumber.value == null) {
                            context.read<PaymentScreenCubit>().setNotificationMessage('');
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext ctx) {
                                  return GenericDialog(
                                    onTapOk: () {
                                      Future.microtask(() => _showVoucherDialog());
                                    },
                                    isSingleBtnMode: true,
                                    onTapYes: () {},
                                    onTapNo: () {}, title: MessagesProvider.get('Coupon Details Mandatory').toUpperCase(),
                                    msg: MessagesProvider.get('Cannot proceed. Please enter Coupon Details'),
                                  );
                                });
                            return;
                          }
                          final transaction = context.read<PaymentScreenCubit>().state.transactionResponse;
                          final status = transaction?.data?.transactionStatus;
                          if(status == 'CLOSED' || status == 'CANCELLED' || status == 'ABANDONED' || status == 'PENDING_CLOSE' || status == 'REVERSED') {
                            context.read<PaymentScreenCubit>().setValidationError(MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.",[status,'ADD PAYMENT']));
                            return;
                          }
                          CouponPaymentRequest? request;
                          final couponDTO = couponDetails.value?.data?.first;
                          final updateReference = reference.isEmpty ? (validatedCouponNumber.value ?? '') : reference;
                          final currentZone = curDateTimeByZone(zone: _timeZoneName ?? 'GMT');
                          String dateTime = currentZone.toIso8601String();
                          request = CouponPaymentRequest(paymentId: -1, approverId: execContext?.userPKId ?? -1, tenderedAmount: amount,
                              transactionId: context.read<PaymentScreenCubit>().state.transactionResponse?.data?.transactionId ?? -1, paymentModeId: paymentMethodId ?? -1, amount: amount, reference: updateReference,
                              couponSetId: couponDTO?.couponSetId ?? -1, couponNumber: validatedCouponNumber.value ?? '', cpConsumptionId: -1,
                              isTaxable: state.isTaxableSelected, couponValue: couponDTO?.couponValue ?? 0, paymentStatusId: -1, paymentDate: dateTime,
                              paymentStatus: 'AUTHORIZATION_INITIATED', isChanged: true, isChangedRecursive: true);

                          if((widget.accessControlDTO?.managerApprovalRequired ?? false) && !isCurrentUserManager) {
                            _showManagerLoginPopup(onAuthSuccess: (managerApproverId) {
                              request = request?.copyWith(approverId: managerApproverId);
                              context.read<PaymentScreenCubit>().setLoadingStatus(status: 1, message: 'Adding payment...');
                              cubit.addPayment(widget.transactionData?.transactionId ?? -1, request!);
                            });
                          } else {
                            context.read<PaymentScreenCubit>().setLoadingStatus(status: 1, message: 'Adding payment...');
                            cubit.addPayment(widget.transactionData?.transactionId ?? -1, request);
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
        ),
      );
    }, listener: (context, state) {

      if(mounted) {

        if(!state.isLoading) {
          if(state.transactionResponse != null) {
            final response = state.transactionResponse;
            context.read<VoucherScreenCubit>().updateTransaction(null);
            final pendingTotal = (response?.data?.transactionNetAmount ?? 0) - (response?.data?.transactionPaymentTotal ?? 0);
            _amountTextController.text = pendingTotal.formatToDC();
            widget.onPaymentComplete(response);
          }

          if(state.couponDetails != null) {
            validatedCouponNumber.value = enteredCouponNumber.value;
            context.read<PaymentScreenCubit>().setNotificationMessage('');
            _couponValTextController.text = _getCouponAmount(state.couponDetails);
            Future.delayed(const Duration(milliseconds: 150), () {
              context.read<PaymentScreenCubit>().setLoadingStatus(status: 0);
              couponDetails.value = state.couponDetails;
              context.read<VoucherScreenCubit>().updateCouponDetails(null);
            });
            Future.delayed(const Duration(milliseconds: 250), () {
              if(!_isNumberPadShown) {
                _showNumberPadDialog();
              }
            });
          }
        }

        if(state.apiError != null) {
          context.read<PaymentScreenCubit>().setApiError(state.apiError);
          Future.delayed(const Duration(milliseconds: 150), () {
            context.read<PaymentScreenCubit>().setLoadingStatus(status: 0);
          });
          context.read<VoucherScreenCubit>().setApiError(null);
        }

        if(state.validationError != null) {
          _clearCouponDetails();
          context.read<PaymentScreenCubit>().setNotificationMessage(state.validationError, isErrorMode: true);
          Future.delayed(const Duration(milliseconds: 150), () {
            context.read<PaymentScreenCubit>().setLoadingStatus(status: 0);
          });
          context.read<VoucherScreenCubit>().setValidationError(null);
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
    _isNumberPadShown = false;
    if(widget.transactionData?.transactionPaymentDTOList.isNotEmpty == true) {
      final pendingTotal = _getTotalAmount() - (widget.transactionData?.transactionPaymentTotal ?? 0);
      _amountTextController.text = pendingTotal.formatToDC();
    } else {
      final amount = _getTotalAmount();
      _amountTextController.text = amount.formatToDC();
    }
    _couponValTextController.text = '0';
  }

  void _initTimeZone() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    final sites = await masterDataBL.getSites();

    final item = sites?.data?.siteContainerDTOList
        .where((element) => element.siteId == execContextDTO.siteId);
    if (item?.isNotEmpty == true) {
      final zone = item!.first.timeZoneName;
      _timeZoneName = timeZoneMap[zone];
    }
  }

  double _getTotalAmount() {
    return (widget.transactionData?.transactionNetAmount ?? 0);
  }

  void _showNumberPadDialog({isFromCouponText = false}) {
    _isNumberPadShown = true;
    var amount = 0.0;
    try {
      if(isFromCouponText) {
        amount = double.parse(_couponValTextController.text);
      } else {
        amount = double.parse(_amountTextController.text);
      }

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
              if(isFromCouponText) {
                _couponValTextController.text = amt.formatToDC();
              }
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
          if(!_isNumberPadShown) {
            Future.microtask(() => _showNumberPadDialog());
          }
        });
      }
    } else {
      if(!_isNumberPadShown) {
        Future.microtask(() => _showNumberPadDialog());
      }
    }
  }

  Future<void> _showVoucherDialog() async {
    context.read<PaymentScreenCubit>().setNotificationMessage('');
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return CouponNumberPopup(
            onCouponEntered: (coupon) {
              final paymentMethod = context.read<PaymentScreenCubit>().state.selectedPayMode;
              enteredCouponNumber.value = coupon.toUpperCase();
              Future.delayed(const Duration(milliseconds: 200), () {
                context.read<PaymentScreenCubit>().setLoadingStatus(status: 1, message: 'Fetching coupon details...');
                context.read<VoucherScreenCubit>().fetchCouponInfo(coupon, paymentMethod?.paymentModeId ?? -1);
              });
            },
            onCancelClicked: () {
              _clearCouponDetails();
              _showTenderPopup(context);
            },
          );
        });
  }

  String _getCouponAmount(CouponDetailsResponse? couponDetails) {
    if(couponDetails?.data?.isNotEmpty == true) {
      return couponDetails!.data!.first.couponValue.formatToDC();
    } else {
      return '0';
    }
  }

  void _clearCouponDetails() {
    _couponValTextController.text = '0';
    validatedCouponNumber.value = null;
    enteredCouponNumber.value = null;
    couponDetails.value = null;
  }
}
