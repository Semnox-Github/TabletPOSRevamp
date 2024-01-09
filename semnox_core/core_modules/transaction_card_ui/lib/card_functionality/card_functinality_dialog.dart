import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:transaction_ui/cubit/transaction_cubit_state.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/models/create_transaction/transaction_data.dart';
import 'package:transaction_data/models/create_transaction/transaction_line_dto.dart';
import '../utils/constants.dart';
import 'cubit/card_functionality_cubit.dart';
import 'cubit/card_functionality_state.dart';
import 'package:logs_data/logger.dart';

class CardFunctionalityDialog extends StatefulWidget {
  const CardFunctionalityDialog(
      {Key? key,
      this.approverID,
      required this.cardType,
      required this.productName,
      required this.productContainerDto,
      required this.qnty,
      required this.isEdit,
      required this.selectedSeatName,
      required this.seatNumber,
      required this.onSuccess,
      required this.showNotification,
      required this.isSplitCard,
      required this.isFullfill,
      required this.onFullfillProduct,
      this.variableAmount,
      this.remarks,
      this.transactionLines})
      : super(key: key);
  final String? selectedSeatName;
  final int? seatNumber;
  final String cardType;
  final int qnty;
  final bool isEdit;
  final bool isFullfill;
  final ProductContainerDTO? productContainerDto;
  final String? productName;
  final Function(TransactionData transactionData) onSuccess;
  final Function(String value) showNotification;
  final double? variableAmount;
  final bool isSplitCard;
  final String? remarks;
  final List<TransactionLineDTO>? transactionLines;
  final int? approverID;
  final Function onFullfillProduct;

  @override
  State<CardFunctionalityDialog> createState() =>
      _CardFunctionalityDialogState();
}

class _CardFunctionalityDialogState extends State<CardFunctionalityDialog> {
  final TextEditingController _enterCardNoTextController =
      TextEditingController();
  final TextEditingController _enterSerialNoFromTextController =
      TextEditingController();
  final TextEditingController _enterSerialNoToTextController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController(initialScrollOffset: 0.0);
  final _slNoScrollController = ScrollController(initialScrollOffset: 0.0);
  final _productGroupScrollController  = ScrollController(initialScrollOffset: 0.0);
  Size? _screenSize;
  double _screenHeight = 0.0;
  double _screenWidth = 0.0;
  NotificationBar? _notificationBar;
  NFCManager? _nfcManager = NFCManager();
  bool _isNfcAvailable = false;
  static late SemnoxTheme _theme;
  late InputDecoration _textInputDecoration ;

  @override
  void initState() {
    startListeningForCardTaps();
    _notificationBar = NotificationBar(showHideSideBar: false);
    _resetLoaderAndMessage();
    widget.isEdit || widget.isFullfill ? _initializeCard() : _initialState();
    super.initState();
  }

  _onBackPressed() {
    context.read<TransactionCubit>().setIsCardFunctionalityDialogShown(false);
    final cardFunctionalityCubit = context.read<CardFunctionalityCubit>();
    cardFunctionalityCubit.clearAllData();
    Navigator.pop(context);
  }

  startListeningForCardTaps() async {
    _isNfcAvailable = await _nfcManager?.isNfcAvailable() ?? false;
    if (_isNfcAvailable) {
      Stream<NFCReadData>? nfcReadDataStream = _nfcManager?.startScan();
      Log.v("Initiated Nfc card scan");
      nfcReadDataStream?.listen((data) {
        String cardId = data.readableData;
        Log.v("Nfc Data : $cardId");
        if (cardId.length != 8) {
          _notificationBar?.showMessage(
              "${MessagesProvider.get('Invalid card number &1 ', ["$cardId"])}",
              _theme.footerBG3!);
        } else {
          _notificationBar?.showMessage(
              MessagesProvider.get("Card read successfully."),
              _theme.footerBG5!);
          _enterCardNoTextController.text = data.readableData;
        }
      });
    } else {
      //TODO: if NFC is not available
    }
  }

  _resetLoaderAndMessage() {
    final cardState = context.read<CardFunctionalityCubit>();
    cardState.resetLoaderAndMessage();
  }

  _initialState() {
    final cardState = context.read<CardFunctionalityCubit>();
    cardState.initialState(
        quantity: widget.qnty ?? 1,
        productName: widget.productName ?? '',
        productId: widget.productContainerDto?.productId ?? -1);
  }

  _initializeCard() {
    // print("texts");
    final cardState = context.read<CardFunctionalityCubit>();
    cardState.initializeCard(
        quantity: widget.qnty ?? 1,
        productName: widget.productName ?? '',
        transactionLines: widget.transactionLines ?? []);
  }

