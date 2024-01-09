import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nfc/nfc.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/colors.dart';
import 'package:other_function_ui/widgets/text_style.dart';
import 'package:messages_data/builder.dart';

class CardDetailsForm extends StatefulWidget {
  const CardDetailsForm({
    Key? key,
    required this.isNfcAvailable,
    this.isAddMultiple,
    required GlobalKey<FormState> formKey,
    required this.otherFunctionBloc,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final bool? isAddMultiple;
  final bool isNfcAvailable;
  final OtherFunctionBloc otherFunctionBloc;

  @override
  State<CardDetailsForm> createState() => _CardDetailsFormState();
}

class _CardDetailsFormState extends State<CardDetailsForm> {
  late NFCManager nfcManager;
  final FocusNode addressFocus = FocusNode();
  bool isEnable = false;

  @override
  void initState() {
    nfcManager = NFCManager();
    if (widget.isNfcAvailable) // listen only if the device is NFC enabled.
    {
      _startListeningForCardTaps();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      color: Colors.white,
      child: Form(
        key: widget._formKey,
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
                      bottom: MediaQuery.of(context).size.height * 0.05),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset('assets/ic_tap_card_large.png'),
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      focusNode: addressFocus,
                      onChanged: (value) {
                        if (value.length == 8) {
                          setState(() {
                            isEnable = true;
                          });
                        } else if (value.length != 8) {
                          setState(() {
                            isEnable = false;
                          });
                        }
                      },
                      controller: widget.otherFunctionBloc.cardController,
                      decoration: InputDecoration(
                          // helperText: '',
                          // counterText: '',
                          hintStyle: KTextStyle.hintTextStyle,
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.red,
                            ),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.red,
                            ),
                          ),
                          hintText: widget.isNfcAvailable
                              ? 'Tap or Enter Card Number'
                              : 'Enter Card Number'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () async {
                      if (widget._formKey.currentState!.validate() &&
                          isEnable) {
                        FocusScope.of(context).unfocus();
                        (widget.isAddMultiple ?? false)
                            ? widget.otherFunctionBloc.add(AddLinkCard(
                                widget.otherFunctionBloc.cardController.text))
                            : widget.otherFunctionBloc.add(
                                CardDetailEvent(widget
                                    .otherFunctionBloc.cardController.text),
                              );
                      }
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      shadowColor: CupertinoColors.label,
                      color: isEnable ? Colors.black : KColor.primaryBtnColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 12),
                        child: BlocProvider<OtherFunctionBloc>(
                          create: (_) => OtherFunctionBloc(),
                          child: BlocBuilder<OtherFunctionBloc,
                              OtherFunctionState>(
                            bloc: widget.otherFunctionBloc,
                            builder: (context, state) {
                              if (state is LoadingState) {
                                return const CircularProgressIndicator();
                              }
                              return Text(
                                  MessagesProvider.get('Apply').toUpperCase(),
                                  style: KTextStyle.backBtnText);
                            },
                          ),
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
    );
  }

  _startListeningForCardTaps() async {
    Stream<NFCReadData>? nfcReadDataStream = nfcManager.startScan();
    print("Initiated Nfc card scan");
    nfcReadDataStream.listen((data) {
      String cardId = data.readableData;
      print("Nfc Data : $cardId");
      if (cardId.length != 8) {
        // widget.notificationBar.showMessage(
        //     "${StringsProvider.get("invalid_card_number")} $cardId",
        //     AppColors.notificationBGRedColor);
      } else {
        // widget.notificationBar.showMessage(
        //     StringsProvider.get("card_read_successfully"),
        //     AppColors.notificationBGLightBlueColor);
        setState(() {
          widget.otherFunctionBloc.cardController.text = data.readableData;
          // _isEnabled = _cardNumberCtr.text.length == 8 ? true : false;
        });
      }
    });
  }
}
