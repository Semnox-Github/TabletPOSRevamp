// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pos_cash_drawer_dto.freezed.dart';
part 'pos_cash_drawer_dto.g.dart';


@freezed
class POSCashDrawerContainerDTO with _$POSCashDrawerContainerDTO {
  const factory POSCashDrawerContainerDTO({
    @JsonKey(name: 'POSCashdrawerId')
    required int posCashdrawerId,
    @JsonKey(name: 'POSMachineId')
    required int posMachineId,
    @JsonKey(name: 'CashdrawerId')
    required int cashdrawerId,
    @JsonKey(name: 'IsActive')
    required bool isActive,
  }) = _POSCashDrawerContainerDTO;

  factory POSCashDrawerContainerDTO.fromJson(Map<String, dynamic> json) => _$POSCashDrawerContainerDTOFromJson(json);
}