import 'package:customer_data/builder.dart';
import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:customer_data/models/customer_data.dart';
import 'package:customer_ui/LinkNewCardScreen.dart';
import 'package:customer_ui/providers/SelectedCardDetailsProvider.dart';
import 'package:customer_ui/providers/SelectedCustomerProvider.dart';
import 'package:customer_ui/utils/extensions.dart';
import 'package:customer_ui/widgets/CardDetailsWidget.dart';
import 'package:customer_ui/widgets/CustomerNameCard.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:membership_data/builder.dart';
import 'package:membership_data/models/membership_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:provider/provider.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';

import '../../AccountsDetailsPage.dart';
import '../../ListViewItems/AccountsSearchListItems.dart';

class CustomerAccounts extends StatefulWidget {
  final bool? isFromSearch;
  String? fromPage;
  final NotificationBar notificationBar;
  final bool showSidebar;
  final Function(String?)? selectedIndex;

  CustomerAccounts(
      {super.key,
        this.fromPage,
        this.isFromSearch,
        this.selectedIndex,
        required this.notificationBar,
        required this.showSidebar});

  @override
  State<CustomerAccounts> createState() => _CustomerAccountsState();
}

class _CustomerAccountsState extends State<CustomerAccounts> {
  final _firstNameCtr = TextEditingController();
  final _middleNameCtr = TextEditingController();
  final _lastNameCtr = TextEditingController();
  final _dobNameCtr = TextEditingController();
  final _membershipCtr = TextEditingController();
  final TextEditingController _cardNumberCtr = TextEditingController();
  bool _isLoading = false;
  CustomerData? data;
  bool _isCheckedPrimary = false;
  bool _isCheckedValid = false;
  bool _isCheckedBalence = false;
  AccountDetailsResponse? accounts;
  bool showData = false;
  int _customerId = 0;
  int _selectedIndex = 0;
  List<AccountDetailsData?>? _accountDetailsData;
  List<AccountDetailsData?>? _accountDetailsDataMain;
  AccountDetailsData? _selectedData;
  String _dateTimeFormat = "";
  String _dateFormat = "";
  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();
  late NotificationBar _notificationBar;

  Future getAccountDetails(BuildContext context) async {
    Log.printMethodStart('getAccountDetails()', 'Customer Account Screen','init');
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final customerDataBl = await CustomerDataBuilder.build(execContext!);
    accounts =
    await customerDataBl.getCustomerAccounts(customerId: _customerId);
    setState(() {
      setLoadingStatus(false);
      _accountDetailsData = accounts?.data ?? [];
      _accountDetailsDataMain = _accountDetailsData;
      _selectedData = _accountDetailsData![_selectedIndex];
      context.read<SelectedCardDetails>().updateData(_selectedData);
      if((_accountDetailsData?.length ?? 0) > 0){
        context.read<SelectedCardDetails>().updateCardLength(_accountDetailsData?.length);
      }else{
        context.read<SelectedCardDetails>().updateData(null);
      }
      _addSearchFilter();
    });
    print("Selected Customer ID : $_customerId");
    print(accounts?.data?.length);
    print("tagNumber : ${accounts!.data!.first.tagNumber}");
    print("showData : $showData");
    Log.printMethodEnd('getAccountDetails()', 'Customer Accounts Screen','init');
  }

