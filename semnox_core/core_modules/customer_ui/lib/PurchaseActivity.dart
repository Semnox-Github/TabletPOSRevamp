import 'dart:convert';
import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:customer_data/models/account_details/purchase_data.dart';
import 'package:customer_data/models/account_details/purchase_response.dart';
import 'package:customer_data/models/account_details/summaries_counts_response.dart';
import 'package:customer_data/models/account_details/summaries_data.dart';
import 'package:customer_data/models/account_details/summaries_response.dart';
import 'package:customer_data/models/customer_data.dart';
import 'package:customer_ui/providers/SelectedCardDetailsProvider.dart';
import 'package:customer_ui/providers/SelectedCustomerProvider.dart';
import 'package:customer_ui/utils/AppColors.dart';
import 'package:customer_ui/utils/AppStyle.dart';
import 'package:customer_ui/utils/extensions.dart';
import 'package:customer_ui/utils/size_config.dart';
import 'package:customer_ui/widgets/CustomerDatePicker.dart';
import 'package:customer_ui/widgets/LookupButtonWidget.dart';
import 'package:customer_ui/widgets/SummariesSearchItem.dart';
import 'package:customer_ui/widgets/account_details/AccountsTopBar.dart';
import 'package:customer_ui/widgets/account_details_nav_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:customer_data/builder.dart';
import 'package:execution_context/builder.dart';
import 'package:intl/intl.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/configurations/configuration_response.dart';
import 'package:master_data/models/configurations/parafait_default_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';

import 'package:messages_data/builder.dart';
import 'package:logs_data/logger.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/scroller.dart';

import 'ErrorDialog.dart';
import 'ListViewItems/AccountsSearchListItems.dart';
import 'PurchaseSearchItem.dart';

class PurchaseActivity extends StatefulWidget {
  PurchaseActivity({
    Key? key,
    required this.cId,
    required this.notificationBar
  }) : super(key: key);
  final int cId;
  final NotificationBar notificationBar;

  @override
  State<PurchaseActivity> createState() => _PurchaseActivityState();
}

class _PurchaseActivityState extends State<PurchaseActivity> {
  AccountDetailsResponse? accounts;
  SummariesResponse? summaries;
  PurchaseResponse? purchases;
  SummariesCountsResponse? counts;
  List<PurchaseData>? _purchasesData;
  CustomerData? data;
  AccountDetailsData? cardData;
  bool showData = false;
  TextEditingController _fromDateCtr = TextEditingController();
  TextEditingController _toDateCtr = TextEditingController();

  int _pageNumber = 0;
  int _totalPages = 0;
  int _pageSize = 50;
  bool _isChecked = false;
  List<AccountDetailsData?>? _accountDetailsData;
  TextEditingController _cardNumberCtr = TextEditingController();
  TextEditingController _pageSizeController = TextEditingController();
  NotificationBar? _notificationBar;
  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();
  bool _isLoading = false;
  ConfigurationResponse? _config;
  String? _dateFormat;

  Future getConfigurations(BuildContext context) async {
    var execContextBL = await ExecutionContextBuilder.build();
    var sysExecContext = execContextBL.getExecutionContext();
    var masterDataBl = await MasterDataBuilder.build(sysExecContext!);
    _dateFormat = await masterDataBl.getDefaultValuesByName(defaultValueName: "DATE_FORMAT");
  }


  Future getAccountDetails(BuildContext context) async {
    setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();

    final customerDataBl = await CustomerDataBuilder.build(execContext!);
    /*   accounts = await customerDataBl.getCustomerAccounts(
        customerId: data?.id ?? 0, accountNumber: data?.cardNumber??'');*/
    accounts = await customerDataBl.getCustomerAccounts(
        customerId: -1, accountNumber: (cardData?.tagNumber).toString());
    setState(() {
      _accountDetailsData = accounts?.data ?? [];
      setLoadingStatus(false);
      _getPurchaseCounts(context);
      //_getSummaries(context);
      //_accountDetailsDataMain = _accountDetailsData;
      //_selectedData = _accountDetailsData![_selectedIndex];
      //_addSearchFilter();
    });

    print("Selected Customer ID : " + widget.cId.toString());
    print(accounts?.data?.length);
    print("tagNumber : " + accounts!.data!.first.tagNumber);
    print("showData : " + showData.toString());
  }

