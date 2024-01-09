import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/configurations/configuration_response.dart';
import 'package:master_data/models/configurations/parafait_default_container_dto.dart';
import 'package:master_data/models/order_status_container/order_status_container_dto.dart';
import 'package:master_data/models/pos_machines_container/pos_machine_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:orders_data/builder.dart';
import 'package:orders_data/models/facility_table_container/facility_table_container_dto.dart';
import 'package:orders_data/models/orders_data/orders_data.dart';
import 'package:orders_data/models/transactions/transaction_data.dart';
import 'package:orders_data/models/user_container/user_container_dto.dart';
import 'package:collection/src/functions.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:orders_ui/OrdersPage.dart';
import 'package:orders_ui/Screens/AllOrdersScreen.dart';
import 'package:orders_ui/cubit/closed_orders_cubit_state.dart';
import 'package:orders_ui/utils/AppColors.dart';
import 'package:orders_ui/utils/NotificationMessage.dart';
import 'package:orders_ui/utils/extensions.dart';
import 'package:orders_ui/widgets/ErrorDialog.dart';
import 'package:orders_ui/widgets/OrderActionMode.dart';
import 'package:orders_ui/widgets/OrderFilters.dart';
import 'package:orders_ui/widgets/OrdersListHeader.dart';
import 'package:orders_ui/widgets/OrdersListItem.dart';
import 'package:orders_ui/widgets/TablePagination.dart';
import 'package:orders_ui/widgets/TopBar.dart';
import 'package:semnox_tablet_pos/SalesScreen.dart';
import 'package:sprintf/sprintf.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';

import '../cubit/closed_orders_cubit.dart';
import 'TableSeatLoayoutScreen.dart' as TT;

class ClosedOrdersScreen extends StatefulWidget{
  @override
  State<ClosedOrdersScreen> createState() => _ClosedOrdersScreenState();
}

class _ClosedOrdersScreenState extends State<ClosedOrdersScreen> {
  final ScrollController _pageScroll = ScrollController();
  bool _showFilters = false;
  final ScrollController _orderScroll = ScrollController();
  final _pageController = TextEditingController();
  final _currentPageController = TextEditingController();
  final _guestNameController= TextEditingController();
  final _contactNameController= TextEditingController();
  final _tentNoNameController= TextEditingController();
  final _orderIdNameController= TextEditingController();
  final _fromDateController= TextEditingController();
  final _toDateController= TextEditingController();
  int _selectedIndex = -1;
  int _checkedIndex = -1;
  int _currentPage = 0;
  int _pageSize = 50;
  int _totalPage = 0;
  bool _isLoading = true;
  bool _actionMode = false;
  String _loadingMessage = "";

  String _fromDate = "";
  String _toDate = "";

  List<UserContainerDTO>? _userContainer;
  List<POSMachineContainerDTO>? _posMachineContainer;
  List<OrderStatusContainerDTO>? _transactionStatusContainer;
  List<FacilityTableContainerDTO>? _facilityTableContainer;

  POSMachineContainerDTO? _posMachine;
  OrderStatusContainerDTO? _status;
  UserContainerDTO? _staff;
  FacilityTableContainerDTO? _table;

