import 'dart:collection';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/facility_table_status_container/facility_table_status_container_dto.dart';
import 'package:master_data/models/user_role_container/management_form_access_container_dto.dart';
import 'package:orders_data/blocs/app_blocs.dart';
import 'package:orders_data/blocs/app_events.dart';
import 'package:orders_data/blocs/app_states.dart';
import 'package:messages_data/builder.dart';
import 'package:orders_data/builder.dart';
import 'package:orders_data/models/facility_container/facility_container_dto.dart';
import 'package:orders_data/models/facility_table/approve_dto.dart';
import 'package:orders_data/models/facility_table/facility_table.dart';
import 'package:orders_data/models/facility_table_current_status/facility_table_current_status_dto.dart';
import 'package:orders_data/models/table_search_data/table_search_data.dart';
import 'package:orders_data/models/transactions/transaction_data.dart';
import 'package:orders_ui/OrdersPage.dart';
import 'package:orders_ui/Screens/AllOrdersScreen.dart';
import 'package:orders_ui/Screens/TableSeatLoayoutScreen.dart';
import 'package:orders_ui/Screens/TableSeatLoayoutScreenMove.dart';
import 'package:orders_ui/providers/SelectedFacilityProvider.dart';
import 'package:orders_ui/utils/AppColors.dart';
import 'package:orders_ui/utils/NotificationMessage.dart';
import 'package:orders_ui/utils/extensions.dart';
import 'package:orders_ui/widgets/ErrorDialog.dart';
import 'package:orders_ui/widgets/StatusInfoDialog.dart';
import 'package:orders_ui/widgets/TableFilters.dart';
import 'package:orders_ui/widgets/TableListItem.dart';
import 'package:orders_ui/widgets/TableOrderMode.dart';
import 'package:orders_ui/widgets/TablePagination.dart';
import 'package:orders_ui/widgets/TopBar.dart';
import 'package:product_config_ui/transaction_order_details_dialog/transaction_order_details_dialog.dart' as TD;
import 'package:provider/provider.dart';
import 'package:semnox_tablet_pos/SalesScreen.dart';
import 'package:logs_data/logger.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'dart:math' as math;
import '../widgets/TableListHeader.dart';

class OccupiedTableScreen extends StatefulWidget{

  @override
  State<OccupiedTableScreen> createState() => _OccupiedTableScreenState();
}

class _OccupiedTableScreenState extends State<OccupiedTableScreen> {
  int _selectedIndex = -1;
  final ScrollController _tableScroll = ScrollController();
  final _capacityController = TextEditingController();
  final _pageController = TextEditingController();
  final _currentPageController = TextEditingController();
  int _currentPage = 0;
  int _pageSize = 50;
  int _totalPage = 0;
  FacilityContainerDTO? _facility;
  FacilityTableStatusContainerDTO? _status;
  int _facilityId = -1;
  String? _facilityName;

  bool _orderMode = true;
  String _loadingMessage = "";

  List<FacilityContainerDTO>? _facilityList;
  String? _capacity;
  bool _isLoading = true;
  List<TableSearchData?>? _data = [];
  final Map<int,  List<TableSearchData?>?> _freeTables = HashMap();

  TextEditingController additionalCommentsBlock = TextEditingController();
  TextEditingController additionalCommentsReserve = TextEditingController();
  TextEditingController additionalCommentsClear = TextEditingController();
  TextEditingController customerNameReserve = TextEditingController();
  TextEditingController contactReserve = TextEditingController();
  TextEditingController occasionReserve = TextEditingController();
  TextEditingController fromDateReserve = TextEditingController();
  TextEditingController toDateReserve = TextEditingController();
  String selectedLocation = 'Management Block';
  final ScrollController _vControllerInside = ScrollController();
  final ScrollController _controller = ScrollController();
  String pressed = 'min';
  String pressedInPopUp = 'min';
  int selectedTableId = 0;
  int tempSelectedTableId = 0;
  var tmp = "";

  List<String> category = [];
  List<String> categoryL = [];
  List<FacilityContainerDTO>? _facilities = [];

  Future<void> getBottomActionButtonStatuses() async {

    actionButtonsAccessControl!.clear();

    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final userRoleDTO = await masterDataBL.getUserRoleById(execContext.userRoleId ?? -1);

    final http.Response response = await http.get(
      Uri.parse("https://parafaitposredesigntestapi.parafait.com/api/Transaction/TaskTypesContainer?hash=null&siteId=${execContext.siteId}&rebuildCache=false"),
      headers: {
        "Authorization" : "${execContext.webApiToken}",
        "Content-Type" : "application/json",
      },
    );
    if(response.statusCode != 200){
      print("Error");
      print("Error");
      print(json.decode(response.body)['data']);
      print("Error");
      print("Error");
    }else{
      print("Success");
      print("Success");
      print(json.decode(response.body)['data']);
      setState(() {
        category = List.generate(json.decode(response.body)['data']['TaskTypesContainerDTOList'].length,
                (index) => "("+json.decode(response.body)['data']['TaskTypesContainerDTOList'][index]['Category'].toString()+","+
                json.decode(response.body)['data']['TaskTypesContainerDTOList'][index]['TaskTypeName'].toString()+","+
                json.decode(response.body)['data']['TaskTypesContainerDTOList'][index]['DisplayInPos'].toString()+")");
        for(int i=0; i<category.length;i++){
          if(category[i].contains('TABLE FUNCTION')){
            categoryL.add(category[i]);
          }else{

          }
        }

        Iterable<ManagementFormAccessContainerDTO>? bottomButtonsAccessControl =
        userRoleDTO?.managementFormAccessContainerDTOList.where((element)
        => element.mainMenu.toLowerCase() == 'TABLE FUNCTION'.toLowerCase());

        print(bottomButtonsAccessControl);

        var buttonsB = bottomButtonsAccessControl!.forEach((element) {
          actionButtonsAccessControl!.add(element.formName);
        });
        print(actionButtonsAccessControl);

      });
      print(categoryL.toList());
      print("Success");
      print("Success");
    }
  }

