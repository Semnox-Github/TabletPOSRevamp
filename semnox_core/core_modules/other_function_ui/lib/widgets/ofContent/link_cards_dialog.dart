import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:flutter/cupertino.dart';
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
import 'package:other_function_ui/widgets/of_header.dart';
import 'package:other_function_ui/widgets/text_style.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/utils/size_config.dart';


class LinkCardDialog extends StatefulWidget {
  const LinkCardDialog({super.key});

  @override
  State<LinkCardDialog> createState() => _LinkCardDialogState();
}

class _LinkCardDialogState extends State<LinkCardDialog> {
  late NotificationBar notificationBar;
  final _formKey = GlobalKey<FormState>();
  bool _isNFCAvailable = false;
  bool isVisible = false;
  Size _screenSize = const Size(0, 0);
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  final ScrollController _formScrollController = ScrollController();

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
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    _screenSize = MediaQuery.of(context).size;
    _screenWidth = _screenSize.width;
    _screenHeight = _screenSize.height;
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Scaffold(
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
                  header: MessagesProvider.get('Link Cards'),
                  isHeader: true,
                ),
                Expanded(
                  child: CustomScrollView(
                    // physics: S(),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: true,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: theme.backGroundColor,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        BlocBuilder<OtherFunctionBloc,
                                            OtherFunctionState>(
                                          builder: (context, state) {
                                            OtherFunctionBloc
                                                otherFunctionBloc = context
                                                    .read<OtherFunctionBloc>();
                                            if (state is LinkedCardState ||
                                                otherFunctionBloc
                                                    .showChildCards) {
                                              return Text(
                                                'Cards to be linked(${otherFunctionBloc.linkedCardList?.length})',
                                                style:
                                                    KTextStyle.smallBlackText,
                                              );
                                            }
                                            return Text(
                                              'Cards to be linked(0)',
                                              style: KTextStyle.smallBlackText,
                                            );
                                          },
                                        ),
                                        BlocBuilder<OtherFunctionBloc,
                                            OtherFunctionState>(
                                          builder: (context, state) {
                                            OtherFunctionBloc
                                                otherFunctionBloc = context
                                                    .read<OtherFunctionBloc>();
                                            if (state is LinkedCardState ||
                                                otherFunctionBloc
                                                    .showChildCards) {
                                              return Text(
                                                'Day Limit %',
                                                textAlign: TextAlign.left,
                                                style:
                                                    KTextStyle.smallBlackText,
                                              );
                                            }
                                            return const SizedBox.shrink();
                                          },
                                        ),

                                        Expanded(
                                          // flex: 8,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: theme.backGroundColor,
                                            ),
                                            child: Scrollbar(
                                              trackVisibility: true,
                                              // interactive: true,
                                              radius: const Radius.circular(8),
                                              thumbVisibility: true,
                                              controller: _formScrollController,
                                              child: SingleChildScrollView(
                                                controller:
                                                    _formScrollController,
                                                physics:
                                                    const ClampingScrollPhysics(),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: BlocConsumer<
                                                          OtherFunctionBloc,
                                                          OtherFunctionState>(
                                                        listener:
                                                            (context, state) {
                                                          final otherFunctionBloc =
                                                              context.read<
                                                                  OtherFunctionBloc>();
                                                          if (state
                                                              is CardDetailsState) {
                                                            otherFunctionBloc.add(
                                                                GetLinkedCards());
                                                          } else if (state
                                                              is SuccessState) {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            notificationBar.showMessage(
                                                                MessagesProvider
                                                                    .get(
                                                                        'Save Successful'),
                                                                KColor
                                                                    .notificationBGLightBlueColor);
                                                          } else if (state
                                                              is BodyLoader) {
                                                            loader
                                                                .showLoaderDialog(
                                                                    context);
                                                          } else if (state
                                                              is LinkedCardState) {
                                                            if ((otherFunctionBloc
                                                                        .accounts
                                                                        ?.data
                                                                        ?.first
                                                                        .accountRelationshipDTOList ==
                                                                    null) &&
                                                                (state
                                                                    .linkedCards!
                                                                    .isNotEmpty)) {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            } else if (otherFunctionBloc
                                                                    .accounts
                                                                    ?.data
                                                                    ?.first
                                                                    .accountRelationshipDTOList !=
                                                                null) {
                                                              if ((otherFunctionBloc
                                                                          .accounts
                                                                          ?.data
                                                                          ?.first
                                                                          .accountRelationshipDTOList
                                                                          ?.length !=
                                                                      state
                                                                          .linkedCards
                                                                          ?.length) &&
                                                                  (state.isDelete ==
                                                                      false)) {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                notificationBar
                                                                    .showMessage(
                                                                        '',
                                                                        Colors
                                                                            .white);
                                                                if (state
                                                                        .isError ??
                                                                    false) {
                                                                  notificationBar
                                                                      .showMessage(
                                                                          state.message ??
                                                                              '',
                                                                          Colors
                                                                              .yellow);
                                                                }
                                                              } else if (state
                                                                      .isError ??
                                                                  false) {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                if (state
                                                                        .message ==
                                                                    'Parent Card') {
                                                                  notificationBar
                                                                      .showMessage(
                                                                          state.message ??
                                                                              '',
                                                                          Colors
                                                                              .yellow);
                                                                } else {
                                                                  notificationBar
                                                                      .showMessage(
                                                                          state.message ??
                                                                              '',
                                                                          Colors
                                                                              .yellow);
                                                                }
                                                              } else {
                                                                if ((otherFunctionBloc
                                                                            .accounts
                                                                            ?.data
                                                                            ?.first
                                                                            .accountRelationshipDTOList
                                                                            ?.length ==
                                                                        state
                                                                            .linkedCards
                                                                            ?.length) &&
                                                                    (state.isDelete ==
                                                                        false)) {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                }
                                                                notificationBar.showMessage(
                                                                    MessagesProvider
                                                                        .get(
                                                                            'Tap Child Cards(s)'),
                                                                    KColor
                                                                        .notificationBGLightBlueColor);
                                                              }
                                                            }
                                                          } else if (state
                                                              is ErrorState) {
                                                            notificationBar
                                                                .showMessage(
                                                                    state
                                                                        .message,
                                                                    state.color ??
                                                                        Colors
                                                                            .red);
                                                          } else if (state
                                                              is ClearState) {
                                                            notificationBar
                                                                .showMessage(
                                                                    "",
                                                                    theme
                                                                        .primaryColor!);
                                                            otherFunctionBloc
                                                                .linkedCardList
                                                                ?.clear();
                                                            otherFunctionBloc
                                                                .linkedCardRequestList
                                                                ?.clear();
                                                            otherFunctionBloc
                                                                    .accounts =
                                                                null;
                                                            otherFunctionBloc
                                                                .splitType = '';
                                                          } else if (state
                                                              is ApiErrorState) {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            notificationBar
                                                                .showMessage(
                                                                    state
                                                                        .message,
                                                                    state.color ??
                                                                        Colors
                                                                            .red);
                                                          }
                                                        },
                                                        builder:
                                                            (context, state) {
                                                          final otherFunctionBloc =
                                                              context.read<
                                                                  OtherFunctionBloc>();
                                                          if (state
                                                                  is LinkedCardState ||
                                                              otherFunctionBloc
                                                                  .showChildCards) {
                                                            return otherFunctionBloc
                                                                        .linkedCardList ==
                                                                    null
                                                                ? const SizedBox
                                                                    .shrink()
                                                                : Column(
                                                                    children: [
                                                                      ...otherFunctionBloc
                                                                          .linkedCardList!
                                                                          .map<
                                                                              Widget>(
                                                                            (e) =>
                                                                                Row(
                                                                              children: [
                                                                                Column(children:[
                                                                                   SizedBox(height:SizeConfig.isBigDevice()?60:40,),
                                                                                Container(
                                                                                  margin: const EdgeInsets.only(bottom: 10),
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: const Color(0xffD1D3D8)),
                                                                                  height: SizeConfig.isBigDevice()?60:40,
                                                                                  width: SizeConfig.isBigDevice()? 80:60,
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      otherFunctionBloc.splitType == "" ? '${otherFunctionBloc.linkedCardRequestList?[otherFunctionBloc.linkedCardList!.indexOf(e)].accountRelationShipDto?.dailyLimitPercentage}' : splitString(otherFunctionBloc.linkedCardList, e),
                                                                                      style: KTextStyle.regularBlackText,
                                                                                    ),
                                                                                  ),
                                                                                ),],),
                                                                                SizedBox(width:SizeConfig.isBigDevice()?8:3),
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    margin: const EdgeInsets.only(bottom: 10),
                                                                                    height: SizeConfig.isBigDevice()?120:80,
                                                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: KColor.primaryBtnColor),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                                                                      child: CardDetailsWidget(textSize: 18,accounts: e),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(width: SizeConfig.isBigDevice()?8:3,),
                                                                                Stack(
                                                                                  children: [
                                                                                     CircleAvatar(
                                                                                      radius: SizeConfig.isBigDevice()? 30:14,
                                                                                      backgroundColor: Colors.black,
                                                                                    ),
                                                                                    Positioned(
                                                                                      right: SizeConfig.isBigDevice()?  3:-10,
                                                                                      bottom: SizeConfig.isBigDevice()? 3:-10,
                                                                                      child: IconButton(
                                                                                          onPressed: () {
                                                                                            otherFunctionBloc.add(RemoveLinkedCard((e.data?.first.accountId ?? 0)));
                                                                                          },
                                                                                          iconSize: SizeConfig.isBigDevice()?40:20,
                                                                                          icon: const Icon(
                                                                                            Icons.close,
                                                                                            color: Colors.white,
                                                                                          ),
                                                                                        ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                SizedBox(width: SizeConfig.isBigDevice()?10:6,),
                                                                              ],
                                                                            ),
                                                                          )
                                                                          .toList(),
                                                                    ],
                                                                  );
                                                          }
                                                          return Column();
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        // const Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                      // height: MediaQuery.of(context).size.height,
                                      // width: MediaQuery.of(context).size.width / 2 + 10,
                                      color: theme.backGroundColor,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            LinkedCardActionBtns(
                                                cardColor: context
                                                            .read<
                                                                OtherFunctionBloc>()
                                                            .splitType ==
                                                        'clear'
                                                    ? theme.button2InnerShadow1!
                                                    : theme.button1BG1!,
                                                fontColor: context
                                                            .read<
                                                                OtherFunctionBloc>()
                                                            .splitType ==
                                                        'clear'
                                                    ? theme.light1!
                                                    : theme.primaryOpposite!,
                                                onPressed: () {
                                                  setState(() {
                                                    context
                                                        .read<OtherFunctionBloc>()
                                                        .splitType = 'clear';
                                                  });
                                                },
                                                text: 'CLEAR SPLIT'),
                                            LinkedCardActionBtns(
                                                cardColor: context
                                                            .read<
                                                                OtherFunctionBloc>()
                                                            .splitType ==
                                                        'equal'
                                                    ? theme.button2InnerShadow1!
                                                    : theme.button1BG1!,
                                                fontColor: context
                                                            .read<
                                                                OtherFunctionBloc>()
                                                            .splitType ==
                                                        'equal'
                                                    ? theme.light1!
                                                    : theme.primaryOpposite!,
                                                onPressed: () {
                                                  isVisible = false;
                                                  setState(() {
                                                    isVisible = false;
                                                    context
                                                        .read<OtherFunctionBloc>()
                                                        .splitType = 'equal';
                                                  });
                                                },
                                                text: 'SPLIT EQUAL'),
                                            LinkedCardActionBtns(
                                                cardColor: context
                                                            .read<
                                                                OtherFunctionBloc>()
                                                            .splitType ==
                                                        'first'
                                                    ? theme.button2InnerShadow1!
                                                    : theme.button1BG1!,
                                                fontColor: context
                                                            .read<
                                                                OtherFunctionBloc>()
                                                            .splitType ==
                                                        'first'
                                                    ? theme.light1!
                                                    : theme.primaryOpposite!,
                                                onPressed: () {
                                                  setState(() {
                                                    isVisible = false;
                                                    context
                                                        .read<OtherFunctionBloc>()
                                                        .splitType = 'first';
                                                  });
                                                },
                                                text: '50% FIRST CARD'),
                                            LinkedCardActionBtns(
                                                cardColor: context
                                                            .read<
                                                                OtherFunctionBloc>()
                                                            .splitType ==
                                                        'cFirst'
                                                    ? theme.button2InnerShadow1!
                                                    : theme.button1BG1!,
                                                fontColor: context
                                                            .read<
                                                                OtherFunctionBloc>()
                                                            .splitType ==
                                                        'cFirst'
                                                    ? theme.light1!
                                                    : theme.primaryOpposite!,
                                                onPressed: () {
                                                  setState(() {
                                                    context
                                                        .read<OtherFunctionBloc>()
                                                        .splitType = 'cFirst';
                                                    isVisible = !isVisible;
                                                  });
                                                },
                                                text: 'CUSTOM FIRST CARD'),
                                            Visibility(
                                              visible: isVisible,
                                              child: GestureDetector(
                                                onTap: () {
                                                  showDialog(
                                                    barrierDismissible: true,
                                                    context: context,
                                                    barrierColor:
                                                        const Color(0x01000000),
                                                    builder:
                                                        (BuildContext context) {
                                                      return NumberPad(
                                                        isDecimalRequired: false,
                                                        initialOffset:
                                                            const Offset(50, 50),
                                                        title: '',
                                                        onOkPressed: (value) {
                                                          setState(() {
                                                            if (value < 100 ||
                                                                value > 0) {
                                                              context
                                                                  .read<
                                                                      OtherFunctionBloc>()
                                                                  .cFirst = value;
                                                            }
                                                          });
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(right:8.0),
                                                  child: Container(
                                                    height: 30,
                                                    width: 98,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(color: KColor.borderGrey),
                                                        borderRadius: BorderRadius.circular(4),),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              if (context
                                                                      .read<
                                                                          OtherFunctionBloc>()
                                                                      .cFirst >
                                                                  0) {
                                                                context
                                                                    .read<
                                                                        OtherFunctionBloc>()
                                                                    .cFirst = context
                                                                        .read<
                                                                            OtherFunctionBloc>()
                                                                        .cFirst -
                                                                    5;
                                                              }
                                                            });
                                                          },
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(2.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    KColor.borderGrey,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(8),
                                                              ),
                                                              child: const Icon(
                                                                  Icons.remove),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${context.read<OtherFunctionBloc>().cFirst}',
                                                          style: KTextStyle
                                                              .regularBlackText.copyWith(fontSize: SizeConfig.getSize(26)),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            if (context
                                                                    .read<
                                                                        OtherFunctionBloc>()
                                                                    .cFirst <
                                                                100) {
                                                              setState(() {
                                                                context
                                                                    .read<
                                                                        OtherFunctionBloc>()
                                                                    .cFirst = context
                                                                        .read<
                                                                            OtherFunctionBloc>()
                                                                        .cFirst +
                                                                    5;
                                                              });
                                                            }
                                                          },
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(2.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    KColor.borderGrey,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(8),
                                                              ),
                                                              child: const Icon(
                                                                  Icons.add),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                                alignment: Alignment.bottomRight,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 6.0,
                                                      right: 9,
                                                      bottom: 2),
                                                  child: Text(
                                                    'Tap multiple cards',
                                                    style: theme.heading5
                                                        ?.copyWith(
                                                            fontSize:SizeConfig.isBigDevice()? SizeConfig.getFontSize(10): SizeConfig.getFontSize(20)),
                                                  ),
                                                )),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 9.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'OR',
                                                    style:
                                                        theme.heading5?.copyWith(
                                                            fontSize:SizeConfig.isBigDevice()? SizeConfig.getFontSize(10): SizeConfig.getFontSize(20),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                  SizedBox(
                                                    height: 25,
                                                    width: 60,
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
                                                                context:
                                                                context,
                                                                builder:
                                                                    (context) {
                                                                  return CommonCardForDialog(
                                                                    otherFunctionBloc:
                                                                    context.read<OtherFunctionBloc>(),
                                                                    isNFCAvailable:
                                                                    _isNFCAvailable,
                                                                    isAddMultiple:
                                                                    true,
                                                                  );

                                                                },
                                                              );
                                                            },
                                                            child: Text(
                                                              'ENTER CARD NO',
                                                              style: TextStyle(
                                                                  color: context.read<OtherFunctionBloc>().accounts == null
                                                                      ? theme.primaryOpposite!
                                                                      : theme.light1!,
                                                                  fontSize: 7,
                                                                  fontStyle:
                                                                  FontStyle
                                                                      .normal),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: _screenWidth,
                  color: KColor.borderGrey,
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: theme.backGroundColor,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(6),
                              bottomLeft: Radius.circular(6))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OfActionBtns(
                            onClick: () {
                              context
                                  .read<OtherFunctionBloc>()
                                  .add(ClearEvent());
                            },
                            text: 'CLEAR',
                            btnColor: theme.button1BG1!,
                            textColor: theme.primaryOpposite!,
                          ),
                          OfActionBtns(
                            onClick: () {
                              if (context.read<OtherFunctionBloc>().accounts ==
                                  null) {
                                notificationBar.showMessage(
                                    MessagesProvider.get('Nothing to save'),
                                    KColor.notoficationBGLightYellowColor);
                              } else {
                                context
                                    .read<OtherFunctionBloc>()
                                    .add(PostLinkCard());
                              }
                            },
                            text: 'CONFIRM',
                            btnColor: theme.button2InnerShadow1!,
                            textColor: theme.light1!,
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String splitString(
      List<AccountDetailsResponse>? linkedCards, AccountDetailsResponse e) {
    switch (context.read<OtherFunctionBloc>().splitType) {
      case 'clear':
        return '0';
      case 'equal':
        return '${(100 ~/ (linkedCards?.length ?? 1))}';
      case 'first':
        if (linkedCards?.indexOf(e) == 0) {
          return '50.0';
        }
        return '${(50 ~/ ((linkedCards?.length ?? 1) - 1))}';
      case 'cFirst':
        if (linkedCards?.indexOf(e) == 0) {
          return context.read<OtherFunctionBloc>().cFirst.toString();
        }
        return '${((100 - context.read<OtherFunctionBloc>().cFirst) ~/ ((linkedCards?.length ?? 1) - 1))}';
      default:
        return '';
    }
  }
}

class LinkedCardActionBtns extends StatelessWidget {
  final String text;
  final Color fontColor;
  final Color cardColor;
  final Function()? onPressed;
  const LinkedCardActionBtns(
      {super.key,
      required this.text,
      this.onPressed,
      required this.cardColor,
      required this.fontColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        constraints: const BoxConstraints(
            minHeight: 0,
            maxHeight: 400.0,
            minWidth: 110),
        child: Padding(
          padding: const EdgeInsets.only(right:4.0),
          child: Card(
            shadowColor: CupertinoColors.label,
            color: cardColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8),
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: fontColor,
                  fontSize: 9,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
