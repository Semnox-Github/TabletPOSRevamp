import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:shift_tracking_data/models/end_of_day/end_of_day_status_response.dart';
import 'package:shift_tracking_data/models/posx_report/posx_receipt_content.dart';
import 'package:shift_tracking_data/models/posz_report/posz_reciept_content.dart';
import 'package:shift_tracking_data/models/shift_action_dto/shift_action_dto.dart';

import '../models/end_of_day/end_of_day_response.dart';
import '../models/shift_dto/shift_dto.dart';

part 'shift_track_api_client.g.dart';

@RestApi()
abstract class ShiftTrackingApiClient{

  factory ShiftTrackingApiClient(Dio dio, {String baseUrl}) = _ShiftTrackingApiClient;

  static const _createNewShiftEndPoint = "api/Pos/{posMachineId}/User/{userId}/Shift";
  static const _getCashDrawerEndPoint = "api/Pos/{posMachineId}/User/{userId}/Shift";
  static const _getAssignedCashDrawerEndPoint = "api/Pos/{posMachineId}/User/{userId}/Shift";
  static const _endOfDayEndPoint = "api/Pos/{posMachineId}/EndOfDay";
  static const _getCashDrawerDetailsEndPoint = "api/User/{userId}/CashDrawer";
  static const _shiftStatusChangeEndPoint = "api/Shift/{shiftId}/ShiftStatusChange";
  static const _getPosZreportEndpoint ="api/POS/{posMachineId}/POSZPrint";
  static const _getPosXreportEndPoint = "api/Shift/{shiftId}/POSXPrint";

  @POST(_createNewShiftEndPoint)
  Future<ShiftActionDTO> createNewShift(@Path() int poMachineId,@Path() int userId, @Body() ShiftActionDTO cashPaymentRequests);

  @GET(_endOfDayEndPoint)
  Future<EndOfDayStatus> getEndOfDayStatus(@Path() int posMachineId);

  @POST(_endOfDayEndPoint)
  Future<EndOfDayResponse>  setEndOfDay(@Path() int posMachineId);

  @GET(_getCashDrawerDetailsEndPoint)
  Future<ShiftDTOResponse> getCashDrawerDetails(@Path() int userId,@Queries() Map<String, dynamic> queries);

  @GET(_shiftStatusChangeEndPoint)
  Future<void> shiftStatusChange(@Path() int shiftId,@Body() Map<String, dynamic> queries);

  @GET(_getPosZreportEndpoint)
  Future<PosZReceiptContentResponse> getPoszReport(@Path() int posMachineId,@Queries() Map<String, dynamic> queries);

  @GET(_getPosXreportEndPoint)
  Future<PosXReceiptContentResponse> getPosXReport(@Path() int shiftId,@Queries() Map<String, dynamic> queries);
}