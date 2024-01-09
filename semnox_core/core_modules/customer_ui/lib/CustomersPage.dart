import 'dart:async';

import 'package:customer_data/models/customer_data.dart';
import 'package:customer_ui/screens/customer_details/CustomerMembership.dart';
import 'package:customer_ui/screens/customer_details/CustomerRelationship.dart';
import 'package:customer_ui/CustomerWaiver.dart';
import 'package:customer_ui/ErrorDialog.dart';
import 'package:customer_ui/providers/SelectedCardDetailsProvider.dart';
import 'package:customer_ui/providers/SelectedCustomerProvider.dart';
import 'package:customer_ui/screens/registration/NewCustomerScreen.dart';
import 'package:customer_ui/utils/size_config.dart';
import 'package:customer_ui/widgets/CustomerAppBar.dart';
import 'package:customer_ui/widgets/CustomerDetailPageListItem.dart';
import 'package:customer_ui/widgets/registration/TopBar.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:membership_data/builder.dart';
import 'package:membership_data/models/membership_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:orders_ui/OrdersPage.dart';
import 'package:provider/provider.dart';
import 'package:themes_library/themes_library.dart';

import 'screens/customer_details/CustomerAccounts.dart';
import 'screens/customer_details/CustomerProfile.dart';

class CustomersPage extends StatefulWidget {
  final bool? isFromSearch;
  final Function(String?)? selectIndex;
  String? fromPage;
  VoidCallback? onBack;
  final Function(CustomerData?)? onNewCustomerCreated;
  final Function()? onCancelTapped;
  final bool isShowHeader;

  CustomersPage(
      {super.key,
        this.selectIndex,
        this.fromPage,
        this.isFromSearch,
        this.onBack ,
        this.onNewCustomerCreated,
        this.onCancelTapped,
        required this.isShowHeader});
  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  List<String> pageList = [
    MessagesProvider.get("New"),
  ];
  late List lt;
  int _selectedIndex = 0;
  CustomerData? data;
  late NotificationBar _notificationBar;
  bool _showSidebar = true;

  @override
  void initState() {
    super.initState();
    _notificationBar = NotificationBar(
      showHideSideBar: true,
      onSideBarStatusUpdate: (shouldShowSidebar) {
        _showHideSidebar();
      },
    );
    lt = [
      NewCustomerScreen(onNewCustomerCreated: widget.onNewCustomerCreated,onCancelTapped: widget.onCancelTapped,isShowHeader: widget.isShowHeader,),
    ];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  /*  data = (widget.isFromSearch ?? false)
        ? context.watch<SelectedCustomer>().searchData
        : context.watch<SelectedCustomer>().selectedData;*/
  }

  @override
  void dispose() {
    widget.onBack!();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Visibility(
                    visible: _showSidebar,
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal * 18.5,
                      color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomerAppbar(MessagesProvider.get("Customers").toUpperCase()),
                          Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: pageList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CustomerDetailPageListItem(
                                    index: index,
                                    title: pageList[index],
                                    selectedIndex: _selectedIndex,
                                    onChange: (value) {
                                      setState(() {
                                        _selectedIndex = value;
                                      });
                                    },
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child:  lt[_selectedIndex],
                  ),
                ],
              ),
            ),
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
    );
  }

  _showErrorDialog(BuildContext context, String title, String message) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              title,
              style: theme.titleLight3?.copyWith(color: theme.secondaryColor),
            ),
          ),
          content: Text(
            message,
            style: theme.titleLight3?.copyWith(color: theme.secondaryColor),
          ),
          actions: [
            CupertinoDialogAction(
              child: Text(
                MessagesProvider.get("OK"),
                style: theme.titleLight3?.copyWith(color: theme.secondaryColor),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        barrierDismissible: true);
  }

  _showHideSidebar() {
    setState(() {
      _showSidebar = !_showSidebar;
      visibleSideBar.value = _showSidebar;
    });
  }

  _showErrorDialogView(BuildContext context, String title, String message) {
    showDialog(context: context, builder: (_) => LoginErrorDialog(title, message));
  }
}
