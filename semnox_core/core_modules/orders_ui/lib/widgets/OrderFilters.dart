import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/order_status_container/order_status_container_dto.dart';
import 'package:master_data/models/pos_machines_container/pos_machine_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:orders_data/builder.dart';
import 'package:orders_data/models/facility_table_container/facility_table_container_dto.dart';
import 'package:orders_data/models/transaction_status_container/transaction_status_container_dto.dart';
import 'package:orders_data/models/user_container/user_container_dto.dart';
import 'package:orders_ui/Screens/AllOrdersScreen.dart';
import 'package:orders_ui/widgets/OrderDateForm.dart';
import 'package:orders_ui/widgets/TransactionCustomerInputForm.dart';
import 'package:orders_ui/widgets/TransactionDateForm.dart';
import 'package:orders_ui/widgets/TransactionDropdownForm.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class OrderFilters extends StatefulWidget{

  VoidCallback? onClear;
  VoidCallback? onSearch;
  Function(dynamic)? onTableChange;
  Function(dynamic)? onPosMachineChange;
  Function(dynamic)? onStatusChange;
  Function(dynamic)? onStaffChange;
  TextEditingController? guestNameController;
  TextEditingController? contactNameController;
  TextEditingController? tentNoNameController;
  TextEditingController? orderIdNameController;
  TextEditingController? fromDateController;
  TextEditingController? toDateController;
  String? pageName;
  List<UserContainerDTO>? userContainer;
  List<POSMachineContainerDTO>? posMachineContainer;
  List<OrderStatusContainerDTO>? transactionStatusContainer;
  List<FacilityTableContainerDTO>? facilityTableContainer;
  String? posMachineName;
  int? tableId;
  String? selectedStatus;



  OrderFilters({
      this.onClear,
      this.onSearch,
      this.onTableChange,
      this.onPosMachineChange,
      this.onStatusChange,
      this.onStaffChange,
      this.guestNameController,
      this.contactNameController,
      this.tentNoNameController,
      this.orderIdNameController,
      this.fromDateController,
      this.toDateController,
      this.pageName,
      this.userContainer,
      this.posMachineContainer,
      this.transactionStatusContainer,
      this.facilityTableContainer,
      this.posMachineName,
      this.tableId,
      this.selectedStatus});

  @override
  State<OrderFilters> createState() => _OrderFiltersState();
}

class _OrderFiltersState extends State<OrderFilters> {

  final _table = <DropdownMenuItem<FacilityTableContainerDTO>>[];
  final _staff = <DropdownMenuItem<UserContainerDTO>>[];
  final _machine = <DropdownMenuItem<POSMachineContainerDTO>>[];
  final _status = <DropdownMenuItem<OrderStatusContainerDTO>>[];
  var _statusValue;
  var _staffValue;
  var _tableValue;
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
   return Column(
     children: [
      Row(
        children: [
          TransactionCustomerInputForm(title: MessagesProvider.get("Guest Name"),controller: widget.guestNameController,
            keyboardType: TextInputType.text,),
          const SizedBox(width: 4.0,),
          TransactionCustomerInputForm(title: MessagesProvider.get("Contact"),controller: widget.contactNameController,
            keyboardType: TextInputType.text,),
          const SizedBox(width: 4.0,),
          TransactionCustomerInputForm(title: MessagesProvider.get("Tent No"),controller: widget.tentNoNameController,
            keyboardType: TextInputType.text,),
          const SizedBox(width: 4.0,),
          TransactionCustomerInputForm(title: MessagesProvider.get("Order Id"),controller: widget.orderIdNameController,
            keyboardType: TextInputType.number,numberPad : true),
          const SizedBox(width: 4.0,),
        ],
      ),
      const SizedBox(height: 8.0,),
      Row(
        children: [
          widget.tableId != null ?
          Expanded(
            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                Text(MessagesProvider.get("Table"), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,),
                const SizedBox(height: 8.0,),
                Container(
                  height: MediaQuery.of(context).size.height/13,
                  child: Stack(
                    children: [
                      DropdownButtonFormField(
                        items: _table,
                        onChanged: widget.onTableChange,
                        value: _tableValue,
                        icon: Padding(
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
                        isDense: true,
                        isExpanded: true,
                        enableFeedback: true,
                        style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(16)),
                        decoration: InputDecoration(
                          hintText: "All",
                          hintStyle: theme.heading5?.copyWith(
                              fontSize: SizeConfig.getFontSize(16), fontWeight: FontWeight.w400),
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
                    ],
                  ),
                )
              ],
            ),
          )
              :
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(MessagesProvider.get("Table"), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign: TextAlign.left,
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
                          items: _table.map<String>((item) => item.value!.tableName.toString()).toList(),
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
                              final _value = _table.firstWhere((element) =>
                              element.value!.tableName.toString().toLowerCase() ==
                                  valuei.toString().toLowerCase());
                              table = _value.value;
                              print(table);
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
          /*TransactionDropDownForm(title:  MessagesProvider.get("Table"),
            items: _table,
            value: _tableValue,
            onChange: widget.onTableChange,),*/
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
                          selectedItem:   currentPosMachineName,
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
            items: _machine,
            value: _machineValue,
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
                          selectedItem: widget.selectedStatus  ,
                          items: _status.map<String>((item) => item.value!.orderStatus.toString()).toList(),
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
                              element.value!.orderStatus.toString().toLowerCase() ==
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
          // TransactionDropDownForm(title:  MessagesProvider.get("Status"),
          //   items: _status,
          //   value: _statusValue,
          //   onChange: widget.onStatusChange,),
          const SizedBox(width: 4.0,),
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
          // TransactionDropDownForm(title:  MessagesProvider.get("Staff"),
          //   items: _staff,
          //   value: _staffValue,
          //   onChange: widget.onStaffChange,),
          const SizedBox(width: 4.0,),
        ],
      ),
      const SizedBox(height: 8.0,),
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          OrderDateForm(title: MessagesProvider.get("From Date"),controller:widget.fromDateController,),
          const SizedBox(width: 4.0,),
          OrderDateForm(title: MessagesProvider.get("To Date"),controller: widget.toDateController,),
          const SizedBox(width: 4.0,),
          Container(
            margin: const EdgeInsets.only(bottom: 2.0),
            decoration: BoxDecoration(
              color:  theme.tableRow1,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: IconButton(onPressed: widget.onSearch,
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                constraints: const BoxConstraints(),
                icon: Image.asset("assets/ic_search.png", color: theme.secondaryColor)),
          ),
          const SizedBox(width: 4.0,),
          ElevatedButton(onPressed:widget.onClear,
              style: ElevatedButton.styleFrom(
                padding:  const EdgeInsets.symmetric(horizontal: 24.0,vertical: 9.0),
                backgroundColor: theme.tableRow1,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
              ),
              child: Text(MessagesProvider.get("clear").toUpperCase(), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)),textAlign: TextAlign.center,)),
          const SizedBox(width: 4.0,),
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
    var list3 = await masterDataBL.getOrderStatus();
    var list4 = await ordersDataBL.getFacilityTableContainer();
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
      for (int i = 0; i < (list.length ?? 0); i++) {
        var item = list[i];
        _staff.add(DropdownMenuItem(
            value: item,
            child: Text(item.userName.toString() ?? "",
                style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(14),fontWeight: FontWeight.w400))));
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
      for (int i = 0; i < (list2.length ?? 0); i++) {
        var item = list2[i];
        _machine.add(DropdownMenuItem(
            value: item,
            child: Text(item.posName.toString() ?? "",
                style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(14),fontWeight: FontWeight.w400))));
        if(item.posName.toLowerCase() == _posName.toLowerCase()){
          _machineValue = item;
        }
      }
    }



