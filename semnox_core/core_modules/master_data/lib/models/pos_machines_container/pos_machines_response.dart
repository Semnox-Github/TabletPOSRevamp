import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/pos_machines_container/pos_machines_data.dart';

part 'pos_machines_response.freezed.dart';
part 'pos_machines_response.g.dart';

@freezed
class POSMachinesResponse with _$POSMachinesResponse {
  const factory POSMachinesResponse({
    POSMachinesData? data,
    String? exception
  }) = _POSMachinesResponse;

  factory POSMachinesResponse.fromJson(Map<String, dynamic> json) => _$POSMachinesResponseFromJson(json);
}