import 'dart:collection';
import 'dart:convert';

import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/configurations/configuration_response.dart';
import 'package:master_data/models/configurations/parafait_default_container_dto.dart';
import 'package:master_data/models/pos_machines_container/pos_machine_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:orders_data/builder.dart';
import 'package:orders_data/models/transaction_status_container/transaction_status_container_dto.dart';
import 'package:orders_data/models/transactions/transaction_data.dart';
import 'package:orders_data/models/user_container/user_container_dto.dart';
import 'package:orders_ui/OrdersPage.dart';
import 'package:orders_ui/utils/NotificationMessage.dart';
import 'package:orders_ui/utils/extensions.dart';
import 'package:orders_ui/widgets/ErrorDialog.dart';
import 'package:orders_ui/widgets/TablePagination.dart';
import 'package:orders_ui/widgets/TopBar.dart';
import 'package:orders_ui/widgets/TransactionCustomerInputForm.dart';
import 'package:orders_ui/widgets/TransactionFilters.dart';
import 'package:orders_ui/widgets/TransactionListHeader.dart';
import 'package:orders_ui/widgets/TransactionListItem.dart';
import 'package:orders_ui/widgets/TransactionRHS.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:semnox_tablet_pos/SalesScreen.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';

class OpenTransactionScreen extends StatefulWidget{

  @override
  State<OpenTransactionScreen> createState() => _OpenTransactionScreenState();
}

class _OpenTransactionScreenState extends State<OpenTransactionScreen> {
  final ScrollController _transactionScroll = ScrollController();

  final ScrollController _pageScroll = ScrollController();
  final _pageController = TextEditingController();
  final _currentPageController = TextEditingController();
  final _trxNoController = TextEditingController();
  final _trxIdController = TextEditingController();
  final _orderNoController = TextEditingController();
  final _posMachineNoController = TextEditingController();
  final _otpController = TextEditingController();
  final _referenceController = TextEditingController();
  final _customerNameController = TextEditingController();
  final _fromDateController = TextEditingController();
  final _toDateController = TextEditingController();
  final _ccNumberController = TextEditingController();
  final _guestNameController = TextEditingController();
  final _contactController = TextEditingController();
  POSMachineContainerDTO? _posMachine;
  TransactionStatusContainerDTO? _status;
  UserContainerDTO? _staff;

  int _selectedIndex = 0;
  int _currentPage = 0;
  int _pageSize = 50;
  int _totalPage = 0;

  String _fromDate = "";
  String _toDate = "";

  List<TransactionsData?>? _data = [];
  TransactionsData? _selectedData;

  final Map<int,  List<TransactionsData?>?> _freeTables = HashMap();
  bool _showFilters = false;
  bool _isLoading = true;

  ParafaitDefaultContainerDTO? _dateObject;
  String? _dateFormat;
  ConfigurationResponse? _config;

