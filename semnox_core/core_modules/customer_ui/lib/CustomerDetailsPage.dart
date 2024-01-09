import 'dart:async';

import 'package:customer_data/models/customer_data.dart';
import 'package:customer_ui/screens/customer_details/CustomerMembership.dart';
import 'package:customer_ui/screens/customer_details/CustomerRelationship.dart';
import 'package:customer_ui/CustomerWaiver.dart';
import 'package:customer_ui/ErrorDialog.dart';
import 'package:customer_ui/providers/SelectedCardDetailsProvider.dart';
import 'package:customer_ui/providers/SelectedCustomerProvider.dart';
import 'package:customer_ui/utils/size_config.dart';
import 'package:customer_ui/widgets/CustomerAppBar.dart';
import 'package:customer_ui/widgets/CustomerDetailPageListItem.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:membership_data/builder.dart';
import 'package:membership_data/models/membership_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:provider/provider.dart';
import 'package:themes_library/themes_library.dart';

import 'screens/customer_details/CustomerAccounts.dart';
import 'screens/customer_details/CustomerProfile.dart';

class CustomerDetailsPage extends StatefulWidget {
  final bool? isFromSearch;
  final Function(String?)? selectIndex;
  int source;
  String? fromPage;
  VoidCallback? onBack;

  CustomerDetailsPage(
      {super.key,
        required this.source,
        this.selectIndex,
        this.fromPage,
        this.isFromSearch,
        this.onBack});
  @override
  State<CustomerDetailsPage> createState() => _CustomerDetailsPageState();
}

class _CustomerDetailsPageState extends State<CustomerDetailsPage> {
  List<String> pageList = [
    MessagesProvider.get("Profile"),
    MessagesProvider.get("Relationship"),
    MessagesProvider.get("Membership"),
    MessagesProvider.get("Waiver"),
    MessagesProvider.get("Accounts")
  ];
  late List lt;
  int _selectedIndex = 0;
  CustomerData? data;
  final _membershipCtr = TextEditingController();
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
      CustomerProfile(
        notificationBar: _notificationBar,
      ),
      CustomerRelationship(),
      CustomerMembership(),
      CustomerWaiver(),
      CustomerAccounts(
        isFromSearch: widget.isFromSearch,
        fromPage: widget.fromPage,
        notificationBar: _notificationBar,
        showSidebar: _showSidebar,
      )
    ];
    if (widget.source == 1) {
      setState(() {
        _selectedIndex = 1;
      });
    } else if (widget.source == 4) {
      setState(() {
        _selectedIndex = 4;
      });
    } else if (widget.source == 8) {
      setState(() {
        _selectedIndex = 4;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    data = (widget.isFromSearch ?? false)
        ? context.watch<SelectedCustomer>().searchData
        : context.watch<SelectedCustomer>().selectedData;
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
                          CustomerAppbar(MessagesProvider.get("Customer \nDetails")
                              .toUpperCase()),
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
                                      if (value == 2 &&
                                          data?.membershipId == -1) {
                                        _showErrorDialogView(
                                            context,
                                            MessagesProvider.get("NO MEMBERSHIP"),
                                            MessagesProvider.get("No Membership Assigned"));

                                        setState(() {});
                                      } else if (value == 3) {
                                        _showErrorDialogView(
                                            context,
                                            MessagesProvider.get("NO WAIVERS"),
                                            MessagesProvider.get("Waivers Are Not Set"));
                                        setState(() {});
                                      } else {
                                        setState(() {
                                          _selectedIndex = value;
                                        });
                                      }
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
                    child: _selectedIndex == 4
                        ? CustomerAccounts(
                      selectedIndex: (value) {
                        widget.selectIndex!(value);
                      },
                      isFromSearch: widget.isFromSearch,
                      fromPage: widget.fromPage,
                      notificationBar: _notificationBar,
                      showSidebar: _showSidebar,
                    )
                        : lt[_selectedIndex],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal * 100,
              child: Container(
                child: _notificationBar,
              ),
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
        _membershipCtr.text = membershipList
            ?.firstWhere(
                (element) => element.membershipId == data?.membershipId)
            .membershipName ??
            "";
      });
    }
  }

  _showErrorDialogView(BuildContext context, String title, String message) {
    showDialog(
        context: context, builder: (_) => LoginErrorDialog(title, message));
  }
}