  _initInputDecoration(){
    _textInputDecoration = InputDecoration(
      fillColor: _theme.primaryColor,
      filled: true,
      hintText: MessagesProvider.get("Enter"),
      hintStyle: _theme.textFieldHintStyle!.copyWith(
          fontSize: SizeConfig.getFontSize(20)),
      contentPadding: const EdgeInsets.only(
          left: 5),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
          borderSide: BorderSide(
            width: 1,
            color: _theme.secondaryColor!,
          )),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
        borderSide: BorderSide(
          width: 1,
          color: _theme.secondaryColor!,
        ),
      ),

    );
  }


  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    _screenHeight = _screenSize!.height;
    _screenWidth = _screenSize!.width;
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    _initInputDecoration();
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        color: _theme.transparentColor,
        child: Stack(
          children: [
            Column(
              children: [
                _header(),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding:  EdgeInsets.fromLTRB(SizeConfig.getSize(8), 0, SizeConfig.getSize(8), SizeConfig.getSize(8)),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _theme.backGroundColor,
                        borderRadius:  BorderRadius.only(
                            bottomLeft: Radius.circular(SizeConfig.getSize(8)),
                            bottomRight: Radius.circular(SizeConfig.getSize(8))),
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height),
                        child: Column(
                          children: [
                            _cardEntrySection(),
                            _horizontalDivider(),
                            Expanded(
                              flex: 5,
                              child: SizedBox(
                                child: Row(
                                  children: [
                                    BlocConsumer<CardFunctionalityCubit,
                                            CardFunctionalityState>(
                                        listener: (context, state) {},
                                        builder: (context, cardState) {
                                          return widget.isFullfill &&
                                                  cardState.productNamesByType
                                                          .length >
                                                      2
                                              ? _differentTypeProductSelectionWidget(
                                                  cardState)
                                              : const SizedBox();
                                        }),
                                    BlocConsumer<CardFunctionalityCubit,
                                            CardFunctionalityState>(
                                        listener: (context, state) {},
                                        builder: (context, cardState) {
                                          return widget.isFullfill &&
                                                  cardState.productNamesByType
                                                          .length >
                                                      2
                                              ? Container(
                                                  width: 1,
                                                  color: _theme
                                                      .dialogFooterInnerShadow)
                                              : const SizedBox();
                                        }),
                                    widget.qnty > 1
                                        ? _multiCardSection()
                                        : _singleCardSection(),
                                    Container(
                                        width: 1,
                                        color: _theme.dialogFooterInnerShadow),
                                    _cardRHS()
                                  ],
                                ),
                              ),
                            ),
                            _horizontalDivider(),
                            _bottomsButtons()
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: _notificationBar,
                ),
              ],
            ),
            BlocBuilder<CardFunctionalityCubit, CardFunctionalityState>(
                builder: (context, cardState) {
              if (cardState.isError) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _notificationBar?.showMessage(
                      cardState.statusMessage.toString(), _theme.footerBG3!);
                  _resetLoaderAndMessage();
                });
              } else if (cardState.isSuccess) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _notificationBar?.showMessage(
                      cardState.statusMessage.toString(), _theme.footerBG4!);
                  _resetLoaderAndMessage();
                });
              }
              return cardState.isCardFuctionlitySectionLoading
                  ? Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: _screenWidth,
                        height: _screenHeight,
                        decoration: BoxDecoration(
                          color: _theme.secondaryColor!.withOpacity(.3),
                        ),
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                                color: _theme.backGroundColor,
                                borderRadius:
                                     BorderRadius.all(Radius.circular(SizeConfig.getSize(8)))),
                            width: _screenWidth * .25,
                            child: Padding(
                              padding:  EdgeInsets.all(SizeConfig.getSize(20)),
                              child: Row(children: [
                                 SizedBox(width: SizeConfig.getSize(8)),
                                SizedBox(
                                    height: SizeConfig.getSize(40),
                                    width: SizeConfig.getSize(40),
                                    child:  CircularProgressIndicator(strokeWidth: SizeConfig.getSize(5),)),
                                 SizedBox(width: SizeConfig.getSize(20)),
                                Expanded(
                                    child: Text(cardState.statusMessage ?? '', style:_theme.description2!.copyWith(fontSize:SizeConfig.getFontSize(18)))),
                              ]),
                            ),
                          ),
                        ),
                      ))
                  : const SizedBox();
            }),
            BlocConsumer<TransactionCubit, TransactionCubitState>(
                listener: (context, state) {
                  if(state.isCardFunctionalityDialogShown == true) {
                    if(state.barcodeReadData != null) {
                      if (state.barcodeReadData?.length != 8) {
                        _notificationBar?.showMessage(
                            MessagesProvider.get('Invalid card number &1 ', ["${state.barcodeReadData}"]),
                            _theme.footerBG3!);
                      } else {
                        _notificationBar?.showMessage(
                            MessagesProvider.get("Barcode data read successfully."),
                            _theme.footerBG5!);
                        _enterCardNoTextController.text = state.barcodeReadData!;
                      }
                    }
                  }
                },
                builder: (context, state) {
                  return const SizedBox();
                }),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding:  EdgeInsets.fromLTRB(SizeConfig.getSize(8), SizeConfig.getSize(8), SizeConfig.getSize(8), 0),
        child: Container(
          decoration: BoxDecoration(
              color: _theme.backGroundColor,
              borderRadius:  BorderRadius.only(
                  topRight: Radius.circular(SizeConfig.getSize(8)), topLeft: Radius.circular(SizeConfig.getSize(8)))),
          child: Row(
            children: [
              Expanded(
                flex: _screenWidth > 700 ? 1 : 2,
                child: InkWell(
                  onTap: () {
                    _onBackPressed();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: _theme.button2InnerShadow1,
                          borderRadius:  BorderRadius.only(
                              bottomRight: Radius.circular(SizeConfig.getSize(8)),
                              topLeft: Radius.circular(SizeConfig.getSize(8)))),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 24,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              MessagesProvider.get('Input Cards').toUpperCase(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: _theme.headingLight4!
                                  .copyWith(color: _theme.light1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                        color: _theme.button1BG1,
                        borderRadius:  BorderRadius.only(
                            topRight: Radius.circular(SizeConfig.getSize(8)),
                            bottomLeft: Radius.circular(SizeConfig.getSize(8)))),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardEntrySection() {
    return Expanded(
      flex: 1,
      child: Center(
          child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                        _isNfcAvailable
                            ? MessagesProvider.get('Tap Card Or').toUpperCase()
                            : MessagesProvider.get("Enter Card No"),
                        style: _theme.heading6!
                            .copyWith(fontSize: SizeConfig.getWidth(22))),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: SizeConfig.getHeight(48),
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(100),
                            ],
                            controller: _enterCardNoTextController,
                            style: _theme.heading3!.copyWith(fontSize: SizeConfig.getFontSize(22)),
                            decoration: _textInputDecoration.copyWith(
                              hintText: MessagesProvider.get('Enter Card No'),
                              suffixIcon: _enterCardNoTextController
                                  .text.isNotEmpty
                                  ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      _enterCardNoTextController.clear();
                                    });
                                  },
                                  child: Icon(Icons.cancel_outlined,
                                      size: SizeConfig.getSize(35),
                                      color: _theme.secondaryColor!))
                                  : const SizedBox(),
                            ),
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.only(left: 4, right: 4),
                            minimumSize: Size(SizeConfig.getWidth(110),
                                SizeConfig.getWidth(48)),
                            maximumSize: Size(SizeConfig.getWidth(110),
                                SizeConfig.getWidth(48)),
                            backgroundColor: _theme.button2InnerShadow1!,
                          ),
                          onPressed: () {
                            if (_enterCardNoTextController.text == null ||
                                _enterCardNoTextController.text.isEmpty) {
                              FocusScope.of(context).unfocus();
                              _notificationBar?.showMessage(
                                  MessagesProvider.get(
                                      "Invalid card number. Card number is empty."),
                                  _theme.footerBG3!);
                            } else if (_enterCardNoTextController
                                    .text.isNotEmpty &&
                                !AppConstants.alphanumericRegEx.hasMatch(
                                    _enterCardNoTextController.text)) {
                              FocusScope.of(context).unfocus();
                              _notificationBar?.showMessage(
                                  MessagesProvider.get(
                                      "Special characters are not allowed."),
                                  _theme.footerBG3!);
                            } else if (_enterCardNoTextController.text.length !=
                                8) {
                              FocusScope.of(context).unfocus();
                              _notificationBar?.showMessage(
                                  '${MessagesProvider.get('Invalid Card Number length (&1). Should be &2', [
                                        '${_enterCardNoTextController.text.length}',
                                        '8'
                                      ])}',
                                  _theme.footerBG3!);
                            } else if (int.parse(context
                                    .read<CardFunctionalityCubit>()
                                    .state
                                    .listOfAppliedCards!
                                    .where(
                                        (element) => element.isApplied ?? false)
                                    .toList()
                                    .length
                                    .toString()) >=
                                widget.qnty) {
                              FocusScope.of(context).unfocus();
                              _notificationBar?.showMessage(
                                  "${MessagesProvider.get("You can load at most &1 Cards", [
                                        "${widget.qnty}"
                                      ])}",
                                  _theme.footerBG3!);
                            } else {
                              if (widget.isSplitCard &&
                                  context
                                      .read<CardFunctionalityCubit>()
                                      .state
                                      .listOfAppliedCards!
                                      .where((element) =>
                                          element.tagNumber ==
                                          _enterCardNoTextController.text
                                              .toString()
                                              .toUpperCase())
                                      .toList()
                                      .isNotEmpty) {
                                FocusScope.of(context).unfocus();
                                _notificationBar?.showMessage(
                                    "${_enterCardNoTextController.text} - ${MessagesProvider.get("Card already added")}",
                                    _theme.footerBG5!);
                              } else {
                                FocusScope.of(context).unfocus();
                                context
                                    .read<CardFunctionalityCubit>()
                                    .applyCard(
                                        productId: widget.productContainerDto
                                                ?.productId ??
                                            -1,
                                        isFullFill: widget.isFullfill,
                                        // cardType: widget
                                        //     .productContainerDto
                                        //     ?.productType ??
                                        //     '',
                                        productName: widget.productName ?? '',
                                        tagNumber: _enterCardNoTextController
                                            .text
                                            .toUpperCase());
                                _enterCardNoTextController.text = "";
                              }
                            }
                          },
                          child: Text(
                            MessagesProvider.get("Apply").toUpperCase(),
                            maxLines: 1,
                            style: _theme.descriptionLight1!
                                .copyWith(color: _theme.light1,fontSize:SizeConfig.getFontSize(18) ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                // width: _screenWidth > 700
                //     ? _screenWidth / 2.3
                //     : _screenWidth / 4,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: BlocSelector<CardFunctionalityCubit,
                          CardFunctionalityState, int>(
                      selector: (state) => state.appliedCardCount ?? 0,
                      builder: (context, appliedCardState) {
                        return RichText(
                          text: TextSpan(
                            text: '${MessagesProvider.get("Card Count")}:',
                            style: _theme.subtitle2!
                                .copyWith(fontSize: SizeConfig.getFontSize(20)),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' $appliedCardState ',
                                style: _theme.subtitle2!.copyWith(
                                    fontSize: SizeConfig.getFontSize(20)),
                              ),
                              TextSpan(
                                text: 'of',
                                style: _theme.subtitle2!.copyWith(
                                    fontSize: SizeConfig.getFontSize(20)),
                              ),
                              TextSpan(
                                text: ' ${widget.qnty} ',
                                style: _theme.subtitle2!.copyWith(
                                    fontSize: SizeConfig.getFontSize(20)),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget _cardRHS() {
    return Expanded(
        flex: 3,
        child: Padding(
          padding:  EdgeInsets.all(SizeConfig.getHeight(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: BlocSelector<CardFunctionalityCubit,
                                CardFunctionalityState, int>(
                            selector: (state) => state.appliedCardCount ?? 0,
                            builder: (context, appliedCardState) {
                              return RichText(
                                text: TextSpan(
                                  text: MessagesProvider.get("Mapped Cards:"),
                                  style: _theme.subtitle2!.copyWith(
                                      fontSize: SizeConfig.getFontSize(20)),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' $appliedCardState ',
                                        style: _theme.subtitle2!.copyWith(
                                            fontSize:
                                                SizeConfig.getFontSize(20))),
                                    TextSpan(
                                        text: 'of',
                                        style: _theme.subtitle2!.copyWith(
                                            fontSize:
                                                SizeConfig.getFontSize(20))),
                                    TextSpan(
                                        text: ' ${widget.qnty} ',
                                        style: _theme.subtitle2!.copyWith(
                                            fontSize:
                                                SizeConfig.getFontSize(20))),
                                  ],
                                ),
                              );
                            }),
                      ),
                       SizedBox(
                        height: SizeConfig.getSize(10),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(SizeConfig.getSize(6)),
                        child: Row(
                          children: [
                            BlocSelector<CardFunctionalityCubit,
                                    CardFunctionalityState, bool>(
                                selector: (state) => state.isSelectAllProducts,
                                builder: (context, cardState) {
                                  return InkWell(
                                      onTap: () {
                                        cardState
                                            ? context
                                                .read<CardFunctionalityCubit>()
                                                .unSelectAllCards()
                                            : context
                                                .read<CardFunctionalityCubit>()
                                                .selectAllCards();
                                      },
                                      child: Container(
                                        height: SizeConfig.getSize(30),
                                        width: SizeConfig.getSize(30),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(
                                            SizeConfig.getSize(SizeConfig.getSize(8)),
                                          )),
                                          border: Border.all(
                                              width: 1,
                                              color: _theme.secondaryColor!),
                                        ),
                                        child: cardState
                                            ? Center(
                                                child: Image.asset(
                                                    "assets/ic_check.png",
                                                    color:
                                                        _theme.secondaryColor),
                                              )
                                            : const SizedBox(),
                                      ));
                                }),
                            SizedBox(width: SizeConfig.getWidth(20)),
                            Expanded(
                              flex: 2,
                              child: Text(
                                MessagesProvider.get('Product Name'),
                                overflow: TextOverflow.ellipsis,
                                style: _theme.heading6!.copyWith(
                                    fontSize: SizeConfig.getFontSize(22)),
                              ),
                            ),
                            // const SizedBox(
                            //   width: 20,
                            // ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                MessagesProvider.get('Card Number'),
                                overflow: TextOverflow.ellipsis,
                                style: _theme.heading6!.copyWith(
                                    fontSize: SizeConfig.getFontSize(22)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: SizedBox(
                            child: Scrollbar(
                                radius: const Radius.circular(6),
                                thumbVisibility: true,
                                controller: _scrollController,
                                child: widget.isSplitCard
                                    ? _splitCardsList()
                                    : _normalCardsList())),
                      ),
                      Container(
                        height: 1,
                        color: _theme.dialogFooterInnerShadow,
                      ),
                       SizedBox(
                        height: SizeConfig.getHeight(5),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.only(left:4,right:4),
                              minimumSize: Size(SizeConfig.getWidth(115), SizeConfig.getHeight(48)),
                              maximumSize:   Size(SizeConfig.getWidth(115), SizeConfig.getHeight(48)),
                              backgroundColor: _theme.button1BG1,
                            ),
                            onPressed: () {
                              final cardFunctionalityCubit =
                                  context.read<CardFunctionalityCubit>();
                              if (cardFunctionalityCubit
                                  .state.listOfAppliedCards!
                                  .where(
                                      (element) => element.isSelected ?? false)
                                  .toList()
                                  .isNotEmpty) {
                                Log.v(
                                    'lengthOfCards : ${cardFunctionalityCubit.state.listOfAppliedCards!.length}');
                                context
                                    .read<CardFunctionalityCubit>()
                                    .cancelCard();
                              } else {
                                _notificationBar?.showMessage(
                                    MessagesProvider.get(
                                        "Please select a record to proceed"),
                                    _theme.footerBG5!);
                              }
                            },
                            child: Text(
                              MessagesProvider.get("Remove\nCards")
                                  .toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: _theme.description1!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                            )),
                        const SizedBox(
                          width: 16,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.only(left:4,right:4),
                              minimumSize:  Size(SizeConfig.getWidth(115), SizeConfig.getHeight(48)),
                              maximumSize:   Size(SizeConfig.getWidth(115), SizeConfig.getHeight(48)),
                              backgroundColor: _theme.button2InnerShadow1!,
                            ),
                            onPressed: widget.qnty == 1
                                ? null
                                : () {
                                    context
                                        .read<CardFunctionalityCubit>()
                                        .swapCards();
                                  },
                            child: Text(
                              MessagesProvider.get("Swap").toUpperCase(),
                              style: _theme.descriptionLight1!
                                  .copyWith(color: _theme.light1,fontSize:SizeConfig.getFontSize(18) ),
                            ))
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }

  Widget _horizontalDivider() {
    return Container(
      height: 1,
      width: _screenWidth,
      color: _theme.light2,
    );
  }

  Widget _splitCardsList() {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Stack(
                  children: [
                    BlocSelector<CardFunctionalityCubit, CardFunctionalityState,
                            bool>(
                        selector: (state) => state.isSelectAllProducts,
                        builder: (context, cardState) {
                          return Container(
                              padding: const EdgeInsets.only(left: 29),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: cardState
                                          ? _theme.secondaryColor!
                                          : _theme.transparentColor!),
                                  color: _theme.button1BG1!,
                                  borderRadius:  BorderRadius.all(
                                      Radius.circular(SizeConfig.getSize(8)))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BlocBuilder<CardFunctionalityCubit,
                                        CardFunctionalityState>(
                                    builder: (context, cardFncState) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: _theme.backGroundColor,
                                        borderRadius:  BorderRadius.all(
                                            Radius.circular(SizeConfig.getSize(8)))),
                                    child: ListView.builder(
                                        controller: _scrollController,
                                        itemCount: cardFncState
                                            .listOfAppliedCards!.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: _theme.button1BG1!,
                                                  borderRadius:
                                                       BorderRadius.all(
                                                          Radius.circular(SizeConfig.getSize(8)))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        5, 5, 0, 5),
                                                child: Row(
                                                  children: [
                                                    const SizedBox(width: 10),
                                                    Expanded(
                                                      flex: 2,
                                                      child: BlocBuilder<
                                                              CardFunctionalityCubit,
                                                              CardFunctionalityState>(
                                                          builder: (context,
                                                              cardState) {
                                                        return SizedBox(
                                                          child: Text(
                                                            cardState
                                                                    .listOfAppliedCards!
                                                                    .isNotEmpty
                                                                ? (cardState
                                                                        .listOfAppliedCards?[
                                                                            index]
                                                                        .productName ??
                                                                    '')
                                                                : '',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: _theme
                                                                .heading6!
                                                                .copyWith(
                                                                    fontSize: SizeConfig
                                                                        .getFontSize(
                                                                            22)),
                                                          ),
                                                        );
                                                      }),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: BlocBuilder<
                                                              CardFunctionalityCubit,
                                                              CardFunctionalityState>(
                                                          builder: (context,
                                                              cardState) {
                                                        return SizedBox(
                                                          child: Text(
                                                            cardState
                                                                    .listOfAppliedCards!
                                                                    .isNotEmpty
                                                                ? (cardState
                                                                        .listOfAppliedCards?[
                                                                            index]
                                                                        .tagNumber ??
                                                                    '')
                                                                : '',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: _theme
                                                                .heading6!
                                                                .copyWith(
                                                                    fontSize: SizeConfig
                                                                        .getFontSize(
                                                                            22)),
                                                          ),
                                                        );
                                                      }),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  );
                                }),
                              ));
                        }),
                    Positioned(
                      top: 12,
                      left: 5,
                      child: BlocSelector<CardFunctionalityCubit,
                              CardFunctionalityState, bool>(
                          selector: (state) => state.isSelectAllProducts,
                          builder: (context, cardState) {
                            return InkWell(
                                onTap: () {
                                  cardState
                                      ? context
                                          .read<CardFunctionalityCubit>()
                                          .unSelectAllCards()
                                      : context
                                          .read<CardFunctionalityCubit>()
                                          .selectAllCards();
                                },
                                child: Container(
                                  height:SizeConfig.getSize(30),
                                  width: SizeConfig.getSize(30),
                                  decoration: BoxDecoration(
                                    borderRadius:  BorderRadius.all(
                                        Radius.circular(SizeConfig.getSize(8))),
                                    border: Border.all(
                                        width: 1,
                                        color: _theme.secondaryColor!),
                                  ),
                                  child: cardState
                                      ? Center(
                                          child: Image.asset(
                                              "assets/ic_check.png",
                                              color: _theme.secondaryColor),
                                        )
                                      : const SizedBox(),
                                ));
                          }),
                    ),
                  ],
                ),
              )
              // Expanded(child: _normalCardsList())
            ],
          ),
        ),
      ),
    );
  }

  Widget _normalCardsList() {
    return BlocBuilder<CardFunctionalityCubit, CardFunctionalityState>(
        builder: (context, cardFncState) {
      final cardList = widget.isFullfill
          ? cardFncState.selectedProductGroup == "ALL"
              ? cardFncState.listOfAppliedCards ?? []
              : (cardFncState.listOfAppliedCards ?? [])
                  .where((element) =>
                      element.productName == cardFncState.selectedProductGroup)
                  .toList()
          : cardFncState.listOfAppliedCards ?? [];
      return SizedBox(
        child: ListView.builder(
            controller: _scrollController,
            itemCount: cardList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: cardList[index].isSelected ?? false
                              ? _theme.secondaryColor!
                              : _theme.transparentColor!),
                      color: _theme.button1BG1!,
                      borderRadius:  BorderRadius.all(Radius.circular(SizeConfig.getSize(8)))),
                  child: Padding(
                    padding:  EdgeInsets.fromLTRB(SizeConfig.getSize(6), SizeConfig.getSize(6), 0, SizeConfig.getSize(6)),
                    child: Row(
                      children: [
                        BlocBuilder<CardFunctionalityCubit,
                                CardFunctionalityState>(
                            builder: (context, cardState) {
                          return InkWell(
                              onTap: () {
                                if (cardList.isNotEmpty) {
                                  if (widget.isFullfill) {
                                    final index1 =
                                        (cardFncState.listOfAppliedCards ?? [])
                                            .indexWhere((element) =>
                                                element.tagNumber ==
                                                cardList[index].tagNumber);

                                    cardList[index].isSelected ?? false
                                        ? context
                                            .read<CardFunctionalityCubit>()
                                            .onUnSelectCards(index1)
                                        : context
                                            .read<CardFunctionalityCubit>()
                                            .onSelectCards(index1);
                                  } else {
                                    cardList[index].isSelected ?? false
                                        ? context
                                            .read<CardFunctionalityCubit>()
                                            .onUnSelectCards(index)
                                        : context
                                            .read<CardFunctionalityCubit>()
                                            .onSelectCards(index);
                                  }
                                }
                              },
                              child: Container(
                                height: SizeConfig.getSize(30),
                                width: SizeConfig.getSize(30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(SizeConfig.getSize(SizeConfig.getSize(8)))),
                                  border: Border.all(
                                      width: 1, color: _theme.secondaryColor!),
                                ),
                                child: cardList.isNotEmpty
                                    ? cardList[index].isSelected ?? false
                                        ? Center(
                                            child: Image.asset(
                                                "assets/ic_check.png",
                                                color: _theme.secondaryColor),
                                          )
                                        : const SizedBox()
                                    : const SizedBox(),
                              ));
                        }),
                        SizedBox(
                          width: SizeConfig.getSize(20),
                        ),
                        Expanded(
                          flex: 2,
                          child: BlocBuilder<CardFunctionalityCubit,
                                  CardFunctionalityState>(
                              builder: (context, cardState) {
                            return SizedBox(
                              child: Text(
                                cardList.isNotEmpty
                                    ? (cardList?[index].productName ?? '')
                                    : '',
                                overflow: TextOverflow.ellipsis,
                                style: _theme.heading6!.copyWith(
                                    fontSize: SizeConfig.getFontSize(22)),
                              ),
                            );
                          }),
                        ),
                        Expanded(
                          flex: 2,
                          child: BlocBuilder<CardFunctionalityCubit,
                                  CardFunctionalityState>(
                              builder: (context, cardState) {
                            return SizedBox(
                              child: Text(
                                cardList.isNotEmpty
                                    ? (cardList?[index].tagNumber ?? '')
                                    : '',
                                overflow: TextOverflow.ellipsis,
                                style: _theme.heading6!.copyWith(
                                    fontSize: SizeConfig.getFontSize(22)),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
    });
  }

  Widget _singleCardSection() {
    return Expanded(
        flex: 3,
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 2,
                child: Center(
                    child: Image.asset("assets/ic_tap_card.png",
                        color: _theme.secondaryColor)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                MessagesProvider.get('Tap Card').toUpperCase(),
                style: _theme.heading6!
                    .copyWith(fontSize: SizeConfig.getFontSize(22)),
              ),
              Expanded(flex: 1, child: Container())
            ],
          ),
        ));
  }

  Widget _multiCardSection() {
    return Expanded(
        flex: 3,
        child: Padding(
          padding:  EdgeInsets.fromLTRB(SizeConfig.getSize(8), 0, SizeConfig.getSize(8), SizeConfig.getSize(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${MessagesProvider.get('Serial#')} ${MessagesProvider.get('From')}',
                                  overflow: TextOverflow.ellipsis,
                                  style: _theme.heading6!.copyWith(
                                      fontSize: SizeConfig.getFontSize(22)),
                                ),
                                 SizedBox(
                                  height: SizeConfig.getSize(5),
                                ),
                                SizedBox(
                                  height: SizeConfig.getHeight(48),
                                  child: TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(100),
                                    ],
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return MessagesProvider.get("Enter");
                                      }
                                      return null;
                                    },
                                    controller:
                                        _enterSerialNoFromTextController,
                                    style: _theme.heading3!.copyWith(fontSize: SizeConfig.getFontSize(22)),
                                    decoration:_textInputDecoration
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${MessagesProvider.get('Serial#')} ${MessagesProvider.get('To')}',
                                  overflow: TextOverflow.ellipsis,
                                  style: _theme.heading6!.copyWith(
                                      fontSize: SizeConfig.getFontSize(22)),
                                ),
                                 SizedBox(
                                  height:SizeConfig.getSize(5),
                                ),
                                SizedBox(
                                  height:  SizeConfig.getHeight(48),
                                  child: TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(100),
                                    ],
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return MessagesProvider.get("Enter");
                                      }
                                      return null;
                                    },
                                    controller: _enterSerialNoToTextController,
                                    style: _theme.heading3!.copyWith(fontSize: SizeConfig.getFontSize(20)),
                                    decoration: _textInputDecoration,
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              '',
                              overflow: TextOverflow.ellipsis,
                              style: _theme.heading6!.copyWith(
                                  fontSize: SizeConfig.getFontSize(22)),
                            ),
                            SizedBox(
                              height: SizeConfig.getSize(5),
                            ),

                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.only(left:4, right:4),
                                  minimumSize:Size(SizeConfig.getWidth(110), SizeConfig.getHeight(48)),
                                  maximumSize:   Size(SizeConfig.getWidth(110), SizeConfig.getHeight(48)),
                                  backgroundColor: _theme.button2InnerShadow1!,
                                ),
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  if(_enterSerialNoFromTextController.text.isEmpty || _enterSerialNoToTextController
                                      .text.isEmpty){
                                    _notificationBar?.showMessage(MessagesProvider.get("Serial# From or Serial# To Cannot be empty"), _theme.footerBG3!);
                                  }else {
                                    context
                                        .read<CardFunctionalityCubit>()
                                        .getSerialNo(
                                        productId: widget.productContainerDto
                                            ?.productId ??
                                            -1,
                                        fromNo: _enterSerialNoFromTextController.text,
                                        toNo: _enterSerialNoToTextController
                                            .text,
                                        isAlreadyInUse: "N");
                                  }

                                },
                                child: Text(
                                  MessagesProvider.get("Get").toUpperCase(),
                                  style: _theme.descriptionLight1!
                                      .copyWith(color: _theme.light1,fontSize:SizeConfig.getFontSize(18)),
                                ))
                          ],
                        )
                      ],
                    ),
                     SizedBox(
                      height: SizeConfig.getSize(5),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {

                            context
                                    .read<CardFunctionalityCubit>()
                                    .state
                                    .isSelectedAllSerialNos
                                ? context
                                    .read<CardFunctionalityCubit>()
                                    .onUnSelectAllSerialNos()
                                : context
                                    .read<CardFunctionalityCubit>()
                                    .onSelectAllSerialNos();
                          },
                          child: BlocSelector<CardFunctionalityCubit,
                                  CardFunctionalityState, bool>(
                              selector: (state) => state.isSelectedAllSerialNos,
                              builder: (context, cardState) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Container(
                                    height: SizeConfig.getSize(30),
                                    width: SizeConfig.getSize(30),
                                    decoration: BoxDecoration(
                                      borderRadius:  BorderRadius.all(
                                          Radius.circular(SizeConfig.getSize(8))),
                                      border: Border.all(
                                          width: 1,
                                          color: _theme.secondaryColor!),
                                    ),
                                    child: cardState
                                        ? Center(
                                            child: Image.asset(
                                                "assets/ic_check.png",
                                                color: _theme.secondaryColor),
                                          )
                                        : const SizedBox(),
                                  ),
                                );
                              }),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: Text(
                            MessagesProvider.get('Serial#'),
                            style: _theme.heading6!
                                .copyWith(fontSize: SizeConfig.getFontSize(22)),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            MessagesProvider.get('CardNumber'),
                            style: _theme.heading6!
                                .copyWith(fontSize: SizeConfig.getFontSize(22)),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 30,
                      child: BlocBuilder<CardFunctionalityCubit,
                              CardFunctionalityState>(
                          builder: (context, cardFncState) {
                        return Scrollbar(
                          radius: const Radius.circular(6),
                          thumbVisibility: true,
                          controller: _slNoScrollController,
                          child: ListView.builder(
                              controller: _slNoScrollController,
                              shrinkWrap: true,
                              // physics:const NeverScrollableScrollPhysics(),
                              itemCount:
                                  cardFncState.listOfSerialNumberData!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: _theme.button1BG1!,
                                        border: Border.all(
                                            width: 1,
                                            color: context
                                                    .read<
                                                        CardFunctionalityCubit>()
                                                    .state
                                                    .listOfSelectedSerialNos
                                                    .contains(cardFncState
                                                        .listOfSerialNumberData![
                                                            index]
                                                        .tagNumber)
                                                ? _theme.secondaryColor!
                                                : _theme.transparentColor!),
                                        borderRadius:  BorderRadius.all(
                                            Radius.circular(SizeConfig.getSize(8)))),
                                    child: Padding(
                                      padding:  EdgeInsets.all(SizeConfig.getSize(6)),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              final cardFunctionState =
                                                  context.read<
                                                      CardFunctionalityCubit>();
                                              cardFunctionState.state
                                                      .listOfSelectedSerialNos
                                                      .contains(cardFncState
                                                          .listOfSerialNumberData![
                                                              index]
                                                          .tagNumber)
                                                  ? cardFunctionState
                                                      .onUnSelectSerialNos(
                                                          cardFncState
                                                              .listOfSerialNumberData![
                                                                  index]
                                                              .tagNumber)
                                                  : cardFunctionState
                                                      .onSelectSerialNumber(
                                                          cardFncState
                                                              .listOfSerialNumberData![
                                                                  index]
                                                              .tagNumber);
                                            },
                                            child: BlocSelector<
                                                    CardFunctionalityCubit,
                                                    CardFunctionalityState,
                                                    List<String>>(
                                                selector: (state) => state
                                                    .listOfSelectedSerialNos,
                                                builder: (context, cardState) {
                                                  return Container(
                                                    height: SizeConfig.getSize(30),
                                                    width: SizeConfig.getSize(30),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                           BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  SizeConfig.getSize(8))),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: _theme
                                                              .secondaryColor!),
                                                    ),
                                                    child: cardState.contains(
                                                            cardFncState
                                                                .listOfSerialNumberData![
                                                                    index]
                                                                .tagNumber)
                                                        ? Center(
                                                            child: Image.asset(
                                                              "assets/ic_check.png",
                                                              color: _theme
                                                                  .secondaryColor,
                                                            ),
                                                          )
                                                        : const SizedBox(),
                                                  );
                                                }),
                                          ),
                                          const SizedBox(width: 20),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              '${cardFncState.listOfSerialNumberData![index].serialNumber}',
                                              style: _theme.heading6!.copyWith(
                                                  fontSize:
                                                      SizeConfig.getFontSize(
                                                          22)),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              children: [
                                                Text(
                                                  '${cardFncState.listOfSerialNumberData![index].tagNumber}',
                                                  style: _theme.heading6!
                                                      .copyWith(
                                                          fontSize: SizeConfig
                                                              .getFontSize(22)),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  width: SizeConfig.getSize(30),
                                                  height: SizeConfig.getSize(30),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          _theme.secondaryColor,
                                                      borderRadius:
                                                           BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  SizeConfig.getSize(8)))),
                                                  child: cardFncState
                                                          .listOfAppliedCards!
                                                          .where((element) =>
                                                              element
                                                                  .tagNumber ==
                                                              cardFncState
                                                                  .listOfSerialNumberData![
                                                                      index]
                                                                  .tagNumber)
                                                          .toList()
                                                          .isNotEmpty
                                                      ? Icon(
                                                          Icons.check_circle,
                                                          color: _theme
                                                              .primaryColor,
                                                    size: SizeConfig.getSize(25),
                                                        )
                                                      : Center(
                                                          child: Container(
                                                            width: SizeConfig.getSize(30),
                                                            height: SizeConfig.getSize(30),
                                                            decoration: BoxDecoration(
                                                                color: _theme
                                                                    .secondaryColor,
                                                                borderRadius:
                                                                     BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            SizeConfig.getSize(8))),
                                                                border: Border.all(
                                                                    color: _theme
                                                                        .primaryColor!,
                                                                    width: SizeConfig.getSize(2))),
                                                            child: Center(
                                                              child: Text("!",
                                                                  style: TextStyle(
                                                                      color: _theme
                                                                          .primaryColor!,
                                                                      fontSize:
                                                                      SizeConfig.getSize(25))),
                                                            ),
                                                          ),
                                                        ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        );
                      }),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(),
                    ),
                    Container(
                      height: 1,
                      color: _theme.dialogFooterInnerShadow,
                    ),
                     SizedBox(
                      height:SizeConfig.getHeight(4),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.only(left:4,right:4),
                              minimumSize: Size(SizeConfig.getWidth(115), SizeConfig.getHeight(48)),
                              maximumSize:   Size(SizeConfig.getWidth(115), SizeConfig.getHeight(48)),
                              backgroundColor: _theme.button1BG1,
                            ),
                            onPressed: () {
                              final cardFunctionState =
                                  context.read<CardFunctionalityCubit>();
                              if (cardFunctionState
                                  .state.listOfSelectedSerialNos.isNotEmpty) {
                                cardFunctionState.removeSerialNumber();
                              } else {
                                _notificationBar!.showMessage(
                                    MessagesProvider.get(
                                        "Please select a record to proceed"),
                                    _theme.footerBG5!);
                              }
                              // widget.onCancel("value");
                            },
                            child: Text(
                              MessagesProvider.get("Remove").toUpperCase(),
                              style: _theme.description1!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                            )),
                        const SizedBox(
                          width: 16,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.only(left:4,right:4),
                              minimumSize: Size(SizeConfig.getWidth(115), SizeConfig.getHeight(48)),
                              maximumSize:   Size(SizeConfig.getWidth(115), SizeConfig.getHeight(48)),
                              backgroundColor: _theme.button2InnerShadow1!,
                            ),
                            onPressed: () {
                              // _showFeatureNotImplementedDialog("Map");
                              final cardFunctionState =
                                  context.read<CardFunctionalityCubit>();
                              int? serialNoSelectedIndex;
                              int? selectedCardIndex;
                              // print("data1 ${jsonEncode(cardFunctionState.state.listOfAppliedCards!.where((e) => e.isSelected == true).toList().length)}");
                              if (cardFunctionState.state.listOfAppliedCards!
                                          .where((e) => e.isSelected == true)
                                          .toList()
                                          .length ==
                                      1 &&
                                  cardFunctionState.state
                                          .listOfSelectedSerialNos.length ==
                                      1 &&
                                  !widget.isSplitCard) {
                                for (var i = 0;
                                    i <
                                        cardFunctionState.state
                                            .listOfSerialNumberData!.length;
                                    i++) {
                                  for (var j = 0;
                                      j <
                                          cardFunctionState.state
                                              .listOfSelectedSerialNos.length;
                                      j++) {
                                    if (cardFunctionState
                                            .state
                                            .listOfSerialNumberData![i]
                                            .tagNumber ==
                                        cardFunctionState
                                            .state.listOfSelectedSerialNos[j]) {
                                      serialNoSelectedIndex = i;
                                    }
                                  }
                                }
                                for (var i = 0;
                                    i <
                                        cardFunctionState
                                            .state.listOfAppliedCards!.length;
                                    i++) {
                                  if (cardFunctionState.state
                                          .listOfAppliedCards![i].isSelected ==
                                      true) {
                                    selectedCardIndex = i;
                                  }
                                }
                                if (selectedCardIndex != null ||
                                    serialNoSelectedIndex != null) {
                                  cardFunctionState.mapCards(
                                      isSplitCard: widget.isSplitCard,
                                      serialNoIndex: serialNoSelectedIndex ?? 0,
                                      cardsIndex: selectedCardIndex ?? 0);
                                } else {
                                  // print("test");
                                  _notificationBar?.showMessage(
                                      MessagesProvider.get(
                                          'It is possible to map one card at a time, so please select each one from both sides.'),
                                      _theme.footerBG5!);
                                }
                              } else if (widget.isSplitCard &&
                                  cardFunctionState.state
                                          .listOfSelectedSerialNos.length ==
                                      1 &&
                                  cardFunctionState.state.listOfAppliedCards!
                                          .where((e) => e.isSelected == true)
                                          .toList()
                                          .length >
                                      1) {
                                for (var i = 0;
                                    i <
                                        cardFunctionState.state
                                            .listOfSerialNumberData!.length;
                                    i++) {
                                  for (var j = 0;
                                      j <
                                          cardFunctionState.state
                                              .listOfSelectedSerialNos.length;
                                      j++) {
                                    if (cardFunctionState
                                            .state
                                            .listOfSerialNumberData![i]
                                            .tagNumber ==
                                        cardFunctionState
                                            .state.listOfSelectedSerialNos[j]) {
                                      serialNoSelectedIndex = i;
                                    }
                                  }
                                }
                                if (serialNoSelectedIndex != null) {
                                  cardFunctionState.mapCards(
                                    isSplitCard: widget.isSplitCard,
                                    serialNoIndex: serialNoSelectedIndex ?? 0,
                                  );
                                } else {
                                  // print("test");
                                  _notificationBar?.showMessage(
                                      MessagesProvider.get(
                                          'It is possible to map one card at a time, so please select each one from both sides.'),
                                      _theme.footerBG5!);
                                }
                              } else {
                                // print("test3mb");
                                _notificationBar?.showMessage(
                                    MessagesProvider.get(
                                        'It is possible to map one card at a time, so please select each one from both sides.'),
                                    _theme.footerBG5!);
                              }
                            },
                            child: Text(
                              MessagesProvider.get("Map").toUpperCase(),
                              style: _theme.descriptionLight1!
                                  .copyWith(color: _theme.light1,fontSize:SizeConfig.getFontSize(18)),
                            ))
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }

  Widget _bottomsButtons() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding:  EdgeInsets.all(SizeConfig.getHeight(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding :const EdgeInsets.only(left:4,right:4),
                  minimumSize:  Size(SizeConfig.getWidth(120), SizeConfig.getHeight(48)),
                  maximumSize:   Size(SizeConfig.getWidth(120), SizeConfig.getHeight(48)),
                  backgroundColor: _theme.button1BG1,
                ),
                onPressed: () {
                  context.read<TransactionCubit>().setIsCardFunctionalityDialogShown(false);
                  final cardFunctionalityCubit =
                      context.read<CardFunctionalityCubit>();
                  if (cardFunctionalityCubit
                      .state.listOfAppliedCards!.isNotEmpty) {
                    context
                        .read<CardFunctionalityCubit>()
                        .cancelAllCards(
                            productName: widget.productName ?? '',
                            quantity: widget.qnty)
                        .then((value) => Navigator.pop(context));
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  MessagesProvider.get("Cancel").toUpperCase(),
                  style: _theme.description1!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                )),
            const SizedBox(
              width: 16,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding :const EdgeInsets.only(left:4,right:4),
                  minimumSize:  Size(SizeConfig.getWidth(120), SizeConfig.getHeight(48)),
                  maximumSize:  Size(SizeConfig.getWidth(120), SizeConfig.getHeight(48)),
                  backgroundColor: _theme.button1BG1,
                ),
                onPressed: () {
                  final cardFunctionalityCubit =
                      context.read<CardFunctionalityCubit>();
                  if (cardFunctionalityCubit
                      .state.listOfAppliedCards!.isNotEmpty) {
                    context.read<CardFunctionalityCubit>().cancelAllCards(
                        productName: widget.productName ?? '',
                        quantity: widget.qnty);
                  }
                },
                child: Text(
                  MessagesProvider.get("Clear").toUpperCase(),
                  style: _theme.description1!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                )),
            const SizedBox(
              width: 16,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding :const EdgeInsets.only(left:4,right:4),
                  minimumSize:  Size(SizeConfig.getWidth(120), SizeConfig.getHeight(48)),
                  maximumSize:  Size(SizeConfig.getWidth(120), SizeConfig.getHeight(48)),
                  backgroundColor: _theme.button2InnerShadow1!,
                ),
                onPressed: () {
                  try {
                    final cardFunctionalityState =
                        context.read<CardFunctionalityCubit>();
                    if (int.parse(cardFunctionalityState
                            .state.listOfAppliedCards!
                            .where((element) => element.isApplied ?? false)
                            .toList()
                            .length
                            .toString()) ==
                        widget.qnty) {
                      if (cardFunctionalityState
                          .state.listOfAppliedCards!.isNotEmpty) {
                        if (widget.isEdit) {
                          cardFunctionalityState
                              .updateCardProductLine(
                            transactionLineDTOs: widget.transactionLines ?? [],
                          )
                              .then((isSuccess) {
                            if (isSuccess) {
                              widget.onSuccess(cardFunctionalityState
                                  .state.transactionResponse!.data!);
                              widget.showNotification(
                                  '${MessagesProvider.get('Updated the details successfully for product &1', [
                                    '${widget.productName}'
                                  ])}');
                              Navigator.pop(context);
                            }
                          });
                        } else if (widget.isFullfill) {
                          Navigator.pop(context);
                          widget.onFullfillProduct(
                              cardFunctionalityState.state.listOfAppliedCards);
                        } else {
                          cardFunctionalityState
                              .addCardsToLine(
                                  approverID: widget.approverID,
                                  isSplitCard: widget.isSplitCard,
                                  cardType:
                                      widget.productContainerDto?.productType ??
                                          '',
                                  variableAmount:
                                      widget.productContainerDto?.productType ==
                                              "VARIABLECARD"
                                          ? widget.variableAmount
                                          : null,
                                  seatNumber: widget.seatNumber,
                                  seatName: widget.selectedSeatName,
                                  productId:
                                      widget.productContainerDto?.productId ??
                                          -1,
                                  remarks: widget.remarks)
                              .then((isSuccess) {
                            if (isSuccess) {
                              widget.onSuccess(cardFunctionalityState
                                  .state.transactionResponse!.data!);
                              widget.showNotification('${MessagesProvider.get(
                                "Newly added product &1, Quantity : &2",
                                ['${widget.productName}', '${widget.qnty}'],
                              )}');
                              cardFunctionalityState.clearAllData();
                              Navigator.pop(context);
                            }
                          });
                        }
                      } else {
                        _notificationBar?.showMessage(
                            MessagesProvider.get(
                                'Please Tap Card/Enter Serial Number range'),
                            _theme.footerBG5!);
                      }
                    } else {
                      _notificationBar?.showMessage(
                          MessagesProvider.get(
                              'Please Tap Card/Enter Serial Number range'),
                          _theme.footerBG5!);
                    }
                  } catch (err) {
                    Log.v("errorCardAdding : $err");
                    _notificationBar?.showMessage(
                        MessagesProvider.get('Something went Wrong!'),
                        _theme.footerBG3!);
                  }
                },
                child: Text(
                  MessagesProvider.get("OK").toUpperCase(),
                  style:
                      _theme.descriptionLight1!.copyWith(color: _theme.light1, fontSize:SizeConfig.getFontSize(18)),
                ))
          ],
        ),
      ),
    );
  }

  Widget _differentTypeProductSelectionWidget(
      CardFunctionalityState cardState) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(MessagesProvider.get('Select Item'),
                    style: _theme.description2),
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Scrollbar(
                thumbVisibility: true,
                controller: _productGroupScrollController,
                child: Padding(
                  padding: const EdgeInsets.only(right:8.0),
                  child: ListView.builder(
                    controller: _productGroupScrollController,
                      itemCount: cardState.productNamesByType.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding:const EdgeInsets.all(4),
                              minimumSize: const Size(115, 42),
                              maximumSize: const Size(115, 42),
                              backgroundColor:
                                  cardState.productNamesByType.elementAt(index) ==
                                          cardState.selectedProductGroup
                                      ? _theme.button2InnerShadow1!
                                      : _theme.button1BG1,
                            ),
                            onPressed: () {
                              context
                                  .read<CardFunctionalityCubit>()
                                  .onSelectedProductNameGroup(
                                      cardState.productNamesByType.elementAt(index));
                            },
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      cardState.productNamesByType.elementAt(index),
                                      style: cardState.productNamesByType
                                                  .elementAt(index) ==
                                              cardState.selectedProductGroup
                                          ? _theme.subtitleLight3!
                                              .copyWith(color: _theme.light1,fontSize:SizeConfig.getFontSize(22))
                                          : _theme.subtitle3!.copyWith(fontSize:SizeConfig.getFontSize(22)),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  cardState.productNamesByType.elementAt(index) ==
                                          "ALL"
                                      ? const SizedBox(
                                          height: 1,
                                          width: 1,
                                        )
                                      : Icon(Icons.check_circle,
                                          color: cardState.productNamesByType
                                                      .elementAt(index) ==
                                                  cardState.selectedProductGroup
                                              ? _theme.light1
                                              : Colors.black,
                                  size:SizeConfig.getSize(30)
                                  )
                                ],
                              ),
                            ));
                      }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _enterCardNoTextController.clear();
    _enterSerialNoFromTextController.clear();
    _enterSerialNoToTextController.clear();
    _notificationBar = null;
    _isNfcAvailable ? _nfcManager?.stop() : null;
    _nfcManager = null;
  }
}