  List<OrdersData?>? _data = [];
  OrdersData? _selectedData;
  final Map<int,  List<OrdersData?>?> _openOrders = HashMap();
  String? _dateFormat;
  final ordersGroup = <OrdersGroup>[];
  List<OrdersData> selectedOrdersForMove = [];
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
    _search();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
      setNotification.value = NotificationMessage(message: MessagesProvider.get("View Closed Orders"),color:theme.footerBG4);
    });
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return  BlocProvider(
      create: (context) => ClosedOrdersCubit(),
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: theme.backGroundColor,
              child: LayoutBuilder(
                builder: (context, constraint){
                  return Scroller(
                    controller: _pageScroll,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: SingleChildScrollView(
                        controller: _pageScroll,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: constraint.maxHeight),
                          child: IntrinsicHeight(
                            child: Column(
                              children: [
                                Topbar(onPress: (){
                                  setState(() {
                                    _showFilters = !_showFilters;
                                  });
                                },
                                  up: _showFilters,),
                                const SizedBox(height: 12.0,),
                                Visibility(
                                    visible: _showFilters,
                                    child: OrderFilters(
                                      pageName: "closed",
                                      selectedStatus: "CLOSED",
                                      guestNameController: _guestNameController,
                                      contactNameController: _contactNameController,
                                      tentNoNameController: _tentNoNameController,
                                      orderIdNameController: _orderIdNameController,
                                      fromDateController: _fromDateController,
                                      toDateController: _toDateController,
                                      userContainer: _userContainer,
                                      posMachineContainer: _posMachineContainer,
                                      transactionStatusContainer: _transactionStatusContainer,
                                      facilityTableContainer: _facilityTableContainer,
                                      onStaffChange: (value){
                                        _staff = value;
                                      },
                                      onStatusChange: (value){
                                        _status = value;
                                      },
                                      onPosMachineChange: (value){
                                        _posMachine =value;
                                      },
                                      onTableChange: (value){
                                        _table = value;
                                      },
                                      onClear: (){
                                        setState(() {
                                          _guestNameController.text = "";
                                          _contactNameController.text = "";
                                          _tentNoNameController.text = "";
                                          _orderIdNameController.text = "";
                                          _fromDateController.text = _fromDate;
                                          _toDateController.text = _toDate;
                                          _data = [];
                                          _selectedData = null;
                                        });
                                      },
                                      onSearch:(){
                                        if(_isDateGreater(_toDateController.text,_fromDateController.text)){
                                          _search();
                                          WidgetsBinding.instance.addPostFrameCallback((_) {
                                            setNotification.value = NotificationMessage(message: MessagesProvider.get("View Closed Orders"),color:theme.footerBG4);
                                          });
                                        }else{
                                          WidgetsBinding.instance.addPostFrameCallback((_) {
                                            setNotification.value = NotificationMessage(message: MessagesProvider.get("To Date should be greater than From Date"),color:theme.footerBG5);
                                          });
                                        }
                                      },
                                    )
                                ),
                                const SizedBox(height: 8.0,),
                                Expanded(
                                  child: Container(
                                    height: 200,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 26.0),
                                          child: OrderListHeader(),
                                        ),
                                        const SizedBox(height: 8.0,),
                                        Expanded(
                                          child:
                                          BlocBuilder<ClosedOrdersCubit, ClosedOrdersCubitState>(
                                              builder: (context, state) {
                                                return Scroller(
                                                controller:_orderScroll,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(right: 26.0),
                                                  child:  ListView.builder(
                                                    controller: _orderScroll,
                                                    shrinkWrap: true,
                                                    physics: const ScrollPhysics(),
                                                    itemCount: ordersGroup?.length ?? 0,
                                                    itemBuilder: (context, index) {

                                                      return OrderListItemWidget(
                                                        dateFormat: _dateFormat,
                                                        currentIndex: index,
                                                        orderGroup: ordersGroup[index],
                                                        actionMode: _actionMode,
                                                        onRetrieve: (value) async {
                                                          _selectedData = value;
                                                          if (_selectedData?.transactionId != -1) {
                                                            _retrieveTransaction();
                                                          }
                                                        },
                                                        onCheckChange:(int orderId ,bool isUncheck,int currentindex){
                                                          if(isUncheck){
                                                            print('isUnCheck');
                                                            ordersGroup[currentindex] = ordersGroup[currentindex].copyWith(isCheck:false);
                                                            context.read<ClosedOrdersCubit>().rebuild();

                                                          }else{
                                                            print('Check');
                                                            for( int i =0;i<ordersGroup.length;i++){
                                                              if(ordersGroup[i].isCheck == true){
                                                                return;
                                                              }
                                                            }
                                                            selectedOrdersForMove.clear();
                                                            for(int i =0;i<ordersGroup.length;i++){
                                                              for(int j =0;j<ordersGroup[i].orderList.length;j++){
                                                                OrdersData currentData =  ordersGroup[i].orderList[j]!;
                                                                ordersGroup[i].orderList[j] = currentData.copyWith(isSelected:false);
                                                              }
                                                            }
                                                            ordersGroup[currentindex] = ordersGroup[currentindex].copyWith(isCheck:true);
                                                            ordersGroup[currentindex].orderList.forEach((element) {
                                                              selectedOrdersForMove.add(element!);
                                                            });
                                                            TT.moveOperationFromAllOrdersScreen.value = 'OnlyMoveOrderToTable';
                                                            TT.orderIdFromAllOrdersScreen.value = selectedOrdersForMove[0].orderId.toString();
                                                            TT.transactionIdFromAllOrdersScreen.value = selectedOrdersForMove[0].transactionId.toString();
                                                            context.read<ClosedOrdersCubit>().rebuild();
                                                            log('move list ${selectedOrdersForMove.length.toString()} => ${selectedOrdersForMove.toString()}');
                                                          }
                                                        },
                                                        onSelect: (List<OrdersData> moveList,int currentOrderGroupItemIndex){
                                                          selectedOrdersForMove.clear();
                                                          selectedOrdersForMove.addAll(moveList);
                                                          List<OrdersData?> tempList;
                                                          tempList = ordersGroup[currentOrderGroupItemIndex].orderList;
                                                          for(int i =0;i<ordersGroup.length;i++){
                                                            for(int j =0;j<ordersGroup[i].orderList.length;j++){
                                                              OrdersData currentData =  ordersGroup[i].orderList[j]!;
                                                              ordersGroup[i].orderList[j] = currentData.copyWith(isSelected:false);
                                                            }
                                                          }
                                                          for(int i =0;i<moveList.length;i++){
                                                            for(int j =0;j<tempList.length;j++){
                                                              if(moveList[i].transactionId == tempList[j]!.transactionId){
                                                                tempList[j] = tempList[j]!.copyWith(isSelected:true);
                                                              }else{
                                                                tempList[j] = tempList[j]!.copyWith(isSelected:false);
                                                              }
                                                            }
                                                          }
                                                          ordersGroup[currentOrderGroupItemIndex].orderList = tempList;
                                                          TT.moveOperationFromAllOrdersScreen.value = 'OnlyMoveTransaction';
                                                          TT.orderIdFromAllOrdersScreen.value = selectedOrdersForMove[0].orderId.toString();
                                                          TT.transactionIdFromAllOrdersScreen.value = selectedOrdersForMove[0].transactionId.toString();
                                                          context.read<ClosedOrdersCubit>().rebuild();
                                                          log('move list ${selectedOrdersForMove.length.toString()} =>${selectedOrdersForMove.toString()}');
                                                        },);
                                                    },),

                                                  // ListView.builder(
                                                  //     controller: _orderScroll,
                                                  //     shrinkWrap: true,
                                                  //     physics: const ScrollPhysics(),
                                                  //     itemCount: _data?.length ?? 0,
                                                  //     itemBuilder: (BuildContext context,int index){
                                                  //       return OrderListItem(
                                                  //         dateFormat: _dateFormat,
                                                  //         actionMode: _actionMode,
                                                  //         selectedIndex: _selectedIndex,
                                                  //         checkedIndex: _checkedIndex,
                                                  //         index: index,
                                                  //         data: _data?[index],
                                                  //         onChange: (value){
                                                  //           setState(() {
                                                  //             _selectedIndex = value;
                                                  //             _selectedData = _data?[_selectedIndex];
                                                  //           });
                                                  //         },
                                                  //         onCheckChange :(value,checked){
                                                  //           setState(() {
                                                  //             _checkedIndex = value;
                                                  //             _selectedIndex = value;
                                                  //           });
                                                  //         },
                                                  //         onRetrieve: (value) async{
                                                  //           _selectedData = _data?[value];
                                                  //           if(_selectedData?.transactionId != -1){
                                                  //             _retrieveTransaction();
                                                  //           }
                                                  //         },
                                                  //       );
                                                  //     }),
                                                ),
                                              );
                                            }
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TablePagination(
                                  currentPage: _currentPage, totalPage: _totalPage, pageController: _pageController,
                                  currentPageController: _currentPageController,
                                  //isSelected: _selectedData != null ? true: false,
                                  onStart: (){
                                    _currentPage = 0;
                                    _currentPageController.text = (1).toString();
                                    FocusScope.of(context).requestFocus(FocusNode());
                                    _data = _openOrders[_currentPage];
                                    setState(() {

                                    });
                                  },
                                  onPrevious: (){
                                    if(_currentPage > 0){
                                      _currentPage--;
                                      _currentPageController.text = (_currentPage + 1).toString();
                                      if(_openOrders[_currentPage] == null){
                                        _search();
                                      }else{
                                        _data = _openOrders[_currentPage];
                                        setState(() {

                                        });
                                      }
                                    }
                                    FocusScope.of(context).requestFocus(FocusNode());
                                  },
                                  onNext: (){
                                    if((_currentPage+1) < _totalPage){
                                      _currentPage = _currentPage+1;
                                      _currentPageController.text = (_currentPage + 1).toString();
                                      if(_openOrders[_currentPage] == null){
                                        _search();
                                      }else{
                                        _data = _openOrders[_currentPage];
                                        setState(() {
                                        });
                                      }
                                    }
                                    FocusScope.of(context).requestFocus(FocusNode());
                                  },
                                  onEnd: (){
                                    _currentPage = _totalPage -1;
                                    _currentPageController.text = (_totalPage).toString();
                                    if(_openOrders[_currentPage] == null){
                                      _search();
                                    }else{
                                      _data = _openOrders[_currentPage];
                                      setState(() {

                                      });
                                    }
                                    FocusScope.of(context).requestFocus(FocusNode());
                                  },
                                  onGo: (){
                                    if(_pageSize != int.parse(_pageController.text)){
                                      _currentPage = 0;
                                      _openOrders.clear();
                                      _currentPageController.text = (1).toString();
                                      _search();
                                    }else{
                                      _currentPage = int.parse(_currentPageController.text) - 1;
                                      if(_openOrders[_currentPage] == null){
                                        _search();
                                      }else{
                                        _data = _openOrders[_currentPage];
                                        setState(() {

                                        });
                                      }
                                    }
                                    FocusScope.of(context).requestFocus(FocusNode());
                                  },),
                                Container(height: 1,color: theme.scrollDisabled,),
                                OrderActionMode(
                                  actionMode: _actionMode,
                                  onActionMode: (){
                                    if(_actionMode){
                                      for( int i =0;i<ordersGroup.length;i++){
                                        if(ordersGroup[i].isCheck == true){
                                          ordersGroup[i] = ordersGroup[i].copyWith(isCheck: false);
                                          return;
                                        }
                                      }
                                      selectedOrdersForMove.clear();
                                    }
                                    setState((){
                                      _actionMode = !_actionMode;
                                      _selectedIndex = -1;
                                      _checkedIndex = -1;
                                    });
                                  },
                                  onNewOrder: (){

                                  },
                                  onMove: (){
                                    setNotification.value = NotificationMessage(message: MessagesProvider.get("Operation is not allowed "),
                                        color: AppColors.notificationBGLightYellowColor);
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ).withLoader(theme,message: _loadingMessage, isLoading: _isLoading),
    );
  }

  void _setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }

  _retrieveTransaction() async{
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    _loadingMessage = MessagesProvider.get("Loading Transaction");
    _setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final orderSearchBL = await OrdersDataBuilder.build(executionContextDTO!);
    try{
      Log.printMethodStart('_retrieveTransaction()', 'Orders Screen','retrieve');
      var response = await orderSearchBL.getTransaction(
        currentPage: 0,
        pageSize: 1,
        trxNumber: "",
        trxId: _selectedData?.transactionId  ?? 0,
        orderNo: 0,
        posMachine:-1,
        status: null,
        otp: "",
        reference:"",
        customerName:"",
        fromDate: null,
        toDate: null,
        staff: null,
        ccNumber: 0 ,
      );
      Log.printMethodEnd('_retrieveTransaction()', 'Orders Screen','retrieve');

      if(response.exception == null) {
        Log.printMethodReturn('_retrieveTransaction()', 'Orders Screen','retrieve');
        _setLoadingStatus(false);
        //_data = response.data;
        print('SEARCH ITEMS - ${response.data?.length ?? 0}');
        var len = response.data?.length ?? 0;
        if(len > 0){
          TransactionsData? data = response.data?[0];
          String jsonData = jsonEncode(data);
          retrievedData.value = jsonData;
          print("retrived ${data?.transactionLineDTOList} ");
          print("lock status ${data?.lockStatus}");
          if(data?.lockStatus == "UNLOCKED") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SalesScreen(transactionRetrieveData: jsonData,),
              ),
            );
          }else{
            setNotification.value = NotificationMessage(message: sprintf(MessagesProvider.get("Transaction %s is locked by Semnox." ),[data?.transactionNumber]),color:theme.footerBG5);
          }
        }
      }

    }on DioError catch(error) {
      _setLoadingStatus(false);
      var errorString = error.response?.data['data'] as String?;
      Future.microtask(() => showErrorDialog(context, 'Error', errorString ?? ''));
    }
  }

  _search() async{
    _loadingMessage = MessagesProvider.get("Loading Closed Orders");
    _setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final orderSearchBL = await OrdersDataBuilder.build(executionContextDTO!);
    var masterDataBL = await MasterDataBuilder.build(executionContextDTO);

    _userContainer = await orderSearchBL.getUserContainer();
    _posMachineContainer = await  masterDataBL.getPosMachines();
    _transactionStatusContainer = await masterDataBL.getOrderStatus();
    _facilityTableContainer = await orderSearchBL.getFacilityTableContainer();

    var posMachines = await  masterDataBL.getPosMachines();
    var _posName = executionContextDTO.posMachineName!;

    _pageSize = int.parse(_pageController.text);
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
    var _posID = -1;
    if (posMachines != null) {
      for (int i = 0; i < posMachines.length; i++) {
        var item = posMachines[i];
        if(item.posName.toUpperCase() == _posName){
          _posID = item.posMachineId;
        }
      }
    }

    try{
      Log.printMethodStart('_search()', 'Orders Screen','closed');
      var response = await orderSearchBL.getOrdersData(
        currentPage: _currentPage,
        pageSize: _pageSize,
        tableId: _table?.tableId ?? 0,
        orderId: _orderIdNameController.text == "" ? 0 : int.parse(_orderIdNameController.text),
        posMachineId: _posMachine?.posMachineId ?? _posID,
        status: (_status?.orderStatus == null || _status?.orderStatus == "All") ? "CLOSED" : _status?.orderStatus,
        tentNumber: _tentNoNameController.text,
        guestContact: _contactNameController.text,
        customerName: _guestNameController.text,
        fromDate: fromDate,
        toDate: toDate,
        staff: _staff?.userId,
      );
      Log.printMethodEnd('_search()', 'Orders Screen','closed');

      if(response.exception == null) {
        Log.printMethodReturn('_search()', 'Orders Screen','closed');
        _setLoadingStatus(false);
        //_data = response.data;
        print('SEARCH ITEMS - ${response.data?.length ?? 0}');
      }
      _totalPage = orderSearchBL.getTotalOrderPages() ?? 1;
      _openOrders.addAll({_currentPage: response.data});
      List<OrdersData?>? data = List.from(_openOrders[_currentPage] ?? []);
      data.sort((a,b) => DateTime.parse((b?.orderDate ?? "0001-01-01T00:00:00")).compareTo(DateTime.parse((a?.orderDate ?? "0001-01-01T00:00:00"))));
      _data = data;
      final items = groupBy(data!,(OrdersData? item) => item?.orderId);
      ordersGroup.clear();
      items.forEach((key, value) { ordersGroup.add(OrdersGroup(orderId: key ?? -1,orderList: value,isCheck:false)); });
      if(_selectedIndex != -1) {
        _selectedData = _data?[_selectedIndex];
      }
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


  Future _getConfigurations(BuildContext context) async {
    var execContextBL = await ExecutionContextBuilder.build();
    var sysExecContext = execContextBL.getExecutionContext();
    var masterDataBl = await MasterDataBuilder.build(sysExecContext!);
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
  }
}