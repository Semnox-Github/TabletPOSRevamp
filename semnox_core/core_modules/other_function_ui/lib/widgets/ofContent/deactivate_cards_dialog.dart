import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/action_btns.dart';
import 'package:other_function_ui/widgets/colors.dart';
import 'package:other_function_ui/widgets/headerWidgets/deactivate_cards_header_widget.dart';
import 'package:other_function_ui/widgets/of_content_widgets/holdEntitlements/card_details_container.dart';
import 'package:other_function_ui/widgets/text_style.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';

class DeactivateCardsDialog extends StatefulWidget {
  const DeactivateCardsDialog({super.key});

  @override
  State<DeactivateCardsDialog> createState() => _DeactivateCardsDialogState();
}

class _DeactivateCardsDialogState extends State<DeactivateCardsDialog> {
  late NotificationBar notificationBar;
  final ScrollController _formScrollController = ScrollController();
  bool _isNFCAvailable = false;
  double _screenWidth = 0.0;
  Size _screenSize = const Size(0, 0);
  bool _isChecked = false;
  bool _selectAllCollpase = false;

  @override
  void initState() {
    notificationBar = NotificationBar(showHideSideBar: false);
    context.read<OtherFunctionBloc>().add(ClearEvent());
    Future.microtask(() async {
      _isNFCAvailable = await NFCManager().isNfcAvailable();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    _screenSize = MediaQuery.of(context).size;
    _screenWidth = _screenSize.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Container(
          color: Colors.green,
          child: notificationBar,
        ),
      ),
      body: Column(
        children: [
          DeactivateHeader(
            header: MessagesProvider.get('DEACTIVATE\nCARDS'),
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
                                  child: Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: theme.backGroundColor,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Row(
                                              children: [
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
                                                      return Text(
                                                          'Cards To Be Deactivated(${otherFunctionBloc.deactivatedCardList?.length})',
                                                          style: KTextStyle
                                                              .smallBlackText
                                                              .copyWith(
                                                                  color: theme
                                                                      .primaryOpposite));
                                                    }
                                                    return Text(
                                                        'Cards To Be Deactivated(0)',
                                                        style: KTextStyle
                                                            .smallBlackText
                                                            .copyWith(
                                                                color: theme
                                                                    .primaryOpposite));
                                                  },
                                                ),
                                                Checkbox(
                                                  checkColor: Colors.black,
                                                  activeColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  side: MaterialStateBorderSide
                                                      .resolveWith(
                                                    (states) => BorderSide(
                                                        width: 1.0,
                                                        color: theme
                                                            .secondaryColor!),
                                                  ),
                                                  //fillColor: MaterialStateProperty.resolveWith(Colors.black),
                                                  value: _isChecked,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      _isChecked = value!;
                                                      context
                                                          .read<
                                                              OtherFunctionBloc>()
                                                          .isAdded = false;
                                                      if (value == false) {
                                                        _selectAllCollpase =
                                                            false;
                                                      }
                                                    });
                                                  },
                                                ),
                                                Text('Expand/Collapse All',
                                                    style: KTextStyle
                                                        .smallBlackText
                                                        .copyWith(
                                                            color: theme
                                                                .primaryOpposite))
                                              ],
                                            ),
                                          ),
                                          BlocConsumer<OtherFunctionBloc,
                                              OtherFunctionState>(
                                            listener: (context, state) {
                                              OtherFunctionBloc
                                                  otherFunctionBloc =
                                                  context.read<
                                                      OtherFunctionBloc>();
                                              if (state
                                                  is DeactivateCardListState) {
                                                notificationBar.showMessage(
                                                    MessagesProvider.get(
                                                        'Cards Added Successfully'),
                                                    KColor
                                                        .notificationBGLightBlueColor);
                                                loader
                                                    .hideLoaderDialog(context);
                                              } else if (state
                                                  is SuccessState) {
                                                setState(() {
                                                  _selectAllCollpase = false;
                                                });
                                                loader
                                                    .hideLoaderDialog(context);
                                                notificationBar.showMessage(
                                                    "", Colors.white);
                                              } else if (state is ClearState) {
                                                otherFunctionBloc
                                                    .selectedAccounts
                                                    .clear();
                                                otherFunctionBloc
                                                    .deactivatedCardList
                                                    ?.clear();
                                                otherFunctionBloc.isAdded =
                                                    false;
                                                otherFunctionBloc
                                                    .showChildCards = false;
                                                notificationBar.showMessage(
                                                    "", Colors.white);
                                              } else if (state is ErrorState) {
                                                notificationBar.showMessage(
                                                    state.message,
                                                    state.color ??
                                                        KColor
                                                            .notificationBGRedColor);
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
                                                return Scrollbar(
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        ...otherFunctionBloc
                                                            .deactivatedCardList!
                                                            .map(
                                                          (e) =>
                                                              GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                _selectAllCollpase =
                                                                    true;
                                                                if (otherFunctionBloc
                                                                    .selectedAccounts
                                                                    .contains(e
                                                                            .data
                                                                            ?.first
                                                                            .accountId ??
                                                                        0)) {
                                                                  otherFunctionBloc
                                                                      .selectedAccounts
                                                                      .remove(e
                                                                              .data
                                                                              ?.first
                                                                              .accountId ??
                                                                          0);
                                                                } else {
                                                                  otherFunctionBloc
                                                                      .selectedAccounts
                                                                      .add(e.data?.first
                                                                              .accountId ??
                                                                          0);
                                                                }
                                                              });
                                                            },
                                                            child: Padding(
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
                                                                itemLength:
                                                                    otherFunctionBloc
                                                                        .deactivatedCardList
                                                                        ?.length,
                                                                data: e.data
                                                                    ?.first,
                                                                selectAllCollapse:
                                                                    _selectAllCollpase,
                                                                isDeactivate:
                                                                    true,
                                                                isExpanded:
                                                                    _isChecked,
                                                                isSelected: otherFunctionBloc
                                                                    .selectedAccounts
                                                                    .contains(e
                                                                            .data
                                                                            ?.first
                                                                            .accountId ??
                                                                        0),
                                                                onDelete: () {
                                                                  setState(() {
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
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }
                                              return Container();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BlocConsumer<OtherFunctionBloc,
                                  OtherFunctionState>(
                                listener: (context, state) {
                                  final otherFunctionBloc =
                                      context.read<OtherFunctionBloc>();
                                  if (state is SuccessState) {
                                  } else if (state is ErrorState) {
                                    if (state.message ==
                                        'Please tap an issued Child Card') {
                                      Navigator.of(context).pop();
                                      notificationBar.showMessage(
                                          MessagesProvider.get(
                                              'Cannot Deactivate New Card'),
                                          state.color ?? Colors.red);
                                    } else if (state.message ==
                                        MessagesProvider.get(
                                            'Invalid Card Number length (&1). Should be &2',
                                            [
                                              '${otherFunctionBloc.cardController.text.length}',
                                              '8'
                                            ])) {
                                      notificationBar.showMessage(state.message,
                                          state.color ?? Colors.red);
                                    } else if (state.message ==
                                        MessagesProvider.get(
                                            'Please select a card to Deactivate')) {
                                      notificationBar.showMessage(state.message,
                                          state.color ?? Colors.red);
                                    } else if (state.message ==
                                        MessagesProvider.get(
                                            'Please select a card to Deactivate')) {
                                      notificationBar.showMessage(state.message,
                                          const Color(0xFFFEE891));
                                    } else {
                                      notificationBar.showMessage(state.message,
                                          state.color ?? Colors.red);
                                      Navigator.of(context).pop();
                                    }
                                    otherFunctionBloc.cardController.clear();
                                  } else if (state is ApiErrorState) {
                                    Navigator.of(context).pop();
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
                                    otherFunctionBloc.selectedAccounts.clear();
                                    notificationBar.showMessage(
                                        "", theme.primaryColor!);
                                    otherFunctionBloc.redeemTickets.value = 0.0;
                                  } else if (state is CardDetailsState) {
                                    notificationBar.showMessage(
                                        "", Colors.white);
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
                                          context
                                              .read<OtherFunctionBloc>()
                                              .add(DeactivateCardEvent());
                                        },
                                        text:
                                            MessagesProvider.get('DEACTIVATE'),
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
}
