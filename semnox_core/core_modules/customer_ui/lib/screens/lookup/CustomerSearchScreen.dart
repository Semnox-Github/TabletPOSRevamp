import 'dart:async';
import 'dart:collection';

import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:customer_ui/CustomerDetailsPage.dart';
import 'package:customer_ui/CustomersPage.dart';
import 'package:customer_ui/ListViewItems/CustomerSearchListItem.dart';
import 'package:customer_ui/providers/SelectedCardDetailsProvider.dart';
import 'package:customer_ui/providers/SelectedCustomerNameProvider.dart';
import 'package:customer_ui/providers/SelectedCustomerProvider.dart';
import 'package:customer_ui/utils/extensions.dart';
import 'package:customer_ui/widgets/LookupButtonWidget.dart';
import 'package:customer_ui/widgets/CustomerButtonWidget.dart';
import 'package:customer_ui/widgets/LookupHeaderTextWidget.dart';
import 'package:customer_ui/widgets/SearchItemWidget.dart';
import 'package:customer_data/builder.dart';
import 'package:customer_data/models/customer_data.dart';
import 'package:customer_data/models/request/customer_search/customer_search_condition.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/configurations/configuration_response.dart';
import 'package:master_data/models/configurations/parafait_default_container_dto.dart';
import 'package:membership_data/builder.dart';
import 'package:membership_data/models/membership_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:orders_ui/widgets/TransactionCustomerInputForm.dart';
import 'package:sprintf/sprintf.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';

import 'package:provider/provider.dart';
import 'package:logs_data/logger.dart';

import '../../CustomerDetailItem.dart';
import '../../widgets/SearchDropDownWidget.dart';

class CustomerSearchScreen extends StatefulWidget{

  bool basicView;
  String? firstName;
  String? middleNameCtr;
  String? lastNameCtr;
  String? idCtr;
  String? phoneCtr;
  bool? isPhoneExactEnabled;
  String? emailCtr;
  bool? isEmailExactEnabled;
  String? siteId;
  String? membershipId;
  List<CustomerSearchCondition>? criteriaApiItems;
  bool isNameSelect;
  final Function(CustomerData?)? onCustomerSelected;
  final Function()? onCancelTapped;
  bool? showHeader;

  CustomerSearchScreen({
    required this.basicView,
    this.firstName,
    this.middleNameCtr,
    this.lastNameCtr,
    this.idCtr,
    this.phoneCtr,
    this.isPhoneExactEnabled,
    this.emailCtr,
    this.isEmailExactEnabled,
    this.siteId,
    this.membershipId,
    this.onCustomerSelected,
    this.onCancelTapped,
    this.criteriaApiItems, required this.isNameSelect,
    this.showHeader});

  @override
  State<CustomerSearchScreen> createState() => _CustomerSearchScreenState();

}

class _CustomerSearchScreenState extends State<CustomerSearchScreen> {

  final ScrollController _customerListController = ScrollController();
  final ScrollController _customerHorizontalListController = ScrollController();
  final ScrollController _customerDetailController = ScrollController();
  final scrollDirection = Axis.vertical;
  final _pageController = TextEditingController();
  int _selectedIndex = 0;
  int _currentPage = 0;
  int _pageSize = 50;
  int? _totalCustomer = 0;
  int? _totalPage = 0;
  List<CustomerData?>? _data = [];
  CustomerData? _selectedData;
  final Map<int,  List<CustomerData?>?> _customers = HashMap();
  bool _isLoading = true;
  final ScrollController _horizontal = ScrollController(), _vertical = ScrollController();
  MembershipContainerDTO? _selectedMembership;
  final _memberShipList = <DropdownMenuItem<MembershipContainerDTO>>[];
  ParafaitDefaultContainerDTO? _dateObject;
  String? _dateFormat;
  ConfigurationResponse? _config;

