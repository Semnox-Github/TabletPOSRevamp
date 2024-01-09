import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_data/builder.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:orders_ui/Screens/AllTransactionScreen.dart';
import 'package:orders_ui/Screens/NewTableSeatLayoutScreen.dart';
import 'package:orders_ui/providers/SelectedFacilityProvider.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:orders_data/blocs/app_blocs.dart';
import 'package:orders_data/blocs/app_events.dart';
import 'package:orders_data/repos/repositories.dart';
import 'package:orders_ui/Screens/TableSeatLoayoutScreen.dart';
import 'package:orders_ui/utils/NotificationMessage.dart';
import 'package:orders_ui/widgets/OrdersAppbar.dart';
import 'package:orders_ui/PageItem.dart';
import 'package:orders_ui/utils/OrderPages.dart';
import 'package:themes_library/themes_library.dart';

ValueNotifier<NotificationMessage> setNotification = ValueNotifier(NotificationMessage());
ValueNotifier<String> retrievedData = ValueNotifier('');
ValueNotifier<int> changedIndex = ValueNotifier(0);
ValueNotifier<String> showSideBar = ValueNotifier('');
ValueNotifier<String> notificationBarStatus = ValueNotifier('');

class OrdersPage extends StatefulWidget{
  late _OrdersPageState _ordersPageState;

  Function(String data)? onTransactionRetrieve;
  int? selectedIndex;
  bool? isFacilityEmpty = false;

  OrdersPage({super.key, this.onTransactionRetrieve, this.selectedIndex,this.isFacilityEmpty }) {
    _ordersPageState = _OrdersPageState();
  }

  @override
  State<OrdersPage> createState() => _ordersPageState;

}

class _OrdersPageState extends State<OrdersPage> {
  late NotificationBar _notificationBar;
  List<Map<String,dynamic>> _pageList =  pageList;
  int _selectedIndex = 0;
  var _selectedPage;
  bool _startingPage = true;
  bool _tableView = true;
  bool _orderView = false;
  bool _transactionView = true;
  bool _showSidebar = true;
  var facilityIdList = [];
  final ScrollController _lhsScrollController = ScrollController();

  @override
  void initState()  {
    super.initState();
    if(widget.isFacilityEmpty == true){
      _pageList =  transactionLookupPageList;
      _selectedPage = AllTransactionScreen();
    }else {
      _selectedPage = const TableSeatLayoutWrapper();
    }
    notificationBarStatus.value = '';
    showSideBar.value = 'true';
    _notificationBar = NotificationBar(showHideSideBar: true,
      onSideBarStatusUpdate: (shouldShowSidebar) {
        _showHideSidebar();
      },);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
      //_notificationBar.showMessage('View all tables', Colors.lightBlue);
      setNotification.value = NotificationMessage(
          message: MessagesProvider.get("View All Tables"),
          color: theme.footerBG5);
      if (widget.selectedIndex != null) {
        setState(() {
          _tableView = false;
          _orderView = false;
          _transactionView = (widget.isFacilityEmpty == true) ? true : widget.selectedIndex == 8 ? true : false;
          _selectedIndex = widget.selectedIndex!;
          _selectedPage = _pageList[_selectedIndex]['page'];
        });
      }
      Future.delayed(Duration(seconds: 3), () {
        //setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
        // _notificationBar.showMessage('',
        //     Colors.white);
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: theme.backGroundColor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Row(
                    children: [
                      Visibility(
                        visible: _showSidebar,
                        child: Container(
                            //flex: 2,
                            width : SizeConfig.blockSizeHorizontal * 18.5,
                            child: Container(
                              color: Colors.black,
                              child: Column(
                                children: [
                                  OrdersAppbar(title : MessagesProvider.get("orders").toUpperCase(),
                                  onPressed: (){
                                    context.read<SelectedFacility>().updateFacility(null);
                                    Navigator.pop(context);
                                  },),
                                  ValueListenableBuilder(
                                    valueListenable: changedIndex,
                                    builder: (BuildContext context, value, Widget? child) {
                                      WidgetsBinding.instance.addPostFrameCallback((_) {
                                        //print("selected value $value");
                                        if(_startingPage && value != 0){
                                          setState((){
                                            _orderView = true;
                                            _selectedIndex = value;
                                            _selectedPage = _pageList[_selectedIndex]['page'];
                                            _startingPage = false;
                                          });
                                        }
                                      });
                                      return  Expanded(
                                        child: RawScrollbar(
                                          controller: _lhsScrollController,
                                          thumbVisibility: true,
                                          trackVisibility: true,
                                          thickness: 10,
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 8.0),
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                controller: _lhsScrollController,
                                                physics: const ScrollPhysics(),
                                                itemCount: _pageList.length,
                                                itemBuilder: (BuildContext context, int index) {
                                                  return  PageItem(index: index,selectedIndex: _selectedIndex,
                                                    tableView: _tableView,
                                                    orderView: _orderView,
                                                    transactionView: _transactionView,
                                                    pageLists: _pageList[index],
                                                    onTap: (value1,value2,value3){
                                                      setState(() {
                                                        _tableView = value1;
                                                        _orderView = value2;
                                                        _transactionView = value3;
                                                      });
                                                      print("Selected Page Index : $_orderView "+_selectedIndex.toString());},
                                                    onChange: (value){
                                                      setState((){
                                                        _selectedIndex = value;
                                                        _selectedPage = _pageList[_selectedIndex]['page'];
                                                      });
                                                    },);
                                                }),
                                          ),
                                        ),
                                      );
                                    }
                                    ,
                                  ),
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(width: 8.0,),
                      ValueListenableBuilder(
                        valueListenable: retrievedData,
                        builder: (BuildContext context, value, Widget? child) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            //print("retrive data $value");
                            //widget.onTransactionRetrieve!(value);
                          });
                          return
                            Expanded(
                                flex: 8,
                                child: _selectedPage);
                        },
                      ),
                     // const SizedBox(width: 8.0,),
                    ],
                  )),
              ValueListenableBuilder(
                  valueListenable: setNotification,
                  builder: (BuildContext context, value, Widget? child){
                    //print("::::: "+notificationBarStatus.value.toString()+" :::::");
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if(value.message != null || value.message == ''){
                        _notificationBar.showMessage(value.message.toString(), value.color ?? Colors.white);
                      }
                    });
                    return Container(
                      color: Colors.green,
                      child: _notificationBar,
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showHideSidebar(){
    setState(() {
      _showSidebar = !_showSidebar;
      if(showSideBar.value == 'true'){
        showSideBar.value = 'false';
      }else{
        showSideBar.value = 'true';
      }
    });
  }


  @override
  void dispose() {
    changedIndex.value = 0;
    super.dispose();
  }

}