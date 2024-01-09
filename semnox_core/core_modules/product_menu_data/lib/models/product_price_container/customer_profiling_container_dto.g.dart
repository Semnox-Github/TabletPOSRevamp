// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_profiling_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerProfilingGroupContainerDTO
    _$$_CustomerProfilingGroupContainerDTOFromJson(Map<String, dynamic> json) =>
        _$_CustomerProfilingGroupContainerDTO(
          customerProfilingGroupId: json['CustomerProfilingGroupId'] as int,
          profilingGroupName: json['ProfilingGroupName'] as String,
          customerProfilingContainerDTOList:
              json['CustomerProfilingContainerDTOList'] as List<dynamic>,
        );

Map<String, dynamic> _$$_CustomerProfilingGroupContainerDTOToJson(
        _$_CustomerProfilingGroupContainerDTO instance) =>
    <String, dynamic>{
      'CustomerProfilingGroupId': instance.customerProfilingGroupId,
      'ProfilingGroupName': instance.profilingGroupName,
      'CustomerProfilingContainerDTOList':
          instance.customerProfilingContainerDTOList,
    };
