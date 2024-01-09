import 'package:application_prefs_data/builder.dart';
import 'package:customer_ui/utils/size_config.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:login_data/models/login_response.dart';
import 'package:login_ui/manager_login_popup.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/user_role_container/management_form_access_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:orders_data/builder.dart';
import 'package:orders_data/models/facility_container/facility_container_dto.dart';
import 'package:orders_data/models/facility_table/approve_dto.dart';
import 'package:orders_data/models/facility_table/facility_table.dart';
import 'package:orders_data/models/facility_table_current_status/facility_table_current_status_dto.dart';
import 'package:orders_data/models/transactions/transaction_data.dart';
import 'package:orders_ui/OrdersPage.dart';
import 'package:orders_ui/Screens/AllOrdersScreen.dart';
import 'package:orders_ui/Screens/TableSeatLoayoutScreenMove.dart';
import 'package:orders_ui/cubit/table_seat_layout_cubit.dart';
import 'package:orders_ui/utils/AppColors.dart';
import 'package:orders_ui/utils/NotificationMessage.dart';
import 'package:orders_ui/widgets/CustomerDatePicker.dart';
import 'package:orders_ui/widgets/ErrorDialog.dart';
import 'package:orders_ui/widgets/OrderDateForm.dart';
import 'package:orders_ui/widgets/StatusInfoDialog.dart';
import 'package:orders_ui/widgets/TableSeatLayoutBottomActionBar.dart';
import 'package:orders_data/repos/repositories.dart';
import 'package:orders_data/blocs/app_blocs.dart';
import 'package:orders_data/blocs/app_events.dart';
import 'package:orders_data/blocs/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'dart:math' as math;
import 'package:orders_ui/OrdersPage.dart' as OO;
import 'package:orders_ui/widgets/TableSeatLayoutBottomActionBar.dart' as TableSeatLayoutBottomActionBarW;
import 'package:http/http.dart' as http;
import 'package:product_config_ui/transaction_order_details_dialog/cubit/transaction_order_details_cubit.dart';
import 'package:product_config_ui/widgets/primaryMediumButton.dart';
import 'package:product_config_ui/widgets/secondaryMediumButton.dart';
import 'package:semnox_tablet_pos/SalesScreen.dart';
//import 'package:strings_data/builder.dart';
import 'dart:convert';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:themes_library/builder.dart';
import 'package:themes_library/themes_library.dart';
import '../widgets/AllowOverride.dart';
import '../widgets/input_with_keyboard_control.dart';
import 'package:intl/intl.dart';
import 'package:widgets_library/scroller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:product_config_ui/transaction_order_details_dialog/cubit/transaction_order_details_state.dart';
import 'package:product_config_ui/utils/constants.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:widgets_library/error_alert_dialog.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:login_ui/loader_dialog.dart' as loader;

var selectedFacilityIndex;
ValueNotifier<String> isTablesScreenOpened = ValueNotifier('');
ValueNotifier<String> scrollCounter1 = ValueNotifier('');
ValueNotifier<String> pressedRowOuterValue = ValueNotifier('');
ValueNotifier<String> pressedColumnOuterValue = ValueNotifier('');
ValueNotifier<String> pressedRowInnerValue = ValueNotifier('');
ValueNotifier<String> pressedColumnInnerValue = ValueNotifier('');
ValueNotifier<String> selectedOuterTableId = ValueNotifier('');
ValueNotifier<String> selectedOuterTableIdUnMerge = ValueNotifier('');
ValueNotifier<String> selectedOuterTableName = ValueNotifier('');
ValueNotifier<String> selectedInnerTableName = ValueNotifier('');
ValueNotifier<String> selectedOuterTableStatus = ValueNotifier('');
ValueNotifier<String> selectedInnerTableId = ValueNotifier('');
ValueNotifier<String> scrollOffset = ValueNotifier('');
ValueNotifier<String> scrollOffsetI = ValueNotifier('');
ValueNotifier<String> scrollOffsetScrollBar = ValueNotifier('');
ValueNotifier<String> scrollOffsetBottom = ValueNotifier('');
ValueNotifier<String> scrollTopMinMax = ValueNotifier('');
ValueNotifier<String> selectedFacilityIndexInMovePopUp = ValueNotifier('');
ValueNotifier<String> refreshScreen = ValueNotifier('');
List<String> tableStatuses = [];
List<String> tableStatuses1 = [];
List<String> tableStatuses2 = [];
List<String> tableStatuses3 = [];
List<String>? actionButtonsAccessControl = [];
ValueNotifier<String> selectedOuterTableCharacter = ValueNotifier('');
ValueNotifier<String> signalForOpenMoveTablePopUp = ValueNotifier('');
ValueNotifier<String> orderIdFromAllOrdersScreen = ValueNotifier('');
ValueNotifier<String> trsactionIdFromAllOrdersScreen = ValueNotifier('');
ValueNotifier<String> transactionIdFromAllOrdersScreen = ValueNotifier('');
ValueNotifier<String> moveOperationFromAllOrdersScreen = ValueNotifier('');
ValueNotifier<String> showBottomActionBar = ValueNotifier('');
ValueNotifier<String> selectedFacilityName = ValueNotifier('');

TextEditingController fromDateReserve = TextEditingController();
TextEditingController toDateReserve = TextEditingController();

String? pickedDateFrom;
String? pickedDateTo;

var orderIdForMoveSingle = '';
int transactionIdForOngoingOrder = 0;

bool showOrderModeButtons = false;

class TableSeatLayout extends StatefulWidget {
  const TableSeatLayout({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<TableSeatLayout> createState() => _TableSeatLayoutState();
}

class _TableSeatLayoutState extends State<TableSeatLayout>{

  bool showLoading = false;
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

  final _facilities = <FacilityContainerDTO>[];

  Future<void> mergeTables() async {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    OO.notificationBarStatus.value = '';
    Log.printMethodStart('mergeTables()','TableSeatLayout','Merge');
    final http.Response response = await http.post(
      Uri.parse("${appPrefsBL.getServerUrl()}/api/Product/FacilityTable/${selectedOuterTableId.value.toString()}/Merge"),
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
    ).whenComplete(() => Log.printMethodEnd('mergeTables()','TableSeatLayout','Merge'));
    if(response.statusCode != 200){
      print("Error");
      print("Error");
      Log.printMethodReturn('mergeTables()','TableSeatLayout','Merge');
      OO.notificationBarStatus.value = json.decode(response.body)['data'].toString();
      setNotification.value = NotificationMessage(message: json.decode(response.body)['data'].toString(),color: AppColors.notificationBGRedColor);
      Future.delayed(Duration(seconds: 3),(){
        pressedRowOuterValue.value = '';
        pressedRowOuterValue.value = '';
        pressedRowInnerValue.value = '';
        pressedRowInnerValue.value = '';
        selectedOuterTableId.value = '';
        selectedInnerTableId.value = '';
        refreshScreen.value = '';
        //setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
      });
      setState(() {
        showOrderModeButtons = false;
      });
      print("Error");
      print("Error");
    }else{
      print("Success");
      print("Success");
      setState(() {
        refreshScreen.value = 'true';
        showOrderModeButtons = false;
      });
      Future.delayed(Duration(seconds: 2),(){
        refreshScreen.value = '';
      });
      Log.printMethodReturn('mergeTables() - Tables merged successfully','TableSeatLayout','Merge');
      OO.notificationBarStatus.value = MessagesProvider.get("Tables merged successfully");
      setNotification.value = NotificationMessage(message: MessagesProvider.get("Tables merged successfully"),color: AppColors.notificationBGLightBlueColor);
      Future.delayed(Duration(seconds: 3),(){
        pressedRowOuterValue.value = '';
        pressedRowOuterValue.value = '';
        pressedRowInnerValue.value = '';
        pressedRowInnerValue.value = '';
        selectedOuterTableId.value = '';
        selectedInnerTableId.value = '';
        //setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
      });
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => OrdersPage()));
      print("Success");
      print("Success");
    }
  }

