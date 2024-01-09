import 'dart:collection';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/facility_table_status_container/facility_table_status_container_dto.dart';
import 'package:master_data/models/user_role_container/management_form_access_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:orders_data/builder.dart';
import 'package:orders_data/models/facility_container/facility_container_dto.dart';
import 'package:orders_data/models/facility_table/approve_dto.dart';
import 'package:orders_data/models/facility_table/facility_table.dart';
import 'package:orders_data/models/facility_table_current_status/facility_table_current_status_dto.dart';
import 'package:orders_data/models/table_search_data/table_search_data.dart';
import 'package:orders_ui/OrdersPage.dart';
import 'package:orders_ui/Screens/TableSeatLoayoutScreen.dart';
import 'package:orders_ui/utils/AppColors.dart';
import 'package:orders_ui/utils/NotificationMessage.dart';
import 'package:orders_ui/utils/extensions.dart';
import 'package:orders_ui/widgets/ErrorDialog.dart';
import 'package:orders_ui/widgets/TableFilters.dart';
import 'package:orders_ui/widgets/TableListHeader.dart';
import 'package:orders_ui/widgets/TableListItem.dart';
import 'package:orders_ui/widgets/TableOrderMode.dart';
import 'package:orders_ui/widgets/TablePagination.dart';
import 'package:orders_ui/widgets/TopBar.dart';
import 'package:logs_data/logger.dart';
import 'package:product_config_ui/transaction_order_details_dialog/transaction_order_details_dialog.dart' as TD;
import 'package:provider/provider.dart';
import 'package:semnox_tablet_pos/SalesScreen.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:widgets_library/utils/size_config.dart';
import '../providers/SelectedFacilityProvider.dart';
import '../widgets/AllowOverride.dart';
import '../widgets/CustomerDatePicker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widgets/ReserveDialog.dart';

class UnavailableTableScreen extends StatefulWidget{
  @override
  State<UnavailableTableScreen> createState() => _UnavailableTableScreenState();
}

class _UnavailableTableScreenState extends State<UnavailableTableScreen> {
  int _selectedIndex = -1;

  final ScrollController _tableScroll = ScrollController();
  final _capacityController = TextEditingController();
  final _pageController = TextEditingController();
  final _currentPageController = TextEditingController();

  String _loadingMessage = "";

  int _currentPage = 0;
  int _pageSize = 50;
  int _totalPage = 0;
  bool _cleared = false;
  bool _orderMode = true;


  FacilityContainerDTO? _facility;
  FacilityTableStatusContainerDTO? _status;

  int _facilityId = -1;
  String? _facilityName;
  List<FacilityContainerDTO>? _facilityList;

  String? _capacity;
  bool _isLoading = true;

