import 'dart:convert';

import 'package:application_prefs_data/builder.dart';
import 'package:execution_context/builder.dart';
import 'package:execution_context/execution_context_bl.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:master_data/builder.dart';
import 'package:orders_data/builder.dart';
import 'package:shift_tracking/cubit/remote_cashdrawer_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shift_tracking_data/builder.dart';
import 'package:dio/dio.dart';
import 'package:shift_tracking_data/models/shift_dto/shift_dto.dart';
import 'package:http/http.dart' as http;
class RemoteCashDrawerCubit extends Cubit<RemoteCashDrawerCubitState> {

  RemoteCashDrawerCubit() : super( RemoteCashDrawerCubitState());
  late ExecutionContextBLContract execContextBL;
  ExecutionContextDTO? execContext;

  List<ShiftDTO> shiftList = [];

  getAllDropDownValues()async{
    execContextBL = await ExecutionContextBuilder.build();
    execContext = execContextBL.getExecutionContext();
    emit(state.copyWith(
      posDropdownValues: [execContext!.posMachineName.toString()],
     // userDropdownValues: [execContext!.userId.toString()],
      isLoading: false,
    ));
  }

  getPosDropDownValues()async{
    execContextBL = await ExecutionContextBuilder.build();
    execContext = execContextBL.getExecutionContext();
    var masterDataBL = await MasterDataBuilder.build(execContext!);
    final _posMachineContainer = await masterDataBL.getPosMachines();

    emit(state.copyWith(
      posMachineContainer: _posMachineContainer,
     isLoading: false,
   ));
  }

  getUserDropDownValues()async{
    emit(state.copyWith(
      isLoading: true,
    ));
      execContextBL = await ExecutionContextBuilder.build();
      execContext = execContextBL.getExecutionContext();
    final orderSearchBL = await OrdersDataBuilder.build(execContext!);
   // var masterDataBL = await MasterDataBuilder.build(execContext!);
   final  _userContainer = await orderSearchBL.getUserContainer();
   if(_userContainer != null){
     emit(state.copyWith(
       isLoading:false,
       userContainer: _userContainer,
     ));
   }
  }

  changeTabValue(String newTabvalue){
    emit(state.copyWith(
      tabValue: newTabvalue,
    ));
  }

  // https://parafaitposredesigntestapi.parafait.com/api/User/-1/CashDrawer?actionType=Open%2cROpen&buildSystemNumbers=True&buildChildRecords=True,

  Future<void> getOpenShiftDetails() async {
    print('getOpenShiftDetails()');
    emit(state.copyWith(isLoading: true,));
    execContextBL = await ExecutionContextBuilder.build();
    final  masterDataBL = await MasterDataBuilder.build(execContext!);
    final shiftTrackingBL = await ShiftTrackDataBuilder.build(execContext!);
    try {
      final response = await shiftTrackingBL.getOpenShiftDetails(userId: -1, query:{
        'actionType':'Open,ROpen',
        'buildSystemNumbers': false,
        'buildChildRecords':false,
      });
      emit(state.copyWith(isLoading: false,));
      emit(state.copyWith(openShiftList: []));
      if (response.data != null) {
        print('getOpenShiftDetails()=>${response.data.toString()}');
        emit(state.copyWith(openShiftList: [...response.data!]));
        shiftList = [];
        shiftList = response.data!;
      }else{
        print('getOpenShiftDetails()=> ${response.data}');
      }
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      print("$errorString");
    }

  }

  getSystemValues(ShiftDTO shiftDTo){
    emit(state.copyWith(
      systemCash: shiftDTo.shiftAmount == null ? '' : shiftDTo.shiftAmount.toString(),
      systemCardCount: shiftDTo.cardCount == null ? '' : shiftDTo.cardCount.toString(),
      systemGameCard: shiftDTo.gameCardamount == null ? '' : shiftDTo.gameCardamount.toString(),
      systemCreditCard: shiftDTo.creditCardamount == null ? '' : shiftDTo.creditCardamount.toString(),
      systemOthers:  shiftDTo.chequeAmount == null ? '' : shiftDTo.chequeAmount.toString(),
      systemCoupons: shiftDTo.couponAmount == null ? '' : shiftDTo.couponAmount.toString(),
      systemTicket: shiftDTo.shiftTicketNumber == null ? '' : shiftDTo.shiftTicketNumber.toString(),
    ));
  }