  @override
  void initState() {
    super.initState();
    _getConfigurations(context);
    _pageController.text = _pageSize.toString();
    _currentPageController.text = (_currentPage+1).toString();
    String formattedDate1 = DateFormat(_dateFormat).format(DateTime.now());
    String formattedDate2 = DateFormat(_dateFormat).format(DateTime.now().add(Duration(days: 1)));
    _fromDateController.text = formattedDate1;
    _toDateController.text = formattedDate2;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
      setNotification.value = NotificationMessage(message:  MessagesProvider.get("View &1 transactions ",['Open']),color:theme.footerBG4);
    });
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Column(
      children: [
        Expanded(
          child: Container(
            color: theme.backGroundColor,
            child: LayoutBuilder(builder: (context, constraint) {
              return Scroller(
                controller: _pageScroll,
                child: Padding(
                  padding: const EdgeInsets.only(right: 26.0),
                  child: SingleChildScrollView(
                    controller: _pageScroll,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constraint.maxHeight),
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
                            Topbar(onPress: () {
                              setState(() {
                                _showFilters = !_showFilters;
                              });
                            },
                              up: _showFilters,),
                            const SizedBox(height: 12.0,),
                            Visibility(
                                visible: _showFilters,
                                child: TransactionFilter(
                                  trxNoController: _trxNoController,
                                  trxIdController: _trxIdController,
                                  orderNoController: _orderNoController,
                                  otpController: _otpController,
                                  referenceController: _referenceController,
                                  customerNameController: _customerNameController,
                                  fromDateController: _fromDateController,
                                  toDateController: _toDateController,
                                  ccNumberController: _ccNumberController,
                                  guestNameController: _guestNameController,
                                  contactController: _contactController,
                                  pageName: "open",
                                  onPosMachineChange: (value) {
                                    _posMachine = value;
                                  },
                                  onStatusChange: (value) {
                                    _status = value;
                                  },
                                  onStaffChange: (value) {
                                    _staff = value;
                                  },
                                  onClear: () {
                                    setState(() {
                                      _trxNoController.text = "";
                                      _trxIdController.text = "";
                                      _orderNoController.text = "";
                                      _posMachineNoController.text = "";
                                      _otpController.text = "";
                                      _referenceController.text = "";
                                      _customerNameController.text = "";
                                      _fromDateController.text = _fromDate;
                                      _toDateController.text = _toDate;
                                      _ccNumberController.text = "";
                                      _guestNameController.text = "";
                                      _contactController.text = "";
                                      _data = [];
                                      _selectedData = null;
                                    });
                                  },
                                  onSearch: () {
                                    if(!_isDateGreater(_toDateController.text,_fromDateController.text)){
                                      WidgetsBinding.instance.addPostFrameCallback((_) {
                                        setNotification.value = NotificationMessage(message: MessagesProvider.get("To Date should be greater than From Date"),color:theme.footerBG5);
                                      });
                                    }else if(_isDayDifferenceGreater(_toDateController.text,_fromDateController.text)){
                                      WidgetsBinding.instance.addPostFrameCallback((_) {
                                        setNotification.value = NotificationMessage(message: MessagesProvider.get("Date range for search should not be more than &1 days",[180]),color:theme.footerBG5);
                                      });
                                    }else{
                                      _search();
                                      WidgetsBinding.instance.addPostFrameCallback((_) {
                                        setNotification.value = NotificationMessage(message: MessagesProvider.get("View &1 transactions ",['Open']),color:theme.footerBG4);
                                      });
                                    }
                                  },)),
                            const SizedBox(height: 8.0,),
                            Expanded(
                              child: Container(
                                height: 200,
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 7,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 26.0),
                                              child: TransacationListHeader(),
                                            ),
                                            const SizedBox(height: 8.0,),
                                            Expanded(
                                              child:
                                              Scroller(
                                                controller: _transactionScroll,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(right: 26.0),
                                                  child: ListView.builder(
                                                      controller: _transactionScroll,
                                                      shrinkWrap: true,
                                                      physics: const ScrollPhysics(),
                                                      itemCount: _data?.length ?? 0,
                                                      itemBuilder: (
                                                          BuildContext context,
                                                          int index) {
                                                        return TransactionListItem(
                                                          dateFormat: _dateFormat,
                                                          selectedIndex: _selectedIndex,
                                                          index: index,
                                                          data: _data?[index],
                                                          onChange: (value) {
                                                            setState(() {
                                                              _selectedIndex = value;
                                                              _selectedData =
                                                              _data?[_selectedIndex];
                                                            });
                                                          },);
                                                      }),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                    const SizedBox(width: 8.0,),
                                    Container(
                                        width: (MediaQuery.of(context).size.width * 0.28),
                                        child: TransactionRHS(
                                          dateFormat: _dateFormat,
                                          selectedIndex: _selectedIndex,
                                          currentPage: _currentPage,
                                          pageSize: _pageSize,
                                          totalData: _data?.length ?? 0,
                                          data: _selectedData,
                                          onPrevious: () {
                                            if (_selectedIndex != 0) {
                                              setState(() {
                                                _selectedIndex--;
                                                _selectedData =
                                                _data?[_selectedIndex];
                                                _scrollToIndex();
                                              });
                                            }
                                          },
                                          onNext: () {
                                            var i = _data?.length;
                                            if (_selectedIndex != (i! - 1)) {
                                              setState(() {
                                                _selectedIndex++;
                                                _selectedData =
                                                _data?[_selectedIndex];
                                                _scrollToIndex();
                                              });
                                            }
                                          },))
                                  ],
                                ),
                              ),
                            ),
                            TablePagination(currentPage: _currentPage,
                              totalPage: _totalPage,
                              pageController: _pageController,
                              currentPageController: _currentPageController,
                              isSelected: _selectedData != null ? true : false,
                              onStart: () {
                                _currentPage = 0;
                                _currentPageController.text = (1).toString();
                                FocusScope.of(context).requestFocus(FocusNode());
                                _data = _freeTables[_currentPage];
                                setState(() {

                                });
                              },
                              onPrevious: () {
                                if (_currentPage > 0) {
                                  _currentPage--;
                                  _currentPageController.text = (_currentPage + 1).toString();
                                  if (_freeTables[_currentPage] == null) {
                                    _search();
                                  } else {
                                    _data = _freeTables[_currentPage];
                                    setState(() {

                                    });
                                  }
                                }
                                FocusScope.of(context).requestFocus(FocusNode());
                              },
                              onNext: () {
                                if ((_currentPage + 1) < _totalPage) {
                                  _currentPage = _currentPage + 1;
                                  _currentPageController.text = (_currentPage + 1).toString();
                                  if (_freeTables[_currentPage] == null) {
                                    _search();
                                  } else {
                                    _data = _freeTables[_currentPage];
                                    setState(() {});
                                  }
                                }
                                FocusScope.of(context).requestFocus(FocusNode());
                              },
                              onEnd: () {
                                _currentPage = _totalPage - 1;
                                _currentPageController.text = (_totalPage).toString();
                                if (_freeTables[_currentPage] == null) {
                                  _search();
                                } else {
                                  _data = _freeTables[_currentPage];
                                  setState(() {

                                  });
                                }
                                FocusScope.of(context).requestFocus(FocusNode());
                              },
                              onGo: () {
                                if(_pageSize != int.parse(_pageController.text)){
                                  _currentPage = 0;
                                  _freeTables.clear();
                                  _currentPageController.text = (1).toString();
                                  _search();
                                }else{
                                  _currentPage = int.parse(_currentPageController.text) - 1;
                                  if(_freeTables[_currentPage] == null){
                                    _search();
                                  }else{
                                    _data = _freeTables[_currentPage];
                                    setState(() {

                                    });
                                  }
                                }
                                FocusScope.of(context).requestFocus(FocusNode());
                              },
                              onRetrieve: () {
                                FocusScope.of(context).requestFocus(FocusNode());
                                String jsonData = jsonEncode(_selectedData);
                                retrievedData.value = jsonData;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SalesScreen(transactionRetrieveData: jsonData,),
                                  ),
                                );
                              },),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        )
      ],
    ).withLoader(theme,isLoading: _isLoading, message: MessagesProvider.get("Loading Open Transactions"));
  }

  void _setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }

  _scrollToIndex(){
    final contentSize = _transactionScroll.position.viewportDimension + _transactionScroll.position.maxScrollExtent;
    final itemCount = _data?.length ?? 0;
    final target = contentSize * _selectedIndex / itemCount;
    _transactionScroll.animateTo(target,curve: Curves.ease,duration:  const Duration(seconds: 1));
  }


  _search() async{
    _setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final orderSearchBL = await OrdersDataBuilder.build(executionContextDTO!);
    var _posName = executionContextDTO.posMachineName!;
    var _posMachineId = executionContextDTO.machineId!;
    _pageSize = int.parse(_pageController.text);
    customerName.value = '';
    String fromDate = "";
    if(_fromDateController.text != ""){
      DateFormat dateFormat = DateFormat(_dateFormat);
      var from = dateFormat.parse(_fromDateController.text);
      fromDate = DateFormat('yyyy-MM-dd T hh:mm:ss').format(from);
      print("parseDate $fromDate");
    }
    String toDate = "";
    if(_toDateController.text != ""){
      DateFormat dateFormat = DateFormat(_dateFormat);
      var from = dateFormat.parse(_toDateController.text);
      toDate = DateFormat('yyyy-MM-dd T hh:mm:ss').format(from);
    }

    try{
      Log.printMethodStart('_search()', 'Orders Screen','open');
      var response = await orderSearchBL.getTransaction(
        currentPage: _currentPage,
        pageSize: _pageSize,
        trxNumber: _trxNoController.text,
        trxId: _trxIdController.text == "" ? 0 : int.parse(_trxIdController.text),
        orderNo: _orderNoController.text == "" ? 0 : int.parse(_orderNoController.text),
        posMachine: _posMachine?.posMachineId ?? _posMachineId,
        status:(_status?.statusDescription == null || _status?.statusDescription == "All") ? "BOOKED,CONFIRMED,MERGED,ORDERED,PAID,PENDING_CLOSE,REOPENED,STARTED" : _status?.statusDescription,
        otp: _otpController.text,
        reference: _referenceController.text,
        customerName: _customerNameController.text,
        fromDate: fromDate,
        toDate: toDate,
        staff: _staff?.userId,
        guestName: _guestNameController.text,
        ccNumber: _ccNumberController.text == "" ? 0 : int.parse(_ccNumberController.text),
      );
      Log.printMethodEnd('_search()', 'Orders Screen','open');

      if(response.exception == null) {
        Log.printMethodReturn('_search() - done', 'Orders Screen','open');
        _setLoadingStatus(false);
        //_data = response.data;
        print('SEARCH ITEMS - ${response.data?.length ?? 0}');
      }
      _totalPage = orderSearchBL.getTotalTransactionPages() ?? 1;
      _freeTables.addAll({_currentPage: response.data});
      //_data = _freeTables[_currentPage];
      List<TransactionsData?>? data = List.from(_freeTables[_currentPage] ?? []);
      data.sort((a,b) => DateTime.parse((b?.transactionDate ?? "0001-01-01T00:00:00")).compareTo(DateTime.parse((a?.transactionDate ?? "0001-01-01T00:00:00"))));
      _data = data;
      _selectedData = _data?[_selectedIndex];
      setState(() {

      });
    }on DioError catch(error) {
      _setLoadingStatus(false);
      var errorString = error.response?.data['data'] as String?;
      Future.microtask(() => showErrorDialog(context, 'Error', errorString ?? ''));
    }
  }

  bool _isDateGreater(String date1,String date2){
    DateTime dt1 = DateFormat(_dateFormat).parse(date1); //from
    DateTime dt2 = DateFormat(_dateFormat).parse(date2);
    return dt1.compareTo(dt2) > 0 ? true: false;
  }

  bool _isDayDifferenceGreater(String date1,String date2){
    DateTime dt1 = DateFormat(_dateFormat).parse(date1); //from
    DateTime dt2 = DateFormat(_dateFormat).parse(date2);
    return dt1.difference(dt2).inDays > 180 ? true: false;
  }


  Future _getConfigurations(BuildContext context) async {
    var execContextBL = await ExecutionContextBuilder.build();
    var sysExecContext = execContextBL.getExecutionContext();
    var masterDataBl = await MasterDataBuilder.build(sysExecContext!);
    _config = await masterDataBl.getConfigurations();
    _dateFormat = await masterDataBl.getDefaultValuesByName(defaultValueName: "DATETIME_FORMAT");
    _dateFormat = _dateFormat?.replaceAll('tt', 'a');
    final startTime = await masterDataBl.getDefaultValuesByName(defaultValueName: "BUSINESS_DAY_START_TIME") ?? "4";
    var currentDateTime = DateTime.now();
    String formattedDate1 = DateFormat(_dateFormat).format(DateTime(currentDateTime.year, currentDateTime.month, currentDateTime.day, int.parse(startTime), 0, 0,));
    String formattedDate2 = DateFormat(_dateFormat).format(DateTime(currentDateTime.year, currentDateTime.month, currentDateTime.day, int.parse(startTime), 0, 0,).add(Duration(days: 1)));
    _fromDateController.text = formattedDate1;
    _toDateController.text = formattedDate2;
    _fromDate = formattedDate1;
    _toDate = formattedDate2;
    _search();
  }
}