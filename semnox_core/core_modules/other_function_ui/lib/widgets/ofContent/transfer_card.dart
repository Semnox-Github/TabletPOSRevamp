import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/screens/widgets/card_details_widget.dart';
import 'package:other_function_ui/widgets/action_btns.dart';
import 'package:other_function_ui/widgets/colors.dart';
import 'package:other_function_ui/widgets/of_content_widgets/general/common_card_form.dart';
import 'package:other_function_ui/widgets/of_content_widgets/transfer_card/search_widget.dart';
import 'package:other_function_ui/widgets/of_header.dart';
import 'package:other_function_ui/widgets/remark_widget.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';

class TransferCard extends StatefulWidget {
  final Function? onSuccessShowNotification;
  final Function? onFailureShowNotification;
  const TransferCard(
      {super.key,
      this.onSuccessShowNotification,
      this.onFailureShowNotification});

  @override
  State<TransferCard> createState() => _TransferCardState();
}

class _TransferCardState extends State<TransferCard> {
  late NotificationBar notificationBar;
  final ScrollController _formScrollController = ScrollController();
  bool _isNFCAvailable = false;

  @override
  void initState() {
    notificationBar = NotificationBar(showHideSideBar: false);
    Future.microtask(() async {
      _isNFCAvailable = await NFCManager().isNfcAvailable();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return BlocProvider(
      create: (context) => OtherFunctionBloc(),
      child: Scaffold(
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
          children: [
        Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Container(
          decoration: BoxDecoration(
              color: theme.backGroundColor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(6), topLeft: Radius.circular(6))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  height: SizeConfig.getSize(96),
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
                      Center(
                        child: Text(
                          MessagesProvider.get("Transfer Card"),
                          style: theme.headingLight4?.copyWith(
                              color: Colors.white,
                              fontSize: SizeConfig.getFontSize(22)),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
            Expanded(
              child: CustomScrollView(
                physics: const ClampingScrollPhysics(),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 8,
                                child: Scroller(
                                  controller: _formScrollController,
                                  child: SingleChildScrollView(
                                    controller: _formScrollController,
                                    physics: const ClampingScrollPhysics(),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: theme.backGroundColor,
                                      ),
                                      child: Column(
                                        children: [
                                          const SearchWidget(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: Text(
                                                  MessagesProvider.get(
                                                      'From Card:'),
                                                  style: theme.heading5!
                                                      .copyWith(
                                                          color: theme
                                                              .primaryOpposite,
                                                          fontSize: SizeConfig
                                                              .getFontSize(22)),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              BlocConsumer<OtherFunctionBloc,
                                                  OtherFunctionState>(
                                                listener: (context, state) {
                                                  if (state
                                                      is CardDetailsState) {
                                                    Future.microtask(() =>
                                                        loader.hideLoaderDialog(
                                                            context));

                                                    notificationBar.showMessage(
                                                        "",
                                                        theme.primaryColor!);
                                                  } else if (state
                                                      is ErrorState) {
                                                    notificationBar.showMessage(
                                                        state.message,
                                                        state.color ??
                                                            Colors.red);
                                                  }
                                                },
                                                builder: (context, state) {
                                                  final otherFunctionBloc =
                                                      context.read<
                                                          OtherFunctionBloc>();
                                                  if ((state is CardDetailsState &&
                                                          otherFunctionBloc
                                                                  .transferFromCard !=
                                                              null) ||
                                                      otherFunctionBloc
                                                          .isFromApplied) {
                                                    return Container(
                                                      // height: 80,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              right: 30),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color: KColor
                                                            .primaryBtnColor,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        child: CardDetailsWidget(
                                                          textSize: SizeConfig.isBigDevice() ? 20:18,
                                                            accounts:
                                                                otherFunctionBloc
                                                                    .transferFromCard),
                                                      ),
                                                    );
                                                  }
                                                  return Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 30),
                                                    height: SizeConfig.getSize(60),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: theme.button1BG1,
                                                    ),
                                                    child: Center(
                                                      child:
                                                        Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text(MessagesProvider.get('Tap Card   OR'),style: theme.heading5
                                                            ?.copyWith(
                                                            fontSize: SizeConfig
                                                                .getFontSize(
                                                                22))),
                                                          const SizedBox(width: 10,),
                                                          SizedBox(
                                                            height:SizeConfig.getSize(60),
                                                            child: ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor: theme.button2InnerShadow1,),onPressed: (){
                                                              {
                                                                // context.read<BalanceTransferCubit>().addMultiCard(tagNumber: "VINAY123");
                                                                showDialog(
                                                                  barrierDismissible:
                                                                  false,
                                                                  context: context,
                                                                  builder: (context) {
                                                                    return CommonCardForDialog(
                                                                      isTransferTo:
                                                                      false,
                                                                      otherFunctionBloc:
                                                                      otherFunctionBloc,
                                                                      isNFCAvailable:
                                                                      _isNFCAvailable,
                                                                    );
                                                                  },
                                                                );
                                                              }
                                                            }, child: Text(MessagesProvider.get("ENTER CARD NO"),style: theme.headingLight5!.copyWith(fontSize: SizeConfig.getFontSize(22)),)),
                                                          )],)
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  MessagesProvider.get(
                                                      'To Card:'),
                                                  style: theme.heading5!
                                                      .copyWith(
                                                          color: theme
                                                              .primaryOpposite,
                                                          fontSize: SizeConfig
                                                              .getFontSize(22)),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              BlocConsumer<OtherFunctionBloc,
                                                  OtherFunctionState>(
                                                listener: (context, state) {
                                                  if (state is ErrorState) {
                                                    notificationBar.showMessage(
                                                        state.message,
                                                        state.color ??
                                                            Colors.yellow);
                                                  }
                                                },
                                                builder: (context, state) {
                                                  final otherFunctionBloc =
                                                      context.read<
                                                          OtherFunctionBloc>();
                                                  if ((state is CardDetailsState ||
                                                          otherFunctionBloc
                                                                  .transfertoCard !=
                                                              null) &&
                                                      otherFunctionBloc
                                                          .isToApplied) {
                                                    return Container(
                                                      // height: 80,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              right: 30),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color: KColor
                                                            .primaryBtnColor,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        child: CardDetailsWidget(
                                                          textSize: SizeConfig.isBigDevice()? 20:18,
                                                            accounts:
                                                                otherFunctionBloc
                                                                    .transfertoCard),
                                                      ),
                                                    );
                                                  }
                                                  return Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 30),
                                                    height: SizeConfig.getSize(60),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: theme.button1BG1,
                                                    ),
                                                    child: Center(
                                                        child:
                                                        Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text(MessagesProvider.get('Tap Card   OR'),style: theme.heading5
                                                            ?.copyWith(
                                                            fontSize: SizeConfig
                                                                .getFontSize(
                                                                22)),),
                                                          const SizedBox(width: 10,),
                                                          SizedBox(
                                                            height:SizeConfig.getSize(60),
                                                            child: ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor: theme.button2InnerShadow1),onPressed: (){
                                                              {
                                                                // context.read<BalanceTransferCubit>().addMultiCard(tagNumber: "VINAY123");
                                                                showDialog(
                                                                  barrierDismissible:
                                                                  false,
                                                                  context: context,
                                                                  builder: (context) {
                                                                    return CommonCardForDialog(
                                                                      isTransferTo:
                                                                      true,
                                                                      otherFunctionBloc:
                                                                      otherFunctionBloc,
                                                                      isNFCAvailable:
                                                                      _isNFCAvailable,
                                                                    );
                                                                  },
                                                                );
                                                              }
                                                            }, child: Text(MessagesProvider.get("ENTER CARD NO"),style: theme.headingLight5!.copyWith(fontSize: SizeConfig.getFontSize(22)),)),
                                                          )],)
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // const Spacer(),
                              const RemarkWidget(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BlocConsumer<OtherFunctionBloc,
                                    OtherFunctionState>(
                                  listener: (context, state) {
                                    final otherFunctionBloc =
                                        context.read<OtherFunctionBloc>();
                                    if (state is SuccessState) {
                                      otherFunctionBloc.transferFromCard = null;
                                      otherFunctionBloc.transfertoCard = null;
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        widget.onSuccessShowNotification!(
                                            state.message.toString());
                                        notificationBar.showMessage(
                                            state.message.toString(),
                                            KColor
                                                .notificationBGLightBlueColor);
                                      });
                                    } else if (state is ErrorState) {
                                      if (state.message == 'New Card') {
                                        loader.hideLoaderDialog(context);
                                        notificationBar.showMessage(
                                            MessagesProvider.get(
                                                'Please Tap an issued card...'),
                                            state.color ??
                                                KColor.notificationBGRedColor);
                                      } else if (state.message ==
                                          MessagesProvider.get(
                                              'Please tap a NEW card to transfer')) {
                                        loader.hideLoaderDialog(context);
                                        notificationBar.showMessage(
                                            state.message,
                                            state.color ??
                                                KColor.notificationBGRedColor);
                                      } else if (state.message ==
                                          'Card Length') {
                                        otherFunctionBloc.tapStatus.value =
                                            MessagesProvider.get(
                                                'Invalid Card Number length (&1). Should be &2',
                                                [
                                              '${otherFunctionBloc.cardController.text.length}',
                                              '8'
                                            ]);
                                        notificationBar.showMessage(
                                            MessagesProvider.get(
                                                'Invalid Card Number length (&1). Should be &2',
                                                [
                                                  '${otherFunctionBloc.cardController.text.length}',
                                                  '8'
                                                ]),
                                            state.color ??
                                                KColor.notificationBGRedColor);
                                        otherFunctionBloc.cardController
                                            .clear();
                                      } else {
                                        loader.hideLoaderDialog(context);
                                      }
                                    } else if (state is ApiErrorState) {
                                      Navigator.of(context).pop();
                                      notificationBar.showMessage(
                                          state.message,
                                          state.color ??
                                              KColor.notificationBGRedColor);
                                    } else if (state is BodyLoader) {
                                      loader.showLoaderDialog(context);
                                    } else if (state is ClearState) {
                                      notificationBar.showMessage(
                                          "", theme.primaryColor!);
                                      otherFunctionBloc.customerDetails = null;
                                      otherFunctionBloc.transferFromCard = null;
                                      otherFunctionBloc.transfertoCard = null;
                                      otherFunctionBloc.customerSearchController
                                          .clear();
                                      otherFunctionBloc.isFromApplied = false;
                                      otherFunctionBloc.isToApplied = false;
                                    } else if (state is CardDetailsState) {
                                      otherFunctionBloc.cardController.clear();
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state is SuccessState) {}
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                            context
                                                .read<OtherFunctionBloc>()
                                                .add(CardTransfer());
                                          },
                                          text: MessagesProvider.get('CONFIRM'),
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
      ),
    );
  }
}
