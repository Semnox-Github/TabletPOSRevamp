// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';


part 'customer_profiling_container_dto.freezed.dart';
part 'customer_profiling_container_dto.g.dart';

@freezed
class CustomerProfilingGroupContainerDTO with _$CustomerProfilingGroupContainerDTO {
  const factory CustomerProfilingGroupContainerDTO({
    @JsonKey(name: 'CustomerProfilingGroupId')
    required int customerProfilingGroupId,
    @JsonKey(name: 'ProfilingGroupName')
    required String profilingGroupName,
    @JsonKey(name: 'CustomerProfilingContainerDTOList')
    required List<dynamic> customerProfilingContainerDTOList,
  }) = _CustomerProfilingGroupContainerDTO;

  factory CustomerProfilingGroupContainerDTO.fromJson(Map<String, dynamic> json) => _$CustomerProfilingGroupContainerDTOFromJson(json);
}