  @override
  void initState() {
    super.initState();
    category = [];
    categoryL = [];
    getBottomActionButtonStatuses();
    pressed = 'min';
    tmp = "";
    pressedInPopUp = 'min';
    selectedTableId = 0;
    tempSelectedTableId = 0;
    _pageController.text = _pageSize.toString();
    _currentPageController.text = (_currentPage+1).toString();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _facility = Provider.of<SelectedFacility>(context, listen: false).selectedFacility ??
          const FacilityContainerDTO(facilityId: -1,facilityName: "All",description: "",activeFlag: false, allowMultipleBookings: false,
              externalSystemReference: "", guid: '', screenPosition: '', facilityType: -1,autoTableLayout: false,facilityTableContainerDTOList: [],
              imageFileName: '',interfaceName: -1,interfaceType: -1);
      _facilityId = _facilityId = _facility?.facilityId?? -1;
      await _initDropdownList();
      _search();
    });
    pressedRowOuterValue.value = '';
    pressedRowOuterValue.value = '';
    pressedRowInnerValue.value = '';
    pressedRowInnerValue.value = '';
    selectedOuterTableId.value = '';
    selectedInnerTableId.value = '';
    selectedOuterTableStatus.value = '';
    selectedOuterTableName.value = '';
    selectedOuterTableIdUnMerge.value = '';
    selectedLocation = 'Management Block';
    additionalCommentsBlock = TextEditingController();
    additionalCommentsReserve = TextEditingController();
    customerNameReserve = TextEditingController();
    contactReserve = TextEditingController();
    occasionReserve = TextEditingController();
    fromDateReserve = TextEditingController(text: '${DateFormat('dd-MMM-yyyy – hh:mm a').format(DateTime.now())}');
    toDateReserve = TextEditingController(text: '${DateFormat('dd-MMM-yyyy – hh:mm a').format(DateTime.now())}');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
      setNotification.value = NotificationMessage(message: MessagesProvider.get("View Occupied Table"),color:theme.footerBG4);
    });
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Column(
      children: [
        Expanded(child: Container(
          child: LayoutBuilder(
              builder : (context, constraint) {
                return
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints:
                        BoxConstraints(minHeight: constraint.maxHeight),
                        child: IntrinsicHeight(
                          child: Column(
                            children: [
                              Topbar(),
                             // const SizedBox(height: 12.0,),
                              TableFilters(
                                pageName: "occupied",
                                capacityController: _capacityController,
                                facilityValue: _facility,
                                onFacilityChange: (value){
                                  _facility = value;
                                  _facilityId = _facility?.facilityId?? -1;
                                  Log.v("object $_facilityId");
                                },
                                onStatusChange: (value){
                                  _status = value;
                                },
                                onClear: (){
                                  setState(() {
                                    _capacityController.text = "";
                                    _data = [];
                                  });
                                  //widget.onNotification!("message");
                                  // Provider.of<NotificationProvider>(context, listen: false).updateNotification(NotificationData(message : "Hello", color:Colors.blue));
                                },
                                onSearch: (){
                                  _currentPage = 0;
                                  _search();
                                },),
                              SizeConfig.isBigDevice() ? const SizedBox(height: 8.0,) : const SizedBox(height: 6.0,) ,
                              Padding(
                                padding: const EdgeInsets.only(right: 26.0),
                                child: TableListHeader(),
                              ),
                              SizeConfig.isBigDevice() ? const SizedBox(height: 8.0,) : const SizedBox(height: 6.0,) ,
                              Expanded(
                                child: Container(
                                  height: 100,
                                  child:   Scroller(
                                    controller:_tableScroll,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 26.0),
                                      child: ListView.builder(
                                          controller: _tableScroll,
                                          shrinkWrap: true,
                                          physics: const ScrollPhysics(),
                                          itemCount: _data?.length?? 0,
                                          itemBuilder: (BuildContext context,int index){
                                            return TableListItem(selectedIndex: _selectedIndex,index: index,
                                              data: _data?[index],
                                              facilityList: _facilityList,
                                              facility: _facilityName,
                                              status: "OPEN",
                                              onChange: (value){
                                                setState(() {
                                                  _selectedIndex = value;
                                                  selectedOuterTableId.value = _data![_selectedIndex]!.tableId.toString();
                                                  selectedOuterTableName.value = _data![_selectedIndex]!.tableName.toString();
                                                  selectedOuterTableIdUnMerge.value = _data![_selectedIndex]!.mergedWithTableId.toString();
                                                  selectedOuterTableStatus.value = _data![_selectedIndex]!.status.toString();
                                                  if(_orderMode){
                                                    print("tableID ${_data?[_selectedIndex]?.tableId}");
                                                    _searchOrder();
                                                  }
                                                });
                                                print('Selected Table ID : '+_data![_selectedIndex]!.tableId.toString());
                                              },);
                                          }),
                                    ),
                                  ),
                                ),
                              ),
                              BlocProvider(
                                create: (context) => FacilityBloc(

                                )..add(LoadFacilityEvent()),
                                child: BlocBuilder<FacilityBloc, FacilityState>(
                                  builder: (context, state){
                                    if(state is FacilityLoadingState){
                                      return const Center(child: CircularProgressIndicator());
                                    }
                                    if(state is FacilityLoadedState){
                                      return Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Column(
                                          children: [
                                            TablePagination(
                                              pageController: _pageController,
                                              currentPageController: _currentPageController,
                                              currentPage: _currentPage,
                                              totalPage: _totalPage,
                                              onStart: (){
                                                _currentPage = 0;
                                                _currentPageController.text = (1).toString();
                                                FocusScope.of(context).requestFocus(FocusNode());
                                                _data = _freeTables[_currentPage];
                                                setState(() {

                                                });
                                              },
                                              onPrevious: (){
                                                if(_currentPage > 0){
                                                  _currentPage--;
                                                  _currentPageController.text = (_currentPage + 1).toString();
                                                  if(_freeTables[_currentPage] == null){
                                                    _search();
                                                  }else{
                                                    _data = _freeTables[_currentPage];
                                                    setState(() {

                                                    });
                                                  }
                                                }
                                                FocusScope.of(context).requestFocus(FocusNode());
                                              },
                                              onNext: (){
                                                if((_currentPage+1) < _totalPage){
                                                  _currentPage = _currentPage+1;
                                                  _currentPageController.text = (_currentPage + 1).toString();
                                                  if(_freeTables[_currentPage] == null){
                                                    _search();
                                                  }else{
                                                    _data = _freeTables[_currentPage];
                                                    setState(() {
                                                    });
                                                  }
                                                }
                                                FocusScope.of(context).requestFocus(FocusNode());
                                              },
                                              onEnd: (){
                                                _currentPage = _totalPage -1;
                                                _currentPageController.text = (_totalPage).toString();
                                                if(_freeTables[_currentPage] == null){
                                                  _search();
                                                }else{
                                                  _data = _freeTables[_currentPage];
                                                  setState(() {

                                                  });
                                                }
                                                FocusScope.of(context).requestFocus(FocusNode());
                                              },
                                              onGo: (){
                                                if(_pageSize != int.parse(_pageController.text)){
                                                  _currentPage = 0;
                                                  _freeTables.clear();
                                                  _currentPageController.text = (1).toString();
                                                  _search();
                                                }else{
                                                  _currentPage = int.parse(_currentPageController.text) - 1;
                                                  if(_freeTables[_currentPage] == null){
                                                    _search();
                                                  }else{
                                                    _data = _freeTables[_currentPage];
                                                    setState(() {

                                                    });
                                                  }
                                                }
                                                FocusScope.of(context).requestFocus(FocusNode());
                                              },),
                                            Container(height: 1,color: theme.scrollDisabled,),
                                            const SizedBox(height: 4.0,),
                                            TableOrderMode(
                                              orderMode: _orderMode,
                                              onOrderMode: (){
                                                setState((){
                                                  _orderMode = !_orderMode;
                                                });
                                              },
                                              onRefresh: (){
                                                _search();
                                              },
                                              onMerge: (){
                                                if(!(actionButtonsAccessControl!.contains('MERGE'))){

                                                }else{
                                                  if(selectedOuterTableId.value == ''){
                                                    setNotification.value = NotificationMessage(message: MessagesProvider.get(" Please select a table to perform action "),
                                                        color: theme.footerBG3);
                                                    Future.delayed(Duration(seconds: 3),(){
                                                      setNotification.value = NotificationMessage(message: '');
                                                    });
                                                  }else{
                                                    if(selectedOuterTableStatus.value == 'BLOCKED' || selectedOuterTableStatus.value == 'RESERVED'){
                                                      setNotification.value = NotificationMessage(message: MessagesProvider.get("Operation is not allowed "),
                                                          color: theme.footerBG5);
                                                      Future.delayed(Duration(seconds: 3),(){
                                                        setNotification.value = NotificationMessage(message: '');
                                                      });
                                                    }else{
                                                      final _listRow = [];
                                                      final _listColumn = [];
                                                      final _listOfNames = [];
                                                      var ascRowList = [];
                                                      var ascColumnList = [];

                                                      Log.v(state.facilities.toString());
                                                      List<FacilityContainerDTO> facilitiesList = state.facilities;

                                                      print('TEST: ${facilitiesList.length}');
                                                      var listOfTables = facilitiesList[selectedFacilityIndex].facilityTableContainerDTOList;
                                                      print("selected facility table list length : "+listOfTables.length.toString());

                                                      for(int i=0; i < facilitiesList[selectedFacilityIndex].facilityTableContainerDTOList.length; i++){
                                                        _listRow.add(facilitiesList[selectedFacilityIndex].facilityTableContainerDTOList[i].rowIndex);
                                                        _listColumn.add(facilitiesList[selectedFacilityIndex].facilityTableContainerDTOList[i].columnIndex);
                                                        _listOfNames.add(facilitiesList[selectedFacilityIndex].facilityTableContainerDTOList[i].tableName);
                                                        print("+++++++++++++++");
                                                        print(_listRow);
                                                        print(_listColumn);
                                                        print(_listOfNames);
                                                        print(_listRow.reduce((curr, next) => curr > next? curr: next));
                                                        print(_listColumn.reduce((curr, next) => curr > next? curr: next));
                                                        print("row list length : "+_listRow.length.toString());
                                                        print("column list length : "+_listColumn.length.toString());
                                                        print(listOfTables);
                                                        print("+++++++++++++++");
                                                      }

                                                      if(_listRow.isNotEmpty && _listColumn.isNotEmpty){
                                                        ascRowList = [for(var i=0; i<(_listRow.reduce((curr, next) => curr > next? curr: next)+1); i+=1) i];
                                                        ascColumnList = [for(var i=0; i<(_listColumn.reduce((curr, next) => curr > next? curr: next)+1); i+=1) i];
                                                      }else{

                                                      }

                                                      print(" ##### "+ascRowList.toString()+" \n##### "+ascColumnList.toString()+" \n##### ");

                                                      setNotification.value = NotificationMessage(message: MessagesProvider.get("Performing table action &1 ",['Merge']),color:theme.footerBG4);
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext contextNew) {
                                                          return WillPopScope(
                                                            onWillPop: () async => false,
                                                            child: StatefulBuilder(
                                                              builder: (contextNew, setState) {
                                                                return Center(
                                                                  child: AlertDialog(
                                                                    backgroundColor: theme.backGroundColor,
                                                                    insetPadding: EdgeInsets.only(top: 40, bottom: 45,left: 0, right: 0),
                                                                    title: Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Text("Merge ${selectedOuterTableName.value.toString()} to",
                                                                          style: theme.subtitle2,
                                                                        ),
                                                                        Divider(color: theme.secondaryColor,thickness: 0.3,),
                                                                        Align(
                                                                          alignment: Alignment.centerRight,
                                                                          child: InkWell(
                                                                              onTap: (){
                                                                                showDialog(
                                                                                  context: context,
                                                                                  builder: (BuildContext context) {
                                                                                    return StatusInfoDialog(tableStatuses);
                                                                                  },
                                                                                );
                                                                              },
                                                                              child: Icon(Icons.info_outline,
                                                                                color: theme.secondaryColor,
                                                                                size: 20,)),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    content: Stack(
                                                                      children: [
                                                                        Container(
                                                                          height: MediaQuery.of(context).size.height,
                                                                          width: 500,
                                                                          child: Scroller(
                                                                            controller: _vControllerInside,
                                                                            child: ListView(
                                                                              controller: _vControllerInside,
                                                                              scrollDirection: Axis.vertical,
                                                                              children: [
                                                                                for (var j in ascRowList)
                                                                                  ValueListenableBuilder(
                                                                                      valueListenable: pressedColumnInnerValue,
                                                                                      builder: (BuildContext context, String newValue, Widget? child){
                                                                                        return ValueListenableBuilder(
                                                                                            valueListenable: pressedRowInnerValue,
                                                                                            builder: (BuildContext context, String newValue, Widget? child){
                                                                                              return Row(
                                                                                                children: [ for (var i in ascColumnList)
                                                                                                  Stack(
                                                                                                    children: [
                                                                                                      SizedBox(
                                                                                                        width: 38,
                                                                                                        height: 38,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets.all(2.0),
                                                                                                          child: InkWell(
                                                                                                            onTap: () {
                                                                                                              print("Column: $j");
                                                                                                              print("Row: $i");
                                                                                                              print(195 - (_listOfNames.length));
                                                                                                              setState((){
                                                                                                                selectedTableId = j; tempSelectedTableId = i;
                                                                                                                tmp = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                    element.columnIndex == i).tableId.toString();
                                                                                                                selectedInnerTableId.value = '$tmp';
                                                                                                              });
                                                                                                              pressedRowInnerValue.value = "$i";
                                                                                                              pressedColumnInnerValue.value = "$j";

                                                                                                              print("selectedTableId Outer & selectedTableId Inner : "+selectedOuterTableId.value+" & "+selectedInnerTableId.value);
                                                                                                              print("%%%%%%%%%%"+listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                  element.columnIndex == i).tableName.toString());
                                                                                                            },
                                                                                                            child: (pressedColumnInnerValue.value == "$j" && pressedRowInnerValue.value == "$i") ||
                                                                                                                (pressedColumnOuterValue.value == "$j" && pressedRowOuterValue.value == "$i") ? Container(
                                                                                                              height: 20,
                                                                                                              width: 20,
                                                                                                              color: Color.fromRGBO(
                                                                                                                  int.parse((listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i).facilityTableCurrentStatusDTO!.color.toString()).split(",")[0]),
                                                                                                                  int.parse((listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i).facilityTableCurrentStatusDTO!.color.toString()).split(",")[1]),
                                                                                                                  int.parse((listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i).facilityTableCurrentStatusDTO!.color.toString()).split(",")[2]), 1).withOpacity(0.3),
                                                                                                              child: Center(
                                                                                                                child: Text(listOfTables.any((element) => element.rowIndex == j &&
                                                                                                                    element.columnIndex == i) ? listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                    element.columnIndex == i).tableName : "",
                                                                                                                  style: theme.descriptionLight2,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ) :
                                                                                                            Container(
                                                                                                              height: 20,
                                                                                                              width: 20,
                                                                                                              color: (listOfTables.any((element) => element.rowIndex == j &&
                                                                                                                  element.columnIndex == i)) ? Color.fromRGBO(
                                                                                                                  int.parse((listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i).facilityTableCurrentStatusDTO!.color.toString()).split(",")[0]),
                                                                                                                  int.parse((listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i).facilityTableCurrentStatusDTO!.color.toString()).split(",")[1]),
                                                                                                                  int.parse((listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i).facilityTableCurrentStatusDTO!.color.toString()).split(",")[2]), 1)
                                                                                                                  : theme.backGroundColor,
                                                                                                              child: Center(
                                                                                                                child: Text(listOfTables.any((element) => element.rowIndex == j &&
                                                                                                                    element.columnIndex == i) ? listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                    element.columnIndex == i).tableName : "",
                                                                                                                  style: theme.descriptionLight2,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsets.only(top: 5, left: 30),
                                                                                                        child: Align(
                                                                                                          alignment: Alignment.topRight,
                                                                                                          child: Text(listOfTables.any((element) => element.rowIndex == j &&
                                                                                                              element.columnIndex == i) ? listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                              element.columnIndex == i).facilityTableCurrentStatusDTO!.character.toString() : "",
                                                                                                            style: theme.descriptionLight4,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),//column

                                                                                                ],
                                                                                              );
                                                                                            }
                                                                                        );
                                                                                      }
                                                                                  ),//Row
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    actions: [
                                                                      Divider(color: theme.secondaryColor,thickness: 0.3,),
                                                                      Row(
                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                        children: [
                                                                          InkWell(
                                                                            onTap: (){
                                                                              setState((){
                                                                                selectedOuterTableId.value = '';
                                                                                pressedRowOuterValue.value = '';
                                                                                pressedColumnOuterValue.value = '';
                                                                                showOrderModeButtons = false;
                                                                              });
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                            child: Container(
                                                                              width: 80,
                                                                              height: 30,
                                                                              decoration: BoxDecoration(
                                                                                  color: theme.button1BG1,
                                                                                  borderRadius: BorderRadius.all(Radius.circular(5))
                                                                              ),
                                                                              child: Center(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(5.0),
                                                                                  child: Text("CANCEL",
                                                                                    textAlign: TextAlign.center,
                                                                                    style: theme.heading5!,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(width: 10,),
                                                                          InkWell(
                                                                            onTap: (){
                                                                              Navigator.of(context).pop();
                                                                              mergeTables(theme);
                                                                            },
                                                                            child: Container(
                                                                              width: 80,
                                                                              height: 30,
                                                                              decoration: BoxDecoration(
                                                                                  color: theme.button2InnerShadow1,
                                                                                  borderRadius: BorderRadius.all(Radius.circular(5))
                                                                              ),
                                                                              child: Center(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(5.0),
                                                                                  child: Text("OK",
                                                                                    textAlign: TextAlign.center,
                                                                                    style: theme.headingLight5!.copyWith(color: theme.light1),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    }
                                                  }
                                                }
                                              },
                                              onUnmerge: (){
                                                if(!(actionButtonsAccessControl!.contains('UNMERGE'))){

                                                }else{
                                                  setNotification.value = NotificationMessage(message: MessagesProvider.get("Operation is not allowed "),
                                                      color: theme.footerBG5);
                                                  Future.delayed(Duration(seconds: 3),(){
                                                    setNotification.value = NotificationMessage(message: '');
                                                  });
                                                }
                                              },
                                              onMove : () async {
                                                if(!(actionButtonsAccessControl!.contains('MOVE'))){

                                                }else{
                                                  setNotification.value = NotificationMessage(
                                                      message: MessagesProvider.get('Performing table action &1 ',['MOVE']),
                                                      color: theme.footerBG4);
                                                  print("ID : "+selectedOuterTableId.value);
                                                  print("selectedOuterTableStatus.value : "+selectedOuterTableStatus.value);
                                                  final execContextBL = await ExecutionContextBuilder.build();
                                                  final execContext = execContextBL.getExecutionContext();
                                                  final masterDataBL = await MasterDataBuilder.build(execContext!);
                                                  final orderDataBL = await OrdersDataBuilder.build(execContext);
                                                  //OO.notificationBarStatus.value = '';
                                                  final http.Response response = await http.get(
                                                    Uri.parse("https://parafaitposredesigntestapi.parafait.com/api/Transaction/OrdersCount?tableId=${selectedOuterTableId.value.toString()}"),
                                                    headers: {
                                                      "Authorization" : "${execContext.webApiToken}",
                                                      "Content-Type" : "application/json",
                                                    },
                                                  );
                                                  if(response.statusCode != 200){
                                                    //showLoading = false;
                                                    print("Error");
                                                    print("Error");
                                                    print(json.decode(response.body)['data']);
                                                    Future.delayed(Duration(seconds: 3),(){
                                                      pressedRowOuterValue.value = '';
                                                      pressedRowOuterValue.value = '';
                                                      pressedRowInnerValue.value = '';
                                                      pressedRowInnerValue.value = '';
                                                      selectedOuterTableId.value = '';
                                                      selectedInnerTableId.value = '';
                                                      refreshScreen.value = '';
                                                      setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
                                                    });
                                                    print("Error");
                                                    print("Error");
                                                  }else{
                                                    print("Success");
                                                    print("Success");
                                                    print(json.decode(response.body)['data']);

                                                    if(int.parse(json.decode(response.body)['data'].toString()) <= 1){
                                                      //print("Fresh Order, Redirect to Sales Screen");
                                                      final execContextBL = await ExecutionContextBuilder.build();
                                                      final execContext = execContextBL.getExecutionContext();
                                                      final masterDataBL = await MasterDataBuilder.build(execContext!);
                                                      final orderDataBL = await OrdersDataBuilder.build(execContext);
                                                      //OO.notificationBarStatus.value = '';
                                                      final http.Response response = await http.get(
                                                        Uri.parse("https://parafaitposredesigntestapi.parafait.com/api/Transaction/OrderHeaderView?tableId=${selectedOuterTableId.value.toString()}&orderStatusInList=ORDERED,INITIATED"),
                                                        headers: {
                                                          "Authorization" : "${execContext.webApiToken}",
                                                          "Content-Type" : "application/json",
                                                        },
                                                      );
                                                      if(response.statusCode != 200){
                                                        //showLoading = false;
                                                        print("Error");
                                                        print("Error");
                                                        print(json.decode(response.body)['data']);
                                                        Future.delayed(Duration(seconds: 3),(){
                                                          pressedRowOuterValue.value = '';
                                                          pressedRowOuterValue.value = '';
                                                          pressedRowInnerValue.value = '';
                                                          pressedRowInnerValue.value = '';
                                                          selectedOuterTableId.value = '';
                                                          selectedInnerTableId.value = '';
                                                          refreshScreen.value = '';
                                                          setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
                                                        });
                                                        print("Error");
                                                        print("Error");
                                                      }else{
                                                        print("Success");
                                                        print("Success");
                                                        print(json.decode(response.body)['data']);
                                                        //setState(() {
                                                        orderIdForMoveSingle = json.decode(response.body)['data'][0]['OrderId'].toString();
                                                        transactionIdForOngoingOrder = json.decode(response.body)['data'][0]['TransactionId'];
                                                        //});
                                                        //getTransactionData();
                                                        Future.delayed(Duration(seconds: 2),(){
                                                          setNotification.value = NotificationMessage(message: 'Performing table action Move',color:AppColors.notificationBGLightBlueColor);
                                                          Future.delayed(Duration(seconds: 3),(){
                                                            setState(() {
                                                              setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
                                                            });
                                                          });
                                                          //showLoading = false;
                                                          showDialog(
                                                            context: context,
                                                            builder: (BuildContext contextNew) {
                                                              return WillPopScope(
                                                                onWillPop: () async => false,
                                                                child: StatefulBuilder(
                                                                  builder: (contextNew, setState) {
                                                                    return Center(
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.only(bottom: 60,left: 10,right: 10,top: 10),
                                                                        child: TableSeatLayoutMove(),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              );
                                                            },
                                                          ).whenComplete(() => _search());
                                                        });
                                                        print("Retrieving transaction data for ID : "+transactionIdForOngoingOrder.toString());
                                                        print("Success");
                                                        print("Success");
                                                      }
                                                    }else{
                                                      //showLoading = false;
                                                      //print("More than 1 orders, open pop up & show list of Orders");
                                                      orderIdFromAllOrdersScreen.value = '';
                                                      transactionIdFromAllOrdersScreen.value = '';
                                                      moveOperationFromAllOrdersScreen.value = '';
                                                      showDialog(context: context, builder: (_) {
                                                        return WillPopScope(
                                                          onWillPop: () async => false,
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 16,right: 16.0, top: 12,bottom: 60),
                                                            child: AllOrdersScreen(
                                                              tableId: int.parse(selectedOuterTableId.value.toString()),
                                                              operation: 'MOVE',
                                                            ),
                                                          ),
                                                        );
                                                      }).whenComplete((){
                                                        print("OrderId from AllOrdersScreen : "+orderIdFromAllOrdersScreen.value.toString());
                                                        print("TransactionId from AllOrdersScreen : "+transactionIdFromAllOrdersScreen.value.toString());
                                                        print("Operation : "+moveOperationFromAllOrdersScreen.value.toString());
                                                        if(orderIdFromAllOrdersScreen.value.isNotEmpty){
                                                          setState(() {
                                                            orderIdForMoveSingle = orderIdFromAllOrdersScreen.value.toString();
                                                          });
                                                          if(moveOperationFromAllOrdersScreen.value == 'OnlyMoveOrderToTable'){
                                                            showDialog(
                                                              context: context,
                                                              builder: (BuildContext contextNew) {
                                                                return WillPopScope(
                                                                  onWillPop: () async => false,
                                                                  child: StatefulBuilder(
                                                                    builder: (contextNew, setState) {
                                                                      return Center(
                                                                        child: Padding(
                                                                          padding: const EdgeInsets.only(bottom: 60,left: 10,right: 10,top: 10),
                                                                          child: TableSeatLayoutMove(),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                            ).whenComplete((){
                                                              _search();
                                                              print("OrderId from AllOrdersScreen : "+orderIdFromAllOrdersScreen.value.toString());
                                                              print("TransactionId from AllOrdersScreen : "+transactionIdFromAllOrdersScreen.value.toString());
                                                              print("Operation : "+moveOperationFromAllOrdersScreen.value.toString());
                                                            });
                                                          }else{
                                                            showDialog(
                                                              context: context,
                                                              builder: (BuildContext contextNew) {
                                                                return WillPopScope(
                                                                  onWillPop: () async => false,
                                                                  child: StatefulBuilder(
                                                                    builder: (contextNew, setState) {
                                                                      return Center(
                                                                        child: Padding(
                                                                          padding: const EdgeInsets.only(bottom: 60,left: 10,right: 10,top: 10),
                                                                          child: TableSeatLayoutMove(),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                            ).whenComplete((){
                                                              _search();
                                                              print("OrderId from AllOrdersScreen : "+orderIdFromAllOrdersScreen.value.toString());
                                                              print("TransactionId from AllOrdersScreen : "+transactionIdFromAllOrdersScreen.value.toString());
                                                              print("Operation : "+moveOperationFromAllOrdersScreen.value.toString());
                                                            });
                                                          }
                                                        }
                                                      });
                                                      //getOrderHeadViewList();
                                                    }

                                                    print("Success");
                                                    print("Success");
                                                  }
                                                }
                                              },
                                              onDetails: (){
                                                if(!(actionButtonsAccessControl!.contains('DETAILS'))){

                                                }else{
                                                  setNotification.value = NotificationMessage(message: MessagesProvider.get("Operation is not allowed "),
                                                      color: theme.footerBG5);
                                                  Future.delayed(Duration(seconds: 3),(){
                                                    setNotification.value = NotificationMessage(message: '');
                                                  });
                                                }
                                              },
                                              onReserve: (){
                                                if(!(actionButtonsAccessControl!.contains('RESERVE'))){

                                                }else{
                                                  setNotification.value = NotificationMessage(message: MessagesProvider.get("Operation is not allowed "),
                                                      color: theme.footerBG5);
                                                  Future.delayed(Duration(seconds: 3),(){
                                                    setNotification.value = NotificationMessage(message: '');
                                                  });
                                                }
                                              },
                                              onBlock: (){
                                                if(!(actionButtonsAccessControl!.contains('BLOCK'))){

                                                }else{
                                                  setNotification.value = NotificationMessage(message: MessagesProvider.get("Operation is not allowed "),
                                                      color: theme.footerBG5);
                                                  Future.delayed(Duration(seconds: 3),(){
                                                    setNotification.value = NotificationMessage(message: '');
                                                  });
                                                }
                                              },
                                              onClear: (){
                                                if(!(actionButtonsAccessControl!.contains('CLEAR'))){

                                                }else{
                                                  setNotification.value = NotificationMessage(message: MessagesProvider.get("Operation is not allowed "),
                                                      color: theme.footerBG5);
                                                  Future.delayed(Duration(seconds: 3),(){
                                                    setNotification.value = NotificationMessage(message: '');
                                                  });
                                                }
                                              },
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                    return Container();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
              }
          ),
        ))
      ],
    ).withLoader(theme,isLoading: _isLoading, message: _loadingMessage);
  }


  void _setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }

  _search() async{
    _loadingMessage = "Loading Occupied tables";
    _setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final orderSearchBL = await OrdersDataBuilder.build(executionContextDTO!);
    var posId = executionContextDTO.machineId!;

    List<int> facilityIds = [];
    String facilityIdList = "";
    int i = 0;
    _facilities?.forEach((element) {
      facilityIds.add(element.facilityId);
      if(i==0){
        facilityIdList = "${element.facilityId}";
      }else {
        facilityIdList = "$facilityIdList,${element.facilityId}";
      }
      i++;
    });

    _capacity = _capacityController.text;
    _pageSize = int.parse(_pageController.text);

    Log.v("status code ${_status?.statusCode}");
    try{
      var response = await orderSearchBL.getTableSearchData(
          currentPage: _currentPage,
          pageSize: _pageSize,
          facilityId : _facilityId,
          facilityIdList : _facilityId == -1 ? facilityIdList: _facilityId.toString() ,
          posMachineId : -1,
          status: _status?.statusCode ?? "OCCUPIED",
          capacity: _capacity
      );

      if(response.exception == null) {
        _setLoadingStatus(false);
        // _data = response.data;
        Log.v('SEARCH ITEMS - ${response.data?.length ?? 0}');
      }
      _totalPage = orderSearchBL.getTotalPages() ?? 1;
      _freeTables.addAll({_currentPage: response.data});
      _data = _freeTables[_currentPage];
      setState(() {

      });
    }on DioError catch(error) {
      _setLoadingStatus(false);
      var errorString = error.response?.data['data'] as String?;
      Future.microtask(() => showErrorDialog(context, 'Error', errorString ?? ''));
    }
  }

  Future<void> _initDropdownList() async{
    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    var masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    var posMachines = await  masterDataBL.getPosMachines();
    var list = await masterDataBL.getFacilityTableStatus();
    final ordersDataBL = await OrdersDataBuilder.build(execContextDTO);
    _facilityList = await masterDataBL.getFacilities();

    var posId = execContextDTO.machineId!;
    var facilityIdList = [];
    posMachines?.forEach((element) {
      if(element.posMachineId == posId){
        facilityIdList = element.facilityIdList;
      }
    });

    var firstList = List<int>.generate((_facilityList?.length ?? 0), (i) => _facilityList?[i].facilityId ?? 0);
    var thirdList = firstList.toSet().intersection(facilityIdList.toSet()).toList();
    var filtered = _facilityList?.where((e) => thirdList.contains(e.facilityId)).toList();
    _facilities?.addAll(filtered as Iterable<FacilityContainerDTO>);
  }

  Future<void> mergeTables(SemnoxTheme theme) async {
    _setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final http.Response response = await http.post(
      Uri.parse("https://parafaitposredesigntestapi.parafait.com/api/Product/FacilityTable/${selectedOuterTableId.value.toString()}/Merge"),
      body: json.encode(
          {
            "MergeSourceTableId" : int.parse(selectedInnerTableId.value.toString()),
            "Reason": "reason",
            "AdditionalComments": "additionalComments",
            "ApprovalDTO": {
              "ApproverId": execContext.userPKId ?? -1,
              "Remarks": "remarks"
            }
          }
      ),
      headers: {
        "Authorization" : "${execContext.webApiToken}",
        "Content-Type" : "application/json",
      },
    );
    if(response.statusCode != 200){
      _setLoadingStatus(false);
      print("Error");
      print("Error");
      print(json.decode(response.body)['data']);
      setNotification.value = NotificationMessage(message: json.decode(response.body)['data'].toString(),color: theme.footerBG3);
      Future.delayed(Duration(seconds: 3),(){
        pressedRowOuterValue.value = '';
        pressedRowOuterValue.value = '';
        pressedRowInnerValue.value = '';
        pressedRowInnerValue.value = '';
        selectedOuterTableId.value = '';
        selectedInnerTableId.value = '';
        refreshScreen.value = '';
        setNotification.value = NotificationMessage(message: '');
      });
      print("Error");
      print("Error");
    }else{
      _setLoadingStatus(false);
      print("Success");
      print("Success");
      setState(() {
        refreshScreen.value = 'true';
      });
      // Future.delayed(Duration(seconds: 2),(){
      //   refreshScreen.value = '';
      // });
      // print(json.decode(response.body)['data']);
      setNotification.value = NotificationMessage(message: 'Table successfully merged',color: theme.footerBG4);
      _search();
      Future.delayed(Duration(seconds: 3),(){
        pressedRowOuterValue.value = '';
        pressedRowOuterValue.value = '';
        pressedRowInnerValue.value = '';
        pressedRowInnerValue.value = '';
        selectedOuterTableId.value = '';
        selectedInnerTableId.value = '';
        setNotification.value = NotificationMessage(message: '');
      });
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => OrdersPage()));
      print("Success");
      print("Success");
    }
  }

  Future<void> unMergeTable(SemnoxTheme theme) async {
    _setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final http.Response response = await http.post(
      Uri.parse("https://parafaitposredesigntestapi.parafait.com/api/Product/FacilityTable/${selectedOuterTableIdUnMerge.value.toString()}/UnMerge"),
      body: json.encode(
          {
            "Reason": "reason",
            "AdditionalComments": "additionalComments",
            "ApprovalDTO": {
              "ApproverId": execContext.userPKId ?? -1,
              "Remarks": "remarks"
            }
          }
      ),
      headers: {
        "Authorization" : "${execContext.webApiToken}",
        "Content-Type" : "application/json",
      },
    );
    if(response.statusCode != 200){
      _setLoadingStatus(false);
      print("Error");
      print("Error");
      print(json.decode(response.body)['data']);
      setNotification.value = NotificationMessage(message: json.decode(response.body)['data'].toString(),color: theme.footerBG3);
      Future.delayed(Duration(seconds: 3),(){
        pressedRowOuterValue.value = '';
        pressedRowOuterValue.value = '';
        pressedRowInnerValue.value = '';
        pressedRowInnerValue.value = '';
        selectedOuterTableId.value = '';
        selectedInnerTableId.value = '';
        refreshScreen.value = '';
        setNotification.value = NotificationMessage(message: '');
      });
      print("Error");
      print("Error");
    }else{
      _setLoadingStatus(false);
      print("Success");
      print("Success");
      // // setState(() {
      // //   refreshScreen.value = 'true';
      // // });
      // // Future.delayed(Duration(seconds: 2),(){
      // //   refreshScreen.value = '';
      // // });
      // print(json.decode(response.body)['data']);
      setNotification.value = NotificationMessage(message:  MessagesProvider.get('Tables unMerged successfully '),color: theme.footerBG4);
      _search();
      Future.delayed(Duration(seconds: 3),(){
        pressedRowOuterValue.value = '';
        pressedRowOuterValue.value = '';
        pressedRowInnerValue.value = '';
        pressedRowInnerValue.value = '';
        selectedOuterTableId.value = '';
        selectedOuterTableIdUnMerge.value = '';
        selectedInnerTableId.value = '';
        setNotification.value = NotificationMessage(message: '');
      });
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => OrdersPage()));
      print("Success");
      print("Success");
    }
  }

  _openOrdersDialog(){
    showDialog(context: context, builder: (_) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16.0, top: 12,bottom: 60),
          child: AllOrdersScreen(
            tableId: _data?[_selectedIndex]?.tableId,
          ),
        ),
      );
    });
  }

  _searchOrder() async{
    _loadingMessage = MessagesProvider.get("Please Wait");
    _setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final orderSearchBL = await OrdersDataBuilder.build(executionContextDTO!);
    var masterDataBL = await MasterDataBuilder.build(executionContextDTO);

    try{
      var response = await orderSearchBL.getOrdersData(
        currentPage: _currentPage,
        pageSize: _pageSize,
        tableId: _data?[_selectedIndex]?.tableId ?? -1,
        orderId: 0,
        posMachineId: 0,
        status:  "INITIATED,ORDERED",
        tentNumber: '',
        guestContact: '',
        customerName: '',
        fromDate: '',
        toDate: '',
        staff: -1,
      );

      if(response.exception == null) {
        _setLoadingStatus(false);
        //_data = response.data;
        print('SEARCH ITEMS - ${response.data?.length ?? 0}');
      }
      if((response.data?.length ?? 0) > 1){
        _openOrdersDialog();
      }if((response.data?.length ?? 0) == 1){
       _retrieveTransaction(response.data?[0].transactionId);
      }else if ((response.data?.length ?? 0) == 0){
        _showTransactionOrderDetail();
      }
    }on DioError catch(error) {
      _setLoadingStatus(false);
      var errorString = error.response?.data['data'] as String?;
      Future.microtask(() => showErrorDialog(context, 'Error', errorString ?? ''));
    }
  }

  _retrieveTransaction(int? transactionId) async{
    _loadingMessage = MessagesProvider.get("Please Wait");
    _setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final orderSearchBL = await OrdersDataBuilder.build(executionContextDTO!);
    try{
      var response = await orderSearchBL.getTransaction(
        currentPage: 0,
        pageSize: 1,
        trxNumber: "",
        trxId: transactionId  ?? 0,
        orderNo: 0,
        posMachine:null,
        status: null,
        otp: "",
        reference:"",
        customerName:"",
        fromDate: null,
        toDate: null,
        staff: null,
        ccNumber: 0 ,
      );

      if(response.exception == null) {
        _setLoadingStatus(false);
        //_data = response.data;
        print('SEARCH ITEMS - ${response.data?.length ?? 0}');
        var len = response.data?.length ?? 0;
        if(len > 0){
          TransactionsData? data = response.data?[0];
          String jsonData = jsonEncode(data);
          retrievedData.value = jsonData;
          print("retrived ${data?.transactionLineDTOList}");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SalesScreen(transactionRetrieveData: jsonData, fromTables: true,),
            ),
          );
        }
      }

    }on DioError catch(error) {
      _setLoadingStatus(false);
      var errorString = error.response?.data['data'] as String?;
      Future.microtask(() => showErrorDialog(context, 'Error', errorString ?? ''));
    }
  }

  _showTransactionOrderDetail(){
    showDialog(
      context: context,
      builder: (BuildContext contextN) {
        return WillPopScope(
          onWillPop: () async => false,
          child: StatefulBuilder(
            builder: (contextN, setState) {
              return TD.TransactionOrderDetailsDialog(
                isUpdate: false,
                tableId: _data?[_selectedIndex]?.tableId,
                showNotification: (String value, Color color) {},
                onComplete: () {
                  _occupyTable();
                },
              );
            },
          ),
        );
      },
    );
  }

  _occupyTable() async{
    _loadingMessage = "Please wait...";
    _setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final orderSearchBL = await OrdersDataBuilder.build(executionContextDTO!);

    try{
      var response = await orderSearchBL.occupyTable(tableId: _data?[_selectedIndex]?.tableId ?? -1,
          facilityTable: FacilityTable(Reason: "Reason", AdditionalComments: "additionalComments",
              ApprovalDTO: ApproveDTO(ApproverId :  executionContextDTO.userPKId ?? -1 ,Remarks :"Remarks")));

      Log.v("response $response");
      if(response.exception == null) {
        _setLoadingStatus(false);
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => SalesScreen( fromTables: true,)));
        // Navigator.pop(context);
      }
    }on DioError catch(error) {
      _setLoadingStatus(false);
      var errorString = error.response?.data['data'] as String?;
      Future.microtask(() => showErrorDialog(context, 'Error', errorString ?? ''));
    }
  }
}