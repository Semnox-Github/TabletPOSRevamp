import 'dart:async';

import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:customer_data/models/customer_data.dart';
import 'package:customer_ui/screens/customer_details/CustomerMembership.dart';
import 'package:customer_ui/screens/customer_details/CustomerRelationship.dart';
import 'package:customer_ui/CustomerWaiver.dart';
import 'package:customer_ui/providers/SelectedCardDetailsProvider.dart';
import 'package:customer_ui/providers/SelectedCustomerProvider.dart';
import 'package:customer_ui/screens/account_details/CreditPlusView.dart';
import 'package:customer_ui/screens/account_details/Games.dart';
import 'package:customer_ui/screens/account_details/PurchaseActivtyView.dart';
import 'package:customer_ui/widgets/CustomerAppBar.dart';
import 'package:customer_ui/widgets/CustomerDetailPageListItem.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:membership_data/builder.dart';
import 'package:membership_data/models/membership_container_dto.dart';
import 'package:provider/provider.dart';

import 'package:widgets_library/utils/size_config.dart';
import 'package:themes_library/themes_library.dart';


import 'screens/customer_details/CustomerAccounts.dart';
import 'screens/customer_details/CustomerProfile.dart';
import 'Discounts.dart';
import 'GameActivity.dart';
import 'PurchaseActivity.dart';


class AccountsDetailsPage extends StatefulWidget{
  int source ;
  String? from;
  AccountDetailsData? accountDetailsData;

  AccountsDetailsPage({required this.source,this.from, this.accountDetailsData});
  @override
  State<AccountsDetailsPage> createState() => _AccountsDetailsPageState();
}

class _AccountsDetailsPageState extends State<AccountsDetailsPage> {

  List<String> pageList = ["Credit Plus","Games",MessagesProvider.get("Discounts"),
    "Purchase Activity","Game Activity"];
  List lt  = [CreditPlusView(cId: 0,),Games(),Discounts(cId: 0,),PurchaseActivityView(),CreditPlusView(cId: 0,)];
  int _selectedIndex = 0;
  CustomerData? data;
  final _membershipCtr = TextEditingController();
  late NotificationBar _notificationBar;
  bool _showSidebar = true;


  @override
  void initState() {
    super.initState();

    _notificationBar = NotificationBar(showHideSideBar: true,
      onSideBarStatusUpdate: (shouldShowSidebar) {
        _showHideSidebar();
      },);

  }
  _showHideSidebar() {
    setState(() {
      _showSidebar = !_showSidebar;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    data = context.watch<SelectedCustomer>().selectedData;
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
      bottomNavigationBar:
      SizedBox(
        width: SizeConfig.blockSizeHorizontal * 100,
        child: Container(
          child: _notificationBar,
        ),
      ),
        resizeToAvoidBottomInset: false,
        body: Row(
          children: [
            Visibility(
              visible: _showSidebar,
              child: Container(
                width : SizeConfig.blockSizeHorizontal * 18.5,
                color: Colors.black,
                child: Column(
                  children: [
                    CustomerAppbar(MessagesProvider.get("Account \nDetails"), accountDetailsData: widget.accountDetailsData,),
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: pageList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return  CustomerDetailPageListItem(index: index,title: pageList[index],selectedIndex: _selectedIndex,
                              onChange: (value){
                                if(value == 8 && data?.membershipId == -1){
                                  _showErrorDialog(context, "NO MEMBERSHIP", "No Membership Assigned");
                                  setState(() {

                                  });
                                }else if(value == 8){
                                  _showErrorDialog(context, "NO WAIVERS", "Waivers Are Not Set");
                                  setState(() {

                                  });
                                }else{
                                  setState((){
                                    _selectedIndex = value;
                                  });
                                }
                              },);
                          }),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
                flex: 7,
                child: _selectedIndex == 4?
                GameActivity(cId: 0, notificationBar: _notificationBar,) :
                _selectedIndex == 3?
                PurchaseActivity(cId: 0, notificationBar: _notificationBar,):
                lt[_selectedIndex]),
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
            child: Text(title,style: theme.titleLight3?.copyWith(color: theme.secondaryColor),),
          ),
          content: Text(message,style: theme.titleLight3?.copyWith(color: theme.secondaryColor),),
          actions: [
            CupertinoDialogAction(
              child: Text(MessagesProvider.get("OK"),style: theme.titleLight3?.copyWith(color: theme.secondaryColor),),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        barrierDismissible: true);
  }


}
