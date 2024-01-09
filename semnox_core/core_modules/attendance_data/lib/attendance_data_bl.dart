import 'package:attendance_data/attendance_data_service.dart';
import 'package:attendance_data/model/attendanceForDay/attendance_for_day.dart';
import 'package:attendance_data/model/receipt/receipt_content_response.dart';
import 'package:attendance_data/model/recordAttendance/attendance_request.dart';
import 'package:attendance_data/model/record_attendance_model.dart';
import 'package:attendance_data/model/shiftConfig/shift_config_model.dart';
import 'package:attendance_data/model/template_header_container/receipt_template_header_container_response.dart';
import 'package:master_data/models/user_role_container/user_role_container_response.dart';
import 'package:transaction_data/models/user_container/user_container_response.dart';

abstract class AttendanceDataBLContract {
  Future<RecordAttendanceModel> recordAttendance(AttendanceRequest request,
      {required int userId});

  Future<AttendanceForDay> getAttendanceDetails({required int userId});
  Future<UserRoleContainerResponse> getUserRoleList(
      Map<String, dynamic> params);

  Future<UserContainerResponse> getUserContainer(Map<String, dynamic> params);
  Future<ReceiptTemplateHeaderContainerResponse> getReceiptTemplateContainer(Map<String, dynamic> params);
  Future<ReceiptContentResponse> getReceiptContent(int userId, Map<String, dynamic> params);
  Future<ShiftConfigResponseModel> getShiftConfig();
}

class AttendanceDataBLImpl implements AttendanceDataBLContract {
  final AttendanceDataService _attendanceDataService;

  AttendanceDataBLImpl(this._attendanceDataService);

  @override
  Future<RecordAttendanceModel> recordAttendance(AttendanceRequest request,
      {required int userId}) {
    return _attendanceDataService.recordAttendance(request, userId: userId);
  }

  @override
  Future<AttendanceForDay> getAttendanceDetails({required int userId}) {
    return _attendanceDataService.getAttendanceDetails(userId: userId);
  }

  @override
  Future<UserRoleContainerResponse> getUserRoleList(
      Map<String, dynamic> params) {
    return _attendanceDataService.getUserRoleList(params);
  }

  @override
  Future<UserContainerResponse> getUserContainer(Map<String, dynamic> param) {
    return _attendanceDataService.getUserContainer(param);
  }

  @override
  Future<ShiftConfigResponseModel> getShiftConfig() {
    return _attendanceDataService.getShiftConfig();
  }

  @override
  Future<ReceiptContentResponse> getReceiptContent(int userId, Map<String, dynamic> params) {
    return _attendanceDataService.getReceiptContent(userId, params);
  }

  @override
  Future<ReceiptTemplateHeaderContainerResponse> getReceiptTemplateContainer(Map<String, dynamic> params) {
    return _attendanceDataService.getReceiptTemplateContainer(params);
  }
}
