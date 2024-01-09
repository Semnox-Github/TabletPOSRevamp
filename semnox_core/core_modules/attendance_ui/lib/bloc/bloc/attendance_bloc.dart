import 'package:attendance_data/attendance_data_bl.dart';
import 'package:attendance_data/builder.dart';
import 'package:attendance_data/model/attendanceForDay/attendance_for_day.dart';
import 'package:attendance_data/model/recordAttendance/attendance_request.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:instant/instant.dart';
import 'package:login_data/models/login_response.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/master_data_bl.dart';
import 'package:master_data/models/configurations/configuration_response.dart';
import 'package:master_data/models/configurations/parafait_default_container_dto.dart';
import 'package:master_data/models/user_role_container/user_role_container_dto.dart';
import 'package:widgets_library/utils/time_zones.dart';
import 'package:transaction_data/builder.dart';
import 'package:transaction_data/models/user_container/user_container_response.dart';

part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  late MasterDataBLContract masterDataBL;
  late AttendanceDataBLContract attendanceBl;
  AttendanceForDay? attendanceForDay;
  late AttendanceRequest attendanceRequest;
  late UserContainerResponse userRoleContainerResponse;
  late UserContainerResponse userContainerResponse;
  List<String> ofValues = [];
  List userIdList = [];
  TextEditingController tipController = TextEditingController();
  ConfigurationResponse? configurationResponse;
  ParafaitDefaultContainerDTO? maxBreak;
  ParafaitDefaultContainerDTO? minBreak;
  DateTime? onBreakTime;
  String onBreakString = '';
  AttendanceLogDTOList? lastLoggedInLogDTO;
  double totalAttendanceHours = 0.0;
  String attendnaceHours = '';
  LoginResponse? loginResponse;
  double? clockInTime;
  double clockinAttendanceHours = 0.0;
  UserRoleContainerDTO? user;
  String? _timeZoneName;
  DateTime? _currentDateTime;
  String printerTypeNotSetMessage = '';

  AttendanceBloc() : super(AttendanceInitial()) {
    on<GetAttendanceDetails>(_getAttendanceDetails);
    on<RecordAttendance>(_recordAttendance);
    on<AutoClockOut>(autoClockOut);
    on<ShowLoading>(_showLoading);
    on<HideLoading>(_hideLoading);
  }

  void setLoginResponse(LoginResponse? loginResponse) {
    this.loginResponse = loginResponse;
  }

  autoClockOut(AutoClockOut event, Emitter<AttendanceState> emit) async {
    emit(LoadingState());
    Log.printMethodStart('autoClockOut()','Dashboard','NO');
    try {
      final response = await attendanceBl.recordAttendance(
        attendanceRequest,
        userId: event.userId,
      );
      Log.printMethodEnd('autoClockOut()','Dashboard','NO');
      Log.printMethodReturn('autoClockOut()-Success','Dashboard','NO');
      emit(AttendanceRecorded());
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      switch (error.type) {
        case DioErrorType.cancel:
          errorString = "Request cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorString = "Connection time out";
          break;
        case DioErrorType.receiveTimeout:
          errorString = "Connection time out";
          break;
        case DioErrorType.response:
          errorString = error.response?.data['data'] as String?;
          break;
        case DioErrorType.sendTimeout:
          errorString = "Connection time out";
          break;
        default:
          errorString = "Please check your connection";
          break;
      }
      emit(ErrorState(errorString ?? ''));
    }
  }

  _getAttendanceDetails(
      GetAttendanceDetails event, Emitter<AttendanceState> emit) async {
    emit(LoadingState());
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    final transactionBL = await TransactionDataBuilder.build(execContextDTO);
    final sites = await masterDataBL.getSites();
    final item = sites?.data?.siteContainerDTOList
        .where((element) => element.siteId == execContextDTO.siteId);
    if (item?.isNotEmpty == true) {
      final zone = item!.first.timeZoneName;
      _timeZoneName = timeZoneMap[zone];
    }
    final currentZone = curDateTimeByZone(zone: _timeZoneName ?? 'GMT');
    // String time =
    //     DateFormat("EEEE, dd-MMM-yyyy hh:mm:ss a").format(currentZone);
    // if (time != _currentDateTime) {
    _currentDateTime = currentZone;
    // }
    configurationResponse = await masterDataBL.getConfigurations();
    attendanceBl = await AttendanceDataBuilder.build(execContextDTO);
    userIdList = [];
    ofValues.clear();
    attendnaceHours = '';
    try {
      Log.printMethodStart('_getAttendanceDetails()','RECORD ATTENDANCE','init');
      attendanceForDay =
          await attendanceBl.getAttendanceDetails(userId: event.userId);
      userContainerResponse = await transactionBL.getUserContainerList();
      userIdList = userContainerResponse.data!.userContainerDtoList
          .firstWhere((element) => element.userId == event.userId)
          .attendanceRoleIdList;
      Log.printMethodEnd('_getAttendanceDetails()','RECORD ATTENDANCE','init');
      Log.printMethodReturn('_getAttendanceDetails()','RECORD ATTENDANCE','init');
      if (attendanceForDay?.data != null) {
        clockinTimeCal();
      } else {
        attendnaceHours = '';
      }
      for (var e in userIdList) {
        user = await masterDataBL.getUserRoleById(e);
        ofValues.add(user!.role);
      }
      print('length ${ofValues.length}');

      emit(AttendnanceForDayLoaded(attendanceForDay!));
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      switch (error.type) {
        case DioErrorType.cancel:
          errorString = "Request cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorString = "Connection time out";
          break;
        case DioErrorType.receiveTimeout:
          errorString = "Connection time out";
          break;
        case DioErrorType.response:
          errorString = error.response?.data['data'] as String?;
          break;
        case DioErrorType.sendTimeout:
          errorString = "Connection time out";
          break;
        default:
          errorString = "Please check your connection";
          break;
      }
      emit(ErrorState(errorString ?? ''));
    } catch (e) {
      emit(SiteError(e.toString()));
    }
  }

  clockinTimeCal() {
    // List<AttendanceLogDTOList>? lastLoggedInLogDTO = (attendanceForDay
    //     ?.data?.attendanceLogDTOList
    //     ?.where((element) => element.requestStatus == 'Recorded')
    //     .toList());

    // lastLoggedInLogDTO?.sort((b, a) => DateTime.parse(a.timestamp!)
    //     .compareTo(DateTime.parse(b.timestamp ?? '')));
    // lastLoggedInLogDTO
    //     ?.sort((b, a) => a.attendanceLogId!.compareTo(b.attendanceLogId!));
    (attendanceForDay?.data?.attendanceLogDTOList
            ?.where((element) => element.requestStatus == 'Recorded')
            .toList())
        ?.sort((b, a) => a.timestamp!.compareTo(b.timestamp ?? ''));

    if (attendanceForDay?.data?.hourUpdatedTime != null &&
        attendanceForDay?.data?.attendanceLogDTOList?.first.type ==
            'ATTENDANCE_IN') {
      DateTime hoursUpdateTime = DateTime.parse(
          '${attendanceForDay?.data?.attendanceLogDTOList?.last.timestamp}Z');
      clockInTime =
          (_currentDateTime?.difference(hoursUpdateTime).inMinutes ?? 1) / 60;

      print(
          "hoursUpdated $hoursUpdateTime  clockInTime $_currentDateTime $clockInTime");
      clockinAttendanceHours = attendanceForDay?.data?.hours + clockInTime;
      attendnaceHours = getTimeStringFromDouble(clockinAttendanceHours);
    } else {
      totalAttendanceHours = attendanceForDay?.data?.hours;
      attendnaceHours = getTimeStringFromDouble(totalAttendanceHours);
    }
  }

  breakTimeCal() {
    minBreak = configurationResponse?.data?.parafaitDefaultContainerDtoList
        .firstWhere(
            (element) => element.defaultValueName == 'MINIMUM_BREAK_TIME');
    maxBreak = configurationResponse?.data?.parafaitDefaultContainerDtoList
        .firstWhere(
            (element) => element.defaultValueName == 'MAXIMUM_BREAK_TIME');
    onBreakTime = DateTime.parse(
        '${attendanceForDay?.data?.attendanceLogDTOList?.last.timestamp}Z');
    if (int.parse(minBreak?.defaultValue ?? '0') > 0) {
      int elapsedTime =
          (DateTime.now().toUtc().difference(onBreakTime!).inMinutes) % 60;
      if (elapsedTime < int.parse(minBreak?.defaultValue ?? '0')) {
        onBreakString = "Early from break($elapsedTime Mins)";
      } else if (elapsedTime > int.parse(maxBreak?.defaultValue ?? '0')) {
        onBreakString = "Late From Break($elapsedTime Mins)";
      } else {
        onBreakString = 'On Time';
      }
      if (totalAttendanceHours > 0) {
        onBreakString =
            '$onBreakString - ${getHourString(totalAttendanceHours)} Hour ${getMinuteString(totalAttendanceHours)} Min ';
      }
    }
  }

  String getTimeStringFromDouble(double value) {
    if (value < 0) return 'Invalid Value';

    String hourValue = getHourString(value);
    String minuteString = getMinuteString(value);
    String secondValue = getSecondsString(value);

    return '${hourValue}Hrs ${minuteString}Mins ${secondValue}Secs';
  }

  String getSecondsString(double value) {
    int flooredValue = value.floor();
    double decimalValue = value - flooredValue;
    double secDecimalValue = decimalValue * 60 - (decimalValue * 60).toInt();
    return '${(secDecimalValue * 60).toInt()}';
  }

  String getMinuteString(double value) {
    int flooredValue = value.floor();
    double decimalValue = value - flooredValue;
    return '${(decimalValue * 60).toInt()}';
  }

  String getHourString(double value) {
    int flooredValue = value.floor();
    return '${flooredValue % 24}';
  }

  void setMasterDataBL(MasterDataBLContract masterDataBLContract) {
    masterDataBL = masterDataBLContract;
  }

  void setAttendanceBL(AttendanceDataBLContract attendanceBLContract) {
    attendanceBl = attendanceBLContract;
  }

  void setAttendanceRequest(AttendanceRequest request) {
    attendanceRequest = request;
  }

  _recordAttendance(RecordAttendance event, Emitter<AttendanceState> emit) async {
    emit(LoadingState());
    try {
      final response = await attendanceBl.recordAttendance(
        attendanceRequest,
        userId: event.userId,
      );
      emit(AttendanceRecorded());
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      switch (error.type) {
        case DioErrorType.cancel:
          errorString = "Request cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorString = "Connection time out";
          break;
        case DioErrorType.receiveTimeout:
          errorString = "Connection time out";
          break;
        case DioErrorType.response:
          errorString = error.response?.data['data'] as String?;
          break;
        case DioErrorType.sendTimeout:
          errorString = "Connection time out";
          break;
        default:
          errorString = "Please check your connection";
          break;
      }
      emit(ErrorState(errorString ?? ''));
    }
  }

  void _showLoading(ShowLoading event, Emitter<AttendanceState> emit) {
    emit(LoadingState());
  }

  void _hideLoading(HideLoading event, Emitter<AttendanceState> emit) {
    emit(LoadedState());
  }

  void setPrinterTypeNotSetMessage(String message) {
    printerTypeNotSetMessage = message;
  }

  void clearPrinterTypeNotSetMessage() {
    printerTypeNotSetMessage = '';
  }
}
