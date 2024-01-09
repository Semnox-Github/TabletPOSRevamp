import 'dart:async';

import 'package:customer_data/models/customer_data.dart';
import 'package:customer_data/models/request/customer_search/customer_search_condition.dart';
import 'package:customer_ui/utils/enums.dart';
import 'package:customer_ui/utils/extensions.dart';
import 'package:customer_ui/widgets/LookupButtonIconWidget.dart';
import 'package:customer_ui/widgets/LookupButtonWidget.dart';
import 'package:customer_ui/widgets/SearchDropDownWidget.dart';
import 'package:customer_ui/widgets/SearchTextFormWidget.dart';
import 'package:customer_ui/widgets/ToggleWidget.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/sites/site_dto.dart';
import 'package:membership_data/builder.dart';
import 'package:membership_data/models/membership_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';

import 'CustomerSearchListDialog.dart';

class CustomerLookUpScreen extends StatefulWidget {
  final bool isNameSelect;
  final Function(CustomerData?)? onCustomerSelected;
  final Function()? onCancelTapped;
  final bool isShowHeader;

  const CustomerLookUpScreen(
      {super.key,
      this.onCancelTapped,
      this.onCustomerSelected,
        required this.isShowHeader,
      required this.isNameSelect});

  @override
  State<CustomerLookUpScreen> createState() => _CustomerLookUpScreenState();
}

class _CustomerLookUpScreenState extends State<CustomerLookUpScreen> {
  final ScrollController _formScrollController = ScrollController();
  final ScrollController _criteriaScroller = ScrollController();
  final ScrollController _criteriaDialogScroller = ScrollController();
  List<CustomerData?>? data;
  bool _isLoading = true;
  bool _basicView = true;
  String? _dateFormat;

  //Form fields advanced
  final List<CustomerSearchCondition> _criteriaItems = [];
  final List<CustomerSearchCondition> _criteriaApiItems = [];
  var _selectedType = "AND";
  FieldEnum? _selectedField;
  OperatorEnum? _selectedCondition;
  final _formKey = GlobalKey<FormState>();
  bool _isPhoneExactEnabled = true;
  bool _isEmailExactEnabled = true;
  final GlobalKey<ToggleWidgetState> _phoneToggleKey = GlobalKey();
  final GlobalKey<ToggleWidgetState> _emailToggleKey = GlobalKey();

  //Form fields basic
  final _firstNameCtr = TextEditingController();
  final _middleNameCtr = TextEditingController();
  final _lastNameCtr = TextEditingController();
  final _idCtr = TextEditingController();
  final _phoneCtr = TextEditingController();
  final _emailCtr = TextEditingController();
  SiteDTO? _selectedSite;
  MembershipContainerDTO? _selectedMembership;
  final _siteList = <DropdownMenuItem<SiteDTO>>[];
  final _memberShipList = <DropdownMenuItem<MembershipContainerDTO>>[];

