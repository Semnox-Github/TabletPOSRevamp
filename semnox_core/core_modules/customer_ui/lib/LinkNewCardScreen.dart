import 'dart:async';

import 'package:customer_data/builder.dart';
import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:customer_data/models/customer_data.dart';
import 'package:customer_data/models/request/customer_search/customer_search_condition.dart';
import 'package:customer_ui/providers/SelectedCustomerProvider.dart';
import 'package:customer_ui/utils/AppColors.dart';
import 'package:customer_ui/utils/AppStyle.dart';
import 'package:customer_ui/utils/enums.dart';
import 'package:customer_ui/utils/extensions.dart';
import 'package:customer_ui/utils/size_config.dart';
import 'package:customer_ui/widgets/LookupButtonWidget.dart';
import 'package:customer_ui/widgets/ToggleWidget.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/sites/site_dto.dart';
import 'package:membership_data/builder.dart';
import 'package:membership_data/models/membership_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:provider/provider.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';

import 'CustomerDetailsPage.dart';

class LinkNewCardScreen extends StatefulWidget {
  final NotificationBar notificationBar;
  const LinkNewCardScreen({super.key, required this.notificationBar});

  @override
  State<LinkNewCardScreen> createState() => _LinkNewCardScreenState();
}

class _LinkNewCardScreenState extends State<LinkNewCardScreen> {
  CustomerData? data;
  bool _isLoading = false;
  late NFCManager? nfcManager;
  //Form fields basic
  final _firstNameCtr = TextEditingController();
  final _middleNameCtr = TextEditingController();
  final _lastNameCtr = TextEditingController();
  final _cardNumberCtr = TextEditingController();
  final _siteList = <DropdownMenuItem<SiteDTO>>[];
  final _memberShipList = <DropdownMenuItem<MembershipContainerDTO>>[];
  AccountDetailsResponse? accounts;
  List<AccountDetailsData?>? _accountDetailsData;
  AccountDetailsData? _selectedData;
  final int _selectedIndex = 0;
  bool _showData = false;
  bool _showLessData = false;
  bool _isApply = false;
  late NotificationBar _notificationBar;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Future.microtask(() => initDropDownList());
    nfcManager = NFCManager();
    _startListeningForCardTaps();
    _notificationBar = NotificationBar(
      showHideSideBar: false,
      onSideBarStatusUpdate: (shouldShowSidebar) {
        _showHideSidebar();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    nfcManager?.stop();
    nfcManager = null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    data = context.watch<SelectedCustomer>().selectedData;
    _firstNameCtr.text = data?.firstName ?? "";
    _middleNameCtr.text = data?.middleName ?? "";
    _lastNameCtr.text = data?.lastName ?? "";
  }

  Future getAccountDetails(BuildContext context, String text) async {
    Log.printMethodStart('_getAccountDetails()', 'Link New Card Screen','apply');
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final customerDataBl = await CustomerDataBuilder.build(execContext!);
    accounts = await customerDataBl.getCustomerAccounts(
        customerId: -1, accountNumber: text);
    setState(() {
      setLoadingStatus(false);
      if (accounts?.data?[_selectedIndex].accountId == -1) {
        _showNotification(
            MessagesProvider.get('Cannot link new card to the customer.Card should be an issued card'),
            AppColors.notoficationBGLightYellowColor);
      } else if (accounts?.data?[_selectedIndex].customerId == -1) {
        _showData = true;
        _accountDetailsData = accounts?.data ?? [];
        _selectedData = _accountDetailsData![_selectedIndex];
      } else {
        _showNotification(
            '${MessagesProvider.get('The card is already linked to customer with Id ')}${accounts?.data?[_selectedIndex].customerName}',
            AppColors.notoficationBGLightYellowColor);
      }
    });

    print(accounts?.data?.length);
    print("tagNumber : ${accounts!.data!.first.tagNumber}");
    Log.printMethodEnd('_getAccountDetails()', 'Link New Card Screen','apply');
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar:  Container(
        child: _notificationBar,
      ),      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scaffold(
            backgroundColor: theme.backGroundColor,
            bottomNavigationBar:SizedBox(
              height: SizeConfig.getSize(100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    color: theme.dividerColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          // height:  MediaQuery.of(context).size.height,
                          height: SizeConfig.getSize(60),
                          width: MediaQuery.of(context).size.width * 0.10,
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _showNotification('',
                                    theme.backGroundColor!);
                                _showData = false;
                                _cardNumberCtr.text = '';
                              });                          },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(0.0),
                              backgroundColor: theme.button1BG1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0)),
                            ),
                            child: Text(
                              MessagesProvider.get("Clear").toUpperCase(),
                              style: theme.headingLight5?.copyWith(
                                  color: theme.secondaryColor,
                                  fontSize: SizeConfig.getFontSize(16),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          // height:  MediaQuery.of(context).size.height,
                          height: SizeConfig.getSize(60),
                          width: MediaQuery.of(context).size.width * 0.10,
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: ElevatedButton(
                            onPressed: (){
                              var dataVal = accounts?.data?[0];
                              _linkNewCard(dataVal!);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(0.0),
                              backgroundColor: theme.button2BG1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0)),
                            ),
                            child: Text(
                              MessagesProvider.get("Confirm").toUpperCase(),
                              style: theme.headingLight5?.copyWith(
                                  color: Colors.white,
                                  fontSize: SizeConfig.getFontSize(16),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            body: Container(
              color: theme.backGroundColor,
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: Row(
                      children: [
                        SizedBox(
                          width: SizeConfig.getSize(240),
                          child: AppBar(
                            title: Text(MessagesProvider.get("LINK CARD"),
                                style:  TextStyle(
                                    color: Colors.white,
                                    fontSize: SizeConfig.getFontSize(24),
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'RobotoCondensed',
                                    fontWeight: FontWeight.w700
                                )),
                            titleSpacing: 0,
                            toolbarHeight: 60.0,
                            backgroundColor: Colors.black87,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            leading: IconButton(
                              icon: Image.asset('assets/back_arrow_white.png'),
                              iconSize: 20.0,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: PhysicalModel(
                            elevation: 1.0,
                            color: theme.backGroundColor!,
                            child: Container(
                              width:  SizeConfig.getSize(995),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: theme.tableRow1,
                              ),
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(4.0),
                                    margin: const EdgeInsets.only(right: 4.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: theme.backGroundColor),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          MessagesProvider.get("Name"),
                                          style: TextStyle(
                                            color: theme.secondaryColor,
                                              fontSize: SizeConfig.getFontSize(18)),
                                        ),
                                        Text(
                                          '${_firstNameCtr.value.text} ${_lastNameCtr.value.text}',
                                          style: TextStyle(
                                              color: theme.secondaryColor,
                                              fontSize: SizeConfig.getFontSize(18),
                                              fontWeight: FontWeight.bold),
                                        )
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
                  Visibility(
                    visible: !_showData,
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                MessagesProvider.get('Tap Card OR '),
                                style: theme.heading5?.copyWith(
                                    fontSize: 16.0,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700
                                )
                              ),
                              SizedBox(
                                width: SizeConfig.getSize(160),
                                child: TextFormField(
                                  controller: _cardNumberCtr,
                                  textAlign: TextAlign.start,
                                  readOnly: false,
                                  style:theme.heading5?.copyWith(
                                      fontSize: 14.0,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500
                                  ),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    hintText: MessagesProvider.get('Enter Card No'),
                                    hintStyle: theme.heading5?.copyWith(
                                        fontSize: 14.0,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _cardNumberCtr.text = value;
                                      _cardNumberCtr.selection =
                                          TextSelection.fromPosition(TextPosition(
                                              offset: _cardNumberCtr.text.length));
                                    });
                                    if (value.length == 8) {
                                      setState(() {
                                        _isApply = true;
                                      });
                                    }
                                  },
                                  onTap: () {},
                                ),
                              ),
                              const SizedBox(width: 8),
                              LookupButtonWidget(
                                text: MessagesProvider.get("APPLY"),
                                background: _cardNumberCtr.text.length == 8
                                    ? theme.button2BG1
                                    : theme.button1BG1,
                                textStyle: _cardNumberCtr.text.length == 8
                                    ? AppStyle.hintWhiteTextStyle
                                    : AppStyle.customerDisableText,
                                onPress: () {
                                  if (_cardNumberCtr.text.length == 8) {
                                    setLoadingStatus(true);
                                    FocusManager.instance.primaryFocus?.unfocus();
                                    if (_cardNumberCtr.value.text.length == 8) {
                                      getAccountDetails(
                                          context, _cardNumberCtr.value.text);
                                    }
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Scroller(
                     controller: _scrollController,
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child:
                        Container(
                          width: SizeConfig.screenWidth - 16,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20,),
                            child: Visibility(
                              visible: _showData,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 220,
                                    decoration: BoxDecoration(
                                        color: theme.primaryColor,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: theme.dividerColor!)),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(top: 10, left: 10),
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      _selectedData?.tagNumber ?? "0",
                                                      style:  TextStyle(
                                                          fontSize: 12,
                                                          color:theme.secondaryColor,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                    Text(
                                                      '${MessagesProvider.get('Status:')}${_selectedData?.tagNumber.toString() != "" ? MessagesProvider.get("Issued Card") : ""}' ??
                                                          '',
                                                      style:  TextStyle(
                                                        color:theme.secondaryColor,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 60,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(1),
                                                  child: Container(
                                                    height: 25,
                                                    width: 25,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(25),
                                                      border: Border.all(
                                                          color: theme.secondaryColor!, width: 2),
                                                    ),
                                                    child: RotatedBox(
                                                      quarterTurns: 1,
                                                      child: IconButton(
                                                        padding: const EdgeInsets.all(0),
                                                        icon: Image.asset(
                                                          _showLessData ?'assets/ic_right_arrow.png' : 'assets/back_arrow_white.png',
                                                          color: theme.secondaryColor!,
                                                          height: 15,
                                                          width: 15,
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            _showLessData = !_showLessData;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Text(
                                                '${MessagesProvider.get('Valid Till -')}${DateFormat('dd-MMM-yyyy HH:mm:ss a').format(DateTime.parse(_selectedData?.issueDate ?? '0001-01-01T00:00:00')) ?? ''}' ??
                                                    "0.0",
                                                style:  TextStyle(
                                                    color:theme.secondaryColor,
                                                    fontSize: 12),
                                              )),
                                          Divider(
                                            color: theme.dividerColor,
                                            height: 10,
                                            thickness: 1.5,
                                            indent: 0,
                                            endIndent: 0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, bottom: 10),
                                            child: Visibility(
                                              visible: (!_showLessData && _showData),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        MessagesProvider.get('Credits'),
                                                        style: TextStyle(
                                                          color:theme.secondaryColor,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      Text(
                                                        (_selectedData
                                                            ?.accountCreditPlusDTOList?[
                                                        0]
                                                            .creditPlus
                                                            ?.toStringAsFixed(2))
                                                            .toString() ??
                                                            "0.0",
                                                        style:  TextStyle(
                                                            color:theme.secondaryColor,
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        MessagesProvider.get('Time'),
                                                        style: TextStyle(
                                                          color:theme.secondaryColor,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      Text(
                                                        (_selectedData?.time
                                                            ?.toStringAsFixed(2))
                                                            .toString() ??
                                                            "0.0",
                                                        style:  TextStyle(
                                                            color:theme.secondaryColor,
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        MessagesProvider.get('Loyalty Points'),
                                                        style: TextStyle(
                                                          color:theme.secondaryColor,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      Text(
                                                        (_selectedData?.loyaltyPoints
                                                            ?.toStringAsFixed(2))
                                                            .toString() ??
                                                            "0.0",
                                                        style:  TextStyle(
                                                            color:theme.secondaryColor,
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        MessagesProvider.get('Counter Item'),
                                                        style: TextStyle(
                                                          color:theme.secondaryColor,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      Text(
                                                        '0.00',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.bold,
                                                          color:theme.secondaryColor,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        MessagesProvider.get('Courtesy'),
                                                        style: TextStyle(
                                                          color:theme.secondaryColor,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      Text(
                                                        (_selectedData?.courtesy
                                                            ?.toStringAsFixed(2))
                                                            .toString() ??
                                                            "0.0",
                                                        style:  TextStyle(
                                                            color:theme.secondaryColor,
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 40,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        MessagesProvider.get('Tickets'),
                                                        style: TextStyle(
                                                          color:theme.secondaryColor,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      Text(
                                                        (_selectedData
                                                            ?.totalTicketsBalance
                                                            ?.toStringAsFixed(2))
                                                            .toString() ??
                                                            "0.0",
                                                        style:  TextStyle(
                                                            color:theme.secondaryColor,
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        MessagesProvider.get('Games'),
                                                        style: TextStyle(
                                                          color:theme.secondaryColor,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      Text(
                                                        '',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color:theme.secondaryColor,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        MessagesProvider.get('Play Credits'),
                                                        style: TextStyle(
                                                          color:theme.secondaryColor,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      Text(
                                                        '0.00',
                                                        style: TextStyle(
                                                            color:theme.secondaryColor,
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        MessagesProvider.get('Bonus'),
                                                        style: TextStyle(
                                                          color:theme.secondaryColor,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      Text(
                                                        (_selectedData?.bonus
                                                            ?.toStringAsFixed(2))
                                                            .toString() ??
                                                            "0.0",
                                                        style:  TextStyle(
                                                            fontSize: 12,
                                                            color:theme.secondaryColor,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        MessagesProvider.get('Card Deposite'),
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color:theme.secondaryColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        (_selectedData?.faceValue
                                                            ?.toStringAsFixed(2))
                                                            .toString() ??
                                                            "0.0",
                                                        style:  TextStyle(
                                                            fontSize: 12,
                                                            color:theme.secondaryColor,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ),
                  const SizedBox(height: 0),
                  const SizedBox(height: 0),

                ],
              ),
            ),
          ),
        ),
      ),
    ).withLoader(isLoading: _isLoading,theme: theme);
  }

  _linkNewCard(AccountDetailsData linkCardData) async {
    //_setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final customerSearchBL =
        await CustomerDataBuilder.build(executionContextDTO!);
    setLoadingStatus(true);
    try {
      Log.printMethodStart('_linkNewCard()', 'Link New Card Screen','confirm');
      var response = await customerSearchBL.linkNewCard(
        customerId: data?.id ?? -1,
        linkAccountRequest: linkCardData,
      );
      Log.printMethodEnd('_linkNewCard()', 'Link New Card Screen','confirm');
      if (response.exception == null) {
        Log.printMethodReturn('_linkNewCard() - Link new card done!', 'Link New Card Screen','confirm');
        setLoadingStatus(false);
        setState(() {});
        // Navigator.pop(context);
      } else {}
      setLoadingStatus(false);
      setState(() {
        widget.notificationBar.showMessage(MessagesProvider.get('Account Linked successfully'), AppColors.notificationBGLightBlueColor);
        _showNotification( MessagesProvider.get('Account Linked successfully'),
            AppColors.notificationBGLightBlueColor);
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => CustomerDetailsPage(source: 8)),
        );
      });
    } on DioError catch (error) {
      setLoadingStatus(false);
      var errorString = error.response?.data['data'] as String?;
      Future.microtask(
          () => _showNotification( errorString!,
              AppColors.notificationBGRedColor));
    }
  }

  void setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }

  _showErrorDialog(BuildContext context, String title, String message) {
    showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  title,
                  style: AppStyle.titleStyle,
                ),
              ),
              content: Text(
                message,
                style: AppStyle.titleStyle,
              ),
              actions: [
                CupertinoDialogAction(
                  child: Text(
                    MessagesProvider.get("OK"),
                    style: AppStyle.titleStyle,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
        barrierDismissible: true);
  }

  _startListeningForCardTaps() async {
    Stream<NFCReadData>? nfcReadDataStream = nfcManager?.startScan();
    print("Initiated Nfc card scan");
    nfcReadDataStream?.listen((data) {
      String cardId = data.readableData;
      print("Nfc Data : $cardId");
      if (cardId.length != 8) {
        /*  widget.notificationBar.showMessage(
            "${StringsProvider.get("invalid_card_number")} $cardId",
            AppColors.notificationBGRedColor);*/
      } else {
        /* widget.notificationBar.showMessage(
            StringsProvider.get("card_read_successfully"),
            AppColors.notificationBGLightBlueColor);*/
        setState(() {
          _cardNumberCtr.text = data.readableData;
        });
      }
    });
  }

  Future<void> initDropDownList() async {
    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    var masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    var membershipDataBl = await MembershipDataBuilder.build(execContextDTO);
    var sites = await masterDataBL.getSites();
    var memberShip = await membershipDataBl.callMembershipDataApi();

    var list = sites?.data?.siteContainerDTOList;
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        var item = list[i];
        _siteList.add(DropdownMenuItem(
            value: item,
            child: Text(item.siteName, style: AppStyle.dropDownTextStyle)));
      }
    }

    var list2 = memberShip.data?.membershipContainerDTOList;

    if (list2 != null) {
      for (int i = 0; i < list2.length; i++) {
        var item = list2[i];
        _memberShipList.add(DropdownMenuItem(
            value: item,
            child:
                Text(item.membershipName, style: AppStyle.dropDownTextStyle)));
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  _showNotification(String s, Color notificationBGLightYellowColor) {
    setState(() {
      _notificationBar.showMessage(s, notificationBGLightYellowColor);
    });
  }

  _showHideSidebar() {
    setState(() {});
  }
}