  Future _getPurchases(BuildContext context) async {
    setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final customerDataBl = await CustomerDataBuilder.build(execContext!);
    purchases = await customerDataBl.getPurchaseSummary(accountId: cardData?.accountId ?? -1, currentPage: _pageNumber, pageSize: _pageSize, toDate: _toDateCtr.text, fromDate: _fromDateCtr.text
    ).whenComplete(() => {setLoadingStatus(false)});
    setState(() {
      setLoadingStatus(false);
      _purchasesData = purchases?.data;
      _notificationBar?.showMessage(
          'Search completed successfully.',
          AppColors.notificationBGLightBlueColor);
    });

    print("Selected Customer ID : " + widget.cId.toString());
    print(accounts?.data?.length);
    print("tagNumber : " + accounts!.data!.first.tagNumber);
    print("showData : " + showData.toString());
  }

  Future _getPurchaseCounts(BuildContext context) async {
    setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();

    final customerDataBl = await CustomerDataBuilder.build(execContext!);
    counts = await customerDataBl.getPurchaseCounts(accountId: cardData?.accountId ?? -1, toDate: _getFormattedDateForAPI(_toDateCtr.text), fromDate:_getFormattedDateForAPI(_fromDateCtr.text),
    );
    setState(() {
      setLoadingStatus(false);
      if((counts?.data ?? 0) > 0){
        _totalPages = ((counts?.data ?? 0) / _pageSize).ceil();
        _getPurchases(context);
      }
      else{
        setLoadingStatus(false);
        _purchasesData = [];
        _notificationBar?.showMessage(
            'Search completed successfully.',
            AppColors.notificationBGLightBlueColor);
      }

      //_accountDetailsDataMain = _accountDetailsData;
      //_selectedData = _accountDetailsData![_selectedIndex];
      //_addSearchFilter();
    });

    print("Selected Customer ID : " + widget.cId.toString());
    print(accounts?.data?.length);
    print("tagNumber : " + accounts!.data!.first.tagNumber);
    print("showData : " + showData.toString());
  }