  @override
  void initState() {
    super.initState();
    print("init state");
    _notificationBar = widget.notificationBar;
    initializeDateFormatting();
    _getDateTimeFormat();
    _getDateFormat();
    setLoadingStatus(true);
    getAccountDetails(context);
    Future.microtask(() => _initDropDownList());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _membershipCtr.text = context.watch<SelectedCardDetails>().selectedData?.membershipName.toString() ?? '-';
    data = (widget.isFromSearch ?? false)
        ? context.watch<SelectedCustomer>().selectedSearchData
        : context.watch<SelectedCustomer>().selectedData;
    _customerId = data?.id ?? 0;
    if (data != null) {
      var birthDate = data?.dateOfBirth ?? '';
      if (birthDate != '') {
        DateFormat dateFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
        DateTime tempDate = dateFormat.parse(birthDate);
        String dob = DateFormat("dd-MM-yyyy").format(tempDate);
        _dobNameCtr.text = dob.toString() ?? "";
      }
    }
    _firstNameCtr.text = data?.firstName ?? "";
    _middleNameCtr.text = data?.middleName ?? "";
    _lastNameCtr.text = data?.lastName ?? "";

    //getAccountDetails(context);
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Container(
          alignment: Alignment.centerLeft,
          height: SizeConfig.getSize(70),
          child: Column(
            children: [
              Divider(
                color: theme.dividerColor,
                height: 0,
                thickness: 2,
                indent: 10,
                endIndent: 10,
              ),
              SizedBox(height:SizeConfig.getSize(10) ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:SizeConfig.getSize(10) ,),
                      Visibility(
                        visible: ((widget.fromPage ?? "") == "change")
                            ? true
                            : false,
                        child: Container(
                          height: SizeConfig.getSize(60),
                          width: MediaQuery.of(context).size.width * 0.080,
                          padding: const EdgeInsets.only(left: 0, right: 8.0),
                          child: ElevatedButton(
                            onPressed: () => {
                              context.read<SelectedCardDetails>().updateData(_selectedData),
                              Navigator.pop(context)
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(4.0),
                              backgroundColor: showData
                                  ? theme.button2BG1
                                  : theme.button1BG1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0)),
                            ),
                            child: Text(
                              MessagesProvider.get('Select'),
                              style: theme.headingLight5?.copyWith(
                                  color:showData?Colors.white:theme.dividerColor,
                                  fontSize: SizeConfig.getFontSize(16),
                                  fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: widget.isFromSearch ?? false,
                        child: Container(
                          height: SizeConfig.getSize(60),
                          width: MediaQuery.of(context).size.width * 0.080,
                          padding: const EdgeInsets.only(left: 0),
                          child: ElevatedButton(
                            onPressed: () {
                              widget.selectedIndex!(_selectedData?.tagNumber);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(4.0),
                              backgroundColor: showData
                                  ? theme.button2BG1
                                  : theme.button1BG1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0)),
                            ),
                            child: Text(
                              MessagesProvider.get('Select'),
                              style: theme.headingLight5?.copyWith(
                                  color:showData?Colors.white:theme.dividerColor,
                                  fontSize: SizeConfig.getFontSize(16),
                                  fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: SizeConfig.getSize(60),
                        width: MediaQuery.of(context).size.width * 0.080,
                        padding: const EdgeInsets.only(left: 0),
                        child: ElevatedButton(
                          onPressed: () => {
                            //_showAddressDialog("title", null, 1, true)
                            if(showData){
                              context.read<SelectedCardDetails>().updateData(_accountDetailsData?[_selectedIndex]),
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AccountsDetailsPage(
                                    source: 0,from: widget.fromPage,accountDetailsData : _accountDetailsData?[0]
                                  )))
                            }
                          } ,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(4.0),
                            backgroundColor: showData
                                ? theme.button2BG1
                                : theme.button1BG1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)),
                          ),
                          child: Text(
                            MessagesProvider.get('Account Details'),
                            style: theme.headingLight5?.copyWith(
                                color:showData?Colors.white:theme.dividerColor,
                                fontSize: SizeConfig.getFontSize(16),
                                fontWeight: FontWeight.w500
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ), // New Button
                      Container(
                        height: SizeConfig.getSize(60),
                        // height:  MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * 0.080,
                        padding: const EdgeInsets.only(left: 8.0, right: 4.0),
                        child: ElevatedButton(
                          onPressed: () => {
                            //_showAddressDialog("title", null, 1, true)
                            if(showData){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      AccountsDetailsPage(source: 0,
                                      )))}
                          } ,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(4.0),
                            backgroundColor: showData
                                ? theme.button2BG1
                                : theme.button1BG1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)),
                          ),
                          child: Text(
                            MessagesProvider.get('Credit Plus'),
                            style: theme.headingLight5?.copyWith(
                                color:showData?Colors.white:theme.dividerColor,
                                fontSize: SizeConfig.getFontSize(16),
                                fontWeight: FontWeight.w500
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ), // New Button
                      Container(
                        height: SizeConfig.getSize(60),
                        // height:  MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * 0.070,
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        child: ElevatedButton(
                          onPressed: () => {
                            //_showAddressDialog("title", null, 1, true)
                            if(showData){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AccountsDetailsPage(source: 1,
                              )))}
                          } ,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(4.0),
                            backgroundColor: showData
                                ? theme.button2BG1
                                : theme.button1BG1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: Text(
                                MessagesProvider.get('Games'),
                                style: theme.headingLight5?.copyWith(
                                    color:showData?Colors.white:theme.dividerColor,
                                    fontSize: SizeConfig.getFontSize(16),
                                    fontWeight: FontWeight.w500
                                ),
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ), // New Button
                      Container(
                        height: SizeConfig.getSize(60),
                        // height:  MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * 0.10,
                        padding: const EdgeInsets.only(left: 4.0, right: 8.0),
                        child: ElevatedButton(
                          onPressed: () => {
                            //_showAddressDialog("title", null, 1, true)
                            if(showData){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      AccountsDetailsPage(source: 3,
                                      )))}
                          } ,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(4.0),
                            backgroundColor: showData
                                ? theme.button2BG1
                                : theme.button1BG1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)),
                          ),
                          child: Text(
                            MessagesProvider.get('Purchase Activity'),
                            style:theme.headingLight5?.copyWith(
                                color:showData?Colors.white:theme.dividerColor,
                                fontSize: SizeConfig.getFontSize(16),
                                fontWeight: FontWeight.w500
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ), // New Button
                      Container(
                        height: SizeConfig.getSize(60),
                        // height:  MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * 0.080,
                        padding: const EdgeInsets.only(left: 0),
                        child: ElevatedButton(
                          onPressed: () => {
                            //_showAddressDialog("title", null, 1, true)
                            if(showData){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      AccountsDetailsPage(source: 4,
                                      )))}
                          } ,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(4.0),
                            backgroundColor: showData
                                ? theme.button2BG1
                                : theme.button1BG1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: Text(
                                MessagesProvider.get('Game Activity'),
                                style: theme.headingLight5?.copyWith(
                                    color:showData?Colors.white:theme.dividerColor,
                                    fontSize: SizeConfig.getFontSize(16),
                                    fontWeight: FontWeight.w500
                                ),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ), // New Button
                    ],
                  ),
                ],)],
          ),
        ),
      ),
      body: Container(
        color: theme.backGroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomerNameCard(
                name: "${_firstNameCtr.text}  ${_lastNameCtr.text}",
                membership:
                _membershipCtr.text.isNotEmpty ? _membershipCtr.text : '-',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Visibility(
                      visible: true,
                      child: Transform.scale(
                        scale: SizeConfig.getSize(2.9),
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
                          value: _isCheckedPrimary,
                          onChanged: (bool? value) {
                            setState(() {
                              _isCheckedPrimary = value!;
                              _addSearchFilter();
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  Transform.translate(
                    offset: const Offset(0, 0),
                    child: Visibility(
                        visible: true,
                        child: Text(
                          MessagesProvider.get('Primary'),
                          style: theme.heading5?.copyWith(
                              fontSize: SizeConfig.getFontSize(18),
                              fontWeight: FontWeight.w700
                          ),
                        )),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04),
                    child: Visibility(
                      visible: true,
                      child: Transform.scale(
                        scale: SizeConfig.getSize(2.9),
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
                          value: _isCheckedValid,
                          onChanged: (bool? value) {
                            setState(() {
                              _isCheckedValid = value!;
                              _addSearchFilter();
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  Transform.translate(
                    offset: const Offset(0, 0),
                    child: Visibility(
                        visible: true,
                        child: Text(
                          MessagesProvider.get('Valid'),
                          style: theme.heading5?.copyWith(
                              fontSize: SizeConfig.getFontSize(18),
                              fontWeight: FontWeight.w700
                          ),
                        )),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04),
                    child: Visibility(
                      visible: true,
                      child: Transform.scale(
                        scale: SizeConfig.getSize(2.9),
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
                          value: _isCheckedBalence,
                          onChanged: (bool? value) {
                            setState(() {
                              _isCheckedBalence = value!;
                              _addSearchFilter();
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  Transform.translate(
                    offset: const Offset(0, 0),
                    child: Visibility(
                        visible: true,
                        child: Text(
                          MessagesProvider.get('Balance > 0'),
                          style: theme.heading5?.copyWith(
                              fontSize: SizeConfig.getFontSize(18),
                              fontWeight: FontWeight.w700
                          ),
                        )),
                  ),



                  Flexible(
                    fit: FlexFit.loose,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: SizeConfig.getSize(180),
                          child: TextFormField(
                            controller: _cardNumberCtr,
                            textAlign: TextAlign.start,
                            readOnly: false,
                            style: theme.heading5?.copyWith(
                                fontSize: 14.0,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500
                            ),
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding:
                              EdgeInsets.fromLTRB(SizeConfig.getSize(15), SizeConfig.getSize(15), SizeConfig.getSize(15), SizeConfig.getSize(15)),
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
                            onChanged: (data) {
                              setState(() {
                                _cardNumberCtr.text = data;
                                _cardNumberCtr.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset: _cardNumberCtr.text.length));
                              });
                            },
                            onTap: () {},
                          ),
                        ),
                        //Card No Edit text
                        const Padding(
                          padding: EdgeInsets.only(left: 3),
                        ),

                        Card(
                          color: theme.button1BG1,
                          elevation: 1,
                          child: Padding(
                            padding:  EdgeInsets.all(SizeConfig.getSize(2)),
                            child: SizedBox(
                              width: SizeConfig.getSize(50),
                              child: InkWell(
                                child: Image.asset('assets/ic_search.png',color: theme.secondaryColor,),
                                onTap: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  setState(() {
                                    _addSearchFilter();
                                  });
                                },
                              ),
                            ),
                          ),
                        ),

                        Container(
                          // height:  MediaQuery.of(context).size.height,
                          height: SizeConfig.getSize(60),
                          width: MediaQuery.of(context).size.width * 0.10,
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  barrierColor: Colors.black12,
                                  context: context,
                                  builder: (_) {
                                    return Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0,
                                            left: 0,
                                            right: 0,
                                            bottom: 0),
                                        child: LinkNewCardScreen(
                                          notificationBar:
                                          widget.notificationBar,
                                        ));
                                  });
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(0.0),
                              backgroundColor: theme.button2BG1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0)),
                            ),
                            child: Text(
                              MessagesProvider.get('New'),
                              style: theme.headingLight5?.copyWith(
                                  color: Colors.white,
                                  fontSize: SizeConfig.getFontSize(18),
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ), // New Button
                ],
              ),
              Divider(
                color: theme.dividerColor,
                height: 3,
                thickness: 2,
                indent: 10,
                endIndent: 10,
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 0, left: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:widget.showSidebar?MediaQuery.of(context).size.width * 0.51:MediaQuery.of(context).size.width * 0.695,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: SizeConfig.getSize(70),
                                  child: ListTile(
                                    dense: true,
                                    title: Padding(
                                      padding: const EdgeInsets.only(left: 0.0),
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: SizeConfig.getSize(10),
                                          ),
                                          Text(
                                            MessagesProvider.get('Card Number'),
                                            style:  theme.heading5?.copyWith(
                                                fontSize: SizeConfig.getFontSize(18),
                                                fontWeight: FontWeight.w700
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            width: SizeConfig.getSize(40),
                                          ),
                                          Text(
                                            MessagesProvider.get('Creation Date'),
                                            style:  theme.heading5?.copyWith(
                                                fontSize: SizeConfig.getFontSize(18),
                                                fontWeight: FontWeight.w700
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            width: SizeConfig.getSize(50),
                                          ),
                                          Text(
                                            MessagesProvider.get('Expire Date'),
                                            style:  theme.heading5?.copyWith(
                                                fontSize: SizeConfig.getFontSize(18),
                                                fontWeight: FontWeight.w700
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            width: SizeConfig.getSize(40),
                                          ),
                                          Text(
                                            MessagesProvider.get('Primary'),
                                            style:  theme.heading5?.copyWith(
                                                fontSize: SizeConfig.getFontSize(18),
                                                fontWeight: FontWeight.w700
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                      maxHeight: SizeConfig.getSize(SizeConfig.screenHeight * 0.7)),
                                  child: Scroller(
                                    controller: _vertical,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 25),
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          controller: _vertical,
                                          physics: const ScrollPhysics(),
                                          itemCount:
                                          _accountDetailsData?.length ?? 0,
                                          padding: const EdgeInsets.only(
                                              left: 0, right: 0.0),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding:
                                              const EdgeInsets.all(1.0),
                                              child: AccountsSearchListItem(
                                                selectedIndex: _selectedIndex,
                                                index: index,
                                                data: _accountDetailsData,
                                                onChange: (value) {
                                                  setState(() {
                                                    _selectedIndex = value;
                                                    _selectedData = _accountDetailsData?[_selectedIndex];
                                                  });
                                                }, dateFormat: _dateFormat,
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.loose,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5, right: 5),
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black), borderRadius:
                                  BorderRadius.circular(6.0),
                                      color:  theme.tableRow1),
                                  //width: MediaQuery.of(context).size.width * 0.25,
                                //  height :   SizeConfig.getSize(SizeConfig.screenHeight * 0.7),
                                  height: SizeConfig.isBigDevice()? SizeConfig.getSize(500): SizeConfig.getSize(400),
                                  child: Column(
                                    mainAxisAlignment:
                                    showData? MainAxisAlignment.start: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Visibility(
                                        visible: showData,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                                padding:
                                                const EdgeInsets.all(0),
                                                onPressed: () {
                                                  setState(() {
                                                    if (_selectedIndex > 0) {
                                                      _selectedIndex--;
                                                      _selectedData =
                                                      _accountDetailsData?[_selectedIndex];_scrollToIndex();
                                                    }
                                                  });
                                                },
                                                icon: Image.asset(
                                                    'assets/back_arrow_white.png',
                                                    height: SizeConfig.getSize(40),
                                                    width: SizeConfig.getSize(40),
                                                    color: (_selectedIndex > 0) ? theme.secondaryColor : Colors.grey)),
                                            const SizedBox(width: 20),
                                            SizedBox(
                                              width: SizeConfig.getSize(85),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    _selectedData?.tagNumber ?? "-",
                                                    style: TextStyle(
                                                        fontSize: SizeConfig.getFontSize(16),
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  Text(
                                                    (_accountDetailsData?.length ?? 0) == 0 ? ''
                                                        : "${_selectedIndex + 1} of ${_accountDetailsData?.length ?? 0}",
                                                    style: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            IconButton(
                                                padding:
                                                const EdgeInsets.all(0),
                                                onPressed: () {
                                                  setState(() {
                                                    if (_selectedIndex <
                                                        (_accountDetailsData?.length ?? 0) - 1) {
                                                      _selectedIndex++;
                                                      _selectedData =
                                                      _accountDetailsData?[
                                                      _selectedIndex];
                                                      _scrollToIndex();
                                                    }
                                                  });
                                                },
                                                icon: Image.asset(
                                                  'assets/ic_right_arrow.png',
                                                  height: SizeConfig.getSize(40),
                                                  width: SizeConfig.getSize(40),
                                                  color: (_selectedIndex <
                                                      (_accountDetailsData?.length ?? 0) - 1)
                                                      ? theme.secondaryColor
                                                      : Colors.grey,
                                                )),
                                          ],
                                        ),
                                      ),
                                      Visibility(
                                        visible: showData,
                                        child:  Divider(
                                          color:theme.dividerColor,
                                          height: 0,
                                          thickness: 1,
                                          indent: 0,
                                          endIndent: 0,
                                        ),
                                      ),
                                      SizedBox(height: SizeConfig.getSize(4)),
                                      Visibility(
                                        visible: showData,
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 5),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.vertical,
                                              child: CardDetailsWidget(
                                                  _selectedData,_dateTimeFormat),
                                            )),
                                      ),
                                      Visibility(
                                          visible: !showData,
                                          child:  Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.087),
                                            child: Text(
                                              MessagesProvider.get('0 Items selected'),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                  FontWeight.bold),
                                            ),
                                          ))
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),

            ],
          ),
        ),
      ),
    ).withLoader(isLoading: _isLoading,theme: theme);
  }

  void setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }

  Future<void> _initDropDownList() async {
    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    var membershipDataBl = await MembershipDataBuilder.build(execContextDTO!);
    var memberShip = await membershipDataBl.callMembershipDataApi();
    List<MembershipContainerDTO>? membershipList =
        memberShip.data?.membershipContainerDTOList;
    if (data?.membershipId != -1) {
      setState(() {
        _customerId = data?.membershipId ?? 0;
        _membershipCtr.text = membershipList
            ?.firstWhere(
                (element) => element.membershipId == data?.membershipId)
            .membershipName ??
            "";
      });
    }
  }

  _scrollToIndex() {
    final contentSize = _vertical.position.viewportDimension +
        _vertical.position.maxScrollExtent;
    final itemCount = _accountDetailsData?.length ?? 0;
    final target = contentSize * _selectedIndex / itemCount;
    _vertical.animateTo(target,
        curve: Curves.ease, duration: const Duration(seconds: 1));
  }

  void _addSearchFilter() {
    setState(() {
      List<AccountDetailsData> data = List.from(_accountDetailsDataMain!);
      if (_cardNumberCtr.text.isNotEmpty) {
        data.removeWhere((element) =>
        element.tagNumber.startsWith(_cardNumberCtr.text) == false);
      }
      if (_isCheckedPrimary) {
        data.removeWhere((element) => element.primaryAccount == false);
      }
      if (_isCheckedValid) {
        data.removeWhere((element) => element.validFlag == false);
      }
      if (_isCheckedBalence) {
        data.removeWhere((element) => element.totalTicketsBalance! <= 0);
      }
      _accountDetailsData = data;
      if (data.isEmpty) {
        showData = false;
      } else {
        showData = true;
      }
    });
  }

  _getDateTimeFormat() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    final dateTimeFormat = await masterDataBL.getDefaultValuesByName(defaultValueName: "DATETIME_FORMAT");
    _dateTimeFormat = (dateTimeFormat!.contains("tt")) ? dateTimeFormat.replaceAll("tt", "a") : dateTimeFormat;
  }
  _getDateFormat() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    final dateTimeFormat = await masterDataBL.getDefaultValuesByName(defaultValueName: "DATE_FORMAT");
    _dateFormat =  dateTimeFormat!;
  }
}
