import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:master_data/builder.dart';
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/action_btns.dart';
import 'package:other_function_ui/widgets/colors.dart';
import 'package:other_function_ui/widgets/of_content_widgets/general/common_card_form.dart';
import 'package:other_function_ui/widgets/of_content_widgets/holdEntitlements/card_details_container.dart';
import 'package:other_function_ui/widgets/of_content_widgets/refund_card/refund_tab_bar.dart';
import 'package:other_function_ui/widgets/of_content_widgets/refund_card/refund_tab_view.dart';
import 'package:other_function_ui/widgets/of_header.dart';
import 'package:other_function_ui/widgets/remark_widget.dart';
import 'package:other_function_ui/widgets/text_style.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';

class RefundCardDialog extends StatefulWidget {
  final Function? onSuccessShowNotification;
  final Function? onFailureShowNotification;
  const RefundCardDialog({
    super.key,
    this.onSuccessShowNotification,
    this.onFailureShowNotification,
  });

  @override
  State<RefundCardDialog> createState() => _RefundCardDialogState();
}

class _RefundCardDialogState extends State<RefundCardDialog> {
  late NotificationBar notificationBar;
  final ScrollController _formScrollController = ScrollController();
  String tabView = 'refund';
  bool _isNFCAvailable = false;
  final bool _isChecked = false;