  setFormValues(String type,String value){
    if(type == '* Cash'){
      emit(state.copyWith(cash:value ));
    }else if(type == '* Card Count'){
      emit(state.copyWith(cardCount:value ));
    }else if(type == 'Game Card'){
      emit(state.copyWith(gameCard:value ));
    }else if(type == 'Credit Card'){
      emit(state.copyWith(creditCard:value ));
    }else if(type == 'Others'){
      emit(state.copyWith(others:value ));
    }else if(type == 'Coupons'){
      emit(state.copyWith(coupons:value ));
    }else if(type == 'Tickets'){
      emit(state.copyWith(ticket:value ));
    }else{
      print(type);
    }
  }

  resetFormValues(){
    emit(state.copyWith(
      cash: '',
      cardCount:  '',
      gameCard: '',
      creditCard: '',
      others: '',
      coupons: '',
      ticket: '',
    ));
  }

  unAssignOpenCashDrawer({required ShiftDTO shiftDto})async {
    print('unAssignOpenCashDrawer()');
    emit(state.copyWith(isLoading: true,));
    execContextBL = await ExecutionContextBuilder.build();
    final  masterDataBL = await MasterDataBuilder.build(execContext!);
    final shiftTrackingBL = await ShiftTrackDataBuilder.build(execContext!);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final http.Response response = await http.post(
        Uri.parse(//
            "${appPrefsBL.getServerUrl()}/api/Shift/${shiftDto.shiftKey}/ShiftStatusChange"),
        headers: {
          "Authorization" : "${execContext!.webApiToken}",
          "Content-Type" : "application/json",
        },
        body: json.encode({
          "shiftId": -1,
          "shiftLogId": int.tryParse(shiftDto.shiftLoginId.toString()),
          "shiftAction": "Close",
          "shiftAmount": double.parse(state.cash),
          "cardcount": int.parse(state.cardCount),
          "shiftTicketNumber":state.ticket == '' ? 0 : int.tryParse(state.ticket.toString()),
          "shiftRemarks": '',
          "actualAmount":null,
          "actualCards":null,
          "actualTickets":null,
          "gameCardAmount":null,
          "creditCardamount":state.creditCard == '' ? 0 : int.parse(state.creditCard.toString()),
          "chequeAmount":state.others == '' ? null :int.tryParse(state.others.toString()),
          "couponAmount":state.coupons == '' ? null : int.tryParse(state.coupons.toString()),
          "actualGameCardamount":null,
          "actualCreditCardamount":null,
          "actualChequeAmount":null,
          "actualCouponAmount":null,
          "shiftReason":null,
          "cashDrawerId": shiftDto.cashdrawerId,
          "shiftUserName": shiftDto.shiftUserName,
          "posMachineName": shiftDto.posMachine,
          "isShareable":false,
          "cashDrawerStatusId": 12,
           "Mode":null,
          "ApprovalDTO":{
            "ApproverId":217,
            "Remarks":""
          },
        })
    );
    emit(state.copyWith(isLoading: false,));
    getOpenShiftDetails();
    if(response.statusCode != 200){
      print("Error");
      print("Error");
      print(json.decode(response.body));
      print("Error");
      print("Error");
    }else{
      print("Success");
      print("Success");

      print(json.decode(response.body)['data']);
      print("Success");
      print("Success");
    }
  }
  //Parameters( api/Shift/90065/ShiftStatusChange, {"ShiftId":-1,"ShiftAction":"PClose","ShiftAmount":0.0,"CardCount":0,"ShiftTicketNumber":0,"ShiftRemarks":null,"ActualAmount":0.0,"ActualCards":0,"ActualTickets":0,"GameCardAmount":0.0,"CreditCardamount":0.0,"ChequeAmount":0.0,"CouponAmount":0.0,"ActualGameCardamount":0.0,"ActualCreditCardAmount":0.0,
  // "ActualChequeAmount":0.0,"ActualCouponAmount":0.0,"ShiftReason":"Provisional Close Shift","ApprovalDTO":{"ApproverId":217,"Remarks":""},"CashDrawerId":7,"ShiftUserName":"All","PosMachineName":"All","ShiftLoginId":null,"IsShareable":false,"CashDrawerStatusId":9,"Mode":null})