  @override
  void initState() {
    super.initState();
    getConfigurations(context);
    _pageSizeController.text = '50';
    _fromDateCtr.text = DateFormat(_dateFormat ?? 'dd-MM-yyyy').format(DateTime.now());
    _toDateCtr.text = DateFormat(_dateFormat ?? 'dd-MM-yyyy').format(DateTime.now());
    _notificationBar = widget.notificationBar;
    showData = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    data = context.watch<SelectedCustomer>().selectedData;
    cardData =  context.watch<SelectedCardDetails>().selectedData;
    getAccountDetails(context);
    showData = true;
  }

  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAligment = -1.0;
  bool checkedValue = true;

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.backGroundColor,
      bottomNavigationBar:  SizedBox(
        height: SizeConfig.getSize(75),
        width: SizeConfig.blockSizeHorizontal * 100,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Divider(height: 0,color: theme.secondaryColor,),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
              SizedBox(
                height: SizeConfig.getSize(30),
              ),
              CupertinoButton(
                minSize: double.minPositive,
                padding: EdgeInsets.zero,
                child: Row(children: [
                  Image.asset('assets/back_arrow_white.png',
                      color: (_pageNumber > 0) ?   theme.secondaryColor
                          : theme.button1BG1,
                      height: SizeConfig.getSize(35),
                      width: 12,
                      fit: BoxFit.fitHeight),
                  Image.asset('assets/back_arrow_white.png',
                      color: (_pageNumber > 0)  ? theme.secondaryColor
                          : theme.button1BG1,
                      height: SizeConfig.getSize(35),
                      width: 12,
                      fit: BoxFit.fitHeight),
                ]),
                onPressed: () {
                  setState(() {
                    _pageNumber = 0;
                    _getPurchaseCounts(context);
                    /* _currentPage =  0;
                                        _data = _customers[_currentPage];
                                        _selectedData = _data?[_selectedIndex];*/
                  });
                },
              ),
              IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    setState(() {
                      if(_pageNumber> 0){
                        _pageNumber = _pageNumber -1;
                        _getPurchaseCounts(context);
                      }
                    });
                  },
                  icon: Image.asset('assets/back_arrow_white.png',height: SizeConfig.getSize(35),
                    color:
                    (_pageNumber > 0)  ? theme.secondaryColor
                        : theme.button1BG1,)),
              InkWell(
                onTap: (){
                  showDialog(
                      barrierDismissible: true,
                      context: context,
                      barrierColor: const Color(0x01000000),
                      builder: (BuildContext context) {
                        return NumberPad(
                          initialOffset: Offset(500,100),
                          title: '',
                          isInitialRequired: true,
                          initialIntValue: _pageNumber+1,
                          onOkPressed: ( value)  {
                            setState(() {
                              if(value <= _totalPages){
                                _pageNumber = value-1;
                              }
                            });
                          },
                        );
                      });
                },
                child: Container(
                  height:SizeConfig.getSize(55) ,
                  padding: EdgeInsets.all(SizeConfig.getSize(15)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border:
                      Border.all(color: theme.secondaryColor!, width: 0.8)),
                  child: Text(
                    (_purchasesData?.length ?? 0) == 0 ?(_pageNumber).toString() :(_pageNumber + 1).toString(),
                    style: theme.heading5?.copyWith(
                        fontSize: SizeConfig.getFontSize(18),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                MessagesProvider.get('of '),
                style: theme.heading5?.copyWith(
                    fontSize: SizeConfig.getFontSize(18),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500
                ),
              ),
              Text(
                ((_purchasesData?.length ?? 0) > 0 ? '$_totalPages':0).toString()                         ,
                style: theme.heading5?.copyWith(
                    fontSize: SizeConfig.getFontSize(18),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if(_pageNumber< _totalPages){
                      _pageNumber = _pageNumber +1;
                      _getPurchaseCounts(context);
                    }
                  });
                },
                icon: Image.asset('assets/ic_right_arrow.png',height:  SizeConfig.getSize(35),
                  color: _pageNumber + 1 < (_totalPages ?? 0)
                      ? theme.secondaryColor
                      : theme.button1BG1,),
                padding: const EdgeInsets.all(0),
              ),
              CupertinoButton(
                minSize: double.minPositive,
                padding: EdgeInsets.zero,
                child: Row(
                  children: [
                    Image.asset('assets/ic_right_arrow.png',
                        color: _pageNumber + 1 < (_totalPages ?? 0)
                            ? theme.secondaryColor
                            : theme.button1BG1,
                        height: SizeConfig.getSize(35),
                        width: 12,
                        fit: BoxFit.fitHeight),
                    Image.asset('assets/ic_right_arrow.png',
                        color: _pageNumber + 1 < (_totalPages ?? 0)
                            ? theme.secondaryColor
                            : theme.button1BG1,
                        height: SizeConfig.getSize(35),
                        width: 12,
                        fit: BoxFit.fitHeight)
                  ],
                ),
                onPressed: () {
                  setState(() {
                    if(_pageNumber + 1 < (_totalPages ?? 0)){
                      _pageNumber = _totalPages -1;
                      _getPurchaseCounts(context);
                    }
                  });
                },
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: (){
                  showDialog(
                      barrierDismissible: true,
                      context: context,
                      barrierColor: const Color(0x01000000),
                      builder: (BuildContext context) {
                        return NumberPad(
                          initialOffset: Offset(500,100),
                          title: '',
                          isInitialRequired: true,
                          initialIntValue: _pageSize,
                          onOkPressed: ( value)  {
                            setState(() {
                              _pageSizeController.text = value.toString();
                              _pageSize = value;
                            });
                          },
                        );
                      });
                },
                child: Container(
                  height:SizeConfig.getSize(55) ,
                  padding: EdgeInsets.all(SizeConfig.getSize(15)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border:
                      Border.all(color: theme.secondaryColor!, width: 0.8)),
                  child: Text(
                    _pageSize.toString(),
                    style: theme.heading5?.copyWith(
                        fontSize:SizeConfig.getFontSize(18),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    MessagesProvider.get('Per Page'),
                    style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                  )),
                  Container(
                    height:  SizeConfig.getSize(55),
                    width: SizeConfig.getSize(100),
                    padding:  const EdgeInsets.only(left: 8.0,right: 8.0),
                    child: ElevatedButton(
                      onPressed: () => {
                      setState(() {
                      if( (_purchasesData?.length ?? 0) > 0){
                      setLoadingStatus(true);
                      _getPurchaseCounts(context);
                      }
                      })                      } ,
                      style: ElevatedButton.styleFrom(
                        padding:  const EdgeInsets.all(8.0),
                        backgroundColor: (_purchasesData?.length ?? 0) > 0 ? theme.button2BG1 :theme.button1BG1,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                      ),
                      child: Text(MessagesProvider.get('GO'), style:(_purchasesData?.length ?? 0) > 0 ? AppStyle.customerTextBoldWhite?.copyWith(fontSize: SizeConfig.getFontSize(18)): AppStyle.customerDisableText?.copyWith(fontSize: SizeConfig.getFontSize(18))
                          ,),),
                  )
            ]),
          ],
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AccountsTopBar(accountsData : cardData),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomerDatePicker(
                                title : MessagesProvider.get('From'),
                                hint : DateFormat(_dateFormat ?? 'dd-MM-yyyy').format(DateTime.now()),
                                controller : _fromDateCtr, isBrithDate : false),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomerDatePicker(
                               title :  MessagesProvider.get('To'),
                                hint : DateFormat(_dateFormat ?? 'dd-MM-yyyy').format(DateTime.now()),
                                controller : _toDateCtr, isBrithDate : false),
                          ],
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, 8),
                      child: Row(
                        children: [
                          Transform.scale(
                            scale:SizeConfig.getSize(2.9) ,
                            child: Checkbox(
                              checkColor:theme.secondaryColor,
                              activeColor: theme.backGroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              side: MaterialStateBorderSide.resolveWith(
                                    (states) =>  BorderSide(
                                    width: 1.0, color: theme.secondaryColor!),
                              ),
                              //fillColor: MaterialStateProperty.resolveWith(Colors.black),
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(-10, 0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                MessagesProvider.get('Consolidated View'),
                                style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Card(
                            color: theme.button1BG1,
                            elevation: 1,
                            child: Padding(
                              padding: EdgeInsets.all(7),
                              child: Container(
                                height:SizeConfig.getSize(30) ,
                                width: SizeConfig.getSize(30),
                                child: InkWell(
                                  child: Image.asset('assets/ic_search.png',width: 24,height: 24,color: theme.secondaryColor,),
                                  onTap: () {
                                    if(_isChecked){
                                      _notificationBar?.showMessage(
                                          MessagesProvider.get('Unable to connect to server : Unknown server error.sever response is empty.'),
                                          AppColors.notificationBGRedColor);
                                    }else {
                                      if(_isFromDateGreater()){
                                        _showErrorMessageDialogView(context, MessagesProvider.get('ERROR'), MessagesProvider.get('To Date should be greater than From Date'));
                                      }
                                      else{
                                        if (daysBetween(
                                            DateTime.parse(
                                                _getFormattedDate(
                                                    _fromDateCtr.text)),
                                            DateTime.parse(
                                                _getFormattedDate(
                                                    _toDateCtr.text))) >=
                                            365) {
                                          _showErrorDialogView(
                                              context,
                                              MessagesProvider.get('WARNING'),
                                              MessagesProvider.get('Date range provided is greater than a year. Do you want to proceed with search?'),
                                              1);
                                        } else {
                                          setLoadingStatus(true);
                                          _notificationBar?.showMessage(
                                              '', theme.primaryColor!);
                                          _getPurchaseCounts(context);
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                          setState(() {
                                            // _addSearchFilter();
                                          });
                                        }
                                      }
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height:  SizeConfig.getSize(60),
                            width: SizeConfig.getSize(120),
                            padding:  const EdgeInsets.only(left: 8.0,right: 8.0),
                            child: ElevatedButton(
                              onPressed: ()  {
                                if((_purchasesData?.length ?? 0) > 0){
                                  _showErrorDialogView(context, "WARNING",
                                      MessagesProvider.get('The search criteria is modified. Do you want to print for the updated search criteria?'),2);
                                  setState(() {});
                                }
                              } ,
                              style: ElevatedButton.styleFrom(
                                padding:  const EdgeInsets.all(8.0),
                                backgroundColor: (_purchasesData?.length ?? 0) > 0 ? theme.button2BG1! : theme.button1BG1!,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                              ),
                              child: Text(MessagesProvider.get('PRINT'), style:(_purchasesData?.length ?? 0) > 0 ? AppStyle.customerTextBoldWhite?.copyWith(fontSize: SizeConfig.getFontSize(18)): AppStyle.customerDisableText?.copyWith(fontSize: SizeConfig.getFontSize(18))
                                ,),),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                 Padding(
                  padding: EdgeInsets.only(left: 10, right: 10,bottom: 5),
                  child: Divider(height: 0,color: theme.secondaryColor,),
                ),
                Expanded(
                  child: Scroller(
                    controller:_horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom : 24.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller:_horizontal,
                        child: Scroller(
                          controller:_vertical,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 24.0),
                            child: SingleChildScrollView(
                              child: Container(
                                width:  MediaQuery.of(context).size.width *2.226,
                                //height: 200,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: SizeConfig.getSize(20)),
                                          child: Text(
                                            MessagesProvider.get('Date'),
                                            style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: SizeConfig.getSize(170)),
                                          child: Text(
                                            MessagesProvider.get('Product'),
                                            style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: SizeConfig.getSize(170)),
                                          child: Text(
                                            MessagesProvider.get('Amount'),
                                            style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: SizeConfig.getSize(60)),
                                          child: Text(
                                            MessagesProvider.get('Credits'),
                                            style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: SizeConfig.getSize(40)),
                                          child: Text(
                                            MessagesProvider.get('Courtesy'),
                                            style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: SizeConfig.getSize(60)),
                                          child: Text(
                                            MessagesProvider.get('Bonus'),
                                            style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: SizeConfig.getSize(60)),
                                          child: Text(
                                            MessagesProvider.get('Time'),
                                            style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: SizeConfig.getSize(40)),
                                          child: Text(
                                            MessagesProvider.get('Tokens'),
                                            style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: SizeConfig.getSize(40)),
                                          child: Text(
                                            MessagesProvider.get('Tickets'),
                                            style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: SizeConfig.getSize(20)),
                                          child: Text(
                                            MessagesProvider.get('Play Credits'),
                                            style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: SizeConfig.getSize(20)),
                                          child: Text(
                                            MessagesProvider.get('Counter Items'),
                                            style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: SizeConfig.getSize(40)),
                                          child: Text(
                                            MessagesProvider.get('Loyalty Points'),
                                            style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: SizeConfig.getSize(40)),
                                          child: Text(
                                            MessagesProvider.get('Virtual Points'),
                                            style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: SizeConfig.getSize(160)),
                                          child: Text(
                                            MessagesProvider.get('Site'),
                                            style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: SizeConfig.getSize(160)),
                                          child: Text(
                                            MessagesProvider.get('POS'),
                                            style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: SizeConfig.getSize(60)),
                                          child: Text(
                                            MessagesProvider.get('UserName'),
                                            style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: SizeConfig.getSize(80)),
                                          child: Text(
                                            MessagesProvider.get('Quantity'),
                                            style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: SizeConfig.getSize(50)),
                                          child: Text(
                                            MessagesProvider.get('Price'),
                                            style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: SizeConfig.getSize(70)),
                                          child: Text(
                                            MessagesProvider.get('Refld'),
                                            style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: SizeConfig.getSize(50)),
                                          child: Text(
                                            MessagesProvider.get('Activity Type'),
                                            style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: SizeConfig.getSize(70)),
                                          child: Text(
                                            MessagesProvider.get('Status'),
                                            style: theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )

                                      ],
                                    ),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        controller:_vertical,
                                        physics: const ScrollPhysics(),
                                        itemCount: _purchasesData?.length ?? 0,
                                        itemBuilder: (BuildContext context, int index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child:  PurchaseSearchListItem(
                                              selectedIndex: _selectedIndex, index: index,
                                              data :_purchasesData,
                                              notificationBar: _notificationBar!,
                                              onChange: (value){
                                                setState((){
                                                  _selectedIndex = value;
                                                  //  _selectedData = _accountDetailsData?[_selectedIndex];
                                                });
                                              },),
                                          );
                                        }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ).withLoader(isLoading: _isLoading,theme: theme);
  }

  _showErrorDialogView(BuildContext context, String title, String message, int type) {
    showDialog(
        context: context, builder: (_) =>  _showDialogWidget(title,message,type));
  }

  _showErrorMessageDialogView(BuildContext context, String title, String message) {
    showDialog(
        context: context, builder: (_) =>  LoginErrorDialog(title,message));
  }

  int daysBetween(DateTime from, DateTime to) {
    return (to.difference(from).inHours / 24).round();
  }

  void setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }

  String _getFormattedDate(String text) {
    var inputFormat = DateFormat(_dateFormat ?? 'dd-MM-yyyy');
    var date1 = inputFormat.parse(text);
    var outputFormat = DateFormat('yyyy-MM-dd');
    return outputFormat.format(date1);
  }

  String _getFormattedDateForAPI(String text) {
    var inputFormat = DateFormat(_dateFormat ?? 'dd-MM-yyyy');
    var date1 = inputFormat.parse(text);
    var outputFormat = DateFormat('MM-dd-yyyy');
    return outputFormat.format(date1);
  }

  bool _isFromDateGreater(){
    DateTime dt1 = DateTime.parse(_getFormattedDate(_fromDateCtr.text));
    DateTime dt2 = DateTime.parse(_getFormattedDate(_toDateCtr.text));
    return dt1.compareTo(dt2) > 0 ? true: false;
  }

  _showDialogWidget(String title,String message, int type){
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return AlertDialog(
      title:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16.0),
        child: Text(title,
          style:GoogleFonts.robotoCondensed(
              color: theme.secondaryColor, fontSize: 26.0, fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
      ),
      contentPadding: EdgeInsets.zero,
      //insetPadding: EdgeInsets.symmetric(vertical: 100),
      insetPadding: EdgeInsets.zero,
      content: _widget(context,title,message),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
              if(type!= 1 ){
                _notificationBar?.showMessage(
                    MessagesProvider.get('System.Net.Http.StreamContent+ReadOnlyStream'),
                    AppColors.notificationBGRedColor);
                FocusManager.instance.primaryFocus
                    ?.unfocus();
                setState(() {
                  // _addSearchFilter();
                });
              }
            },
            style: ElevatedButton.styleFrom(
              padding:  const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32),
              backgroundColor: theme.button1BG1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            ),
            child: Text(MessagesProvider.get("no").toUpperCase(), style: GoogleFonts.robotoCondensed(
                color: theme.secondaryColor, fontSize: 19.0, fontWeight: FontWeight.w700),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
              if(type == 1) {
                _getPurchaseCounts(context);
              }
              else if(type == 3){
                _notificationBar?.showMessage(
                    MessagesProvider.get('System.Net.Http.StreamContent+ReadOnlyStream'),
                    AppColors.notificationBGRedColor);
              }
              else{
                if (daysBetween(DateTime.parse(
                    _getFormattedDate(_fromDateCtr.text)),
                    DateTime.parse(_getFormattedDate(
                        _toDateCtr.text))) >= 365) {
                  _showErrorDialogView(context, MessagesProvider.get('WARNING'),
                      MessagesProvider.get('Date range provided is greater than a year. Do you want to proceed with search?'),3);
                } else {
                  _notificationBar?.showMessage(
                      MessagesProvider.get('print failed'),
                      AppColors.notificationBGRedColor);
                  FocusManager.instance.primaryFocus
                      ?.unfocus();
                  setState(() {
                    // _addSearchFilter();
                  });
                }

              }
            },
            style: ElevatedButton.styleFrom(
              padding:  const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32),
              backgroundColor: theme.button2BG1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            ),
            child: Text(MessagesProvider.get('yes').toUpperCase(), style: GoogleFonts.robotoCondensed(
                color: Colors.white, fontSize: 19.0, fontWeight: FontWeight.w700),),
          ),
        )
      ],
    );
  }
  Widget _widget(BuildContext context, String title, String message){
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    LineSplitter ls = LineSplitter();
    List<String> lines = ls.convert(message);
    if(lines.length > 1) {
      String message1 = lines[0];
      String message2 = lines[1];
    }
    return Container(
      width: MediaQuery.of(context).size.width*0.7,
      // padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 1,color: theme.dividerColor,),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 50),
            child: Column(
              children: [
                Visibility(
                  visible: lines.length > 1 ? true :false,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text( lines.length > 1 ? lines[0] :"",
                        style: GoogleFonts.robotoCondensed(
                            color: theme.secondaryColor, fontSize: 26.0, fontWeight: FontWeight.w700)
                    ),
                  ),
                ),
                Text(
                    lines.length > 1 ? lines[1] : message,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.robotoCondensed(
                        color: theme.secondaryColor, fontSize: 26.0, fontWeight: FontWeight.w400)
                ),
              ],
            ),
          ),
          Container(height: 1,color: theme.dividerColor,),
        ],
      ),
    );
  }
}


