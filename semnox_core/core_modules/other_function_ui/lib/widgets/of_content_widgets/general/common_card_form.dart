import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';

class CommonCardForDialog extends StatefulWidget {
  final bool? isTransferTo;
  final OtherFunctionBloc otherFunctionBloc;
  final bool isNFCAvailable;
  final bool? isAddMultiple;
  final bool? isDeactivate;
  const  CommonCardForDialog(
      {super.key,
      this.isAddMultiple,
      this.isDeactivate,
      this.isTransferTo,
      required this.isNFCAvailable,
      required this.otherFunctionBloc});

  @override
  State<CommonCardForDialog> createState() => _CommonCardForDialogState();
}

class _CommonCardForDialogState extends State<CommonCardForDialog> {
  late NFCManager? nfcManager;
  bool isEnable = false;
  final ScrollController _verticalCtr = ScrollController();
  var focusNode = FocusNode();
  final _textFieldKey = GlobalKey();


  @override
  void initState() {
    super.initState();
    widget.otherFunctionBloc.tapStatus.value =
        widget.isNFCAvailable ? MessagesProvider.get('Waiting...') : '';
    nfcManager = NFCManager();
    if (widget.isNFCAvailable) // listen only if the device is NFC enabled.
    {
      _startListeningForCardTaps();
    }else{
      widget.otherFunctionBloc.cardController.text='';
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget
        .isNFCAvailable) // stop listening only if the device is NFC enabled.
    {
      nfcManager?.stop();
    }
    nfcManager = null;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      alignment: Alignment.centerLeft,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: widget.isNFCAvailable
            ? MediaQuery.of(context).viewInsets.bottom == 0
                ? EdgeInsets.only(top: SizeConfig.getSize(60))
                : EdgeInsets.only(top: SizeConfig.getSize(10))
            : MediaQuery.of(context).viewInsets.bottom == 0
                ? EdgeInsets.only(top: SizeConfig.getSize(60))
                : EdgeInsets.only(top: SizeConfig.getSize(10)),
        alignment: Alignment.center,
        //width: SizeConfig.screenWidth * 0.4,
        //: widget.isNFCAvailable?SizeConfig.screenHeight * 0.66:SizeConfig.screenHeight * 0.36,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          body: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: (SizeConfig.screenWidth * 0.38) + 15,
              child: Stack(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top:SizeConfig.getSize(20), right:SizeConfig.getSize(10),),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        alignment: Alignment.topCenter,
                        margin: const EdgeInsets.only(left: 0.0, right: 0.0),
                        child: Container(
                          margin: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: theme.backGroundColor,
                          ),
                          child: SizedBox(
                            width: SizeConfig.screenWidth * 0.38,
                            // height: widget.isNFCAvailable?SizeConfig.screenHeight * 0.66:SizeConfig.screenHeight * 0.36,
                            child: Scroller(
                              controller: _verticalCtr,
                              child: SingleChildScrollView(
                                controller:_verticalCtr,
                                reverse: true,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: SizeConfig.screenHeight * 0.02,
                                          bottom: SizeConfig.screenHeight * 0.02),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: AutoSizeText(
                                          widget.isNFCAvailable
                                              ? MessagesProvider.get(
                                                  'Tap or Enter Card Number')
                                              : MessagesProvider.get(
                                                  'Enter Card Number'),
                                          style: theme.heading5?.copyWith(
                                              fontSize:
                                                  SizeConfig.getFontSize(18)),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: theme.dividerColor,
                                      height: SizeConfig.screenHeight * 0.0002,
                                    ),
                                    Visibility(
                                      visible: widget.isNFCAvailable,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom:
                                                SizeConfig.screenHeight * 0.02),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child:SizedBox(
                                            height: SizeConfig.getSize(200),
                                            width: SizeConfig.getSize(200),
                                            child: Image.asset(
                                              'assets/ic_tap_card_large.png',color: theme.secondaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                        visible: widget.isNFCAvailable,
                                        child: Text(
                                          MessagesProvider.get('Tap Card OR '),
                                          style: theme.heading5?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontSize: SizeConfig.getSize(18)),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width: SizeConfig.getSize(200),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.0675,
                                            child: TextFormField(
                                              controller: widget.otherFunctionBloc
                                                  .cardController,
                                              textAlign: TextAlign.start,
                                              //maxLines: 2,
                                              readOnly: false,
                                              focusNode: focusNode,
                                              style: theme.heading5?.copyWith(
                                                  fontSize:
                                                      SizeConfig.getSize(18)),
                                              decoration: InputDecoration(
                                                fillColor: theme.primaryColor,
                                                filled: true,
                                                isDense: true,
                                                contentPadding:SizeConfig.isBigDevice()?
                                                     const EdgeInsets.fromLTRB(
                                                        10, 10, 10, 10):const EdgeInsets.fromLTRB(
                                                    5, 5, 5, 5),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(SizeConfig.getSize(8))),
                                                    borderSide: BorderSide(
                                                        color: theme.secondaryColor!)),
                                                focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(SizeConfig.getSize(8))),
                                                    borderSide: BorderSide(
                                                        color: theme.secondaryColor!)),
                                                enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(SizeConfig.getSize(8))),
                                                    borderSide: BorderSide(
                                                        color: theme.secondaryColor!)),
                                                hintText: 'Enter Card No',
                                                hintStyle: theme.heading5
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            SizeConfig.getSize(
                                                                16)),
                                              ),
                                              onChanged: (value) {
                                                setState(() {
                                                  widget.otherFunctionBloc
                                                      .tapStatus.value = '';
                                                  widget
                                                      .otherFunctionBloc
                                                      .cardController
                                                      .text = value;
                                                  widget
                                                          .otherFunctionBloc
                                                          .cardController
                                                          .selection =
                                                      TextSelection.fromPosition(
                                                          TextPosition(
                                                              offset: widget
                                                                  .otherFunctionBloc
                                                                  .cardController
                                                                  .text
                                                                  .length));
                                                  isEnable = value.length == 8
                                                      ? true
                                                      : false;
                                                });
                                              },
                                              onTap: () {
                                                Scrollable.ensureVisible(_textFieldKey.currentContext!);//h
                                                setState(() {
                                                  _verticalCtr.animateTo(
                                                      _verticalCtr.position
                                                          .maxScrollExtent,
                                                      duration: const Duration(
                                                          milliseconds: 200),
                                                      curve: Curves.easeInOut);
                                                });
                                                FocusScope.of(context)
                                                    .requestFocus(focusNode);
                                              },
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          BlocBuilder<OtherFunctionBloc,
                                              OtherFunctionState>(
                                            bloc: widget.otherFunctionBloc,
                                            builder: (context, state) {
                                              if (state is LoadingState) {
                                                return Container(
                                                  alignment: Alignment.center,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.0675,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.09,
                                                  padding: const EdgeInsets.only(
                                                      left: 8.0, right: 8.0),
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    style:
                                                        ElevatedButton.styleFrom(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      backgroundColor:
                                                          Colors.grey,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0)),
                                                    ),
                                                    child: Container(
                                                      width: SizeConfig.getSize(35),
                                                      height:SizeConfig.getSize(35),
                                                      padding: const EdgeInsets.all(2.0),
                                                      child:  CircularProgressIndicator(
                                                        color: Colors.white,
                                                        strokeWidth: SizeConfig.getSize(4),
                                                      ),
                                                    )
                                                  ),
                                                );
                                              }
                                              return Container(
                                                height: SizeConfig.isBigDevice()? MediaQuery.of(context).size.height * 0.09 : MediaQuery.of(context).size.height * 0.1,
                                                width: MediaQuery.of(context).size.width * 0.12,
                                                padding:  EdgeInsets.all(SizeConfig.getSize(8)),
                                                child: ElevatedButton(
                                                  onPressed: () async {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    if (widget.isTransferTo ==
                                                        true) {
                                                      widget.otherFunctionBloc
                                                          .add(
                                                        TransferToCardDetails(
                                                            widget
                                                                .otherFunctionBloc
                                                                .cardController
                                                                .text),
                                                      );
                                                    } else if (widget
                                                            .isTransferTo ==
                                                        false) {
                                                      widget.otherFunctionBloc.add(
                                                          CardDetailsByAccNumber(
                                                              widget
                                                                  .otherFunctionBloc
                                                                  .cardController
                                                                  .text));
                                                    } else {
                                                      if (widget.isDeactivate ??
                                                          false) {
                                                        widget.otherFunctionBloc.add(
                                                            AddCardsToList(widget
                                                                .otherFunctionBloc
                                                                .cardController
                                                                .text));
                                                      } else {
                                                        (widget.isAddMultiple ??
                                                                false)
                                                            ? widget
                                                                .otherFunctionBloc
                                                                .add(AddLinkCard(widget
                                                                    .otherFunctionBloc
                                                                    .cardController
                                                                    .text))
                                                            : widget
                                                                .otherFunctionBloc
                                                                .add(
                                                                CardDetailEvent(widget
                                                                    .otherFunctionBloc
                                                                    .cardController
                                                                    .text),
                                                              );
                                                      }
                                                    }
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.all(SizeConfig.getWidth(4)),
                                                    backgroundColor: theme.button2BG1!,
                                                     shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(
                                                          SizeConfig.getSize(8)),
                                                    ),
                                                  ),
                                                  child: BlocProvider(
                                                    create: (_) =>
                                                        OtherFunctionBloc(),
                                                    child: BlocBuilder<
                                                        OtherFunctionBloc,
                                                        OtherFunctionState>(
                                                      bloc: widget
                                                          .otherFunctionBloc,
                                                      builder: (context, state) {
                                                        if (state
                                                            is LoadingState) {
                                                          return Container(
                                                            width: SizeConfig.getSize(35),
                                                            height:SizeConfig.getSize(35),
                                                            padding: const EdgeInsets.all(2.0),
                                                            child:  CircularProgressIndicator(
                                                              color: Colors.white,
                                                              strokeWidth: SizeConfig.getSize(4),
                                                            ),
                                                          );
                                                        }
                                                        return Text(
                                                          "APPLY",
                                                          style: theme
                                                              .headingLight5
                                                              ?.copyWith(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: SizeConfig
                                                                      .getFontSize(
                                                                          20)),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    ValueListenableBuilder(
                                      valueListenable:
                                          widget.otherFunctionBloc.tapStatus,
                                      builder: (context, value, child) {
                                        return Visibility(
                                          visible: value.isNotEmpty == true
                                              ? true
                                              : false,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top:
                                                    SizeConfig.screenHeight * 0.0,
                                                bottom: SizeConfig.screenHeight *
                                                    0.02),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: AutoSizeText(
                                                widget.otherFunctionBloc.tapStatus
                                                        .value ??
                                                    '',
                                                style: theme.heading4!.copyWith(
                                                    fontSize:
                                                        SizeConfig.getFontSize(
                                                            20)),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0.0,
                    child: BlocBuilder<OtherFunctionBloc, OtherFunctionState>(
                      bloc: widget.otherFunctionBloc,
                      builder: (context, state) {
                        if (state is LoadingState) {
                          return GestureDetector(
                            onTap: () {},
                            child: Align(
                              alignment: Alignment.topRight,
                              child: CircleAvatar(
                                radius: SizeConfig.getSize(25),
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.close,
                                  color: theme.primaryColor,
                                  size: SizeConfig.getSize(30),
                                ),
                              ),
                            ),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            if (widget.isNFCAvailable) {
                              nfcManager?.stop();
                            }
                            Navigator.of(context).pop();
                          },
                          child: Align(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              radius: SizeConfig.getSize(25),
                              backgroundColor: theme.button2InnerShadow1!,
                              child: Icon(
                                Icons.close,
                                color: theme.primaryColor,
                                size: SizeConfig.getSize(30),
                              ),
                            ),
                          ),
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
    );
  }

  _startListeningForCardTaps() async {
    Stream<NFCReadData>? nfcReadDataStream = nfcManager?.startScan();
    print("Initiated Nfc card scan");
    nfcReadDataStream?.listen((data) {
      String cardId = data.readableData;
      print("Nfc Data : $cardId");
      if (cardId.length != 8) {
        widget.otherFunctionBloc.tapStatus.value = widget.isNFCAvailable
            ? MessagesProvider.get(
                "Invalid card number. Card number expected to be 8 characters.")
            : '';
        setState(() {
          widget.otherFunctionBloc.cardController.clear();
        });
        // widget.notificationBar.showMessage(
        //     "${MessagesProvider.get("Invalid card number. Card number expected to be 8 characters.")} $cardId",
        //     AppColors.notificationBGRedColor);
      } else {
        widget.otherFunctionBloc.tapStatus.value = widget.isNFCAvailable
            ? MessagesProvider.get("Card read successfully.")
            : '';
        // widget.notificationBar.showMessage(
        //     MessagesProvider.get("Card read successfully."),
        //     AppColors.notificationBGLightBlueColor);
        setState(() {
          widget.otherFunctionBloc.cardController.clear();
          widget.otherFunctionBloc.cardController.text = data.readableData;
          isEnable = widget.otherFunctionBloc.cardController.text.length == 8
              ? true
              : false;
        });
      }
    });
  }
}