  Future<void> provisionalCloseShift({required ShiftDTO shiftDto}) async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final appPrefsBL = await ApplicationPrefsBuilder.build();
    final http.Response response = await http.post(
        Uri.parse(
            "${appPrefsBL.getServerUrl()}/api/Shift/${shiftDto.shiftKey}/ShiftStatusChange"),
        headers: {
          "Authorization" : "${execContext.webApiToken}",
          "Content-Type" : "application/json",
        },
        body: json.encode({
          "shiftId": -1,
          "shiftLogId": int.tryParse(shiftDto.shiftLoginId.toString()),
          "shiftAction": "PClose",
          "shiftAmount": 0.0,//double.parse(cashCount.value.toString()),
          "cardcount": 0,//int.parse(cardCount.value.toString()),
          "shiftTicketNumber": 0,
          "shiftRemarks":null,
          "actualAmount":null,
          "actualCards":null,
          "actualTickets":null,
          "gameCardAmount":null,
          "creditCardamount":null,
          "chequeAmount":null,
          "couponAmount":null,
          "actualGameCardamount":null,
          "actualCreditCardamount":null,
          "actualChequeAmount":null,
          "actualCouponAmount":null,
          "shiftReason":null,
          "cashDrawerId": shiftDto.cashdrawerId,
          "shiftUserName": shiftDto.shiftUserName,
          "shiftLoginId": null,
          "posMachineName": shiftDto.posMachine,
          "isShareable":false,
          "cashDrawerStatusId": 9,//cashDrawerStatusId.value,
          "ApprovalDTO":{
            "ApproverId":217,
            "Remarks":""},
        })
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
      getOpenShiftDetails();
      print("Success");
      print("Success");
    }
  }


  //HttpMethod, https://parafaitposredesigntestapi.parafait.com/api/User/-1/CashDrawer?actionType=PClose&buildSystemNumbers=True&buildChildRecords=True
  Future<void> getProvisionalCloseShiftDetails() async {
    print('getProvisionalCloseShiftDetails()');
    emit(state.copyWith(isLoading: true,));
    execContextBL = await ExecutionContextBuilder.build();
    final  masterDataBL = await MasterDataBuilder.build(execContext!);
    final shiftTrackingBL = await ShiftTrackDataBuilder.build(execContext!);
    try {
      final response = await shiftTrackingBL.getOpenShiftDetails(userId: -1, query:{
        'actionType':'PClose',
        'buildSystemNumbers': false,
        'buildChildRecords':false,
      });
      emit(state.copyWith(isLoading: false,));
      emit(state.copyWith(openShiftList: []));
      if (response.data != null) {
        print('getProvisionalCloseShiftDetails()=>${response.data.toString()}');
        emit(state.copyWith(openShiftList: [...response.data!]));
        shiftList = [];
        shiftList = response.data!;
      }else{
        print('getProvisionalCloseShiftDetails()=> ${response.data}');
      }
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      print("$errorString");
    }

  }

  search(String posCounter,String pos,String user){

      posCounter = 'All';

    List<ShiftDTO> tempList  = [];

    if(posCounter == 'All' && pos == 'All' && user == 'All' ){
      emit(state.copyWith(openShiftList: shiftList));
      return;
    }
    if(posCounter == 'All' && pos != 'All' && user == 'All'){
      shiftList.forEach((item) {
        if(item.posMachine == pos){
          tempList.add(item);
        }
      });
    }else if(posCounter == 'All' && pos == 'All' && user != 'All'){
      shiftList.forEach((item) {
        if(item.shiftUserName == user){
          tempList.add(item);
        }
      });
    }else if(posCounter == 'All' && pos != 'All' && user != 'All'){
      shiftList.forEach((item) {
        if(item.shiftUserName == user && item.posMachine == pos){
          tempList.add(item);
        }
      });
    }



    emit(state.copyWith(
      openShiftList: tempList,
    ));

  }


}