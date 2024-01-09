import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_data/models/login_response.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/action_btns.dart';
import 'package:other_function_ui/widgets/colors.dart';
import 'package:other_function_ui/widgets/ofContent/link_cards_dialog.dart';
import 'package:other_function_ui/widgets/of_content_widgets/general/common_card_form.dart';
import 'package:other_function_ui/widgets/of_content_widgets/holdEntitlements/card_details_container.dart';
import 'package:other_function_ui/widgets/of_header.dart';
import 'package:other_function_ui/widgets/remark_widget.dart';
import 'package:other_function_ui/widgets/text_style.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';

class ConsolidateCards extends StatefulWidget {
  final LoginResponse? loginResponse;
  const ConsolidateCards({super.key, this.loginResponse});

  @override
  State<ConsolidateCards> createState() => _ConsolidateCardsState();
}

class _ConsolidateCardsState extends State<ConsolidateCards> {
  late NotificationBar notificationBar;
  final ScrollController _formScrollController = ScrollController();
  Size _screenSize = const Size(0, 0);
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  bool _isNFCAvailable = false;
  bool _isChecked = false;
  late SemnoxTheme theme;

  @override
  void initState() {
    notificationBar = NotificationBar(showHideSideBar: false);
    context.read<OtherFunctionBloc>().add(ClearEvent());
    Future.microtask(() async {
      _isNFCAvailable = await NFCManager().isNfcAvailable();
      notificationBar.showMessage(
          MessagesProvider.get('Please tap Destination Card to consolidate'),
          theme.footerBG4!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context).extension<SemnoxTheme>()!;
    _screenSize = MediaQuery.of(context).size;
    _screenWidth = _screenSize.width;
    _screenHeight = _screenSize.height;
    SizeConfig.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: SizedBox(
        width: _screenWidth,
        child: Container(
          color: Colors.green,
          child: notificationBar,
        ),
      ),
      body: Column(
        children: [
          OfHeader(
              header: MessagesProvider.get('MERGE'),
              isHeader: true,
              isConsolidate: true),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 24.0),
                                                  child: Text(
                                                      'Cards To Be merged(${otherFunctionBloc.deactivatedCardList?.length})',
                                                      style: theme.subtitle3
                                                          ?.copyWith(
                                                              fontSize: SizeConfig
                                                                  .getFontSize(
                                                                      18))),
                                                );
                                              }
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 24.0),
                                                child: Text(
                                                    'Cards To Be merged(0)',
                                                    style: theme.subtitle3
                                                        ?.copyWith(
                                                            fontSize: SizeConfig
                                                                .getFontSize(
                                                                    18))),
                                              );
                                            },
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  const SizedBox(width: 78,),
                                                  Checkbox(
                                                    checkColor: Colors.black,
                                                    activeColor: Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    side:
                                                        MaterialStateBorderSide
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
                                                      });
                                                    },
                                                  ),
                                                  Text('Expand/Collapse All',
                                                      style: KTextStyle
                                                          .smallBlackText
                                                          .copyWith(
                                                              color: theme
                                                                  .primaryOpposite,
                                                              fontSize: SizeConfig
                                                                  .getFontSize(
                                                                      18))),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                   Text('Tap multiple cards  OR',style: theme.heading5?.copyWith( fontSize: SizeConfig
                                                       .getFontSize(
                                                       26)),),
                                                  const SizedBox(width: 5,),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        right: 16.0),
                                                    child: SizedBox(
                                                      height: 25,
                                                      width: 80,
                                                      child: Opacity(
                                                        opacity: context
                                                            .read<
                                                            OtherFunctionBloc>()
                                                            .accounts ==
                                                            null
                                                            ? 1: 0.5,
                                                        child: BlocBuilder<
                                                            OtherFunctionBloc,
                                                            OtherFunctionState>(
                                                          builder:
                                                              (context, state) {
                                                            return ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                padding:
                                                                EdgeInsets.zero,
                                                                backgroundColor: context
                                                                    .read<
                                                                    OtherFunctionBloc>()
                                                                    .accounts ==
                                                                    null
                                                                    ? theme.button1BG1
                                                                    : Colors.black,
                                                              ),
                                                              onPressed: () {
                                                                context
                                                                    .read<
                                                                    OtherFunctionBloc>()
                                                                    .accounts ==
                                                                    null
                                                                    ? () {}
                                                                    : showDialog(
                                                                barrierDismissible:
                                                                false,
                                                                context: context,
                                                                builder: (context) {
                                                                return CommonCardForDialog(
                                                                otherFunctionBloc:
                                                                context.read<
                                                                OtherFunctionBloc>(),
                                                                isNFCAvailable:
                                                                _isNFCAvailable,
                                                                isDeactivate:
                                                                true,
                                                                );});
                                                              },
                                                              child: Text(
                                                                'ENTER CARD NO',
                                                                style: TextStyle(
                                                                    color: context.read<OtherFunctionBloc>().accounts == null
                                                                        ? theme.button2BG1!
                                                                        : theme.button1BG1!,
                                                                    fontSize: 9,
                                                                    fontStyle:
                                                                    FontStyle
                                                                        .normal),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  ],
                                              ),
                                            ],
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
                                                loader
                                                    .hideLoaderDialog(context);
                                                Navigator.of(context).pop();
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
                                                    "", theme.primaryColor!);
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
                                                return Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Wrap(
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
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child:
                                                              CardDetailsContainer(
                                                            dateFormat:
                                                                otherFunctionBloc
                                                                    .dateTimeFormat,
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
                                                            data: e.data?.first,
                                                            isDeactivate: true,
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
                                                                otherFunctionBloc
                                                                    .deactivatedCardList
                                                                    ?.removeWhere((element) =>
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
                                                  ),
                                                );
                                              }
                                              return Container();
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // const Spacer(),
                            const RemarkWidget(isStar: true),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BlocConsumer<OtherFunctionBloc,
                                  OtherFunctionState>(
                                listener: (context, state) {
                                  final otherFunctionBloc =
                                      context.read<OtherFunctionBloc>();
                                  if (state is SuccessState) {
                                  } else if (state is ErrorState) {
                                    notificationBar.showMessage(state.message,
                                        state.color ?? Colors.red);
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
                                          context.read<OtherFunctionBloc>().add(
                                              MergeCardEvent(
                                                  managerId: widget
                                                      .loginResponse
                                                      ?.data
                                                      ?.userPKId));
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
    );
  }
}