  @override
  void initState() {
    super.initState();
    _pageController.text = _pageSize.toString();
    _getConfigurations(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.microtask(() =>  _initDropDownList());
    });
    _search();
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: theme.backGroundColor,
        ),
        child: Container(
          color: theme.backGroundColor,
          child: Column(
            children: [
              Row(
                children: [
                  Visibility(
                    visible: widget.showHeader ?? true,
                    child: SizedBox(
                      width: 240,
                      height: AppBar().preferredSize.height -8.0,
                      child: AppBar(
                        title: Text(MessagesProvider.get("Customer Lookup").toUpperCase(), style: theme.headingLight4?.copyWith(color : Colors.white, fontSize: SizeConfig.getFontSize(20))),
                        titleSpacing: 0,
                        toolbarHeight: 60.0,
                        backgroundColor: Colors.black87,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                          ),),
                        leading: IconButton(
                          icon: Image.asset('assets/back_arrow_white.png'),
                          iconSize: 20.0,
                          onPressed: () {
                            Navigator.pop(context);
                            widget.onCancelTapped!();
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0,),
                  Expanded(
                    child: PhysicalModel(
                      elevation: 1.0,
                      color : theme.tableRow1!,
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8.0)),
                      child: Container(
                        //width: MediaQuery.of(context).size.width * 0.8,
                        // width: double.infinity,
                        height: AppBar().preferredSize.height -8.0,
                        decoration: BoxDecoration(
                            color: theme.tableRow1,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0),bottomRight: Radius.circular(8.0))
                        ),
                        //margin: const EdgeInsets.symmetric(vertical: 8.0),
                        padding: const EdgeInsets.all(10.0),
                      ),
                    ),
                  ),
                ],
              ),
              /*Container(
                height: 1,
                color: Colors.black26,
              ),*/
              const SizedBox(height : 8.0),
              Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      Expanded(
                          flex : 10,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child:
                                    Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                                      padding: const EdgeInsets.only(top: 14.0, ),
                                      decoration: BoxDecoration(
                                          border:   null,
                                          borderRadius: BorderRadius.circular(8),
                                          color: theme.tableRow1
                                      ),
                                      child: DropdownButtonFormField(
                                        items:  _memberShipList,
                                        onChanged: (value){
                                          _selectedMembership = value;
                                        },
                                        value: _selectedMembership,
                                        validator: (value){
                                          return null;
                                        },
                                        style: theme.subtitle2?.copyWith(color: theme.secondaryColor,fontSize: SizeConfig.getFontSize(24)),
                                        hint: Text(MessagesProvider.get("Type"), style: theme.subtitle2?.copyWith(color: theme.secondaryColor,fontSize: SizeConfig.getFontSize(24))),
                                        dropdownColor: theme.tableRow1,
                                        isDense: true,
                                        decoration: _selectedMembership == null ?  InputDecoration(
                                          label: Text(MessagesProvider.get("Membership"), style: theme.subtitleLight2?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(20)),),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: theme.tableRow1!),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: theme.tableRow1!),
                                          ),
                                          isDense: true,
                                          contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                        ) :
                                        InputDecoration(
                                          label: Text(MessagesProvider.get("Membership"), style: theme.subtitleLight2?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(20)),),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: theme.tableRow1!),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: theme.tableRow1!),
                                          ),
                                          isDense: true,
                                          contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                        ) ,
                                        icon: Image.asset('assets/down_arrow_white.png', height: 20, width: 15, color: _selectedMembership == null ? Colors.grey : theme.secondaryColor,),
                                        isExpanded: true,),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 2.0),
                                    decoration: BoxDecoration(
                                      color:  theme.tableRow1,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: IconButton(onPressed: (){
                                      _search();
                                    },
                                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                                        constraints: const BoxConstraints(),
                                        icon: Image.asset("assets/ic_search.png", color: theme.secondaryColor)),
                                  ),
                                ],
                              ),
                              Expanded(
                                  child: Scroller(
                                  controller:_customerHorizontalListController,
                                  child: Padding(
                                  padding: const EdgeInsets.only(bottom: 22.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    controller: _customerHorizontalListController,
                                    child: SizedBox(
                                      width: 1200,
                                      child: Column(
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(left: 8.0, top:8.0, bottom: 8.0),
                                              child: SizedBox(
                                                height: 10,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    LookupHeaderTextWidget(0.5,MessagesProvider.get("Id").toUpperCase(),heighFactor: 1,),
                                                    LookupHeaderTextWidget(0.8,MessagesProvider.get("First Name"),heighFactor: 1,),
                                                    LookupHeaderTextWidget(0.8,MessagesProvider.get("Last Name"),heighFactor: 1,),
                                                    LookupHeaderTextWidget(1,MessagesProvider.get("Phone No"),heighFactor: 1,),
                                                    LookupHeaderTextWidget(2,MessagesProvider.get("Email"),heighFactor: 1,),
                                                    LookupHeaderTextWidget(1,MessagesProvider.get("Membership"),heighFactor: 1,),
                                                    LookupHeaderTextWidget(2,MessagesProvider.get("Registered On"),heighFactor: 1,),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          Expanded(
                                            child: Scroller(
                                              controller:_customerListController,
                                              child: Padding(
                                                padding: const EdgeInsets.only(right: 14.0),
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    controller:_customerListController,
                                                    physics: const ScrollPhysics(),
                                                    itemCount: _data?.length ?? 0,
                                                    padding: const EdgeInsets.only(left: 8.0,right: 10.0),
                                                    itemBuilder: (BuildContext context, int index) {
                                                      return Padding(
                                                        padding: const EdgeInsets.all(3.0),
                                                        child: CustomerListItem(
                                                          fromPage: 'lookup',
                                                          dateFormat: _dateFormat,
                                                          selectedIndex: _selectedIndex, index: index,
                                                          data :_data,
                                                          onChange: (value){
                                                            setState((){
                                                              _selectedIndex = value;
                                                              _selectedData = _data?[_selectedIndex];
                                                            });
                                                          },),
                                                      );
                                                    }),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  ),
                                )),
                              const SizedBox(height: 8.0,),
                              SizedBox(
                                  height: AppBar().preferredSize.height,
                                  child: Container(
                                    color: theme.tableRow1,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex : 8,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: SingleChildScrollView(
                                                  scrollDirection: Axis.horizontal,
                                                  reverse: true,
                                                  child: Row(
                                                    children: [
                                                      CupertinoButton(
                                                        minSize: double.minPositive,
                                                        padding: EdgeInsets.zero,
                                                        child:Row(
                                                            children:[
                                                              Image.asset('assets/back_arrow_white.png',color : (_currentPage > 0) ? theme.secondaryColor : Colors.black26, height: 20, width:12,fit: BoxFit.fitHeight),
                                                              Image.asset('assets/back_arrow_white.png',color : (_currentPage > 0) ? theme.secondaryColor : Colors.black26, height: 20, width:12,fit: BoxFit.fitHeight),
                                                            ]
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            _currentPage =  0;
                                                            _data = _customers[_currentPage];
                                                            _selectedData = _data?[_selectedIndex];
                                                          });
                                                        },
                                                      ),
                                                      const SizedBox(width: 8.0,),
                                                      SizedBox(
                                                        height: 20,
                                                        width: 20,
                                                        child: IconButton(
                                                            padding: const EdgeInsets.all(0),
                                                            onPressed: (){
                                                              setState(() {
                                                                if(_currentPage > 0){
                                                                  _currentPage--;
                                                                  if(_customers[_currentPage] == null){
                                                                    _search();
                                                                  }else{
                                                                    _data = _customers[_currentPage];
                                                                    _selectedData = _data?[_selectedIndex];
                                                                  }
                                                                }
                                                              });
                                                            }, icon: Image.asset('assets/back_arrow_white.png',color : (_currentPage > 0) ? theme.secondaryColor : Colors.black26)),
                                                      ),
                                                      const SizedBox(width: 8.0,),
                                                      Container(
                                                          padding: const EdgeInsets.all(8.0),
                                                          margin:  const EdgeInsets.only(top : 8.0, bottom : 8.0, right : 3),
                                                          decoration: BoxDecoration(
                                                            border:  Border.all(color: Colors.black) ,
                                                            borderRadius: BorderRadius.circular(6),
                                                          ),
                                                          child: Text((_currentPage+1).toString(),style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),)),
                                                      Text(sprintf(MessagesProvider.get("of %d"),[_totalPage]),style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(16)),),
                                                      const SizedBox(width: 8.0,),
                                                      SizedBox(
                                                        height: 20,
                                                        width: 20,
                                                        child: IconButton(onPressed: (){
                                                          setState(() {
                                                            if((_currentPage+1) < _totalPage!){
                                                              _currentPage++;
                                                              if(_customers[_currentPage] == null){
                                                                _search();
                                                              }else{
                                                                _data = _customers[_currentPage];
                                                                _selectedData = _data?[_selectedIndex];
                                                              }
                                                            }
                                                          });
                                                        }, icon: Image.asset('assets/ic_right_arrow.png', color : _currentPage+1 < (_totalPage ?? 0) ? theme.secondaryColor : Colors.black26),
                                                          padding: const EdgeInsets.all(0),),
                                                      ),
                                                      const SizedBox(width: 8.0,),
                                                      CupertinoButton(
                                                        minSize: double.minPositive,
                                                        padding: EdgeInsets.zero,
                                                        child:Row(
                                                          children: [
                                                            Image.asset('assets/ic_right_arrow.png', color : _currentPage+1 < (_totalPage ?? 0) ? theme.secondaryColor : Colors.black26,height: 20, width:12,fit: BoxFit.fitHeight),
                                                            Image.asset('assets/ic_right_arrow.png', color : _currentPage+1 < (_totalPage ?? 0) ? theme.secondaryColor : Colors.black26,height: 20, width:12,fit: BoxFit.fitHeight)
                                                          ],
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            _currentPage =  _totalPage!-1;
                                                            if(_customers[_currentPage] == null){
                                                              _search();
                                                            }else{
                                                              _data = _customers[_currentPage];
                                                              _selectedData = _data?[_selectedIndex];
                                                            }
                                                          });
                                                        },
                                                      ),
                                                      const SizedBox(width: 12.0,),
                                                      SizedBox(
                                                        width: 40,
                                                        child:
                                                        TextFormField(
                                                          controller: _pageController,
                                                          textAlign: TextAlign.center,
                                                          textAlignVertical: TextAlignVertical.center,
                                                          readOnly: true,
                                                          showCursor: true,
                                                          onTap: () => showDialog(
                                                              barrierDismissible: true,
                                                              context: context,
                                                              barrierColor: const Color(0x01000000),
                                                              builder: (BuildContext context) {
                                                                return NumberPad(
                                                                  initialOffset: const Offset(50, 50),
                                                                  title: '',
                                                                  onOkPressed: (value) {
                                                                    if (value >= 100) {
                                                                      _pageController.text = "100";
                                                                    } else {
                                                                      _pageController.text = value.toString();
                                                                    }
                                                                  },
                                                                );
                                                              }),
                                                          validator: (value){
                                                            /*if(validationText == null){
                                          return null;
                                        }else if (value == null || value.isEmpty) {
                                          return validationText;
                                        }*/
                                                            return null;
                                                          },
                                                          keyboardType: TextInputType.number,
                                                          decoration: const InputDecoration(
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.black),
                                                            ),
                                                            border: OutlineInputBorder(),
                                                            isDense: true,
                                                            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                                                          ),
                                                          style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text(MessagesProvider.get("per page"),style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(16)),textAlign: TextAlign.center,
                                                          overflow: TextOverflow.ellipsis,),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: (){
                                                          setState((){
                                                            _pageSize = int.parse(_pageController.text);
                                                            _currentPage = 0;
                                                            _customers.clear();
                                                            _search();
                                                          });
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                          minimumSize: Size.zero,
                                                          padding:  const EdgeInsets.only(left : 12.0, right: 12,top : 8.0, bottom : 8.0),
                                                          backgroundColor: theme.secondaryColor,
                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                                                        ),
                                                        child: Text( MessagesProvider.get("go").toUpperCase(), style: theme.subtitleLight3?.copyWith(fontSize: SizeConfig.getFontSize(16)),),),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          )
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                          flex : 5,
                          child: Container(
                            color: theme.backGroundColor,
                            child: Column(
                              children: [
                                PhysicalModel(
                                  elevation: 1.0,
                                  color : theme.tableRow1!,
                                  //borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8.0),bottomRight: Radius.circular(8.0)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(onPressed: (){
                                        if(_selectedIndex != 0){
                                          setState(() {
                                            _selectedIndex--;
                                            _selectedData = _data?[_selectedIndex];
                                            _scrollToIndex();
                                          });
                                        }
                                      },  icon: Image.asset('assets/back_arrow_white.png', color : _selectedIndex != 0 ? theme.secondaryColor : Colors.black26),),
                                      Visibility(
                                        visible: _totalCustomer! > 0 ?  true : false,
                                        child: Text("${_data?.length == 0 ? "": _data?[_selectedIndex]?.firstName}\n${sprintf(MessagesProvider.get("%d of %d"),[((_currentPage+1)*_pageSize-_pageSize+_selectedIndex+1),_totalCustomer])}",
                                          style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(18)),),
                                      ),
                                      IconButton(onPressed: (){
                                        var i = _data?.length;
                                        if (_selectedIndex != (i!- 1)) {
                                          setState(() {
                                            _selectedIndex++;
                                            _selectedData = _data?[_selectedIndex];
                                            _scrollToIndex();
                                          });
                                        }
                                      },  icon: Image.asset('assets/ic_right_arrow.png',color : _selectedIndex+1 < (_data?.length ?? 0) ? theme.secondaryColor : Colors.black26),),
                                    ],
                                  ),
                                ),
                                /*Container(height: 1, color: Colors.black26,),*/
                                Expanded(
                                  child: Container(
                                    color : theme.tableRow1,
                                    child: Visibility(
                                      visible: _totalCustomer! > 0 ?  true : false,
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        margin: const EdgeInsets.only(right : 8.0,left : 8.0 , top : 8.0),
                                        color: theme.backGroundColor,
                                        constraints: const BoxConstraints.expand(),
                                        child: Scroller(
                                          /*      thumbVisibility: true,
                                          trackVisibility: true,
                                          thickness: 10,*/
                                          controller: _horizontal,
                                          child: Padding(
                                            padding: const EdgeInsets.only(bottom: 16.0),
                                            child: SingleChildScrollView(
                                              controller: _horizontal,
                                              scrollDirection: Axis.horizontal,
                                              child: SizedBox(
                                                width: 275,
                                                child: Scroller(
                                                  controller: _vertical,
                                                  child: ListView.builder(
                                                      shrinkWrap: true,
                                                      scrollDirection: Axis.vertical,
                                                      controller:_vertical,
                                                      physics: const ScrollPhysics(),
                                                      itemCount: 67,
                                                      key: UniqueKey(),
                                                      itemBuilder: (BuildContext context, int index) {
                                                        return Padding(
                                                            padding: const EdgeInsets.all(3.0),
                                                            child: CustomerDetailItem(_selectedData,index,_dateFormat)
                                                        );
                                                      }),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                /*  Container(height: 1, color: Colors.black26,),*/
                                Container(
                                  color : theme.backGroundColor,
                                  height: AppBar().preferredSize.height - 8.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Visibility(
                                        visible: _totalCustomer! > 0 ?  true : false,
                                        child: Expanded(
                                          child: Container(
                                            height:  MediaQuery.of(context).size.height ,
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: CustomerButtonWidget(text: MessagesProvider.get("CUSTOMER\nDETAILS"),
                                              onPress: (){
                                                context.read<SelectedCustomer>().updateData(_data?[_selectedIndex]);
                                                Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>  CustomerDetailsPage(source: 0,fromPage: "details",
                                                        onBack: (){

                                                        },)),);
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: _totalCustomer! > 0 ?  true : false,
                                        child: Expanded(
                                          child: Container(
                                            height:  MediaQuery.of(context).size.height,
                                            padding: const EdgeInsets.only(left: 8.0, ),
                                            child: CustomerButtonWidget(text: MessagesProvider.get("Deactivate").toUpperCase(),
                                                onPress: () async {
                                                 /* if(widget.isNameSelect){
                                                    context.read<SelectedCustomerName>().updateData(_data?[_selectedIndex]);
                                                    Navigator.pop(context);

                                                    if(widget.onCustomerSelected != null) {
                                                      widget.onCustomerSelected!(_data?[_selectedIndex]);
                                                    }
                                                  }else{
                                                    customerName.value = _data?[_selectedIndex]?.firstName ?? "";
                                                    context.read<SelectedCustomer>().updateData(_data?[_selectedIndex]);
                                                    _getAccountDetails();
                                                  }*/
                                                }
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                      const SizedBox(width: 8.0,),
                    ],
                  )),
            ],
          ),
        ),
      ),
    ).withLoader(isLoading: _isLoading,theme: theme);
  }

  _getAccountDetails() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final customerSearchBL = await CustomerDataBuilder.build(executionContextDTO!);
    CustomerData? customerData = _data?[_selectedIndex];
    var customerId = _data?[_selectedIndex]?.id ?? -1;
    try {
      _setLoadingStatus(true);

      AccountDetailsResponse? accountsResponse = await customerSearchBL.getCustomerAccounts(customerId: customerId);
      if(accountsResponse.exception == null) {
        _setLoadingStatus(false);
        var accountDetailsData = accountsResponse.data ?? [];
        if(accountDetailsData.length > 0){
          context.read<SelectedCardDetails>().updateCardLength(accountDetailsData.length);
        }else{
          context.read<SelectedCardDetails>().updateData(null);
        }
        for(int i =0; i < accountDetailsData.length ; i++){
          if(customerData?.cardNumber == accountDetailsData[i].tagNumber){
            context.read<SelectedCardDetails>().updateData(accountDetailsData[i]);
          }
        }
        Navigator.pop(context);
        if(widget.onCustomerSelected != null) {
          widget.onCustomerSelected!(_data?[_selectedIndex]);
        }
      }
    }on DioError catch(error) {
      _setLoadingStatus(false);
      var errorString = error.response?.data['data'] as String?;
      Future.microtask(() => _showErrorDialog(context, 'Error', errorString ?? ''));
    }

  }

  _search() async{
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final customerSearchBL = await CustomerDataBuilder.build(executionContextDTO!);

    if(widget.basicView) {
      try {
        _setLoadingStatus(true);
        var response = await customerSearchBL.searchCustomerBasic(
            currentPage: _currentPage,
            pageSize: _pageSize,
            firstName: widget.firstName,
            middleName: widget.middleNameCtr,
            lastName:  widget.lastNameCtr,
            uniqueId:  widget.idCtr,
            phoneNo:  widget.phoneCtr,
            isExactPhoneNeeded:  widget.isPhoneExactEnabled,
            email:  widget.emailCtr,
            isExactEmailNeeded:  widget.isEmailExactEnabled,
            siteId:  widget.siteId,
            memberShipId:  _selectedMembership?.membershipId == -1 ? null: _selectedMembership?.membershipId.toString()
        );

        if(response.exception == null) {
          _setLoadingStatus(false);
        }
        _totalPage = customerSearchBL.getTotalPages();
        _totalCustomer = customerSearchBL.getTotalCustomers();
        _customers.addAll({_currentPage: response.data});
        _data = _customers[_currentPage];
        _selectedData = _data?[_selectedIndex];

      } on DioError catch(error) {
        _setLoadingStatus(false);
        var errorString = error.response?.data['data'] as String?;
        Future.microtask(() => _showErrorDialog(context, 'Error', errorString ?? ''));
      }
    } else {
      try {
        _setLoadingStatus(true);
        var response = await customerSearchBL.searchCustomerAdvanced(
            currentPage: _currentPage,
            pageSize: _pageSize,
            conditionsList: widget.criteriaApiItems?? []);
        if(response.exception == null) {
          _setLoadingStatus(false);
        }

        _totalPage = customerSearchBL.getTotalPages();
        _totalCustomer = customerSearchBL.getTotalCustomers();
        _customers.addAll({_currentPage: response.data});
        _data = _customers[_currentPage];
        _selectedData = _data?[_selectedIndex];

      } on DioError catch(error) {
        _setLoadingStatus(false);
        var errorString = error.response?.data['data'] as String?;
        Future.microtask(() => _showErrorDialog(context, 'Error', errorString ?? ''));
      }
    }
  }

  void _setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }

  _showErrorDialog(BuildContext context, String title, String message) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(title,style: theme.titleLight3?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),),
          ),
          content: Text(message,style: theme.titleLight3?.copyWith(color: theme.secondaryColor,fontSize: SizeConfig.getFontSize(18)),),
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

  _scrollToIndex(){
    final contentSize = _customerListController.position.viewportDimension + _customerListController.position.maxScrollExtent;
    final itemCount = _data?.length ?? 0;
    final target = (contentSize) * (_selectedIndex) / (itemCount);
    _customerListController.animateTo(target,curve: Curves.ease,duration:  const Duration(seconds: 1));
  }

  Future _getConfigurations(BuildContext context) async {
    var execContextBL = await ExecutionContextBuilder.build();
    var sysExecContext = execContextBL.getExecutionContext();
    var masterDataBl = await MasterDataBuilder.build(sysExecContext!);
    _config = await masterDataBl.getConfigurations();
    _dateFormat = await masterDataBl.getDefaultValuesByName(defaultValueName: "DATETIME_FORMAT");
    _dateFormat = _dateFormat?.replaceAll('tt', 'a');
  }


  Future<void> _initDropDownList() async {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    var masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    var membershipDataBl = await MembershipDataBuilder.build(execContextDTO);
    var sites = await masterDataBL.getSites();
    var memberShip = await membershipDataBl.callMembershipDataApi();

    var list2 = memberShip.data?.membershipContainerDTOList;
    var item1 = const MembershipContainerDTO(membershipId: -1, membershipName: "All", description: "", redemptionDiscount: -1, priceListId: -1);
    _selectedMembership = item1;
    _memberShipList.add(DropdownMenuItem(
        value: item1,
        child: Text(item1.membershipName,
            style:
            theme.subtitle2?.copyWith(color: theme.secondaryColor,fontSize: SizeConfig.getFontSize(18)))));
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
  }
}