import 'package:auto_size_text/auto_size_text.dart';
import 'package:customer_data/builder.dart';
import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:customer_data/models/customer_search/customer_search_response.dart';
import 'package:customer_ui/providers/SelectedCardDetailsProvider.dart';
import 'package:customer_ui/providers/SelectedCustomerProvider.dart';
import 'package:customer_ui/utils/AppColors.dart';
import 'package:customer_ui/utils/AppStyle.dart';
import 'package:customer_ui/utils/size_config.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:transaction_ui/cubit/transaction_cubit_state.dart';
import 'package:widgets_library/scroller.dart';

class CustomerIdentificationViaCardDialog extends StatefulWidget {
  final VoidCallback onLoginViaCardSuccess;
  final NotificationBar notificationBar;
  final bool isNFCAvailable;

/*
 final SystemUserLoginResponse? systemUserLoginResponse;
*/

  const CustomerIdentificationViaCardDialog(
      {super.key,
        required this.isNFCAvailable,
        required this.onLoginViaCardSuccess
/*, this.systemUserLoginResponse*/
        ,
        required this.notificationBar});

  @override
  State<StatefulWidget> createState() =>
      _CustomerIdentificationViaCardDialogState();
}

class _CustomerIdentificationViaCardDialogState
    extends State<CustomerIdentificationViaCardDialog> {
  final tapStatus = ValueNotifier<String?>(null);
  late NFCManager? nfcManager;
  bool _isEnabled = false;
  final _cardNumberCtr = TextEditingController();
  var focusNode = FocusNode();
  AccountDetailsResponse? accounts;
  CustomerSearchResponse? customers;
  final ScrollController _verticalCtr = ScrollController();
  bool _isLoading = false;
  final _textFieldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    tapStatus.value =
    widget.isNFCAvailable ? MessagesProvider.get('waiting...') : '';
    nfcManager = NFCManager();
    if (widget.isNFCAvailable) // listen only if the device is NFC enabled.
        {
      _startListeningForCardTaps();
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.isNFCAvailable) // stop listening only if the device is NFC enabled.
        {
      nfcManager?.stop();
    }
    nfcManager = null;
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      alignment: Alignment.topCenter,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: widget.isNFCAvailable ?
        MediaQuery.of(context).viewInsets.bottom == 0 ? EdgeInsets.only(top: SizeConfig.getSize(20)): EdgeInsets.only(top: SizeConfig.getSize(0)) :
        MediaQuery.of(context).viewInsets.bottom == 0 ? EdgeInsets.only(top: SizeConfig.getSize(20)):EdgeInsets.only(top: SizeConfig.getSize(0)),
        alignment: Alignment.center,
        //width: SizeConfig.screenWidth * 0.4,
        //: widget.isNFCAvailable?SizeConfig.screenHeight * 0.66:SizeConfig.screenHeight * 0.36,
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            backgroundColor:  theme.transparentColor,
            resizeToAvoidBottomInset: false,
            body: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: (SizeConfig.screenWidth * 0.38)+15,
                child: Stack(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top:SizeConfig.getSize(20), right:SizeConfig.getSize(10),),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          alignment: Alignment.topCenter,
                          margin: const EdgeInsets.only(left: 0.0,right: 0.0),
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
                                                ? MessagesProvider.get('Tap or Enter Card Number')
                                                : MessagesProvider.get('Enter Card Number'),
                                            style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)),
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
                                              bottom: SizeConfig.screenHeight * 0.02),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                              height: SizeConfig.getSize(200),
                                              width: SizeConfig.getSize(200),
                                              child: Image.asset(
                                                'assets/ic_tap_card_large.png',color: theme.secondaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Visibility(visible: widget.isNFCAvailable,child: Text(MessagesProvider.get('Tap Card OR '),style: theme.heading5?.copyWith(fontWeight: FontWeight.w700,fontSize: SizeConfig.getSize(18)),)),
                                      Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              width:120,
                                              height: MediaQuery.of(context).size.height *
                                                  0.0675,
                                              child:  TextFormField(
                                                key:_textFieldKey,
                                                controller: _cardNumberCtr,
                                                textAlign: TextAlign.start,
                                                readOnly: false,
                                                focusNode: focusNode,
                                                style: theme.heading5?.copyWith(fontSize: SizeConfig.getSize(18)),
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                                                  hintText: MessagesProvider.get('Enter Card No'),
                                                  hintStyle: theme.heading5?.copyWith(fontWeight: FontWeight.w500,fontSize: SizeConfig.getSize(16)),
                                                ),
                                                onChanged: (value){
                                                  setState(() {
                                                    widget.notificationBar.showMessage(
                                                        '',
                                                        theme.primaryColor!);
                                                    tapStatus.value = '';
                                                    _cardNumberCtr.text = value;
                                                    _cardNumberCtr.selection = TextSelection.fromPosition(TextPosition(offset: _cardNumberCtr.text.length));
                                                    _isEnabled = value.length == 8 ? true:false;
                                                  });
                                                },
                                                onTap: () {
                                                  Scrollable.ensureVisible(_textFieldKey.currentContext!);//h
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
                                               height: MediaQuery.of(context).size.height *
                                                   0.0675,
                                              width: MediaQuery.of(context).size.width *
                                                  0.09,
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, right: 8.0),
                                              child: ElevatedButton(
                                                onPressed:_isLoading?null: () {
                                                  if(FocusScope.of(context).hasFocus) {
                                                    FocusScope.of(context).unfocus();
                                                  }
                                                  setState(() {
                                                    widget.notificationBar.showMessage(
                                                        '',
                                                        theme.primaryColor!);
                                                    if(_cardNumberCtr.text.length == 8 && !_isLoading){
                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                      _getAccountDetails(context,_cardNumberCtr.value.text);
                                                      tapStatus.value = MessagesProvider.get('Card identified. Authenticating...');
                                                    }
                                                    else{
                                                      widget.notificationBar.showMessage(
                                                          MessagesProvider.get('Invalid Card Number length (&1). Should be &2',['${_cardNumberCtr.text.length}','8']),
                                                          AppColors.notificationBGRedColor);
                                                      tapStatus.value =MessagesProvider.get('Invalid Card Number length (&1). Should be &2',['${_cardNumberCtr.text.length}','8']);
                                                    }
                                                  });
                                                } ,
                                                style: ElevatedButton.styleFrom(
                                                  padding: const EdgeInsets.all(2),
                                                  backgroundColor:theme.button2BG1!,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(4.0)),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Visibility(
                                                      visible:!_isLoading,
                                                      child: Text(
                                                        MessagesProvider.get('APPLY'),
                                                        style: theme.headingLight5?.copyWith(color:Colors.white,fontSize: SizeConfig.getFontSize(18)),
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
                                              style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)),
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
                            context.read<TransactionCubit>().setCustomerIDDialogStatus(false);
                            Navigator.of(context).pop();
                          }
                        },
                        child:  Align(
                          alignment: Alignment.topRight,
                          child: Opacity(
                            opacity: _isLoading ==true?0.7:1,
                            child: CircleAvatar(
                              radius: SizeConfig.getSize(25),
                              backgroundColor: theme.button2InnerShadow1,
                              child: Icon(Icons.close, color: theme.light1,size:SizeConfig.getSize(30) ,),
                            ),
                          ),
                        ),
                      ),
                    ),
                    BlocConsumer<TransactionCubit, TransactionCubitState>(
                        listener: (context, state) {
                          if(state.isCustomerIDDialogShown == true) {
                            if(state.barcodeReadData != null) {
                              if (state.barcodeReadData?.length != 8) {
                                widget.notificationBar.showMessage(
                                    MessagesProvider.get('Invalid card number &1 ', ["${state.barcodeReadData}"]),
                                    theme.footerBG3!);
                              } else {
                                widget.notificationBar.showMessage(
                                    MessagesProvider.get("Barcode data read successfully."),
                                    theme.footerBG5!);
                                _cardNumberCtr.text = state.barcodeReadData!;
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
    setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();

    final customerDataBl = await CustomerDataBuilder.build(execContext!);
    accounts = await customerDataBl.getCustomerAccounts(
        customerId: -1 ,
        accountNumber: text
    );
    setState(() {
      if (accounts?.data?[0].accountId == -1) {
        _isLoading =false;
        widget.notificationBar.showMessage(
            MessagesProvider.get('Could not process a new card.'),
            AppColors.notificationBGRedColor);
        tapStatus.value = MessagesProvider.get('Could not process a new card.');
      } else {
        if(accounts?.data?[0].customerId == -1){
          context.read<SelectedCardDetails>().updateData(accounts?.data?[0]);
          Navigator.pop(context);
        }else{
          if(accounts?.data?[0].technicianCard == "Y"){
            setLoadingStatus(false);
            tapStatus.value = '';
            widget.notificationBar.showMessage(
                MessagesProvider.get('Technician Card (&1) not allowed for Transaction',['${accounts?.data?[0].tagNumber}']),
                AppColors.notificationBGRedColor);
          }else {
            _getCustomer(context, accounts?.data?[0].customerId ?? -1, text);
          }
        }
      }

    });

    print(accounts?.data?.length);
    print("tagNumber : "+accounts!.data!.first.tagNumber);

  }

  Future _getCustomer(BuildContext context,int customerId, String text) async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();

    final customerDataBl = await CustomerDataBuilder.build(execContext!);
    customers = await customerDataBl.getCustomer(
      customerId: customerId ,

    );
    setState(() {
      tapStatus.value = MessagesProvider.get("Authenticated");
      setLoadingStatus(false);
      if(customers?.data?.isNotEmpty == true){
        context.read<SelectedCustomer>().updateData(customers?.data?[0]);
      }
      context.read<SelectedCardDetails>().updateData(accounts?.data?[0]);
      Navigator.pop(context);
    });

    print(accounts?.data?.length);
    print("tagNumber : "+accounts!.data!.first.tagNumber);
  }





  _startListeningForCardTaps() async {
    Stream<NFCReadData>? nfcReadDataStream = nfcManager?.startScan();
    print("Initiated Nfc card scan");
    nfcReadDataStream?.listen((data) {
      String cardId = data.readableData;
      print("Nfc Data : $cardId");
      if (cardId.length != 8) {
        tapStatus.value = widget.isNFCAvailable ?  MessagesProvider.get("Invalid card number") : '';
        widget.notificationBar.showMessage(
            "${ MessagesProvider.get("Invalid card number")} $cardId",
            AppColors.notificationBGRedColor);
      } else {
        tapStatus.value = widget.isNFCAvailable ?  MessagesProvider.get("Card read successfully") : '';
        widget.notificationBar.showMessage(
            MessagesProvider.get("Card read successfully"),
            AppColors.notificationBGLightBlueColor);
        setState(() {
          _cardNumberCtr.text = data.readableData;
          _isEnabled = _cardNumberCtr.text.length == 8 ? true:false;
        });
      }
    });
  }
}
