import 'package:customer_data/builder.dart';
import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:customer_data/models/customer_search/customer_search_response.dart';
import 'package:customer_ui/providers/SelectedCustomerProvider.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:product_config_ui/widgets/primaryLargeButton.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:customer_ui/providers/SelectedCardDetailsProvider.dart';

class VipCardIdentificationDialog extends StatefulWidget {
  final Function() onVipCardIdentified;
  final Function() onCancelTapped;
  final NotificationBar notificationBar;
  final bool isNFCAvailable;

  const VipCardIdentificationDialog(
      {super.key,
      required this.isNFCAvailable,
      required this.onCancelTapped,
      required this.onVipCardIdentified,
      required this.notificationBar});

  @override
  State<StatefulWidget> createState() => _VipCardIdentificationDialogState();
}

class _VipCardIdentificationDialogState extends State<VipCardIdentificationDialog> {
  NotificationBar? _notificationBar;
  final tapStatus = ValueNotifier<String?>(null);
  late NFCManager? nfcManager;
  bool _isEnabled = false;
  final _cardNumberCtr = TextEditingController();
  var focusNode = FocusNode();
  AccountDetailsResponse? accounts;
  CustomerSearchResponse? customers;
  final ScrollController _verticalCtr = ScrollController();
  bool _isLoading = false;
  bool isCardRead = false;
  late SemnoxTheme theme;

