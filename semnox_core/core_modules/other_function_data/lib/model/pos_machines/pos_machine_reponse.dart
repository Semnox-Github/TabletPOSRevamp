import 'package:freezed_annotation/freezed_annotation.dart';
import 'pos_machine_data.dart';
part 'pos_machine_reponse.freezed.dart';
part 'pos_machine_reponse.g.dart';

@freezed
class POSMachineResponse with _$POSMachineResponse {
  const factory POSMachineResponse({
    List<PosMachineDate>? data,
    String? exception
  }) = _POSMachineResponse;

  factory POSMachineResponse.fromJson(Map<String, dynamic> json) => _$POSMachineResponseFromJson(json);
}