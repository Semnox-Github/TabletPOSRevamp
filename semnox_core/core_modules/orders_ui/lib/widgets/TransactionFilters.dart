import 'package:auto_size_text/auto_size_text.dart';
import 'package:customer_ui/customer_lookup_screen.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/pos_machines_container/pos_machine_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:orders_data/builder.dart';
import 'package:orders_data/models/transaction_status_container/transaction_status_container_dto.dart';
import 'package:orders_data/models/user_container/user_container_dto.dart';
import 'package:orders_ui/widgets/TransactionCustomerInputForm.dart';
import 'package:orders_ui/widgets/TransactionDateForm.dart';
import 'package:orders_ui/widgets/TransactionDropdownForm.dart';
import 'package:orders_ui/widgets/TransactionInputForm.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

import '../Screens/AllTransactionScreen.dart';

class TransactionFilter extends StatefulWidget{

  VoidCallback? onClear;
  VoidCallback? onSearch;
  Function(dynamic)? onPosMachineChange;
  Function(dynamic)? onStatusChange;
  Function(dynamic)? onStaffChange;
  TextEditingController? trxNoController;
  TextEditingController? trxIdController;
  TextEditingController? orderNoController ;
  TextEditingController? posMachineNoController ;
  TextEditingController? otpController ;
  TextEditingController? guestNameController ;
  TextEditingController? contactController ;
  TextEditingController? referenceController ;
  TextEditingController? customerNameController ;
  TextEditingController? fromDateController ;
  TextEditingController? toDateController ;
  TextEditingController? ccNumberController;
  String? pageName;


  TransactionFilter({super.key,
      this.onClear,
      this.onSearch,
      this.onPosMachineChange,
      this.onStatusChange,
      this.onStaffChange,
      this.trxNoController,
      this.trxIdController,
      this.orderNoController,
      this.posMachineNoController,
      this.otpController,
      this.referenceController,
      this.customerNameController,
      this.contactController,
      this.guestNameController,
      this.fromDateController,
      this.toDateController,
      this.ccNumberController,
      this.pageName});

  @override
  State<TransactionFilter> createState() => _TransactionFilterState();
}

