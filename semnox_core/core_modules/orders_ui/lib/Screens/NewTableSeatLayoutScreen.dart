import 'dart:convert';
import 'dart:developer';
import 'package:application_prefs_data/builder.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_ui/manager_login_popup.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/user_role_container/management_form_access_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:orders_data/blocs/app_blocs.dart';
import 'package:orders_data/blocs/app_events.dart';
import 'package:orders_data/blocs/app_states.dart';
import 'package:orders_data/builder.dart';
import 'package:orders_data/models/facility_container/facility_container_dto.dart';
import 'package:orders_data/models/facility_table/approve_dto.dart';
import 'package:orders_data/models/facility_table/facility_table.dart';
import 'package:orders_data/models/facility_table_container/facility_table_container_dto.dart';
import 'package:orders_data/models/facility_table_current_status/facility_table_current_status_dto.dart';
import 'package:orders_data/models/transactions/transaction_data.dart';
import 'package:orders_ui/cubit/table_seat_layout_state.dart';
import 'package:product_config_ui/widgets/primaryLargeButton.dart';
import 'package:product_config_ui/widgets/primaryMediumButton.dart';
import 'package:product_config_ui/widgets/secondaryLargeButton.dart';
import 'package:product_config_ui/widgets/secondaryMediumButton.dart';
import 'package:semnox_tablet_pos/SalesScreen.dart';
import 'package:themes_library/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import '../OrdersPage.dart';
import '../cubit/table_seat_layout_cubit.dart';
import '../utils/AppColors.dart';
import '../utils/NotificationMessage.dart';
import '../widgets/AllowOverride.dart';
import '../widgets/ErrorDialog.dart';
import '../widgets/OrderDateForm.dart';
import '../widgets/StatusInfoDialog.dart';
import 'AllOrdersScreen.dart';
import 'TableSeatLoayoutScreen.dart';
import 'TableSeatLoayoutScreenMove.dart';
import 'package:orders_ui/widgets/TableSeatLayoutBottomActionBar.dart' as TableSeatLayoutBottomActionBarW;
import 'package:orders_ui/OrdersPage.dart' as OO;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:widgets_library/utils/size_config.dart';



class TableSeatLayoutWrapper extends StatelessWidget {
  const TableSeatLayoutWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (BuildContext context) =>
            FacilityBloc()..add(LoadFacilityEvent()),
      ),
      BlocProvider<TableSeatCubit>(
        create: (BuildContext context) => TableSeatCubit(),
      ),
    ], child: const NewTableSeatLayout());
  }
}

class NewTableSeatLayout extends StatefulWidget {
  const NewTableSeatLayout({Key? key}) : super(key: key);

  @override
  State<NewTableSeatLayout> createState() => _NewTableSeatLayoutState();
}

class _NewTableSeatLayoutState extends State<NewTableSeatLayout> {
  late TableSeatCubit tableSeatCubit;
  bool isLoading = false;
  List<FacilityContainerDTO> facilitiesList = [];
  Map<String,FacilityAccessControlDto> accessControlMap = {};
  FacilityAccessControlDto defAccessDto = FacilityAccessControlDto(isTaskEnabled: false,shouldDisplayTask: true,managerApprovalRequired: false);
  bool isInitialSelectedFirstfecility = false;
  String genericTableColor = '';


  /////////////////////////
  bool showLoading = false;
  bool showScrollBar = false;
  final ScrollController _controller = ScrollController();

  final ScrollController _controllerBottomBar = ScrollController();
  String pressed = 'min';
  String pressedInPopUp = 'min';
  int selectedTableId = 0;
  int tempSelectedTableId = 0;
  var tmp = "";
  var value1; var value2; var value3;
  var selectedRowOuterLayout = 0;
  var selectedColumnOuterLayout = 0;

  //List<FacilityTableCurrentStatusDTO>? _facilityTableCurrentStatusDTO = [];
  TextEditingController additionalCommentsBlock = TextEditingController();
  TextEditingController additionalCommentsReserve = TextEditingController();
  TextEditingController additionalCommentsClear = TextEditingController();
  TextEditingController customerNameReserve = TextEditingController();
  TextEditingController contactReserve = TextEditingController();
  TextEditingController occasionReserve = TextEditingController();
  String selectedLocation = 'Management Block';
  bool mergeStatus = false;
  bool unMergeStatus = false;
  bool moveStatus = false;
  bool detailsStatus = false;
  bool reserveStatus = false;
  bool blockStatus = false;
  bool clearStatus = false;
  bool mergeStatusM = false;
  bool unMergeStatusM = false;
  bool moveStatusM = false;
  bool detailsStatusM = false;
  bool reserveStatusM = false;
  bool blockStatusM = false;
  bool clearStatusM = false;
  NotificationBar? _notificationBar;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  final _scrollControllerMerge = ScrollController();
  Size? _screenSize;
  double _screenHeight = 0.0;
  double _screenWidth = 0.0;
  String transactionData = "";
  bool _isCurrentUserManager = true;
  int? _currentUserPkId = -1;
  int? approvedUserPkId = 0;
  String? _dateFormat;
  //static ValueNotifier<String> pressedTable = ValueNotifier('');


  //////////////////////////

