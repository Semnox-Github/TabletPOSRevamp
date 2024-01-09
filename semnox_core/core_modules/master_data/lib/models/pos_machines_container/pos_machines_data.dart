// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/pos_machines_container/pos_machine_container_dto.dart';

part 'pos_machines_data.freezed.dart';
part 'pos_machines_data.g.dart';


@freezed
class POSMachinesData with _$POSMachinesData {
  const factory POSMachinesData({
    @JsonKey(name: 'POSMachineContainerDTOList')
    required List<POSMachineContainerDTO> posMachineContainerDTOList,
    @JsonKey(name: 'Hash')
    String? hash,
  }) = _POSMachinesData;

  factory POSMachinesData.fromJson(Map<String, dynamic> json) => _$POSMachinesDataFromJson(json);
}