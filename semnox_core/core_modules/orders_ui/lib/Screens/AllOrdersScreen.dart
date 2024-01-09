import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/order_status_container/order_status_container_dto.dart';
import 'package:master_data/models/pos_machines_container/pos_machine_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:orders_data/builder.dart';
import 'package:orders_data/models/facility_table_container/facility_table_container_dto.dart';
import 'package:orders_data/models/orders_data/orders_data.dart';
import 'package:orders_data/models/orders_data_response/orders_data_response.dart';
import 'package:orders_data/models/transactions/transaction_data.dart';
import 'package:orders_data/models/user_container/user_container_dto.dart';
import 'package:orders_ui/OrdersPage.dart';
import 'package:orders_ui/Screens/TableSeatLoayoutScreenMove.dart';
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
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';
import '../cubit/all_orders_cubit.dart';
import '../cubit/all_orders_cubit_state.dart';
import 'TableSeatLoayoutScreen.dart' as TT;
import 'TableSeatLoayoutScreen.dart';
import 'package:collection/collection.dart';

ValueNotifier<String> isAllOrdersScreenOpened = ValueNotifier('');
POSMachineContainerDTO? posMachine;
OrderStatusContainerDTO? status;
UserContainerDTO? staff;
FacilityTableContainerDTO? table;

class AllOrdersScreen extends StatefulWidget {
  int? tableId;
  String? operation;
  bool? isGenericTable;
  bool? isOccupiedTableFromTableSeat;
  Function? refreshTableSeat;
  AllOrdersScreen({super.key, this.tableId,this.operation,this.isGenericTable,this.isOccupiedTableFromTableSeat,this.refreshTableSeat});

  @override
  State<AllOrdersScreen> createState() => _AllOrdersScreenState();
}

class _AllOrdersScreenState extends State<AllOrdersScreen> {
  bool _showFilters = false;
  final ScrollController _pageScroll = ScrollController();
  final ScrollController _orderScroll = ScrollController();
  final ScrollController _orderScrollNew = ScrollController();
  final _pageController = TextEditingController();
  final _currentPageController = TextEditingController();
  final _guestNameController = TextEditingController();
  final _contactNameController = TextEditingController();
  final _tentNoNameController = TextEditingController();
  final _orderIdNameController = TextEditingController();
  final _fromDateController = TextEditingController();
  final _toDateController = TextEditingController();
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
  List<int> _selectedItems = [];

  List<UserContainerDTO>? _userContainer;
  List<POSMachineContainerDTO>? _posMachineContainer;
  List<OrderStatusContainerDTO>? _transactionStatusContainer;
  List<FacilityTableContainerDTO>? _facilityTableContainer;
  String? _posMachineName;