class _TransactionFilterState extends State<TransactionFilter> {
  final _staff = <DropdownMenuItem<UserContainerDTO>>[];
  final _machine = <DropdownMenuItem<POSMachineContainerDTO>>[];
  final _status = <DropdownMenuItem<TransactionStatusContainerDTO>>[];
  var _statusValue;
  var _staffValue;
  var _machineValue;
  String? currentPosMachineName;
  String? currentStaffName;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initDropdownList();
    });
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  TransactionInputForm(title: MessagesProvider.get("Trx No"),inputController: widget.trxNoController,
                  keyboardType: TextInputType.text,),
                  const SizedBox(width: 4.0,),
                  TransactionInputForm(title: MessagesProvider.get("Trx Id"),inputController: widget.trxIdController,
                  inputFormatter: '[0-9.,]+',numberPad: true,),
                  const SizedBox(width: 4.0,),
                  TransactionInputForm(title: MessagesProvider.get("Order No"),inputController: widget.orderNoController,
                  inputFormatter: '[0-9.,]+',numberPad: true,),
                  const SizedBox(width: 4.0,),
                  Expanded(
                    child: Row(
                      children: [
                        TransactionCustomerInputForm(title: MessagesProvider.get("Customer Name"),controller: widget.customerNameController,
                          keyboardType: TextInputType.text,),
                        const SizedBox(width: 2.0,),
                        Column(
                          children: [
                            Text('', style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,),
                            const SizedBox(height: 4.0,),
                            GestureDetector(
                              onTap: (){
                                showDialog(context: context, builder: (_) {
                                  return const Padding(
                                      padding: EdgeInsets.only(left: 16,right:16, top: 12,bottom:60 ),
                                      child: CustomerLookUpScreen(isNameSelect: false,isShowHeader:true));
                                });
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset("assets/ic_background.png"),
                                  Image.asset("assets/ic_search_person.png"),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  //Expanded(child: Container()),
                ],
              ),
              const SizedBox(height: 8.0,),
              Row(
                children: [
                  TransactionInputForm(title: MessagesProvider.get("CC Number(last 4 digits)"), inputController: widget.ccNumberController,
                    inputFormatter: '[0-9.,]+',),
                  const SizedBox(width: 4.0,),
                  TransactionInputForm(title: MessagesProvider.get("otp").toUpperCase(),inputController: widget.otpController,
                  inputFormatter: '[0-9.,]+', keyboardType: TextInputType.text),
                  const SizedBox(width: 4.0,),
                  TransactionInputForm(title: MessagesProvider.get("reference"),inputController: widget.referenceController,
                      keyboardType: TextInputType.text),
                  const SizedBox(width: 4.0,),
                  TransactionInputForm(title: MessagesProvider.get("Guest Name"),inputController: widget.guestNameController,
                      keyboardType: TextInputType.text),
                //  Expanded(child: Container()),
                ],
              ),
              const SizedBox(height: 8.0,),
              Row(
                children: [
                  TransactionInputForm(title: MessagesProvider.get("Contact"), inputController: widget.contactController,
                    inputFormatter: '[0-9.,]+',),
                  const SizedBox(width: 4.0,),
                  TransactionDateForm(title: MessagesProvider.get("From Date"),controller: widget.fromDateController,),
                  const SizedBox(width: 4.0,),
                  TransactionDateForm(title: MessagesProvider.get("To date"),controller: widget.toDateController,),
                  Expanded(child: Container()),
                /*  Container(
                    margin: const EdgeInsets.only(bottom: 2.0),
                    decoration: BoxDecoration(
                      //color:  theme.cardStateUnselectedLight,
                      color:  theme.tableRow1,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: IconButton(onPressed: widget.onSearch,
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                        constraints: const BoxConstraints(),
                        icon: Image.asset("assets/ic_search.png", color : theme.secondaryColor)),
                  ),*/
                  const SizedBox(width: 4.0,),
                ],
              ),
              const SizedBox(height: 8.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(MessagesProvider.get("Staff"), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,),
                        const SizedBox(height: 8.0,),
                        Container(
                          height: MediaQuery.of(context).size.height/13,
                          child: Theme(
                            data: ThemeData(
                                textTheme: TextTheme(subtitle1: TextStyle(fontSize: SizeConfig.getFontSize(15)))
                            ),
                            child: Stack(
                              children: [
                                DropdownSearch<String>(
                                  popupProps: PopupProps.menu(
                                    showSearchBox: true,
                                    fit: FlexFit.loose,
                                  ),
                                  selectedItem: currentStaffName,
                                  items: _staff.map<String>((item) => item.value!.userName.toString()).toList(),
                                  dropdownDecoratorProps: DropDownDecoratorProps(
                                    baseStyle: theme.heading5?.copyWith(
                                        fontSize: SizeConfig.getFontSize(14), fontWeight: FontWeight.w400),
                                    dropdownSearchDecoration: InputDecoration(
                                      hintText: "All",
                                      hintStyle: theme.heading5?.copyWith(
                                          fontSize: SizeConfig.getFontSize(14), fontWeight: FontWeight.w400),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(color: theme.dividerColor!, width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(color: theme.dividerColor!, width: 1.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(color: theme.dividerColor!, width: 1.0),
                                      ),
                                      contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    ),
                                  ),
                                  onChanged: (valuei){
                                    setState(() {
                                      final _value = _staff.firstWhere((element) =>
                                      element.value!.userName.toString().toLowerCase() ==
                                          valuei.toString().toLowerCase());
                                      staff = _value.value;
                                      print(staff);
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      height: MediaQuery.of(context).size.height/14,
                                      width: 20,
                                      color: theme.backGroundColor,
                                      child: Center(
                                        child: Icon(Icons.arrow_drop_down_outlined,size: 15,color: Colors.grey,),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*TransactionDropDownForm(title:  MessagesProvider.get("Staff"),
                    value: _staffValue,
                    items: _staff,
                    onChange: widget.onStaffChange,),*/
                  const SizedBox(width: 4.0,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(MessagesProvider.get("Pos Machine"), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,),
                        const SizedBox(height: 8.0,),
                        Container(
                          height: MediaQuery.of(context).size.height/13,
                          child: Theme(
                            data: ThemeData(
                                textTheme: TextTheme(subtitle1: TextStyle(fontSize: SizeConfig.getFontSize(15)))
                            ),
                            child: Stack(
                              children: [
                                DropdownSearch<String>(
                                  popupProps: PopupProps.menu(
                                    showSearchBox: true,
                                    fit: FlexFit.loose,
                                  ),
                                  selectedItem: currentPosMachineName,
                                  items: _machine.map<String>((item) => item.value!.posName.toString()).toList(),
                                  dropdownDecoratorProps: DropDownDecoratorProps(
                                    baseStyle: theme.heading5?.copyWith(
                                        fontSize: SizeConfig.getFontSize(14), fontWeight: FontWeight.w400),
                                    dropdownSearchDecoration: InputDecoration(
                                      hintText: "All",
                                      hintStyle: theme.heading5?.copyWith(
                                          fontSize: SizeConfig.getFontSize(14), fontWeight: FontWeight.w400),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(color: theme.dividerColor!, width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(color: theme.dividerColor!, width: 1.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(color: theme.dividerColor!, width: 1.0),
                                      ),
                                      contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    ),
                                  ),
                                  onChanged: (valuei){
                                    setState(() {
                                      final _value = _machine.firstWhere((element) =>
                                      element.value!.posName.toString().toLowerCase() ==
                                          valuei.toString().toLowerCase());
                                      posMachine = _value.value;
                                      print(posMachine);
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      height: MediaQuery.of(context).size.height/14,
                                      width: 20,
                                      color: theme.backGroundColor,
                                      child: Center(
                                        child: Icon(Icons.arrow_drop_down_outlined,size: 15,color: Colors.grey,),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*TransactionDropDownForm(title:  MessagesProvider.get("Pos Machine"),
                    value: _machineValue,
                    items: _machine,
                    onChange: widget.onPosMachineChange,),*/
                  const SizedBox(width: 4.0,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(MessagesProvider.get("Status"), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,),
                        const SizedBox(height: 8.0,),
                        Container(
                          height: MediaQuery.of(context).size.height/13,
                          child: Theme(
                            data: ThemeData(
                                textTheme: TextTheme(subtitle1: TextStyle(fontSize: SizeConfig.getFontSize(15)))
                            ),
                            child: Stack(
                              children: [
                                DropdownSearch<String>(
                                  popupProps: PopupProps.menu(
                                    showSearchBox: true,
                                    fit: FlexFit.loose,
                                  ),
                                  items: _status.map<String>((item) => item.value!.statusDescription.toString()).toList(),
                                  dropdownDecoratorProps: DropDownDecoratorProps(
                                    baseStyle: theme.heading5?.copyWith(
                                        fontSize: SizeConfig.getFontSize(14), fontWeight: FontWeight.w400),
                                    dropdownSearchDecoration: InputDecoration(
                                      hintText: "All",
                                      hintStyle: theme.heading5?.copyWith(
                                          fontSize: SizeConfig.getFontSize(14), fontWeight: FontWeight.w400),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(color: theme.dividerColor!, width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(color: theme.dividerColor!, width: 1.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(color: theme.dividerColor!, width: 1.0),
                                      ),
                                      contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    ),
                                  ),
                                  onChanged: (valuei){
                                    setState(() {
                                      final _value = _status.firstWhere((element) =>
                                      element.value!.statusDescription.toString().toLowerCase() ==
                                          valuei.toString().toLowerCase());
                                      status = _value.value;
                                      print(status);
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      height: MediaQuery.of(context).size.height/14,
                                      width: 20,
                                      color: theme.backGroundColor,
                                      child: Center(
                                        child: Icon(Icons.arrow_drop_down_outlined,size: 15,color: Colors.grey,),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*TransactionDropDownForm(title:  MessagesProvider.get("Status"),
                    items: _status,
                    value: _statusValue,
                    onChange: widget.onStatusChange,),*/
                  Expanded(child: Container()),
                  //const Spacer(),

                ],
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed:widget.onClear,
                style: ElevatedButton.styleFrom(
                  padding:  const EdgeInsets.symmetric(horizontal: 24.0,vertical: 9.0),
                  backgroundColor:  theme.tableRow1,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                ),
                child: Text(MessagesProvider.get("clear").toUpperCase(), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)),textAlign: TextAlign.center,)),
            const SizedBox(width: 4.0,),
            ElevatedButton(onPressed:widget.onSearch,
                style: ElevatedButton.styleFrom(
                  padding:  const EdgeInsets.symmetric(horizontal: 24.0,vertical: 9.0),
                  backgroundColor:  theme.secondaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                ),
                child: Text(MessagesProvider.get("Search").toUpperCase(), style: theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(18)),textAlign: TextAlign.center,)),

          ],
        )
      ],
    );
  }

  Future<void> _initDropdownList() async{
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    var masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    var ordersDataBL = await OrdersDataBuilder.build(execContextDTO);
    var _userName = execContextDTO.userId;
    var list = await ordersDataBL.getUserContainer();
    var list2 = await  masterDataBL.getPosMachines();
    var list3 = await ordersDataBL.getTransactionStatus();
    var _posName = execContextDTO.posMachineName!;
    currentPosMachineName = execContextDTO.posMachineName!;
    currentStaffName = execContextDTO.userId;

    var userItem = const UserContainerDTO(userId: -1, roleId: -1, departmentId: -1, userName: "All", empLastName: "", loginId: "", managerId: -1, siteId: -1, posTypeId: -1, Guid: "",
        userIdentificationTagContainerDTOList: [], phoneNumber: "", attendanceRoleIdList: [], shiftConfigurationId: -1, empNumber: "",
        userToAttendanceRolesMapContainerDTOList: []);
    _staff.add(DropdownMenuItem(
        value: userItem,
        child: Text(userItem.userName.toString() ?? "",
            style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(14),fontWeight: FontWeight.w400))));


    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        var item = list[i];
        _staff.add(DropdownMenuItem(
            value: item,
            child: Text(item.userName.toString(),
                style: theme.textFieldStyle?.copyWith(fontSize: SizeConfig.getFontSize(14)))));
        if(item.loginId?.toLowerCase() == _userName?.toLowerCase()){
          _staffValue = item;
        }
      }
    }

    var posItem = const POSMachineContainerDTO(posMachineId: -1, posName: "All", posTypeName: "", posTypeId: -1, computerName: "", attribute1: "", inventoryLocationId: -1, guid: "",
        peripheralContainerDTOList: [], posProductExclusionsContainerDTOList: [], posPaymentModeInclusionContainerDTOList: [],
        productDisplayGroupFormatContainerDTOList: [], posPrinterContainerDTOList: [], includedProductIdList: [], productMenuIdList: [],
        facilityIdList: [], excludedProductMenuPanelIdList: []);

    _machine.add(DropdownMenuItem(
        value: posItem,
        child: Text(posItem.posName.toString() ?? "",
            style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(14),fontWeight: FontWeight.w400))));

    if (list2 != null) {
      for (int i = 0; i < list2.length; i++) {
        var item = list2[i];
        _machine.add(DropdownMenuItem(
            value: item,
            child: Text(item.posName.toString(),
                style: theme.textFieldStyle?.copyWith(fontSize: SizeConfig.getFontSize(14)))));
        if(item.posName.toLowerCase() == _posName.toLowerCase()){
          _machineValue = item;
        }
      }
    }

    var item1 = const TransactionStatusContainerDTO(transactionStatusId: -1, statusCode: '',
        statusDescription: 'All', trackTime: false, threshHoldCharacterOne: '', threshHoldCharacterTwo: '',
        threshHoldCharacterThree: '', color: '', character: '', guid: '');
    _statusValue = item1;
    _status.add(DropdownMenuItem(
        value: item1,
        child: Text(item1.statusDescription.toString(),
            style: theme.textFieldStyle?.copyWith(fontSize: SizeConfig.getFontSize(14)))));
    if (list3 != null) {
      for (int i = 0; i < list3.length; i++) {
        var item = list3[i];

        if(widget.pageName  == "open" && (item.statusCode.toUpperCase().toString() != "CLOSED"
            && item.statusCode.toUpperCase().toString() != "CANCELLED"  && item.statusCode.toUpperCase().toString() != "ABANDONED")) {
          _status.add(DropdownMenuItem(
              value: item,
              child: Text(item.statusDescription.toString(),
                  style: theme.textFieldStyle?.copyWith(fontSize: SizeConfig.getFontSize(14)))));
        }else if(widget.pageName  == "closed" && (item.statusCode.toUpperCase().toString() == "CLOSED"
            || item.statusCode.toUpperCase().toString() == "CANCELLED" || item.statusCode.toUpperCase().toString() == "REVERSED")) {
          _status.add(DropdownMenuItem(
              value: item,
              child: Text(item.statusDescription.toString(),
                  style: theme.textFieldStyle?.copyWith(fontSize: SizeConfig.getFontSize(14)))));
        } else if(widget.pageName  == "onhold" && (item.statusCode.toUpperCase().toString() == "BOOKED"
            || item.statusCode.toUpperCase().toString() == "CONFIRMED"  || item.statusCode.toUpperCase().toString() == "ORDERED")) {
          _status.add(DropdownMenuItem(
              value: item,
              child: Text(item.statusDescription.toString(),
                  style: theme.textFieldStyle?.copyWith(fontSize: SizeConfig.getFontSize(14)))));
        } else if(widget.pageName  == "all") {
          _status.add(DropdownMenuItem(
              value: item,
              child: Text(item.statusDescription.toString(),
                  style: theme.textFieldStyle?.copyWith(fontSize: SizeConfig.getFontSize(14)))));
        }
      }
    }
    setState(() {

    });
  }
}