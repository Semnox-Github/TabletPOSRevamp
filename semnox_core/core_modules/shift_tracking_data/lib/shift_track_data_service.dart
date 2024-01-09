import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:application_prefs_data/builder.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:shift_tracking_data/api_client/shift_track_api_client.dart';

import 'models/end_of_day/end_of_day_response.dart';
import 'models/end_of_day/end_of_day_status_response.dart';
import 'models/posx_report/posx_receipt_content.dart';
import 'models/posz_report/posz_reciept_content.dart';
import 'models/shift_dto/shift_dto.dart';
import 'package:path_provider/path_provider.dart';

class ShiftTrackDataService {

  late ShiftTrackingApiClient _shiftApiClient;

  static final ShiftTrackDataService _instance = ShiftTrackDataService._internal();
  ShiftTrackDataService._internal();

  factory ShiftTrackDataService(ShiftTrackingApiClient apiClient) {
    _instance._shiftApiClient = apiClient;
    return _instance;
  }

  Future<EndOfDayStatus>getEndOfDayStatus(int machineID)async{
    try {
      final EndOfDayStatus _endOfDayStatus  = await _shiftApiClient.getEndOfDayStatus(machineID);
      return _endOfDayStatus;
    } on DioError {
      rethrow;
    }
  }

  Future<EndOfDayResponse> setEndOfDayResponse(int machineID) async{
    try{
      final EndOfDayResponse _endOfDayResponse = await _shiftApiClient.setEndOfDay(machineID);
      return _endOfDayResponse;
    } on DioError{
      rethrow;
    }
  }

  Future<ShiftDTOResponse> getCashDrawerDetails({int userID = -1, Map<String, dynamic>? query })async{
    print(query);
    try{
      final ShiftDTOResponse _shiftDTOResponse = await _shiftApiClient.getCashDrawerDetails(userID,query!);
      return _shiftDTOResponse;
    } on DioError{
      rethrow;
    }
  }

  Future<PosZReceiptContentResponse> getPosZReport({required int posMachineID })async{
    final Map<String,dynamic> query = {
      'pageSize' : -1,
      'currentPage' : -1,
      'siteId' : -1,
      'outputFormat' : 'B',
      'posmachineId' : posMachineID,
    };
    try{
      final PosZReceiptContentResponse posZReceiptContentResponse = await _shiftApiClient.getPoszReport(posMachineID,query);
      return posZReceiptContentResponse;
    } on DioError{
      rethrow;
    }
  }

  Future<PosXReceiptContentResponse> getPosXReport({required int shiftId })async{
    final Map<String,dynamic> query = {
      'pageSize' : -1,
      'currentPage' : -1,
      'siteId' : -1,
      'outputFormat' : 'B',
      'shiftId' : shiftId,
    };
    try{
      final PosXReceiptContentResponse posXReceiptContentResponse = await _shiftApiClient.getPosXReport(shiftId, query);
      return posXReceiptContentResponse;
    } on DioError{
      rethrow;
    }
  }


  //Parameters( api/Shift/90061/ShiftStatusChange, {"ShiftId":-1,"ShiftAction":"Close","ShiftAmount":1.0,"CardCount":2,"ShiftTicketNumber":6,"ShiftRemarks":null,"ActualAmount":0.0,"ActualCards":0,"ActualTickets":0,"GameCardAmount":0.0,"CreditCardamount":3.0,"ChequeAmount":4.0,"CouponAmount":5.0,"ActualGameCardamount":0.0,"ActualCreditCardAmount":0.0,"ActualChequeAmount":0.0,"ActualCouponAmount":0.0,"ShiftReason":"Close Shift","ApprovalDTO":{"ApproverId":217,"Remarks":""},"CashDrawerId":7,"ShiftUserName":"All","PosMachineName":"All","ShiftLoginId":null,"IsShareable":false,"CashDrawerStatusId":12,"Mode":null})

  Future<void> unAssignRemoteShift({int shiftId = -1, Map<String, dynamic>? query })async{
    print(query);
    try{
      final response = await _shiftApiClient.shiftStatusChange(shiftId, query!);
      return response;
    } on DioError{
      rethrow;
    }
  }



}

