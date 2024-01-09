part of 'attendance_bloc.dart';

@immutable
abstract class AttendanceEvent {}

class GetAttendanceDetails extends AttendanceEvent {
  final int userId;
  GetAttendanceDetails(this.userId);
}

class RecordAttendance extends AttendanceEvent {
  final int userId;
  RecordAttendance(this.userId);
}

class AutoClockOut extends AttendanceEvent {
  final int userId;
  AutoClockOut(this.userId);
}

class AttendanceNoneEvent extends AttendanceEvent {}

class GetUserRoles extends AttendanceEvent {}

class ShowLoading extends AttendanceEvent {}
class HideLoading extends AttendanceEvent {}
