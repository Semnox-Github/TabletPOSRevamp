import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:payment_data/models/employee_tip/employee_tip_data.dart';

part 'employee_tip_response.freezed.dart';
part 'employee_tip_response.g.dart';

@freezed
class EmployeeTipResponse with _$EmployeeTipResponse {
  const factory EmployeeTipResponse({
    List<EmployeeTipData>? data,
    String? exception
  }) = _EmployeeTipResponse;

  factory EmployeeTipResponse.fromJson(Map<String, dynamic> json) => _$EmployeeTipResponseFromJson(json);
}