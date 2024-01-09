
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orders_data/models/facility_table/approve_dto.dart';

part 'facility_table.freezed.dart';
part 'facility_table.g.dart';

@freezed
class FacilityTable with _$FacilityTable{

  const factory FacilityTable({
    required String? Reason,
    required String? AdditionalComments,
    required ApproveDTO? ApprovalDTO,
  }) = _FacilityTable;


  factory FacilityTable.fromJson(Map<String, dynamic> json) =>
      _$FacilityTableFromJson(json);
}