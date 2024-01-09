import 'dart:developer';

import 'package:application_prefs_data/builder.dart';
import 'package:customer_ui/utils/size_config.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:orders_data/builder.dart';
import 'package:orders_data/models/facility_container/facility_container_dto.dart';
import 'package:orders_data/models/facility_table_current_status/facility_table_current_status_dto.dart';
import 'package:orders_ui/OrdersPage.dart';
import 'package:orders_ui/Screens/TableSeatLoayoutScreen.dart';
import 'package:orders_ui/utils/AppColors.dart';
import 'package:orders_ui/utils/NotificationMessage.dart';
import 'package:orders_ui/widgets/StatusInfoDialog.dart';
import 'package:orders_data/blocs/app_blocs.dart';
import 'package:orders_data/blocs/app_events.dart';
import 'package:orders_data/blocs/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders_ui/OrdersPage.dart' as OO;
import 'package:http/http.dart' as http;
import 'package:product_config_ui/widgets/primaryLargeButton.dart';
import 'package:product_config_ui/widgets/secondaryLargeButton.dart';
import 'dart:convert';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:themes_library/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import 'package:flutter/services.dart';
import 'package:orders_data/blocs/app_blocs.dart' as AA;

ValueNotifier<String> selectedTableToShowCrossMark = ValueNotifier('');

