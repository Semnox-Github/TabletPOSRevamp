import 'package:execution_context/models/execution_context_dto.dart';
import 'package:shift_tracking_data/models/end_of_day/end_of_day_response.dart';
import 'package:shift_tracking_data/models/end_of_day/end_of_day_status_response.dart';
import 'package:shift_tracking_data/models/posx_report/posx_receipt_content.dart';
import 'package:shift_tracking_data/models/posz_report/posz_reciept_content.dart';
import 'package:shift_tracking_data/models/shift_action_dto/shift_action_dto.dart';
import 'package:shift_tracking_data/shift_track_data_service.dart';

import 'models/shift_dto/shift_dto.dart';

abstract class ShiftTrackDataBLContract {
  Future<EndOfDayStatus> getEndOfDayStatus(int machineID);
  Future<EndOfDayResponse> setEndOfDayResponse(int machineID);
  Future<ShiftDTOResponse> getCashDrawerDetails({int userID, Map<String, dynamic> query});
  Future<PosZReceiptContentResponse>getPosZReceipt({required int posMachineID});
  Future<PosXReceiptContentResponse>getPosXReceipt({required int shiftID});

  Future<ShiftDTOResponse> getOpenShiftDetails({required int userId,required Map<String, dynamic> query});
  Future<void> unAssignRemoteShift({required int shiftId,required Map<String, dynamic> query});
}

class ShiftTrackDataBLImpl implements ShiftTrackDataBLContract {

  final ShiftTrackDataService _shiftTrackDataService;

  ShiftTrackDataBLImpl(this._shiftTrackDataService);

  @override
  Future<EndOfDayStatus> getEndOfDayStatus(int machineID) async {
    return await _shiftTrackDataService.getEndOfDayStatus(machineID);
  }

  @override
  Future<EndOfDayResponse> setEndOfDayResponse(int machineID) async{
    return await _shiftTrackDataService.setEndOfDayResponse(machineID);
  }

  @override
  Future<ShiftDTOResponse> getCashDrawerDetails({int userID = -1, Map<String, dynamic>? query}) async{
    return await _shiftTrackDataService.getCashDrawerDetails(userID: userID,query: query);
  }

  @override
  Future<PosZReceiptContentResponse> getPosZReceipt({required int posMachineID}) async{
   return await _shiftTrackDataService.getPosZReport(posMachineID: posMachineID);
  }

  @override
  Future<PosXReceiptContentResponse> getPosXReceipt({required int shiftID}) async{
      return await _shiftTrackDataService.getPosXReport(shiftId: shiftID );
  }

  @override
  Future<ShiftDTOResponse> getOpenShiftDetails({required int userId,required Map<String, dynamic> query}) async{
    return await _shiftTrackDataService.getCashDrawerDetails(userID: userId,query: query);
  }

  @override
  Future<void> unAssignRemoteShift({required int shiftId, required Map<String, dynamic> query}) async{
   return await _shiftTrackDataService.unAssignRemoteShift(shiftId: shiftId,query: query);
  }


}