  @override
  void initState() {
    super.initState();
    _notificationBar = NotificationBar(showHideSideBar: false);
    tapStatus.value = widget.isNFCAvailable ? MessagesProvider.get("Tap Card") : '';
    nfcManager = NFCManager();
    if (widget.isNFCAvailable) {
      // listen only if the device is NFC enabled.
      _startListeningForCardTaps();
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.isNFCAvailable) {
      // stop listening only if the device is NFC enabled.
      nfcManager?.stop();
    }
    nfcManager = null;
    _notificationBar = null;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    theme = Theme.of(context).extension<SemnoxTheme>()!;
    final _scrollController = ScrollController();
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        color: theme.transparentColor,
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: theme.transparentColor,
              resizeToAvoidBottomInset: false,
              bottomNavigationBar: Container(
                child: _notificationBar,
              ),
              body: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SizeConfig.getSize(8.0)),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: SizeConfig.getWidth(0.0), right: SizeConfig.getWidth(0.0)),
                  height: widget.isNFCAvailable ? SizeConfig.getHeight(422) : SizeConfig.getHeight(242),
                  width: SizeConfig.getWidth(572),
                  child: Stack(
                    children: [
                      RawScrollbar(
                        radius: Radius.circular(SizeConfig.getSize(2)),
                        thumbVisibility: true,
                        mainAxisMargin: SizeConfig.getSize(3),
                        crossAxisMargin: SizeConfig.getSize(3),
                        trackVisibility: true,
                        trackBorderColor: theme.scrollBarHandle,
                        trackColor: theme.scrollArea,
                        thumbColor: theme.scrollBarHandle,
                        thickness: SizeConfig.getWidth(7),
                        controller: _scrollController,
                        child: CustomScrollView(controller: _scrollController, slivers: [
                          SliverFillRemaining(
                            hasScrollBody: false,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: SizeConfig.getHeight(90),
                                  child: Center(
                                    child: Text(
                                      widget.isNFCAvailable
                                          ? MessagesProvider.get("Tap or Enter Card").toUpperCase()
                                          : MessagesProvider.get("Enter Card Number").toUpperCase(),
                                      style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20)),
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: SizeConfig.getSize(1),
                                  color: theme.dialogFooterInnerShadow,
                                  height: SizeConfig.getHeight(1),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        height: SizeConfig.getHeight(85),
                                        padding: EdgeInsets.only(left: SizeConfig.getWidth(20),),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              // flex: 10,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    MessagesProvider.get("Card No"),
                                                    textAlign: TextAlign.left,
                                                    style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20)),
                                                  ),
                                                  Container(
                                                    height: SizeConfig.getHeight(50),
                                                    padding: EdgeInsets.only(top: SizeConfig.getHeight(5)),
                                                    child: TextFormField(
                                                      controller: _cardNumberCtr,
                                                      textAlign: TextAlign.start,
                                                      readOnly: false,
                                                      focusNode: focusNode,
                                                      style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                      decoration: InputDecoration(
                                                        contentPadding: EdgeInsets.only(
                                                            top: SizeConfig.getHeight(5),
                                                            bottom: SizeConfig.getHeight(5),
                                                            right: SizeConfig.getWidth(5),
                                                            left: SizeConfig.getWidth(10)),
                                                        focusedBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(SizeConfig.getSize(10.0)),
                                                            borderSide: BorderSide(
                                                              width: SizeConfig.getWidth(1),
                                                              color: theme.darkTextColor!,
                                                            )),
                                                        border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                                          borderSide: BorderSide(
                                                            width: SizeConfig.getWidth(1),
                                                            color: theme.darkTextColor!,
                                                          ),
                                                        ),
                                                        hintText: MessagesProvider.get("Enter Card No"),
                                                        hintStyle: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                      ),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _cardNumberCtr.text = value;
                                                          _cardNumberCtr.selection = TextSelection.fromPosition(
                                                              TextPosition(offset: _cardNumberCtr.text.length));
                                                          _isEnabled = value.length == 8 ? true : false;
                                                        });
                                                      },
                                                      onTap: () {
                                                        setState(() {
                                                          _verticalCtr.animateTo(_verticalCtr.position.maxScrollExtent,
                                                              duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
                                                        });
                                                        FocusScope.of(context).requestFocus(focusNode);
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: SizeConfig.getWidth(15)),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: PrimaryLargeButton(
                                                onPressed: () {
                                                  if (_cardNumberCtr.value.text.isEmpty) {
                                                    _notificationBar?.showMessage(
                                                        MessagesProvider.get("Invalid card number. Card number is empty."),
                                                        theme.footerBG3!);
                                                  } else {
                                                    if (_cardNumberCtr.text.length != 8) {
                                                      _notificationBar?.showMessage(
                                                          MessagesProvider.get("Invalid Card Number length (&1). Should be &2",
                                                              [_cardNumberCtr.text.length, 8]),
                                                          theme.footerBG3!);
                                                    } else {
                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                      _getAccountDetails(context, _cardNumberCtr.value.text, isCardTapped: false);
                                                    }
                                                  }
                                                },
                                                text: MessagesProvider.get("Get").toUpperCase(),
                                              ),
                                            ),
                                            SizedBox(width: SizeConfig.getWidth(15)),
                                          ],
                                        ),
                                      ),
                                      Visibility(
                                        visible: tapStatus.value?.isNotEmpty == true ? true : false,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: SizeConfig.getHeight(20), bottom: SizeConfig.getHeight(5)),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              tapStatus.value ?? '',
                                              style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: widget.isNFCAvailable,
                                        child: Padding(
                                          padding: EdgeInsets.only(bottom: SizeConfig.getHeight(10)),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'assets/ic_tap_card_large.png',
                                              color: theme.secondaryColor,
                                              width: SizeConfig.getWidth(140),
                                              height: SizeConfig.getHeight(140),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ])
                      ),
                      Align(
                        alignment: const Alignment(1.09, -1.15),
                        child: InkWell(
                          onTap: () {
                            if (!_isLoading) {
                              nfcManager?.stop();
                              Navigator.of(context).pop();
                              widget.onCancelTapped();
                            }
                          },
                          child: CircleAvatar(
                            radius: SizeConfig.getSize(30.0),
                            backgroundColor: _isLoading == true ? theme.dialogFooterInnerShadow : Colors.black,
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: SizeConfig.getSize(24),
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
    );
  }

  void setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }

  void showHideLoader(BuildContext context, bool isCardTapped, bool isShow) {
    Future.microtask(() {
      if (!isCardTapped) {
        isShow
            ? loader.showLoaderDialog(context, MessagesProvider.get("Loading card details. Please wait..."))
            : loader.hideLoaderDialog(context);
      }
    });
  }

  Future _getAccountDetails(BuildContext context, String text, {bool isCardTapped = true}) async {
    if (!_isLoading) {
      setLoadingStatus(true);
      showHideLoader(context, isCardTapped, true);
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();
      final customerDataBl = await CustomerDataBuilder.build(execContext!);
      accounts = await customerDataBl.getCustomerAccounts(customerId: -1, accountNumber: text);
      setState(() async {
        _isEnabled = true;
        setLoadingStatus(false);
        if (accounts?.data?[0].customerId == -1) {
          _notificationBar?.showMessage(MessagesProvider.get("Invalid Card"), theme.footerBG5!);
          tapStatus.value = widget.isNFCAvailable ? MessagesProvider.get("Invalid Card") : '';
          showHideLoader(context, isCardTapped, false);
        } else {
          if (accounts?.data?[0].vipCustomer == true) {
            customers = await customerDataBl.getCustomer(
              customerId: accounts?.data?[0].customerId ?? -1,
            );
            showHideLoader(context, isCardTapped, false);
            tapStatus.value = widget.isNFCAvailable ? MessagesProvider.get("Authenticated") : '';
            context.read<SelectedCustomer>().updateData(customers?.data?[0]);
            context.read<SelectedCardDetails>().updateData(accounts?.data?[0]);
            Navigator.of(context).pop();
            widget.onVipCardIdentified();
          } else {
            _notificationBar?.showMessage(MessagesProvider.get("Invalid Card"), theme.footerBG5!);
            tapStatus.value = widget.isNFCAvailable ? MessagesProvider.get("Invalid Card") : '';
            showHideLoader(context, isCardTapped, false);
          }
        }
      });
    }
  }

  _startListeningForCardTaps() async {
    Stream<NFCReadData>? nfcReadDataStream = nfcManager?.startScan();
    nfcReadDataStream?.listen((data) {
      String cardId = data.readableData;
      if (!_isLoading) {
        tapStatus.value = widget.isNFCAvailable ? MessagesProvider.get("Card read successfully.") : '';
        if (cardId.length != 8) {
          _notificationBar?.showMessage(
              MessagesProvider.get("Invalid Card Number length (&1). Should be &2", [_cardNumberCtr.text.length, 8]),
              theme.footerBG3!);
        } else {
          tapStatus.value = widget.isNFCAvailable ? MessagesProvider.get("Card identified. Authenticating...") : '';
          _getAccountDetails(
            context,
            cardId,
          );
          setState(() {
            _cardNumberCtr.text = data.readableData;
            _isEnabled = _cardNumberCtr.text.length == 8 ? true : false;
          });
        }
      }
    });
  }
}