    if (list4 != null) {
      var item1 = const FacilityTableContainerDTO(tableId: -1, tableName: "All", rowIndex: -1, columnIndex: -1, facilityId: -1,
          tableType: '', interfaceInfo1: '', interfaceInfo2: '', interfaceInfo3: '', remarks: '', guid: '', maxCheckIns: -1, userId: -1,
          trxId: -1, urderId: -1, imageFileName: '', allowMultipleOrders: false);
      if(widget.tableId == null) {
        _table.add(DropdownMenuItem(
            value: item1,
            child: Text(item1.tableName.toString(),
                style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(14),fontWeight: FontWeight.w400))));
        _tableValue = item1;
      }

      for (int i = 0; i < (list4.length ?? 0); i++) {
        var item = widget.facilityTableContainer?[i];
        if(widget.tableId == null){
          _table.add(DropdownMenuItem(
              value: item,
              child: Text(item?.tableName.toString() ?? "",
                  style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(14),fontWeight: FontWeight.w400))));
        }else if(widget.tableId != null && widget.tableId == item?.tableId){
          _table.add(DropdownMenuItem(
              value: item,
              child: Text(item?.tableName.toString() ?? "",
                  style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(14),fontWeight: FontWeight.w400))));
          _tableValue = item;
        }
      }
    }


    if (list3 != null) {
      if(widget.pageName  == "all" || widget.pageName == "open"){
        var item1 = const OrderStatusContainerDTO(orderStatusId: -1,
            orderStatus: 'All',  guid: '');
        _statusValue = item1;
        _status.add(DropdownMenuItem(
            value: item1,
            child: Text(item1.orderStatus.toString(),
                style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(14),fontWeight: FontWeight.w400))));
      }
      for (int i = 0; i < (list3.length ?? 0); i++) {

        var item = list3[i];
        if(widget.pageName  == "all" && (item.orderStatus.toUpperCase().toString() == "CLOSED"
            || item.orderStatus.toUpperCase().toString() == "INITIATED"  || item.orderStatus.toUpperCase().toString() == "ORDERED")) {
          _status.add(DropdownMenuItem(
              value: item,
              child: Text(item.orderStatus.toString() ?? "",
                  style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(14),fontWeight: FontWeight.w400))));
        }else if(widget.pageName  == "open" && (item.orderStatus.toUpperCase().toString() == "ORDERED"
            || item.orderStatus.toUpperCase().toString() == "INITIATED")) {
          _status.add(DropdownMenuItem(
              value: item,
              child: Text(item.orderStatus.toString() ?? "",
                  style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(14),fontWeight: FontWeight.w400))));
        }else if(widget.pageName  != "open" && item.orderStatus.toUpperCase().toString() == "CLOSED"){
          _statusValue = item;
          _status.add(DropdownMenuItem(
              value: item,
              child: Text(item.orderStatus.toString() ?? "",
                  style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(14),fontWeight: FontWeight.w400))));
        }
      }
      if(widget.selectedStatus == 'ORDERED' && list3.isNotEmpty){
        status = list3.firstWhere((element) => element.orderStatus == 'ORDERED',orElse:()=> const OrderStatusContainerDTO(orderStatusId: -1,
            orderStatus: 'All',  guid: ''));
      }
    }
    setState(() {

    });
  }
}