  List<OrdersData?>? _data = [];
  OrdersData? _selectedData;
  final Map<int, List<OrdersData?>?> _freeTables = HashMap();
  String? _dateFormat;
  final ordersGroup = <OrdersGroup>[];
  List<OrdersData> selectedOrdersForMove = [];
  @override
  void initState() {
    super.initState();
    print('is occupied=>${widget.isOccupiedTableFromTableSeat}');
    isAllOrdersScreenOpened.value = 'YES';
    _getConfigurations(context);
    _pageController.text = _pageSize.toString();
    _currentPageController.text = (_currentPage + 1).toString();
    String formattedDate1 = DateFormat("dd-MMM-yyyy hh:mm:ss a").format(DateTime.now());
    String formattedDate2 = DateFormat("dd-MMM-yyyy hh:mm:ss a")
        .format(DateTime.now().add(const Duration(days: 1)));
    _fromDateController.text = formattedDate1;
    _toDateController.text = formattedDate2;
    _search();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
      setNotification.value = NotificationMessage(
          message: MessagesProvider.get("View All Orders"),
          color: theme.footerBG4);
    });
    setState(() {
      if(widget.operation == 'MOVE'){
        _actionMode = true;
      }else{
        widget.operation = 'NULL';
        _actionMode = false;
      }
    });
    print("widget.operation :: "+widget.operation.toString());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    isAllOrdersScreenOpened.value = 'POPPED';
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return BlocProvider(
         create: (context) => AllOrdersCubit(),
            child: WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: theme.backGroundColor,
        resizeToAvoidBottomInset: false,
        body: Container(
          color: theme.backGroundColor,
          child: Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraint) {
                    return Container(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: SingleChildScrollView(
                        controller: _pageScroll,
                        child: ConstrainedBox(
                          constraints:
                          BoxConstraints(minHeight: constraint.maxHeight),
                          child: IntrinsicHeight(
                            child: Column(
                              children: [
                                Topbar(
                                  onPress: () {
                                    setState(() {
                                      _showFilters = !_showFilters;
                                    });
                                  },
                                  up: _showFilters,
                                ),
                                // const SizedBox(
                                //   height: 12.0,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Visibility(
                                      visible: _showFilters,
                                      child: OrderFilters(
                                        pageName: "all",
                                        tableId: widget.tableId,
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
                                        posMachineName: _posMachineName,
                                        selectedStatus: widget.isOccupiedTableFromTableSeat == true ? "ORDERED" : null ,
                                        onStaffChange: (value) {
                                          staff = value;
                                        },
                                        onStatusChange: (value) {
                                          status = value;
                                        },
                                        onPosMachineChange: (value) {
                                          posMachine = value;
                                        },
                                        onTableChange: (value) {
                                          table = value;
                                        },
                                        onClear: () {
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
                                        onSearch: () {
                                          if (_isDateGreater(_toDateController.text,
                                              _fromDateController.text)) {
                                            _search();
                                            WidgetsBinding.instance
                                                .addPostFrameCallback((_) {
                                              setNotification.value =
                                                  NotificationMessage(
                                                      message: MessagesProvider.get("View All Orders"),
                                                      color: theme.footerBG4);
                                            });
                                          } else {
                                            WidgetsBinding.instance
                                                .addPostFrameCallback((_) {
                                              setNotification.value = NotificationMessage(
                                                  message: MessagesProvider.get("To Date should be greater than From Date"),
                                                  color: theme.footerBG5);
                                            });
                                          }
                                        },
                                      )),
                                ),
                                SizeConfig.isBigDevice() ? const SizedBox(height: 8.0,) : const SizedBox() ,
                                Expanded(
                                  child: SizedBox(
                                    height: 200,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 26.0),
                                          child: OrderListHeader(),
                                        ),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        _selectedItems.isEmpty ? Container() :
                                        Expanded(
                                          flex: _selectedItems.length == 1 ? -1 : 1,
                                          child: Scroller(
                                            controller: _orderScrollNew,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.only(right: 26.0),
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 3,right: 3),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: theme.secondaryColor!),
                                                  ),
                                                  child: ListView.builder(
                                                      controller: _orderScrollNew,
                                                      shrinkWrap: true,
                                                      physics: const ScrollPhysics(),
                                                      itemCount: _data?.length ?? 0,
                                                      itemBuilder: (BuildContext context,
                                                          int index) {
                                                        if(_selectedItems.contains(_data?[index]!.orderId)){
                                                          return OrderListItem(
                                                            dateFormat: _dateFormat,
                                                            actionMode: _actionMode,
                                                            selectedIndex: _selectedIndex,
                                                            checkedIndex: _checkedIndex,
                                                            index: index,
                                                            data: _data?[index],
                                                            dataNext: _data?[index] == _data?.first ? null : _data?[index-1],
                                                            selectedOrderIds: _selectedItems,
                                                            onChange: (value) {
                                                              print("Hello inside OnChange value : "+value.toString());
                                                              setState(() {
                                                                TT.moveOperationFromAllOrdersScreen.value = 'OnlyMoveTransaction';
                                                                TT.orderIdFromAllOrdersScreen.value = '${_data?[index]?.orderId.toString()}';
                                                                TT.transactionIdFromAllOrdersScreen.value = '${_data?[index]?.transactionId.toString()}';
                                                              });
                                                              print("moveOperationFromAllOrdersScreen : "+TT.moveOperationFromAllOrdersScreen.value.toString());
                                                              print("orderIdFromAllOrdersScreen : "+TT.orderIdFromAllOrdersScreen.value.toString());
                                                              print("transactionIdFromAllOrdersScreen : "+TT.transactionIdFromAllOrdersScreen.value.toString());
                                                              setState(() {
                                                                _selectedIndex = value;
                                                                _selectedData =
                                                                _data?[_selectedIndex];
                                                              });
                                                            },
                                                            onCheckChange: (value, checked) {
                                                              print("Hello inside OnCheckChange value : "+value.toString());
                                                              print("checked : "+checked.toString());
                                                              print(_data?[index]?.orderId.toString());
                                                              TT.moveOperationFromAllOrdersScreen.value = 'OnlyMoveTransaction';
                                                              TT.orderIdFromAllOrdersScreen.value = '${_data?[index]?.orderId.toString()}';
                                                              if(_checkedIndex == 0){
                                                                setState(() {
                                                                  TT.moveOperationFromAllOrdersScreen.value = 'OnlyMoveTransaction';
                                                                  TT.orderIdFromAllOrdersScreen.value = '${_data?[index]?.orderId.toString()}';
                                                                  TT.transactionIdFromAllOrdersScreen.value = '${_data?[index]?.transactionId.toString()}';
                                                                });
                                                                print("moveOperationFromAllOrdersScreen : "+TT.moveOperationFromAllOrdersScreen.value.toString());
                                                                print("orderIdFromAllOrdersScreen : "+TT.orderIdFromAllOrdersScreen.value.toString());
                                                                print("transactionIdFromAllOrdersScreen : "+TT.transactionIdFromAllOrdersScreen.value.toString());
                                                              }else{
                                                                setState(() {
                                                                  TT.moveOperationFromAllOrdersScreen.value = 'OnlyMoveOrderToTable';
                                                                  TT.orderIdFromAllOrdersScreen.value = '${_data?[index]?.orderId.toString()}';
                                                                  TT.transactionIdFromAllOrdersScreen.value = '${_data?[index]?.transactionId.toString()}';
                                                                });
                                                                print("moveOperationFromAllOrdersScreen : "+TT.moveOperationFromAllOrdersScreen.value.toString());
                                                                print("orderIdFromAllOrdersScreen : "+TT.orderIdFromAllOrdersScreen.value.toString());
                                                                print("transactionIdFromAllOrdersScreen : "+TT.transactionIdFromAllOrdersScreen.value.toString());
                                                              }
                                                              if(checked == true){
                                                                setState(() {
                                                                  TT.moveOperationFromAllOrdersScreen.value = 'OnlyMoveOrderToTable';
                                                                  TT.orderIdFromAllOrdersScreen.value = '${_data?[index]?.orderId.toString()}';
                                                                  TT.transactionIdFromAllOrdersScreen.value = '${_data?[index]?.transactionId.toString()}';
                                                                  if (_data != null) {
                                                                    _selectedItems.clear();
                                                                    _selectedItems.addAll(_data!.where((element) => element != null && element.orderId.toString() == TT.orderIdFromAllOrdersScreen.value).map((e) => e!.orderId));
                                                                  }
                                                                });
                                                              }else{
                                                                setState(() {
                                                                  _selectedItems.clear();
                                                                  TT.moveOperationFromAllOrdersScreen.value = 'OnlyMoveTransaction';
                                                                  TT.orderIdFromAllOrdersScreen.value = '${_data?[index]?.orderId.toString()}';
                                                                  TT.transactionIdFromAllOrdersScreen.value = '${_data?[index]?.transactionId.toString()}';
                                                                });
                                                              }
                                                              setState(() {
                                                                _checkedIndex = value;
                                                                _selectedIndex = value;
                                                                // _selectedItems.addAll(_data?.where((element) => element?.orderId.toString() ==
                                                                //     TT.moveOperationFromAllOrdersScreen.value).toList()??[]);
                                                              });
                                                              print(TT.moveOperationFromAllOrdersScreen.value);
                                                              print(_selectedItems);
                                                            },
                                                            onRetrieve: (value) async {
                                                              _selectedData = _data?[value];
                                                              if (_selectedData
                                                                  ?.transactionId !=
                                                                  -1) {
                                                                _retrieveTransaction();
                                                              }
                                                            },
                                                          );
                                                        }else{
                                                          return Container();
                                                        }
                                                      }),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        BlocBuilder<AllOrdersCubit, AllOrdersCubitState>(
                                          builder: (context, state) {
                                            return Expanded(
                                        child: Scroller(
                                          controller: _orderScroll,
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.only(right: 26.0),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 3,right: 3),
                                              child: ListView.builder(
                                                  controller: _orderScroll,
                                                  shrinkWrap: true,
                                                  physics: const ScrollPhysics(),
                                                  itemCount: ordersGroup.length ?? 0,
                                                  itemBuilder: (BuildContext context,
                                                      int index) {
                                                    if(_selectedItems.contains(ordersGroup?[index]!.orderId)){
                                                      return Container();
                                                    }else{
                                                           return OrderListItemWidget(
                                                             dateFormat: _dateFormat,
                                                             actionMode: _actionMode,
                                                             orderGroup: ordersGroup[index],
                                                             currentIndex: index,
                                                            onRetrieve:(value) async {
                                                              _selectedData = value;
                                                              if (_selectedData?.transactionId != -1) {
                                                                _retrieveTransaction();
                                                              }
                                                            },
                                                            onCheckChange: (int orderId ,bool isUncheck,int currentindex){
                                                            if(isUncheck){
                                                              print('isUnCheck');
                                                              ordersGroup[currentindex] = ordersGroup[currentindex].copyWith(isCheck:false);
                                                              context.read<AllOrdersCubit>().rebuild();

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
                                                                context.read<AllOrdersCubit>().rebuild();
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
                                                              context.read<AllOrdersCubit>().rebuild();
                                                              log('move list ${selectedOrdersForMove.length.toString()} =>${selectedOrdersForMove.toString()}');
                                                            },
                                                          );
                                                    }
                                                  }),
                                            ),
                                          ),
                                        ),
                                          );
                                                 },
                                                ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              TablePagination(
                currentPage: _currentPage, totalPage: _totalPage,
                pageController: _pageController,
                currentPageController: _currentPageController,
                //isSelected: _selectedData != null ? true: false,
                onStart: () {
                  _currentPage = 0;
                  _currentPageController.text = (1).toString();
                  FocusScope.of(context).requestFocus(FocusNode());
                  _data = _freeTables[_currentPage];
                  setState(() {});
                },
                onPrevious: () {
                  if (_currentPage > 0) {
                    _currentPage--;
                    _currentPageController.text =
                        (_currentPage + 1).toString();
                    if (_freeTables[_currentPage] == null) {
                      _search();
                    } else {
                      _data = _freeTables[_currentPage];
                      setState(() {});
                    }
                  }
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                onNext: () {
                  if ((_currentPage + 1) < _totalPage) {
                    _currentPage = _currentPage + 1;
                    _currentPageController.text =
                        (_currentPage + 1).toString();
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
                  _currentPageController.text =
                      (_totalPage).toString();
                  if (_freeTables[_currentPage] == null) {
                    _search();
                  } else {
                    _data = _freeTables[_currentPage];
                    setState(() {});
                  }
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                onGo: () {
                  if (_pageSize !=
                      int.parse(_pageController.text)) {
                    _currentPage = 0;
                    _freeTables.clear();
                    _currentPageController.text = (1).toString();
                    _search();
                  } else {
                    _currentPage =
                        int.parse(_currentPageController.text) - 1;
                    if (_freeTables[_currentPage] == null) {
                      _search();
                    } else {
                      _data = _freeTables[_currentPage];
                      setState(() {});
                    }
                  }
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
              Container(
                height: 1,
                color: theme.scrollDisabled,
              ),
              OrderActionMode(
                actionMode: widget.operation == 'MOVE' ? true : _actionMode,
                isEnableNewOrderButton: widget.isGenericTable != null ? true : false,
                onActionMode: () {
                 if(_actionMode){
                   for( int i =0;i<ordersGroup.length;i++){
                     if(ordersGroup[i].isCheck == true){
                       ordersGroup[i] = ordersGroup[i].copyWith(isCheck: false);
                       return;
                     }
                   }
                   selectedOrdersForMove.clear();
                 }
                  setState(() {
                    _actionMode = !_actionMode;
                    _selectedIndex = -1;
                    _checkedIndex = -1;
                  });
                },
                onNewOrder: () {
                  if(widget.isGenericTable != null && widget.isGenericTable == true){
                    showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return TransactionOrderDetailsDialog(
                              tableId: int.parse(selectedOuterTableId.value.toString()),
                              isUpdate: false,
                              showNotification: (String value, Color color) {},
                              onComplete: () {
                                Navigator.of(context).pop();
                                navigateToSalesScreen();
                              },
                              onCancel: (){},
                            );

                      },
                    );
                  }
                },
                onMove: () async {
                  if(widget.operation == 'MOVE'){
                    Navigator.pop(context);
                  }else{
                    print("ID : "+selectedOuterTableId.value);
                    showDialog(
                      context: context,
                      builder: (BuildContext contextNew) {
                        return StatefulBuilder(
                          builder: (contextNew, setState) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 60,left: 10,right: 10,top: 10),
                                child: TableSeatLayoutMove(),
                              ),
                            );
                          },
                        );
                      },
                    ).whenComplete((){
                      _search();
                    });
                  }
                },
                onCancel: widget.tableId != null
                    ? () {
                  setState((){
                    selectedOuterTableId.value = '';
                    pressedRowOuterValue.value = '';
                    pressedColumnOuterValue.value = '';
                  });
                  TT.orderIdFromAllOrdersScreen.value = '';
                  Navigator.pop(context);
                }
                    : null,
              )
            ],
          ).withLoader(theme,message: _loadingMessage, isLoading: _isLoading),
        ),
      ),
    ),
          );
  

  }

  void _setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }

  void navigateToSalesScreen(){

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext ctx) => SalesScreen()));
  }

  _retrieveTransaction() async {
    _loadingMessage = MessagesProvider.get("Loading Transaction");
    _setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final orderSearchBL = await OrdersDataBuilder.build(executionContextDTO!);
    try {
      Log.printMethodStart('_retrieveTransaction()', 'Orders Screen','retrieve');
      var response = await orderSearchBL.getTransaction(
        currentPage: 0,
        pageSize: 1,
        trxNumber: "",
        trxId: _selectedData?.transactionId ?? 0,
        orderNo: 0,
        posMachine: -1,
        status: null,
        otp: "",
        reference: "",
        customerName: "",
        fromDate: null,
        toDate: null,
        staff: null,
        ccNumber: 0,
      );
      Log.printMethodEnd('_retrieveTransaction()', 'Orders Screen','retrieve');

      if (response.exception == null) {
        Log.printMethodReturn('_retrieveTransaction() - done!', 'Orders Screen','retrieve');
        _setLoadingStatus(false);
        //_data = response.data;
        print('SEARCH ITEMS - ${response.data?.length ?? 0}');
        var len = response.data?.length ?? 0;
        if (len > 0) {
          TransactionsData? data = response.data?[0];
          String jsonData = jsonEncode(data);
          retrievedData.value = jsonData;
          print("retrived ${data?.transactionLineDTOList}");
          if(TT.isTablesScreenOpened.value == 'YES'){
            print('before nav to sales =>${TT.isTablesScreenOpened.value}');
            Navigator.pop(context);
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SalesScreen(
                transactionRetrieveData: jsonData,
              ),
            ),
          ).then((value) {
            if(widget.refreshTableSeat != null){
              widget.refreshTableSeat!();
            }
          }
          );
        }
      }
    } on DioError catch (error) {
      _setLoadingStatus(false);
      var errorString = error.response?.data['data'] as String?;
      Future.microtask(
              () => showErrorDialog(context, 'Error', errorString ?? ''));
    }
  }

  _search() async {
    setState(() {
      _selectedIndex = -1;
    });
    _loadingMessage = MessagesProvider.get("Loading All Orders");
    _setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final orderSearchBL = await OrdersDataBuilder.build(executionContextDTO!);
    var masterDataBL = await MasterDataBuilder.build(executionContextDTO);

    _userContainer = await orderSearchBL.getUserContainer();
    _posMachineContainer = await masterDataBL.getPosMachines();
    _transactionStatusContainer = await masterDataBL.getOrderStatus();
    _facilityTableContainer = await orderSearchBL.getFacilityTableContainer();

    var posMachines = await masterDataBL.getPosMachines();
    _posMachineName = executionContextDTO.posMachineName!;
    _pageSize = int.parse(_pageController.text);
    String fromDate = "";
    if (_fromDateController.text != "") {
      DateFormat dateFormat = DateFormat(_dateFormat);
      var from = dateFormat.parse(_fromDateController.text);
      fromDate = DateFormat('yyyy-MM-dd T hh:mm:ss').format(from);
      print("parseDate $fromDate");
    }
    String toDate = "";
    if (_toDateController.text != "") {
      DateFormat dateFormat = DateFormat(_dateFormat);
      var from = dateFormat.parse(_toDateController.text);
      toDate = DateFormat('yyyy-MM-dd T hh:mm:ss').format(from);
    }

    var posID = -1;
    if (posMachines != null) {
      for (int i = 0; i < posMachines.length; i++) {
        var item = posMachines[i];
        if (item.posName.toUpperCase() == _posMachineName) {
          posID = item.posMachineId;
        }
      }
    }

    try {
      print('Table ID: ${widget.tableId}');
      Log.printMethodStart('_search()', 'Orders Screen','all');
      OrdersDataResponse response;
      if(widget.operation == 'MOVE'){
        print('MOVE');
        response =  await orderSearchBL.getOrderHeadView(queries: {
          'orderId':-1,
          'orderStatus':"ORDERED",
          'tableId': widget.tableId ?? -1,
          'posMachineId':-1,
          'userId':-1,
          'fromDateTime':fromDate,
          'toDateTime':toDate,
          'pageNumber':0,
          'pageSize':50,
          'siteId':-1,
          'sortByField':'ORDER_ID',
           'sortOrder':'DESC'
        });
      } else if(widget.isOccupiedTableFromTableSeat == true){
        print("isOccupiedTableFromTableSeat");
        String? orderStatus = 'ORDERED';
        if(_showFilters == true){
          status?.orderStatus == "All" ? orderStatus = "" : orderStatus = status?.orderStatus;
        }
        response =  await orderSearchBL.getOrderHeadView(queries: {
          'orderId':-1,
          'orderStatus':orderStatus,
          'tableId': widget.tableId ?? -1,
          'posMachineId':-1,
          'userId':-1,
          'fromDateTime':fromDate,
          'toDateTime':toDate,
          'pageNumber':0,
          'pageSize':50,
          'siteId':-1,
          'sortByField':'ORDER_ID',
          'sortOrder':'DESC'
        });
      }else{
        print('else');
        response = await orderSearchBL.getOrdersData(
          currentPage: _currentPage,
          pageSize: _pageSize,
          tableId: (widget.tableId == null)
              ? (table?.tableId ?? 0)
              : (widget.tableId ?? -1),
          orderId:(widget.isGenericTable != null) ? -1 : _orderIdNameController.text == ""
              ? 0
              : int.parse(_orderIdNameController.text),
          posMachineId:(widget.isGenericTable != null || widget.isOccupiedTableFromTableSeat != null)  ? -1 : posMachine?.posMachineId ?? posID,
          status: (widget.isGenericTable != null || widget.isOccupiedTableFromTableSeat != null)  ? null : (status?.orderStatus == null ||
              status?.orderStatus == "All")
              ? "INITIATED,ORDERED,CLOSED"
              : status?.orderStatus,
          orderStatus: (widget.isGenericTable != null)? "ORDERED" : null ,
          tentNumber: _tentNoNameController.text,
          guestContact: _contactNameController.text,
          customerName: _guestNameController.text,
          fromDate: fromDate,
          toDate: toDate,
          staff:(widget.isGenericTable != null) ? -1 : staff?.userId,
        );
      }

      Log.printMethodEnd('_search()', 'Orders Screen','all');

      if (response.exception == null) {
        Log.printMethodReturn('_search()- done', 'Orders Screen','all');
        _setLoadingStatus(false);
        //_data = response.data;
        print('SEARCH ITEMS - ${response.data?.length ?? 0}');
      }
      _totalPage = orderSearchBL.getTotalOrderPages() ?? 1;
      _freeTables.addAll({_currentPage: response.data});
      //_data = _freeTables[_currentPage];
      List<OrdersData?>? data = List.from(_freeTables[_currentPage] ?? []);
      data.sort((a,b) => DateTime.parse((b?.orderDate ?? "0001-01-01T00:00:00")).compareTo(DateTime.parse((a?.orderDate ?? "0001-01-01T00:00:00"))));
      _data = data;
      final items = groupBy(data!,(OrdersData? item) => item?.orderId);
      ordersGroup.clear();
      items.forEach((key, value) { ordersGroup.add(OrdersGroup(orderId: key ?? -1,orderList: value,isCheck:false)); });
      if(response.data?.length == 1){
        setState(() {
          TT.moveOperationFromAllOrdersScreen.value = 'OnlyMoveOrderToTable';
          TT.orderIdFromAllOrdersScreen.value = '${data.first!.orderId.toString()}';
          TT.transactionIdFromAllOrdersScreen.value = '${data.first!.transactionId.toString()}';
        });
        if(widget.operation == 'MOVE'){
         // Navigator.of(context).pop();
          // showDialog(
          //   context: context,
          //   builder: (BuildContext contextNew) {
          //     return StatefulBuilder(
          //       builder: (contextNew, setState) {
          //         return Center(
          //           child: Padding(
          //             padding: const EdgeInsets.only(bottom: 60,left: 10,right: 10,top: 10),
          //             child: TableSeatLayoutMove(),
          //           ),
          //         );
          //       },
          //     );
          //   },
          // );
        }else{

        }
      }else{

      }
      if (_selectedIndex != -1) {
        _selectedData = _data?[_selectedIndex];
      }
      setState(() {});
    } on DioError catch (error) {
      _setLoadingStatus(false);
      var errorString = error.response?.data['data'] as String?;
      Future.microtask(
              () => showErrorDialog(context, 'Error', errorString ?? ''));
    }

    // setState(() {
    //   _showFilters = false;
    // });
  }

  filterOrderStatus(){

  }

  bool _isDateGreater(String date1, String date2) {
    DateTime dt1 = DateFormat(_dateFormat).parse(date1); //from
    DateTime dt2 = DateFormat(_dateFormat).parse(date2);
    return dt1.compareTo(dt2) > 0 ? true : false;
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

class OrdersGroup {
  int orderId;
  List<OrdersData?> orderList;
  bool isCheck ;
  OrdersGroup({required this.orderId,required this.orderList, this.isCheck = false});

  OrdersGroup copyWith(
      {
        int? orderId,
        List<OrdersData?>? orderList,
        bool? isCheck,
      }) {
    return OrdersGroup(
      orderId : orderId ?? this.orderId,
      orderList : orderList ?? this.orderList,
      isCheck: isCheck ?? this.isCheck,
    );
  }

}