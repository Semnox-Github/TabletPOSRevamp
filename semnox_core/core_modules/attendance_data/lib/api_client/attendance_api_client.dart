import 'package:attendance_data/model/attendanceForDay/attendance_for_day.dart';
import 'package:attendance_data/model/receipt/receipt_content_response.dart';
import 'package:attendance_data/model/recordAttendance/attendance_request.dart';
import 'package:attendance_data/model/record_attendance_model.dart';
import 'package:attendance_data/model/template_header_container/receipt_template_header_container_response.dart';
import 'package:attendance_data/model/shiftConfig/shift_config_model.dart';
import 'package:dio/dio.dart';
import 'package:master_data/models/user_role_container/user_role_container_response.dart';
import 'package:retrofit/http.dart';
import 'package:transaction_data/models/user_container/user_container_response.dart';

part 'attendance_api_client.g.dart';

@RestApi()
abstract class AttendanceApiClient {
  factory AttendanceApiClient(Dio dio, {String baseUrl}) = _AttendanceApiClient;

  static const _recordAttendanceEndpoint = "api/HR/User/{userId}/RecordAttendance";
  static const _getattendanceDetails = "api/HR/User/{userId}/AttendanceForTheDay";

  static const _userRoleContainerEndpoint = 'api/HR/UserRoleContainer';
  static const _userContainerEndpoint = 'api/HR/UserContainer';
  static const _templateIdEndPoint = "api/Print/PrintTemplates";
  static const _templateHeaderContainerEndPoint = "api/Print/ReceiptPrintTemplateHeaderContainer";
  static const _receiptEndPoint = "api/HR/User/{userId}/Receipt";
  static const _shiftConfigContainer = 'api/HR/ShiftConfigurationsContainer';

  @POST(_recordAttendanceEndpoint)
  Future<RecordAttendanceModel> postRecordAttendance(
      @Path() int userId, @Body() AttendanceRequest request);

  @GET(_getattendanceDetails)
  Future<AttendanceForDay> getAttendanceDetails(@Path() int userId);

  @GET(_userRoleContainerEndpoint)
  Future<UserRoleContainerResponse> getUserRoleList(
      @Queries() Map<String, dynamic> params);

  @GET(_userContainerEndpoint)
  Future<UserContainerResponse> getUserContainer(
      @Queries() Map<String, dynamic> params);

  @GET(_shiftConfigContainer)
  Future<ShiftConfigResponseModel> getShiftConfig(@Queries() Map<String, dynamic> params);

  @GET(_templateIdEndPoint)
  Future<int> getClockInClockOutReceiptsTemplateId(@Queries() Map<String, dynamic> params);

  @GET(_templateHeaderContainerEndPoint)
  Future<ReceiptTemplateHeaderContainerResponse> getReceiptTemplateHeaderContainer(@Queries() Map<String, dynamic> params);

  @GET(_receiptEndPoint)
  Future<ReceiptContentResponse> getReceiptContent(@Path() int userId, @Queries() Map<String, dynamic> params);
}