  @override
  void initState() {
    super.initState();
    tableSeatCubit = context.read<TableSeatCubit>();
    isTablesScreenOpened.value = 'YES';
    fetchGenericTableColor();
    _checkCurrentUserPrivileges();
    _getConfigurations(context);
    getBottomActionButtonStatuses();
    getTableStatusesForHelpScreen1();
    getTableStatusesForHelpScreen2();
    getTableStatusesForHelpScreen3();

    transactionIdForOngoingOrder = 0;
    transactionData = "";
    additionalCommentsBlock = TextEditingController();
    additionalCommentsReserve = TextEditingController();
    customerNameReserve = TextEditingController();
    contactReserve = TextEditingController();
    occasionReserve = TextEditingController();
    fromDateReserve = TextEditingController(text: '${DateFormat('dd-MMM-yyyy – hh:mm a').format(DateTime.now())}');
    toDateReserve = TextEditingController(text: '${DateFormat('dd-MMM-yyyy – hh:mm a').format(DateTime.now())}');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
      setNotification.value = NotificationMessage(message: "View All Tables",
          color: theme.footerBG4);
    });
    setState((){
      isTablesScreenOpened.value = 'YES';
      pickedDateFrom = null;
      pickedDateTo = null;
      approvedUserPkId = 0;
      showLoading = false;
      orderIdForMoveSingle = '';
      mergeStatus = true;unMergeStatus = true;moveStatus = true;
      detailsStatus = true;reserveStatus = true;blockStatus = true;
      clearStatus = true;
      mergeStatusM = false;unMergeStatusM = false;moveStatusM = false;
      detailsStatusM = false;reserveStatusM = false;blockStatusM = false;
      clearStatusM = false;
      tableStatuses = [];
      tableStatuses1 = [];tableStatuses2 = [];tableStatuses3 = [];
      fromDateReserve.text = '${DateFormat('dd-MMM-yyyy – hh:mm a').format(DateTime.now())}';
      toDateReserve.text = '${DateFormat('dd-MMM-yyyy – hh:mm a').format(DateTime.now())}';
      showBottomActionBar.value = 'true';
      selectedFacilityName.value = '';
      signalForOpenMoveTablePopUp.value = '';
      moveOperationFromAllOrdersScreen.value = '';
      transactionIdFromAllOrdersScreen.value = '';
      orderIdFromAllOrdersScreen.value = '';
      trsactionIdFromAllOrdersScreen.value = '';
      selectedOuterTableIdUnMerge.value = '';
      selectedOuterTableStatus.value = '';
      selectedOuterTableName.value = '';
      selectedInnerTableName.value = '';
      scrollTopMinMax.value = '';
      refreshScreen.value = '';
      scrollOffset.value = '30';
      scrollOffsetI.value = '30';
      scrollCounter1.value = '';
      scrollOffsetScrollBar.value = '';
      scrollOffsetBottom.value = '0';
      pressedRowOuterValue.value = '';
      pressedColumnOuterValue.value = '';
      pressedRowInnerValue.value = '';
      pressedRowInnerValue.value = '';
      selectedOuterTableId.value = '';
      selectedInnerTableId.value = '';
      selectedOuterTableCharacter.value = '';
      selectedLocation = 'Management Block';
      showOrderModeButtons = false;
      selectedRowOuterLayout = 0;
      selectedColumnOuterLayout = 0;
      tmp = "";
      tempSelectedTableId = 0;
      selectedTableId = 0;
      showScrollBar = false;
      isLoading = true;
      selectedFacilityIndex = 0;
      selectedFacilityIndexInMovePopUp.value = '$selectedFacilityIndex';
      pressedInPopUp = 'min';
      pressed = 'min';
    });
  }

  @override
  void dispose() {
    super.dispose();
    isTablesScreenOpened.value = 'POPPED';
  }

  loadfacility() {
    context.read<FacilityBloc>().add(LoadFacilityEvent());
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;

    final ScrollController _vController = ScrollController();
    final ScrollController _hController = ScrollController();

    return BlocSelector<TableSeatCubit, TableSeatCubitState, bool>(
      selector: (TableSeatCubitState tableSeatCubitState) {
        return tableSeatCubitState.shouldRefreshFullScreen;
      },
      builder: (context, state) {
        print('rebuilded block selector');
        return BlocBuilder<FacilityBloc, FacilityState>(
          builder: (context, facilityBlocState) {
            if (facilityBlocState is FacilityLoadingState) {
              isLoading = true;
              return const Center(child: CircularProgressIndicator());
            }

            if (facilityBlocState is FacilityLoadedState) {
              isLoading = false;
              facilitiesList = facilityBlocState.facilities;

              return BlocBuilder<TableSeatCubit, TableSeatCubitState>(
                  builder: (context, state) {
                    if(state.isLoading){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                var ascRowList = [];
                var ascColumnList = [];

                final _listRow = [];
                final _listColumn = [];
                final _listOfNames = [];
                List<FacilityTableContainerDTO> listOfTables = [];
                if (state.selectedFacilityIndex != -1) {
                  listOfTables = facilitiesList[state.selectedFacilityIndex]
                      .facilityTableContainerDTOList;
                  for (int i = 0; i <facilitiesList[state.selectedFacilityIndex ?? 0].facilityTableContainerDTOList.length; i++) {
                    _listRow.add(facilitiesList[state.selectedFacilityIndex ?? 0].facilityTableContainerDTOList[i].rowIndex);
                    _listColumn.add(facilitiesList[state.selectedFacilityIndex ?? 0].facilityTableContainerDTOList[i].columnIndex);
                    _listOfNames.add(facilitiesList[state.selectedFacilityIndex ?? 0].facilityTableContainerDTOList[i].tableName);
                  }
                }

                if (_listRow.isNotEmpty && _listColumn.isNotEmpty) {
                  ascRowList = [for (var i = 0; i <(_listRow.reduce((curr, next) => curr > next ? curr : next) + 1);i += 1)i];
                  ascColumnList = [
                    for (var i = 0; i < (_listColumn.reduce((curr, next) => curr > next ? curr : next) + 1); i += 1)i
                  ];
                }
                tableStatuses = [...{...tableStatuses1}, ...{...tableStatuses2}, ...{...tableStatuses3}];


                return SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       SizedBox(
                        height: SizeConfig.getSize(15),
                      ),

                      ///top fecility vertical cards
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 7,
                        child: Row(
                          children: [
                            const SizedBox(width: 5,),
                            /// left arrow button
                            ValueListenableBuilder(
                                valueListenable: scrollOffset,
                                builder: (BuildContext contextPP, String newValue, Widget? child){
                                return SizedBox(
                                  height: 80,
                                  child: InkWell(
                                    child: Center(
                                      child: Stack(
                                        children: [
                                          theme.primaryColor.toString().contains('000000') ?
                                          Icon(
                                            Icons.arrow_back_ios_new,
                                            color: int.parse(scrollOffset.value) > 30
                                            //|| double.parse(_controller.position.pixels.toString()) > 300
                                                ? Colors.white : Colors.black,
                                            size: 15,
                                          ): Icon(
                                            Icons.arrow_back_ios_new,
                                            color: int.parse(scrollOffset.value) > 30
                                            //|| double.parse(_controller.position.pixels.toString()) > 300
                                                ? Colors.black : Colors.grey,
                                            size: 15,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: theme.primaryColor.toString().contains('000000') ?
                                            Icon(
                                              Icons.arrow_back_ios_new,
                                              color: int.parse(scrollOffset.value) > 30
                                              //|| double.parse(_controller.position.pixels.toString()) > 300
                                                  ? Colors.white : Colors.black,
                                              size: 15,
                                            ): Icon(Icons.arrow_back_ios_new,
                                              color: int.parse(scrollOffset.value) > 30
                                              //|| double.parse(_controller.position.pixels.toString()) > 300
                                                  ? Colors.black : Colors.grey,
                                              size: 15,),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      print(scrollOffset.value);

                                      if(int.parse(scrollOffset.value) < 390 && int.parse(scrollOffset.value) > 30) {
                                        scrollOffset.value =
                                        '${int.parse(newValue) - 30}';
                                      }
                                        _controller.animateTo(
                                          int.parse(scrollOffset.value) <= 30 ? -10 :
                                          int.parse(scrollOffset.value) <= 60 ? 30 :
                                          int.parse(scrollOffset.value) <= 90 ? 60 :
                                          int.parse(scrollOffset.value) <= 120 ? 90 :
                                          int.parse(scrollOffset.value) <= 150 ? 120 :
                                          int.parse(scrollOffset.value) <= 180 ? 150 :
                                          int.parse(scrollOffset.value) <= 210 ? 180 :
                                          int.parse(scrollOffset.value) <= 240 ? 210 :
                                          int.parse(scrollOffset.value) <= 270 ? 240 :
                                          int.parse(scrollOffset.value) <= 300 ? 270 :
                                          int.parse(scrollOffset.value) <= 330 ? 300 :
                                          int.parse(scrollOffset.value) <= 360 ? 330 :
                                          int.parse(scrollOffset.value) <= 390 ? 360 :
                                          0,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.fastOutSlowIn,
                                        );

                                    },
                                  ),
                                );
                              }
                            ),
                            const SizedBox(width: 5,),
                            /// Listed facilities
                            Expanded(
                              child: SizedBox(
                                  height: 80,
                                  child: NotificationListener(
                                    onNotification: (t) {
                                      if (t is ScrollEndNotification) {
                                        scrollOffset.value = int.parse(_controller.position.pixels.toStringAsFixed(0)).toString();
                                      }
                                      return true;
                                    },
                                    child: ListView.builder(
                                      itemCount: facilitiesList.length,
                                      scrollDirection: Axis.horizontal,
                                      controller: _controller,
                                      itemBuilder: (context, index) {
                                        final facilityItem = facilitiesList[index];
                                        if (facilityItem.facilityTableContainerDTOList.isEmpty) {
                                          return const SizedBox();
                                        }
                                        if(facilitiesList.isNotEmpty && !isInitialSelectedFirstfecility){
                                          for(int i=0 ; i<facilitiesList.length;i++){
                                            if(facilitiesList[i].facilityTableContainerDTOList.isNotEmpty){
                                              isInitialSelectedFirstfecility = true;
                                              tableSeatCubit.selectFacility(i);
                                              break;
                                            }
                                          }

                                        }
                                        return GestureDetector(
                                          onTap: () {
                                            tableSeatCubit.selectFacility(index);
                                          },
                                          child: Container(
                                            width: 150,
                                            margin: const EdgeInsets.only(
                                                right: 10),
                                            decoration: BoxDecoration(
                                                color:
                                                    state.selectedFacilityIndex == index
                                                        ? Colors.black
                                                        : Colors.grey.shade300,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  facilityItem.facilityName,
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      state.selectedFacilityIndex == index ?
                                                      TextStyle(
                                                              fontFamily: 'RobotoCondensed',
                                                              color: ThemesProvider.getColor("primaryColor"),
                                                              fontSize: SizeConfig.getFontSize(20),
                                                              fontWeight: FontWeight.bold,
                                                            )
                                                          : TextStyle(
                                                              fontFamily: 'RobotoCondensed',
                                                              color: ThemesProvider.getColor("secondaryColor"),
                                                              fontSize: SizeConfig.getFontSize(20),
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )),
                            ),
                            const SizedBox(width: 10,),
                            /// RIGHT ARROW BUTTON
                            ValueListenableBuilder(
                                valueListenable: scrollOffset,
                                builder: (BuildContext contextPP, String newValue, Widget? child){
                                return SizedBox(
                                  height: 80,
                                  child: InkWell(
                                    child: Center(
                                      child: Stack(
                                        children: [
                                          theme.primaryColor.toString().contains('000000') ?
                                          Icon(Icons.arrow_forward_ios,
                                            color: int.parse(scrollOffset.value) >= 0 && int.parse(scrollOffset.value) < 290
                                            //|| double.parse(_controller.position.pixels.toString()) < 3300
                                                ? Colors.white : Colors.black,
                                            size: 15,) :
                                          Icon(Icons.arrow_forward_ios,
                                            color: int.parse(scrollOffset.value) >= 0 && int.parse(scrollOffset.value) < 290
                                            //|| double.parse(_controller.position.pixels.toString()) < 3300
                                                ? Colors.black : Colors.grey,
                                            size: 15,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: theme.primaryColor.toString().contains('000000') ?
                                            Icon(Icons.arrow_forward_ios,
                                              color: int.parse(scrollOffset.value) >= 0 && int.parse(scrollOffset.value) < 290
                                              //|| double.parse(_controller.position.pixels.toString()) < 3300
                                                  ? Colors.white : Colors.black,
                                              size: 15,) : Icon(Icons.arrow_forward_ios,
                                              color: int.parse(scrollOffset.value) >= 0 && int.parse(scrollOffset.value) < 290
                                              //|| double.parse(_controller.position.pixels.toString()) < 3300
                                                  ? Colors.black : Colors.grey,
                                              size: 15,),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {

                                      // if(int.parse(scrollOffset.value) >= 30 && int.parse(scrollOffset.value) < 390){
                                      //   scrollOffset.value = '${int.parse(scrollOffset.value) + 30}';
                                      // }else{}

                                      _controller.animateTo(
                                        int.parse(scrollOffset.value) < 30 ? 30 :
                                        int.parse(scrollOffset.value) < 60 ? 60 :
                                        int.parse(scrollOffset.value) < 90 ? 90 :
                                        int.parse(scrollOffset.value) < 120 ? 120 :
                                        int.parse(scrollOffset.value) < 150 ? 150 :
                                        int.parse(scrollOffset.value) < 180 ? 180 :
                                        int.parse(scrollOffset.value) < 210 ? 210 :
                                        int.parse(scrollOffset.value) < 240 ? 240 :
                                        int.parse(scrollOffset.value) < 270 ? 270 :
                                        int.parse(scrollOffset.value) < 300 ? 300 :
                                        int.parse(scrollOffset.value) < 330 ? 330 :
                                        _controller.position.maxScrollExtent,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.fastOutSlowIn,
                                      );
                                    },
                                  ),
                                );
                              }
                            ),
                            const SizedBox(width: 5,),
                            InkWell(
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
                            const SizedBox(width: 10,),

                          ],
                        ),
                      ),

                      ///TABLE SEAT
                      Expanded(
                        child: ascRowList.length < 5
                            ?

                            /// tables having less than 5 rows
                            Flex(direction: Axis.vertical, children: [
                                Expanded(
                                    child: Scroller(
                                  controller: _hController,
                                  child: SingleChildScrollView(
                                    controller: _hController,
                                    scrollDirection: Axis.horizontal,
                                    child: Column(
                                      children: [
                                        for (var j in ascRowList) //Row
                                          Row(
                                            children: [
                                              for (var i in ascColumnList)
                                                Stack(
                                                  children: [
                                                    SizedBox(
                                                      height: MediaQuery.of(context).size.height / 11,
                                                      width: MediaQuery.of(context).size.height / 11,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: InkWell(
                                                            onTap: () {
                                                              final itemIndex = listOfTables.indexWhere((element) => element.rowIndex == j && element.columnIndex == i );
                                                              if(itemIndex == -1){
                                                                return;
                                                              }
                                                              setNotification.value = NotificationMessage(message: '',);
                                                              var selectedTableId = listOfTables[itemIndex].tableId;
                                                              selectedTableToShowCrossMark.value = listOfTables[itemIndex].tableId.toString();
                                                              selectedOuterTableId.value = '$selectedTableId';
                                                              pressedColumnOuterValue.value = "$j";
                                                              pressedRowOuterValue.value = "$i";
                                                              selectedOuterTableIdUnMerge.value = listOfTables[itemIndex]
                                                                  .facilityTableCurrentStatusDTO!
                                                                  .mergedWithTableId
                                                                  .toString();
                                                              TableSeatLayoutBottomActionBarW.selectedTableIdOuter.value = state.selectedTableId.toString();
                                                              selectedOuterTableName.value = listOfTables[itemIndex].tableName.toString();
                                                              selectedOuterTableStatus.value = listOfTables[itemIndex]
                                                                  .facilityTableCurrentStatusDTO!
                                                                  .status
                                                                  .toString();
                                                              selectedOuterTableCharacter.value = listOfTables[itemIndex]
                                                                  .facilityTableCurrentStatusDTO!
                                                                  .character
                                                                  .toString();
                                                              tableSeatCubit.selectionOfTable(tableId: selectedTableId, rowIndex: i, columnIndex: j);
                                                              if (state.showOrderModeButton == true) {
                                                                if (listOfTables[itemIndex].allowMultipleOrders){
                                                                  genericOrder();
                                                                  return;
                                                                }
                                                                if (listOfTables[itemIndex].facilityTableCurrentStatusDTO!.character.toString() == 'F' || listOfTables[itemIndex].facilityTableCurrentStatusDTO!.tableCurrentStatus.toString() == "OPEN") {
                                                                  print('click1');
                                                                  showDialog(
                                                                    context: context,
                                                                    builder: (BuildContext context) {
                                                                      return StatefulBuilder(
                                                                        builder: (context, setState) {
                                                                          return TransactionOrderDetailsDialog(
                                                                            tableId: int.parse(selectedOuterTableId.value.toString()),
                                                                            isUpdate: false,
                                                                            showNotification: (String value, Color color) {},
                                                                            onComplete: () {
                                                                              _occupyTableNew();
                                                                            },
                                                                            onCancel: (){
                                                                              tableSeatCubit.unSelectTable();
                                                                            },
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                  );
                                                                } else if (listOfTables[itemIndex].facilityTableCurrentStatusDTO!.character.toString() == 'B' ||
                                                                    listOfTables[itemIndex].facilityTableCurrentStatusDTO!.character.toString() == 'R') {
                                                                  var status = listOfTables[itemIndex].facilityTableCurrentStatusDTO!.character.toString() == 'B' ? "BLOCKED" : "RESERVED";
                                                                  print('click2');
                                                                  showDialog(
                                                                      context:
                                                                      context,
                                                                      barrierDismissible:
                                                                      false,
                                                                      builder: (_) =>
                                                                          AllowOverride(
                                                                            status: status,
                                                                            onOk: () {
                                                                              Navigator.pop(context);
                                                                              _showTransactionOrderDetail();
                                                                            },
                                                                          ));
                                                                } else {
                                                                  print('click3');

                                                                    getOrderCount();

                                                                }
                                                              }
                                                            },
                                                            child: listOfTables
                                                                        .firstWhere((element) =>
                                                                            element.rowIndex ==
                                                                                j &&
                                                                            element.columnIndex ==
                                                                                i)
                                                                        .tableName
                                                                        .toString() ==
                                                                    'Generic'
                                                                ? Container(
                                                                    height: 20,
                                                                    width: 20,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(5)),
                                                                      color: Color(
                                                                          0xff696a67),
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            listOfTables.any((element) => element.rowIndex == j && element.columnIndex == i)
                                                                                ? listOfTables.firstWhere((element) => element.rowIndex == j && element.columnIndex == i).tableName
                                                                                : "",
                                                                            style:
                                                                                TextStyle(
                                                                              fontFamily: 'RobotoCondensed',
                                                                              color: ThemesProvider.getColor("primaryColor"),
                                                                              fontSize: SizeConfig.getFontSize(18),
                                                                              fontWeight: FontWeight.w400,
                                                                            ),
                                                                          ),
                                                                          listOfTables.any((element) => element.rowIndex == j && element.columnIndex == i)
                                                                              ? listOfTables.firstWhere((element) => element.rowIndex == j && element.columnIndex == i).facilityTableCurrentStatusDTO!.mergedWithTableIdName.toString() == "null"
                                                                                  ? Container()
                                                                                  : Text(
                                                                                      listOfTables.any((element) => element.rowIndex == j && element.columnIndex == i) ? (listOfTables.firstWhere((element) => element.rowIndex == j && element.columnIndex == i).facilityTableCurrentStatusDTO!.mergedWithTableIdName.toString()) : "",
                                                                                      style: TextStyle(
                                                                                        fontFamily: 'RobotoCondensed',
                                                                                        color: ThemesProvider.getColor("primaryColor"),
                                                                                        fontSize: SizeConfig.getFontSize(18),
                                                                                        fontWeight: FontWeight.w400,
                                                                                      ),
                                                                                    )
                                                                              : Container(),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  )
                                                                : state.pressedRowOuterValue ==
                                                                            i &&
                                                                        state.pressedColumnOuterValue ==
                                                                            j
                                                                    ? selectedTable(
                                                                        listOfTables,
                                                                        j,
                                                                        i,
                                                                        theme)
                                                                    : tableContainer(
                                                                        listOfTables,
                                                                        j,
                                                                        i,
                                                                        theme)),
                                                      ),
                                                    ),
                                                    tableTopText(context,
                                                        listOfTables, j, i),
                                                  ],
                                                ),
                                              const SizedBox(
                                                width: 50,
                                              )
                                            ],
                                          )
                                      ],
                                    ),
                                  ),
                                )),
                              ])
                            :

                            /// table with more than 5 rows
                            Scroller(
                                controller: _vController,
                                child: Flex(
                                  direction: Axis.vertical,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisSize : MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child: SingleChildScrollView(
                                              controller: _vController,
                                              scrollDirection: Axis.vertical,
                                              child: Scroller(
                                                controller: _hController,
                                                child: SingleChildScrollView(
                                                  controller: _hController,
                                                  scrollDirection: Axis.horizontal,
                                                  child: Column(
                                                    children: [
                                                      for (var j in ascRowList)
                                                        Row(
                                                          children: [
                                                            for (var i
                                                                in ascColumnList) //column
                                                              Stack(
                                                                children: [
                                                                  SizedBox(
                                                                    height: MediaQuery.of(context).size.height / 11,
                                                                    width: MediaQuery.of(context).size.height / 11,
                                                                    child: Padding(
                                                                      padding:
                                                                          const EdgeInsets
                                                                                  .all(
                                                                              2.0),
                                                                      child: InkWell(
                                                                        onTap: () {
                                                                          final itemIndex = listOfTables.indexWhere((element) => element.rowIndex == j && element.columnIndex == i );
                                                                          if(itemIndex == -1){
                                                                            return;
                                                                          }
                                                                          setNotification.value = NotificationMessage(message: '',);
                                                                          var selectedTableId = listOfTables[itemIndex].tableId;
                                                                          selectedTableToShowCrossMark.value = listOfTables[itemIndex].tableId.toString();
                                                                          selectedOuterTableId.value = '$selectedTableId';
                                                                          pressedColumnOuterValue.value = "$j";
                                                                          pressedRowOuterValue.value = "$i";
                                                                          selectedOuterTableIdUnMerge.value = listOfTables[itemIndex]
                                                                              .facilityTableCurrentStatusDTO!
                                                                              .mergedWithTableId
                                                                              .toString();
                                                                          TableSeatLayoutBottomActionBarW.selectedTableIdOuter.value = state.selectedTableId.toString();
                                                                          selectedOuterTableName.value = listOfTables[itemIndex].tableName.toString();
                                                                          selectedOuterTableStatus.value = listOfTables[itemIndex]
                                                                              .facilityTableCurrentStatusDTO!
                                                                              .status
                                                                              .toString();
                                                                          selectedOuterTableCharacter.value = listOfTables[itemIndex]
                                                                              .facilityTableCurrentStatusDTO!
                                                                              .character
                                                                              .toString();
                                                                          tableSeatCubit.selectionOfTable(tableId: selectedTableId, rowIndex: i, columnIndex: j);
                                                                          if (state.showOrderModeButton == true) {
                                                                            if (listOfTables[itemIndex].allowMultipleOrders){
                                                                              genericOrder();
                                                                              return;
                                                                            }
                                                                            if (listOfTables[itemIndex].facilityTableCurrentStatusDTO!.character.toString() == 'F' || listOfTables[itemIndex].facilityTableCurrentStatusDTO!.tableCurrentStatus.toString() == "OPEN") {
                                                                              print('click1');
                                                                              showDialog(
                                                                                context: context,
                                                                                builder: (BuildContext context) {
                                                                                  return StatefulBuilder(
                                                                                    builder: (context, setState) {
                                                                                      return TransactionOrderDetailsDialog(
                                                                                        tableId: int.parse(selectedOuterTableId.value.toString()),
                                                                                        isUpdate: false,
                                                                                        showNotification: (String value, Color color) {},
                                                                                        onComplete: () {
                                                                                          _occupyTableNew();
                                                                                        },
                                                                                        onCancel: (){
                                                                                          tableSeatCubit.unSelectTable();
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                },
                                                                              );
                                                                            } else if (listOfTables[itemIndex].facilityTableCurrentStatusDTO!.character.toString() ==
                                                                                    'B' ||
                                                                                listOfTables[itemIndex].facilityTableCurrentStatusDTO!.character.toString() ==
                                                                                    'R') {
                                                                              var status = listOfTables[itemIndex].facilityTableCurrentStatusDTO!.character.toString() ==
                                                                                      'B'
                                                                                  ? "BLOCKED"
                                                                                  : "RESERVED";
                                                                              print('click2');
                                                                              showDialog(
                                                                                  context:
                                                                                      context,
                                                                                  barrierDismissible:
                                                                                      false,
                                                                                  builder: (_) =>
                                                                                      AllowOverride(
                                                                                        status: status,
                                                                                        onOk: () {
                                                                                          Navigator.pop(context);
                                                                                          _showTransactionOrderDetail();
                                                                                        },
                                                                                      ));
                                                                            } else {
                                                                              print('click3');
                                                                               getOrderCount();
                                                                            }
                                                                          }
                                                                        },
                                                                        child: state.pressedRowOuterValue == i && state.pressedColumnOuterValue == j ? selectedTable(listOfTables, j, i, theme)
                                                                            : tableContainer(listOfTables, j, i, theme),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  tableTopText(
                                                                      context,
                                                                      listOfTables,
                                                                      j,
                                                                      i),
                                                                ],
                                                              ),
                                                            const SizedBox(
                                                              width: 50,
                                                            ),
                                                          ],
                                                        )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),

                      /// Divider
                      Container(
                          width: double.infinity,
                          height: 1,
                          color: theme.dividerColor),

                      ///bottom button list
                      Container(
                        // height: MediaQuery.of(context).size.height/7,
                        color: theme.backGroundColor,
                       padding: EdgeInsets.symmetric(vertical:SizeConfig.isBigDevice() ?  SizeConfig.getSize(8) : 0),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),

                            /// ORDER/ACTION mode button
                            ElevatedButton(
                                onPressed: () {
                                  tableSeatCubit
                                      .changeOrderModeOrActionModeButton();
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size( SizeConfig.getWidth(120),  SizeConfig.getHeight(42)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  backgroundColor: theme.secondaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(4.0)),
                                ),
                                child: Text(
                                  state.showOrderModeButton == true
                                      ? "ORDER MODE"
                                      : "ACTION MODE",
                                  style: theme.descriptionLight1?.copyWith(
                                      fontSize: SizeConfig.getFontSize(16)),
                                  textAlign: TextAlign.center,
                                )),
                            const SizedBox(
                              width: 5,
                            ),

                            ///REFRESH Button
                            ElevatedButton(
                                onPressed: () {
                                  loadfacility();
                                  tableSeatCubit.rebuildScreen();
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size( SizeConfig.getWidth(120),  SizeConfig.getHeight(42)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  backgroundColor: theme.secondaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(4.0)),
                                ),
                                child: Text(
                                  "REFRESH",
                                  style: theme.descriptionLight1?.copyWith(
                                      fontSize: SizeConfig.getFontSize(16)),
                                  textAlign: TextAlign.center,
                                )),

                            /// left arrows in bottom button list
                            ValueListenableBuilder(
                                valueListenable: scrollOffsetBottom,
                                builder: (BuildContext contextPP, String newValue, Widget? child){
                                  return ValueListenableBuilder(
                                      valueListenable: scrollTopMinMax,
                                      builder: (BuildContext contextPP, String newValue, Widget? child){
                                        return InkWell(
                                          onTap: (){
                                              scrollTopMinMax.value = 'min';
                                              _controllerBottomBar.animateTo(
                                                _controllerBottomBar.position.minScrollExtent,
                                                duration: const Duration(milliseconds: 500),
                                                curve: Curves.fastOutSlowIn,
                                              );

                                          },
                                          child:  SizedBox(
                                            height:  SizeConfig.getHeight(42),
                                            child: Center(
                                              child: Stack(
                                                children: [
                                                  theme.primaryColor.toString().contains('000000') ? Icon(Icons.arrow_back_ios_new,
                                                    color:
                                                    scrollOffsetBottom.value != '0' ? Colors.white : Colors.black,
                                                    size: 15,) :
                                                  Icon(Icons.arrow_back_ios_new,
                                                    color:
                                                    scrollOffsetBottom.value != '0' ? Colors.black : Colors.grey,
                                                    size: 15,),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 10),
                                                    child: theme.primaryColor.toString().contains('000000') ? Icon(Icons.arrow_back_ios_new,
                                                      color:
                                                      scrollOffsetBottom.value != '0' ? Colors.white : Colors.black,
                                                      size: 15,) : Icon(Icons.arrow_back_ios_new,
                                                      color: scrollOffsetBottom.value != '0' ? Colors.black : Colors.grey,
                                                      size: 15,),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                  );
                                }
                            ),

                            /// List of action buttons
                            Expanded(
                              flex: 10,
                              child:NotificationListener(
                                onNotification: (t) {
                                  if (t is ScrollEndNotification) {
                                    scrollOffsetBottom.value = int.parse(_controllerBottomBar.position.pixels.toStringAsFixed(0)).toString();
                                  }
                                  return true;
                                },
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  controller: _controllerBottomBar,
                                  child: Row(
                                      children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    actionButtons("MERGE",
                                        state.showOrderModeButton, () {
                                           if(!state.showOrderModeButton){
                                             if(state.pressedColumnOuterValue == -1 || state.pressedRowOuterValue == -1){
                                               setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Please select a table to perform action "),
                                                   color: AppColors.notificationBGRedColor);
                                             }else{
                                               setNotification.value = NotificationMessage(message: MessagesProvider.get("Performing table action &1 ",["MERGE"]),color:theme.footerBG4);
                                               if(selectedOuterTableCharacter.value == 'B' || selectedOuterTableCharacter.value == 'R' || selectedOuterTableCharacter.value == 'M'){
                                                       setNotification.value = NotificationMessage(message: MessagesProvider.get("Operation is not allowed "), color: AppColors.notificationBGLightYellowColor);
                                               }else{
                                                if(_isCurrentUserManager == true ) {
                                                  mergeTablePopUp(
                                                    ascColumnList: ascColumnList,
                                                    ascRowList: ascRowList,
                                                    listColumn: _listColumn,
                                                    listOfNames: _listOfNames,
                                                    listRow: _listRow,
                                                    listOfTables: listOfTables,
                                                    pressedColumnValue: state.pressedColumnOuterValue,
                                                    pressedRowValue: state.pressedRowOuterValue,
                                                  );

                                                }else{
                                                  ///Not manager user pop up
                                                  showDialog(context: context, builder: (ctx) {
                                                    return Dialog(
                                                      insetPadding: EdgeInsets.symmetric(horizontal: SizeConfig.getSize(220)),
                                                      child: ManagerLoginView(
                                                        onLoginSuccess: (response) async {
                                                          print("response :::::: "+response.toString());
                                                          print("Approver New ID : "+response.data!.userPKId.toString());
                                                          setState(() {
                                                            approvedUserPkId = response.data!.userPKId;
                                                            showOrderModeButtons = false;
                                                          });
                                                        },
                                                        onLoginError: (err) {
                                                          setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Error! Please try again "),
                                                              color: AppColors.notificationBGRedColor);
                                                        },
                                                      ),
                                                    );
                                                  }).whenComplete(() {
                                                    if(approvedUserPkId != 0){
                                                      setNotification.value = NotificationMessage(message: MessagesProvider.get("Performing table action &1 ",["MERGE"]),color:theme.footerBG4);
                                                      mergeTablePopUp(
                                                        ascColumnList: ascColumnList,
                                                        ascRowList: ascRowList,
                                                        listColumn: _listColumn,
                                                        listOfNames: _listOfNames,
                                                        listRow: _listRow,
                                                        listOfTables: listOfTables,
                                                        pressedColumnValue: state.pressedColumnOuterValue,
                                                        pressedRowValue: state.pressedRowOuterValue,
                                                      );
                                                    }
                                                  });
                                                }
                                               }
                                             }

                                           }
                                        },accessControlMap["MERGE"] ?? defAccessDto),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    actionButtons("UNMERGE",
                                        state.showOrderModeButton, () {
                                           if(!state.showOrderModeButton){
                                             if(state.pressedColumnOuterValue == -1 || state.pressedRowOuterValue == -1){
                                               setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Please select a table to perform action "),
                                                   color: AppColors.notificationBGRedColor);
                                             }else
                                               if(selectedOuterTableCharacter.value == 'B' || selectedOuterTableCharacter.value == 'R' || selectedOuterTableCharacter.value == 'M'){
                                                 setNotification.value = NotificationMessage(message:  MessagesProvider.get("Operation is not allowed "),
                                                     color: AppColors.notificationBGLightYellowColor);
                                                 showOrderModeButtons = false;
                                             }else{
                                              if(_isCurrentUserManager == true ){
                                                unMergeTable();
                                              }else{
                                                showDialog(context: context, builder: (ctx) {
                                                  return Dialog(
                                                    insetPadding: EdgeInsets.symmetric(horizontal: SizeConfig.getSize(220)),
                                                    child: ManagerLoginView(
                                                      onLoginSuccess: (response) async {
                                                        approvedUserPkId = response.data!.userPKId;
                                                        showOrderModeButtons = false;
                                                        tableSeatCubit.changeOrderModeOrActionModeButton();
                                                      },
                                                      onLoginError: (err) {
                                                        setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Error! Please try again "),
                                                            color: AppColors.notificationBGRedColor);
                                                        // Future.delayed(Duration(seconds: 3),(){
                                                        //   setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
                                                        // });
                                                      },
                                                    ),
                                                  );
                                                }).then((value) async {
                                                  tableSeatCubit.changeOrderModeOrActionModeButton();
                                                  if(approvedUserPkId != 0){
                                                    await unMergeTable();
                                                  }
                                                });
                                              }
                                               }
                                           }
                                        },accessControlMap["UNMERGE"] ?? defAccessDto),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    actionButtons(
                                        "MOVE", state.showOrderModeButton, () {
                                          if(state.showOrderModeButton){
                                            return;
                                           }
                                          if(state.pressedColumnOuterValue == -1 || state.pressedRowOuterValue == -1){
                                            setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Please select a table to perform action "),
                                                color: AppColors.notificationBGRedColor);
                                            return;
                                          }
                                          if(selectedOuterTableCharacter.value == "F" && selectedOuterTableName.value != 'Generic'){
                                            setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Selected table has no orders to move."),
                                                color: AppColors.notificationBGLightYellowColor);
                                            tableSeatCubit.unSelectTable();
                                            return;
                                          }
                                          if(_isCurrentUserManager == true ){
                                            moveOperationManager();
                                          }else{
                                            moveOperationUser();
                                          }

                                       },accessControlMap["MOVE"] ?? defAccessDto),
                                      const SizedBox(
                                      width: 5,
                                      ),
                                      actionButtons("DETAILS",
                                      state.showOrderModeButton, () {
                                            if(state.showOrderModeButton){
                                              return;
                                            }

                                            if(state.pressedColumnOuterValue == -1 || state.pressedRowOuterValue == -1){
                                              setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Please select a table to perform action "),
                                                  color: AppColors.notificationBGRedColor);
                                              return;
                                            }
                                            if(selectedOuterTableCharacter.value == 'R'){
                                              _showReserveDialog(true);
                                            }else if(selectedOuterTableCharacter.value == 'B'){
                                              _showBlockDialog(true);
                                            }else {
                                              setNotification.value = NotificationMessage(message:  MessagesProvider.get("Operation is not allowed "),
                                                  color: AppColors.notificationBGLightYellowColor);

                                            }
                                          },accessControlMap["DETAILS"] ?? defAccessDto),
                                      const SizedBox(
                                      width: 5,
                                      ),
                                      actionButtons("RESERVE",
                                      state.showOrderModeButton, () {
                                            if(state.showOrderModeButton){
                                              return;
                                            }

                                            if(state.pressedColumnOuterValue == -1 || state.pressedRowOuterValue == -1){
                                              setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Please select a table to perform action "),
                                                  color: AppColors.notificationBGRedColor);
                                              return;
                                            }
                                            if(_isCurrentUserManager == true){
                                                if(selectedOuterTableCharacter.value == 'F'){
                                                  fromDateReserve.text = '${DateFormat('dd-MMM-yyyy – hh:mm a').format(DateTime.now())}';
                                                  toDateReserve.text = '${DateFormat('dd-MMM-yyyy – hh:mm a').format(DateTime.now())}';
                                                  _showReserveDialog(false);
                                                }else{
                                                  setNotification.value = NotificationMessage(message:  MessagesProvider.get("Operation is not allowed "),
                                                      color: AppColors.notificationBGLightYellowColor);
                                                  selectedOuterTableId.value = '';
                                                  pressedRowOuterValue.value = '';
                                                  pressedColumnOuterValue.value = '';
                                                    showOrderModeButtons == false;
                                                    tableSeatCubit.rebuildScreen();
                                                }
                                            }else{
                                              if(selectedOuterTableCharacter.value == 'F'){
                                                fromDateReserve.text = '${DateFormat('dd-MMM-yyyy – hh:mm a').format(DateTime.now())}';
                                                toDateReserve.text = '${DateFormat('dd-MMM-yyyy – hh:mm a').format(DateTime.now())}';
                                                showDialog(context: context, builder: (ctx) {
                                                  return Dialog(
                                                    insetPadding: EdgeInsets.symmetric(horizontal: SizeConfig.getSize(220)),
                                                    child: ManagerLoginView(
                                                      onLoginSuccess: (response) async {
                                                        print("response :::::: "+response.toString());
                                                        print("Approver New ID : "+response.data!.userPKId.toString());
                                                        setState(() {
                                                          approvedUserPkId = response.data!.userPKId;
                                                          showOrderModeButtons = false;
                                                        });
                                                      },
                                                      onLoginError: (err) {
                                                        setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Error! Please try again "),
                                                            color: AppColors.notificationBGRedColor);
                                                        // Future.delayed(Duration(seconds: 3),(){
                                                        //   setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
                                                        // });
                                                      },
                                                    ),
                                                  );
                                                }).whenComplete((){
                                                  tableSeatCubit.changeOrderModeOrActionModeButton();
                                                  if(approvedUserPkId != 0){
                                                    _showReserveDialog(false);
                                                  }
                                                });
                                              }else{
                                                setNotification.value = NotificationMessage(message:  MessagesProvider.get("Operation is not allowed "),
                                                    color: AppColors.notificationBGLightYellowColor);
                                                selectedOuterTableId.value = '';
                                                pressedRowOuterValue.value = '';
                                                pressedColumnOuterValue.value = '';
                                                tableSeatCubit.changeOrderModeOrActionModeButton();
                                              }
                                            }

                                          },
                                          accessControlMap["RESERVE"] ?? defAccessDto
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    actionButtons("BLOCK",
                                        state.showOrderModeButton, () {
                                          if(state.showOrderModeButton){
                                            return;
                                          }

                                          if(state.pressedColumnOuterValue == -1 || state.pressedRowOuterValue == -1){
                                            setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Please select a table to perform action "),
                                                color: AppColors.notificationBGRedColor);
                                            return;
                                          }
                                          if(_isCurrentUserManager == true){
                                            if(selectedOuterTableCharacter.value == 'F'){
                                              _showBlockDialog(false);
                                            }else{
                                              setNotification.value = NotificationMessage(message:  MessagesProvider.get("Operation is not allowed "),
                                                  color: AppColors.notificationBGLightYellowColor);

                                            }
                                          }else{
                                            if(selectedOuterTableCharacter.value == 'F'){
                                              showDialog(context: context, builder: (ctx) {
                                                return Dialog(
                                                  insetPadding: EdgeInsets.symmetric(horizontal: SizeConfig.getSize(220)),
                                                  child: ManagerLoginView(
                                                    onLoginSuccess: (response) async {
                                                        approvedUserPkId = response.data!.userPKId;
                                                        showOrderModeButtons = false;
                                                        tableSeatCubit.changeOrderModeOrActionModeButton();
                                                    },
                                                    onLoginError: (err) {
                                                      setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Error! Please try again "),
                                                          color: AppColors.notificationBGRedColor);
                                                    },
                                                  ),
                                                );
                                              }).then((value){
                                               tableSeatCubit.changeOrderModeOrActionModeButton();
                                                if(approvedUserPkId != 0){
                                                  _showBlockDialog(false);
                                                }
                                              });
                                            }else{
                                              setNotification.value = NotificationMessage(message:  MessagesProvider.get("Operation is not allowed "),
                                                  color: AppColors.notificationBGLightYellowColor);
                                              selectedOuterTableId.value = '';
                                              pressedRowOuterValue.value = '';
                                              pressedColumnOuterValue.value = '';
                                              tableSeatCubit.changeOrderModeOrActionModeButton();
                                            }
                                          }
                                        },accessControlMap["BLOCK"] ?? defAccessDto),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    actionButtons("CLEAR",
                                        state.showOrderModeButton, () {
                                          if(state.showOrderModeButton){
                                            return;
                                          }

                                          if(state.pressedColumnOuterValue == -1 || state.pressedRowOuterValue == -1){
                                            setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Please select a table to perform action "),
                                                color: AppColors.notificationBGRedColor);
                                            tableSeatCubit.changeOrderModeOrActionModeButton();
                                            return;
                                          }
                                          if(_isCurrentUserManager == true){
                                            if(selectedOuterTableCharacter.value == 'B' || selectedOuterTableCharacter.value == 'R'){
                                              showBlockedDialogueManager();
                                            }else{
                                              setNotification.value = NotificationMessage(message:  MessagesProvider.get("Operation is not allowed "),
                                                  color: AppColors.notificationBGLightYellowColor);
                                                selectedOuterTableId.value = '';
                                                pressedRowOuterValue.value = '';
                                                pressedColumnOuterValue.value = '';
                                                showOrderModeButtons = false;
                                            }
                                          }else{
                                            showBlockedDialogueUser();
                                          }
                                        },accessControlMap["CLEAR"] ?? defAccessDto),
                                  ]),
                                ),
                              ),
                            ),

                            /// right arrows in bottom button list
                            ValueListenableBuilder(
                                valueListenable: scrollOffsetBottom,
                                builder: (BuildContext contextPP, String newValue, Widget? child){
                                  return ValueListenableBuilder(
                                      valueListenable: scrollTopMinMax,
                                      builder: (BuildContext contextPP, String newValue, Widget? child){
                                        return InkWell(
                                          onTap: (){
                                              _controllerBottomBar.animateTo(
                                                _controllerBottomBar.position.maxScrollExtent,
                                                duration: const Duration(milliseconds: 200),
                                                curve: Curves.fastOutSlowIn,
                                              );
                                          },
                                          child: SizedBox(
                                            height:  SizeConfig.getHeight(42),
                                            child: Center(
                                              child: Stack(
                                                children: [
                                                  theme.primaryColor.toString().contains('000000') ?
                                                  Icon(Icons.arrow_forward_ios,
                                                    color: scrollOffsetBottom.value == '0' ? Colors.white : Colors.black,
                                                    size: 15,) :
                                                  Icon(Icons.arrow_forward_ios,
                                                    color: scrollOffsetBottom.value == '0' ? Colors.black : Colors.grey,
                                                    size: 15,),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 10),
                                                    child: theme.primaryColor.toString().contains('000000') ?
                                                    Icon(Icons.arrow_forward_ios,
                                                      color: scrollOffsetBottom.value == '0' ? Colors.white : Colors.black,
                                                      size: 15,) :Icon(Icons.arrow_forward_ios,
                                                      color: scrollOffsetBottom.value == '0' ? Colors.black : Colors.grey,
                                                      size: 15,),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                  );
                                }
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              });
            }
            return Container();
          },
        );
      },
    );
  }

  Padding tableTopText(BuildContext context,
      List<FacilityTableContainerDTO> listOfTables, j, i) {
    return Padding(
      padding: EdgeInsets.only(
          top: 5, left: MediaQuery.of(context).size.height / 15),
      child: Align(
        alignment: Alignment.topRight,
        child: Text(
          listOfTables.any((element) =>
                  element.rowIndex == j && element.columnIndex == i)
              ? listOfTables
                  .firstWhere((element) =>
                      element.rowIndex == j && element.columnIndex == i)
                  .facilityTableCurrentStatusDTO!
                  .character
                  .toString()
              : "",
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            color: ThemesProvider.getColor("primaryColor"),
            fontSize: SizeConfig.getFontSize(12),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Container tableContainer(
      List<FacilityTableContainerDTO> listOfTables, j, i, SemnoxTheme theme) {
    final itemIndex = listOfTables.indexWhere((element) => element.rowIndex == j && element.columnIndex == i );

    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: itemIndex != -1 ? listOfTables[itemIndex].allowMultipleOrders ? Color.fromRGBO(
            int.parse(genericTableColor.split(",")[0]),
            int.parse(genericTableColor.split(",")[1]),
            int.parse(genericTableColor.split(",")[2]),
            1)
            : (listOfTables.any((element) => element.rowIndex == j && element.columnIndex == i))
            ? Color.fromRGBO(
                int.parse((listOfTables[itemIndex].facilityTableCurrentStatusDTO!.color.toString()).split(",")[0]),
                int.parse((listOfTables[itemIndex].facilityTableCurrentStatusDTO!.color.toString()).split(",")[1]),
                int.parse((listOfTables[itemIndex].facilityTableCurrentStatusDTO!.color.toString()).split(",")[2]),1)
            : theme.backGroundColor : theme.backGroundColor,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              listOfTables.any((element) =>
                      element.rowIndex == j && element.columnIndex == i)
                  ? listOfTables
                      .firstWhere((element) =>
                          element.rowIndex == j && element.columnIndex == i)
                      .tableName
                  : "",
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                color: ThemesProvider.getColor("primaryColor"),
                fontSize: SizeConfig.getFontSize(18),
                fontWeight: FontWeight.w400,
              ),
            ),
            listOfTables.any((element) =>
                    element.rowIndex == j && element.columnIndex == i)
                ? listOfTables
                            .firstWhere((element) =>
                                element.rowIndex == j &&
                                element.columnIndex == i)
                            .facilityTableCurrentStatusDTO!
                            .mergedWithTableIdName
                            .toString() ==
                        "null"
                    ? Container()
                    : Text(
                        listOfTables.any((element) =>
                                element.rowIndex == j &&
                                element.columnIndex == i)
                            ? (listOfTables
                                .firstWhere((element) =>
                                    element.rowIndex == j &&
                                    element.columnIndex == i)
                                .facilityTableCurrentStatusDTO!
                                .mergedWithTableIdName
                                .toString())
                            : "",
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          color: ThemesProvider.getColor("primaryColor"),
                          fontSize: SizeConfig.getFontSize(18),
                          fontWeight: FontWeight.w400,
                        ),
                      )
                : Container(),
          ],
        ),
      ),
    );
  }

  Container selectedTable(
      List<FacilityTableContainerDTO> listOfTables, j, i, SemnoxTheme theme) {
    final itemIndex = listOfTables.indexWhere((element) => element.rowIndex == j && element.columnIndex == i );
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: itemIndex != -1 ? listOfTables[itemIndex].allowMultipleOrders ? Color.fromRGBO(
            int.parse(genericTableColor.split(",")[0]),
            int.parse(genericTableColor.split(",")[1]),
            int.parse(genericTableColor.split(",")[2]),
            1).withOpacity(0.4)
            : (listOfTables.any((element) => element.rowIndex == j && element.columnIndex == i))
            ? Color.fromRGBO(
            int.parse((listOfTables[itemIndex].facilityTableCurrentStatusDTO!.color.toString()).split(",")[0]),
            int.parse((listOfTables[itemIndex].facilityTableCurrentStatusDTO!.color.toString()).split(",")[1]),
            int.parse((listOfTables[itemIndex].facilityTableCurrentStatusDTO!.color.toString()).split(",")[2]),
            1).withOpacity(0.4)
            : theme.backGroundColor : theme.backGroundColor,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              listOfTables.any((element) =>
                      element.rowIndex == j && element.columnIndex == i)
                  ? listOfTables
                      .firstWhere((element) =>
                          element.rowIndex == j && element.columnIndex == i)
                      .tableName
                  : "",
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                color: ThemesProvider.getColor("primaryColor"),
                fontSize: SizeConfig.getFontSize(18),
                fontWeight: FontWeight.w400,
              ),
            ),
            listOfTables.any((element) =>
                    element.rowIndex == j && element.columnIndex == i)
                ? listOfTables
                            .firstWhere((element) =>
                                element.rowIndex == j &&
                                element.columnIndex == i)
                            .facilityTableCurrentStatusDTO!
                            .mergedWithTableIdName
                            .toString() ==
                        "null"
                    ? Container()
                    : Text(
                        listOfTables.any((element) =>
                                element.rowIndex == j &&
                                element.columnIndex == i)
                            ? (listOfTables
                                .firstWhere((element) =>
                                    element.rowIndex == j &&
                                    element.columnIndex == i)
                                .facilityTableCurrentStatusDTO!
                                .mergedWithTableIdName
                                .toString())
                            : "",
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          color: ThemesProvider.getColor("primaryColor"),
                          fontSize: SizeConfig.getFontSize(18),
                          fontWeight: FontWeight.w400,
                        ),
                      )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget actionButtons(String title, bool isActive, VoidCallback onPress, FacilityAccessControlDto accessDto ) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Visibility(
      visible: accessDto.shouldDisplayTask,
      child: ElevatedButton(
          onPressed:  (){
            if(accessDto.isTaskEnabled){
              onPress();
            }
          },
          style: ElevatedButton.styleFrom(
            fixedSize: Size( SizeConfig.getWidth(120),  SizeConfig.getHeight(42)),
            padding:  EdgeInsets.symmetric(horizontal: 10.0),
            backgroundColor:
                isActive && accessDto.isTaskEnabled ? Colors.grey.shade300 : theme.secondaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          ),
          child: Text(
            title,
            style: theme.descriptionLight1
                ?.copyWith(fontSize: SizeConfig.getFontSize(16)),
            textAlign: TextAlign.center,
          )),
    );
  }

  _occupyTableNew() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final orderSearchBL = await OrdersDataBuilder.build(executionContextDTO!);

    try {
      tableSeatCubit.changeLoading(true);
      Log.printMethodStart('_occupyTableNew()', 'TableSeatLayout', 'Table');
      var response = await orderSearchBL
          .occupyTable(
              tableId: int.parse(selectedOuterTableId.value),
              facilityTable: FacilityTable(
                  Reason: "Reason",
                  AdditionalComments: "additionalComments",
                  ApprovalDTO: ApproveDTO(
                      ApproverId: executionContextDTO.userPKId ?? -1,
                      Remarks: "Remarks")))
          .whenComplete(() {
        Log.printMethodEnd('_occupyTableNew()', 'TableSeatLayout', 'Table');
      });
      tableSeatCubit.changeLoading(false);
      if (response.exception == null) {
        //_setLoadingStatus(false);
        Log.printMethodReturn('_occupyTableNew()', 'TableSeatLayout', 'Table');
        Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => SalesScreen()))
            .then((value) {
          selectedOuterTableId.value = '';
          pressedRowOuterValue.value = '';
          pressedColumnOuterValue.value = '';
          loadfacility();
          tableSeatCubit.rebuildScreen();
          refreshScreen.value = '';
        });
        // Navigator.pop(context);
      }
    } on DioError catch (error) {
      //_setLoadingStatus(false);
      Log.printMethodReturn('_occupyTableNew()', 'TableSeatLayout', 'Table');
      var errorString = error.response?.data['data'] as String?;
      Future.microtask(
          () => showErrorDialog(context, 'Error', errorString ?? ''));
    }
  }

  _showTransactionOrderDetail() {
    showDialog(
      context: context,
      builder: (BuildContext contextN) {
        return ValueListenableBuilder(
            valueListenable: selectedOuterTableId,
            builder: (BuildContext contextPP, String newValue, Widget? child) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return TransactionOrderDetailsDialog(
                    isUpdate: false,
                    tableId: int.parse(selectedOuterTableId.value.toString()),
                    showNotification: (String value, Color color) {},
                    onComplete: () {
                      _occupyTable();
                    },
                    onCancel:(){
                      tableSeatCubit.unSelectTable();
                    }
                  );
                },
              );
            });
      },
    );
  }

  _occupyTable() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final orderSearchBL = await OrdersDataBuilder.build(executionContextDTO!);
    int tableId = int.parse(selectedOuterTableId.value);
    try {
      tableSeatCubit.changeLoading(true);
      var response = await orderSearchBL.occupyTable(
          tableId: tableId ?? -1,
          facilityTable: FacilityTable(
              Reason: "Reason",
              AdditionalComments: "additionalComments",
              ApprovalDTO: ApproveDTO(
                  ApproverId: executionContextDTO.userPKId ?? -1,
                  Remarks: "Remarks")));
      tableSeatCubit.changeLoading(false);
      Log.v("response $response");
      if (response.exception == null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => SalesScreen(
                      fromTables: true,
                      onClose: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                            refreshScreen.value = 'true';
                            loadfacility();
                            tableSeatCubit.rebuildScreen();
                            refreshScreen.value = '';

                        });
                      },
                    )));
        // Navigator.pop(context);
      }
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      Future.microtask(
          () => showErrorDialog(context, 'Error', errorString ?? ''));
    }
  }

  Future<void> genericOrder()async{
    showDialog(context: context, builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(left: 16,right: 16.0, top: 12,bottom: 60),
        child: AllOrdersScreen(
          isGenericTable: true,
          tableId: int.parse(selectedOuterTableId.value.toString(),
          ),
        ),
      );
    });
  }


  Future<void> getOrderCount() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final orderDataBL = await OrdersDataBuilder.build(execContext!);
    OO.notificationBarStatus.value = '';
    Log.printMethodStart('getOrderCount()','TableSeatLayout','Table');

    try{
      tableSeatCubit.changeLoading(true);
      final response = await orderDataBL.tableOrderCount(tableId: selectedOuterTableId.value.toString());
      tableSeatCubit.changeLoading(false);
      if(response.exception == null || response.message == null){
        print('respo=>${response.data}');
        final data = response.data;
          if(int.parse(data.toString()) <= 1){
            print("Fresh Order, Redirect to Sales Screen-------");
            getOrderHeadViewSingle();
          }else{
            print("More than 1 orders, open pop up & show list of Orders");
            showDialog(context: context, builder: (_) {
              return Padding(
                padding: const EdgeInsets.only(left: 16,right: 16.0, top: 12,bottom: 60),
                child: AllOrdersScreen(
                  tableId: int.parse(selectedOuterTableId.value.toString()),
                    isOccupiedTableFromTableSeat:true,
                    refreshTableSeat: (){
                      loadfacility();
                      tableSeatCubit.rebuildScreen();
                    },
                ),
              );
            }).then((value){
                refreshScreen.value = 'true';
                loadfacility();
                tableSeatCubit.rebuildScreen();
                refreshScreen.value = '';
            });
            //getOrderHeadViewList();
          }
      }
    } on DioError catch(error) {
      Log.printMethodStart('getOrderCount()','TableSeatLayout','Table');
      pressedRowOuterValue.value = '';
      pressedRowOuterValue.value = '';
      pressedRowInnerValue.value = '';
      pressedRowInnerValue.value = '';
      selectedOuterTableId.value = '';
      selectedInnerTableId.value = '';
      refreshScreen.value = '';
      setNotification.value = NotificationMessage(message: '');
      final errorString = error.response?.data['data'] as String?;
    }

  }

  Future<void> getOrderHeadViewSingle() async {
    print('inside getOrderHeadViewSingle()');
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final orderDataBL = await OrdersDataBuilder.build(execContext!);
    OO.notificationBarStatus.value = '';
    Log.printMethodStart('getOrderHeadViewSingle()','TableSeatLayout','Table');
    try{
      tableSeatCubit.changeLoading(true);
      final response  = await orderDataBL.orderHeadView(tableId: selectedOuterTableId.value.toString());
      tableSeatCubit.changeLoading(false);
      if(response.exception == null || response.message == null){
        final data = response.data as List<dynamic>;
        if(data.isNotEmpty){
        Log.printMethodReturn('getOrderHeadViewSingle() - ${selectedOuterTableId.value.toString()}','TableSeatLayout','Table');
        orderIdForMoveSingle = response.data[0]['OrderId'].toString();
        transactionIdForOngoingOrder = response.data[0]['TransactionId'];
        getTransactionData();
        }else{
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return TransactionOrderDetailsDialog(
                    tableId: int.parse(selectedOuterTableId.value.toString()),
                    isUpdate: false,
                    showNotification: (String value, Color color) {},
                    onComplete: () {
                      _occupyTableNew();
                    },
                      onCancel:(){
                        tableSeatCubit.unSelectTable();
                      }
                  );
                },
              );
            },
          );
        }
      }

    } on DioError catch(error) {
      Log.printMethodReturn('getOrderHeadViewSingle() - ${selectedOuterTableId.value.toString()}','TableSeatLayout','Table');
      final errorString = error.response?.data['data'] as String?;
      pressedRowOuterValue.value = '';
      pressedRowOuterValue.value = '';
      pressedRowInnerValue.value = '';
      pressedRowInnerValue.value = '';
      selectedOuterTableId.value = '';
      selectedInnerTableId.value = '';
      refreshScreen.value = '';
      setNotification.value = NotificationMessage(message: '');
    }

  }

  Future<void> getTransactionData() async {
    tableSeatCubit.changeLoading(true);
    print("transactionIdForOngoingOrder : "+transactionIdForOngoingOrder.toString());
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final orderSearchBL = await OrdersDataBuilder.build(executionContextDTO!);
    try{
      Log.printMethodStart('getTransactionData()','TableSeatLayout','Table');
      var response = await orderSearchBL.getTransaction(
        currentPage: 0,
        pageSize: 1,
        trxNumber: "",
        trxId: transactionIdForOngoingOrder,
        orderNo: 0,
        posMachine: -1,//executionContextDTO.machineId,
        status: null,
        otp: "",
        reference:"",
        customerName:"",
        fromDate: null,
        toDate: null,
        staff: null,
        ccNumber: 0 ,
      ).whenComplete(() => Log.printMethodEnd('getTransactionData()','TableSeatLayout','Table'));
      tableSeatCubit.changeLoading(false);
      if(response.exception == null) {
        //_data = response.data;
        Log.printMethodReturn('getTransactionData()','TableSeatLayout','Table');
        TransactionsData? data = response.data?[0];
        String jsonData = jsonEncode(data);
        retrievedData.value = jsonData;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SalesScreen(transactionRetrieveData: jsonData,
              fromTables: true,),
          ),
        ).then((value){
          loadfacility();
          tableSeatCubit.rebuildScreen();
        });

      }

    }catch(error) {
      Log.printMethodReturn('getTransactionData()','TableSeatLayout','Table');
      setNotification.value = NotificationMessage(message: 'Error occurred, please try again', color: AppColors.notificationBGRedColor);
        pressedRowOuterValue.value = '';
        pressedRowOuterValue.value = '';
        pressedRowInnerValue.value = '';
        pressedRowInnerValue.value = '';
        selectedOuterTableId.value = '';
        selectedInnerTableId.value = '';
        refreshScreen.value = '';
        //setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
    }
  }

  Future<void> _checkCurrentUserPrivileges() async {
    Log.printMethodStart('checkCurrentUserPrivileges()','TableSeatLayout','Init');
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final userRoleDTO = await masterDataBL.getUserRoleById(execContext.userRoleId ?? -1);
    _isCurrentUserManager = userRoleDTO?.selfApprovalAllowed == true;
    _currentUserPkId = execContext.userPKId;
    Log.printMethodEnd('checkCurrentUserPrivileges()','TableSeatLayout','Init');
  }

  Future _getConfigurations(BuildContext context) async {
    var execContextBL = await ExecutionContextBuilder.build();
    var sysExecContext = execContextBL.getExecutionContext();
    var masterDataBl = await MasterDataBuilder.build(sysExecContext!);
    _dateFormat = await masterDataBl.getDefaultValuesByName(defaultValueName: "DATETIME_FORMAT");
    _dateFormat = _dateFormat?.replaceAll('tt', 'a');
    var currentDateTime = DateTime.now();
    String formattedDate1 = DateFormat(_dateFormat).format(DateTime(currentDateTime.year, currentDateTime.month, currentDateTime.day, 4, 0, 0,));
    String formattedDate2 = DateFormat(_dateFormat).format(DateTime(currentDateTime.year, currentDateTime.month, currentDateTime.day, 4, 0, 0,).add(Duration(days: 1)));
    fromDateReserve.text = formattedDate1;
    toDateReserve.text = formattedDate2;

    }

  Future<void> getBottomActionButtonStatuses() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final userRoleDTO = await masterDataBL.getUserRoleById(execContext.userRoleId ?? -1);

    OO.notificationBarStatus.value = '';
    final taskTyperesponse = await masterDataBL.getTaskTypeContainerList();



    final taskList = taskTyperesponse.where((element) => (element.category?.toLowerCase() == 'TABLE FUNCTION'.toLowerCase()));
    List<ManagementFormAccessContainerDTO>? userFormAccessList =
    userRoleDTO?.managementFormAccessContainerDTOList.where((element)
    => element.mainMenu.toLowerCase() == 'TABLE FUNCTION'.toLowerCase()).toList();

    accessControlMap = <String,FacilityAccessControlDto>{};
    taskList.forEach((task) {
       switch(task.taskTypeName?.toUpperCase()){
         case  'MERGE' :
                 final facilityAccessControlDto = FacilityAccessControlDto(
                   shouldDisplayTask: task.displayInPos == 'Y' ,
                   managerApprovalRequired: task.requiresManagerApproval == 'Y',
                   isTaskEnabled: userFormAccessList?.where((element) => element.formName == 'MERGE').toList().isNotEmpty ?? false,
                 );
                 accessControlMap['MERGE'] = facilityAccessControlDto;
                 break;
         case  'UNMERGE' :
           final facilityAccessControlDto = FacilityAccessControlDto(
             shouldDisplayTask: task.displayInPos == 'Y' ,
             managerApprovalRequired: task.requiresManagerApproval == 'Y',
             isTaskEnabled: userFormAccessList?.where((element) => element.formName == 'UNMERGE').toList().isNotEmpty ?? false,
           );
           accessControlMap['UNMERGE'] = facilityAccessControlDto;
           break;
         case  'MOVE' :
           final facilityAccessControlDto = FacilityAccessControlDto(
             shouldDisplayTask: task.displayInPos == 'Y' ,
             managerApprovalRequired: task.requiresManagerApproval == 'Y',
             isTaskEnabled: userFormAccessList?.where((element) => element.formName == 'MOVE').toList().isNotEmpty ?? false,
           );
           accessControlMap['MOVE'] = facilityAccessControlDto;
           break;
         case  'DETAILS' :
           final facilityAccessControlDto = FacilityAccessControlDto(
             shouldDisplayTask: task.displayInPos == 'Y' ,
             managerApprovalRequired: task.requiresManagerApproval == 'Y',
             isTaskEnabled: userFormAccessList?.where((element) => element.formName == 'DETAILS').toList().isNotEmpty ?? false,
           );
           accessControlMap['DETAILS'] = facilityAccessControlDto;
           break;

         case  'RESERVE' :
           final facilityAccessControlDto = FacilityAccessControlDto(
             shouldDisplayTask: task.displayInPos == 'Y' ,
             managerApprovalRequired: task.requiresManagerApproval == 'Y',
             isTaskEnabled: userFormAccessList?.where((element) => element.formName == 'RESERVE').toList().isNotEmpty ?? false,
           );
           accessControlMap['RESERVE'] = facilityAccessControlDto;
           break;
         case  'BLOCK' :
           final facilityAccessControlDto = FacilityAccessControlDto(
             shouldDisplayTask: task.displayInPos == 'Y' ,
             managerApprovalRequired: task.requiresManagerApproval == 'Y',
             isTaskEnabled: userFormAccessList?.where((element) => element.formName == 'BLOCK').toList().isNotEmpty ?? false,
           );
           accessControlMap['BLOCK'] = facilityAccessControlDto;
           break;
         case  'CLEAR' :
           final facilityAccessControlDto = FacilityAccessControlDto(
             shouldDisplayTask: task.displayInPos == 'Y' ,
             managerApprovalRequired: task.requiresManagerApproval == 'Y',
             isTaskEnabled: userFormAccessList?.where((element) => element.formName == 'CLEAR').toList().isNotEmpty ?? false,
           );
           accessControlMap['CLEAR'] = facilityAccessControlDto;
           break;

       }

    });
    tableSeatCubit.rebuildScreen();

  }

  Future<void> getTableStatusesForHelpScreen1() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final facilityTableStatusResponse = await masterDataBL.getFacilityTableStatus();
    facilityTableStatusResponse?.forEach((element) {
      tableStatuses1.add("(${element.statusCode.toString()},${element.color.toString()},${element.character.toString()})");
    });
    OO.notificationBarStatus.value = '';
  }

  Future<void> getTableStatusesForHelpScreen2() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    OO.notificationBarStatus.value = '';
    final http.Response response = await http.get(
      Uri.parse("${appPrefsBL.getServerUrl()}/api/Transaction/TransactionPaymentStatusContainer"),
      headers: {
        "Authorization" : "${execContext.webApiToken}",
        "Content-Type" : "application/json",
      },
    );
    if(response.statusCode != 200){

      print(json.decode(response.body)['data']);

    }else{
      print(json.decode(response.body)['data']);
        tableStatuses2 = List.generate(json.decode(response.body)['data']['PaymentStatusContainerDTOList'].length,
                (index) => "("+json.decode(response.body)['data']['PaymentStatusContainerDTOList'][index]['StatusCode'].toString()+","+
                json.decode(response.body)['data']['PaymentStatusContainerDTOList'][index]['Color'].toString()+","+
                json.decode(response.body)['data']['PaymentStatusContainerDTOList'][index]['Character'].toString()+")");

    }
  }

  Future<void> getTableStatusesForHelpScreen3() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final orderStatusResponse = await orderDataBL.getTransactionStatus();
    orderStatusResponse?.forEach((element) {
      tableStatuses1.add("(${element.statusCode.toString()},${element.color.toString()},${element.character.toString()})");
    });
    OO.notificationBarStatus.value = '';
  }


  mergeTablePopUp({ required List<dynamic> listRow,
    required List<dynamic> listColumn,
    required List<dynamic> listOfNames,required List<dynamic> ascRowList,
    required List<dynamic>ascColumnList,
    required List<FacilityTableContainerDTO> listOfTables,
    required int pressedRowValue,
    required int pressedColumnValue,}){
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    final ScrollController _vControllerInside = ScrollController();
    final ScrollController _hControllerInside = ScrollController();
    int selectedColoumValue =-1;
    int selectedRowValue =-1;
    showDialog(
      context: context,
      builder: (BuildContext contextNew) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: theme.backGroundColor,
             // insetPadding: EdgeInsets.zero,
              titlePadding: const EdgeInsets.only(top: 8),
              contentPadding: EdgeInsets.zero,
              actionsPadding: const EdgeInsets.only(bottom: 8),
              title: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Merge ${selectedOuterTableName.value.toString()} to", style: theme.subtitle2,),
                  const SizedBox(height: 2,),
                  Divider(color: theme.secondaryColor,height: 0.3,),
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

            content: Scroller(
              controller: _vControllerInside,
              child: SingleChildScrollView(
                controller: _vControllerInside,
                scrollDirection: Axis.vertical,
                child:
                Scroller(
                  controller: _hControllerInside,
                  child: SingleChildScrollView(
                    controller: _hControllerInside,
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var j in ascRowList)
                          Row(
                            children: [
                              for (var i in ascColumnList)
                                Stack(
                                  children: [
                                    SizedBox(
                                      width: 38,
                                      height: 38,
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: InkWell(
                                            onTap: (){
                                              if(pressedColumnValue == j && pressedRowValue == i){
                                                return;
                                              }
                                              pressedRowInnerValue.value = "$i";
                                              pressedColumnInnerValue.value = "$j";
                                              tmp = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                  element.columnIndex == i).tableId.toString();
                                              selectedInnerTableId.value = '$tmp';
                                              setState((){
                                                selectedRowValue = i;
                                                selectedColoumValue = j;
                                              });
                                            },
                                            child:
                                            // (pressedColumnInnerValue.value == "$j" && pressedRowInnerValue.value == "$i") ||
                                            (pressedColumnValue == j && pressedRowValue == i) || (selectedColoumValue == j && selectedRowValue == i)? Container(
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
                                            ):
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
                                            )
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
                                ),

                              SizedBox(
                                width: 50,
                              )
                            ],
                          ),

                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
              actions: [
                Divider(color: theme.secondaryColor,height: 0.3,),
                const SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SecondaryLargeButton(onPressed: () {
                      pressedRowOuterValue.value = '';
                      pressedColumnOuterValue.value = '';
                      showOrderModeButtons = false;
                      Navigator.of(context).pop();
                    },text:MessagesProvider.get('Cancel').toUpperCase(),),
                    const SizedBox(width: 10,),
                    PrimaryLargeButton(onPressed: (){
                      Navigator.of(context).pop();
                      mergeTables();
                    },
                      text: MessagesProvider.get('Ok').toUpperCase(),
                      buttonColor: theme.secondaryColor,
                    ),
                  ],
                ),
              ],
            );
          },

        );
      },
    );
  }


  Future<void> mergeTables() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final orderDataBL = await OrdersDataBuilder.build(execContext!);
    OO.notificationBarStatus.value = '';
    Log.printMethodStart('mergeTables()','TableSeatLayout','Merge');
    try{
      final response = await orderDataBL.mergeTable(tableId: selectedOuterTableId.value.toString(), body:   {
        "MergeSourceTableId" : int.parse(selectedInnerTableId.value.toString()),
        "Reason": "reason",
        "AdditionalComments": "additionalComments",
        "ApprovalDTO": {
          "ApproverId": execContext.userPKId ?? -1,
          "Remarks": "remarks"
        }
      });
      Log.printMethodEnd('mergeTables()','TableSeatLayout','Merge');
      if (response.exception == null || response.message ==null) {
        refreshScreen.value = '';
        Log.printMethodReturn('mergeTables() - Tables merged successfully','TableSeatLayout','Merge');
        OO.notificationBarStatus.value = MessagesProvider.get("Tables merged successfully");
        setNotification.value = NotificationMessage(message: MessagesProvider.get("Tables merged successfully"),color: AppColors.notificationBGLightBlueColor);
        pressedRowOuterValue.value = '';
        pressedRowOuterValue.value = '';
        pressedRowInnerValue.value = '';
        pressedRowInnerValue.value = '';
        selectedOuterTableId.value = '';
        selectedInnerTableId.value = '';
        loadfacility();
        tableSeatCubit.rebuildScreen();
      }
    }on DioError catch(error){
      final errorString = error.response?.data['data'] as String?;

      log('Error in merge=> $error');
      Log.printMethodReturn('mergeTables()','TableSeatLayout','Merge');
      OO.notificationBarStatus.value = errorString.toString();
      setNotification.value = NotificationMessage(message: errorString.toString(),color: AppColors.notificationBGRedColor);
      pressedRowOuterValue.value = '';
      pressedRowOuterValue.value = '';
      pressedRowInnerValue.value = '';
      pressedRowInnerValue.value = '';
      selectedOuterTableId.value = '';
      selectedInnerTableId.value = '';
      refreshScreen.value = '';
    }
  }
  Future<void> unMergeTable() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final orderDataBL = await OrdersDataBuilder.build(execContext!);
    OO.notificationBarStatus.value = '';
    Log.printMethodStart('unMergeTable()','TableSeatLayout','UnMerge');
    try{
      final response = await orderDataBL.unMergeTable(tableId: selectedOuterTableId.value.toString(), body:   {
        "Reason": "reason",
        "AdditionalComments": "additionalComments",
        "ApprovalDTO": {
          "ApproverId": execContext.userPKId ?? -1,
          "Remarks": "remarks"
        }
      });
      Log.printMethodEnd('unMergeTable()','TableSeatLayout','UnMerge');



      if(response.message == null || response.exception == null){
          refreshScreen.value = '';
        Log.printMethodReturn('unMergeTable() - Tables un-merged successfully','TableSeatLayout','UnMerge');
        print('merge res=>${response.data}');
        setNotification.value = NotificationMessage(message:'');
          pressedRowOuterValue.value = '';
          pressedRowOuterValue.value = '';
          pressedRowInnerValue.value = '';
          pressedRowInnerValue.value = '';
          selectedOuterTableId.value = '';
          selectedOuterTableIdUnMerge.value = '';
          selectedInnerTableId.value = '';
          selectedOuterTableId.value = '';
          pressedRowOuterValue.value = '';
          pressedColumnOuterValue.value = '';
          loadfacility();
          tableSeatCubit.rebuildScreen();
      }

    } on DioError catch (error){
      Log.printMethodReturn('unMergeTable()','TableSeatLayout','UnMerge');
      final errorString = error.response?.data['data'] as String?;
      OO.notificationBarStatus.value = errorString.toString();
      setNotification.value = NotificationMessage(message: errorString.toString(),color: AppColors.notificationBGRedColor);
        pressedRowOuterValue.value = '';
        pressedRowOuterValue.value = '';
        pressedRowInnerValue.value = '';
        pressedRowInnerValue.value = '';
        selectedOuterTableId.value = '';
        selectedInnerTableId.value = '';
        refreshScreen.value = '';
        selectedOuterTableId.value = '';
        pressedRowOuterValue.value = '';
        pressedColumnOuterValue.value = '';
        //setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
        showOrderModeButtons = false;

    }

  }
  Future<void> clearTable() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final orderDataBL = await OrdersDataBuilder.build(execContext!);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    OO.notificationBarStatus.value = '';
    Log.printMethodStart('clearTable()','TableSeatLayout','Clear');
    try{
      final response = await orderDataBL.clearTable(tableId: selectedOuterTableId.value.toString(), body:   {
        "Reason": "reason",
        "AdditionalComments": "${additionalCommentsClear.text.toString()}",
        "ApprovalDTO": {
          "ApproverId": approvedUserPkId == 0 ? (execContext.userPKId ?? -1) : approvedUserPkId,
          "Remarks": "remarks"
        }
      });
      Log.printMethodEnd('clearTable()','TableSeatLayout','Clear');
      if(response.message == null || response.exception == null){
          refreshScreen.value = '';
        Log.printMethodReturn('clearTable() - Table cleared successfully','TableSeatLayout','Clear');
        OO.notificationBarStatus.value =  MessagesProvider.get("Table cleared successfully ");
        setNotification.value = NotificationMessage(message: MessagesProvider.get("Table cleared successfully "),color: AppColors.notificationBGLightBlueColor);
          pressedRowOuterValue.value = '';
          pressedRowOuterValue.value = '';
          pressedRowInnerValue.value = '';
          pressedRowInnerValue.value = '';
          selectedOuterTableId.value = '';
          selectedInnerTableId.value = '';
          selectedOuterTableId.value = '';
          pressedRowOuterValue.value = '';
          pressedColumnOuterValue.value = '';
          loadfacility();
          tableSeatCubit.rebuildScreen();
      }
    } on DioError catch (error){
      final errorString = error.response?.data['data'] as String?;
      Log.printMethodReturn('clearTable()','TableSeatLayout','Clear');
      OO.notificationBarStatus.value = errorString.toString();
      setNotification.value = NotificationMessage(message:errorString.toString(), color: AppColors.notificationBGRedColor);
        pressedRowOuterValue.value = '';
        pressedRowOuterValue.value = '';
        pressedRowInnerValue.value = '';
        pressedRowInnerValue.value = '';
        selectedOuterTableId.value = '';
        selectedInnerTableId.value = '';
        refreshScreen.value = '';
        selectedOuterTableId.value = '';
        pressedRowOuterValue.value = '';
        pressedColumnOuterValue.value = '';
        showOrderModeButtons = false;
    }

  }
  Future<void> blockTable() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final orderDataBL = await OrdersDataBuilder.build(execContext!);
    OO.notificationBarStatus.value = '';
    Log.printMethodStart('blockTable()','TableSeatLayout','Block');
    try{
      final response = await orderDataBL.blockTable(tableId: selectedOuterTableId.value.toString(),body:   {
        "Reason": selectedLocation.toString(), // Should be from lookup for Table Block.
        "AdditionalComments": additionalCommentsBlock.text.toString(),
        "ApprovalDTO": {
          "ApproverId": execContext.userPKId ?? -1,
          "Remarks": "remarks"
        }
      });
      Log.printMethodEnd('blockTable()','TableSeatLayout','Block');
      if(response.message == null || response.exception == null) {

          _getCurrentStatuses();
          refreshScreen.value = '';
        Log.printMethodReturn('blockTable() - Table blocked successfully','TableSeatLayout','Block');
        OO.notificationBarStatus.value = MessagesProvider.get("Table blocked successfully ");
        setNotification.value = NotificationMessage(message: MessagesProvider.get("Table blocked successfully "), color: AppColors.notificationBGLightBlueColor);
          additionalCommentsBlock.clear();
          pressedRowOuterValue.value = '';
          pressedRowOuterValue.value = '';
          pressedRowInnerValue.value = '';
          pressedRowInnerValue.value = '';
          selectedOuterTableId.value = '';
          selectedInnerTableId.value = '';
          selectedOuterTableId.value = '';
          pressedRowOuterValue.value = '';
          pressedColumnOuterValue.value = '';
          loadfacility();
          tableSeatCubit.rebuildScreen();
      }
      }on DioError catch(error){
      final errorString = error.response?.data['data'] as String?;

      Log.printMethodReturn('blockTable()','TableSeatLayout','Block');
      OO.notificationBarStatus.value = errorString.toString();
      setNotification.value = NotificationMessage(message: errorString.toString(),color: AppColors.notificationBGRedColor);
        pressedRowOuterValue.value = '';
        pressedRowOuterValue.value = '';
        pressedRowInnerValue.value = '';
        pressedRowInnerValue.value = '';
        selectedOuterTableId.value = '';
        selectedInnerTableId.value = '';
        refreshScreen.value = '';
        selectedOuterTableId.value = '';
        pressedRowOuterValue.value = '';
        pressedColumnOuterValue.value = '';
        showOrderModeButtons = false;
    }

  }
  _getCurrentStatuses() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final orderDataBL = await OrdersDataBuilder.build(execContext!);
    facilityTableCurrentStatusDTO = await orderDataBL.getFacilityTableCurrentStatuses();
    Log.v("FacilityTableCurrentStatusDTO count ${facilityTableCurrentStatusDTO?.length}");
  }
  updateDetails()async{
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final orderDataBL = await OrdersDataBuilder.build(execContext!);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    OO.notificationBarStatus.value = '';
    Log.printMethodStart('updateDetails()','TableSeatLayout','OK');
    setNotification.value = NotificationMessage(message:'Server Action is in progress', color: Colors.yellow);
    try{
      final response = await orderDataBL.updateDetails(tableId: selectedOuterTableId.value.toString(), body: {
        "Reason": null,
        "AdditionalComments": additionalCommentsReserve.text.toString(),
        "ApprovalDTO": null,
        "TableReservationDetailsDTO" : {
          "TableReservationDetailId" : -1,
          "FacilityTableStatusChangeLogId" : -1,
          "CustomerName" : customerNameReserve.text.toString(),
          "AdditionalComments" : additionalCommentsReserve.text.toString(),
          "ReserveFromTime" : fromDateReserve.text.toString(),
          "ReserveToTime" : toDateReserve.text.toString(),
          "Occasion" : occasionReserve.text.toString(),
          "Contact" : contactReserve.text.toString(),
          "IsActive" : true,
          "Guid":null
        },
      });
      setNotification.value = NotificationMessage(message:'', color: theme.footerBG4);

      //   {"TableReservationDetailId":-1,"FacilityTableStatusChangeLogId":-1,"ReserveToTime":"2023-12-11T13:39:14","AdditionalComments":"","Occasion":"","CustomerName":"jishnu","ReserveFromTime":"2023-12-11T13:39:14","Contact":"684054978","IsActive":true,"Guid":null,"SiteId":-1,"SynchStatus":false,
    // "MasterEntityId":-1,"LastUpdatedDate":"0001-01-01T00:00:00","LastUpdatedBy":null,"CreatedBy":null,"CreationDate":"0001-01-01T00:00:00","IsChanged":true}
      if(response.exception == null || response.message == null){
        loadfacility();
        tableSeatCubit.rebuildScreen();
      }
    } on DioError catch(error){
      final errorString = error.response?.data['data'] as String?;
      OO.notificationBarStatus.value = errorString.toString();
      setNotification.value = NotificationMessage(message: errorString.toString(), color: AppColors.notificationBGRedColor);
    }
  }
  Future<void> reserveTable() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final orderDataBL = await OrdersDataBuilder.build(execContext!);
    OO.notificationBarStatus.value = '';
    Log.printMethodStart('reserveTable()','TableSeatLayout','Reserve');
    try{
      final response = await orderDataBL.reserveTable(tableId: selectedOuterTableId.value.toString(), body: {
        "Reason": "Others",
        "AdditionalComments": additionalCommentsReserve.text.toString(),
        "ApprovalDTO": {
          "ApproverId": execContext.userPKId ?? -1,
          "Remarks": "remarks"
        },
        "TableReservationDetailsDTO" : {
          "ReservationDetailsId" : -1,
          "FacilityTableStatusChangeLogId" : -1,
          "CustomerName" : customerNameReserve.text.toString(),
          "AdditionalComments" : additionalCommentsReserve.text.toString(),
          "ReserveFromTime" : fromDateReserve.text.toString(),
          "ReserveToTime" : toDateReserve.text.toString(),
          "Occasion" : occasionReserve.text.toString(),
          "Contact" : contactReserve.text.toString(),
          "IsActive" : true
        },
      });
      Log.printMethodEnd('reserveTable()','TableSeatLayout','Reserve');
      if(response.exception == null || response.message == null){
          _getCurrentStatuses();
          refreshScreen.value = '';
          Log.printMethodReturn('reserveTable() - Table reserved successfully','TableSeatLayout','Reserve');
          OO.notificationBarStatus.value = MessagesProvider.get("Table reserved successfully ");
          setNotification.value = NotificationMessage(message: MessagesProvider.get("Table reserved successfully "), color: AppColors.notificationBGLightBlueColor);
          additionalCommentsBlock.clear();
          pressedRowOuterValue.value = '';
          pressedRowOuterValue.value = '';
          pressedRowInnerValue.value = '';
          pressedRowInnerValue.value = '';
          selectedOuterTableId.value = '';
          selectedInnerTableId.value = '';
          selectedOuterTableId.value = '';
          pressedRowOuterValue.value = '';
          pressedColumnOuterValue.value = '';
          pickedDateTo = null;
          pickedDateFrom = null;
          loadfacility();
          tableSeatCubit.rebuildScreen();
          tableSeatCubit.unSelectTable();

      }
    } on DioError catch (error){
      final errorString = error.response?.data['data'] as String?;
      Log.printMethodReturn('reserveTable() ','TableSeatLayout','Reserve');
      OO.notificationBarStatus.value = errorString.toString();
      setNotification.value = NotificationMessage(message: errorString.toString(), color: AppColors.notificationBGRedColor);
        pressedRowOuterValue.value = '';
        pressedRowOuterValue.value = '';
        pressedRowInnerValue.value = '';
        pressedRowInnerValue.value = '';
        selectedOuterTableId.value = '';
        selectedInnerTableId.value = '';
        refreshScreen.value = '';
        selectedOuterTableId.value = '';
        pressedRowOuterValue.value = '';
        pressedColumnOuterValue.value = '';
        //setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
        showOrderModeButtons = false;
    }
  }

  Future<void> moveOperationManager()async{
      showLoading = true;
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();
      final orderDataBL = await OrdersDataBuilder.build(execContext!);
      final appPrefsBL = await ApplicationPrefsBuilder.build();
      OO.notificationBarStatus.value = '';
      Log.printMethodStart('getOrdersCount()','TableSeatLayout','Move');
      final http.Response response = await http.get(
        Uri.parse("${appPrefsBL.getServerUrl()}/api/Transaction/OrdersCount?tableId=${selectedOuterTableId.value.toString()}"),
        headers: {
          "Authorization" : "${execContext.webApiToken}",
          "Content-Type" : "application/json",
        },
      ).whenComplete(() => Log.printMethodEnd('getOrdersCount()','TableSeatLayout','Move'));
      if(response.statusCode != 200){
        showLoading = false;
        print("Error");
        print("Error");
        Log.printMethodReturn('getOrdersCount()','TableSeatLayout','Move');
          pressedRowOuterValue.value = '';
          pressedRowOuterValue.value = '';
          pressedRowInnerValue.value = '';
          pressedRowInnerValue.value = '';
          selectedOuterTableId.value = '';
          selectedInnerTableId.value = '';
          refreshScreen.value = '';
          tableSeatCubit.rebuildScreen();
          //setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
        print("Error");
        print("Error");
      }else{
        print("Success");
        print("Success");
        Log.printMethodReturn('getOrdersCount()','TableSeatLayout','Move');

        if(int.parse(json.decode(response.body)['data'].toString()) == 0){
          setNotification.value = NotificationMessage(message: 'Selected table has no orders to move',
              color:AppColors.notificationBGLightYellowColor);
            showOrderModeButtons = false;
          pressedRowOuterValue.value = '';
          pressedRowOuterValue.value = '';
          pressedRowInnerValue.value = '';
          pressedRowInnerValue.value = '';
          selectedOuterTableId.value = '';
          selectedInnerTableId.value = '';
          refreshScreen.value = '';
          loadfacility();
          tableSeatCubit.rebuildScreen();

        }else{
          if(int.parse(json.decode(response.body)['data'].toString()) <= 1){
            //print("Fresh Order, Redirect to Sales Screen");
            OO.notificationBarStatus.value = '';
            Log.printMethodStart('getOrderHeaderView()','TableSeatLayout','Move');
            final http.Response response = await http.get(
              Uri.parse("${appPrefsBL.getServerUrl()}/api/Transaction/OrderHeaderView?tableId=${selectedOuterTableId.value.toString()}&orderStatusInList=ORDERED,INITIATED"),
              headers: {
                "Authorization" : "${execContext.webApiToken}",
                "Content-Type" : "application/json",
              },
            ).whenComplete(() => Log.printMethodEnd('getOrderHeaderView()','TableSeatLayout','Move'));
            if(response.statusCode != 200){
              showLoading = false;
              print("Error");
              print("Error");
              Log.printMethodReturn('getOrderHeaderView()','TableSeatLayout','Move');
                showOrderModeButtons = false;
                pressedRowOuterValue.value = '';
                pressedRowOuterValue.value = '';
                pressedRowInnerValue.value = '';
                pressedRowInnerValue.value = '';
                selectedOuterTableId.value = '';
                selectedInnerTableId.value = '';
                refreshScreen.value = '';
                //setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
              tableSeatCubit.rebuildScreen();

              print("Error");
              print("Error");
            }else{
              print("Success");
              print("Success");
              Log.printMethodReturn('getOrderHeaderView()','TableSeatLayout','Move');
              //setState(() {
              if(json.decode(response.body)['data'].toString()== "[]"){
                setNotification.value = NotificationMessage(message: 'Selected table has no orders to move',
                    color:AppColors.notificationBGLightYellowColor);

                //Future.delayed(Duration(seconds: 3),(){
                pressedRowOuterValue.value = '';
                pressedRowOuterValue.value = '';
                pressedRowInnerValue.value = '';
                pressedRowInnerValue.value = '';
                selectedOuterTableId.value = '';
                selectedInnerTableId.value = '';
                refreshScreen.value = '';
                tableSeatCubit.rebuildScreen();

                //});
              }else{
                orderIdFromAllOrdersScreen.value = json.decode(response.body)['data'][0]['OrderId'].toString();
                orderIdForMoveSingle = json.decode(response.body)['data'][0]['OrderId'].toString();
                transactionIdForOngoingOrder = json.decode(response.body)['data'][0]['TransactionId'];
                //});
                //getTransactionData();
                Future.delayed(Duration(seconds: 1),(){
                  setNotification.value = NotificationMessage(message: 'Performing table action Move',color:AppColors.notificationBGLightBlueColor);
                  showLoading = false;
                  showDialog(
                    context: context,
                    builder: (BuildContext contextNew) {
                      return StatefulBuilder(
                        builder: (contextNew, setState) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 60,left: 10,right: 10,top: 10),
                              child: TableSeatLayoutMove(),
                            ),
                          );
                        },
                      );
                    },
                  ).then((value){
                    if(refreshScreen.value == 'poppedfromorders'){
                      // setState(() {
                        refreshScreen.value = 'true';
                        showOrderModeButtons = false;
                      // });
                      // Future.delayed(Duration(seconds: 2),(){
                      //   setState(() {
                      //   });
                      // });
                      loadfacility();
                      tableSeatCubit.rebuildScreen();
                        refreshScreen.value = '';
                    }else{

                    }
                  });
                });
                print("Retrieving transaction data for ID : "+transactionIdForOngoingOrder.toString());
                print("Success");
                print("Success");
              }
            }
          }else{
            showLoading = false;
            //print("More than 1 orders, open pop up & show list of Orders");
            orderIdFromAllOrdersScreen.value = '';
            transactionIdFromAllOrdersScreen.value = '';
            moveOperationFromAllOrdersScreen.value = '';
            showDialog(context: context, builder: (_) {
              print('bere');
              return Padding(
                padding: const EdgeInsets.only(left: 16,right: 16.0, top: 12,bottom: 60),
                child: AllOrdersScreen(
                  tableId: int.parse(selectedOuterTableId.value.toString()),
                  operation: 'MOVE',
                ),
              );
            }).then((value){
              // print("OrderId from AllOrdersScreen : "+orderIdFromAllOrdersScreen.value.toString());
              // print("TransactionId from AllOrdersScreen : "+transactionIdFromAllOrdersScreen.value.toString());
              // print("Operation : "+moveOperationFromAllOrdersScreen.value.toString());
              tableSeatCubit.unSelectTable();
              if(orderIdFromAllOrdersScreen.value.isNotEmpty){
                // setState(() {
                  orderIdForMoveSingle = orderIdFromAllOrdersScreen.value.toString();
                // });
                if(moveOperationFromAllOrdersScreen.value == 'OnlyMoveOrderToTable'){
                  showDialog(
                    context: context,
                    builder: (BuildContext contextNew) {
                      return StatefulBuilder(
                        builder: (contextNew, setState) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 60,left: 10,right: 10,top: 10),
                              child: TableSeatLayoutMove(),
                            ),
                          );
                        },
                      );
                    },
                  ).then((value){
                    print("OrderId from AllOrdersScreen : "+orderIdFromAllOrdersScreen.value.toString());
                    print("TransactionId from AllOrdersScreen : "+transactionIdFromAllOrdersScreen.value.toString());
                    print("Operation : "+moveOperationFromAllOrdersScreen.value.toString());
                    if(refreshScreen.value == 'poppedfromorders'){
                      Future.delayed(Duration(seconds: 1),(){
                          refreshScreen.value = '';
                          loadfacility();
                          tableSeatCubit.rebuildScreen();
                      });
                    }
                  });
                }else{
                  showDialog(
                    context: context,
                    builder: (BuildContext contextNew) {
                      return StatefulBuilder(
                        builder: (contextNew, setState) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 60,left: 10,right: 10,top: 10),
                              child: TableSeatLayoutMove(),
                            ),
                          );
                        },
                      );
                    },
                  ).then((value){
                    print("OrderId from AllOrdersScreen : "+orderIdFromAllOrdersScreen.value.toString());
                    print("TransactionId from AllOrdersScreen : "+transactionIdFromAllOrdersScreen.value.toString());
                    print("Operation : "+moveOperationFromAllOrdersScreen.value.toString());
                    if(refreshScreen.value == 'poppedfromorders'){

                        refreshScreen.value = 'true';
                        showOrderModeButtons = false;

                      Future.delayed(Duration(seconds: 1),(){
                          refreshScreen.value = '';
                          loadfacility();
                          tableSeatCubit.rebuildScreen();
                      });
                    }else{

                    }
                  });
                }
              }else{

              }
            });
            //getOrderHeadViewList();
          }
        }

        print("Success");
        print("Success");
      }

  }
  Future<void> moveOperationUser()async{
      showDialog(context: context, builder: (ctx) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: SizeConfig.getSize(220)),
          child: ManagerLoginView(
            onLoginSuccess: (response) async {
              print("response :::::: "+response.toString());
              print("Approver New ID : "+response.data!.userPKId.toString());

                approvedUserPkId = response.data!.userPKId;

            },
            onLoginError: (err) {
              setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Error! Please try again "),
                  color: AppColors.notificationBGRedColor);
              // Future.delayed(Duration(seconds: 3),(){
              //   setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
              // });
            },
          ),
        );
      }).whenComplete(() async {
          showOrderModeButtons = false;
        tableSeatCubit.rebuildScreen();
        if(approvedUserPkId != 0){
          showLoading = true;
          tableSeatCubit.loading(isLoading: true);
          if(selectedOuterTableStatus.value == 'OCCUPIED' || selectedOuterTableCharacter.value == 'O'){
            final execContextBL = await ExecutionContextBuilder.build();
            final execContext = execContextBL.getExecutionContext();
            final orderDataBL = await OrdersDataBuilder.build(execContext!);
            final appPrefsBL = await ApplicationPrefsBuilder.build();
            OO.notificationBarStatus.value = '';
            Log.printMethodStart('getOrdersCount()','TableSeatLayout','Move');
            final http.Response response = await http.get(
              Uri.parse("${appPrefsBL.getServerUrl()}/api/Transaction/OrdersCount?tableId=${selectedOuterTableId.value.toString()}"),
              headers: {
                "Authorization" : "${execContext.webApiToken}",
                "Content-Type" : "application/json",
              },
            ).whenComplete(() => Log.printMethodEnd('getOrdersCount()','TableSeatLayout','Move'));
            if(response.statusCode != 200){
              showLoading = false;
              tableSeatCubit.loading(isLoading: false);
              print("Error");
              print("Error");
              Log.printMethodReturn('getOrdersCount()','TableSeatLayout','Move');
                pressedRowOuterValue.value = '';
                pressedRowOuterValue.value = '';
                pressedRowInnerValue.value = '';
                pressedRowInnerValue.value = '';
                selectedOuterTableId.value = '';
                selectedInnerTableId.value = '';
                refreshScreen.value = '';
                //setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
                loadfacility();
                tableSeatCubit.rebuildScreen();
              print("Error");
              print("Error");
            }else{
              print("Success");
              print("Success");
              Log.printMethodReturn('getOrdersCount()','TableSeatLayout','Move');

              if(int.parse(json.decode(response.body)['data'].toString()) <= 1){
                //print("Fresh Order, Redirect to Sales Screen");
                final execContextBL = await ExecutionContextBuilder.build();
                final execContext = execContextBL.getExecutionContext();
                final orderDataBL = await OrdersDataBuilder.build(execContext!);
                final appPrefsBL = await ApplicationPrefsBuilder.build();
                OO.notificationBarStatus.value = '';
                Log.printMethodStart('getOrderHeaderView()','TableSeatLayout','Move');
                final http.Response response = await http.get(
                  Uri.parse("${appPrefsBL.getServerUrl()}/api/Transaction/OrderHeaderView?tableId=${selectedOuterTableId.value.toString()}&orderStatusInList=ORDERED,INITIATED"),
                  headers: {
                    "Authorization" : "${execContext.webApiToken}",
                    "Content-Type" : "application/json",
                  },
                ).whenComplete(() => Log.printMethodEnd('getOrderHeaderView()','TableSeatLayout','Move'));
                if(response.statusCode != 200){
                  showLoading = false;
                  tableSeatCubit.loading(isLoading: false);
                  print("Error");
                  print("Error");
                  Log.printMethodReturn('getOrderHeaderView()','TableSeatLayout','Move');
                    pressedRowOuterValue.value = '';
                    pressedRowOuterValue.value = '';
                    pressedRowInnerValue.value = '';
                    pressedRowInnerValue.value = '';
                    selectedOuterTableId.value = '';
                    selectedInnerTableId.value = '';
                    refreshScreen.value = '';
                    //setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
                  tableSeatCubit.rebuildScreen();
                  print("Error");
                  print("Error");
                }else{
                  print("Success");
                  print("Success");
                  Log.printMethodReturn('getOrderHeaderView()','TableSeatLayout','Move');
                  //setState(() {
                  orderIdForMoveSingle = json.decode(response.body)['data'][0]['OrderId'].toString();
                  transactionIdForOngoingOrder = json.decode(response.body)['data'][0]['TransactionId'];
                  //});
                  //getTransactionData();
                  Future.delayed(Duration(seconds: 1),(){
                    setNotification.value = NotificationMessage(message: 'Performing table action Move',color:AppColors.notificationBGLightBlueColor);
                    // Future.delayed(Duration(seconds: 3),(){
                    //   setState(() {
                    //     setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
                    //   });
                    // });
                    showLoading = false;
                    tableSeatCubit.loading(isLoading: false);
                    showDialog(
                      context: context,
                      builder: (BuildContext contextNew) {
                        return StatefulBuilder(
                          builder: (contextNew, setState) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 60,left: 10,right: 10,top: 10),
                                child: TableSeatLayoutMove(),
                              ),
                            );
                          },
                        );
                      },
                    );
                  });
                  print("Retrieving transaction data for ID : "+transactionIdForOngoingOrder.toString());
                  print("Success");
                  print("Success");
                }
              }else{
                showLoading = false;
                tableSeatCubit.loading(isLoading: false);
                //print("More than 1 orders, open pop up & show list of Orders");
                orderIdFromAllOrdersScreen.value = '';
                transactionIdFromAllOrdersScreen.value = '';
                moveOperationFromAllOrdersScreen.value = '';
                showDialog(context: context, builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16.0, top: 12,bottom: 60),
                    child: AllOrdersScreen(
                      tableId: int.parse(selectedOuterTableId.value.toString()),
                      operation: 'MOVE',
                    ),
                  );
                }).then((value){
                  print("OrderId from AllOrdersScreen : "+orderIdFromAllOrdersScreen.value.toString());
                  print("TransactionId from AllOrdersScreen : "+transactionIdFromAllOrdersScreen.value.toString());
                  print("Operation : "+moveOperationFromAllOrdersScreen.value.toString());
                    showOrderModeButtons = false;
                  if(refreshScreen.value == 'poppedfromorders'){
                      refreshScreen.value = 'true';
                      showOrderModeButtons = false;
                        refreshScreen.value = '';
                        loadfacility();
                        tableSeatCubit.rebuildScreen();

                  }
                  if(orderIdFromAllOrdersScreen.value.isNotEmpty){
                      orderIdForMoveSingle = orderIdFromAllOrdersScreen.value.toString();
                    if(moveOperationFromAllOrdersScreen.value == 'OnlyMoveOrderToTable'){
                      showDialog(
                        context: context,
                        builder: (BuildContext contextNew) {
                          return StatefulBuilder(
                            builder: (contextNew, setState) {
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 60,left: 10,right: 10,top: 10),
                                  child: TableSeatLayoutMove(),
                                ),
                              );
                            },
                          );
                        },
                      ).then((value){
                        if(refreshScreen.value == 'poppedfromorders'){
                            refreshScreen.value = 'true';
                            showOrderModeButtons = false;
                            refreshScreen.value = '';
                            loadfacility();
                            tableSeatCubit.rebuildScreen();
                        }
                      });
                    }else{

                    }
                  }
                });
              }

              print("Success");
              print("Success");
            }
          }else{
            setNotification.value = NotificationMessage(message:  MessagesProvider.get("Operation is not allowed "),
                color: AppColors.notificationBGLightYellowColor);
          }
        }
      });

  }
  _showReserveDialog(bool detailStatus) {

    String Status = detailStatus ? 'DETAILS' : 'RESERVE';
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    setNotification.value = NotificationMessage(
        message: MessagesProvider.get('Performing table action &1 ',[Status]),
        color: theme.footerBG4);
    FacilityTableCurrentStatusDTO details;
    //var tableStatus = _facilityTableCurrentStatusDTO?.where((element) => element.tableId.toString() == selectedOuterTableId.value);
    bool isDataLoaded = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        _screenSize = MediaQuery.of(context).size;
        _screenHeight = _screenSize!.height;
        _screenWidth = _screenSize!.width;
        return StatefulBuilder(
          builder:(context, setState) {
            if(!isDataLoaded){
              if(Status == "DETAILS"){
                  customerNameReserve.clear();
                  contactReserve.clear();
                  occasionReserve.clear();
                  additionalCommentsReserve.clear();

                facilityTableCurrentStatusDTO?.forEach((element) {
                  if(element.tableId.toString() == selectedOuterTableId.value){
                    print("selected table statuss ${element.reserveFromTime} ${element.customerName}");
                    details = element;
                    customerNameReserve.text = element.customerName;
                    contactReserve.text = element.contact;
                    occasionReserve.text = element.occasion;
                    fromDateReserve.text = element.reserveFromTime;
                    toDateReserve.text = element.reserveToTime;
                    if(element.reserveFromTime != ""){
                      DateFormat dateFormat =  DateFormat('yyyy-MM-ddThh:mm:ss');
                      var from = dateFormat.parse(element.reserveFromTime);
                      fromDateReserve.text =DateFormat('dd-MMM-yyyy  hh:mm:ss a').format(from);//.substring(0,18)+" "+DateFormat('dd-MMM-yyyy  hh:mm:ss a').format(from).substring(22);
                    }

                    if(element.reserveToTime != ""){
                      DateFormat dateFormat =  DateFormat('yyyy-MM-ddThh:mm:ss');
                      var from = dateFormat.parse(element.reserveToTime);
                      toDateReserve.text =DateFormat('dd-MMM-yyyy  hh:mm:ss a').format(from);//.substring(0,18)+" "+DateFormat('dd-MMM-yyyy  hh:mm:ss a').format(from).substring(22);
                    }
                    additionalCommentsReserve.text = element.additionalComments;
                  }
                });
                setState((){
                    isDataLoaded = true;
                });
              }else{

                  String formattedDate1 = DateFormat("dd-MMM-yyyy hh:mm:ss a").format(DateTime.now());
                  String formattedDate2 = DateFormat("dd-MMM-yyyy hh:mm:ss a")
                      .format(DateTime.now().add(const Duration(days: 1)));
                  fromDateReserve.text = formattedDate1;
                  toDateReserve.text = formattedDate2;
                  // fromDateReserve = TextEditingController(text: DateFormat('dd-MMM-yyyy  hh:mm:ss a').format(DateTime.now()).substring(0,18)+" "+DateFormat('dd-MMM-yyyy  hh:mm:ss a').format(DateTime.now()).substring(22));
                  // toDateReserve = TextEditingController(text: DateFormat('dd-MMM-yyyy  hh:mm:ss a').format(DateTime.now()).substring(0,18)+" "+DateFormat('dd-MMM-yyyy  hh:mm:ss a').format(DateTime.now()).substring(22));
                  // pickedDateFrom = null;//DateTime.now().toString();
                  // pickedDateTo = null;//DateTime.now().toString();
                  customerNameReserve.clear();
                  contactReserve.clear();
                  occasionReserve.clear();
                  additionalCommentsReserve.clear();
                  setState((){
                    isDataLoaded = true;
                  });
              }
            }
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height/10,
                top: 10,//MediaQuery.of(context).size.height/17,
                left: 10,//MediaQuery.of(context).size.height/17,
                right: 10,//MediaQuery.of(context).size.height/17,
              ),
              child: Material(
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Scaffold(
                      resizeToAvoidBottomInset: true,
                      backgroundColor: Colors.transparent,
                      body: Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: theme.backGroundColor,
                          borderRadius: BorderRadius.all(
                              Radius.circular(8)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child:
                          Scroller(
                            controller: _scrollController,
                            child: CustomScrollView(
                              controller: _scrollController,
                              scrollDirection: Axis.vertical,
                              //Instead of ListView or SingleChildScrollView put CustomScrollVIew to use Expanded or spacer
                              slivers: [
                                SliverFillRemaining(
                                  hasScrollBody: false,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width/3,
                                        height: 50,
                                        child: InkWell(
                                          onTap: () {
                                            setNotification.value = NotificationMessage(message:'', color: theme.footerBG4);
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: theme.secondaryColor,
                                                borderRadius: BorderRadius.only(
                                                    bottomRight: Radius.circular(8),
                                                    topLeft: Radius.circular(8))),
                                            constraints: const BoxConstraints(
                                              minHeight: double.infinity,
                                              maxHeight: double.infinity,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 21.0, right: 20),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.arrow_back_ios,
                                                    color: theme.primaryColor,
                                                    size: 24,
                                                  ),
                                                  SizedBox(width: MediaQuery.of(context).size.width/100,),
                                                  Text(detailStatus ? "DETAILS  ${selectedOuterTableName.value.toString()}" : "Reserve Table ${selectedOuterTableName.value.toString()}",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: theme.primaryColor)
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
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(width: 30,),
                                          Expanded(
                                            //width: 200,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("* ${MessagesProvider.get('Customer name')}",
                                                  textAlign: TextAlign.center,
                                                  style: theme.subtitle2,
                                                ),
                                                const SizedBox(height: 10,),
                                                TextFormField(
                                                  controller: customerNameReserve,
                                                  decoration: InputDecoration(
                                                      isDense: true,
                                                      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(25.0),
                                                        borderSide: const BorderSide(color: Colors.black, width: 0.4),
                                                      ),
                                                      enabledBorder: const OutlineInputBorder(
                                                        borderSide: const BorderSide(color: Colors.black, width: 0.4),
                                                      ),
                                                      hintText: MessagesProvider.get('Customer name'),
                                                      hintStyle: theme.textFieldHintStyle,
                                                      suffixIconConstraints: const BoxConstraints()
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          Expanded(
                                            //width: 200,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("* Contact",
                                                  textAlign: TextAlign.center,
                                                  style: theme.subtitle2,
                                                ),
                                                const SizedBox(height: 10,),
                                                TextFormField(
                                                  controller: contactReserve,
                                                  keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                      isDense: true,
                                                      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(25.0),
                                                        borderSide: const BorderSide(color: Colors.black, width: 0.4),
                                                      ),
                                                      enabledBorder: const OutlineInputBorder(
                                                        borderSide: const BorderSide(color: Colors.black, width: 0.4),
                                                      ),
                                                      hintText: 'Contact',
                                                      hintStyle: theme.textFieldHintStyle,
                                                      suffixIconConstraints: const BoxConstraints()
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 30,),
                                        ],
                                      ),
                                      const SizedBox(height: 20,),
                                      Container(
                                        //height: 70,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const SizedBox(width: 30,),
                                            OrderDateForm(title: MessagesProvider.get("From Date"),
                                              controller: fromDateReserve,),
                                            const SizedBox(width: 10,),
                                            OrderDateForm(title: MessagesProvider.get("To Date"),
                                              controller: toDateReserve,),
                                            const SizedBox(width: 30,),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(width: 30,),
                                          Expanded(
                                            //width: 200,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Occasion",
                                                  textAlign: TextAlign.center,
                                                  style: theme.subtitle2,
                                                ),
                                                SizedBox(height: 10,),
                                                TextFormField(
                                                  controller: occasionReserve,
                                                  decoration: InputDecoration(
                                                      isDense: true,
                                                      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                      ),
                                                      hintText: 'Occasion',
                                                      hintStyle: theme.textFieldHintStyle,
                                                      suffixIconConstraints: const BoxConstraints()
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          Expanded(
                                            //width: 200,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Additional Comments",
                                                  textAlign: TextAlign.center,
                                                  style: theme.subtitle2,
                                                ),
                                                SizedBox(height: 10,),
                                                TextFormField(
                                                  controller: additionalCommentsReserve,
                                                  decoration: InputDecoration(
                                                      isDense: true,
                                                      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                      ),
                                                      hintText: 'Additional comments',
                                                      hintStyle: theme.textFieldHintStyle,
                                                      suffixIconConstraints: const BoxConstraints()
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 30,),
                                        ],
                                      ),

                                      const SizedBox(height: 10,),
                                      const Spacer(),
                                      Container(
                                        height: 0.5, width: double.infinity,
                                        color: Colors.grey.shade300,
                                      ),
                                      SizedBox(height: MediaQuery.of(context).size.height/60,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              setNotification.value = NotificationMessage(message:'', color: theme.footerBG4);
                                              Navigator.of(context).pop();
                                              loadfacility();
                                              tableSeatCubit.rebuildScreen();
                                            },
                                            child: Container(
                                              width: 80,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  color: theme.button1BG1,
                                                  borderRadius: BorderRadius.all(Radius.circular(5))
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
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
                                              if(Status == "DETAILS"){
                                                updateDetails();
                                                Navigator.of(context).pop();
                                              }else{
                                                if(customerNameReserve.text.isEmpty || customerNameReserve.text.toString() == ''
                                                    || contactReserve.text.isEmpty || contactReserve.text.toString() == ''
                                                    || fromDateReserve.text.isEmpty || toDateReserve.text.isEmpty ||
                                                    fromDateReserve.text.toString() == '' || toDateReserve.text.toString() == ''){
                                                  setNotification.value = NotificationMessage(message: MessagesProvider.get("Please enter required fields"),
                                                      color: AppColors.notificationBGLightYellowColor);
                                                  // Future.delayed(Duration(seconds: 3),(){
                                                  //   setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
                                                  // });
                                                }else{
                                                  if(contactReserve.text.length < 10 || contactReserve.text.length > 14){
                                                    setNotification.value = NotificationMessage(message: 'Contact number must be in between 10 to 14 digits',
                                                        color: AppColors.notificationBGLightYellowColor);
                                                    // Future.delayed(Duration(seconds: 3),(){
                                                    //   setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
                                                    // });
                                                  }else{
                                                    if (_isDateGreater(toDateReserve.text,
                                                        fromDateReserve.text)) {
                                                      Navigator.of(context).pop();
                                                      reserveTable();
                                                    } else {
                                                      WidgetsBinding.instance
                                                          .addPostFrameCallback((_) {
                                                        setNotification.value = NotificationMessage(
                                                            message: MessagesProvider.get("To Date should be greater than From Date"),
                                                            color: theme.footerBG5);
                                                      });
                                                    }
                                                  }
                                                }
                                              }

                                            },
                                            child: Container(
                                              width: 80,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  color: theme.button2InnerShadow1,
                                                  borderRadius: BorderRadius.all(Radius.circular(5))
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
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
                                      SizedBox(height: MediaQuery.of(context).size.height/40,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  fetchGenericTableColor()async{
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    genericTableColor = await masterDataBL.getDefaultValuesByName(defaultValueName: "GENERIC_TABLE_COLOR_CODE") ?? '' ;
  }


  bool _isDateGreater(String date1, String date2) {
    DateTime dt1 = DateFormat(_dateFormat).parse(date1); //from
    DateTime dt2 = DateFormat(_dateFormat).parse(date2);
    return dt1.compareTo(dt2) > 0 ? true : false;
  }
  void _showBlockDialog(bool detailStatus){
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    String Status = detailStatus ? 'DETAILS' : 'BLOCK';
    setNotification.value = NotificationMessage(
        message: MessagesProvider.get('Performing table action &1 ',[Status]),
        color: AppColors.notificationBGLightBlueColor);
    additionalCommentsBlock.text = "";
    FacilityTableCurrentStatusDTO details;
    var reasonList =  [
      'Management Block',
      'Others',
      'Blocked for Short of Staff for Service',
      'Maintenance Block',
      'Blocked for Private Party'
    ];
    selectedLocation = 'Management Block';
    facilityTableCurrentStatusDTO?.forEach((element) {
      if(element.tableId.toString() == selectedOuterTableId.value){
        print("selected table statuss ${element.tableId}");
        details = element;
        additionalCommentsBlock.text = element.additionalComments;
        reasonList.forEach((item) {
          if(item == element.notes){
            selectedLocation = item;
          }
        });
      }
    });


    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext contextNew) {
        _screenSize = MediaQuery.of(context).size;
        _screenHeight = _screenSize!.height;
        _screenWidth = _screenSize!.width;
        return StatefulBuilder(
          builder: (contextNew, setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height/10,
                top: 10,//MediaQuery.of(context).size.height/17,
                left: 10,//MediaQuery.of(context).size.height/17,
                right: 10,//MediaQuery.of(context).size.height/17,
              ),
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
                          child:
                          CustomScrollView(
                            controller: _scrollController,
                            //Instead of ListView or SingleChildScrollView put CustomScrollVIew to use Expanded or spacer
                            slivers: [
                              SliverFillRemaining(
                                hasScrollBody: false,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width/3,
                                      height: 50,
                                      child: InkWell(
                                        onTap: () {
                                          setState((){
                                            selectedOuterTableId.value = '';
                                            pressedRowOuterValue.value = '';
                                            pressedColumnOuterValue.value = '';
                                          });
                                          setNotification.value = NotificationMessage(message:'', color: theme.footerBG4);
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: theme.secondaryColor,
                                              borderRadius: BorderRadius.only(
                                                  bottomRight: Radius.circular(8),
                                                  topLeft: Radius.circular(8))),
                                          constraints: const BoxConstraints(
                                            minHeight: double.infinity,
                                            maxHeight: double.infinity,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 21.0, right: 20),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.arrow_back_ios,
                                                  color: theme.primaryColor,
                                                  size: 24,
                                                ),
                                                SizedBox(width: MediaQuery.of(context).size.width/100,),
                                                Text(detailStatus ? "DETAILS  ${selectedOuterTableName.value.toString()}" : "Block Table ${selectedOuterTableName.value.toString()}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: theme.primaryColor),
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
                                      padding: EdgeInsets.only(left:
                                      10,right: 0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(width: MediaQuery.of(context).size.width/100,),
                                          Container(
                                            width: MediaQuery.of(context).size.width/3.5,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("* Reason",
                                                  textAlign: TextAlign.center,
                                                  style: theme.subtitle2,
                                                ),
                                                const SizedBox(height: 15,),
                                                Container(
                                                  height: 37,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                                      border: Border.all(color: Colors.black, width: 0.6)
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5,right: 10),
                                                    child: DropdownButtonHideUnderline(
                                                      child: DropdownButton(
                                                        isExpanded: true,
                                                        hint: Text('Please choose a reason',
                                                          style: TextStyle(
                                                              fontSize: SizeConfig.getFontSize(22)
                                                          ),
                                                        ), // Not necessary for Option 1
                                                        value: selectedLocation,
                                                        underline: Container(),
                                                        icon: Icon(Icons.arrow_drop_down),
                                                        onChanged: (newValue) {
                                                          setState(() {
                                                            selectedLocation = newValue.toString();
                                                          });
                                                        },
                                                        items: ['Management Block', 'Others',
                                                          'Blocked for Short of Staff for Service',
                                                          'Maintenance Block', 'Blocked for Private Party'].map((location) {
                                                          return DropdownMenuItem(
                                                            child: Text(location,
                                                              style: TextStyle(
                                                                  fontSize: SizeConfig.getFontSize(22)
                                                              ),
                                                            ),
                                                            value: location,
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 20,),
                                          Container(
                                            width: MediaQuery.of(context).size.width/3.5,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Additional Comments",
                                                  textAlign: TextAlign.center,
                                                  style: theme.subtitle2,
                                                ),
                                                const SizedBox(height: 15,),
                                                TextFormField(
                                                  controller: additionalCommentsBlock,
                                                  style: TextStyle(
                                                    fontFamily: 'RobotoCondensed',
                                                    color: theme.secondaryColor,
                                                    fontSize: SizeConfig.getFontSize(22),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  decoration: InputDecoration(
                                                      isDense: true,
                                                      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                      ),
                                                      hintText: 'Additional comments',
                                                      hintStyle: TextStyle(
                                                        fontFamily: 'RobotoCondensed',
                                                        color: ThemesProvider.getColor("darkGrey2"),
                                                        fontSize: SizeConfig.getFontSize(22),
                                                        fontWeight: FontWeight.w500,
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
                                            setNotification.value = NotificationMessage(message:'', color: theme.footerBG4);
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            width: 80,
                                            height: 35,
                                            decoration: BoxDecoration(
                                                color: theme.button1BG1,
                                                borderRadius: BorderRadius.all(Radius.circular(5))
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
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
                                            blockTable();
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            width: 80,
                                            height: 35,
                                            decoration: BoxDecoration(
                                                color: theme.button2InnerShadow1,
                                                borderRadius: BorderRadius.all(Radius.circular(5))
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
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
        );
      },
    );
  }

  showBlockedDialogueManager(){
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        _screenSize = MediaQuery.of(context).size;
        _screenHeight = _screenSize!.height;
        _screenWidth = _screenSize!.width;
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height/10,
            top: 10,//MediaQuery.of(context).size.height/17,
            left: 10,//MediaQuery.of(context).size.height/17,
            right: 10,//MediaQuery.of(context).size.height/17,
          ),
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                Scaffold(
                  resizeToAvoidBottomInset: false,
                  backgroundColor: Colors.transparent,
                  body: Container(
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.all(
                          Radius.circular(8)),
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
                                  width: MediaQuery.of(context).size.width/3,
                                  height: 50,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      decoration:  BoxDecoration(
                                          color: theme.secondaryColor,
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(8),
                                              topLeft: Radius.circular(8))),
                                      constraints: const BoxConstraints(
                                        minHeight: double.infinity,
                                        maxHeight: double.infinity,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 21.0, right: 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.arrow_back_ios,
                                              color: theme.primaryColor,
                                              size: 24,
                                            ),
                                            SizedBox(width: MediaQuery.of(context).size.width/100,),
                                            Text("Clear Table ${selectedOuterTableName.value.toString()}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'RobotoCondensed',
                                                color: theme.primaryColor,
                                                fontSize: SizeConfig.getFontSize(16),
                                                fontWeight: FontWeight.w700,
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
                                  padding: const EdgeInsets.only(left: 40),
                                  child: Container(
                                    width: 300,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Additional Comments",
                                          textAlign: TextAlign.center,
                                          style: theme.subtitle2,
                                        ),
                                        const SizedBox(height: 10,),
                                        TextFormField(
                                          controller: additionalCommentsClear,
                                          decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                              ),
                                              hintText: 'Additional Comments',
                                              hintStyle: theme.textFieldHintStyle,
                                              suffixIconConstraints: const BoxConstraints()
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                const Spacer(),
                                Container(
                                  height: 0.5, width: double.infinity,
                                  color: Colors.grey.shade300,
                                ),
                                const SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        setNotification.value = NotificationMessage(message: "View All Tables",
                                            color: theme.footerBG4);
                                        selectedOuterTableId.value = '';
                                        pressedRowOuterValue.value = '';
                                        pressedColumnOuterValue.value = '';
                                        showOrderModeButtons = false;
                                        Navigator.of(context).pop();
                                        tableSeatCubit.changeOrderModeOrActionModeButton();
                                      },
                                      child: Container(
                                        width: 80,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            color: theme.button1BG1,
                                            borderRadius: BorderRadius.all(Radius.circular(5))
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
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
                                        clearTable();
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        width: 80,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            color: theme.button2InnerShadow1,
                                            borderRadius: BorderRadius.all(Radius.circular(5))
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
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
    );
  }
  showBlockedDialogueUser(){
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    showDialog(context: context, builder: (ctx) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: SizeConfig.getSize(220)),
        child: ManagerLoginView(
          onLoginSuccess: (response) async {

              approvedUserPkId = response.data!.userPKId;
              showOrderModeButtons = false;
              tableSeatCubit.changeOrderModeOrActionModeButton();
            //Navigator.of(context).pop();
          },
          onLoginError: (err) {
            setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Error! Please try again "),
                color: AppColors.notificationBGRedColor);
            // Future.delayed(Duration(seconds: 3),(){
            //   setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
            // });
          },
        ),
      );
    }).then((value){
      if(approvedUserPkId != 0){
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            _screenSize = MediaQuery.of(context).size;
            _screenHeight = _screenSize!.height;
            _screenWidth = _screenSize!.width;
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height/10,
                top: 10,//MediaQuery.of(context).size.height/17,
                left: 10,//MediaQuery.of(context).size.height/17,
                right: 10,//MediaQuery.of(context).size.height/17,
              ),
              child: Material(
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Scaffold(
                      resizeToAvoidBottomInset: false,
                      backgroundColor: Colors.transparent,
                      body: Container(
                        decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.all(
                              Radius.circular(8)),
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
                                      width: MediaQuery.of(context).size.width/3,
                                      height: 50,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          decoration:  BoxDecoration(
                                              color: theme.secondaryColor,
                                              borderRadius: BorderRadius.only(
                                                  bottomRight: Radius.circular(8),
                                                  topLeft: Radius.circular(8))),
                                          constraints: const BoxConstraints(
                                            minHeight: double.infinity,
                                            maxHeight: double.infinity,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 21.0, right: 20),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.arrow_back_ios,
                                                  color: theme.primaryColor,
                                                  size: 24,
                                                ),
                                                SizedBox(width: MediaQuery.of(context).size.width/100,),
                                                Text("Clear Table ${selectedOuterTableName.value.toString()}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'RobotoCondensed',
                                                    color: theme.primaryColor,
                                                    fontSize: SizeConfig.getFontSize(16),
                                                    fontWeight: FontWeight.w700,
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
                                      padding: const EdgeInsets.only(left: 40),
                                      child: Container(
                                        width: 300,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Additional Comments",
                                              textAlign: TextAlign.center,
                                              style: theme.subtitle2,
                                            ),
                                            const SizedBox(height: 10,),
                                            TextFormField(
                                              controller: additionalCommentsClear,
                                              decoration: InputDecoration(
                                                  isDense: true,
                                                  contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                  ),
                                                  hintText: 'Additional Comments',
                                                  hintStyle: theme.textFieldHintStyle,
                                                  suffixIconConstraints: const BoxConstraints()
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20,),
                                    const Spacer(),
                                    Container(
                                      height: 0.5, width: double.infinity,
                                      color: Colors.grey.shade300,
                                    ),
                                    const SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: (){

                                              selectedOuterTableId.value = '';
                                              pressedRowOuterValue.value = '';
                                              pressedColumnOuterValue.value = '';
                                              showOrderModeButtons = false;
                                              tableSeatCubit.rebuildScreen();
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            width: 80,
                                            height: 35,
                                            decoration: BoxDecoration(
                                                color: theme.button1BG1,
                                                borderRadius: BorderRadius.all(Radius.circular(5))
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
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
                                            clearTable();
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            width: 80,
                                            height: 35,
                                            decoration: BoxDecoration(
                                                color: theme.button2InnerShadow1,
                                                borderRadius: BorderRadius.all(Radius.circular(5))
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
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
        );
      }
    });
  }
}

class FacilityAccessControlDto{
  bool shouldDisplayTask;
  bool managerApprovalRequired;
  bool isTaskEnabled;
  FacilityAccessControlDto({
    required this.shouldDisplayTask,
    required this.managerApprovalRequired,
    required this.isTaskEnabled
  });
}