  Future<void> unMergeTable() async {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    OO.notificationBarStatus.value = '';
    Log.printMethodStart('unMergeTable()','TableSeatLayout','UnMerge');
    final http.Response response = await http.post(
      Uri.parse("${appPrefsBL.getServerUrl()}/api/Product/FacilityTable/${selectedOuterTableIdUnMerge.value.toString()}/UnMerge"),
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
    ).whenComplete(() => Log.printMethodEnd('unMergeTable()','TableSeatLayout','UnMerge'));
    if(response.statusCode != 200){
      print("Error");
      print("Error");
      Log.printMethodReturn('unMergeTable()','TableSeatLayout','UnMerge');
      OO.notificationBarStatus.value = json.decode(response.body)['data'].toString();
      setNotification.value = NotificationMessage(message: json.decode(response.body)['data'].toString(),color: AppColors.notificationBGRedColor);
      Future.delayed(Duration(seconds: 3),(){
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
      });
      setState(() {
        showOrderModeButtons = false;
      });
      print("Error");
      print("Error");
    }else{
      print("Success");
      print("Success");
      setState(() {
        refreshScreen.value = 'true';
        showOrderModeButtons = false;
      });
      Future.delayed(Duration(seconds: 2),(){
        refreshScreen.value = '';
      });
      Log.printMethodReturn('unMergeTable() - Tables un-merged successfully','TableSeatLayout','UnMerge');
      OO.notificationBarStatus.value =  MessagesProvider.get("Tables un-merged successfully ");
      setNotification.value = NotificationMessage(message: MessagesProvider.get("Tables unMerged successfully "),color: AppColors.notificationBGLightBlueColor);
      Future.delayed(Duration(seconds: 3),(){
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
        //setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
      });
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => OrdersPage()));
      print("Success");
      print("Success");
    }
  }

  Future<void> clearTable() async {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    OO.notificationBarStatus.value = '';
    Log.printMethodStart('clearTable()','TableSeatLayout','Clear');
    final http.Response response = await http.post(
      Uri.parse("${appPrefsBL.getServerUrl()}/api/Product/FacilityTable/${selectedOuterTableId.value.toString()}/Clear"),
      body: json.encode(
          {
            "Reason": "reason",
            "AdditionalComments": "${additionalCommentsClear.text.toString()}",
            "ApprovalDTO": {
              "ApproverId": approvedUserPkId == 0 ? (execContext.userPKId ?? -1) : approvedUserPkId,
              "Remarks": "remarks"
            }
          }
      ),
      headers: {
        "Authorization" : "${execContext.webApiToken}",
        "Content-Type" : "application/json",
      },
    ).whenComplete(() => Log.printMethodEnd('clearTable()','TableSeatLayout','Clear'));
    if(response.statusCode != 200){
      print("Error");
      print("Error");
      Log.printMethodReturn('clearTable()','TableSeatLayout','Clear');
      OO.notificationBarStatus.value = json.decode(response.body)['data'].toString();
      setNotification.value = NotificationMessage(message: json.decode(response.body)['data'].toString(), color: AppColors.notificationBGRedColor);
      Future.delayed(Duration(seconds: 3),(){
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
      });
      setState(() {
        showOrderModeButtons = false;
      });
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => OrdersPage()));
      print("Error");
      print("Error");
    }else{
      print("Success");
      print("Success");
      setState(() {
        refreshScreen.value = 'true';
        showOrderModeButtons = false;
      });
      Future.delayed(Duration(seconds: 2),(){
        refreshScreen.value = '';
      });
      Log.printMethodReturn('clearTable() - Table cleared successfully','TableSeatLayout','Clear');
      OO.notificationBarStatus.value =  MessagesProvider.get("Table cleared successfully ");
      setNotification.value = NotificationMessage(message: MessagesProvider.get("Table cleared successfully "),color: AppColors.notificationBGLightBlueColor);
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
        //setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
      });
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => OrdersPage()));
      print("Success");
      print("Success");
    }
  }

  Future<void> blockTable() async {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    OO.notificationBarStatus.value = '';
    Log.printMethodStart('blockTable()','TableSeatLayout','Block');
    final http.Response response = await http.post(
      Uri.parse("${appPrefsBL.getServerUrl()}/api/Product/FacilityTable/${selectedOuterTableId.value.toString()}/Block"),
      body: json.encode(
          {
            "Reason": selectedLocation.toString(), // Should be from lookup for Table Block.
            "AdditionalComments": additionalCommentsBlock.text.toString(),
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
    ).whenComplete(() => Log.printMethodEnd('blockTable()','TableSeatLayout','Block'));
    if(response.statusCode != 200){
      print("Error");
      print("Error");
      Log.printMethodReturn('blockTable()','TableSeatLayout','Block');
      OO.notificationBarStatus.value = json.decode(response.body)['data'].toString();
      setNotification.value = NotificationMessage(message: json.decode(response.body)['data'].toString(),color: AppColors.notificationBGRedColor);
      Future.delayed(Duration(seconds: 3),(){
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
      });
      setState(() {
        showOrderModeButtons = false;
      });
      print("Error");
      print("Error");
    }else{
      print("Success");
      print("Success");
      setState(() {
        refreshScreen.value = 'true';
        _getCurrentStatuses();
        showOrderModeButtons = false;
      });
      Future.delayed(Duration(seconds: 2),(){
        refreshScreen.value = '';
      });
      Log.printMethodReturn('blockTable() - Table blocked successfully','TableSeatLayout','Block');
      OO.notificationBarStatus.value = MessagesProvider.get("Table blocked successfully ");
      setNotification.value = NotificationMessage(message: MessagesProvider.get("Table blocked successfully "), color: AppColors.notificationBGLightBlueColor);
      Future.delayed(Duration(seconds: 3),(){
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
        //setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
      });
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => OrdersPage()));
      print("Success");
      print("Success");
    }
  }

  Future<void> reserveTable() async {
    print(customerNameReserve.text.toString());
    print(additionalCommentsReserve.text.toString());
    print(occasionReserve.text.toString());
    print(contactReserve.text.toString());
    print(pickedDateFrom.toString());
    print(pickedDateTo.toString());
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    OO.notificationBarStatus.value = '';
    Log.printMethodStart('reserveTable()','TableSeatLayout','Reserve');
    final http.Response response = await http.post(
      Uri.parse("${appPrefsBL.getServerUrl()}/api/Product/FacilityTable/${selectedOuterTableId.value.toString()}/Reserve"),
      body: json.encode(
          {
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
          }
      ),
      headers: {
        "Authorization" : "${execContext.webApiToken}",
        "Content-Type" : "application/json",
      },
    ).whenComplete(() => Log.printMethodEnd('reserveTable()','TableSeatLayout','Reserve'));
    if(response.statusCode != 200){
      print("Error");
      print("Error");
      Log.printMethodReturn('reserveTable() ','TableSeatLayout','Reserve');
      OO.notificationBarStatus.value = json.decode(response.body)['data'].toString();
      setNotification.value = NotificationMessage(message: json.decode(response.body)['data'].toString(), color: AppColors.notificationBGRedColor);
      Future.delayed(Duration(seconds: 3),(){
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
      });
      setState(() {
        showOrderModeButtons = false;
      });
      print("Error");
      print("Error");
    }else{
      print("Success");
      print("Success");
      setState(() {
        refreshScreen.value = 'true';
        _getCurrentStatuses();
        showOrderModeButtons = false;
      });
      Future.delayed(Duration(seconds: 2),(){
        refreshScreen.value = '';
      });
      Log.printMethodReturn('reserveTable() - Table reserved successfully','TableSeatLayout','Reserve');
      OO.notificationBarStatus.value = MessagesProvider.get("Table reserved successfully ");
      setNotification.value = NotificationMessage(message: MessagesProvider.get("Table reserved successfully "), color: AppColors.notificationBGLightBlueColor);
      Future.delayed(Duration(seconds: 3),(){
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
        //setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
      });
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => OrdersPage()));
      print("Success");
      print("Success");
    }
  }

  Future<void> occupyTable() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    OO.notificationBarStatus.value = '';
    Log.printMethodStart('occupyTable()','TableSeatLayout','Occupy');
    final http.Response response = await http.post(
      Uri.parse("${appPrefsBL.getServerUrl()}/api/Product/FacilityTable/${selectedOuterTableId.value.toString()}/Occupy"),
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
    ).whenComplete(() => Log.printMethodEnd('occupyTable()','TableSeatLayout','Occupy'));
    if(response.statusCode != 200){
      print("Error");
      print("Error");
      Log.printMethodReturn('occupyTable() ','TableSeatLayout','Occupy');
      // OO.notificationBarStatus.value = json.decode(response.body)['data'].toString();
      // setNotification.value = NotificationMessage(message: json.decode(response.body)['data'].toString(), color: AppColors.notificationBGRedColor);
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
      Log.printMethodReturn('occupyTable() - Table reserved successfully.','TableSeatLayout','Occupy');
      setState(() {
        refreshScreen.value = 'true';
      });
      Future.delayed(Duration(seconds: 2),(){
        refreshScreen.value = '';
      });
      // OO.notificationBarStatus.value = 'Table reserved successfully!';
      // setNotification.value = NotificationMessage(message: 'Table reserved successfully!', color: AppColors.notificationBGLightBlueColor);
      Future.delayed(Duration(seconds: 3),(){
        additionalCommentsBlock.clear();
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

  Future<void> getBottomActionButtonStatuses() async {

    actionButtonsAccessControl!.clear();

    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final userRoleDTO = await masterDataBL.getUserRoleById(execContext.userRoleId ?? -1);

    OO.notificationBarStatus.value = '';
    Log.printMethodStart('getBottomActionButtonStatuses()','TableSeatLayout','Init');
    final http.Response response = await http.get(
      Uri.parse("${appPrefsBL.getServerUrl()}/api/Transaction/TaskTypesContainer?hash=null&siteId=${execContext.siteId}&rebuildCache=false"),
      headers: {
        "Authorization" : "${execContext.webApiToken}",
        "Content-Type" : "application/json",
      },
    ).whenComplete(() => Log.printMethodEnd('getBottomActionButtonStatuses()','TableSeatLayout','Init'));
    if(response.statusCode != 200){
      print("Error");
      print("Error");
      Log.printMethodReturn('getBottomActionButtonStatuses()','TableSeatLayout','Init');
      print(json.decode(response.body)['data']);
      print("Error");
      print("Error");
    }else{
      print("Success");
      print("Success");
      print(json.decode(response.body)['data']);
      Log.printMethodReturn('getBottomActionButtonStatuses()','TableSeatLayout','Init');
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

  Future<void> getTransactionData() async {
    print("transactionIdForOngoingOrder : "+transactionIdForOngoingOrder.toString());
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
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

      if(response.exception == null) {
        //_data = response.data;
        Log.printMethodReturn('getTransactionData()','TableSeatLayout','Table');
        print('SEARCH ITEMS - ${response.data?.length ?? 0}');
        print("transactionIdForOngoingOrder : "+transactionIdForOngoingOrder.toString());
        var len = response.data?.length ?? 0;
        //if(len > 0){
          TransactionsData? data = response.data?[0];
          String jsonData = jsonEncode(data);
          retrievedData.value = jsonData;
          print("retrived ${data?.transactionLineDTOList}");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SalesScreen(transactionRetrieveData: jsonData,
                fromTables: true,),
            ),
          );
        //}
      }

    }catch(error) {
      Log.printMethodReturn('getTransactionData()','TableSeatLayout','Table');
      setNotification.value = NotificationMessage(message: 'Error occurred, please try again', color: AppColors.notificationBGRedColor);
      Future.delayed(Duration(seconds: 3),(){
        pressedRowOuterValue.value = '';
        pressedRowOuterValue.value = '';
        pressedRowInnerValue.value = '';
        pressedRowInnerValue.value = '';
        selectedOuterTableId.value = '';
        selectedInnerTableId.value = '';
        refreshScreen.value = '';
        //setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
      });
    }
  }

  Future<void> getOrderHeadViewSingle() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    OO.notificationBarStatus.value = '';
    Log.printMethodStart('getOrderHeadViewSingle()','TableSeatLayout','Table');
    final http.Response response = await http.get(
      Uri.parse("${appPrefsBL.getServerUrl()}/api/Transaction/OrderHeaderView?tableId=${selectedOuterTableId.value.toString()}&orderStatusInList=ORDERED,INITIATED"),
      headers: {
        "Authorization" : "${execContext.webApiToken}",
        "Content-Type" : "application/json",
      },
    ).whenComplete(() => Log.printMethodEnd('getOrderHeadViewSingle()','TableSeatLayout','Table'));
    if(response.statusCode != 200){
      print("Error");
      print("Error");
      Log.printMethodReturn('getOrderHeadViewSingle() - ${selectedOuterTableId.value.toString()}','TableSeatLayout','Table');
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
      Log.printMethodReturn('getOrderHeadViewSingle() - ${selectedOuterTableId.value.toString()}','TableSeatLayout','Table');
      setState(() {
        orderIdForMoveSingle = json.decode(response.body)['data'][0]['OrderId'].toString();
        transactionIdForOngoingOrder = json.decode(response.body)['data'][0]['TransactionId'];
      });
      getTransactionData();
      print("Retrieving transaction data for ID : "+transactionIdForOngoingOrder.toString());
      print("Success");
      print("Success");
    }
  }

  Future<void> getOrderCount() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    OO.notificationBarStatus.value = '';
    Log.printMethodStart('getOrderCount()','TableSeatLayout','Table');
    final http.Response response = await http.get(
      Uri.parse("${appPrefsBL.getServerUrl()}/api/Transaction/OrdersCount?tableId=${selectedOuterTableId.value.toString()}&orderStatusInList=ORDERED,INITIATED"),
      headers: {
        "Authorization" : "${execContext.webApiToken}",
        "Content-Type" : "application/json",
      },
    ).whenComplete(() => Log.printMethodEnd('getOrderCount()','TableSeatLayout','Table'));
    if(response.statusCode != 200){
      print("Error");
      print("Error");
      Log.printMethodReturn('getOrderCount()','TableSeatLayout','Table');
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
      Log.printMethodReturn('getOrderCount()','TableSeatLayout','Table');

      if(int.parse(json.decode(response.body)['data'].toString()) <= 1){
        print("Fresh Order, Redirect to Sales Screen");
        getOrderHeadViewSingle();
      }else{
        print("More than 1 orders, open pop up & show list of Orders");
        showDialog(context: context, builder: (_) {
          return Padding(
            padding: const EdgeInsets.only(left: 16,right: 16.0, top: 12,bottom: 60),
            child: AllOrdersScreen(
              tableId: int.parse(selectedOuterTableId.value.toString()),
            ),
          );
        }).whenComplete((){
          setState(() {
            refreshScreen.value = 'true';
          });
          Future.delayed(Duration(seconds: 2),(){
            setState(() {
              refreshScreen.value = '';
            });
          });
        });
        //getOrderHeadViewList();
      }

      print("Success");
      print("Success");
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
    print("_isCurrentUserManager : "+_isCurrentUserManager.toString());
    print("_currentUserPkId : "+_currentUserPkId.toString());
    Log.printMethodEnd('checkCurrentUserPrivileges()','TableSeatLayout','Init');
  }
  _occupyTableNew() async{
    // _loadingMessage = "Please wait...";
    // _setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final orderSearchBL = await OrdersDataBuilder.build(executionContextDTO!);

    try{

      Log.printMethodStart('_occupyTableNew()','TableSeatLayout','Table');
      var response = await orderSearchBL.occupyTable(tableId: int.parse(selectedOuterTableId.value),
          facilityTable: FacilityTable(Reason: "Reason", AdditionalComments: "additionalComments",
              ApprovalDTO: ApproveDTO(ApproverId :  executionContextDTO.userPKId ?? -1 ,Remarks :"Remarks"))).whenComplete((){
        Log.printMethodEnd('_occupyTableNew()','TableSeatLayout','Table');
      });
      if(response.exception == null) {
        //_setLoadingStatus(false);
        Log.printMethodReturn('_occupyTableNew()','TableSeatLayout','Table');
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => SalesScreen())).whenComplete((){
          setState(() {
            selectedOuterTableId.value = '';
            pressedRowOuterValue.value = '';
            pressedColumnOuterValue.value = '';
            refreshScreen.value = 'true';
          });
          Future.delayed(Duration(seconds: 2),(){
            refreshScreen.value = '';
          });
        });
        // Navigator.pop(context);
      }
    }on DioError catch(error) {
      //_setLoadingStatus(false);
      Log.printMethodReturn('_occupyTableNew()','TableSeatLayout','Table');
      var errorString = error.response?.data['data'] as String?;
      Future.microtask(() => showErrorDialog(context, 'Error', errorString ?? ''));
    }
  }

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkCurrentUserPrivileges();
    //_getCurrentStatuses();
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
      category = []; categoryL = [];tableStatuses = [];
      approval = [];approvalL = [];
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
    // TODO: implement dispose
    super.dispose();
    isTablesScreenOpened.value = 'POPPED';
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

    return Scaffold(
      backgroundColor: theme.backGroundColor,
      //resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: refreshScreen,
            builder: (BuildContext contextPP, String newValue, Widget? child){
              return refreshScreen.value == 'true' ? const Center(
                child: CircularProgressIndicator(),
              ) : Container(
                height: MediaQuery.of(context).size.height,
                child: BlocProvider(
                  create: (context) => FacilityBloc()..add(LoadFacilityEvent()),
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

                        for(int i=0; i<approvalL.length;i++){
                          print("Now on Index : $i");
                          if(approvalL[i].contains('MERGE,Y')){
                            mergeStatus = true;
                            unMergeStatus = true;
                          }else if(approvalL[i].contains('MOVE,Y')){
                            moveStatus = true;
                          }else if(approvalL[i].contains('DETAILS,Y')){
                            detailsStatus = true;
                          }else if(approvalL[i].contains('RESERVE,Y')){
                            reserveStatus = true;
                          }else if(approvalL[i].contains('BLOCK,Y')){
                            blockStatus = true;
                          }else if(approvalL[i].contains('CLEAR,Y')){
                            clearStatus = true;
                          }else{

                          }
                        }

                        tableStatuses = [...{...tableStatuses1}, ...{...tableStatuses2}, ...{...tableStatuses3}];
                        print(tableStatuses);

                        print(" ##### "+ascRowList.toString()+" \n##### "+ascColumnList.toString()+" \n##### ");
                        return ValueListenableBuilder(
                            valueListenable: selectedFacilityName,
                            builder: (BuildContext contextPP, String newValue, Widget? child){
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 15,),
                                  Expanded(
                                    flex: 10,
                                    child: Container(
                                      height: MediaQuery.of(context).size.height/7,
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

                                                                        if(facilitiesList[i].facilityName == 'Restaurant Seating New'){
                                                                          selectedFacilityName.value = 'Restaurant Seating New';
                                                                          setNotification.value = NotificationMessage(message: "Please wait, loading...",
                                                                              color: AppColors.notificationBGLightYellowColor);
                                                                          Future.delayed(Duration(seconds: 2),(){
                                                                            setNotification.value = NotificationMessage(message: "View All Tables",
                                                                                color: theme.footerBG4);
                                                                            print("+++---");
                                                                            print(facilitiesList[i].facilityTableContainerDTOList.length);
                                                                            setState(() {
                                                                              selectedFacilityIndex = i;
                                                                            });
                                                                            print(selectedFacilityIndex);
                                                                          });
                                                                        }else{
                                                                          selectedFacilityName.value = '';
                                                                          print("+++---");
                                                                          print(facilitiesList[i].facilityTableContainerDTOList.length);
                                                                          setState(() {
                                                                            selectedFacilityIndex = i;
                                                                          });
                                                                          print(selectedFacilityIndex);
                                                                        }

                                                                        //prefs.setInt('callBackIndex', selectedFacilityIndex);
                                                                      },
                                                                      child: Container(
                                                                        width: 150,
                                                                        //height: 10,
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
                                  ),
                                  const SizedBox(height: 10,),
                                  Container(
                                    //width: MediaQuery.of(context).size.width+50,
                                    height: MediaQuery.of(context).size.height/1.8,
                                    color: theme.backGroundColor,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, top: 0,
                                          bottom: 0, right: 0),
                                      child: Container(
                                        height: MediaQuery.of(context).size.height,
                                        //width: MediaQuery.of(context).size.width+50,
                                        child: ValueListenableBuilder(
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
                                                                      // height: MediaQuery.of(context).size.height,
                                                                      // width: showSideBar.value == 'true' ? MediaQuery.of(context).size.width/1.28
                                                                      //     : MediaQuery.of(context).size.width/1.035,
                                                                      child: ascRowList.length < 5 ?
                                                                      Flex(
                                                                        direction: Axis.vertical,
                                                                        children: [
                                                                          Expanded(
                                                                            // height: MediaQuery.of(context).size.height+2000,
                                                                            // width: showSideBar.value == 'true' ? MediaQuery.of(context).size.width/1.28
                                                                            //     : MediaQuery.of(context).size.width/1.035,
                                                                            child: Scroller(
                                                                              controller: _hController,
                                                                              child: SingleChildScrollView(
                                                                                controller: _hController,
                                                                                scrollDirection: Axis.horizontal,
                                                                                child: Column(
                                                                                  // controller: _vController,
                                                                                  // scrollDirection: Axis.vertical,
                                                                                  children: [
                                                                                    for (var j in ascRowList) //Row
                                                                                      Row(
                                                                                        children: [
                                                                                          for (var i in ascColumnList) //column
                                                                                            Stack(
                                                                                              children: [
                                                                                                SizedBox(
                                                                                                  height: MediaQuery.of(context).size.height/11,
                                                                                                  width: MediaQuery.of(context).size.height/11,
                                                                                                  child: Padding(
                                                                                                    padding: const EdgeInsets.all(2.0),
                                                                                                    child: InkWell(
                                                                                                      onTap: () {
                                                                                                        pressedRowOuterValue.value = "$i";
                                                                                                        pressedColumnOuterValue.value = "$j";

                                                                                                        selectedTableId = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                            element.columnIndex == i).tableId;

                                                                                                        selectedTableToShowCrossMark.value = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                            element.columnIndex == i).tableId.toString();

                                                                                                        tempSelectedTableId = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                            element.columnIndex == i).tableId;

                                                                                                        selectedOuterTableId.value = '$selectedTableId';
                                                                                                        selectedOuterTableIdUnMerge.value = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                            element.columnIndex == i).facilityTableCurrentStatusDTO!.mergedWithTableId.toString();

                                                                                                        TableSeatLayoutBottomActionBarW.selectedTableIdOuter.value = selectedTableId.toString();
                                                                                                        selectedOuterTableName.value = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                            element.columnIndex == i).tableName.toString();

                                                                                                        selectedOuterTableStatus.value = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                            element.columnIndex == i).facilityTableCurrentStatusDTO!.status.toString();

                                                                                                        print(listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                            element.columnIndex == i).facilityTableCurrentStatusDTO!.status.toString());
                                                                                                        // print(listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                        //     element.columnIndex == i).tableId.toString());

                                                                                                        selectedOuterTableCharacter.value = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                            element.columnIndex == i).facilityTableCurrentStatusDTO!.character.toString();

                                                                                                        print(listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                            element.columnIndex == i).facilityTableCurrentStatusDTO!.status.toString());
                                                                                                        // print(listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                        //     element.columnIndex == i).tableId.toString());

                                                                                                        print(listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                            element.columnIndex == i).facilityTableCurrentStatusDTO!.mergedWithTableId.toString());

                                                                                                        if(showOrderModeButtons == false){
                                                                                                          if(listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                              element.columnIndex == i).facilityTableCurrentStatusDTO!.character.toString() == 'F' ||
                                                                                                              listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                  element.columnIndex == i).facilityTableCurrentStatusDTO!.tableCurrentStatus.toString() == "OPEN"){
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
                                                                                                                         // tableSeatCubit.unSelectTable();
                                                                                                                        }
                                                                                                                    );
                                                                                                                  },
                                                                                                                );
                                                                                                              },
                                                                                                            );
                                                                                                          }else if( listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                              element.columnIndex == i).facilityTableCurrentStatusDTO!.character.toString() == 'B'||
                                                                                                              listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                  element.columnIndex == i).facilityTableCurrentStatusDTO!.character.toString() == 'R'){
                                                                                                            print("{}{}{}{}{}");
                                                                                                            var status = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                element.columnIndex == i).facilityTableCurrentStatusDTO!.character.toString() == 'B' ? "BLOCKED" :"RESERVED";
                                                                                                            showDialog(context: context,
                                                                                                                barrierDismissible: false,
                                                                                                                builder: (_) => AllowOverride(
                                                                                                                  status: status,
                                                                                                                  onOk: (){
                                                                                                                    Navigator.pop(context);
                                                                                                                    _showTransactionOrderDetail();
                                                                                                                  },
                                                                                                                ));
                                                                                                          }else{
                                                                                                            getOrderCount();
                                                                                                          }

                                                                                                        }else{

                                                                                                        }

                                                                                                      },
                                                                                                      child: listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                          element.columnIndex == i).tableName.toString() == 'Generic' ?
                                                                                                      Container(
                                                                                                        height: 20,
                                                                                                        width: 20,
                                                                                                        decoration: BoxDecoration(
                                                                                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                                                                                          color: pressedRowOuterValue.value == "$i" && pressedColumnOuterValue.value == "$j" ?
                                                                                                          Color(0xff696a67).withOpacity(0.4) : Color(0xff696a67),
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
                                                                                                      ) :
                                                                                                      pressedRowOuterValue.value == "$i" && pressedColumnOuterValue.value == "$j" ?
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
                                                                                      // controller: _vController,
                                                                                      // scrollDirection: Axis.vertical,
                                                                                      children: [
                                                                                        for (var j in ascRowList) //Row
                                                                                          Row(
                                                                                            children: [
                                                                                              for (var i in ascColumnList) //column
                                                                                                Stack(
                                                                                                  children: [
                                                                                                    SizedBox(
                                                                                                      height: MediaQuery.of(context).size.height/11,
                                                                                                      width: MediaQuery.of(context).size.height/11,
                                                                                                      child: Padding(
                                                                                                        padding: const EdgeInsets.all(2.0),
                                                                                                        child: InkWell(
                                                                                                          onTap: () {
                                                                                                            pressedRowOuterValue.value = "$i";
                                                                                                            pressedColumnOuterValue.value = "$j";

                                                                                                            selectedTableId = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                element.columnIndex == i).tableId;

                                                                                                            selectedTableToShowCrossMark.value = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                element.columnIndex == i).tableId.toString();

                                                                                                            tempSelectedTableId = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                element.columnIndex == i).tableId;

                                                                                                            selectedOuterTableId.value = '$selectedTableId';
                                                                                                            selectedOuterTableIdUnMerge.value = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                element.columnIndex == i).facilityTableCurrentStatusDTO!.mergedWithTableId.toString();

                                                                                                            TableSeatLayoutBottomActionBarW.selectedTableIdOuter.value = selectedTableId.toString();
                                                                                                            selectedOuterTableName.value = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                element.columnIndex == i).tableName.toString();

                                                                                                            selectedOuterTableStatus.value = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                element.columnIndex == i).facilityTableCurrentStatusDTO!.status.toString();

                                                                                                            print(listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                element.columnIndex == i).facilityTableCurrentStatusDTO!.status.toString());
                                                                                                            // print(listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                            //     element.columnIndex == i).tableId.toString());

                                                                                                            selectedOuterTableCharacter.value = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                element.columnIndex == i).facilityTableCurrentStatusDTO!.character.toString();

                                                                                                            print(listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                element.columnIndex == i).facilityTableCurrentStatusDTO!.character.toString());
                                                                                                            // print(listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                            //     element.columnIndex == i).tableId.toString());

                                                                                                            print(listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                element.columnIndex == i).facilityTableCurrentStatusDTO!.mergedWithTableId.toString());

                                                                                                            if(showOrderModeButtons == false){
                                                                                                              if(listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                  element.columnIndex == i).facilityTableCurrentStatusDTO!.character.toString() == 'F' ||
                                                                                                                  listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i).facilityTableCurrentStatusDTO!.tableCurrentStatus.toString() == "OPEN"){
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
                                                                                                                              // tableSeatCubit.unSelectTable();
                                                                                                                            }
                                                                                                                        );
                                                                                                                      },
                                                                                                                    );
                                                                                                                  },
                                                                                                                );
                                                                                                              }else if( listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                  element.columnIndex == i).facilityTableCurrentStatusDTO!.character.toString() == 'B'||
                                                                                                                  listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                      element.columnIndex == i).facilityTableCurrentStatusDTO!.character.toString() == 'R'){
                                                                                                                print("{}{}{}{}{}");
                                                                                                                var status = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                                                    element.columnIndex == i).facilityTableCurrentStatusDTO!.character.toString() == 'B' ? "BLOCKED" :"RESERVED";
                                                                                                                showDialog(context: context,
                                                                                                                    barrierDismissible: false,
                                                                                                                    builder: (_) => AllowOverride(
                                                                                                                      status: status,
                                                                                                                      onOk: (){
                                                                                                                        Navigator.pop(context);
                                                                                                                        _showTransactionOrderDetail();
                                                                                                                      },
                                                                                                                    ));
                                                                                                              }else{
                                                                                                                getOrderCount();
                                                                                                              }

                                                                                                            }else{

                                                                                                            }

                                                                                                          },
                                                                                                          child: pressedRowOuterValue.value == "$i" && pressedColumnOuterValue.value == "$j" ?
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
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(width: double.infinity,height: 1,
                                    color: theme.dividerColor,),
                                  ValueListenableBuilder(
                                      valueListenable: showBottomActionBar,
                                      builder: (BuildContext contextPP, String newValue, Widget? child){
                                        return showBottomActionBar.value == 'true' ? Expanded(
                                          flex: 10,
                                          child: Container(
                                            height: MediaQuery.of(context).size.height/7,
                                            color: theme.backGroundColor,
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                                              child: Row(
                                                children: [
                                                  const SizedBox(width: 5,),
                                                  ValueListenableBuilder(
                                                      valueListenable: pressedRowOuterValue,
                                                      builder: (BuildContext contextPP, String newValue, Widget? child){
                                                        return ValueListenableBuilder(
                                                            valueListenable: pressedColumnOuterValue,
                                                            builder: (BuildContext contextPP, String newValue, Widget? child){
                                                              return InkWell(
                                                                onTap: (){

                                                                  if(selectedFacilityName.value == 'Restaurant Seating New'){
                                                                    setNotification.value = NotificationMessage(message: "Please wait...",
                                                                        color: AppColors.notificationBGLightYellowColor);
                                                                    Future.delayed(Duration(seconds: 1),(){
                                                                      setNotification.value = NotificationMessage(message: "View All Tables",
                                                                          color: theme.footerBG4);
                                                                      print(categoryL);
                                                                      setState(() {
                                                                        approvedUserPkId = 0;
                                                                        selectedOuterTableId.value = '';
                                                                        pressedRowOuterValue.value = '';
                                                                        pressedColumnOuterValue.value = '';
                                                                        showOrderModeButtons = !showOrderModeButtons;
                                                                        if(showOrderModeButtons == false){
                                                                          scrollTopMinMax.value = '';
                                                                        }else{
                                                                          scrollTopMinMax.value = 'min';
                                                                        }
                                                                      });
                                                                    });
                                                                  }else{
                                                                    print(categoryL);
                                                                    setState(() {
                                                                      approvedUserPkId = 0;
                                                                      selectedOuterTableId.value = '';
                                                                      pressedRowOuterValue.value = '';
                                                                      pressedColumnOuterValue.value = '';
                                                                      showOrderModeButtons = !showOrderModeButtons;
                                                                      if(showOrderModeButtons == false){
                                                                        scrollTopMinMax.value = '';
                                                                      }else{
                                                                        scrollTopMinMax.value = 'min';
                                                                      }
                                                                    });
                                                                  }
                                                                },
                                                                child: Container(
                                                                  width: 60,
                                                                  height: 40,
                                                                  decoration: BoxDecoration(
                                                                      color: AppColors.blackColor,
                                                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(showOrderModeButtons == false ? "ORDER\nMODE" : "ACTION\nMODE",
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        fontFamily: 'RobotoCondensed',
                                                                        color: ThemesProvider.getColor("primaryColor"),
                                                                        fontSize: SizeConfig.getFontSize(16),
                                                                        fontWeight: FontWeight.w600,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                        );
                                                      }
                                                  ),
                                                  const SizedBox(width: 5,),
                                                  InkWell(
                                                    onTap: () async {
                                                      Log.printMethodStart('getFacilityTableCurrentStatuses()','TableSeatLayout','Refresh');
                                                      print("showOrderModeButtons : "+showOrderModeButtons.toString());
                                                      //setState(() {
                                                        setNotification.value = NotificationMessage(message: "Please wait...",color:AppColors.notificationBGLightBlueColor);
                                                      //});
                                                      context.read<FacilityBloc>().add(LoadFacilityEvent());
                                                      Future.delayed(Duration(seconds: 3),(){
                                                        //setState(() {
                                                          setNotification.value = NotificationMessage(message: "Tables refreshed successfully",color:AppColors.notificationBGLightBlueColor);
                                                          Log.printMethodEnd('getFacilityTableCurrentStatuses()','TableSeatLayout','Refresh');
                                                        //});
                                                      });
                                                    },
                                                    child: Container(
                                                      width: 60,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          color: AppColors.blackColor,
                                                          borderRadius: BorderRadius.all(Radius.circular(5))
                                                      ),
                                                      child: Center(
                                                        child: Text("REFRESH",
                                                          style: TextStyle(
                                                            fontFamily: 'RobotoCondensed',
                                                            color: ThemesProvider.getColor("primaryColor"),
                                                            fontSize: SizeConfig.getFontSize(16),
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  ValueListenableBuilder(
                                                      valueListenable: scrollOffsetBottom,
                                                      builder: (BuildContext contextPP, String newValue, Widget? child){
                                                        return ValueListenableBuilder(
                                                            valueListenable: scrollTopMinMax,
                                                            builder: (BuildContext contextPP, String newValue, Widget? child){
                                                              return InkWell(
                                                                onTap: (){
                                                                  // scrollOffsetBottom.value = '${_controllerBottomBar.position.pixels}';
                                                                  // print("Position : "+scrollOffsetBottom.value.toString());
                                                                  if(showOrderModeButtons == false){

                                                                  }else{
                                                                    scrollTopMinMax.value = 'min';
                                                                    _controllerBottomBar.animateTo(
                                                                      _controller.position.minScrollExtent,
                                                                      duration: Duration(seconds: 2),
                                                                      curve: Curves.fastOutSlowIn,
                                                                    );
                                                                  }
                                                                },
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
                                                              );
                                                            }
                                                        );
                                                      }
                                                  ),
                                                  Expanded(
                                                    flex: 10,
                                                    child: Container(
                                                      height: 40,
                                                      //width: MediaQuery.of(context).size.width/1.9-25,
                                                      child:
                                                      NotificationListener(
                                                        onNotification: (t) {
                                                          if (t is ScrollEndNotification) {
                                                            scrollOffsetBottom.value = int.parse(_controllerBottomBar.position.pixels.toStringAsFixed(0)).toString();
                                                          }
                                                          return true;
                                                        },
                                                        child: ListView(
                                                          controller: _controllerBottomBar,
                                                          scrollDirection: Axis.horizontal,
                                                          physics: ScrollPhysics(),
                                                          children: [
                                                            const SizedBox(width: 5,),
                                                            ValueListenableBuilder(
                                                                valueListenable: selectedOuterTableStatus,
                                                                builder: (BuildContext contextPP, String newValue, Widget? child){
                                                                  return ValueListenableBuilder(
                                                                      valueListenable: selectedOuterTableId,
                                                                      builder: (BuildContext contextPP, String newValue, Widget? child){
                                                                        return ValueListenableBuilder(
                                                                            valueListenable: selectedOuterTableName,
                                                                            builder: (BuildContext contextPP, String newValue, Widget? child){
                                                                              return InkWell(
                                                                                onTap: (){
                                                                                  print("mergeStatus : "+mergeStatus.toString());
                                                                                  print("selectedOuterTableStatus : "+selectedOuterTableStatus.value.toString());
                                                                                  if(showOrderModeButtons == false && selectedOuterTableId.value != ''){

                                                                                  }else if(showOrderModeButtons == false && selectedOuterTableId.value == ''){

                                                                                  }else if(mergeStatus == false ||
                                                                                      !(actionButtonsAccessControl!.contains('MERGE'))){

                                                                                  }else if(showOrderModeButtons == true && selectedOuterTableId.value == ''){
                                                                                    setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Please select a table to perform action "),
                                                                                        color: AppColors.notificationBGRedColor);
                                                                                    setState(() {
                                                                                      showOrderModeButtons == false;
                                                                                    });
                                                                                    // Future.delayed(Duration(seconds: 3),(){
                                                                                    //   setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
                                                                                    // });
                                                                                  }else{
                                                                                    if(selectedOuterTableCharacter.value == 'B' || selectedOuterTableCharacter.value == 'R' || selectedOuterTableCharacter.value == 'M'){
                                                                                      setNotification.value = NotificationMessage(message: MessagesProvider.get("Operation is not allowed "),
                                                                                          color: AppColors.notificationBGLightYellowColor);
                                                                                      setState((){
                                                                                        selectedOuterTableId.value = '';
                                                                                        pressedRowOuterValue.value = '';
                                                                                        pressedColumnOuterValue.value = '';
                                                                                        showOrderModeButtons == false;
                                                                                      });
                                                                                      // Future.delayed(Duration(seconds: 3),(){
                                                                                      //   setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
                                                                                      // });
                                                                                    }else{
                                                                                      if(_isCurrentUserManager == true && mergeStatusM == false){
                                                                                        final _listRow = [];
                                                                                        final _listColumn = [];
                                                                                        final _listOfNames = [];
                                                                                        var ascRowList = [];
                                                                                        var ascColumnList = [];

                                                                                        print("||||| ${selectedTableIdOuter.value} |||||");
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

                                                                                        setNotification.value = NotificationMessage(message: MessagesProvider.get("Performing table action &1 ",["MERGE"]),color:theme.footerBG4);
                                                                                        showDialog(
                                                                                          context: context,
                                                                                          builder: (BuildContext contextNew) {
                                                                                            return StatefulBuilder(
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
                                                                                                              mergeTables();
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
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      }else{
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
                                                                                        }).whenComplete((){
                                                                                          setState(() {
                                                                                            showOrderModeButtons = false;
                                                                                          });
                                                                                          print("approvedUserPkId ::::: "+approvedUserPkId.toString());
                                                                                          if(approvedUserPkId != 0){
                                                                                            final _listRow = [];
                                                                                            final _listColumn = [];
                                                                                            final _listOfNames = [];
                                                                                            var ascRowList = [];
                                                                                            var ascColumnList = [];

                                                                                            print("||||| ${selectedTableIdOuter.value} |||||");
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

                                                                                            setNotification.value = NotificationMessage(message: MessagesProvider.get("Performing table action &1 ",["MERGE"]),color:theme.footerBG4);
                                                                                            showDialog(
                                                                                              context: context,
                                                                                              builder: (BuildContext contextNew) {
                                                                                                return StatefulBuilder(
                                                                                                  builder: (contextNew, setState) {
                                                                                                    return Center(
                                                                                                      child: AlertDialog(
                                                                                                        backgroundColor: theme.backGroundColor,
                                                                                                        insetPadding: EdgeInsets.only(top: 40, bottom: 45,left: 0, right: 0),
                                                                                                        title: Column(
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text("Merge ${selectedOuterTableName.value.toString()} to",
                                                                                                              style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(16),),
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
                                                                                                                    color: theme.backGroundColor.toString().contains('202020')
                                                                                                                        ? Colors.white : Colors.white,
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
                                                                                                                  mergeTables();
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
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          }
                                                                                        });
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                },
                                                                                child: mergeStatus == true &&
                                                                                    !(actionButtonsAccessControl!.contains('MERGE')) ?
                                                                                Container(
                                                                                  width: 60,
                                                                                  height: 60,
                                                                                  decoration: BoxDecoration(
                                                                                      color: Colors.grey.shade300,
                                                                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                                                                  ),
                                                                                  child: Center(
                                                                                    child: Text("MERGE",
                                                                                      style: TextStyle(
                                                                                        fontFamily: 'RobotoCondensed',
                                                                                        color: ThemesProvider.getColor("primaryColor"),
                                                                                        fontSize: SizeConfig.getFontSize(16),
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ) : Container(
                                                                                  width: 60,
                                                                                  height: 40,
                                                                                  decoration: BoxDecoration(
                                                                                      color:
                                                                                      showOrderModeButtons == false || mergeStatus == false ?
                                                                                      Colors.grey.shade300 :
                                                                                      Colors.black,
                                                                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                                                                  ),
                                                                                  child: Center(
                                                                                    child: Text("MERGE",
                                                                                      style: TextStyle(
                                                                                        fontFamily: 'RobotoCondensed',
                                                                                        color: ThemesProvider.getColor("primaryColor"),
                                                                                        fontSize: SizeConfig.getFontSize(16),
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                        );
                                                                      }
                                                                  );
                                                                }
                                                            ),
                                                            const SizedBox(width: 5,),
                                                            ValueListenableBuilder(
                                                                valueListenable: selectedOuterTableStatus,
                                                                builder: (BuildContext contextPP, String newValue, Widget? child){
                                                                  return ValueListenableBuilder(
                                                                      valueListenable: selectedOuterTableId,
                                                                      builder: (BuildContext contextPP, String newValue, Widget? child){
                                                                        return ValueListenableBuilder(
                                                                            valueListenable: selectedOuterTableName,
                                                                            builder: (BuildContext contextPP, String newValue, Widget? child){
                                                                              return InkWell(
                                                                                onTap: (){
                                                                                  if(showOrderModeButtons == false && selectedOuterTableId.value != ''){

                                                                                  }else if(showOrderModeButtons == false && selectedOuterTableId.value == ''){

                                                                                  }else if(unMergeStatus == false ||
                                                                                      !(actionButtonsAccessControl!.contains('UNMERGE'))){

                                                                                  }else if(showOrderModeButtons == true && selectedOuterTableId.value == ''){
                                                                                    setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Please select a table to perform action "),
                                                                                        color: AppColors.notificationBGRedColor);
                                                                                    setState(() {
                                                                                      showOrderModeButtons == false;
                                                                                    });
                                                                                  }else{
                                                                                    if(selectedOuterTableCharacter.value == 'B' || selectedOuterTableCharacter.value == 'R' || selectedOuterTableCharacter.value == 'F'){
                                                                                      setNotification.value = NotificationMessage(message:  MessagesProvider.get("Operation is not allowed "),
                                                                                          color: AppColors.notificationBGLightYellowColor);
                                                                                      setState((){
                                                                                        selectedOuterTableId.value = '';
                                                                                        pressedRowOuterValue.value = '';
                                                                                        pressedColumnOuterValue.value = '';
                                                                                        showOrderModeButtons = false;
                                                                                      });
                                                                                      // Future.delayed(Duration(seconds: 3),(){
                                                                                      //   setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
                                                                                      // });
                                                                                    }else{
                                                                                      if(_isCurrentUserManager == true && unMergeStatusM == false){
                                                                                        unMergeTable();
                                                                                      }else{
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
                                                                                        }).whenComplete(() async {
                                                                                          setState(() {
                                                                                            showOrderModeButtons = false;
                                                                                          });
                                                                                          print("approvedUserPkId ::::: "+approvedUserPkId.toString());
                                                                                          if(approvedUserPkId != 0){
                                                                                            await unMergeTable();
                                                                                          }
                                                                                        });
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                },
                                                                                child: unMergeStatus == true &&
                                                                                    !(actionButtonsAccessControl!.contains('UNMERGE')) ?
                                                                                Container(
                                                                                  width: 60,
                                                                                  height: 60,
                                                                                  decoration: BoxDecoration(
                                                                                      color: Colors.grey.shade300,
                                                                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                                                                  ),
                                                                                  child: Center(
                                                                                    child: Text("UNMERGE",
                                                                                      style: TextStyle(
                                                                                        fontFamily: 'RobotoCondensed',
                                                                                        color: ThemesProvider.getColor("primaryColor"),
                                                                                        fontSize: SizeConfig.getFontSize(16),
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ) : Container(
                                                                                  width: 60,
                                                                                  height: 60,
                                                                                  decoration: BoxDecoration(
                                                                                      color: showOrderModeButtons == false || unMergeStatus == false ? Colors.grey.shade300 :
                                                                                      Colors.black,
                                                                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                                                                  ),
                                                                                  child: Center(
                                                                                    child: Text("UNMERGE",
                                                                                      style: TextStyle(
                                                                                        fontFamily: 'RobotoCondensed',
                                                                                        color: ThemesProvider.getColor("primaryColor"),
                                                                                        fontSize: SizeConfig.getFontSize(16),
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                        );
                                                                      }
                                                                  );
                                                                }
                                                            ),
                                                            const SizedBox(width: 5,),
                                                            ValueListenableBuilder(
                                                                valueListenable: signalForOpenMoveTablePopUp,
                                                                builder: (BuildContext contextPP, String newValue, Widget? child){
                                                                  return ValueListenableBuilder(
                                                                      valueListenable: selectedOuterTableStatus,
                                                                      builder: (BuildContext contextPP, String newValue, Widget? child){
                                                                        return ValueListenableBuilder(
                                                                            valueListenable: selectedOuterTableId,
                                                                            builder: (BuildContext contextPP, String newValue, Widget? child){
                                                                              return ValueListenableBuilder(
                                                                                  valueListenable: selectedOuterTableName,
                                                                                  builder: (BuildContext contextPP, String newValue, Widget? child){
                                                                                    return InkWell(
                                                                                      onTap: () async {
                                                                                        print("ID : "+selectedOuterTableId.value);
                                                                                        if(showOrderModeButtons == false && selectedOuterTableId.value != ''){

                                                                                        }else if(showOrderModeButtons == false && selectedOuterTableId.value == ''){

                                                                                        }else if(moveStatus == false ||
                                                                                            !(actionButtonsAccessControl!.contains('MOVE'))){

                                                                                        }else if(showOrderModeButtons == true && selectedOuterTableId.value == ''){
                                                                                          setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Please select a table to perform action "),
                                                                                              color: AppColors.notificationBGRedColor);
                                                                                          setState(() {
                                                                                            showOrderModeButtons = false;
                                                                                            selectedOuterTableId.value = '';
                                                                                            pressedRowOuterValue.value = '';
                                                                                            pressedColumnOuterValue.value = '';
                                                                                          });
                                                                                        }else{
                                                                                          if(selectedOuterTableCharacter.value == "F" && selectedOuterTableName.value != 'Generic'){
                                                                                            setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Selected table has no orders to move."),
                                                                                                color: AppColors.notificationBGLightYellowColor);
                                                                                            setState(() {
                                                                                              showOrderModeButtons = false;
                                                                                              selectedOuterTableId.value = '';
                                                                                              pressedRowOuterValue.value = '';
                                                                                              pressedColumnOuterValue.value = '';
                                                                                            });
                                                                                          }else{
                                                                                            if(_isCurrentUserManager == true && moveStatusM == false){
                                                                                              showLoading = true;
                                                                                              //if(selectedOuterTableStatus.value == 'OCCUPIED' || selectedOuterTableCharacter.value == 'O'){
                                                                                              final execContextBL = await ExecutionContextBuilder.build();
                                                                                              final execContext = execContextBL.getExecutionContext();
                                                                                              final masterDataBL = await MasterDataBuilder.build(execContext!);
                                                                                              final orderDataBL = await OrdersDataBuilder.build(execContext);
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
                                                                                                Future.delayed(Duration(seconds: 3),(){
                                                                                                  pressedRowOuterValue.value = '';
                                                                                                  pressedRowOuterValue.value = '';
                                                                                                  pressedRowInnerValue.value = '';
                                                                                                  pressedRowInnerValue.value = '';
                                                                                                  selectedOuterTableId.value = '';
                                                                                                  selectedInnerTableId.value = '';
                                                                                                  refreshScreen.value = '';
                                                                                                  //setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
                                                                                                });
                                                                                                setState(() {
                                                                                                  showOrderModeButtons = false;
                                                                                                });
                                                                                                print("Error");
                                                                                                print("Error");
                                                                                              }else{
                                                                                                print("Success");
                                                                                                print("Success");
                                                                                                Log.printMethodReturn('getOrdersCount()','TableSeatLayout','Move');

                                                                                                if(int.parse(json.decode(response.body)['data'].toString()) == 0){
                                                                                                  setNotification.value = NotificationMessage(message: 'Selected table has no orders to move',
                                                                                                      color:AppColors.notificationBGLightYellowColor);
                                                                                                  //Future.delayed(Duration(seconds: 3),(){
                                                                                                  setState(() {
                                                                                                    showOrderModeButtons = false;
                                                                                                  });
                                                                                                  pressedRowOuterValue.value = '';
                                                                                                  pressedRowOuterValue.value = '';
                                                                                                  pressedRowInnerValue.value = '';
                                                                                                  pressedRowInnerValue.value = '';
                                                                                                  selectedOuterTableId.value = '';
                                                                                                  selectedInnerTableId.value = '';
                                                                                                  refreshScreen.value = '';
                                                                                                  //});
                                                                                                }else{
                                                                                                  if(int.parse(json.decode(response.body)['data'].toString()) <= 1){
                                                                                                    //print("Fresh Order, Redirect to Sales Screen");
                                                                                                    final execContextBL = await ExecutionContextBuilder.build();
                                                                                                    final execContext = execContextBL.getExecutionContext();
                                                                                                    final masterDataBL = await MasterDataBuilder.build(execContext!);
                                                                                                    final orderDataBL = await OrdersDataBuilder.build(execContext);
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
                                                                                                      print("Error");
                                                                                                      print("Error");
                                                                                                      Log.printMethodReturn('getOrderHeaderView()','TableSeatLayout','Move');
                                                                                                      setState(() {
                                                                                                        showOrderModeButtons = false;
                                                                                                      });
                                                                                                      Future.delayed(Duration(seconds: 3),(){
                                                                                                        pressedRowOuterValue.value = '';
                                                                                                        pressedRowOuterValue.value = '';
                                                                                                        pressedRowInnerValue.value = '';
                                                                                                        pressedRowInnerValue.value = '';
                                                                                                        selectedOuterTableId.value = '';
                                                                                                        selectedInnerTableId.value = '';
                                                                                                        refreshScreen.value = '';
                                                                                                        //setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
                                                                                                      });
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
                                                                                                        setState(() {
                                                                                                          showOrderModeButtons = false;
                                                                                                        });
                                                                                                        //Future.delayed(Duration(seconds: 3),(){
                                                                                                        pressedRowOuterValue.value = '';
                                                                                                        pressedRowOuterValue.value = '';
                                                                                                        pressedRowInnerValue.value = '';
                                                                                                        pressedRowInnerValue.value = '';
                                                                                                        selectedOuterTableId.value = '';
                                                                                                        selectedInnerTableId.value = '';
                                                                                                        refreshScreen.value = '';
                                                                                                        //});
                                                                                                      }else{
                                                                                                        orderIdFromAllOrdersScreen.value = json.decode(response.body)['data'][0]['OrderId'].toString();
                                                                                                        orderIdForMoveSingle = json.decode(response.body)['data'][0]['OrderId'].toString();
                                                                                                        transactionIdForOngoingOrder = json.decode(response.body)['data'][0]['TransactionId'];
                                                                                                        //});
                                                                                                        //getTransactionData();
                                                                                                        Future.delayed(Duration(seconds: 2),(){
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
                                                                                                          ).whenComplete((){
                                                                                                            if(refreshScreen.value == 'poppedfromorders'){
                                                                                                              setState(() {
                                                                                                                refreshScreen.value = 'true';
                                                                                                                showOrderModeButtons = false;
                                                                                                              });
                                                                                                              Future.delayed(Duration(seconds: 2),(){
                                                                                                                setState(() {
                                                                                                                  refreshScreen.value = '';
                                                                                                                });
                                                                                                              });
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
                                                                                                      return Padding(
                                                                                                        padding: const EdgeInsets.only(left: 16,right: 16.0, top: 12,bottom: 60),
                                                                                                        child: AllOrdersScreen(
                                                                                                          tableId: int.parse(selectedOuterTableId.value.toString()),
                                                                                                          operation: 'MOVE',
                                                                                                        ),
                                                                                                      );
                                                                                                    }).whenComplete((){
                                                                                                      print("OrderId from AllOrdersScreen : "+orderIdFromAllOrdersScreen.value.toString());
                                                                                                      print("TransactionId from AllOrdersScreen : "+transactionIdFromAllOrdersScreen.value.toString());
                                                                                                      print("Operation : "+moveOperationFromAllOrdersScreen.value.toString());
                                                                                                      setState(() {
                                                                                                        showOrderModeButtons = false;
                                                                                                      });
                                                                                                      if(orderIdFromAllOrdersScreen.value.isNotEmpty){
                                                                                                        setState(() {
                                                                                                          orderIdForMoveSingle = orderIdFromAllOrdersScreen.value.toString();
                                                                                                        });
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
                                                                                                          ).whenComplete((){
                                                                                                            print("OrderId from AllOrdersScreen : "+orderIdFromAllOrdersScreen.value.toString());
                                                                                                            print("TransactionId from AllOrdersScreen : "+transactionIdFromAllOrdersScreen.value.toString());
                                                                                                            print("Operation : "+moveOperationFromAllOrdersScreen.value.toString());
                                                                                                            if(refreshScreen.value == 'poppedfromorders'){
                                                                                                              setState(() {
                                                                                                                refreshScreen.value = 'true';
                                                                                                                showOrderModeButtons = false;
                                                                                                              });
                                                                                                              Future.delayed(Duration(seconds: 2),(){
                                                                                                                setState(() {
                                                                                                                  refreshScreen.value = '';
                                                                                                                });
                                                                                                              });
                                                                                                            }else{

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
                                                                                                          ).whenComplete((){
                                                                                                            print("OrderId from AllOrdersScreen : "+orderIdFromAllOrdersScreen.value.toString());
                                                                                                            print("TransactionId from AllOrdersScreen : "+transactionIdFromAllOrdersScreen.value.toString());
                                                                                                            print("Operation : "+moveOperationFromAllOrdersScreen.value.toString());
                                                                                                            if(refreshScreen.value == 'poppedfromorders'){
                                                                                                              setState(() {
                                                                                                                refreshScreen.value = 'true';
                                                                                                                showOrderModeButtons = false;
                                                                                                              });
                                                                                                              Future.delayed(Duration(seconds: 2),(){
                                                                                                                setState(() {
                                                                                                                  refreshScreen.value = '';
                                                                                                                });
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
                                                                                            }else{
                                                                                              showDialog(context: context, builder: (ctx) {
                                                                                                return Dialog(
                                                                                                  insetPadding: EdgeInsets.symmetric(horizontal: SizeConfig.getSize(220)),
                                                                                                  child: ManagerLoginView(
                                                                                                    onLoginSuccess: (response) async {
                                                                                                      print("response :::::: "+response.toString());
                                                                                                      print("Approver New ID : "+response.data!.userPKId.toString());
                                                                                                      setState(() {
                                                                                                        approvedUserPkId = response.data!.userPKId;
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
                                                                                              }).whenComplete(() async {
                                                                                                print("approvedUserPkId ::::: "+approvedUserPkId.toString());
                                                                                                setState(() {
                                                                                                  showOrderModeButtons = false;
                                                                                                });
                                                                                                if(approvedUserPkId != 0){
                                                                                                  showLoading = true;
                                                                                                  if(selectedOuterTableStatus.value == 'OCCUPIED' || selectedOuterTableCharacter.value == 'O'){
                                                                                                    final execContextBL = await ExecutionContextBuilder.build();
                                                                                                    final execContext = execContextBL.getExecutionContext();
                                                                                                    final masterDataBL = await MasterDataBuilder.build(execContext!);
                                                                                                    final orderDataBL = await OrdersDataBuilder.build(execContext);
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
                                                                                                      Future.delayed(Duration(seconds: 3),(){
                                                                                                        pressedRowOuterValue.value = '';
                                                                                                        pressedRowOuterValue.value = '';
                                                                                                        pressedRowInnerValue.value = '';
                                                                                                        pressedRowInnerValue.value = '';
                                                                                                        selectedOuterTableId.value = '';
                                                                                                        selectedInnerTableId.value = '';
                                                                                                        refreshScreen.value = '';
                                                                                                        //setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
                                                                                                      });
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
                                                                                                        final masterDataBL = await MasterDataBuilder.build(execContext!);
                                                                                                        final orderDataBL = await OrdersDataBuilder.build(execContext);
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
                                                                                                          print("Error");
                                                                                                          print("Error");
                                                                                                          Log.printMethodReturn('getOrderHeaderView()','TableSeatLayout','Move');
                                                                                                          Future.delayed(Duration(seconds: 3),(){
                                                                                                            pressedRowOuterValue.value = '';
                                                                                                            pressedRowOuterValue.value = '';
                                                                                                            pressedRowInnerValue.value = '';
                                                                                                            pressedRowInnerValue.value = '';
                                                                                                            selectedOuterTableId.value = '';
                                                                                                            selectedInnerTableId.value = '';
                                                                                                            refreshScreen.value = '';
                                                                                                            //setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
                                                                                                          });
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
                                                                                                          Future.delayed(Duration(seconds: 2),(){
                                                                                                            setNotification.value = NotificationMessage(message: 'Performing table action Move',color:AppColors.notificationBGLightBlueColor);
                                                                                                            // Future.delayed(Duration(seconds: 3),(){
                                                                                                            //   setState(() {
                                                                                                            //     setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
                                                                                                            //   });
                                                                                                            // });
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
                                                                                                            );
                                                                                                          });
                                                                                                          print("Retrieving transaction data for ID : "+transactionIdForOngoingOrder.toString());
                                                                                                          print("Success");
                                                                                                          print("Success");
                                                                                                        }
                                                                                                      }else{
                                                                                                        showLoading = false;
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
                                                                                                        }).whenComplete((){
                                                                                                          print("OrderId from AllOrdersScreen : "+orderIdFromAllOrdersScreen.value.toString());
                                                                                                          print("TransactionId from AllOrdersScreen : "+transactionIdFromAllOrdersScreen.value.toString());
                                                                                                          print("Operation : "+moveOperationFromAllOrdersScreen.value.toString());
                                                                                                          setState(() {
                                                                                                            showOrderModeButtons = false;
                                                                                                          });
                                                                                                          if(refreshScreen.value == 'poppedfromorders'){
                                                                                                            setState(() {
                                                                                                              refreshScreen.value = 'true';
                                                                                                              showOrderModeButtons = false;
                                                                                                            });
                                                                                                            Future.delayed(Duration(seconds: 2),(){
                                                                                                              setState(() {
                                                                                                                refreshScreen.value = '';
                                                                                                              });
                                                                                                            });
                                                                                                          }else{

                                                                                                          }
                                                                                                          if(orderIdFromAllOrdersScreen.value.isNotEmpty){
                                                                                                            setState(() {
                                                                                                              orderIdForMoveSingle = orderIdFromAllOrdersScreen.value.toString();
                                                                                                            });
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
                                                                                                              ).whenComplete((){
                                                                                                                if(refreshScreen.value == 'poppedfromorders'){
                                                                                                                  setState(() {
                                                                                                                    refreshScreen.value = 'true';
                                                                                                                    showOrderModeButtons = false;
                                                                                                                  });
                                                                                                                  Future.delayed(Duration(seconds: 2),(){
                                                                                                                    setState(() {
                                                                                                                      refreshScreen.value = '';
                                                                                                                    });
                                                                                                                  });
                                                                                                                }else{

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
                                                                                          }
                                                                                        }
                                                                                      },
                                                                                      child: moveStatus == true &&
                                                                                          !(actionButtonsAccessControl!.contains('MOVE')) ?
                                                                                      Container(
                                                                                        width: 60,
                                                                                        height: 60,
                                                                                        decoration: BoxDecoration(
                                                                                            color: Colors.grey.shade300,
                                                                                            borderRadius: BorderRadius.all(Radius.circular(5))
                                                                                        ),
                                                                                        child: Center(
                                                                                          child: Text("MOVE",
                                                                                            style: TextStyle(
                                                                                              fontFamily: 'RobotoCondensed',
                                                                                              color: ThemesProvider.getColor("primaryColor"),
                                                                                              fontSize: SizeConfig.getFontSize(16),
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ) : Container(
                                                                                        width: 60,
                                                                                        height: 60,
                                                                                        decoration: BoxDecoration(
                                                                                            color: showOrderModeButtons == false || moveStatus == false ? Colors.grey.shade300 :
                                                                                            Colors.black,
                                                                                            borderRadius: BorderRadius.all(Radius.circular(5))
                                                                                        ),
                                                                                        child: Center(
                                                                                          child: Text("MOVE",
                                                                                            style: TextStyle(
                                                                                              fontFamily: 'RobotoCondensed',
                                                                                              color: ThemesProvider.getColor("primaryColor"),
                                                                                              fontSize: SizeConfig.getFontSize(16),
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                              );
                                                                            }
                                                                        );
                                                                      }
                                                                  );
                                                                }
                                                            ),
                                                            const SizedBox(width: 5,),
                                                            ValueListenableBuilder(
                                                                valueListenable: selectedOuterTableCharacter,
                                                                builder: (BuildContext contextPP, String newValue, Widget? child){
                                                                  return ValueListenableBuilder(
                                                                      valueListenable: selectedOuterTableStatus,
                                                                      builder: (BuildContext contextPP, String newValue, Widget? child){
                                                                        return ValueListenableBuilder(
                                                                            valueListenable: selectedOuterTableId,
                                                                            builder: (BuildContext contextPP, String newValue, Widget? child){
                                                                              return ValueListenableBuilder(
                                                                                  valueListenable: selectedOuterTableName,
                                                                                  builder: (BuildContext contextPP, String newValue, Widget? child){
                                                                                    return InkWell(
                                                                                      onTap: (){
                                                                                        print("mergeStatus : "+this.mergeStatus.toString());
                                                                                        print("moveStatus : "+this.moveStatus.toString());
                                                                                        print("detailsStatus : "+this.detailsStatus.toString() +" "+showOrderModeButtons.toString());
                                                                                        if(!(actionButtonsAccessControl!.contains('DETAILS'))){

                                                                                        }else{
                                                                                         if(showOrderModeButtons == true && selectedOuterTableCharacter.value == 'R'){
                                                                                           _showReserveDialog(true);
                                                                                         }else if(showOrderModeButtons == true &&  selectedOuterTableCharacter.value == 'B'){
                                                                                           _showBlockDialog(true);
                                                                                         }else if(showOrderModeButtons == true){
                                                                                           setNotification.value = NotificationMessage(message:  MessagesProvider.get("Operation is not allowed "),
                                                                                               color: AppColors.notificationBGLightYellowColor);
                                                                                           setState((){
                                                                                             selectedOuterTableId.value = '';
                                                                                             pressedRowOuterValue.value = '';
                                                                                             pressedColumnOuterValue.value = '';
                                                                                             showOrderModeButtons = false;
                                                                                           });
                                                                                         }
                                                                                        }
                                                                                      },
                                                                                      child: detailsStatus == true &&
                                                                                          !(actionButtonsAccessControl!.contains('DETAILS')) ?
                                                                                      Container(
                                                                                        width: 60,
                                                                                        height: 60,
                                                                                        decoration: BoxDecoration(
                                                                                            color: Colors.grey.shade300,
                                                                                            borderRadius: BorderRadius.all(Radius.circular(5))
                                                                                        ),
                                                                                        child: Center(
                                                                                          child: Text("DETAILS",
                                                                                            style: TextStyle(
                                                                                              fontFamily: 'RobotoCondensed',
                                                                                              color: ThemesProvider.getColor("primaryColor"),
                                                                                              fontSize: SizeConfig.getFontSize(16),
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ) : Container(
                                                                                        width: 60,
                                                                                        height: 60,
                                                                                        decoration: BoxDecoration(
                                                                                            color: showOrderModeButtons == false || detailsStatus == false ? Colors.grey.shade300 :
                                                                                            Colors.black,
                                                                                            borderRadius: BorderRadius.all(Radius.circular(5))
                                                                                        ),
                                                                                        child: Center(
                                                                                          child: Text("DETAILS",
                                                                                            style: TextStyle(
                                                                                              fontFamily: 'RobotoCondensed',
                                                                                              color: ThemesProvider.getColor("primaryColor"),
                                                                                              fontSize: SizeConfig.getFontSize(16),
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                              );
                                                                            }
                                                                        );
                                                                      }
                                                                  );
                                                                }
                                                            ),
                                                            const SizedBox(width: 5,),
                                                            ValueListenableBuilder(
                                                                valueListenable: selectedOuterTableStatus,
                                                                builder: (BuildContext contextPP, String newValue, Widget? child){
                                                                  return ValueListenableBuilder(
                                                                      valueListenable: selectedOuterTableId,
                                                                      builder: (BuildContext contextPP, String newValue, Widget? child){
                                                                        return ValueListenableBuilder(
                                                                            valueListenable: selectedOuterTableName,
                                                                            builder: (BuildContext contextPP, String newValue, Widget? child){
                                                                              return InkWell(
                                                                                onTap: (){
                                                                                  if(showOrderModeButtons == false && selectedOuterTableId.value != ''){

                                                                                  }else if(showOrderModeButtons == false && selectedOuterTableId.value == ''){

                                                                                  }else if(reserveStatus == false || !(actionButtonsAccessControl!.contains('RESERVE'))){

                                                                                  }else if(showOrderModeButtons == true && selectedOuterTableId.value == ''){
                                                                                    setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Please select a table to perform action "),
                                                                                        color: AppColors.notificationBGRedColor);
                                                                                    setState(() {
                                                                                      showOrderModeButtons == false;
                                                                                    });
                                                                                  }else{
                                                                                    if(_isCurrentUserManager == true && reserveStatusM == false){
                                                                                      if(selectedOuterTableCharacter.value == 'F'){
                                                                                        setState(() {
                                                                                          fromDateReserve.text = '${DateFormat('dd-MMM-yyyy – hh:mm a').format(DateTime.now())}';
                                                                                          toDateReserve.text = '${DateFormat('dd-MMM-yyyy – hh:mm a').format(DateTime.now())}';
                                                                                        });
                                                                                        // print("fromDateReserve.text : "+fromDateReserve.text);
                                                                                        // print("toDateReserve.text : "+toDateReserve.text);
                                                                                        _showReserveDialog(false);
                                                                                      }else{
                                                                                        setNotification.value = NotificationMessage(message:  MessagesProvider.get("Operation is not allowed "),
                                                                                            color: AppColors.notificationBGLightYellowColor);
                                                                                        selectedOuterTableId.value = '';
                                                                                        pressedRowOuterValue.value = '';
                                                                                        pressedColumnOuterValue.value = '';
                                                                                        setState(() {
                                                                                          showOrderModeButtons == false;
                                                                                        });
                                                                                      }
                                                                                    }else{
                                                                                      if(selectedOuterTableCharacter.value == 'F'){
                                                                                        setState(() {
                                                                                          fromDateReserve.text = '${DateFormat('dd-MMM-yyyy – hh:mm a').format(DateTime.now())}';
                                                                                          toDateReserve.text = '${DateFormat('dd-MMM-yyyy – hh:mm a').format(DateTime.now())}';
                                                                                        });
                                                                                        // print("fromDateReserve.text : "+fromDateReserve.text);
                                                                                        // print("toDateReserve.text : "+toDateReserve.text);
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
                                                                                          setState(() {
                                                                                            showOrderModeButtons = false;
                                                                                          });
                                                                                          print("approvedUserPkId ::::: "+approvedUserPkId.toString());
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
                                                                                        setState(() {
                                                                                          showOrderModeButtons == false;
                                                                                        });
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                },
                                                                                child: reserveStatus == true &&
                                                                                    !(actionButtonsAccessControl!.contains('RESERVE')) ?
                                                                                Container(
                                                                                  width: 60,
                                                                                  height: 60,
                                                                                  decoration: BoxDecoration(
                                                                                      color: Colors.grey.shade300,
                                                                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                                                                  ),
                                                                                  child: Center(
                                                                                    child: Text("RESERVE",
                                                                                      style: TextStyle(
                                                                                        fontFamily: 'RobotoCondensed',
                                                                                        color: ThemesProvider.getColor("primaryColor"),
                                                                                        fontSize: SizeConfig.getFontSize(16),
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ) : Container(
                                                                                  width: 60,
                                                                                  height: 60,
                                                                                  decoration: BoxDecoration(
                                                                                      color: showOrderModeButtons == false || reserveStatus == false ? Colors.grey.shade300 :
                                                                                      Colors.black,
                                                                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                                                                  ),
                                                                                  child: Center(
                                                                                    child: Text("RESERVE",
                                                                                      style: TextStyle(
                                                                                        fontFamily: 'RobotoCondensed',
                                                                                        color: ThemesProvider.getColor("primaryColor"),
                                                                                        fontSize: SizeConfig.getFontSize(16),
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                        );
                                                                      }
                                                                  );
                                                                }
                                                            ),
                                                            const SizedBox(width: 5,),
                                                            ValueListenableBuilder(
                                                                valueListenable: selectedOuterTableStatus,
                                                                builder: (BuildContext contextPP, String newValue, Widget? child){
                                                                  var selectedReason = '';
                                                                  List<String> _locations = ['Management Block', 'Others',
                                                                    'Blocked for Short of Staff for Service',
                                                                    'Maintenance Block', 'Blocked for Private Party'];
                                                                  return ValueListenableBuilder(
                                                                      valueListenable: selectedOuterTableId,
                                                                      builder: (BuildContext contextPP, String newValue, Widget? child){
                                                                        var selectedReason = '';
                                                                        List<String> _locations = ['Management Block', 'Others',
                                                                          'Blocked for Short of Staff for Service',
                                                                          'Maintenance Block', 'Blocked for Private Party'];
                                                                        return ValueListenableBuilder(
                                                                            valueListenable: selectedOuterTableName,
                                                                            builder: (BuildContext contextPP, String newValue, Widget? child){
                                                                              var selectedReason = '';
                                                                              List<String> _locations = ['Management Block', 'Others',
                                                                                'Blocked for Short of Staff for Service',
                                                                                'Maintenance Block', 'Blocked for Private Party']; // Option 2
                                                                              return InkWell(
                                                                                onTap: (){
                                                                                  if(showOrderModeButtons == false && selectedOuterTableId.value != ''){

                                                                                  }else if(showOrderModeButtons == false && selectedOuterTableId.value == ''){

                                                                                  }else if(blockStatus == false || !(actionButtonsAccessControl!.contains('BLOCK'))){

                                                                                  }else if(showOrderModeButtons == true && selectedOuterTableId.value == ''){
                                                                                    setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Please select a table to perform action "),
                                                                                        color: AppColors.notificationBGRedColor);
                                                                                    setState(() {
                                                                                      showOrderModeButtons == false;
                                                                                    });
                                                                                  }else{
                                                                                    if(_isCurrentUserManager == true && blockStatusM == false){
                                                                                      if(selectedOuterTableCharacter.value == 'F'){
                                                                                        _showBlockDialog(false);
                                                                                      }else{
                                                                                        setNotification.value = NotificationMessage(message:  MessagesProvider.get("Operation is not allowed "),
                                                                                            color: AppColors.notificationBGLightYellowColor);
                                                                                        selectedOuterTableId.value = '';
                                                                                        pressedRowOuterValue.value = '';
                                                                                        pressedColumnOuterValue.value = '';
                                                                                        setState(() {
                                                                                          showOrderModeButtons == false;
                                                                                        });
                                                                                      }
                                                                                    }else{
                                                                                      if(selectedOuterTableCharacter.value == 'F'){
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
                                                                                          setState(() {
                                                                                            showOrderModeButtons = false;
                                                                                          });
                                                                                          if(approvedUserPkId != 0){
                                                                                            _showBlockDialog(false);
                                                                                          }
                                                                                          print("approvedUserPkId ::::: "+approvedUserPkId.toString());
                                                                                        });
                                                                                      }else{
                                                                                        setNotification.value = NotificationMessage(message:  MessagesProvider.get("Operation is not allowed "),
                                                                                            color: AppColors.notificationBGLightYellowColor);
                                                                                        selectedOuterTableId.value = '';
                                                                                        pressedRowOuterValue.value = '';
                                                                                        pressedColumnOuterValue.value = '';
                                                                                        setState(() {
                                                                                          showOrderModeButtons == false;
                                                                                        });
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                },
                                                                                child: blockStatus == true &&
                                                                                    !(actionButtonsAccessControl!.contains('BLOCK')) ?
                                                                                Container(
                                                                                  width: 60,
                                                                                  height: 60,
                                                                                  decoration: BoxDecoration(
                                                                                      color: Colors.grey.shade300,
                                                                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                                                                  ),
                                                                                  child: Center(
                                                                                    child: Text("BLOCK",
                                                                                      style: TextStyle(
                                                                                        fontFamily: 'RobotoCondensed',
                                                                                        color: ThemesProvider.getColor("primaryColor"),
                                                                                        fontSize: SizeConfig.getFontSize(16),
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ) : Container(
                                                                                  width: 60,
                                                                                  height: 60,
                                                                                  decoration: BoxDecoration(
                                                                                      color: showOrderModeButtons == false || blockStatus == false ? Colors.grey.shade300 :
                                                                                      Colors.black,
                                                                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                                                                  ),
                                                                                  child: Center(
                                                                                    child: Text("BLOCK",
                                                                                      style: TextStyle(
                                                                                        fontFamily: 'RobotoCondensed',
                                                                                        color: ThemesProvider.getColor("primaryColor"),
                                                                                        fontSize: SizeConfig.getFontSize(16),
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                        );// Option 2
                                                                      }
                                                                  );// Option 2
                                                                }
                                                            ),
                                                            const SizedBox(width: 5,),
                                                            ValueListenableBuilder(
                                                                valueListenable: selectedOuterTableId,
                                                                builder: (BuildContext contextPP, String newValue, Widget? child){
                                                                  return InkWell(
                                                                    onTap: (){
                                                                      /*categoryL.clear();
                                                                      getBottomActionButtonStatuses();
                                                                      print("clearStatus : "+clearStatus.toString());
                                                                      print(approvalL);
                                                                      print(categoryL);*/
                                                                      if(showOrderModeButtons == false && selectedOuterTableId.value != ''){

                                                                      }else if(showOrderModeButtons == false && selectedOuterTableId.value == ''){

                                                                      }else if(clearStatus == false || !(actionButtonsAccessControl!.contains('CLEAR'))){

                                                                      }else if(showOrderModeButtons == true && selectedOuterTableId.value == ''){
                                                                        setNotification.value = NotificationMessage(message:  MessagesProvider.get(" Please select a table to perform action "),
                                                                            color: AppColors.notificationBGRedColor);
                                                                        setState(() {
                                                                          showOrderModeButtons == false;
                                                                        });
                                                                      }else{
                                                                        if(_isCurrentUserManager == true && clearStatusM == false){
                                                                          if(selectedOuterTableCharacter.value == 'B' || selectedOuterTableCharacter.value == 'R'){
                                                                            print("enetred here...");
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
                                                                                                                if(selectedFacilityName.value == 'Restaurant Seating New'){
                                                                                                                  setNotification.value = NotificationMessage(message: "Please wait...",
                                                                                                                      color: AppColors.notificationBGLightYellowColor);
                                                                                                                  Future.delayed(Duration(seconds: 1),(){
                                                                                                                    setNotification.value = NotificationMessage(message: "View All Tables",
                                                                                                                        color: theme.footerBG4);
                                                                                                                    setState((){
                                                                                                                      selectedOuterTableId.value = '';
                                                                                                                      pressedRowOuterValue.value = '';
                                                                                                                      pressedColumnOuterValue.value = '';
                                                                                                                      showOrderModeButtons = false;
                                                                                                                    });
                                                                                                                    Navigator.of(context).pop();
                                                                                                                  });
                                                                                                                }else{
                                                                                                                  setState((){
                                                                                                                    selectedOuterTableId.value = '';
                                                                                                                    pressedRowOuterValue.value = '';
                                                                                                                    pressedColumnOuterValue.value = '';
                                                                                                                    showOrderModeButtons = false;
                                                                                                                  });
                                                                                                                  Navigator.of(context).pop();
                                                                                                                }
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
                                                                          }else{
                                                                            print("enetred thereee...");
                                                                            setNotification.value = NotificationMessage(message:  MessagesProvider.get("Operation is not allowed "),
                                                                                color: AppColors.notificationBGLightYellowColor);
                                                                            setState((){
                                                                              selectedOuterTableId.value = '';
                                                                              pressedRowOuterValue.value = '';
                                                                              pressedColumnOuterValue.value = '';
                                                                              showOrderModeButtons = false;
                                                                            });
                                                                          }
                                                                        }else{
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
                                                                          }).whenComplete((){
                                                                            setState(() {
                                                                              showOrderModeButtons = false;
                                                                            });
                                                                            print("approvedUserPkId ::::: "+approvedUserPkId.toString());
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
                                                                    },
                                                                    child:
                                                                    clearStatus == true &&
                                                                        !(actionButtonsAccessControl!.contains('CLEAR')) ?
                                                                    Container(
                                                                      width: 60,
                                                                      height: 60,
                                                                      decoration: BoxDecoration(
                                                                          color: Colors.grey.shade300,
                                                                          borderRadius: BorderRadius.all(Radius.circular(5))
                                                                      ),
                                                                      child: Center(
                                                                        child: Text("CLEAR",
                                                                          style: TextStyle(
                                                                            fontFamily: 'RobotoCondensed',
                                                                            color: ThemesProvider.getColor("primaryColor"),
                                                                            fontSize: SizeConfig.getFontSize(16),
                                                                            fontWeight: FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ) :
                                                                    Container(
                                                                      width: 60,
                                                                      height: 60,
                                                                      decoration: BoxDecoration(
                                                                          color: showOrderModeButtons == false || clearStatus == false ? Colors.grey.shade300 :
                                                                          Colors.black,
                                                                          borderRadius: BorderRadius.all(Radius.circular(5))
                                                                      ),
                                                                      child: Center(
                                                                        child: Text("CLEAR",
                                                                          style: TextStyle(
                                                                            fontFamily: 'RobotoCondensed',
                                                                            color: ThemesProvider.getColor("primaryColor"),
                                                                            fontSize: SizeConfig.getFontSize(16),
                                                                            fontWeight: FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                            ),
                                                            const SizedBox(width: 5,),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  ValueListenableBuilder(
                                                      valueListenable: scrollOffsetBottom,
                                                      builder: (BuildContext contextPP, String newValue, Widget? child){
                                                        return ValueListenableBuilder(
                                                            valueListenable: scrollTopMinMax,
                                                            builder: (BuildContext contextPP, String newValue, Widget? child){
                                                              return InkWell(
                                                                onTap: (){
                                                                  if(showOrderModeButtons == false){

                                                                  }else{
                                                                    scrollTopMinMax.value = 'max';
                                                                    _controllerBottomBar.animateTo(
                                                                      _controller.position.maxScrollExtent,
                                                                      duration: Duration(seconds: 2),
                                                                      curve: Curves.fastOutSlowIn,
                                                                    );
                                                                  }
                                                                },
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
                                                              );
                                                            }
                                                        );
                                                      }
                                                  ),
                                                  showOrderModeButtons == false ? Container() : const SizedBox(width: 5,),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ) : Container();
                                      }
                                  ),
                                  Container(width: double.infinity,height: 1,color: theme.dividerColor,),
                                ],
                              );
                            }
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              );
            }
        ),
      ),
    );
  }

  _showReserveDialog(bool detailStatus) {

    String Status = detailStatus ? 'DETAILS' : 'RESERVE';
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    setNotification.value = NotificationMessage(
        message: MessagesProvider.get('Performing table action &1 ',[Status]),
        color: theme.footerBG4);
    FacilityTableCurrentStatusDTO details;
    //var tableStatus = _facilityTableCurrentStatusDTO?.where((element) => element.tableId.toString() == selectedOuterTableId.value);
    if(Status == "DETAILS"){
      setState(() {
        customerNameReserve.clear();
        contactReserve.clear();
        occasionReserve.clear();
        additionalCommentsReserve.clear();
      });
      facilityTableCurrentStatusDTO?.forEach((element) {
        print("selected table status ${element.tableId} ${selectedOuterTableId.value}");
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
    }else{
      setState((){
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
      });
    }

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
                                  /*Expanded(
                                    flex: 10,
                                    child: Row(
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
                                                      borderRadius: BorderRadius.circular(10.0),
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
                                                      borderRadius: BorderRadius.circular(10.0),
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
                                  ),
                                  Expanded(
                                    flex: 10,
                                    child: Row(
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
                                              SizedBox(height: MediaQuery.of(context).size.height/50,),
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
                                          child: Stack(
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("* Reserve From Date",
                                                textAlign: TextAlign.center,
                                                style: theme.subtitle2,
                                              ),
                                              CustomerDatePickerReserve("",  "", fromDateReserve),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 30,),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 10,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(width: 30,),
                                        Expanded(
                                          //width: 200,
                                          child: Stack(
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 5,),
                                              Text("* Reserve To Date",
                                                textAlign: TextAlign.center,
                                                style: theme.subtitle2,
                                              ),
                                              CustomerDatePickerReserveTo("",  "", toDateReserve),
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
                                              SizedBox(height: MediaQuery.of(context).size.height/50,),
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
                                  ),*/
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
                                          print(pickedDateTo);
                                          print(pickedDateFrom);
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
                                          if(Status == "DETAILS"){
                                            setState((){
                                              selectedOuterTableId.value = '';
                                              pressedRowOuterValue.value = '';
                                              pressedColumnOuterValue.value = '';
                                            });
                                            setNotification.value = NotificationMessage(message:'', color: theme.footerBG4);
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
                                                // print("I'm coming here!!!");
                                                if (_isDateGreater(toDateReserve.text,
                                                    fromDateReserve.text)) {
                                                  //print("Hello 1111");
                                                  Navigator.of(context).pop();
                                                  reserveTable();
                                                } else {
                                                  //print("Hello 2222");
                                                  WidgetsBinding.instance
                                                      .addPostFrameCallback((_) {
                                                    setNotification.value = NotificationMessage(
                                                        message: MessagesProvider.get("To Date should be greater than From Date"),
                                                        color: theme.footerBG5);
                                                  });
                                                }
                                                /*if(pickedDateFrom == null){
                                                  setNotification.value = NotificationMessage(message: 'To date should be greater than from date',
                                                      color: AppColors.notificationBGLightYellowColor);
                                                }else{
                                                  if (_isDateGreater(toDateReserve.text,
                                                      fromDateReserve.text)) {
                                                    print("Hello 1111");
                                                    // Navigator.of(context).pop();
                                                    // reserveTable();
                                                  } else {
                                                    print("Hello 2222");
                                                    // WidgetsBinding.instance
                                                    //     .addPostFrameCallback((_) {
                                                    //   setNotification.value = NotificationMessage(
                                                    //       message: MessagesProvider.get("To Date should be greater than From Date"),
                                                    //       color: theme.footerBG5);
                                                    // });
                                                  }
                                                  // if(DateTime.parse(pickedDateFrom.toString().toString().replaceAll("T", " ")).isBefore(
                                                  //     DateTime.parse(pickedDateTo.toString().toString().replaceAll("T", " "))
                                                  // )){
                                                  //   Navigator.of(context).pop();
                                                  //   reserveTable();
                                                  // }else{
                                                  //   print("I'm coming here!!! 2222");
                                                  //   setNotification.value = NotificationMessage(message: 'To date should be greater than from date',
                                                  //       color: AppColors.notificationBGLightYellowColor);
                                                  // }
                                                }*/
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
  }

  bool _isDateGreater(String date1, String date2) {
    DateTime dt1 = DateFormat(_dateFormat).parse(date1); //from
    DateTime dt2 = DateFormat(_dateFormat).parse(date2);
    return dt1.compareTo(dt2) > 0 ? true : false;
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
    // _fromDate = formattedDate1;
    // _toDate = formattedDate2;

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

  _showTransactionOrderDetail(){
    showDialog(
      context: context,
      builder: (BuildContext contextN) {
        return ValueListenableBuilder(
            valueListenable: selectedOuterTableId,
            builder: (BuildContext contextPP, String newValue, Widget? child){
              return StatefulBuilder(
                builder: (context, setState) {
                  print(selectedOuterTableId.value.toString()+"//////////");
                  return TransactionOrderDetailsDialog(
                    isUpdate: false,
                    tableId: int.parse(selectedOuterTableId.value.toString()),
                    showNotification: (String value, Color color) {},
                    onComplete: () {
                      _occupyTable();
                    },
                      onCancel:(){
                        // tableSeatCubit.unSelectTable();
                      }
                  );
                },
              );
            }
        );
      },
    );
  }

  _occupyTable() async{
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final orderSearchBL = await OrdersDataBuilder.build(executionContextDTO!);

    int tableId = int.parse(selectedOuterTableId.value);
    try{
      var response = await orderSearchBL.occupyTable(tableId: tableId ?? -1,
          facilityTable: FacilityTable(Reason: "Reason", AdditionalComments: "additionalComments",
              ApprovalDTO: ApproveDTO(ApproverId :  executionContextDTO.userPKId ?? -1 ,Remarks :"Remarks")));

      Log.v("response $response");
      if(response.exception == null) {
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => SalesScreen(
              fromTables: true,
              onClose: (){
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  setState(() {
                    refreshScreen.value = 'true';
                  });
                  Future.delayed(Duration(seconds: 2),(){
                    refreshScreen.value = '';
                  });
                });
              },
            )));
        // Navigator.pop(context);
      }
    }on DioError catch(error) {
      var errorString = error.response?.data['data'] as String?;
      Future.microtask(() => showErrorDialog(context, 'Error', errorString ?? ''));
    }
  }

  _getCurrentStatuses() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!); //not required
    final orderDataBL = await OrdersDataBuilder.build(execContext);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    facilityTableCurrentStatusDTO = await orderDataBL.getFacilityTableCurrentStatuses();
    Log.v("FacilityTableCurrentStatusDTO count ${facilityTableCurrentStatusDTO?.length}");
  }

}

class CustomerDatePickerReserve extends StatefulWidget{
  String title;
  String hint;
  TextEditingController controller ;

  CustomerDatePickerReserve(this.title, this.hint,this.controller);

  @override
  State<CustomerDatePickerReserve> createState() => _CustomerDatePickerReserveState();
}

class _CustomerDatePickerReserveState extends State<CustomerDatePickerReserve> {
  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: theme.heading5,),
        const SizedBox(height: 4.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: TextFormField(
                controller: widget.controller,
                textAlign: TextAlign.start,
                readOnly: true,
                style: theme.subtitle3?.copyWith(fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.black, width: 0.6),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.black, width: 0.6),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.black, width: 0.6),
                    ),
                    hintText: widget.hint,
                    hintStyle: theme.subtitle3?.copyWith(fontWeight: FontWeight.w500),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Image.asset('assets/ic_date.png', color: theme.secondaryColor),
                    ),
                    suffixIconConstraints: const BoxConstraints()
                ),
                onTap: () async {

                  widget.controller.clear();

                  var birthDate = widget.controller.text;
                  DateTime? selectedDate;
                  String hour, minute, time;
                  TextEditingController timeController = TextEditingController();
                  TimeOfDay? selectedTime = TimeOfDay.now();// = TimeOfDay(hour: 00, minute: 00);
                  if(birthDate != '') {
                    DateFormat dateFormat = DateFormat('dd-MM-yyyy');
                    selectedDate = dateFormat.parse(birthDate);
                  }
                  DateTime? pickedDate = await showDatePicker(context: context,
                      builder: (BuildContext context, Widget? child) {
                        return Theme(data: ThemeData?.light().copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: Colors.black,
                              onPrimary: Colors.white,
                              surface: Colors.white,
                              onSurface: Colors.black,
                            )
                        ),
                            child: child!);
                      },
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2033)).whenComplete(() async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (picked != null) {
                      setState(() {
                        selectedTime = picked;
                        hour = selectedTime!.hour.toString();
                        minute = selectedTime!.minute.toString();

                        if(int.parse(hour) > 9){
                          timeController.text =
                              int.parse(selectedTime!.hour.toString()).toString()+":"+
                                  int.parse(selectedTime!.minute.toString()).toString();
                          time = "0"+(int.parse(hour)-12).toString() + ":" + minute + " PM";
                        }else{
                          timeController.text =
                              "0"+int.parse(selectedTime!.hour.toString()).toString()+":"+
                                  int.parse(selectedTime!.minute.toString()).toString();
                          time = "0"+hour + ':' + minute + " AM";
                        }

                      });
                    }
                  });

                  if(pickedDate != null){
                    setState(() {
                      pickedDateFrom = pickedDate.toString().substring(0,10)+"T"+timeController.text.toString()+":00";
                    });
                    String formattedDate = DateFormat('dd-MMM-yyyy').format(pickedDate);
                    setState(() {
                      if(int.parse(selectedTime!.hour.toString()) > 12){
                        widget.controller.text = formattedDate + " - " +
                            "0"+(int.parse(selectedTime!.hour.toString())-12).toString()+":"+
                            int.parse(selectedTime!.minute.toString()).toString() + " PM";
                        //time = "0"+(int.parse(hour)-12).toString() + ":" + minute + " PM";
                      }else{
                        widget.controller.text = formattedDate + " - " +
                            int.parse(selectedTime!.hour.toString()).toString()+":"+
                            int.parse(selectedTime!.minute.toString()).toString() + " AM";
                      }
                      //set output date to TextField value.
                    });
                  }
                },),
            ),
          ],
        ),
        const SizedBox(height: 8.0,),
      ],
    );
  }
}

class CustomerDatePickerReserveTo extends StatefulWidget{
  String title;
  String hint;
  TextEditingController controller ;

  CustomerDatePickerReserveTo(this.title, this.hint,this.controller);

  @override
  State<CustomerDatePickerReserveTo> createState() => _CustomerDatePickerReserveToState();
}

class _CustomerDatePickerReserveToState extends State<CustomerDatePickerReserveTo> {
  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: theme.heading5,),
        const SizedBox(height: 4.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: TextFormField(
                controller: widget.controller,
                textAlign: TextAlign.start,
                readOnly: true,
                style: theme.subtitle3?.copyWith(fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.black, width: 0.6),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.black, width: 0.6),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.black, width: 0.6),
                    ),
                    hintText: widget.hint,
                    hintStyle: theme.subtitle3?.copyWith(fontWeight: FontWeight.w500),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Image.asset('assets/ic_date.png', color: theme.secondaryColor),
                    ),
                    suffixIconConstraints: const BoxConstraints()
                ),
                onTap: () async {

                  widget.controller.clear();

                  var birthDate = widget.controller.text;
                  DateTime? selectedDate;
                  String hour, minute, time;
                  TextEditingController timeController = TextEditingController();
                  TimeOfDay? selectedTime = TimeOfDay.now();// = TimeOfDay(hour: 00, minute: 00);
                  if(birthDate != '') {
                    DateFormat dateFormat = DateFormat('dd-MM-yyyy');
                    selectedDate = dateFormat.parse(birthDate);
                  }
                  DateTime? pickedDate = await showDatePicker(context: context,
                      builder: (BuildContext context, Widget? child) {
                        return Theme(data: ThemeData?.light().copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: Colors.black,
                              onPrimary: Colors.white,
                              surface: Colors.white,
                              onSurface: Colors.black,
                            )
                        ),
                            child: child!);
                      },
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2033)).whenComplete(() async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (picked != null) {
                      setState(() {
                        selectedTime = picked;
                        hour = selectedTime!.hour.toString();
                        minute = selectedTime!.minute.toString();

                        if(int.parse(hour) > 9){
                          timeController.text =
                              int.parse(selectedTime!.hour.toString()).toString()+":"+
                                  int.parse(selectedTime!.minute.toString()).toString();
                          time = "0"+(int.parse(hour)-12).toString() + ":" + minute + " PM";
                        }else{
                          timeController.text =
                              "0"+int.parse(selectedTime!.hour.toString()).toString()+":"+
                                  int.parse(selectedTime!.minute.toString()).toString();
                          time = "0"+hour + ':' + minute + " AM";
                        }

                      });
                    }
                  });

                  if(pickedDate != null){
                    setState(() {
                      pickedDateTo = pickedDate.toString().substring(0,10)+"T"+timeController.text.toString()+":00";
                    });
                    String formattedDate = DateFormat('dd-MMM-yyyy').format(pickedDate);
                    setState(() {
                      if(int.parse(selectedTime!.hour.toString()) > 12){
                        widget.controller.text = formattedDate + " - " +
                            "0"+(int.parse(selectedTime!.hour.toString())-12).toString()+":"+
                            int.parse(selectedTime!.minute.toString()).toString() + " PM";
                        //time = "0"+(int.parse(hour)-12).toString() + ":" + minute + " PM";
                      }else{
                        widget.controller.text = formattedDate + " - " +
                            int.parse(selectedTime!.hour.toString()).toString()+":"+
                            int.parse(selectedTime!.minute.toString()).toString() + " AM";
                      }
                      //set output date to TextField value.
                    });
                  }
                },),
            ),
          ],
        ),
        const SizedBox(height: 8.0,),
      ],
    );
  }
}

class TransactionOrderDetailsDialog extends StatelessWidget {
  const TransactionOrderDetailsDialog(
      {Key? key,
        this.approverID,
        required this.isUpdate,
        required this.showNotification,
        required this.onComplete,
        required this.onCancel,
        this.tableId,
        this.transactionCubit})
      : super(key: key);
  final bool isUpdate;
  final Function(String value, Color color) showNotification;
  final Function() onComplete;
  final Function() onCancel;
  final TransactionCubit? transactionCubit;
  final int? tableId;
  final int?approverID;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TransactionOrderDetailsCubit>(
              create: (BuildContext context) => TransactionOrderDetailsCubit()),
        ],
        child: TransactionDetailsDialog(
            approverID:approverID,
            showNotification: showNotification,
            transactionCubit: transactionCubit,
            onComplete: onComplete,
            onCancel: onCancel,
            isUpdate: isUpdate,
            tableId:tableId));
  }
}

class TransactionDetailsDialog extends StatefulWidget {
  const TransactionDetailsDialog(
      {Key? key,
        this.approverID,
        required this.isUpdate,
        required this.showNotification,
        required this.onComplete,
        required this.onCancel,
        this.tableId,
        this.transactionCubit})
      : super(key: key);
  final bool isUpdate;
  final Function(String value, Color color) showNotification;
  final Function() onComplete;
  final Function() onCancel;
  final TransactionCubit? transactionCubit;
  final int? tableId;
  final int?approverID;

  @override
  State<TransactionDetailsDialog> createState() =>
      _TransactionDetailsDialogState();
}

class _TransactionDetailsDialogState extends State<TransactionDetailsDialog> {
  final TextEditingController _guestNameTextController = TextEditingController();
  final TextEditingController _guestContactTextController = TextEditingController();
  final TextEditingController _orderIdentifierTextController = TextEditingController();
  final TextEditingController _guestCountTextController = TextEditingController();
  final _scrollController = ScrollController();
  Size? _screenSize;
  double _screenHeight = 0.0;
  double _screenWidth = 0.0;
  NotificationBar? _notificationBar;
  late SemnoxTheme _theme;
  late InputDecoration _textInputDecoration ;


  @override
  void initState() {
    _guestCountTextController.text = "1";
    _notificationBar = NotificationBar(showHideSideBar: false);
    initTextFields();
    super.initState();
  }

  _initInputDecoration(){
    _textInputDecoration = InputDecoration(
      fillColor: _theme.primaryColor,
      filled: true,
      // constraints:const BoxConstraints(maxHeight:34, ),
      hintText: MessagesProvider.get("Enter"),
      hintStyle: _theme.textFieldHintStyle!.copyWith(fontSize:SizeConfig.getFontSize(16)),
      contentPadding:  EdgeInsets.only(top: SizeConfig.getSize(5), bottom: SizeConfig.getSize(5), right: SizeConfig.getSize(5), left: SizeConfig.getSize(10)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
          borderSide:  BorderSide(
            width: SizeConfig.getSize(1),
            color: _theme.secondaryColor!,
          )),
      border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
          borderSide:  BorderSide(
            width: SizeConfig.getSize(1),
            color: _theme.secondaryColor!,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    _screenSize = MediaQuery.of(context).size;
    _screenHeight = _screenSize!.height;
    _screenWidth = _screenSize!.width;
    SizeConfig.init(context);
    _initInputDecoration();
    return Material(
      color:_theme.transparentColor,
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor:_theme.transparentColor,
            bottomNavigationBar: Container(
              child: _notificationBar,
            ),
            body: Padding(
              padding:  EdgeInsets.all(SizeConfig.getSize(10)),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: _theme.backGroundColor,
                        borderRadius:  BorderRadius.only(
                            topLeft:Radius.circular( SizeConfig.getSize(8)),
                            topRight: Radius.circular( SizeConfig.getSize(8)),
                        )
                    ),
                    padding: EdgeInsets.only(top:SizeConfig.getSize(10)),
                    child: Column(
                      children: [
                        Text(
                          MessagesProvider.get('Order Details').toUpperCase(),
                          style:_theme.headingLight4!.copyWith(color:_theme.secondaryColor,fontSize: SizeConfig.getFontSize(22)),
                        ),
                        Divider(
                          color: _theme.dividerColor,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Scroller(
                      controller: _scrollController,
                      child: CustomScrollView(
                        controller: _scrollController,
                        //Instead of ListView or SingleChildScrollView put CustomScrollVIew to use Expanded or spacer
                        slivers: [
                          SliverFillRemaining(
                            hasScrollBody: false,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    color: _theme.backGroundColor,
                                    child: Padding(
                                      padding:  EdgeInsets.only( right: SizeConfig.getSize(12)),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.all(SizeConfig.getSize(16)),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: _screenWidth,
                                                  child: IntrinsicHeight(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [
                                                        Expanded(
                                                          child: SizedBox(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  MessagesProvider.get('Guest Name'),
                                                                  style: _theme.heading5!.copyWith(fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.normal),
                                                                ),
                                                                SizedBox(height: SizeConfig.getSize(10),),
                                                                SizedBox(
                                                                  height:SizeConfig.getSize(42),
                                                                  child: TextFormField(
                                                                      inputFormatters: [
                                                                        LengthLimitingTextInputFormatter(51)
                                                                      ],
                                                                      controller: _guestNameTextController,
                                                                      style: _theme.subtitle2!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                                      decoration: _textInputDecoration
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: SizeConfig.getSize(10),),
                                                        Expanded(
                                                          child: SizedBox(
                                                            // width: _screenWidth * .43,
                                                            child: Column(
                                                              crossAxisAlignment:CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  MessagesProvider.get('Guest Contact'),
                                                                  style: _theme.heading5!.copyWith(fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.normal),
                                                                ),
                                                                SizedBox(height: SizeConfig.getSize(10),),
                                                                SizedBox(
                                                                  height:SizeConfig.getSize(42),
                                                                  child: TextFormField(
                                                                      inputFormatters: [
                                                                        LengthLimitingTextInputFormatter( 14)
                                                                      ],
                                                                      keyboardType: TextInputType.phone,
                                                                      controller: _guestContactTextController,
                                                                      style: _theme.subtitle2!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                                      decoration: _textInputDecoration
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height:  SizeConfig.getSize(12),),
                                                SizedBox(
                                                  width: _screenWidth,
                                                  child: IntrinsicHeight(
                                                      child:Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: [
                                                          Expanded(
                                                            child: SizedBox(
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(MessagesProvider.get('Order Identifier'),
                                                                    style: _theme.heading5!.copyWith(fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.normal),
                                                                  ),
                                                                  SizedBox(height:  SizeConfig.getSize(10),),
                                                                  SizedBox(
                                                                    height:SizeConfig.getSize(42),
                                                                    child: TextFormField(
                                                                        inputFormatters: [
                                                                          LengthLimitingTextInputFormatter(11)
                                                                        ],
                                                                        controller: _orderIdentifierTextController,
                                                                        style: _theme.subtitle2!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                                        decoration:_textInputDecoration
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width:  SizeConfig.getSize(10),),
                                                          Expanded(
                                                            child: SizedBox(
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(MessagesProvider.get('* Guest Count'),
                                                                    style: _theme.heading5!.copyWith(fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w400),
                                                                  ),
                                                                  SizedBox(height:  SizeConfig.getSize(10),),
                                                                  SizedBox(
                                                                    child: SizedBox(
                                                                      height:SizeConfig.getSize(42),
                                                                      child: TextFormField(
                                                                          inputFormatters: [
                                                                            FilteringTextInputFormatter.digitsOnly,
                                                                            LengthLimitingTextInputFormatter(7)
                                                                          ],
                                                                          readOnly:true,
                                                                          onTap:(){
                                                                            showDialog(
                                                                                barrierDismissible: true,
                                                                                context: context,
                                                                                barrierColor: _theme.transparentColor,
                                                                                builder: (BuildContext context) {
                                                                                  return NumberPad(
                                                                                    initialOffset: Offset(_screenWidth/1.6,_screenHeight/5),
                                                                                    title: '',
                                                                                    onOkPressed: (intValue) {
                                                                                      setState(() {
                                                                                        _guestCountTextController.text = intValue.toString();
                                                                                      });
                                                                                    },
                                                                                  );
                                                                                });
                                                                          },
                                                                          controller: _guestCountTextController,
                                                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                          style: _theme.subtitle2!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                                          decoration: _textInputDecoration
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(height:  SizeConfig.getSize(20),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  color: _theme.dialogFooterInnerShadow,
                                ),
                                Container(
                                  decoration:  BoxDecoration(
                                    color:_theme.backGroundColor,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular( SizeConfig.getSize(8)),
                                        bottomRight: Radius.circular( SizeConfig.getSize(8))),
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.all( SizeConfig.getSize(8)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SecondaryMediumButton(onPressed: () {
                                          if(widget.isUpdate == false) {
                                            widget.showNotification(
                                                MessagesProvider.get("Order details requires to create transaction."),
                                                _theme.footerBG5!);
                                          }
                                          widget.onCancel();
                                          Navigator.pop(context);
                                          setState((){
                                            selectedOuterTableId.value = '';
                                            pressedRowOuterValue.value = '';
                                            pressedColumnOuterValue.value = '';
                                          });
                                        },text:MessagesProvider.get('Cancel').toUpperCase(),),
                                        const SizedBox(width: 8,),
                                        PrimaryMediumButton(onPressed: () async {
                                          if(FocusScope.of(context).hasFocus) {
                                            FocusScope.of(context).unfocus();
                                          }
                                          if (_checkValidation()) {
                                            loader.showLoaderDialog(context, MessagesProvider.get(widget.isUpdate
                                                ? "Updating transaction order details..."
                                                : "Initiating Transaction..."));
                                            final transactionOrderState = context.read<TransactionOrderDetailsCubit>();
                                            if(widget.isUpdate) {
                                              await transactionOrderState.updateTransactionOrderDetails(
                                                  approverID:widget.approverID,
                                                  guestCount: int.parse(_guestCountTextController.text) ?? 1,
                                                  guestContact: _guestContactTextController.text ?? '',
                                                  guestName: _guestNameTextController.text ?? '',
                                                  transactionIdentifier: _orderIdentifierTextController.text ?? '');
                                            } else {
                                              final TransactionCubit transactionCubit = context.read<TransactionCubit>();
                                              if(transactionCubit.state.transactionData != null) {
                                                await transactionCubit.unlockTransaction();
                                              }
                                              await transactionOrderState.initiateTransaction(
                                                  approverID:widget.approverID,
                                                  guestCount: int.parse(_guestCountTextController.text) ?? 1,
                                                  guestContact: _guestContactTextController.text ?? '',
                                                  guestName: _guestNameTextController.text ?? '',
                                                  transactionIdentifier: _orderIdentifierTextController.text ?? '',
                                                  tableId: widget.tableId ??-1
                                              );
                                            }
                                            if (transactionOrderState.state.isSuccess) {
                                              await Future.microtask(()  {
                                                Navigator.pop(context);
                                                print('poped 1');
                                                Navigator.pop(context);
                                                print('poped 2');
                                              });
                                              widget.showNotification(MessagesProvider.get(widget.isUpdate
                                                  ? "Updated the transaction details successfully."
                                                  : "Created transaction successfully."),
                                                  _theme.footerBG4!);
                                              print('start');
                                              widget.onComplete();
                                              print('end');
                                              if(widget.isUpdate) {
                                                context.read<TransactionCubit>().onTransactionDataUpdated(transactionOrderState.state.transactionResponse!.data);
                                              } else {
                                                context.read<TransactionCubit>().onNewTransactionInitiated(transactionOrderState.state.transactionResponse!.data);
                                              }
                                            }
                                            if (transactionOrderState.state.isError) {
                                              loader.hideLoaderDialog(context);
                                            }
                                          }
                                        }, text: MessagesProvider.get('OK').toUpperCase(),)
                                      ],
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
                ],
              ),
            ),
          ),
          BlocConsumer<TransactionOrderDetailsCubit, TransactionOrderDetailsState>(
              builder: (context,state){
                return const SizedBox();
              },
              listener: (context, transactionOrderDetailsState) {
                if (transactionOrderDetailsState.isError) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _notificationBar?.showMessage(
                        transactionOrderDetailsState.statusMessage.toString(),
                        _theme.footerBG3!);
                    _resetLoaderAndMessage();
                  });
                } else if (transactionOrderDetailsState.isSuccess) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _notificationBar?.showMessage(
                        transactionOrderDetailsState.statusMessage.toString(),
                        _theme.footerBG4!);
                    _resetLoaderAndMessage();
                  });
                }

              }),
        ],
      ),
    );
  }

  bool _checkValidation(){
    String phoneNumberPatter = r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$';
    RegExp regExpPhone = RegExp(phoneNumberPatter);
    if (_guestNameTextController.text.length > 50) {
      _showErrorDialog(MessagesProvider.get("Guest name must be 50 characters"));
      return false;
    } else if ((_guestNameTextController.text.trim() != '') && !AppConstants.alphanumericRegExpWithSpecialChar.hasMatch(_guestNameTextController.text ?? '')) {
      _showErrorDialog(MessagesProvider.get("Guest name should not contain any special characters"));
      return false;
    } else if ((_guestContactTextController.text.trim() != '')  && !regExpPhone.hasMatch(_guestContactTextController.text)) {
      _showErrorDialog(MessagesProvider.get("Please Enter The valid Phone Number"));
      return false;
    } else if (_orderIdentifierTextController.text.length > 10) {
      _showErrorDialog(MessagesProvider.get("Order identifier must be 10 characters"));
      return false;
    } else if ( (_orderIdentifierTextController.text.trim() != '') &&!AppConstants.alphanumericRegExpWithSpecialChar.hasMatch(_orderIdentifierTextController.text ?? '')) {
      _showErrorDialog(MessagesProvider.get("Order identifier should not contain any special characters"));
      return false;
    }else if (_guestCountTextController.text.isEmpty) {
      _showErrorDialog(MessagesProvider.get("Guest count is required"));
      return false;
    } else if (int.parse(_guestCountTextController.text) <= 0) {
      _showErrorDialog(MessagesProvider.get('Guest count should be greater than zero'));
      return false;
    } else if (!AppConstants.onlyNumbersRegExp.hasMatch(_guestCountTextController.text)) {
      _showErrorDialog(MessagesProvider.get('Invalid Guest count'));
      return false;
    } else if (int.parse(_guestCountTextController.text) > 30) {
      _showErrorDialog(MessagesProvider.get('Guest count cannot exceed more than 30'));
      return false;
    }else{
      return true;
    }
  }

  _showErrorDialog(String message){
    // ErrorDialog
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext newContext) {
          return ErrorAlertDialog(title: 'Error',message:message ,

          );
        });
  }

  initTextFields() {
    if(widget.isUpdate){
      _guestNameTextController.text = widget.transactionCubit?.state.transactionData?.guestName ?? '';
      _guestCountTextController.text = widget.transactionCubit?.state.transactionData?.guestCount.toString() ?? "1";
      _orderIdentifierTextController.text = widget.transactionCubit?.state.transactionData?.transactionIdentifier ?? '';
      _guestContactTextController.text = widget.transactionCubit?.state.transactionData?.guestContactNumber ?? '';
    }
  }

  _resetLoaderAndMessage() {
    final transactionOrderDetailsState = context.read<TransactionOrderDetailsCubit>();
    transactionOrderDetailsState.resetLoaderAndMessage();
  }

  @override
  void dispose() {
    _guestNameTextController.clear();
    _guestContactTextController.clear();
    _guestCountTextController.clear();
    _orderIdentifierTextController.clear(); //closing cubit
    _notificationBar = null;
    super.dispose();
  }
}
