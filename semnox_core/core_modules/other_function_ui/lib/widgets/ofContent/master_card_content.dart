import 'package:customer_data/models/account_details/account_details_response.dart';
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
import 'package:other_function_ui/widgets/headerWidgets/header_button.dart';
import 'package:other_function_ui/widgets/of_content_widgets/general/card_details.dart';
import 'package:other_function_ui/widgets/of_content_widgets/master_card_widgets/ssid_counter_widget.dart';
import 'package:other_function_ui/widgets/of_content_widgets/redeem_ticket_widget/redeem_card_widget.dart';
import 'package:other_function_ui/widgets/of_header.dart';
import 'package:other_function_ui/widgets/text_style.dart';
import 'package:themes_library/themes_library.dart';

class MasterCardContent extends StatefulWidget {
  const MasterCardContent({super.key});

  @override
  State<MasterCardContent> createState() => _MasterCardContentState();
}

class _MasterCardContentState extends State<MasterCardContent> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController cardController = TextEditingController();
  late NotificationBar notificationBar;
  final ScrollController _formScrollController = ScrollController();
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<int> selectCard = ValueNotifier(0);
  ValueNotifier<int> ssidnumber = ValueNotifier(0);
  ValueNotifier<bool> isApplied = ValueNotifier(false);
  AccountDetailsResponse? accounts;
  List<String> cardActionString = [
    "'Free play' card",
    "'Exit Free Play' Card",
    "Enter Free Play Mode",
    "Exit Free Play Mode",
    "Invalidate 'Free Play' Cards",
    "'Change SSID' Card"
  ];

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
          OfHeader(
              header: MessagesProvider.get('Master\nCards'), isHeader: false),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
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
                              child: RawScrollbar(
                                controller: _formScrollController,
                                thumbVisibility: true,
                                trackVisibility: true,
                                trackColor: Colors.white,
                                thickness: 10,
                                child: SingleChildScrollView(
                                  controller: _formScrollController,
                                  child: Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Create Master Cards',
                                                style: KTextStyle
                                                    .regularBoldTextStyle,
                                              ),
                                              SizedBox(
                                                height: 200,
                                                child: GridView.builder(
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemCount:
                                                      cardActionString.length,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    childAspectRatio: 4.0,
                                                    crossAxisCount: 3,
                                                    crossAxisSpacing: 4.0,
                                                    mainAxisSpacing: 4.0,
                                                  ),
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return ValueListenableBuilder<
                                                        int>(
                                                      valueListenable:
                                                          selectCard,
                                                      builder:
                                                          (context, value,
                                                                  child) =>
                                                              value == index
                                                                  ? RedeemCard(
                                                                      color: Colors
                                                                          .black,
                                                                      onTap: () =>
                                                                          selectCard.value =
                                                                              index,
                                                                      text: cardActionString[
                                                                          index],
                                                                      textColor:
                                                                          KColor
                                                                              .primaryBtnColor,
                                                                    )
                                                                  : RedeemCard(
                                                                      color: KColor
                                                                          .primaryBtnColor,
                                                                      onTap: () =>
                                                                          selectCard.value =
                                                                              index,
                                                                      text: cardActionString[
                                                                          index],
                                                                      textColor:
                                                                          Colors
                                                                              .black,
                                                                    ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          ValueListenableBuilder<int>(
                                            valueListenable: selectCard,
                                            builder: (context, value, child) {
                                              return value == 0 ||
                                                      value == 1 ||
                                                      value == 5
                                                  ? Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          color: KColor
                                                              .primaryBtnColor,
                                                          height: 80,
                                                          child:
                                                              ValueListenableBuilder<
                                                                  bool>(
                                                            valueListenable:
                                                                isApplied,
                                                            builder: (context,
                                                                value, child) {
                                                              return value
                                                                  ? CardDetails(
                                                                      accounts:
                                                                          accounts)
                                                                  : Container(
                                                                      height:
                                                                          80,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                        color: KColor
                                                                            .primaryBtnColor,
                                                                      ),
                                                                      child: BlocConsumer<
                                                                          OtherFunctionBloc,
                                                                          OtherFunctionState>(
                                                                        listener:
                                                                            (context,
                                                                                state) {
                                                                          final otherFunctionBLoc =
                                                                              context.read<OtherFunctionBloc>();
                                                                          if (state
                                                                              is CardDetailsState) {
                                                                            Navigator.pop(context);
                                                                            otherFunctionBLoc.isApplied =
                                                                                true;
                                                                            otherFunctionBLoc.add(UpdateDisplayValue());
                                                                            otherFunctionBLoc.ticketMode = otherFunctionBLoc.accounts?.data?.first.realTicketMode ?? false
                                                                                ? 'Real Ticket'
                                                                                : 'E-Ticket';
                                                                          }
                                                                          if (state
                                                                              is ClearState) {
                                                                            context.read<OtherFunctionBloc>().isApplied =
                                                                                false;
                                                                            cardController.clear();
                                                                            context.read<OtherFunctionBloc>().tokenCount.value =
                                                                                0;
                                                                          }
                                                                        },
                                                                        builder:
                                                                            (context,
                                                                                state) {
                                                                          OtherFunctionBloc
                                                                              otherFunctionBloc =
                                                                              context.read<OtherFunctionBloc>();
                                                                          if (state is CardDetailsState ||
                                                                              otherFunctionBloc.isApplied) {
                                                                            return Container(
                                                                              // height: 80,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                color: KColor.primaryBtnColor,
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                                                                child: CardDetailsWidget(accounts: otherFunctionBloc.accounts),
                                                                              ),
                                                                            );
                                                                          }
                                                                          return Padding(
                                                                            padding:
                                                                                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                HeaderButton(
                                                                                  isNfcAvailable: _isNFCAvailable,
                                                                                  formKey: _formKey,
                                                                                  cardController: cardController,
                                                                                  otherFunctionBloc: otherFunctionBloc,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          );
                                                                        },
                                                                      ));
                                                            },
                                                          ),
                                                        ),
                                                        SsidCounterWidget(
                                                            selectCard:
                                                                selectCard,
                                                            ssidnumber:
                                                                ssidnumber)
                                                      ],
                                                    )
                                                  : const SizedBox.shrink();
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
                                        notificationBar.showMessage(
                                            state.message ?? '',
                                            state.color ?? Colors.red);
                                        Navigator.of(context).pop();
                                      },
                                    );
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
                                        "", Colors.white);
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
                                        actionButtonTextStyle:
                                            theme.description1!,
                                        btnColor: theme.tableRow1!,
                                        textColor: Colors.black,
                                      ),
                                      OfActionBtns(
                                        onClick: () {
                                          notificationBar.showMessage(
                                              '', Colors.white);
                                          context.read<OtherFunctionBloc>().add(
                                              MasterCardEvent(
                                                  cardType: selectCard.value));
                                        },
                                        text: MessagesProvider.get('CONFIRM'),
                                        btnColor: theme.secondaryColor!,
                                        actionButtonTextStyle:
                                            theme.descriptionLight1!,
                                        textColor: KColor.primaryBtnColor,
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