  @override
  void initState() {
    super.initState();
    _getConfigurations(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
      Future.microtask(() => initDropDownList(theme));
    });
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: Container(
                      color: theme.backGroundColor,
                      child: Column(
                        children: [
                        widget.isShowHeader?  SizedBox(
                            height: AppBar().preferredSize.height,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: AppBar(
                                    title: Text(
                                        MessagesProvider.get("Customer \nLookup").toUpperCase(),
                                        style: theme.headingLight4?.copyWith(color: Colors.white,fontSize: SizeConfig.getFontSize(20))),
                                    titleSpacing: 0,
                                    toolbarHeight: 60.0,
                                    backgroundColor: Colors.black87,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    leading: IconButton(
                                      icon: Image.asset(
                                          'assets/back_arrow_white.png'),
                                      iconSize: 20.0,
                                      onPressed: () {
                                        Navigator.pop(context);
                                        widget.onCancelTapped!();
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 7,
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    )),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ):const SizedBox(),
                          Container(
                            height: 1,
                            color: theme.scrollDisabled,
                          ),
                          SizedBox(
                            height: AppBar().preferredSize.height,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      LookupButtonWidget(
                                        onPress: () {
                                          setState(() {
                                            _basicView = true;
                                          });
                                        },
                                        text: MessagesProvider.get("Basic")
                                            .toUpperCase(),
                                        background: _basicView
                                            ? theme.secondaryColor
                                            : theme.tableRow1,
                                        textStyle:  _basicView
                                            ? theme.descriptionLight1?.copyWith(fontSize: SizeConfig.getFontSize(14))
                                            : theme.description1?.copyWith(fontSize: SizeConfig.getFontSize(14)),
                                        /*  ? theme.button2InnerShadow1
                                            : theme.button1BG1,
                                        textStyle: _basicView
                                            ? theme.descriptionLight1
                                                ?.copyWith(color: theme.light1)
                                            : theme.description1?.copyWith(
                                                color: theme.primaryOpposite),*/
                                      ),
                                      const SizedBox(width: 16),
                                      LookupButtonWidget(
                                        onPress: () {
                                          setState(() {
                                            _basicView = false;
                                          });
                                        },
                                        text: MessagesProvider.get("Advanced")
                                            .toUpperCase(),
                                        background: !_basicView
                                            ? theme.secondaryColor
                                            : theme.tableRow1,
                                        textStyle:  !_basicView
                                            ? theme.descriptionLight1?.copyWith(fontSize: SizeConfig.getFontSize(14))
                                            : theme.description1?.copyWith(fontSize: SizeConfig.getFontSize(14)),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Visibility(
                                            visible: !_basicView,
                                            child: LookupButtonIconWidget(
                                              onPress: () {
                                                _selectedCondition = null;
                                                _selectedField = null;
                                                _showCriteriaDialog(
                                                    null, -1, theme);
                                              },
                                              buttonText:
                                                  MessagesProvider.get("criteria")
                                                      .toUpperCase(),
                                              buttonBackground: theme.tableRow1,
                                              prefixIcon: Icon(
                                                Icons.add,
                                                color: theme.secondaryColor,
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: theme.scrollDisabled,
                          ),
                          Expanded(
                              child: SizedBox(
                            height: 100,
                            child: Scroller(
                              controller: _formScrollController,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: SingleChildScrollView(
                                  controller: _formScrollController,
                                  child: Column(
                                    children: [
                                      Column(
                                        children: [
                                          Visibility(
                                            visible: _basicView,
                                            child: Form(
                                              key: _formKey,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            MessagesProvider.get(
                                                                "First Name"),
                                                            style: theme.subtitle1
                                                                ?.copyWith(
                                                                    color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),
                                                          ),
                                                          const SizedBox(
                                                              height: 8),
                                                          SearchTextFormWidget(
                                                            controller:
                                                                _firstNameCtr,
                                                            hintText: MessagesProvider
                                                                    .get(
                                                                        "Enter ") +
                                                                MessagesProvider
                                                                    .get(
                                                                  "First Name",
                                                                ),
                                                            inputFormatter:
                                                                '[a-zA-Z0-9]',
                                                          ),
                                                          const SizedBox(
                                                              height: 16),
                                                          Text(
                                                            MessagesProvider.get(
                                                                "Last Name"),
                                                            style: theme.subtitle1
                                                                ?.copyWith(
                                                                color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),
                                                          ),
                                                          const SizedBox(
                                                              height: 8),
                                                          SearchTextFormWidget(
                                                              controller:
                                                                  _lastNameCtr,
                                                              hintText: MessagesProvider
                                                                      .get(
                                                                          "Enter ") +
                                                                  MessagesProvider
                                                                      .get(
                                                                          "Last Name"),
                                                              inputFormatter:
                                                                  '[a-zA-Z0-9]'),
                                                          const SizedBox(
                                                              height: 16),
                                                          Text(
                                                            MessagesProvider.get(
                                                                "Phone"),
                                                            style: theme.subtitle1
                                                                ?.copyWith(
                                                                    color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),
                                                          ),
                                                          const SizedBox(
                                                              height: 8),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                flex: 7,
                                                                child:
                                                                    SearchTextFormWidget(
                                                                  controller:
                                                                      _phoneCtr,
                                                                  hintText: MessagesProvider
                                                                          .get(
                                                                              "Enter ") +
                                                                      MessagesProvider
                                                                          .get(
                                                                              "Phone Number"),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .phone,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              ToggleWidget(
                                                                  onClick: (bool
                                                                      isExact) {
                                                                    _isPhoneExactEnabled =
                                                                        isExact;
                                                                  },
                                                                  key:
                                                                      _phoneToggleKey),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              height: 16),
                                                          Text(
                                                            MessagesProvider.get(
                                                                "Site"),
                                                            style: theme.subtitle1
                                                                ?.copyWith(
                                                                    color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),
                                                          ),
                                                          const SizedBox(
                                                              height: 8),
                                                          SearchDropDownWidget(
                                                            hint: MessagesProvider.get("Select ") +
                                                                MessagesProvider.get("Site"),
                                                            item: _siteList,
                                                            value: _selectedSite,
                                                            onChange: (value) {
                                                              setState(() {
                                                                _selectedSite =
                                                                    value;
                                                              });
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            MessagesProvider.get(
                                                                "Middle Name"),
                                                            style: theme.subtitle1
                                                                ?.copyWith(
                                                                    color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),
                                                          ),
                                                          const SizedBox(
                                                              height: 8),
                                                          SearchTextFormWidget(
                                                              controller:
                                                                  _middleNameCtr,
                                                              hintText: MessagesProvider
                                                                      .get(
                                                                          "Enter ") +
                                                                  MessagesProvider
                                                                      .get(
                                                                          "Middle Name"),
                                                              inputFormatter:
                                                                  '[a-zA-Z0-9]'),
                                                          const SizedBox(
                                                              height: 16),
                                                          Text(
                                                            MessagesProvider.get(
                                                                "Unique Identifier"),
                                                            style: theme.subtitle1
                                                                ?.copyWith(
                                                                    color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),
                                                          ),
                                                          const SizedBox(
                                                              height: 8),
                                                          SearchTextFormWidget(
                                                            controller: _idCtr,
                                                            hintText: MessagesProvider
                                                                    .get(
                                                                        "Enter ") +
                                                                MessagesProvider.get(
                                                                    "Unique Identifier"),
                                                          ),
                                                          const SizedBox(
                                                              height: 16),
                                                          Text(
                                                            MessagesProvider.get(
                                                                "Email"),
                                                            style: theme.subtitle1
                                                                ?.copyWith(
                                                                    color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),
                                                          ),
                                                          const SizedBox(
                                                              height: 8),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                flex: 7,
                                                                child:
                                                                    SearchTextFormWidget(
                                                                  controller:
                                                                      _emailCtr,
                                                                  hintText: MessagesProvider
                                                                          .get(
                                                                              "Enter ") +
                                                                      MessagesProvider
                                                                          .get(
                                                                              "Email"),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .emailAddress,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              ToggleWidget(
                                                                  onClick: (bool
                                                                      isExact) {
                                                                    _isEmailExactEnabled =
                                                                        isExact;
                                                                  },
                                                                  key:
                                                                      _emailToggleKey),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              height: 16),
                                                          Text(
                                                            MessagesProvider.get("Membership"),
                                                            style: theme.subtitle1
                                                                ?.copyWith(
                                                                    color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),
                                                          ),
                                                          const SizedBox(height: 8),
                                                          SearchDropDownWidget(
                                                            hint: MessagesProvider
                                                                    .get("Select ") +
                                                                MessagesProvider.get("Membership"),
                                                            item: _memberShipList,
                                                            value:
                                                                _selectedMembership,
                                                            onChange: (value) {
                                                              setState(() {
                                                                _selectedMembership =
                                                                    value;
                                                              });
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
                                          Visibility(
                                              visible: !_basicView,
                                              child: Column(
                                                children: [
                                                  ListTile(
                                                      title: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {},
                                                          icon: Image.asset(
                                                              "assets/ic_cross.png",
                                                              color: theme
                                                                  .secondaryColor)),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Expanded(
                                                          flex: 1,
                                                          child: Text(
                                                            MessagesProvider.get(
                                                                "Type"),
                                                            style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                          )),
                                                      Expanded(
                                                          flex: 2,
                                                          child: Text(
                                                            MessagesProvider.get(
                                                                "FieldName"),
                                                            style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                          )),
                                                      Expanded(
                                                          flex: 2,
                                                          child: Text(
                                                            MessagesProvider.get(
                                                                "OperatorName"),
                                                            style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                          )),
                                                      Expanded(
                                                          flex: 5,
                                                          child: Text(
                                                            MessagesProvider.get(
                                                                "Value"),
                                                            style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                          )),
                                                      const Spacer(),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                                8.0),
                                                        child: IconButton(
                                                          onPressed: () {},
                                                          icon: const Icon(null),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                                  ListView.builder(
                                                      shrinkWrap: true,
                                                      physics:
                                                          const ScrollPhysics(),
                                                      itemCount:
                                                          _criteriaItems.length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return _buildRow(
                                                            _criteriaItems[index],
                                                            index,
                                                            theme);
                                                      }),
                                                ],
                                              ))
                                        ],
                                      ),
                                    ],
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
              );
            },
          ),
        ),
        persistentFooterButtons: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LookupButtonWidget(
                text: MessagesProvider.get("Clear").toUpperCase(),
               // background: theme.button1BG1,
                background: theme.tableRow1,
                textStyle:
                    theme.description1?.copyWith(color: theme.primaryOpposite, fontSize: SizeConfig.getFontSize(14)),
                onPress: () {
                  if (_basicView) {
                    _firstNameCtr.clear();
                    _middleNameCtr.clear();
                    _lastNameCtr.clear();
                    _idCtr.clear();
                    _phoneCtr.clear();
                    _emailCtr.clear();
                    _selectedSite = null;
                    _selectedMembership = null;
                    _isPhoneExactEnabled = true;
                    _isEmailExactEnabled = true;
                    _phoneToggleKey.currentState?.setSelectedList(true);
                    _emailToggleKey.currentState?.setSelectedList(true);
                    setState(() {});
                  } else {
                    _selectedField = null;
                    _selectedCondition = null;
                    _selectedType = "AND";
                    _criteriaItems.clear();
                    _criteriaApiItems.clear();
                    setState(() {});
                  }
                },
              ),
              const SizedBox(width: 16),
              LookupButtonWidget(
                text: MessagesProvider.get("Search").toUpperCase(),
               /* background: theme.button2InnerShadow1,
                textStyle: theme.descriptionLight1?.copyWith(color: theme.light1),*/
                background: theme.secondaryColor,
                textStyle: theme.descriptionLight1?.copyWith(fontSize: SizeConfig.getFontSize(14)),
                onPress: () {
                  Navigator.pop(context);
                  if (_basicView) {
                    if (_formKey.currentState!.validate()) {
                      _showSearchDialog();
                    }
                  } else {
                    _showSearchDialog();
                  }
                  FocusScope.of(context).unfocus();
                },
              ),
            ],
          )
        ],
      ).withLoader(isLoading: _isLoading, theme: theme),
    );
  }

  void setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }

  _showSearchDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.only(
                left: 16, right: 16.0, top: 12, bottom: 60),
            child: CustomerSearchListDialog(
              basicView: _basicView,
              firstName: _firstNameCtr.text,
              middleNameCtr: _middleNameCtr.text,
              lastNameCtr: _lastNameCtr.text,
              idCtr: _idCtr.text,
              phoneCtr: _phoneCtr.text,
              isPhoneExactEnabled: _isPhoneExactEnabled,
              emailCtr: _emailCtr.text,
              isEmailExactEnabled: _isEmailExactEnabled,
              siteId: _selectedSite?.siteId.toString(),
              membershipId: _selectedMembership?.membershipId.toString(),
              criteriaApiItems: _criteriaApiItems,
              isNameSelect: widget.isNameSelect,
              onCustomerSelected: (customer) {
                if (widget.onCustomerSelected != null) {
                  widget.onCustomerSelected!(customer);
                }
              },
              onCancelTapped: () {
                widget.onCancelTapped!();
              },
            ),
          );
        });
  }

  Widget _buildRow(CustomerSearchCondition item, int index, SemnoxTheme theme) {

    return Container(
      //color: _selected[index] ? theme.cardStateUnselectedLight : null,
      margin: const EdgeInsets.only(left: 4.0, right: 4.0, bottom: 8.0),
      decoration: BoxDecoration(
          border: null,
          borderRadius: BorderRadius.circular(8),
          color: theme.tableRow1),
      child: ListTile(
        //tileColor: _selected[index] ? theme.cardStateUnselectedLight : null,
        //contentPadding: EdgeInsets.zero,
        dense: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _criteriaItems.remove(item);
                    _criteriaApiItems.removeAt(index);
                  });
                },
                icon: Image.asset("assets/ic_cross.png",
                    color: theme.secondaryColor)),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 1,
                child: Text(
                  item.Criteria,
                  style: theme.textFieldHintStyle
                      ?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(16)),
                  overflow: TextOverflow.ellipsis,
                )),
            Expanded(
                flex: 2,
                child: Text(
                  item.Column,
                  style: theme.textFieldHintStyle
                      ?.copyWith(color: theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),
                  overflow: TextOverflow.ellipsis,
                )),
            Expanded(
                flex: 2,
                child: Text(
                  item.Operator,
                  style: theme.textFieldHintStyle
                      ?.copyWith(color: theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),
                  overflow: TextOverflow.ellipsis,
                )),
            Expanded(
                flex: 5,
                child: Text(
                  item.Parameter,
                  style: theme.textFieldHintStyle
                      ?.copyWith(color: theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),
                  overflow: TextOverflow.ellipsis,
                )),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                onPressed: () {
                  _showCriteriaDialog(item, index, theme);
                },
                icon: Image.asset("assets/ic_edit.png",
                    color: theme.secondaryColor),
              ),
            ),
          ],
        ),
        onTap: () => {},
      ),
    );
  }

  _showCriteriaDialog(
      CustomerSearchCondition? item, int index, SemnoxTheme theme) {
    final fieldList = <DropdownMenuItem<FieldEnum>>[];
    final conditionList = <DropdownMenuItem<OperatorEnum>>[];
    final fieldUpdateNotifier = ValueNotifier('');
    final conditionUpdateNotifier = ValueNotifier('');
    final valueUpdateNotifier = ValueNotifier('');
    for (int i = 0; i < OperatorEnum.values.length; i++) {
      conditionList.add(DropdownMenuItem(
          value: OperatorEnum.values[i],
          child: Text(
            OperatorEnum.values[i].name,
            style: theme.subtitle2?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(16)),
          )));
    }

    for (int i = 0; i < FieldEnum.values.length; i++) {
      fieldList.add(DropdownMenuItem(
          value: FieldEnum.values[i],
          child: Text(
            FieldEnum.values[i].name,
            style: theme.subtitle2?.copyWith(color: theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),
          )));
    }

    bool typeView = true;
    StreamController<bool> buttonController = StreamController();
    final criteriaFormKey = GlobalKey<FormState>();
    final valueController = TextEditingController();

    if (item != null) {
      valueController.text = item.Parameter;
      Log.v("item ${item.toString()}");
      var condition = OperatorEnum.values.firstWhere(
        (v) => v.name.toLowerCase() == item.Operator.toLowerCase(),
        orElse: () => throw Exception('Enum value not found.'),
      );
      _selectedCondition = condition;
      var field = FieldEnum.values.firstWhere(
        (v) => v.name.toLowerCase() == item.Column.toLowerCase(),
        orElse: () => throw Exception('Enum value not found.'),
      );
      _selectedField = field;
      conditionUpdateNotifier.value = _selectedCondition!.name;
      //OperatorEnum(_criteriaApiItems[index].Operator,item.Operator);
    }
    showDialog(
        context: context,
        builder: (_) => StreamBuilder(
            stream: buttonController.stream,
            builder: (context, snapshot) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: (MediaQuery.of(context).size.width * 0.20)),
                child: Dialog(
                  // contentPadding: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Scroller(
                      controller: _criteriaDialogScroller,
                      /* thumbVisibility: true,
                      trackVisibility: true,
                      thickness: 10,*/
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: SingleChildScrollView(
                          controller: _criteriaDialogScroller,
                          child: SizedBox(
                            width: 460,
                            child: ListView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: Text(
                                    MessagesProvider.get("Add Criteria")
                                        .toUpperCase(),
                                    style: theme.heading4?.copyWith(fontSize: SizeConfig.getFontSize(20)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 2,
                                  color: theme.scrollDisabled,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      LookupButtonWidget(
                                        text: MessagesProvider.get("and").toUpperCase(),
                                        background: typeView
                                            ? theme.secondaryColor
                                            : theme.tableRow1,
                                        textStyle: typeView
                                            ? theme.descriptionLight1?.copyWith(fontSize: SizeConfig.getFontSize(14))
                                            : theme.description1?.copyWith(fontSize: SizeConfig.getFontSize(14)),
                                        onPress: () {
                                          _selectedType = "AND";
                                          typeView = true;
                                          buttonController.sink.add(true);
                                        },
                                        heightPadding: 0,
                                      ),
                                      const SizedBox(width: 16),
                                      LookupButtonWidget(
                                        text: MessagesProvider.get("or")
                                            .toUpperCase(),
                                        background: !typeView
                                            ? theme.secondaryColor
                                            : theme.tableRow1,
                                        textStyle: !typeView
                                            ? theme.descriptionLight1?.copyWith(fontSize: SizeConfig.getFontSize(14))
                                            : theme.description1?.copyWith(fontSize: SizeConfig.getFontSize(14)),
                                        onPress: () {
                                          _selectedType = "OR";
                                          typeView = false;
                                          buttonController.sink.add(false);
                                        },
                                        heightPadding: 0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 2,
                                  color: theme.scrollDisabled,
                                ),
                                Form(
                                  key: criteriaFormKey,
                                  child: Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "*${MessagesProvider.get("Field")}",
                                          style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                        ),
                                        const SizedBox(height: 12),
                                        SearchDropDownWidget(
                                          hint: MessagesProvider.get("Select"),
                                          item: fieldList,
                                          validationText:
                                              MessagesProvider.get("Select Field "),
                                          value: _selectedField,
                                          onChange: (value) {
                                            _selectedField = value;
                                            setState(() {
                                              if (_selectedField != null) {
                                                final values = EnumMapper()
                                                    .getMappedValues(
                                                        _selectedField!);
                                                valueUpdateNotifier.value =
                                                    values.type;
                                                print("value updated ${values.type}");
                                                conditionList.clear();
                                                final operatorList =
                                                    EnumMapper()
                                                        .getMappedConditions(
                                                            _selectedField!);
                                                for (int i = 0;
                                                    i < operatorList.length;
                                                    i++) {
                                                  conditionList.add(
                                                      DropdownMenuItem(
                                                          value:
                                                              operatorList[i],
                                                          child: Text(
                                                            operatorList[i].name,
                                                            style: theme
                                                                .subtitle2
                                                                ?.copyWith(
                                                                    color: theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),
                                                          )));
                                                }
                                                _selectedCondition =
                                                    operatorList.first;
                                                fieldUpdateNotifier.value =
                                                    _selectedField!.name;
                                              }
                                            });
                                          },
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "*${MessagesProvider.get("Condition")}",
                                          style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        ValueListenableBuilder(
                                          valueListenable: fieldUpdateNotifier,
                                          builder: (context, value, _) =>
                                              SearchDropDownWidget(
                                            hint: MessagesProvider.get(
                                                "Select"),
                                            item: _selectedField != null
                                                ? conditionList
                                                : [],
                                            value: _selectedCondition,
                                            validationText:
                                                MessagesProvider.get("Select Condition "),
                                            onChange: (value) {
                                              _selectedCondition = value;
                                              conditionUpdateNotifier.value =
                                                  _selectedCondition!.name;
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        ValueListenableBuilder(
                                            valueListenable:
                                                conditionUpdateNotifier,
                                            builder: (context, value, _) =>
                                                Visibility(
                                                    visible: (conditionUpdateNotifier
                                                        .value ==
                                                            "Is Null")
                                                        ? false
                                                        : (conditionUpdateNotifier.value ==
                                                                "Is Not Null")
                                                            ? false
                                                            : true,
                                                    child: Text(
                                                      "*${MessagesProvider.get("Value")}",
                                                      style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                    ))),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        ValueListenableBuilder(
                                            valueListenable:
                                                valueUpdateNotifier,
                                            builder: (context, value, _) =>
                                                ValueListenableBuilder(
                                                    valueListenable:
                                                        conditionUpdateNotifier,
                                                    builder:
                                                        (context, value, _) =>
                                                            Visibility(
                                                              visible: (conditionUpdateNotifier
                                                                          .value ==
                                                                      "Is Null")
                                                                  ? false
                                                                  : (conditionUpdateNotifier
                                                                              .value ==
                                                                          "Is Not Null")
                                                                      ? false
                                                                      : true,
                                                              child: (valueUpdateNotifier
                                                                              .value ==
                                                                          "DateTime" ||
                                                                      valueUpdateNotifier
                                                                              .value ==
                                                                          "EncryptedDateTime")
                                                                  ? TextFormField(
                                                                      controller:
                                                                          valueController,
                                                                      textAlign: TextAlign.start,
                                                                      readOnly: true,
                                                                      style: theme.textFieldStyle?.copyWith(fontSize: SizeConfig.getFontSize(16)),
                                                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                      validator:
                                                                          (value) {
                                                                        if (conditionUpdateNotifier.value ==
                                                                                "Is Null" ||
                                                                            conditionUpdateNotifier.value ==
                                                                                "Is Not Null") {
                                                                          return null;
                                                                        } else if (value ==
                                                                                null ||
                                                                            value.isEmpty) {
                                                                          return MessagesProvider.get(
                                                                              "Select Date");
                                                                        }
                                                                        return null;
                                                                      },
                                                                      decoration: InputDecoration(
                                                                          isDense: true,
                                                                          //contentPadding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color:  theme.dividerColor!)),
                                                                          hintText: 'DD-MM-YYYY',
                                                                          hintStyle: theme.textFieldStyle?.copyWith(fontSize: SizeConfig.getFontSize(16)),
                                                                          suffixIcon: Padding(
                                                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                                            child: Image.asset('assets/ic_date.png'),
                                                                          ),
                                                                          suffixIconConstraints: const BoxConstraints()),
                                                                      onTap:
                                                                          () async {
                                                                        var birthDate =
                                                                            valueController.text/*== ''?'': _getFormattedDate(widget.controller.text);*/;
                                                                        DateTime?
                                                                            selectedDate;
                                                                        if (birthDate != '') {
                                                                          DateFormat dateFormat = DateFormat(_dateFormat);
                                                                          selectedDate = dateFormat.parse(birthDate);
                                                                        }
                                                                        DateTime? pickedDate = await showDatePicker(
                                                                            context: context,
                                                                            builder: (BuildContext context, Widget? child) {
                                                                              return Theme(
                                                                                  data: ThemeData?.light().copyWith(
                                                                                      colorScheme: const ColorScheme.light(
                                                                                    primary: Colors.black,
                                                                                    onPrimary: Colors.white,
                                                                                    surface: Colors.white,
                                                                                    onSurface: Colors.black,
                                                                                  )),
                                                                                  child: child!);
                                                                            },
                                                                            initialDate: selectedDate ?? DateTime.now(),
                                                                            firstDate: DateTime(1950),
                                                                            lastDate: DateTime(2050));

                                                                        if (pickedDate !=
                                                                            null) {
                                                                          String
                                                                              formattedDate =
                                                                              DateFormat(_dateFormat).format(pickedDate);
                                                                          setState(
                                                                              () {
                                                                            valueController.text =
                                                                                formattedDate; //set output date to TextField value.
                                                                          });
                                                                        }
                                                                      },
                                                                    )
                                                                  : (valueUpdateNotifier.value ==
                                                                          "Number")
                                                                      ? TextFormField(
                                                                          controller:
                                                                              valueController,
                                                                          textAlign:
                                                                              TextAlign.left,
                                                                          readOnly:
                                                                              true,
                                                                          showCursor:
                                                                              true,
                                                                          autovalidateMode:
                                                                              AutovalidateMode.onUserInteraction,
                                                                          onTap: () => showDialog(
                                                                              barrierDismissible: true,
                                                                              context: context,
                                                                              barrierColor: const Color(0x01000000),
                                                                              builder: (BuildContext context) {
                                                                                return NumberPad(
                                                                                  initialOffset: const Offset(50, 50),
                                                                                  title: '',
                                                                                  onOkPressed: (value) {
                                                                                    valueController.text = value.toString();
                                                                                  },
                                                                                );
                                                                              }),
                                                                          textAlignVertical:
                                                                              TextAlignVertical.center,
                                                                          validator:
                                                                              (value) {
                                                                            if (conditionUpdateNotifier.value == "Is Null" ||
                                                                                conditionUpdateNotifier.value == "Is Not Null") {
                                                                              return null;
                                                                            } else if (value == null || value.isEmpty) {
                                                                              return MessagesProvider.get("Enter Value");
                                                                            }
                                                                            return null;
                                                                          },
                                                                          inputFormatters: [
                                                                            FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),
                                                                          ],
                                                                          keyboardType: TextInputType.number,
                                                                          decoration: InputDecoration(
                                                                             enabledBorder: OutlineInputBorder(
                                                                              borderSide: BorderSide(color: theme.dividerColor!),
                                                                            ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(color: theme.footerBG3!),
                                                                                ),
                                                                            border: OutlineInputBorder(),
                                                                            isDense: true,
                                                                            hintText: 'Enter Value',
                                                                            counterText: '',
                                                                            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                                                                          ),
                                                                          style: theme.subtitle3?.copyWith(fontWeight: FontWeight.w500),
                                                                        )
                                                                      : SearchTextFormWidget(
                                                                          controller:
                                                                              valueController,
                                                                          hintText:
                                                                              MessagesProvider.get("Enter"),
                                                                          keyboardType: valueUpdateNotifier.value == "Number"
                                                                              ? TextInputType.number
                                                                              : TextInputType.text,
                                                                          validationText: conditionUpdateNotifier.value == "Is Null"
                                                                              ? null
                                                                              : conditionUpdateNotifier.value == "Is Not Null"
                                                                                  ? null
                                                                                  : MessagesProvider.get("Enter value"),
                                                                        ),
                                                            ))),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 2,
                                  color: theme.scrollDisabled,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      LookupButtonWidget(
                                        text: MessagesProvider.get("Cancel")
                                            .toUpperCase(),
                                        background: theme.tableRow1,
                                        textStyle: theme.titleLight3?.copyWith(
                                            fontSize: SizeConfig.getFontSize(18),
                                            color: theme.secondaryColor,
                                            fontWeight: FontWeight.w700),
                                        onPress: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      const SizedBox(width: 16),
                                      LookupButtonWidget(
                                        onPress: () {
                                          setState(() {
                                            if (criteriaFormKey.currentState!
                                                .validate()) {
                                              if (item != null) {
                                                String searchDate = "";
                                                if ((_selectedField!.name
                                                            .toLowerCase()
                                                            .contains("date") ||
                                                        _selectedField!.name
                                                            .toLowerCase()
                                                            .contains(
                                                                "anniversary")) &&
                                                    valueController.text !=
                                                        "") {
                                                  DateFormat dateFormat =
                                                      DateFormat(_dateFormat);
                                                  var from = dateFormat.parse(
                                                      valueController.text);
                                                  searchDate = DateFormat(
                                                          'yyyy-MM-dd T hh:mm:ss')
                                                      .format(from);
                                                }
                                                var updatedItem =
                                                    CustomerSearchCondition(
                                                        Criteria: _selectedType,
                                                        Operator:
                                                            _selectedCondition!
                                                                .name,
                                                        Column: _selectedField!
                                                            .name,
                                                        Parameter:
                                                            valueController
                                                                .text,
                                                        SortByColumn: null);
                                                _criteriaItems[index] =
                                                    updatedItem;

                                                var updatedApiItem = CustomerSearchCondition(
                                                    Criteria: _selectedType,
                                                    Operator:
                                                        _selectedCondition!
                                                            .apiKey,
                                                    Column:
                                                        _selectedField!.apiKey,
                                                    Parameter: (_selectedField!
                                                                .name
                                                                .toLowerCase()
                                                                .contains(
                                                                    "date") ||
                                                            _selectedField!.name
                                                                .toLowerCase()
                                                                .contains(
                                                                    "Anniversary"))
                                                        ? searchDate
                                                        : valueController.text,
                                                    SortByColumn: null);

                                                _criteriaApiItems[index] =
                                                    updatedApiItem;
                                              } else {
                                                String searchDate = "";
                                                if ((_selectedField!.name
                                                            .toLowerCase()
                                                            .contains("date") ||
                                                        _selectedField!.name
                                                            .toLowerCase()
                                                            .contains(
                                                                "anniversary")) &&
                                                    valueController.text !=
                                                        "") {
                                                  DateFormat dateFormat =
                                                      DateFormat(_dateFormat);
                                                  var from = dateFormat.parse(
                                                      valueController.text);
                                                  searchDate = DateFormat(
                                                          'yyyy-MM-dd T hh:mm:ss')
                                                      .format(from);
                                                }
                                                var updatedItem =
                                                    CustomerSearchCondition(
                                                        Criteria: _selectedType,
                                                        Operator:
                                                            _selectedCondition!
                                                                .name,
                                                        Column: _selectedField!
                                                            .name,
                                                        Parameter:
                                                            valueController
                                                                .text,
                                                        SortByColumn: null);
                                                _criteriaItems.add(updatedItem);

                                                var updatedApiItem = CustomerSearchCondition(
                                                    Criteria: _selectedType,
                                                    Operator:
                                                        _selectedCondition!
                                                            .apiKey,
                                                    Column:
                                                        _selectedField!.apiKey,
                                                    Parameter: (_selectedField!
                                                                .name
                                                                .toLowerCase()
                                                                .contains(
                                                                    "date") ||
                                                            _selectedField!.name
                                                                .toLowerCase()
                                                                .contains(
                                                                    "anniversary"))
                                                        ? searchDate
                                                        : valueController.text,
                                                    SortByColumn: null);
                                                _criteriaApiItems
                                                    .add(updatedApiItem);
                                                _basicView = false;
                                              }
                                              Navigator.of(context).pop();
                                            }
                                          });
                                        },
                                        text: MessagesProvider.get("Confirm")
                                            .toUpperCase(),
                                        background: theme.secondaryColor,
                                        textStyle: theme.titleLight3?.copyWith(
                                            fontSize: SizeConfig.getFontSize(18),
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
        barrierDismissible: false);
  }

  Future<void> initDropDownList(SemnoxTheme theme) async {
    SizeConfig.init(context);
    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    var masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    var membershipDataBl = await MembershipDataBuilder.build(execContextDTO);
    var sites = await masterDataBL.getSites();
    var memberShip = await membershipDataBl.callMembershipDataApi();

    var list = sites?.data?.siteContainerDTOList;
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        var item = list[i];
        _siteList.add(DropdownMenuItem(
            value: item,
            child: Text(item.siteName,
                style:
                    theme.subtitle2?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)))));
      }
    }

    var list2 = memberShip.data?.membershipContainerDTOList;

    if (list2 != null) {
      for (int i = 0; i < list2.length; i++) {
        var item = list2[i];
        _memberShipList.add(DropdownMenuItem(
            value: item,
            child: Text(item.membershipName,
                style:
                    theme.subtitle2?.copyWith(color: theme.secondaryColor,fontSize: SizeConfig.getFontSize(18)))));
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future _getConfigurations(BuildContext context) async {
    var execContextBL = await ExecutionContextBuilder.build();
    var sysExecContext = execContextBL.getExecutionContext();
    var masterDataBl = await MasterDataBuilder.build(sysExecContext!);
    _dateFormat = await masterDataBl.getDefaultValuesByName(
        defaultValueName: "DATE_FORMAT");
  }
}
