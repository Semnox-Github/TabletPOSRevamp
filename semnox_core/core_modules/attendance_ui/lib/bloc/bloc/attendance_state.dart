part of 'attendance_bloc.dart';

@immutable
abstract class AttendanceState {}

class AttendanceInitial extends AttendanceState {}

class AttendnanceForDayLoaded extends AttendanceState {
  final AttendanceForDay response;
  final String? errorMsg;
  AttendnanceForDayLoaded(this.response, {this.errorMsg});
}

class AttendanceRecorded extends AttendanceState {}

class LoadingState extends AttendanceState {}

class LoadedState extends AttendanceState {}

class UserRolesLoaded extends AttendanceState {}

class ErrorState extends AttendanceState {
  final String errorString;
  ErrorState(this.errorString);
}

class SiteError extends AttendanceState {
  final String errorString;
  SiteError(this.errorString);
}

class AttendanceNone extends AttendanceState {}
