import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:orders_ui/OrdersPage.dart';
import 'package:orders_ui/PageItem.dart';
import 'package:orders_ui/Screens/AllTransactionScreen.dart';
import 'package:orders_ui/Screens/ClosedTransactionScreen.dart';
import 'package:orders_ui/Screens/OnHoldTransactionsScreen.dart';
import 'package:orders_ui/Screens/OpenTransactionScreen.dart';
import 'package:orders_ui/utils/AppColors.dart';
import 'package:orders_ui/utils/NotificationMessage.dart';
import 'package:orders_ui/widgets/OrdersAppbar.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';

class TransactionLookup extends StatefulWidget{

  @override
  State<TransactionLookup> createState() => _TransactionLookupState();
}

class _TransactionLookupState extends State<TransactionLookup> {
  late NotificationBar _notificationBar;
  final ScrollController _lhsScrollController = ScrollController();
  bool _transactionView = true;
  bool _showSidebar = true;
  final List<Map<String,dynamic>> _pageList = [
    {
      "key": MessagesProvider.get("Transactions"),
      "value":MessagesProvider.get("All"),
      "visible": true,
      "page" : AllTransactionScreen()
    },
    {
      "key": MessagesProvider.get("Transactions"),
      "value":MessagesProvider.get("Open"),
      "visible": false,
      "page" : OpenTransactionScreen()
    },
    {
      "key": MessagesProvider.get("Transactions"),
      "value":MessagesProvider.get("Closed"),
      "visible": false,
      "page" : ClosedTransactionScreen()
    },
    {
      "key": MessagesProvider.get("Transactions"),
      "value":MessagesProvider.get("Onhold"),
      "visible": false,
      "page" : OnHoldTransactions()
    },
  ];

  int _selectedIndex = 0;
  var _selectedPage;

  @override
  void initState() {
    super.initState();
    _selectedPage =  AllTransactionScreen();
    _notificationBar = NotificationBar(showHideSideBar: true,
      onSideBarStatusUpdate: (shouldShowSidebar) {
        _showHideSidebar();
      },);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setNotification.value = NotificationMessage(message:MessagesProvider.get("View &1 transactions ",['All']),color:AppColors.selectedNotificationColor);
      Future.delayed(Duration(seconds: 3),(){
        _notificationBar.showMessage('', Theme.of(context).extension<SemnoxTheme>()?.footerBG2 ?? Colors.white);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: theme.backGroundColor,
        body: Column(
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
                                OrdersAppbar(title : MessagesProvider.get("Transaction\nLoookup"),
                                onPressed: (){
                                  Navigator.pop(context);
                                },),
                                Expanded(
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
                                              transactionView: _transactionView,
                                              pageLists: _pageList[index],
                                              onTap: (value1,value2,value3){
                                                setState(() {
                                                  _transactionView = value3;
                                                });
                                                print("Selected Page Index :  "+_selectedIndex.toString());},
                                              onChange: (value){
                                                setState((){
                                                  _selectedIndex = value;
                                                  _selectedPage = _pageList[_selectedIndex]['page'];
                                                });
                                              },);
                                          }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                    const SizedBox(width: 8.0,),
                    Expanded(
                        flex: 8,
                        child: _selectedPage),
                    const SizedBox(width: 8.0,),
                  ],
                )),
            ValueListenableBuilder(
                valueListenable: setNotification,
                builder: (BuildContext context, value, Widget? child){
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
    );
  }

  _showHideSidebar(){
    setState(() {
      _showSidebar = !_showSidebar;
    });
  }
}