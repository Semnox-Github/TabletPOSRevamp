import 'dart:ui';

import 'package:customer_data/builder.dart';
import 'package:customer_data/models/customer_data.dart';
import 'package:customer_data/models/membership_summary/membership_response_data.dart';
import 'package:customer_data/models/membership_summary/membership_summary_response.dart';
import 'package:customer_ui/providers/SelectedCardDetailsProvider.dart';
import 'package:customer_ui/providers/SelectedCustomerProvider.dart';
import 'package:customer_ui/utils/extensions.dart';
import 'package:customer_ui/widgets/CustomerNameCard.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:membership_data/builder.dart';
import 'package:membership_data/models/membership_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:provider/provider.dart';
import 'package:themes_library/themes_library.dart';
import 'package:intl/intl.dart';
import 'package:widgets_library/utils/size_config.dart';
import '../../AccountsDetailsPage.dart';
import '../account_details/CreditPlusView.dart';

class CustomerMembership extends StatefulWidget {
  @override
  State<CustomerMembership> createState() => _CustomerMembershipState();
}

class _CustomerMembershipState extends State<CustomerMembership> {
  final _firstNameCtr = TextEditingController();
  final _middleNameCtr = TextEditingController();
  final _lastNameCtr = TextEditingController();
  final _membershipCtr = TextEditingController();
  final _scrollController = ScrollController();
  double _containerWidth = 0;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  CustomerData? data;
  MembershipSummaryResponse? _membershipResponse;
  MembershipSummaryData? _membershipResponseData;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    Future.microtask(() => _initDropDownList());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getMembershipSummary(
        context, context.watch<SelectedCardDetails>().selectedData?.customerId);
    data = context.watch<SelectedCustomer>().selectedData;
    _membershipCtr.text = context
            .watch<SelectedCardDetails>()
            .selectedData
            ?.membershipName
            .toString() ??
        '-';
    _firstNameCtr.text = data?.firstName ?? "";
    _middleNameCtr.text = data?.middleName ?? "";
    _lastNameCtr.text = data?.lastName ?? "";
    _containerWidth = MediaQuery.of(context).size.width / 5.5;
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: theme.backGroundColor,
      resizeToAvoidBottomInset: false,
      body: Container(
        color: theme.backGroundColor,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomerNameCard(
                  name: "${_firstNameCtr.text}  ${_lastNameCtr.text}",
                  membership: _membershipCtr.text,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: _containerWidth,
                      child: Column(
                        children: [
                          Text(
                            MessagesProvider.get('Membership'),
                            style: TextStyle(
                                color: theme.secondaryColor,
                                fontSize: SizeConfig.getFontSize(18),
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            _membershipResponseData?.memberShipName ?? '',
                            style: TextStyle(
                                color: theme.secondaryColor,
                                fontSize: SizeConfig.getFontSize(18),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: _containerWidth,
                      child: Column(
                        children: [
                          Text(
                            MessagesProvider.get('Valid Till'),
                            style: TextStyle(
                                color: theme.secondaryColor,
                                fontSize: SizeConfig.getFontSize(18),
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            !_isLoading
                                ? (DateFormat('dd-MMM-yyyy HH:mm:ss a').format(
                                                DateTime.parse(
                                                    _membershipResponseData
                                                            ?.membershipValidity ??
                                                        '0001-01-01T00:00:00')) ??
                                            '')
                                        .toString() ??
                                    "0.0"
                                : '-',
                            style: TextStyle(
                                color: theme.secondaryColor,
                                fontSize: SizeConfig.getFontSize(18),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: _containerWidth,
                      child: Column(
                        children: [
                          Text(
                            MessagesProvider.get('Membership Card'),
                            style: TextStyle(
                                color: theme.secondaryColor,
                                fontSize: SizeConfig.getFontSize(18),
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            _membershipResponseData?.membershipCard ?? '',
                            style: TextStyle(
                                color: theme.secondaryColor,
                                fontSize: SizeConfig.getFontSize(18),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: _containerWidth,
                      child: Column(
                        children: [
                          Text(
                            MessagesProvider.get('Total Points'),
                            style: TextStyle(
                                color: theme.secondaryColor,
                                fontSize: SizeConfig.getFontSize(18),
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            _membershipResponseData?.membershipTotalPoints
                                    ?.toStringAsFixed(2) ??
                                '0.00',
                            style: TextStyle(
                                color: theme.secondaryColor,
                                fontSize: SizeConfig.getFontSize(18),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: theme.dividerColor!,
                  height: SizeConfig.getSize(20),
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: _containerWidth,
                      child: Column(
                        children: [
                          Text(
                            MessagesProvider.get('Pts. to Retain'),
                            style: TextStyle(
                                color: theme.secondaryColor,
                                fontSize: SizeConfig.getFontSize(18),
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            _membershipResponseData?.memberShipRetainPoints
                                    ?.toStringAsFixed(2) ??
                                '-',
                            style: TextStyle(
                                color: theme.secondaryColor,
                                fontSize: SizeConfig.getFontSize(18),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: _containerWidth,
                      child: Column(
                        children: [
                          Text(
                            MessagesProvider.get('Next Upgrade'),
                            style: TextStyle(
                                color: theme.secondaryColor,
                                fontSize: SizeConfig.getFontSize(18),
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            _membershipResponseData?.nextMemberShipName ?? '',
                            style: TextStyle(
                                color: theme.secondaryColor,
                                fontSize: SizeConfig.getFontSize(18),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: _containerWidth,
                      child: Column(
                        children: [
                          Text(
                            MessagesProvider.get('Points Required'),
                            style: TextStyle(
                                color: theme.secondaryColor,
                                fontSize: SizeConfig.getFontSize(18),
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            _membershipResponseData
                                    ?.nextMemberShipPointsRequired
                                    ?.toStringAsFixed(2) ??
                                '0.00',
                            style: TextStyle(
                                color: theme.secondaryColor,
                                fontSize: SizeConfig.getFontSize(18),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Container(
                         height:  SizeConfig.getSize(60),
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: ElevatedButton(
                          onPressed: () => {
                            //_showAddressDialog("title", null, 1, true)
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AccountsDetailsPage(
                                      source: 0,
                                    )))
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(8.0),
                            backgroundColor: theme.button2BG1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)),
                          ),
                          child: Text(
                            MessagesProvider.get('CREDIT PLUS DETAILS'),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.getFontSize(18),
                                fontWeight: FontWeight.normal),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: theme.dividerColor,
                  height: SizeConfig.getSize(10),
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                ),
                Padding(
                  padding: EdgeInsets.all(SizeConfig.getSize(10)),
                  child: Card(
                    elevation: 0,
                    color: theme.backGroundColor,
                    child: Container(
                      height: SizeConfig.getSize(30),
                      padding: EdgeInsets.all(SizeConfig.getSize(20)),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffF0F2F8)),
                          borderRadius: BorderRadius.circular(6.0)),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 5, bottom: 5, right: 5),
                        child: SizedBox(
                            child: Row(
                          children: const [],
                        )),
                      ),
                    ),
                  ),
                ),
                Scrollbar(
                    thumbVisibility: true,
                    //always show scrollbar
                    thickness: 10,
                    //width of scrollbar
                    radius: Radius.circular(20),
                    //corner radius of scrollbar
                    scrollbarOrientation: ScrollbarOrientation.right,
                    //which side to show scrollbar
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.getSize(10),
                          right: SizeConfig.getSize(10),
                        ),
                        child: Card(
                          elevation: 0,
                          color: theme.backGroundColor,
                          child: Container(
                            height: SizeConfig.getSize(30),
                            padding: EdgeInsets.all(SizeConfig.getSize(20)),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffF0F2F8)),
                                borderRadius: BorderRadius.circular(6.0)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, bottom: 5, right: 5),
                              child: SizedBox(
                                  child: Row(
                                children: const [],
                              )),
                            ),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    ).withLoader(isLoading: _isLoading,theme: theme);
  }

  void _setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }

  Future _getMembershipSummary(BuildContext context, int? customerId) async {
    _setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final customerDataBl = await CustomerDataBuilder.build(execContext!);
    _membershipResponse =
        await customerDataBl.getMembershipSummary(customerId: customerId ?? 0);
    setState(() {
      _setLoadingStatus(false);
      _membershipResponseData = _membershipResponse?.data;
    });
  }

  Future<void> _initDropDownList() async {
    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    var membershipDataBl = await MembershipDataBuilder.build(execContextDTO!);
    var memberShip = await membershipDataBl.callMembershipDataApi();
    List<MembershipContainerDTO>? _membershipList =
        memberShip.data?.membershipContainerDTOList;
    if (data?.membershipId != -1) {
      setState(() {
        _membershipCtr.text = _membershipList
                ?.firstWhere(
                    (element) => element.membershipId == data?.membershipId)
                .membershipName ??
            "";
      });
    }
  }
}
