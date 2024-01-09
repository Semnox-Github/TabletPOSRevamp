import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/active_printers_container/active_printers_data.dart';

part 'active_printers_response.freezed.dart';
part 'active_printers_response.g.dart';

@freezed
class ActivePrintersResponse with _$ActivePrintersResponse{
  const factory ActivePrintersResponse({
    List<ActivePrintersData>? data,
    String? exception
  }) = _ActivePrintersResponse;

  factory ActivePrintersResponse.fromJson(Map<String, dynamic> json) => _$ActivePrintersResponseFromJson(json);
}