class TableSeatLayoutMove extends StatefulWidget {
  const TableSeatLayoutMove({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<TableSeatLayoutMove> createState() => _TableSeatLayoutMoveState();
}

class _TableSeatLayoutMoveState extends State<TableSeatLayoutMove>{

  bool showLoading = false;
  var orderIdForMoveSingle = '';
  bool isLoading = true;
  bool showScrollBar = false;
  final ScrollController _controller = ScrollController();
  final ScrollController _controllerI = ScrollController();
  final ScrollController _controllerSB = ScrollController();
  final ScrollController _vController = ScrollController();
  final ScrollController _hController = ScrollController();
  final ScrollController _vControllerMove = ScrollController();
  final ScrollController _hControllerMove = ScrollController();
  final ScrollController _vControllerInside = ScrollController();
  final ScrollController _controllerBottomBar = ScrollController();
  String pressed = 'min';
  String pressedInPopUp = 'min';
  int selectedTableId = 0;
  int tempSelectedTableId = 0;
  var tmp = "";
  var value1; var value2; var value3;
  var selectedRowOuterLayout = 0;
  var selectedColumnOuterLayout = 0;
  List<String> category = [];
  List<String> categoryL = [];
  List<String> approval = [];
  List<String> approvalL = [];
  List<FacilityTableCurrentStatusDTO>? _facilityTableCurrentStatusDTO = [];
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
  int transactionIdForOngoingOrder = 0;
  String transactionData = "";
  bool _isCurrentUserManager = true;
  int? _currentUserPkId = -1;
  int? approvedUserPkId = 0;
  String? _dateFormat;
  //static ValueNotifier<String> pressedTable = ValueNotifier('');

  Future<void> occupyTableMove() async {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    OO.notificationBarStatus.value = '';
    Log.printMethodStart('occupyTableMove()','TableSeatLayout','Move');
    final http.Response response = await http.post(
      Uri.parse("${appPrefsBL.getServerUrl()}/api/Product/FacilityTable/${selectedInnerTableId.value.toString()}/Occupy"),
      body: json.encode(
          {
            "Reason": "Others",
            "AdditionalComments": "additionalComments",
            "ApprovalDTO": {
              "ApproverId": execContext.userPKId ?? -1,
              "Remarks": "remarks"
            },
          }
      ),
      headers: {
        "Authorization" : "${execContext.webApiToken}",
        "Content-Type" : "application/json",
      },
    ).whenComplete(() => Log.printMethodEnd('occupyTableMove()','TableSeatLayout','Move'));
    if(response.statusCode != 200){
      print("Error");
      print("Error");
      Log.printMethodReturn('occupyTableMove() ','TableSeatLayout','Move');
      Navigator.of(context).pop();
      // OO.notificationBarStatus.value = json.decode(response.body)['data'].toString();
      // setNotification.value = NotificationMessage(message: json.decode(response.body)['data'].toString(), color: AppColors.notificationBGRedColor);
      Future.delayed(Duration(seconds: 3),(){
        pressedRowOuterValue.value = '';
        pressedRowOuterValue.value = '';
        pressedRowInnerValue.value = '';
        pressedRowInnerValue.value = '';
        selectedOuterTableId.value = '';
        selectedInnerTableId.value = '';
        selectedOuterTableId.value = '';
        pressedRowOuterValue.value = '';
        pressedColumnOuterValue.value = '';
        selectedInnerTableId.value = '';
        selectedInnerTableName.value = '';
        selectedOuterTableName.value = '';
        refreshScreen.value = '';
        setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
      });
      print("Error");
      print("Error");
    }else{
      print("Success");
      print("Success");
      setState(() {
        refreshScreen.value = 'poppedfromorders';
      });
      Log.printMethodReturn('occupyTableMove()','TableSeatLayout','Move');
      Navigator.of(context).pop();
      _getCurrentStatuses();
      // OO.notificationBarStatus.value = 'Table reserved successfully!';
      // setNotification.value = NotificationMessage(message: 'Table reserved successfully!', color: AppColors.notificationBGLightBlueColor);
      Future.delayed(Duration(seconds: 3),(){
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => OrdersPage()));
        pressedRowOuterValue.value = '';
        pressedRowOuterValue.value = '';
        pressedRowInnerValue.value = '';
        pressedRowInnerValue.value = '';
        selectedOuterTableId.value = '';
        selectedInnerTableId.value = '';
        selectedOuterTableId.value = '';
        pressedRowOuterValue.value = '';
        pressedColumnOuterValue.value = '';
        selectedInnerTableId.value = '';
        selectedInnerTableName.value = '';
        selectedOuterTableName.value = '';
        transactionIdFromAllOrdersScreen.value = '';
        setNotification.value = NotificationMessage(message: "View All Tables",
            color: theme.footerBG4);
      });
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => OrdersPage()));
      print("Success");
      print("Success");
    }
  }

  Future<void> moveOrder() async {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    print("OrderId for Move : "+orderIdFromAllOrdersScreen.value.toString());
    print("Destination TableId for Move : "+selectedInnerTableId.value.toString());
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final orderDataBL = await OrdersDataBuilder.build(execContext!);
    OO.notificationBarStatus.value = '';
    Log.printMethodStart('moveOrder()','TableSeatLayout','Move');



    try{
    final response = await  orderDataBL.moveOrder(orderId: orderIdFromAllOrdersScreen.value.toString(), body: {
      "DestinationTableId": int.parse(selectedInnerTableId.value.toString()),
      "ApprovalDTO": {
        "ApproverId": execContext.userPKId ?? -1,
        "Remarks": "remarks"
      }
    });
    Log.printMethodEnd('moveOrder()','TableSeatLayout','Move');
    if(response.data?.toString()?.isEmpty == true ){
      Log.printMethodReturn('moveOrder() ','TableSeatLayout','Move');
      OO.notificationBarStatus.value = MessagesProvider.get("Table order moved successfully");
      setNotification.value = NotificationMessage(message: MessagesProvider.get("Table order moved successfully"),color: AppColors.notificationBGLightBlueColor);
      occupyTableMove();
    }

    }on DioError catch(error) {
      Log.printMethodReturn('moveOrder() ','TableSeatLayout','Move');
      log('error =>${error.toString()} ');
      final  errorString = error.response?.data['data'] as String?;
      OO.notificationBarStatus.value = errorString.toString();
      setNotification.value = NotificationMessage(message:errorString.toString(),color: AppColors.notificationBGRedColor);
        pressedRowOuterValue.value = '';
        pressedRowOuterValue.value = '';
        pressedRowInnerValue.value = '';
        pressedRowInnerValue.value = '';
        selectedOuterTableId.value = '';
        selectedInnerTableId.value = '';
        refreshScreen.value = '';
        setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);

    }

    // final http.Response response = await http.post(
    //   Uri.parse("${appPrefsBL.getServerUrl()}/api/Transaction/Order/${orderIdFromAllOrdersScreen.value.toString()}/MovetoTable"),
    //   body: json.encode(
    //       {
    //         "DestinationTableId": int.parse(selectedInnerTableId.value.toString()),
    //         "ApprovalDTO": {
    //           "ApproverId": execContext.userPKId ?? -1,
    //           "Remarks": "remarks"
    //         }
    //       }
    //   ),
    //   headers: {
    //     "Authorization" : "${execContext.webApiToken}",
    //     "Content-Type" : "application/json",
    //   },
    // ).whenComplete(() => Log.printMethodEnd('moveOrder()','TableSeatLayout','Move'));
    // if(response.statusCode != 200){
    //   print("Error");
    //   print("Error");
    //   Log.printMethodReturn('moveOrder() ','TableSeatLayout','Move');
    //   OO.notificationBarStatus.value = json.decode(response.body)['data'].toString();
    //   setNotification.value = NotificationMessage(message: json.decode(response.body)['data'].toString(),color: AppColors.notificationBGRedColor);
    //   Future.delayed(Duration(seconds: 3),(){
    //     pressedRowOuterValue.value = '';
    //     pressedRowOuterValue.value = '';
    //     pressedRowInnerValue.value = '';
    //     pressedRowInnerValue.value = '';
    //     selectedOuterTableId.value = '';
    //     selectedInnerTableId.value = '';
    //     refreshScreen.value = '';
    //     setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
    //   });
    //   print("Error");
    //   print("Error");
    // }else{
    //   print("Success");
    //   print("Success");
    //   Log.printMethodReturn('moveOrder() ','TableSeatLayout','Move');
    //   OO.notificationBarStatus.value = MessagesProvider.get("Table order moved successfully");
    //   setNotification.value = NotificationMessage(message: MessagesProvider.get("Table order moved successfully"),color: AppColors.notificationBGLightBlueColor);
    //   occupyTableMove();
    //   //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => OrdersPage()));
    //   print("Success");
    //   print("Success");
    // }
  }

  Future<void> moveTransaction() async {

    print("selectedOuterTableId.value.toString() : "+selectedOuterTableId.value.toString());
    print("transactionIdFromAllOrdersScreen.value : "+transactionIdFromAllOrdersScreen.value.toString());
    print("selectedInnerTableId.value.toString() : "+selectedInnerTableId.value.toString());

    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    OO.notificationBarStatus.value = '';
    Log.printMethodStart('moveTransaction()','TableSeatLayout','Move');
    try{
      final response = await orderDataBL.moveTransaction(orderId: orderIdFromAllOrdersScreen.value.toString(), body:{
        "TransactionIdList": [transactionIdFromAllOrdersScreen.value],
        "OrderOperationDetails": {
          "DestinationTableId": int.parse(selectedInnerTableId.value.toString()),
          "ApprovalDTO": {
            "ApproverId": execContext.userPKId ?? -1,
            "Remarks": "remarks"
          }
        },
      });

      if(response.data?.toString()?.isEmpty == true ){
        Log.printMethodReturn('moveTransaction()','TableSeatLayout','Move');
        OO.notificationBarStatus.value = MessagesProvider.get("Transaction moved successfully");
        setNotification.value = NotificationMessage(message: MessagesProvider.get("Transaction moved successfully"),color: AppColors.notificationBGLightBlueColor);
        occupyTableMove();
      }

    } on DioError catch(error){
      Log.printMethodReturn('moveTransaction()','TableSeatLayout','Move');
      log('error =>${error.toString()} ');
      final  errorString = error.response?.data['data'] as String?;
      OO.notificationBarStatus.value = errorString.toString();
      setNotification.value = NotificationMessage(message: errorString.toString(),color: AppColors.notificationBGRedColor);

        pressedRowOuterValue.value = '';
        pressedRowOuterValue.value = '';
        pressedRowInnerValue.value = '';
        pressedRowInnerValue.value = '';
        selectedOuterTableId.value = '';
        selectedInnerTableId.value = '';
        refreshScreen.value = '';
        setNotification.value = NotificationMessage(message: '');

    }
    // final http.Response response = await http.post(
    //   Uri.parse("${appPrefsBL.getServerUrl()}/api/Transaction/Order/${orderIdFromAllOrdersScreen.value.toString()}/MoveTransactionstoTable"),
    //   body: json.encode(
    //       {
    //         "TransactionIdList": [transactionIdFromAllOrdersScreen.value],
    //         "OrderOperationDetails": {
    //           "DestinationTableId": int.parse(selectedInnerTableId.value.toString()),
    //           "ApprovalDTO": {
    //             "ApproverId": execContext.userPKId ?? -1,
    //             "Remarks": "remarks"
    //           }
    //         },
    //       }
    //   ),
    //   headers: {
    //     "Authorization" : "${execContext.webApiToken}",
    //     "Content-Type" : "application/json",
    //   },
    // ).whenComplete(() => Log.printMethodEnd('moveTransaction()','TableSeatLayout','Move'));
    // if(response.statusCode != 200){
    //   print("Error");
    //   print("Error");
    //   Log.printMethodReturn('moveTransaction()','TableSeatLayout','Move');
    //   OO.notificationBarStatus.value = json.decode(response.body)['data'].toString();
    //   setNotification.value = NotificationMessage(message: json.decode(response.body)['data'].toString(),color: AppColors.notificationBGRedColor);
    //   Future.delayed(Duration(seconds: 3),(){
    //     pressedRowOuterValue.value = '';
    //     pressedRowOuterValue.value = '';
    //     pressedRowInnerValue.value = '';
    //     pressedRowInnerValue.value = '';
    //     selectedOuterTableId.value = '';
    //     selectedInnerTableId.value = '';
    //     refreshScreen.value = '';
    //     setNotification.value = NotificationMessage(message: '');
    //   });
    //   print("Error");
    //   print("Error");
    // }else{
    //   print("Success");
    //   print("Success");
    //   Log.printMethodReturn('moveTransaction()','TableSeatLayout','Move');
    //   OO.notificationBarStatus.value = MessagesProvider.get("Transaction moved successfully");
    //   setNotification.value = NotificationMessage(message: MessagesProvider.get("Transaction moved successfully"),color: AppColors.notificationBGLightBlueColor);
    //   occupyTableMove();
    //   print("Success");
    //   print("Success");
    // }
  }

  Future<void> getBottomActionButtonStatuses() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    OO.notificationBarStatus.value = '';
    final http.Response response = await http.get(
      Uri.parse("${appPrefsBL.getServerUrl()}/api/Transaction/TaskTypesContainer?hash=null&siteId=${execContext.siteId}&rebuildCache=false"),
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

        approval = List.generate(json.decode(response.body)['data']['TaskTypesContainerDTOList'].length,
                (index) => "("+json.decode(response.body)['data']['TaskTypesContainerDTOList'][index]['Category'].toString()+","+
                json.decode(response.body)['data']['TaskTypesContainerDTOList'][index]['TaskTypeName'].toString()+","+
                json.decode(response.body)['data']['TaskTypesContainerDTOList'][index]['RequiresManagerApproval'].toString()+")");
        for(int i=0; i<approval.length;i++){
          if(approval[i].contains('TABLE FUNCTION')){
            approvalL.add(approval[i]);
          }else{

          }
        }
      });
      print(categoryL.toList());
      print("Success");
      print("Success");
    }
  }

  Future<void> getTableStatusesForHelpScreen1() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    OO.notificationBarStatus.value = '';
    final http.Response response = await http.get(
      Uri.parse("${appPrefsBL.getServerUrl()}/api/Product/FacilityTableStatusContainer?hash=null&siteId=${execContext.siteId}&rebuildCache=false"),
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
        tableStatuses1 = List.generate(json.decode(response.body)['data']['FacilityTableStatusContainerDTOList'].length,
                (index) => "("+json.decode(response.body)['data']['FacilityTableStatusContainerDTOList'][index]['StatusCode'].toString()+","+
                json.decode(response.body)['data']['FacilityTableStatusContainerDTOList'][index]['Color'].toString()+","+
                json.decode(response.body)['data']['FacilityTableStatusContainerDTOList'][index]['Character'].toString()+")");
      });
      print(tableStatuses1.toList());
      print("Success");
      print("Success");
    }
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
        tableStatuses2 = List.generate(json.decode(response.body)['data']['PaymentStatusContainerDTOList'].length,
                (index) => "("+json.decode(response.body)['data']['PaymentStatusContainerDTOList'][index]['StatusCode'].toString()+","+
                json.decode(response.body)['data']['PaymentStatusContainerDTOList'][index]['Color'].toString()+","+
                json.decode(response.body)['data']['PaymentStatusContainerDTOList'][index]['Character'].toString()+")");
      });
      print(tableStatuses2.toList());
      print("Success");
      print("Success");
    }
  }

  Future<void> getTableStatusesForHelpScreen3() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    OO.notificationBarStatus.value = '';
    final http.Response response = await http.get(
      Uri.parse("${appPrefsBL.getServerUrl()}/api/Transaction/TransactionStatusContainer"),
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
        tableStatuses3 = List.generate(json.decode(response.body)['data']['TransactionStatusContainerDTOList'].length,
                (index) => "("+json.decode(response.body)['data']['TransactionStatusContainerDTOList'][index]['StatusCode'].toString()+","+
                json.decode(response.body)['data']['TransactionStatusContainerDTOList'][index]['Color'].toString()+","+
                json.decode(response.body)['data']['TransactionStatusContainerDTOList'][index]['Character'].toString()+")");
      });
      print(tableStatuses3.toList());
      print("Success");
      print("Success");
    }
  }

  Future<void> _checkCurrentUserPrivileges() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final userRoleDTO = await masterDataBL.getUserRoleById(execContext.userRoleId ?? -1);
    _isCurrentUserManager = userRoleDTO?.selfApprovalAllowed == true;
    _currentUserPkId = execContext.userPKId;
    print("_isCurrentUserManager : "+_isCurrentUserManager.toString());
    print("_currentUserPkId : "+_currentUserPkId.toString());
  }

  _getCurrentStatuses() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!); //not required
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    AA.facilityTableCurrentStatusDTO = await orderDataBL.getFacilityTableCurrentStatuses();
    Log.v("FacilityTableCurrentStatusDTO count ${AA.facilityTableCurrentStatusDTO?.length}");
  }

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    });
    //selectedTableToShowCrossMark.value = '';
    _checkCurrentUserPrivileges();
    _getCurrentStatuses();
    getBottomActionButtonStatuses();
    getTableStatusesForHelpScreen1();
    getTableStatusesForHelpScreen2();
    getTableStatusesForHelpScreen3();
  }

  @override
  Widget build(BuildContext context) {

    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);

    final _listRow = [];
    final _listColumn = [];
    final _listOfNames = [];
    var ascRowList = [];
    var ascColumnList = [];

    final _listRowI = [];
    final _listColumnI = [];
    final _listOfNamesI = [];
    var ascRowListI = [];
    var ascColumnListI = [];
    // if(refreshScreen.value == 'true'){
    //   context.read<FacilityBloc>().add(LoadFacilityEvent());
    // }else{
    //
    // }

    //facilitiesList[selectedFacilityIndex].facilityTableContainerDTOList[index]['TableName']

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: theme.backGroundColor,
        //resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: BlocProvider(
              create: (context) => FacilityBloc(

              )..add(LoadFacilityEvent()),
              child: BlocBuilder<FacilityBloc, FacilityState>(
                builder: (context, state){
                  if(state is FacilityLoadingState){
                    isLoading = true;
                    return const Center(child: CircularProgressIndicator());
                  }
                  if(state is FacilityLoadedState){
                    isLoading = false;
                    print(state.facilities);
                    List<FacilityContainerDTO> facilitiesList = state.facilities;

                    Log.v(state.facilities.toString());

                    print('TEST: ${facilitiesList.length}');
                    var listOfTables = facilitiesList[selectedFacilityIndex].facilityTableContainerDTOList;
                    var listOfTablesI = facilitiesList[int.parse(selectedFacilityIndexInMovePopUp.value)].facilityTableContainerDTOList;
                    print("selected facility table list length : "+listOfTables.length.toString());
                    if(listOfTables.length == 0){
                      showScrollBar = false;

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        changedIndex.value = 4;
                      });

                    }else{
                      showScrollBar = true;
                    }

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
                    for(int i=0; i < facilitiesList[int.parse(selectedFacilityIndexInMovePopUp.value)].facilityTableContainerDTOList.length; i++){
                      _listRowI.add(facilitiesList[int.parse(selectedFacilityIndexInMovePopUp.value)].facilityTableContainerDTOList[i].rowIndex);
                      _listColumnI.add(facilitiesList[int.parse(selectedFacilityIndexInMovePopUp.value)].facilityTableContainerDTOList[i].columnIndex);
                      _listOfNamesI.add(facilitiesList[int.parse(selectedFacilityIndexInMovePopUp.value)].facilityTableContainerDTOList[i].tableName);
                      print("+++++++++++++++");
                      print(_listRowI);
                      print(_listColumnI);
                      print(_listOfNamesI);
                      print(_listRowI.reduce((curr, next) => curr > next? curr: next));
                      print(_listColumnI.reduce((curr, next) => curr > next? curr: next));
                      print("row list length : "+_listRowI.length.toString());
                      print("column list length : "+_listColumnI.length.toString());
                      print(listOfTablesI);
                      print("+++++++++++++++");
                    }

                    if(_listRow.isNotEmpty && _listColumn.isNotEmpty){
                      ascRowList = [for(var i=0; i<(_listRow.reduce((curr, next) => curr > next? curr: next)+1); i+=1) i];
                      ascColumnList = [for(var i=0; i<(_listColumn.reduce((curr, next) => curr > next? curr: next)+1); i+=1) i];
                    }else{

                    }
                    if(_listRowI.isNotEmpty && _listColumnI.isNotEmpty){
                      ascRowListI = [for(var i=0; i<(_listRowI.reduce((curr, next) => curr > next? curr: next)+1); i+=1) i];
                      ascColumnListI = [for(var i=0; i<(_listColumnI.reduce((curr, next) => curr > next? curr: next)+1); i+=1) i];
                    }else{

                    }

                    tableStatuses = [...{...tableStatuses1}, ...{...tableStatuses2}, ...{...tableStatuses3}];
                    print(tableStatuses);

                    print(" ##### "+ascRowList.toString()+" \n##### "+ascColumnList.toString()+" \n##### ");
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 20,top: SizeConfig.getSize(5)),
                          child: Text("Move order from ${selectedOuterTableName.value} to ${selectedInnerTableName.value}",
                            style: TextStyle(
                              fontFamily: 'RobotoCondensed',
                              color: theme.secondaryColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(color: theme.secondaryColor,thickness: 0.3,),
                        Container(
                          height: MediaQuery.of(context).size.height/9,
                          //width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              const SizedBox(width: 5,),
                              ValueListenableBuilder(
                                  valueListenable: scrollOffset,
                                  builder: (BuildContext contextPP, String newValue, Widget? child){
                                    return InkWell(
                                      onTap: (){
                                        print("bcColor value : "+theme.backGroundColor.toString());
                                        print("scrollOffset.value : "+scrollOffset.value);
                                        print("newValue : "+newValue);

                                        if(int.parse(scrollOffset.value) < 390 && int.parse(scrollOffset.value) > 30){
                                          print("trueeeeee");
                                          scrollOffset.value = '${int.parse(newValue) - 30}';
                                        }else{print("falseeeee");}

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
                                    );
                                  }
                              ),
                              const SizedBox(width: 5,),
                              ValueListenableBuilder(
                                  valueListenable: scrollOffset,
                                  builder: (BuildContext contextPP, String newValue, Widget? child){
                                    return Expanded(
                                      child: ValueListenableBuilder(
                                          valueListenable: OO.showSideBar,
                                          builder: (BuildContext contextPP, String newValue, Widget? child){
                                            return Container(
                                              height: 80,
                                              child: NotificationListener(
                                                onNotification: (t) {
                                                  if(int.parse(scrollOffset.value) > MediaQuery.of(context).size.width){
                                                    print("8+++++8");
                                                  }else{
                                                    print("1+++++1");
                                                  }
                                                  if (t is ScrollEndNotification) {
                                                    print("@@@@@ "+_controller.position.pixels.toString()+" @@@@@");
                                                    scrollOffset.value = int.parse(_controller.position.pixels.toStringAsFixed(0)).toString();
                                                  }
                                                  return true;
                                                },
                                                child: ListView.builder(
                                                  controller: _controller,
                                                  scrollDirection: Axis.horizontal,
                                                  //physics: NeverScrollableScrollPhysics(),
                                                  itemCount: facilitiesList.length,
                                                  itemBuilder: (context, i){
                                                    return
                                                      facilitiesList[i].facilityTableContainerDTOList.length == 0 ?
                                                      Container() :
                                                      Padding(
                                                        padding: const EdgeInsets.only(right: 10),
                                                        child: GestureDetector(
                                                          onTap: () async {
                                                            //final prefs = await SharedPreferences.getInstance();

                                                            print("+++---");
                                                            print(facilitiesList[i].facilityTableContainerDTOList.length);
                                                            setState(() {
                                                              selectedFacilityIndex = i;
                                                            });
                                                            print(selectedFacilityIndex);

                                                            //prefs.setInt('callBackIndex', selectedFacilityIndex);
                                                          },
                                                          child: Container(
                                                            width: 150,
                                                            height: 60,
                                                            decoration: BoxDecoration(
                                                                color: selectedFacilityIndex == i ? AppColors.blackColor : Colors.grey.shade300,
                                                                borderRadius: BorderRadius.all(Radius.circular(5))
                                                            ),
                                                            child: Center(
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(facilitiesList[i].facilityName,
                                                                  textAlign: TextAlign.center,
                                                                  style: selectedFacilityIndex == i ?
                                                                  TextStyle(
                                                                    fontFamily: 'RobotoCondensed',
                                                                    color: ThemesProvider.getColor("primaryColor"),
                                                                    fontSize: SizeConfig.getFontSize(20),
                                                                    fontWeight: FontWeight.bold,
                                                                  ) : TextStyle(
                                                                    fontFamily: 'RobotoCondensed',
                                                                    color: ThemesProvider.getColor("secondaryColor"),
                                                                    fontSize: SizeConfig.getFontSize(20),
                                                                    fontWeight: FontWeight.bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                  },
                                                ),
                                              ),
                                            );
                                          }
                                      ),
                                    );
                                  }
                              ),
                              const SizedBox(width: 10,),
                              ValueListenableBuilder(
                                  valueListenable: scrollOffset,
                                  builder: (BuildContext contextPP, String newValue, Widget? child){
                                    return InkWell(
                                      onTap: (){
                                        print("scrollOffset.value : "+scrollOffset.value);
                                        print("newValue : "+newValue);
                                        print("controller Position : "+_controller.position.pixels.toString());

                                        if(int.parse(scrollOffset.value) >= 30 && int.parse(scrollOffset.value) < 390){
                                          scrollOffset.value = '${int.parse(scrollOffset.value) + 30}';
                                        }else{}

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
                                          380,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.fastOutSlowIn,
                                        );
                                      },
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
                        Expanded(
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  color: theme.backGroundColor,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 35,
                                        top: 0,
                                        bottom: 0, right: 0),
                                    child: Container(
                                      height: MediaQuery.of(context).size.height,
                                      //width: MediaQuery.of(context).size.width+50,
                                      child: ValueListenableBuilder(
                                          valueListenable: selectedTableToShowCrossMark,
                                          builder: (BuildContext context, String newValue, Widget? child){
                                            return ValueListenableBuilder(
                                                valueListenable: pressedRowOuterValue,
                                                builder: (BuildContext context, String newValue, Widget? child){
                                                  return ValueListenableBuilder(
                                                      valueListenable: pressedColumnOuterValue,
                                                      builder: (BuildContext context, String newValue, Widget? child){
                                                        return ValueListenableBuilder(
                                                            valueListenable: selectedOuterTableName,
                                                            builder: (BuildContext context, String newValue, Widget? child){
                                                              return ValueListenableBuilder(
                                                                  valueListenable: showSideBar,
                                                                  builder: (BuildContext context, String newValue, Widget? child){
                                                                    return Flex(
                                                                      direction: Axis.vertical,
                                                                      children: [
                                                                        Expanded(
                                                                          child: ascRowList.length < 5 ?
                                                                          Flex(
                                                                            direction: Axis.vertical,
                                                                            children: [
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
                                                                                              for (var i in ascColumnList) //column
                                                                                                Stack(
                                                                                                  children: [
                                                                                                    SizedBox(
                                                                                                      height: MediaQuery.of(context).size.height/10,
                                                                                                      width: MediaQuery.of(context).size.height/10,
                                                                                                      child: Padding(
                                                                                                        padding: const EdgeInsets.all(2.0),
                                                                                                        child: InkWell(
                                                                                                          onTap: () {

                                                                                                            // pressedRowOuterValue.value = "$i";
                                                                                                            // pressedColumnOuterValue.value = "$j";

                                                                                                            selectedTableId = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                element.columnIndex == i).tableId;
                                                                                                            tempSelectedTableId = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                element.columnIndex == i).tableId;

                                                                                                            setState((){
                                                                                                              selectedTableId = j; tempSelectedTableId = i;
                                                                                                              tmp = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                  element.columnIndex == i).tableId.toString();
                                                                                                              selectedInnerTableId.value = '$tmp';
                                                                                                              selectedInnerTableName.value = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                  element.columnIndex == i).tableName.toString();
                                                                                                            });
                                                                                                            pressedRowInnerValue.value = "$i";
                                                                                                            pressedColumnInnerValue.value = "$j";

                                                                                                            print("selectedTableId Outer & selectedTableId Inner : "+selectedOuterTableId.value+" & "+selectedInnerTableId.value);
                                                                                                            print("%%%%%%%%%%"+listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                element.columnIndex == i).tableName.toString());

                                                                                                            // selectedOuterTableStatus.value = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                            //     element.columnIndex == i).facilityTableCurrentStatusDTO!.status.toString();
                                                                                                            //
                                                                                                            // selectedOuterTableCharacter.value = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                            //     element.columnIndex == i).facilityTableCurrentStatusDTO!.character.toString();

                                                                                                          },
                                                                                                          child: (pressedColumnInnerValue.value == "$j" && pressedRowInnerValue.value == "$i") ||
                                                                                                              (pressedColumnOuterValue.value == "$j" && pressedRowOuterValue.value == "$i") ?
                                                                                                          Container(
                                                                                                            height: 20,
                                                                                                            width: 20,
                                                                                                            decoration: BoxDecoration(
                                                                                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                                                                                              color: (
                                                                                                                  listOfTables.any((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i)) ?
                                                                                                              Color.fromRGBO(
                                                                                                                  int.parse((listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i).facilityTableCurrentStatusDTO!.color.toString()).split(",")[0]),
                                                                                                                  int.parse((listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i).facilityTableCurrentStatusDTO!.color.toString()).split(",")[1]),
                                                                                                                  int.parse((listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i).facilityTableCurrentStatusDTO!.color.toString()).split(",")[2]), 1).withOpacity(0.4)
                                                                                                                  : theme.backGroundColor,
                                                                                                            ),
                                                                                                            child: Center(
                                                                                                              child: Column(
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Text(listOfTables.any((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i) ? listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i).tableName : "",
                                                                                                                    style: TextStyle(
                                                                                                                      fontFamily: 'RobotoCondensed',
                                                                                                                      color: ThemesProvider.getColor("primaryColor"),
                                                                                                                      fontSize: SizeConfig.getFontSize(18),
                                                                                                                      fontWeight: FontWeight.w400,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  listOfTables.any((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i) ? listOfTables.firstWhere((element) => element.rowIndex == j
                                                                                                                      && element.columnIndex == i).facilityTableCurrentStatusDTO!.mergedWithTableIdName.toString()
                                                                                                                      == "null" ? Container() :
                                                                                                                  Text(
                                                                                                                    listOfTables.any((element) => element.rowIndex == j &&
                                                                                                                        element.columnIndex == i) ? (listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                        element.columnIndex == i).facilityTableCurrentStatusDTO!.mergedWithTableIdName.toString()) : "",
                                                                                                                    style: TextStyle(
                                                                                                                      fontFamily: 'RobotoCondensed',
                                                                                                                      color: ThemesProvider.getColor("primaryColor"),
                                                                                                                      fontSize: SizeConfig.getFontSize(18),
                                                                                                                      fontWeight: FontWeight.w400,
                                                                                                                    ),) : Container(),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          )  :
                                                                                                          Container(
                                                                                                            height: 20,
                                                                                                            width: 20,
                                                                                                            decoration: BoxDecoration(
                                                                                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                                                                                              color: (
                                                                                                                  listOfTables.any((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i)) ?
                                                                                                              Color.fromRGBO(
                                                                                                                  int.parse((listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i).facilityTableCurrentStatusDTO!.color.toString()).split(",")[0]),
                                                                                                                  int.parse((listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i).facilityTableCurrentStatusDTO!.color.toString()).split(",")[1]),
                                                                                                                  int.parse((listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i).facilityTableCurrentStatusDTO!.color.toString()).split(",")[2]), 1)
                                                                                                                  : theme.backGroundColor,
                                                                                                            ),
                                                                                                            child: Center(
                                                                                                              child: Column(
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Text(listOfTables.any((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i) ? listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i).tableName : "",
                                                                                                                    style: TextStyle(
                                                                                                                      fontFamily: 'RobotoCondensed',
                                                                                                                      color: ThemesProvider.getColor("primaryColor"),
                                                                                                                      fontSize: SizeConfig.getFontSize(18),
                                                                                                                      fontWeight: FontWeight.w400,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  listOfTables.any((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i) ? listOfTables.firstWhere((element) => element.rowIndex == j
                                                                                                                      && element.columnIndex == i).facilityTableCurrentStatusDTO!.mergedWithTableIdName.toString()
                                                                                                                      == "null" ? Container() :
                                                                                                                  Text(
                                                                                                                    listOfTables.any((element) => element.rowIndex == j &&
                                                                                                                        element.columnIndex == i) ? (listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                        element.columnIndex == i).facilityTableCurrentStatusDTO!.mergedWithTableIdName.toString()) : "",
                                                                                                                    style: TextStyle(
                                                                                                                      fontFamily: 'RobotoCondensed',
                                                                                                                      color: ThemesProvider.getColor("primaryColor"),
                                                                                                                      fontSize: SizeConfig.getFontSize(18),
                                                                                                                      fontWeight: FontWeight.w400,
                                                                                                                    ),) : Container(),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsets.only(top: 5, left: MediaQuery.of(context).size.height/15),
                                                                                                      child: Align(
                                                                                                        alignment: Alignment.topRight,
                                                                                                        child: Text(listOfTables.any((element) => element.rowIndex == j &&
                                                                                                            element.columnIndex == i) ? listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                            element.columnIndex == i).facilityTableCurrentStatusDTO!.character.toString() : "",
                                                                                                          style: TextStyle(
                                                                                                            fontFamily: 'RobotoCondensed',
                                                                                                            color: ThemesProvider.getColor("primaryColor"),
                                                                                                            fontSize: SizeConfig.getFontSize(12),
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              SizedBox(width: 50,),
                                                                                            ],
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                            //height: MediaQuery.of(context).size.height,
                                                                            // width: showSideBar.value == 'true' ? MediaQuery.of(context).size.width/1.28
                                                                            //     : MediaQuery.of(context).size.width/1.035,

                                                                          )  :
                                                                          Scroller(
                                                                            controller: _vController,
                                                                            child: Flex(
                                                                              direction: Axis.vertical,
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
                                                                                            for (var j in ascRowList) //Row
                                                                                              Row(
                                                                                                children: [
                                                                                                  for (var i in ascColumnList) //column
                                                                                                    Stack(
                                                                                                      children: [
                                                                                                        SizedBox(
                                                                                                          height: MediaQuery.of(context).size.height/10,
                                                                                                          width: MediaQuery.of(context).size.height/10,
                                                                                                          child: Padding(
                                                                                                            padding: const EdgeInsets.all(2.0),
                                                                                                            child: InkWell(
                                                                                                              onTap: () {
                                                                                                                // pressedRowOuterValue.value = "$i";
                                                                                                                // pressedColumnOuterValue.value = "$j";

                                                                                                                selectedTableId = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                    element.columnIndex == i).tableId;
                                                                                                                tempSelectedTableId = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                    element.columnIndex == i).tableId;

                                                                                                                setState((){
                                                                                                                  selectedTableId = j; tempSelectedTableId = i;
                                                                                                                  tmp = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i).tableId.toString();
                                                                                                                  selectedInnerTableId.value = '$tmp';
                                                                                                                  selectedInnerTableName.value = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i).tableName.toString();
                                                                                                                });
                                                                                                                pressedRowInnerValue.value = "$i";
                                                                                                                pressedColumnInnerValue.value = "$j";

                                                                                                                print("selectedTableId Outer & selectedTableId Inner : "+selectedOuterTableId.value+" & "+selectedInnerTableId.value);
                                                                                                                print("%%%%%%%%%%"+listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                    element.columnIndex == i).tableName.toString());

                                                                                                                // selectedOuterTableStatus.value = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                //     element.columnIndex == i).facilityTableCurrentStatusDTO!.status.toString();
                                                                                                                //
                                                                                                                // selectedOuterTableCharacter.value = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                //     element.columnIndex == i).facilityTableCurrentStatusDTO!.character.toString();

                                                                                                              },
                                                                                                              child: (pressedColumnInnerValue.value == "$j" && pressedRowInnerValue.value == "$i") ||
                                                                                                                  (pressedColumnOuterValue.value == "$j" && pressedRowOuterValue.value == "$i") ?
                                                                                                              Container(
                                                                                                                height: 20,
                                                                                                                width: 20,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                                                                                                  color:
                                                                                                                  // selectedTableToShowCrossMark.value == listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                  //     element.columnIndex == i).tableId.toString() ? Colors.black :
                                                                                                                  (
                                                                                                                      listOfTables.any((element) => element.rowIndex == j &&
                                                                                                                          element.columnIndex == i)) ?
                                                                                                                  Color.fromRGBO(
                                                                                                                      int.parse((listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                          element.columnIndex == i).facilityTableCurrentStatusDTO!.color.toString()).split(",")[0]),
                                                                                                                      int.parse((listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                          element.columnIndex == i).facilityTableCurrentStatusDTO!.color.toString()).split(",")[1]),
                                                                                                                      int.parse((listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                          element.columnIndex == i).facilityTableCurrentStatusDTO!.color.toString()).split(",")[2]), 1).withOpacity(0.4)
                                                                                                                      : theme.backGroundColor,
                                                                                                                ),
                                                                                                                child: Center(
                                                                                                                  child: Column(
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Text(listOfTables.any((element) => element.rowIndex == j &&
                                                                                                                          element.columnIndex == i) ? listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                          element.columnIndex == i).tableName : "",
                                                                                                                        style: TextStyle(
                                                                                                                          fontFamily: 'RobotoCondensed',
                                                                                                                          color: ThemesProvider.getColor("primaryColor"),
                                                                                                                          fontSize: SizeConfig.getFontSize(18),
                                                                                                                          fontWeight: FontWeight.w400,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      listOfTables.any((element) => element.rowIndex == j &&
                                                                                                                          element.columnIndex == i) ? listOfTables.firstWhere((element) => element.rowIndex == j
                                                                                                                          && element.columnIndex == i).facilityTableCurrentStatusDTO!.mergedWithTableIdName.toString()
                                                                                                                          == "null" ? Container() :
                                                                                                                      Text(
                                                                                                                        listOfTables.any((element) => element.rowIndex == j &&
                                                                                                                            element.columnIndex == i) ? (listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                            element.columnIndex == i).facilityTableCurrentStatusDTO!.mergedWithTableIdName.toString()) : "",
                                                                                                                        style: TextStyle(
                                                                                                                          fontFamily: 'RobotoCondensed',
                                                                                                                          color: ThemesProvider.getColor("primaryColor"),
                                                                                                                          fontSize: SizeConfig.getFontSize(18),
                                                                                                                          fontWeight: FontWeight.w400,
                                                                                                                        ),) : Container(),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              )  :
                                                                                                              Container(
                                                                                                                height: 20,
                                                                                                                width: 20,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                                                                                                  color:
                                                                                                                  // selectedTableToShowCrossMark.value == listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                  //     element.columnIndex == i).tableId.toString() ? Colors.black :
                                                                                                                  (
                                                                                                                      listOfTables.any((element) => element.rowIndex == j &&
                                                                                                                          element.columnIndex == i)) ?
                                                                                                                  Color.fromRGBO(
                                                                                                                      int.parse((listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                          element.columnIndex == i).facilityTableCurrentStatusDTO!.color.toString()).split(",")[0]),
                                                                                                                      int.parse((listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                          element.columnIndex == i).facilityTableCurrentStatusDTO!.color.toString()).split(",")[1]),
                                                                                                                      int.parse((listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                          element.columnIndex == i).facilityTableCurrentStatusDTO!.color.toString()).split(",")[2]), 1)
                                                                                                                      : theme.backGroundColor,
                                                                                                                ),
                                                                                                                child: Center(
                                                                                                                  child: Column(
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Text(listOfTables.any((element) => element.rowIndex == j &&
                                                                                                                          element.columnIndex == i) ? listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                          element.columnIndex == i).tableName : "",
                                                                                                                        style: TextStyle(
                                                                                                                          fontFamily: 'RobotoCondensed',
                                                                                                                          color: ThemesProvider.getColor("primaryColor"),
                                                                                                                          fontSize: SizeConfig.getFontSize(18),
                                                                                                                          fontWeight: FontWeight.w400,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      listOfTables.any((element) => element.rowIndex == j &&
                                                                                                                          element.columnIndex == i) ? listOfTables.firstWhere((element) => element.rowIndex == j
                                                                                                                          && element.columnIndex == i).facilityTableCurrentStatusDTO!.mergedWithTableIdName.toString()
                                                                                                                          == "null" ? Container() :
                                                                                                                      Text(
                                                                                                                        listOfTables.any((element) => element.rowIndex == j &&
                                                                                                                            element.columnIndex == i) ? (listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                            element.columnIndex == i).facilityTableCurrentStatusDTO!.mergedWithTableIdName.toString()) : "",
                                                                                                                        style: TextStyle(
                                                                                                                          fontFamily: 'RobotoCondensed',
                                                                                                                          color: ThemesProvider.getColor("primaryColor"),
                                                                                                                          fontSize: SizeConfig.getFontSize(18),
                                                                                                                          fontWeight: FontWeight.w400,
                                                                                                                        ),) : Container(),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsets.only(top: 5, left: MediaQuery.of(context).size.height/15),
                                                                                                          child: Align(
                                                                                                            alignment: Alignment.topRight,
                                                                                                            child: Text(listOfTables.any((element) => element.rowIndex == j &&
                                                                                                                element.columnIndex == i) ? listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                element.columnIndex == i).facilityTableCurrentStatusDTO!.character.toString() : "",
                                                                                                              style: TextStyle(
                                                                                                                fontFamily: 'RobotoCondensed',
                                                                                                                color: ThemesProvider.getColor("primaryColor"),
                                                                                                                fontSize: SizeConfig.getFontSize(12),
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        (pressedColumnOuterValue.value == "$j" && pressedRowOuterValue.value == "$i") ? Padding(
                                                                                                          padding: EdgeInsets.only(top: 5, left: 5),
                                                                                                          child: Icon(Icons.close, color: Colors.grey, size: 15,),
                                                                                                        ) : Container(),
                                                                                                      ],
                                                                                                    ),
                                                                                                  SizedBox(width: 50,),
                                                                                                ],
                                                                                              ),
                                                                                            SizedBox(height: ascRowList.length < 5 ?
                                                                                            MediaQuery.of(context).size.height/2 :
                                                                                            ascRowList.length == 4 ? 65
                                                                                                : 50),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  }
                                                              );
                                                            }
                                                        );
                                                      }
                                                  );
                                                }
                                            );
                                          }
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(color: theme.secondaryColor,thickness: 0.3,),
                        Padding(
                          padding:  EdgeInsets.only(bottom: SizeConfig.getSize(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SecondaryLargeButton(onPressed:  (){
                                print("selectedTableToShowCrossMark : "+selectedTableToShowCrossMark.value);
                                print("pressed Column Outer Value : "+pressedColumnOuterValue.value.toString());
                                print("pressed Row Outer Value : "+pressedRowOuterValue.value.toString());
                                Navigator.of(context).pop();
                                  pressedRowOuterValue.value = '';
                                  pressedColumnOuterValue.value = '';
                                  pressedRowInnerValue.value = '';
                                  pressedColumnInnerValue.value = '';
                                  selectedInnerTableId.value = '';
                                  selectedInnerTableName.value = '';

                                print("OrderId from AllOrdersScreen : "+orderIdFromAllOrdersScreen.value.toString());
                                print("TransactionId from AllOrdersScreen : "+transactionIdFromAllOrdersScreen.value.toString());
                                print("Operation : "+moveOperationFromAllOrdersScreen.value.toString());
                               },text:MessagesProvider.get('Cancel').toUpperCase(),),
                              const SizedBox(width: 10,),
                              PrimaryLargeButton(onPressed: (){
                                // Navigator.of(context).pop();
                                if(moveOperationFromAllOrdersScreen.value == 'OnlyMoveTransaction'){
                                  moveTransaction();
                                }else{
                                  moveOrder();
                                }
                              },
                                text: MessagesProvider.get('Ok').toUpperCase(),
                                buttonColor: theme.secondaryColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

}
