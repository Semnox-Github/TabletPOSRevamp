import 'package:auto_size_text/auto_size_text.dart';
import 'package:customer_data/builder.dart';
import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:other_function_ui/widgets/text_style.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';

class CardNumberEntryDialog extends StatefulWidget {
  final VoidCallback onLoginViaCardSuccess;
  final NotificationBar notificationBar;
  final bool isNFCAvailable;
  final Function onSuccess;

/*
 final SystemUserLoginResponse? systemUserLoginResponse;
*/

  const CardNumberEntryDialog(
      {super.key,
      required this.onSuccess,
      required this.isNFCAvailable,
      required this.onLoginViaCardSuccess
/*, this.systemUserLoginResponse*/
      ,
      required this.notificationBar});

  @override
  State<StatefulWidget> createState() => _CardNumberEntryDialogState();
}

class _CardNumberEntryDialogState extends State<CardNumberEntryDialog> {
  final tapStatus = ValueNotifier<String?>(null);
  late NFCManager? nfcManager;
  final _cardNumberCtr = TextEditingController();
  var focusNode = FocusNode();
  AccountDetailsResponse? accounts;
  final ScrollController _verticalCtr = ScrollController();
  bool _isLoading = false;
  bool _isEnabled = false;
  late SemnoxTheme _theme;
  final _textFieldKey = GlobalKey();