  List<TableSearchData?>? _data = [];
  final Map<int, List<TableSearchData?>?> _freeTables = HashMap();
  List<FacilityTableCurrentStatusDTO>? _facilityTableCurrentStatusDTO = [];
  TextEditingController _additionalCommentsBlock = TextEditingController();
  TextEditingController _additionalCommentsReserve = TextEditingController();
  TextEditingController additionalCommentsClear = TextEditingController();
  TextEditingController _customerNameReserve = TextEditingController();
  TextEditingController _contactReserve = TextEditingController();
  TextEditingController _occasionReserve = TextEditingController();
  TextEditingController _fromDateReserve = TextEditingController();
  TextEditingController _toDateReserve = TextEditingController();
  final _scrollController = ScrollController();
  Size? _screenSize;
  double _screenHeight = 0.0;
  double _screenWidth = 0.0;
  String _tableName = "";
  String selectedLocation = 'Management Block';

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
    isTablesScreenOpened.value = 'YES';
    _pageController.text = _pageSize.toString();
    _currentPageController.text = (_currentPage + 1).toString();
    _fromDateReserve = TextEditingController(text: DateFormat('dd-MMM-yyyy – hh:mm a').format(DateTime.now()));
    _toDateReserve = TextEditingController(
        text: '${DateFormat('dd-MMM-yyyy – hh:mm a').format(DateTime.now())}');
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _facility = Provider.of<SelectedFacility>(context, listen: false).selectedFacility ??
          const FacilityContainerDTO(facilityId: -1,facilityName: "All",description: "",activeFlag: false, allowMultipleBookings: false,
              externalSystemReference: "", guid: '', screenPosition: '', facilityType: -1,autoTableLayout: false,facilityTableContainerDTOList: [],
              imageFileName: '',interfaceName: -1,interfaceType: -1);
      _facilityId = _facilityId = _facility?.facilityId?? -1;
      await _initDropdownList();
      _search();
    });
    additionalCommentsClear = TextEditingController();
    selectedOuterTableIdUnMerge.value = '';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
      setNotification.value = NotificationMessage(message:MessagesProvider.get("View Unavailble Table"),
          color: theme.footerBG4);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    isTablesScreenOpened.value = 'POPPED';
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Column(
      children: [
        Expanded(child:
        Container(
          color: theme.backGroundColor,
          child: LayoutBuilder(
              builder: (context, constraint) {
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
                                pageName: "unavailable",
                                cleared: _cleared,
                                capacityController: _capacityController,
                                facilityValue: _facility,
                                onFacilityChange: (value) {
                                  _facility = value;
                                  _facilityId = _facility?.facilityId ?? -1;
                                  Log.v("object $_facilityId");
                                },
                                onStatusChange: (value) {
                                  setState(() {
                                    _status = value;
                                    _cleared = false;
                                  });
                                },
                                onClear: () {
                                  setState(() {
                                    _capacityController.text = "";
                                    _data = [];
                                    _cleared = true;
                                  });
                                },
                                onSearch: () {
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
                                  child: Scroller(
                                    controller: _tableScroll,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 26.0),
                                      child: ListView.builder(
                                          controller: _tableScroll,
                                          shrinkWrap: true,
                                          physics: const ScrollPhysics(),
                                          itemCount: _data?.length ?? 0,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return TableListItem(
                                              selectedIndex: _selectedIndex,
                                              index: index,
                                              data: _data?[index],
                                              facilityList: _facilityList,
                                              facility: _facilityName,
                                              status: "OPEN",
                                              onChange: (value) {
                                                setState(() {
                                                  _selectedIndex = value;
                                                  selectedOuterTableId.value =
                                                      _data![_selectedIndex]!
                                                          .tableId.toString();
                                                  selectedOuterTableIdUnMerge
                                                      .value =
                                                      _data![_selectedIndex]!
                                                          .mergedWithTableId
                                                          .toString();
                                                  selectedOuterTableStatus.value =
                                                      _data![_selectedIndex]!
                                                          .status.toString();
                                                  if (_orderMode) {
                                                    if (_data?[_selectedIndex]
                                                        ?.tableCurrentStatus ==
                                                        "MERGED") {
                                                      setNotification.value =
                                                          NotificationMessage(
                                                              message: MessagesProvider
                                                                  .get("Operation is not allowed "),
                                                              color: theme.footerBG5);
                                                    } else
                                                    if (_data?[_selectedIndex]?.tableCurrentStatus == "RESERVED" ||
                                                        _data?[_selectedIndex]?.tableCurrentStatus == "BLOCKED") {
                                                      showDialog(context: context,
                                                          barrierDismissible: false,
                                                          builder: (_) =>
                                                              AllowOverride(
                                                                status: _data?[_selectedIndex]
                                                                    ?.tableCurrentStatus,
                                                                onOk: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                  _showTransactionOrderDetail();
                                                                },)).whenComplete(() async {
                                                        _loadingMessage = "Loading unavailable tables";
                                                        _setLoadingStatus(true);
                                                        final execContextBL = await ExecutionContextBuilder.build();
                                                        final executionContextDTO = execContextBL.getExecutionContext();
                                                        final orderSearchBL = await OrdersDataBuilder.build(executionContextDTO!);

                                                        _capacity = _capacityController.text;
                                                        _pageSize = int.parse(_pageController.text);
                                                        var status = "BLOCKED,RESERVED,MERGED";
                                                        var s = _status?.statusCode ?? "";
                                                        if (s == "All") {
                                                          status = "BLOCKED,RESERVED,MERGED";
                                                        }
                                                        else {
                                                          status = _status?.statusCode ?? "BLOCKED,RESERVED,MERGED";
                                                        }
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

                                                        try {
                                                          var response = await orderSearchBL.getTableSearchData(
                                                              currentPage: _currentPage,
                                                              pageSize: _pageSize,
                                                              facilityId : _facilityId,
                                                              facilityIdList : _facilityId == -1 ? facilityIdList: _facilityId.toString() ,  status: status,
                                                              capacity: _capacity,
                                                              posMachineId: -1
                                                          );

                                                          if (response.exception == null) {
                                                            _setLoadingStatus(false);
                                                            // _data = response.data;
                                                            Log.v('SEARCH ITEMS - ${response.data?.length ?? 0}');
                                                          }
                                                          _totalPage = orderSearchBL.getTotalPages() ?? 1;
                                                          _freeTables.addAll({_currentPage: response.data});
                                                          _data = _freeTables[_currentPage];
                                                          setState(() {

                                                          });
                                                        } on DioError catch (error) {
                                                          _setLoadingStatus(false);
                                                          var errorString = error.response?.data['data'] as String?;
                                                          Future.microtask(() =>
                                                              showErrorDialog(context, 'Error', errorString ?? ''));
                                                        }
                                                      });
                                                    } else {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              SalesScreen( fromTables: true,),
                                                        ),
                                                      ).whenComplete((){
                                                        _search();
                                                      });
                                                    }
                                                  }
                                                });
                                                print('Selected Table ID : ' +
                                                    _data![_selectedIndex]!
                                                        .tableId.toString());
                                              },);
                                          }),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  children: [
                                    TablePagination(
                                      pageController: _pageController,
                                      currentPageController: _currentPageController,
                                      currentPage: _currentPage,
                                      totalPage: _totalPage,
                                      onStart: () {
                                        _currentPage = 0;
                                        _currentPageController.text =
                                            (1).toString();
                                        FocusScope.of(context).requestFocus(
                                            FocusNode());
                                        _data = _freeTables[_currentPage];
                                        setState(() {

                                        });
                                      },
                                      onPrevious: () {
                                        if (_currentPage > 0) {
                                          _currentPage--;
                                          _currentPageController.text =
                                              (_currentPage + 1).toString();
                                          if (_freeTables[_currentPage] == null) {
                                            _search();
                                          } else {
                                            _data = _freeTables[_currentPage];
                                            setState(() {

                                            });
                                          }
                                        }
                                        FocusScope.of(context).requestFocus(
                                            FocusNode());
                                      },
                                      onNext: () {
                                        if ((_currentPage + 1) < _totalPage) {
                                          _currentPage = _currentPage + 1;
                                          ;
                                          _currentPageController.text =
                                              (_currentPage + 1).toString();
                                          if (_freeTables[_currentPage] == null) {
                                            _search();
                                          } else {
                                            _data = _freeTables[_currentPage];
                                            setState(() {});
                                          }
                                        }
                                        FocusScope.of(context).requestFocus(
                                            FocusNode());
                                      },
                                      onEnd: () {
                                        _currentPage = _totalPage - 1;
                                        _currentPageController.text =
                                            (_totalPage).toString();
                                        if (_freeTables[_currentPage] == null) {
                                          _search();
                                        } else {
                                          _data = _freeTables[_currentPage];
                                          setState(() {

                                          });
                                        }
                                        FocusScope.of(context).requestFocus(
                                            FocusNode());
                                      },
                                      onGo: () {
                                        if (_pageSize !=
                                            int.parse(_pageController.text)) {
                                          _currentPage = 0;
                                          _freeTables.clear();
                                          _currentPageController.text =
                                              (1).toString();
                                          _search();
                                        } else {
                                          _currentPage = int.parse(
                                              _currentPageController.text) - 1;
                                          if (_freeTables[_currentPage] == null) {
                                            _search();
                                          } else {
                                            _data = _freeTables[_currentPage];
                                            setState(() {

                                            });
                                          }
                                        }
                                        FocusScope.of(context).requestFocus(
                                            FocusNode());
                                      },),
                                    Container(height: 1, color: theme.scrollDisabled,),
                                    const SizedBox(height: 4.0,),
                                    TableOrderMode(
                                      orderMode: _orderMode,
                                      onOrderMode: () {
                                        setState(() {
                                          _orderMode = !_orderMode;
                                        });
                                      },
                                      onRefresh: () {
                                        _search();
                                      },
                                      onMerge: () {
                                        if(!(actionButtonsAccessControl!.contains('MERGE'))){

                                        }else{
                                          setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Operation is not allowed"),
                                              color: AppColors.notificationBGLightYellowColor);
                                        }
                                      },
                                      onUnmerge: () {
                                        if(!(actionButtonsAccessControl!.contains('UNMERGE'))){

                                        }else{
                                          setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Operation is not allowed"),
                                              color: AppColors.notificationBGLightYellowColor);
                                        }
                                      },
                                      onMove: () {
                                        if(!(actionButtonsAccessControl!.contains('MOVE'))){

                                        }else{
                                          setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Operation is not allowed"),
                                              color: AppColors.notificationBGLightYellowColor);
                                        }
                                      },
                                      onDetails: () {
                                        if(!(actionButtonsAccessControl!.contains('DETAILS'))){

                                        }else{
                                          if (_data?[_selectedIndex]?.tableCurrentStatus == "RESERVED") {
                                            _showReserveDialog(theme);
                                          } else if (_data?[_selectedIndex]?.tableCurrentStatus == "BLOCKED") {
                                            _showBlockDialog(theme);
                                          } else {
                                            setNotification.value =
                                                NotificationMessage(
                                                    message:MessagesProvider.get("Operation is not allowed "),
                                                    color: theme.footerBG5);
                                            Future.delayed(
                                                Duration(seconds: 3), () {
                                              setNotification.value = NotificationMessage(message: '');
                                            });
                                          }
                                        }
                                      },
                                      onReserve: () {
                                        if(!(actionButtonsAccessControl!.contains('RESERVE'))){

                                        }else{
                                          setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Operation is not allowed"),
                                              color: AppColors.notificationBGLightYellowColor);
                                        }
                                      },
                                      onBlock: () {
                                        if(!(actionButtonsAccessControl!.contains('BLOCK'))){

                                        }else{
                                          setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Operation is not allowed"),
                                              color: AppColors.notificationBGLightYellowColor);
                                        }
                                      },
                                      onClear: () {
                                        if(!(actionButtonsAccessControl!.contains('CLEAR'))){

                                        }else{
                                          if (selectedOuterTableId.value == '') {
                                            setNotification.value =
                                                NotificationMessage(
                                                    message: MessagesProvider.get(" Please select a table to perform action "),
                                                    color: theme.footerBG3);
                                            Future.delayed(
                                                Duration(seconds: 3), () {
                                              setNotification.value =
                                                  NotificationMessage(message: '');
                                            });
                                          } else {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                _screenSize = MediaQuery
                                                    .of(context)
                                                    .size;
                                                _screenHeight = _screenSize!.height;
                                                _screenWidth = _screenSize!.width;
                                                return WillPopScope(
                                                  onWillPop: () async => false,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 30,
                                                        left: 30,
                                                        right: 30,
                                                        bottom: 60),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      child: Stack(
                                                        children: [
                                                          Scaffold(
                                                            resizeToAvoidBottomInset: false,
                                                            backgroundColor: Colors.transparent,
                                                            body: Container(
                                                              decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius
                                                                    .all(
                                                                    Radius.circular(
                                                                        8)),
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                    .all(0.0),
                                                                child: CustomScrollView(
                                                                  controller: _scrollController,
                                                                  //Instead of ListView or SingleChildScrollView put CustomScrollVIew to use Expanded or spacer
                                                                  slivers: [
                                                                    SliverFillRemaining(
                                                                      hasScrollBody: false,
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment
                                                                            .start,
                                                                        children: [
                                                                          Container(
                                                                            width: 200,
                                                                            height: 50,
                                                                            child: InkWell(
                                                                              onTap: () {
                                                                                Navigator
                                                                                    .pop(
                                                                                    context);
                                                                              },
                                                                              child: Container(
                                                                                decoration: const BoxDecoration(
                                                                                    color: Colors
                                                                                        .black,
                                                                                    borderRadius: BorderRadius
                                                                                        .only(
                                                                                        bottomRight: Radius
                                                                                            .circular(
                                                                                            8),
                                                                                        topLeft: Radius
                                                                                            .circular(
                                                                                            8))),
                                                                                constraints: const BoxConstraints(
                                                                                  minHeight: double
                                                                                      .infinity,
                                                                                  maxHeight: double
                                                                                      .infinity,
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets
                                                                                      .only(
                                                                                      left: 21.0,
                                                                                      right: 20),
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment
                                                                                        .center,
                                                                                    children: [
                                                                                      const Icon(
                                                                                        Icons
                                                                                            .arrow_back_ios,
                                                                                        color: Colors
                                                                                            .white,
                                                                                        size: 24,
                                                                                      ),
                                                                                      const SizedBox(
                                                                                        width: 29,),
                                                                                      Text(
                                                                                        "Clear Table ${selectedOuterTableName
                                                                                            .value
                                                                                            .toString()}",
                                                                                        textAlign: TextAlign
                                                                                            .center,
                                                                                        style: GoogleFonts
                                                                                            .robotoCondensed(
                                                                                            color: Colors
                                                                                                .white,
                                                                                            fontSize: 14,
                                                                                            fontWeight: FontWeight
                                                                                                .w600
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            height: 0.5,
                                                                            width: double
                                                                                .infinity,
                                                                            color: Colors
                                                                                .grey
                                                                                .shade300,
                                                                          ),
                                                                          const SizedBox(
                                                                            height: 20,),
                                                                          Padding(
                                                                            padding: const EdgeInsets
                                                                                .only(
                                                                                left: 40),
                                                                            child: Container(
                                                                              width: 300,
                                                                              child: Column(
                                                                                mainAxisAlignment: MainAxisAlignment
                                                                                    .start,
                                                                                crossAxisAlignment: CrossAxisAlignment
                                                                                    .start,
                                                                                children: [
                                                                                  Text(
                                                                                    "Additional Comments",
                                                                                    textAlign: TextAlign
                                                                                        .center,
                                                                                    style: GoogleFonts
                                                                                        .robotoCondensed(
                                                                                      color: Colors
                                                                                          .black,
                                                                                      fontSize: 16.0,
                                                                                      fontWeight: FontWeight
                                                                                          .w700,
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    height: 10,),
                                                                                  TextFormField(
                                                                                    controller: additionalCommentsClear,
                                                                                    decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        contentPadding: const EdgeInsets
                                                                                            .fromLTRB(
                                                                                            10,
                                                                                            10,
                                                                                            10,
                                                                                            10),
                                                                                        border: OutlineInputBorder(
                                                                                          borderRadius: BorderRadius
                                                                                              .circular(
                                                                                              10.0),
                                                                                        ),
                                                                                        hintText: 'Additional Comments',
                                                                                        hintStyle: GoogleFonts
                                                                                            .robotoCondensed(
                                                                                          color: Colors
                                                                                              .grey,
                                                                                          fontSize: 14,
                                                                                        ),
                                                                                        suffixIconConstraints: const BoxConstraints()
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height: 20,),
                                                                          const Spacer(),
                                                                          Container(
                                                                            height: 0.5,
                                                                            width: double
                                                                                .infinity,
                                                                            color: Colors
                                                                                .grey
                                                                                .shade300,
                                                                          ),
                                                                          const SizedBox(
                                                                            height: 20,),
                                                                          Row(
                                                                            mainAxisAlignment: MainAxisAlignment
                                                                                .center,
                                                                            crossAxisAlignment: CrossAxisAlignment
                                                                                .center,
                                                                            children: [
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Navigator
                                                                                      .of(
                                                                                      context)
                                                                                      .pop();
                                                                                },
                                                                                child: Container(
                                                                                  width: 80,
                                                                                  height: 30,
                                                                                  decoration: BoxDecoration(
                                                                                      color: Colors
                                                                                          .grey
                                                                                          .shade200,
                                                                                      borderRadius: BorderRadius
                                                                                          .all(
                                                                                          Radius
                                                                                              .circular(
                                                                                              5))
                                                                                  ),
                                                                                  child: Center(
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets
                                                                                          .all(
                                                                                          8.0),
                                                                                      child: Text(
                                                                                        "CANCEL",
                                                                                        textAlign: TextAlign
                                                                                            .center,
                                                                                        style: GoogleFonts
                                                                                            .robotoCondensed(
                                                                                            color: Colors
                                                                                                .black,
                                                                                            fontSize: 14,
                                                                                            fontWeight: FontWeight
                                                                                                .w600
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                width: 10,),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  clearTable(theme);
                                                                                  Navigator
                                                                                      .of(
                                                                                      context)
                                                                                      .pop();
                                                                                },
                                                                                child: Container(
                                                                                  width: 80,
                                                                                  height: 30,
                                                                                  decoration: BoxDecoration(
                                                                                      color: Colors.black,
                                                                                      borderRadius: BorderRadius
                                                                                          .all(
                                                                                          Radius
                                                                                              .circular(
                                                                                              5))
                                                                                  ),
                                                                                  child: Center(
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets
                                                                                          .all(
                                                                                          8.0),
                                                                                      child: Text(
                                                                                        "OK",
                                                                                        textAlign: TextAlign
                                                                                            .center,
                                                                                        style: GoogleFonts
                                                                                            .robotoCondensed(
                                                                                            color: Colors
                                                                                                .white,
                                                                                            fontSize: 14,
                                                                                            fontWeight: FontWeight
                                                                                                .w600
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const SizedBox(
                                                                            height: 20,),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          }
                                        }
                                      },
                                    )
                                  ],
                                ),
                              )
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

  _search() async {
    _loadingMessage = "Loading unavailable tables";
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
    var status = "BLOCKED,RESERVED,MERGED";
    var s = _status?.statusCode ?? "";
    if (s == "All") {
      status = "BLOCKED,RESERVED,MERGED";
    }
    else {
      status = _status?.statusCode ?? "BLOCKED,RESERVED,MERGED";
    }


    try {
      var response = await orderSearchBL.getTableSearchData(
          currentPage: _currentPage,
          pageSize: _pageSize,
          facilityId : _facilityId,
          facilityIdList : _facilityId == -1 ? facilityIdList: _facilityId.toString() ,
          posMachineId : -1,
          status: status,
          capacity: _capacity
      );

      if (response.exception == null) {
        _setLoadingStatus(false);
        // _data = response.data;
        Log.v('SEARCH ITEMS - ${response.data?.length ?? 0}');
      }
      _totalPage = orderSearchBL.getTotalPages() ?? 1;
      _freeTables.addAll({_currentPage: response.data});
      _data = _freeTables[_currentPage];
      setState(() {

      });
    } on DioError catch (error) {
      _setLoadingStatus(false);
      var errorString = error.response?.data['data'] as String?;
      Future.microtask(() =>
          showErrorDialog(context, 'Error', errorString ?? ''));
    }
  }

  Future<void> _initDropdownList() async {
    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    var masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    var posMachines = await  masterDataBL.getPosMachines();
    var list = await masterDataBL.getFacilityTableStatus();
    final ordersDataBL = await OrdersDataBuilder.build(execContextDTO);
    _facilityList = await masterDataBL.getFacilities();
    _facilityTableCurrentStatusDTO = await ordersDataBL.getFacilityTableCurrentStatuses();

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

  _findFacility() {
    if (_facilityList != null) {
      int len = _facilityList?.length ?? 0;
      for (int i = 0; i < len; i++) {
        var item = _facilityList?[i];
        if (item?.facilityId == _data?[_selectedIndex]?.facilityId) {
          // _facility = item?.facilityName;
          var len2 = item?.facilityTableContainerDTOList.length ?? 0;
          var facilityItem = item?.facilityTableContainerDTOList;
          if (len2 > 0) {
            for (int j = 0; j < len2; j++) {
              if (facilityItem?[j].tableId == _data?[_selectedIndex]?.tableId) {
                _tableName = facilityItem?[j].tableName ?? "";
                //  _capacity = facilityItem?[j].maxCheckIns ?? -1;
              }
              /* if(facilityItem?[j].tableId == _data?.mergedWithTableId){
                _mergedTableName = facilityItem?[j].tableName ?? "";
              }*/
            }
          }
        }
      }
    }
  }

  void _showReserveDialog(SemnoxTheme theme) {

    setNotification.value = NotificationMessage(
        message: MessagesProvider.get('Performing table action &1 ',['DETAILS']),
        color: theme.footerBG4);
    _fromDateReserve = TextEditingController(text: DateFormat('dd-MMM-yyyy – hh:mm a').format(DateTime.now()));
    _toDateReserve = TextEditingController(text: DateFormat('dd-MMM-yyyy – hh:mm a').format(DateTime.now()));
    _customerNameReserve.text = "";
    _contactReserve.text = "";
    _occasionReserve.text = "";
    _additionalCommentsReserve.text = "";
    FacilityTableCurrentStatusDTO details;
    _findFacility();
    //var tableStatus = _facilityTableCurrentStatusDTO?.where((element) => element.tableId.toString() == selectedOuterTableId.value);
    _facilityTableCurrentStatusDTO?.forEach((element) {
      //print("selected table status ${element.tableId} ${selectedOuterTableId.value}");
      if (element.tableId == _data?[_selectedIndex]?.tableId) {
        print("selected table statuss ${element.reserveFromTime}");
        details = element;
        _customerNameReserve.text = element.customerName;
        _contactReserve.text = element.contact;
        _occasionReserve.text = element.occasion;
        _additionalCommentsReserve.text = element.additionalComments;
        if (element.reserveFromTime != "" && !element.reserveFromTime.startsWith('000')) {
          DateFormat dateFormat = DateFormat('yyyy-MM-ddThh:mm:ss');
          var from = dateFormat.parse(element.reserveFromTime);
          _fromDateReserve.text = DateFormat('dd-MMM-yyyy  hh:mm:ss a').format(from);
        }

        if (element.reserveToTime != "" &&  !element.reserveToTime.startsWith('000')) {
          DateFormat dateFormat = DateFormat('yyyy-MM-ddThh:mm:ss');
          var from = dateFormat.parse(element.reserveToTime);
          _toDateReserve.text = DateFormat('dd-MMM-yyyy  hh:mm:ss a').format(from);
        };
      }
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        _screenSize = MediaQuery.of(context).size;
        _screenHeight = _screenSize!.height;
        _screenWidth = _screenSize!.width;
        return WillPopScope(
          onWillPop: () async => false,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 30, right: 30, bottom: 50),
            child: ReserveDialog(
              detailStatus : true,
              tableName : selectedOuterTableName.value.toString(),
              customerNameController :_customerNameReserve,
              contactController : _contactReserve,
              reserveFromDateController : _fromDateReserve,
              reserveToDateController : _toDateReserve,
              occasionController : _occasionReserve,
              additionalCommentsController : _additionalCommentsReserve,
              onHeaderClick: (){
                setState((){
                  selectedOuterTableId.value = '';
                  pressedRowOuterValue.value = '';
                  pressedColumnOuterValue.value = '';
                });
                setNotification.value = NotificationMessage(message:'', color: theme.footerBG4);
                Navigator.of(context).pop();
              },
              onOk : (){
                if (_customerNameReserve.text.isEmpty ||
                    _customerNameReserve.text.toString() == ''
                    || _contactReserve.text.isEmpty ||
                    _contactReserve.text.toString() == ''
                    || _fromDateReserve.text.isEmpty ||
                    _toDateReserve.text.isEmpty ||
                    _fromDateReserve.text.toString() == '' ||
                    _toDateReserve.text.toString() == '') {
                  setNotification.value =
                      NotificationMessage(
                          message: 'Please enter required fields!',
                          color: theme.footerBG5);
                  Future.delayed(
                      Duration(seconds: 3), () {
                    setNotification.value =
                        NotificationMessage(
                            message: '');
                  });
                } else {
                  if (_contactReserve.text.length < 10 ||
                      _contactReserve.text.length > 14) {
                    setNotification.value =
                        NotificationMessage(
                            message: 'Contact number must be in between 10 to 14 digits!',
                            color: theme.footerBG5);
                    Future.delayed(
                        Duration(seconds: 3), () {
                      setNotification.value = NotificationMessage(message: '');
                    });
                  } else {
                    Navigator.of(context).pop();
                    reserveTable(theme);
                  }
                }
              },
              onCancel: (){
                setState((){
                  selectedOuterTableId.value = '';
                  pressedRowOuterValue.value = '';
                  pressedColumnOuterValue.value = '';
                });
                setNotification.value = NotificationMessage(message:'', color: theme.footerBG4);
                Navigator.of(context).pop();
              },
            )
          ),
        );
      },
    );
  }

  void _showBlockDialog(SemnoxTheme theme) {
    setNotification.value = NotificationMessage(
            message: MessagesProvider.get('Performing table action &1 ',['DETAILS']),
            color: theme.footerBG4);
    _findFacility();
    FacilityTableCurrentStatusDTO details;
    var reasonList =  [
      'Management Block',
      'Others',
      'Blocked for Short of Staff for Service',
      'Maintenance Block',
      'Blocked for Private Party'
    ];
    selectedLocation = 'Management Block';
    _additionalCommentsBlock.text = "";
    _facilityTableCurrentStatusDTO?.forEach((element) {
      if (element.tableId == _data?[_selectedIndex]?.tableId) {
        print("selected table statuss ${element.tableId}");
        details = element;
        _additionalCommentsBlock.text = element.additionalComments;
        reasonList.forEach((item) {
          if(item == element.notes){
            selectedLocation = item;
          }
        });
      }
    });

    showDialog(
      context: context,
      builder: (BuildContext contextNew) {
        _screenSize = MediaQuery.of(context).size;
        _screenHeight = _screenSize!.height;
        _screenWidth = _screenSize!.width;
        return WillPopScope(
          onWillPop: () async => false,
          child: StatefulBuilder(
            builder: (contextNew, setState) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 30, left: 30, right: 30, bottom: 60),
                child: Material(
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      Scaffold(
                        resizeToAvoidBottomInset: true,
                        backgroundColor: Colors.transparent,
                        body: Container(
                          height: _screenHeight,
                          decoration: BoxDecoration(
                              color: theme.backGroundColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(8))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: CustomScrollView(
                              controller: _scrollController,
                              //Instead of ListView or SingleChildScrollView put CustomScrollVIew to use Expanded or spacer
                              slivers: [
                                SliverFillRemaining(
                                  hasScrollBody: false,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 50,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.only(
                                                    bottomRight: Radius.circular(
                                                        8),
                                                    topLeft: Radius.circular(8))),
                                            constraints: const BoxConstraints(
                                              minHeight: double.infinity,
                                              maxHeight: double.infinity,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 21.0, right: 20),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  const Icon(
                                                    Icons.arrow_back_ios,
                                                    color: Colors.white,
                                                    size: 24,
                                                  ),
                                                  const SizedBox(width: 29,),
                                                  Text(
                                                    "Details ${_tableName}",
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts
                                                        .robotoCondensed(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight
                                                            .w600
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 0.5, width: double.infinity,
                                        color: Colors.grey.shade300,
                                      ),
                                      const SizedBox(height: 20,),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0, right: 0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          children: [
                                            Container(
                                              width: _screenWidth / 3,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text("* Reason",
                                                    textAlign: TextAlign.center,
                                                    style: theme.heading6,
                                                  ),
                                                  const SizedBox(height: 15,),
                                                  Container(
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .all(
                                                            Radius.circular(10)),
                                                        border: Border.all(
                                                            color: theme.secondaryColor!,
                                                            width: 0.4)
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .only(left: 5,
                                                          top: 5,
                                                          bottom: 5,right: 5),
                                                      child: DropdownButton(
                                                        hint: Text(
                                                            'Please choose a location'),
                                                        // Not necessary for Option 1
                                                        value: selectedLocation,
                                                        underline: Container(),
                                                        icon: Container(),
                                                        onChanged: (newValue) {
                                                          setState(() {
                                                            selectedLocation =
                                                                newValue
                                                                    .toString();
                                                          });
                                                        },
                                                        items: reasonList.map((location) {
                                                          return DropdownMenuItem(
                                                            child: Text(location),
                                                            value: location,
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 20,),
                                            Container(
                                              width: _screenWidth / 3,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text( MessagesProvider.get('Additional comments'),
                                                    textAlign: TextAlign.center,
                                                    style: theme.heading6,
                                                  ),
                                                  const SizedBox(height: 10,),
                                                  TextFormField(
                                                    controller: _additionalCommentsBlock,
                                                    decoration: InputDecoration(
                                                        isDense: true,
                                                        contentPadding: const EdgeInsets
                                                            .fromLTRB(
                                                            10, 10, 10, 10),
                                                        border: OutlineInputBorder(
                                                          borderRadius: BorderRadius
                                                              .circular(10.0),
                                                        ),
                                                        hintText: MessagesProvider.get('Additional comments'),
                                                        hintStyle: GoogleFonts
                                                            .robotoCondensed(
                                                          color: Colors.grey,
                                                          fontSize: 14,
                                                        ),
                                                        suffixIconConstraints: const BoxConstraints()
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 0.5, width: double.infinity,
                                        color: Colors.grey.shade300,
                                      ),
                                      const SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setNotification.value = NotificationMessage(message:'', color: Colors.white);
                                              Navigator.of(context).pop();
                                            },
                                            child: Container(
                                              width: 80,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade200,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(5))
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      8.0),
                                                  child: Text("CANCEL",
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts
                                                        .robotoCondensed(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight
                                                            .w600
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          InkWell(
                                            onTap: () {
                                              blockTable(theme);
                                              Navigator.of(context).pop();
                                            },
                                            child: Container(
                                              width: 80,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(5))
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      8.0),
                                                  child: Text("OK",
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts
                                                        .robotoCondensed(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight
                                                            .w600
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }


  _showTransactionOrderDetail(){
    showDialog(
      context: context,
      builder: (BuildContext contextN) {
        return WillPopScope(
          onWillPop: () async => false,
          child: StatefulBuilder(
            builder: (contextN, setState) {
              // print(_tableName+"//////////");
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
    ).whenComplete((){
      _search();
    });
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

  Future<void> clearTable(SemnoxTheme theme) async {
    _setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final http.Response response = await http.post(
      Uri.parse("https://parafaitposredesigntestapi.parafait.com/api/Product/FacilityTable/${selectedOuterTableId.value.toString()}/Clear"),
      body: json.encode(
          {
            "Reason": "reason",
            "AdditionalComments": "${additionalCommentsClear.text.toString()}",
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
      setNotification.value = NotificationMessage(message: json.decode(response.body)['data'].toString(), color: theme.footerBG3);
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
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => OrdersPage()));
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
      print(json.decode(response.body)['data']);
      setNotification.value = NotificationMessage(message: MessagesProvider.get("Table cleared successfully "),color: theme.footerBG4);
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
      // setState(() {
      //   refreshScreen.value = 'true';
      // });
      // Future.delayed(Duration(seconds: 2),(){
      //   refreshScreen.value = '';
      // });
      print(json.decode(response.body)['data']);
      setNotification.value = NotificationMessage(message: MessagesProvider.get('Tables unMerged successfully '),color: theme.footerBG4);
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

  Future<void> reserveTable(SemnoxTheme theme) async {
    _loadingMessage = "Please wait...";
    _setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final http.Response response = await http.post(
      Uri.parse("https://parafaitposredesigntestapi.parafait.com/api/Product/FacilityTable/${selectedOuterTableId.value.toString()}/Reserve"),
      body: json.encode(
          {
            "Reason": "Others",
            "AdditionalComments": _additionalCommentsReserve.text.toString(),
            "ApprovalDTO": {
              "ApproverId": execContext.userPKId ?? -1,
              "Remarks": "remarks"
            },
            "TableReservationDetailsDTO" : {
              "ReservationDetailsId" : -1,
              "FacilityTableStatusChangeLogId" : -1,
              "CustomerName" : _customerNameReserve.text.toString(),
              "AdditionalComments" : _additionalCommentsReserve.text.toString(),
              "ReserveFromTime" : _fromDateReserve.text.toString(),
              "ReserveToTime" : _toDateReserve.text.toString(),
              "Occasion" : _occasionReserve.text.toString(),
              "Contact" : _contactReserve.text.toString(),
              "IsActive" : true
            },
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
      setNotification.value = NotificationMessage(message: json.decode(response.body)['data'].toString(), color: theme.footerBG3);
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
      // setState(() {
      //   refreshScreen.value = 'true';
      // });
      // Future.delayed(Duration(seconds: 2),(){
      //   refreshScreen.value = '';
      // });
      print(json.decode(response.body)['data']);
      _selectedIndex = -1;
      _search();
      setNotification.value = NotificationMessage(message: MessagesProvider.get("Table reserved successfully "), color: theme.footerBG4);
      Future.delayed(Duration(seconds: 3),(){
        _additionalCommentsBlock.clear();
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

  Future<void> blockTable(SemnoxTheme theme) async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final http.Response response = await http.post(
      Uri.parse("https://parafaitposredesigntestapi.parafait.com/api/Product/FacilityTable/${selectedOuterTableId.value.toString()}/Block"),
      body: json.encode(
          {
            "Reason": selectedLocation.toString(), // Should be from lookup for Table Block.
            "AdditionalComments": _additionalCommentsBlock.text.toString(),
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
      print("Success");
      print("Success");
      // setState(() {
      //   refreshScreen.value = 'true';
      // });
      // Future.delayed(Duration(seconds: 2),(){
      //   refreshScreen.value = '';
      // });
      print(json.decode(response.body)['data']);
      _selectedIndex = -1;
      _search();
      setNotification.value = NotificationMessage(message: MessagesProvider.get("Table blocked successfully "), color: theme.footerBG4);
      Future.delayed(Duration(seconds: 3),(){
        _additionalCommentsBlock.clear();
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
}