  @override
  void initState() {
    notificationBar = NotificationBar(showHideSideBar: false);
    context.read<OtherFunctionBloc>().add(ClearEvent());
    Future.microtask(() async {
      _isNFCAvailable = await NFCManager().isNfcAvailable();
      await checkRefundDefaults();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          color: Colors.green,
          child: notificationBar,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OfHeader(
              header: MessagesProvider.get('Refund\ncards').toUpperCase(),
              isHeader: true,
              isDeactivate:true,
              shouldDisplayCardDetails: false,

          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.backGroundColor,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(6),
                            bottomRight: Radius.circular(6)),
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight:
                                MediaQuery.of(context).size.height * 0.6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const Spacer(),
                            Expanded(
                              flex: 8,
                              child: Scroller(
                                controller: _formScrollController,
                                child: SingleChildScrollView(
                                  controller: _formScrollController,
                                  scrollDirection: Axis.vertical,
                                  child: Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: theme.backGroundColor,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RefundTabBar(
                                            tabView: tabView,
                                            cardTapFunction: () {
                                              if (tabView == 'Tap') {
                                                showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return CommonCardForDialog(
                                                      otherFunctionBloc:
                                                          context.read<
                                                              OtherFunctionBloc>(),
                                                      isNFCAvailable:
                                                          _isNFCAvailable,
                                                      isDeactivate: true,
                                                    );
                                                  },
                                                );
                                              }
                                              setState(() {
                                                tabView = 'Tap';
                                              });
                                            },
                                            refundTapFunction: () {
                                              setState(() {
                                                tabView = 'refund';
                                              });
                                            },
                                          ),
                                          BlocBuilder<OtherFunctionBloc,
                                              OtherFunctionState>(
                                            builder: (context, state) {
                                              OtherFunctionBloc
                                                  otherFunctionBloc =
                                                  context.read<
                                                      OtherFunctionBloc>();
                                              if (state
                                                      is DeactivateCardListState ||
                                                  otherFunctionBloc
                                                      .showChildCards) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 8.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                          'Tapped Cards: ',
                                                          style: KTextStyle.smallBlackText.copyWith(color: theme.primaryOpposite)),
                                                      SizedBox(width: SizeConfig.getSize(8)),
                                                      Row(
                                                        children: otherFunctionBloc.deactivatedCardList?.map<Widget>((e) {
                                                          if (otherFunctionBloc.deactivatedCardList?.indexOf(e) == ((otherFunctionBloc.deactivatedCardList?.length ?? 0) - 1)) {
                                                            ///last element
                                                            return Text(
                                                                '${e.data?.first.tagNumber}',
                                                                style: KTextStyle.smallBlackText.copyWith(color: theme.primaryOpposite, fontWeight: FontWeight.w400));
                                                          } else {
                                                            return Text(
                                                                '${e.data?.first.tagNumber}, ',
                                                                style: KTextStyle.smallBlackText.copyWith(color: theme.primaryOpposite, fontWeight: FontWeight.w400));
                                                          }
                                                        }).toList() ?? [],
                                                      )
                                                    ],
                                                  ),
                                                );
                                              }
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Text('Cards Tapped(0)',
                                                    style: theme.subtitle3),
                                              );
                                            },
                                          ),
                                          const SizedBox(height: 5),
                                          tabView == 'Tap'
                                              ? BlocConsumer<OtherFunctionBloc,
                                                  OtherFunctionState>(
                                                  listener: (context, state) {
                                                    OtherFunctionBloc
                                                        otherFunctionBloc =
                                                        context.read<
                                                            OtherFunctionBloc>();
                                                    if (state
                                                        is DeactivateCardListState) {
                                                      // widget.notificationBar.showMessage(
                                                      //     MessagesProvider.get('Cards Added Successfully'),
                                                      //     KColor.notificationBGLightBlueColor);
                                                      notificationBar.showMessage(
                                                          '',
                                                          theme.primaryColor!);
                                                      loader.hideLoaderDialog(
                                                          context);
                                                    } else if (state
                                                        is SuccessState) {
                                                      if(!otherFunctionBloc.isRefundOngoing) {
                                                        loader.hideLoaderDialog(
                                                            context);
                                                        notificationBar
                                                            .showMessage(
                                                            "", Colors.white);
                                                      }
                                                    } else if (state
                                                        is ClearState) {
                                                      otherFunctionBloc
                                                          .selectedAccounts
                                                          .clear();
                                                      otherFunctionBloc
                                                          .deactivatedCardList
                                                          ?.clear();
                                                      otherFunctionBloc
                                                          .isAdded = false;
                                                      otherFunctionBloc
                                                              .showChildCards =
                                                          false;
                                                    }
                                                  },
                                                  builder: (context, state) {
                                                    OtherFunctionBloc
                                                        otherFunctionBloc =
                                                        context.read<
                                                            OtherFunctionBloc>();
                                                    if (state
                                                            is DeactivateCardListState ||
                                                        otherFunctionBloc
                                                            .showChildCards) {
                                                      return Wrap(
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        spacing: 10,
                                                        runSpacing: 10,
                                                        children: [
                                                          ...otherFunctionBloc
                                                              .deactivatedCardList!
                                                              .map(
                                                            (e) => Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                              child:
                                                                  CardDetailsContainer(
                                                                isAdded:
                                                                    otherFunctionBloc
                                                                        .isAdded,
                                                                itemIndex:
                                                                    otherFunctionBloc
                                                                        .deactivatedCardList
                                                                        ?.indexOf(
                                                                            e),
                                                                isRefund: true,
                                                                itemLength:
                                                                    otherFunctionBloc
                                                                        .deactivatedCardList
                                                                        ?.length,
                                                                data: e.data
                                                                    ?.first,
                                                                dateFormat:
                                                                    otherFunctionBloc
                                                                        .dateTimeFormat,
                                                                onDelete: () {
                                                                  setState(() {
                                                                    otherFunctionBloc.removeRefundValue(e);
                                                                    otherFunctionBloc.deactivatedCardList?.removeWhere((element) =>
                                                                        element
                                                                            .data
                                                                            ?.first
                                                                            .accountId ==
                                                                        e
                                                                            .data
                                                                            ?.first
                                                                            .accountId);
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      );
                                                    }
                                                    return Container();
                                                  },
                                                )
                                              : RefundWidget(
                                                  isChecked: _isChecked),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // const Spacer(),
                            const RemarkWidget(
                                showText: false, showRemark: true),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BlocConsumer<OtherFunctionBloc,
                                  OtherFunctionState>(
                                listener: (context, state) {
                                  final otherFunctionBloc =
                                      context.read<OtherFunctionBloc>();
                                  if (state is SuccessState) {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback(
                                      (_) {
                                        widget.onSuccessShowNotification!(
                                            "${state.message}");
                                        notificationBar.showMessage(
                                            state.message ?? '',
                                            theme.footerBG4!);
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  } else if (state is ErrorState) {
                                    if (state.message == 'Please Tap card') {
                                      notificationBar.showMessage(
                                          state.message, theme.footerBG5!);
                                    } else if (state.message ==
                                        MessagesProvider.get(
                                            'Please tap an issued Child Card')) {
                                      Navigator.of(context).pop();
                                      notificationBar.showMessage(
                                          MessagesProvider.get(
                                              'Please tap an issued Card'),
                                          theme.footerBG5!);
                                    } else if (state.message ==
                                        MessagesProvider.get(
                                            'Invalid Card Number length (&1). Should be &2',
                                            [
                                              '${otherFunctionBloc.cardController.text.length}',
                                              '8'
                                            ])) {
                                      notificationBar.showMessage(state.message,
                                          state.color ?? Colors.red);
                                    } else {
                                      Navigator.of(context).pop();
                                      otherFunctionBloc.cardController.clear();
                                      notificationBar.showMessage(state.message,
                                          state.color ?? Colors.red);
                                    }
                                  } else if (state is ApiErrorState) {
                                    Navigator.pop(context);
                                    if (state.message ==
                                        "Redemption value is 0\r\n") {
                                      notificationBar.showMessage(
                                          "Something went wrong. Please try again. ${state.message}",
                                          state.color ??
                                              KColor.notificationBGRedColor);
                                    } else {
                                      notificationBar.showMessage(
                                          state.message,
                                          state.color ??
                                              KColor.notificationBGRedColor);
                                    }
                                  } else if (state is ClearState) {
                                    otherFunctionBloc.cardDeposit = 0.0;
                                    otherFunctionBloc.creditPlus = 0.0;
                                    otherFunctionBloc.refundValue.value = 0.0;
                                    otherFunctionBloc.refundApiValue = 0.0;
                                    otherFunctionBloc.deactivatedCardList
                                        ?.clear();
                                    notificationBar.showMessage(
                                        "", theme.primaryColor!);
                                    otherFunctionBloc.redeemTickets.value = 0.0;
                                  } else if (state is CardDetailsState) {
                                    notificationBar.showMessage(
                                        "", theme.primaryColor!);
                                  } else if (state is DeactivateCardListState) {
                                    Navigator.pop(context);
                                    notificationBar.showMessage("", theme.primaryColor!);
                                  }
                                },
                                builder: (context, state) {
                                  if (state is BodyLoader) {
                                    Future.microtask(
                                        () => loader.showLoaderDialog(context));
                                  }
                                  if (state is UpdateDisplayState) {
                                    context.read<OtherFunctionBloc>().display =
                                        context
                                                .read<OtherFunctionBloc>()
                                                .accounts
                                                ?.data
                                                ?.first
                                                .totalTicketsBalance ??
                                            0.0;
                                  }
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      OfActionBtns(
                                        onClick: () {
                                          context
                                              .read<OtherFunctionBloc>()
                                              .add(ClearEvent());
                                        },
                                        text: MessagesProvider.get('CLEAR'),
                                        btnColor: theme.button1BG1!,
                                        textColor: theme.primaryOpposite!,
                                      ),
                                      OfActionBtns(
                                        onClick: () {
                                          notificationBar.showMessage(
                                              '', Colors.white);
                                          context
                                              .read<OtherFunctionBloc>()
                                              .add(RefundCardEvent());
                                        },
                                        text: MessagesProvider.get('OK'),
                                        btnColor: theme.button2InnerShadow1!,
                                        textColor: theme.light1!,
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> checkRefundDefaults() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBl = await MasterDataBuilder.build(execContext!);
    final refundCreditVal = await masterDataBl.getDefaultValuesByName(defaultValueName: 'ALLOW_REFUND_OF_CREDITPLUS') ;
    final refundDepositVal = await masterDataBl.getDefaultValuesByName(defaultValueName: 'ALLOW_REFUND_OF_CARD_DEPOSIT') ;
    if(mounted) {
      context.read<OtherFunctionBloc>().isDepositRefundAllowed = refundDepositVal == 'Y';
      context.read<OtherFunctionBloc>().isCreditPlusRefundAllowed = refundCreditVal == 'Y';
    }
    setState(() {});
  }
}
