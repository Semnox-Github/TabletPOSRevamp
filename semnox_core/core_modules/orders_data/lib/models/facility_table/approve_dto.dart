
import 'package:freezed_annotation/freezed_annotation.dart';

part 'approve_dto.freezed.dart';
part 'approve_dto.g.dart';

@freezed
class ApproveDTO with _$ApproveDTO{
  const factory ApproveDTO({
    required int? ApproverId,
    required String? Remarks,
  }) = _ApproveDTO;


  factory ApproveDTO.fromJson(Map<String, dynamic> json) => _$ApproveDTOFromJson(json);
}