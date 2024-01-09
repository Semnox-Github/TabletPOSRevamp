import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nfc/nfc.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/text_style.dart';
import 'package:messages_data/builder.dart';

class TransferCardDetailsForm extends StatefulWidget {
  final bool isTransferTo;
  final bool isNfcAvailable;
  final OtherFunctionBloc otherFunctionBloc;
  const TransferCardDetailsForm(
      {super.key,
      required this.isNfcAvailable,
      required this.isTransferTo,
      required this.otherFunctionBloc});

  @override
  State<TransferCardDetailsForm> createState() =>
      _TransferCardDetailsFormState();
}

class _TransferCardDetailsFormState extends State<TransferCardDetailsForm> {
  late NFCManager nfcManager;
  final _scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isEnable = false;
  @override
  void initState() {
    nfcManager = NFCManager();
    if (widget.isNfcAvailable) // listen only if the device is NFC enabled.
    {
      _startListeningForCardTaps();

      super.initState();
    }
  }

  _startListeningForCardTaps() async {
    if (widget.isNfcAvailable) {
      Stream<NFCReadData>? nfcReadDataStream = nfcManager.startScan();
      // Log.v("Initiated Nfc card scan");
      nfcReadDataStream.listen((data) {
        String cardId = data.readableData;
        // Log.v("Nfc Data : $cardId");
        if (cardId.length != 8) {
          // _notificationBar?.showMessage(
          //     "${StringsProvider.get("invalid_card_number")} $cardId",
          //     KColor.notificationBGRedColor);
        } else {
          // _notificationBar?.showMessage(
          //     StringsProvider.get("card_read_successfully"),
          //     KColor.notificationBGLightBlueColor);
          setState(() {
            widget.otherFunctionBloc.cardController.text = data.readableData;
          });
        }
      });
    } else {
      //TODO: NFC is not available
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Scrollbar(
        // interactive: true,
        radius: const Radius.circular(8),
        thumbVisibility: true,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: _isLoading
                        ? () {}
                        : () {
                            Navigator.pop(context);
                          },
                    child: Opacity(
                      opacity: _isLoading ? 0.5 : 1,
                      child: const Icon(
                        Icons.cancel,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Container(
                    width: 300,
                    color: Colors.white,
                    child: Form(
                      key: _formKey,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: widget.isNfcAvailable
                              ? MediaQuery.of(context).size.height * 0.7
                              : MediaQuery.of(context).size.height * 0.3,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Visibility(
                              visible: widget.isNfcAvailable,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.05),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                      'assets/ic_tap_card_large.png'),
                                ),
                              ),
                            ),
                            Text(
                              widget.isNfcAvailable
                                  ? 'Tap or Enter Card Number'
                                  : 'Enter Card Number',
                              textAlign: TextAlign.center,
                              style: KTextStyle.titleStyleBold,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  // width: 200,
                                  // height: 40,
                                  child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    // focusNode: addressFocus,
                                    onChanged: (value) {
                                      if (value.length == 8) {
                                        // print("trye");
                                        setState(() {
                                          _isEnable = true;
                                        });
                                      } else if (value.length != 8) {
                                        // print("false");
                                        setState(() {
                                          _isEnable = false;
                                        });
                                      }
                                    },
                                    autofocus: true,
                                    controller:
                                        widget.otherFunctionBloc.cardController,
                                    decoration: InputDecoration(
                                      // helperText: '',
                                      // counterText: '',
                                      hintStyle: KTextStyle.hintTextStyle,
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 20),
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.black,
                                        ),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.black,
                                        ),
                                      ),
                                      errorBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.red,
                                        ),
                                      ),
                                      focusedErrorBorder:
                                          const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.red,
                                        ),
                                      ),
                                      hintText: widget.isNfcAvailable
                                          ? 'Tap or Enter Card Number'
                                          : 'Enter Card Number',
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () async {
                                    if (_formKey.currentState!.validate() &&
                                        _isEnable) {
                                      FocusScope.of(context).unfocus();
                                      setState(() {
                                        _isLoading = true;
                                      });
                                      widget.isTransferTo
                                          ? widget.otherFunctionBloc.add(
                                              TransferToCardDetails(widget
                                                  .otherFunctionBloc
                                                  .cardController
                                                  .text),
                                            )
                                          : widget.otherFunctionBloc.add(
                                              CardDetailsByAccNumber(widget
                                                  .otherFunctionBloc
                                                  .cardController
                                                  .text));
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    shadowColor: CupertinoColors.label,
                                    color: _isEnable
                                        ? _isLoading
                                            ? Colors.white70
                                            : Colors.black
                                        : Colors.white70,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6.0, horizontal: 12),
                                      child: BlocBuilder<OtherFunctionBloc,
                                          OtherFunctionState>(
                                        bloc: widget.otherFunctionBloc,
                                        builder: (context, state) {
                                          if (state is LoadingState) {
                                            return const CircularProgressIndicator();
                                          }
                                          return Text(
                                              MessagesProvider.get('Apply')
                                                  .toUpperCase(),
                                              style: KTextStyle.backBtnText);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
        ),
      ),
    );
  }
}