  @override
  void initState() {
    super.initState();
    tapStatus.value =
        widget.isNFCAvailable ? MessagesProvider.get('Waiting...') : '';
    nfcManager = NFCManager();
    if (widget.isNFCAvailable) // listen only if the device is NFC enabled.
    {
      _startListeningForCardTaps();
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
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      alignment: Alignment.centerLeft,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: widget.isNFCAvailable ?
        MediaQuery.of(context).viewInsets.bottom == 0 ? EdgeInsets.only(top: SizeConfig.getSize(60)): EdgeInsets.only(top: SizeConfig.getSize(0)) :
        MediaQuery.of(context).viewInsets.bottom == 0 ? EdgeInsets.only(top: SizeConfig.getSize(60)):EdgeInsets.only(top: SizeConfig.getSize(0)),
        alignment: Alignment.center,
        //width: SizeConfig.screenWidth * 0.4,
        //: widget.isNFCAvailable?SizeConfig.screenHeight * 0.66:SizeConfig.screenHeight * 0.36,
        child: Scaffold(
          backgroundColor:  Colors.transparent,
          resizeToAvoidBottomInset: false,
          body: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: (SizeConfig.screenWidth * 0.38)+15,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top:SizeConfig.getSize(20), right:SizeConfig.getSize(10),),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        alignment: Alignment.topCenter,
                        margin: const EdgeInsets.only(left: 0.0,right: 0.0),
                        child: Container(
                          margin: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                            color: _theme.backGroundColor,
                          ),
                          child: SizedBox(
                            width: SizeConfig.screenWidth * 0.38,
                            // height: widget.isNFCAvailable?SizeConfig.screenHeight * 0.66:SizeConfig.screenHeight * 0.36,
                            child: Scroller(
                              controller: _verticalCtr,
                              child: SingleChildScrollView(
                                controller: _verticalCtr,
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
                                              ? MessagesProvider.get('Tap or Enter Card Number')
                                              : MessagesProvider.get('Enter Card Number'),
                                          style: _theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: _theme.dividerColor,
                                      height: SizeConfig.screenHeight * 0.0002,
                                    ),
                                    Visibility(
                                      visible: widget.isNFCAvailable,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: SizeConfig.screenHeight * 0.02),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: SizedBox(
                                            height: SizeConfig.getSize(200),
                                            width: SizeConfig.getSize(200),
                                            child: Image.asset(
                                              'assets/ic_tap_card_large.png',color: _theme.secondaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(visible: widget.isNFCAvailable,child: Text(MessagesProvider.get('Tap Card OR '),style: _theme.heading5?.copyWith(fontWeight: FontWeight.w700,fontSize: SizeConfig.getSize(18)),)),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width:SizeConfig.getSize(200),
                                            height: MediaQuery.of(context).size.height *
                                                0.0675,
                                            child:  TextFormField(
                                              key:_textFieldKey,
                                              controller: _cardNumberCtr,
                                              textAlign: TextAlign.start,
                                              readOnly: false,
                                              focusNode: focusNode,
                                              style: _theme.heading5?.copyWith(fontSize: SizeConfig.getSize(18)),
                                              decoration: InputDecoration(
                                                isDense: true,
                                                contentPadding:SizeConfig.isBigDevice()?
                                              const EdgeInsets.fromLTRB(
                                                  10, 10, 10, 10):const EdgeInsets.fromLTRB(
                                                  5, 5, 5, 5),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(SizeConfig.getSize(8))),
                                                    borderSide: BorderSide(
                                                        color: _theme.secondaryColor!)),
                                                focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(SizeConfig.getSize(8))),
                                                    borderSide: BorderSide(
                                                        color: _theme.secondaryColor!)),
                                                enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(SizeConfig.getSize(8))),
                                                    borderSide: BorderSide(
                                                        color: _theme.secondaryColor!)),
                                                hintText: MessagesProvider.get('Enter Card No'),
                                                hintStyle: _theme.heading5?.copyWith(fontWeight: FontWeight.w500,fontSize: SizeConfig.getSize(16)),
                                              ),
                                              onChanged: (value){
                                                setState(() {
                                                  widget.notificationBar.showMessage(
                                                      '',
                                                      _theme.primaryColor!);
                                                  tapStatus.value = '';
                                                  _cardNumberCtr.text = value;
                                                  _cardNumberCtr.selection = TextSelection.fromPosition(TextPosition(offset: _cardNumberCtr.text.length));
                                                  _isEnabled = value.length == 8 ? true:false;
                                                });
                                              },
                                              onTap: () {
                                                Scrollable.ensureVisible(_textFieldKey.currentContext!);
                                                setState(() {
                                                  _verticalCtr.animateTo(
                                                      _verticalCtr
                                                          .position.maxScrollExtent,
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
                                          Container(
                                            alignment: Alignment.center,
                                            height: SizeConfig.isBigDevice()? MediaQuery.of(context).size.height * 0.09 : MediaQuery.of(context).size.height * 0.1,
                                            width: MediaQuery.of(context).size.width * 0.18,
                                            padding:  EdgeInsets.all(SizeConfig.getSize(8)),
                                            child: ElevatedButton(
                                              onPressed:_isLoading?null: () {
                                                if(FocusScope.of(context).hasFocus) {
                                                  FocusScope.of(context).unfocus();
                                                }
                                                setState(() {
                                                  widget.notificationBar.showMessage(
                                                      '',
                                                      _theme.primaryColor!);
                                                  if(_cardNumberCtr.text.length == 8 && !_isLoading){
                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                    _getAccountDetails(context,_cardNumberCtr.value.text);
                                                    tapStatus.value = MessagesProvider.get('Card identified. Authenticating...');
                                                  }
                                                  else{
                                                    tapStatus.value =  MessagesProvider.get('Invalid Card Number length (&1). Should be &2',['${_cardNumberCtr.text.length}','8']);
                                                    widget.notificationBar.showMessage(
                                                        MessagesProvider.get('Invalid Card Number length (&1). Should be &2',['${_cardNumberCtr.text.length}','8']),
                                                        _theme.footerBG3!);
                                                  }
                                                });
                                              } ,
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.all(SizeConfig.getWidth(4)),
                                                backgroundColor:_theme.button2BG1!,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(
                                                      SizeConfig.getSize(8)),
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Visibility(
                                                    visible:!_isLoading,
                                                    child: Text(
                                                      MessagesProvider.get('APPLY'),
                                                      style: _theme.headingLight5?.copyWith(color:Colors.white,fontSize: SizeConfig.getFontSize(20)),
                                                    ),
                                                  ),
                                                  Visibility(
                                                    visible: _isLoading,
                                                    child: Container(
                                                      width: SizeConfig.getSize(35),
                                                      height:SizeConfig.getSize(35),
                                                      padding: const EdgeInsets.all(2.0),
                                                      child:  CircularProgressIndicator(
                                                        color: Colors.white,
                                                        strokeWidth: SizeConfig.getSize(4),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: tapStatus.value?.isNotEmpty == true
                                          ? true
                                          : false,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: SizeConfig.screenHeight * 0.0,
                                            bottom: SizeConfig.screenHeight * 0.02),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: AutoSizeText(
                                            tapStatus.value ?? '',
                                            style: _theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                          ),
                                        ),
                                      ),
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
                    child: GestureDetector(
                      onTap: (){
                        if(!_isLoading) {
                          nfcManager?.stop();
                          Navigator.of(context).pop();
                        }
                      },
                      child:  Align(
                        alignment: Alignment.topRight,
                        child: Opacity(
                          opacity: _isLoading ==true?0.7:1,
                          child: CircleAvatar(
                            radius: SizeConfig.getSize(25),
                            backgroundColor: _theme.button2InnerShadow1,
                            child: Icon(Icons.close, color: _theme.light1,size:SizeConfig.getSize(30) ,),
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
      ),
    );
  }

  void setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }

  Future _getAccountDetails(BuildContext context, String text) async {
    try{
      setLoadingStatus(true);
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();

      final customerDataBl = await CustomerDataBuilder.build(execContext!);
      accounts = await customerDataBl.getCustomerAccounts(
          customerId: -1, accountNumber: text);
      setState(() {
        setLoadingStatus(false);
        if (accounts?.data?[0].accountId == -1) {
          widget.notificationBar.showMessage(
              MessagesProvider.get('Could not process a new card.'),
              _theme.footerBG3!);
          tapStatus.value = MessagesProvider.get('Could not process a new card.');
        } else {
          print("technical card");
          if (accounts?.data?[0].technicianCard == "Y") {
            tapStatus.value = '';
            widget.notificationBar.showMessage(
                MessagesProvider.get(
                    'Technician Card (&1) not allowed for Transaction',
                    ['${accounts?.data?[0].tagNumber}']),
                _theme.footerBG3!);
          } else {
            print("successInsode");
            Navigator.pop(context);
            widget.onSuccess(accounts);
          }
        }
      });
    }on DioError catch (error) {
      widget.notificationBar.showMessage(_dioErrors(error),
          _theme.footerBG3!);
    }
    catch(er){
      setState(() {
        setLoadingStatus(false);
      });
      widget.notificationBar.showMessage(
          "${MessagesProvider.get("Invalid card number. Card number expected to be 8 characters.")}",
          _theme.footerBG3!);
    }


  }

  String _dioErrors(DioError e) {
    switch (e.type) {
      case DioErrorType.cancel:
        return "Request cancelled";

      case DioErrorType.connectTimeout:
        return "Connection time out";

      case DioErrorType.receiveTimeout:
        return "Connection time out";

      case DioErrorType.response:
        return e.response?.data['data'] as String ?? '';

      case DioErrorType.sendTimeout:
        return "Connection time out";

      default:
        return "Please check your connection";
    }
  }

  _startListeningForCardTaps() async {
    try{
      if(widget.isNFCAvailable){
        Stream<NFCReadData>? nfcReadDataStream = nfcManager?.startScan();
        nfcReadDataStream?.listen((data) {
          String cardId = data.readableData;
          print("Nfc Data : $cardId");
          if (cardId.length != 8) {
            tapStatus.value = widget.isNFCAvailable
                ? MessagesProvider.get(
                "Invalid card number. Card number expected to be 8 characters.")
                : '';
            widget.notificationBar.showMessage(
                "${MessagesProvider.get("Invalid card number. Card number expected to be 8 characters.")} $cardId",
                _theme.footerBG3!);
          } else {
            tapStatus.value = widget.isNFCAvailable
                ? MessagesProvider.get("Card read successfully.")
                : '';
            widget.notificationBar.showMessage(
                MessagesProvider.get("Card read successfully."),
                _theme.footerBG4!);
            setState(() {
              _cardNumberCtr.text = data.readableData;
              _isEnabled = _cardNumberCtr.text.length == 8 ? true : false;
            });
          }
        });
      }
    }catch(err){
      widget.notificationBar.showMessage(
          "${MessagesProvider.get("Something went wrong.")}",
          _theme.footerBG3!);
    }

  }
}
