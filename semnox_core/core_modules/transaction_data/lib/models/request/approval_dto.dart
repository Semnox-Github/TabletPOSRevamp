// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'approval_dto.freezed.dart';
part 'approval_dto.g.dart';

@freezed
class ApprovalDTO with _$ApprovalDTO {
  const factory ApprovalDTO({
    @JsonKey(name: 'ApproverId')
    required int approverId,
    @JsonKey(name: 'Remarks')
    required String remarks,
  }) = _ApprovalDTO;

  factory ApprovalDTO.fromJson(Map<String, dynamic> json) => _$ApprovalDTOFromJson(json);
}
