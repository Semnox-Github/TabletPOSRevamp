// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_machines_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_POSMachinesData _$$_POSMachinesDataFromJson(Map<String, dynamic> json) =>
    _$_POSMachinesData(
      posMachineContainerDTOList: (json['POSMachineContainerDTOList']
              as List<dynamic>)
          .map(
              (e) => POSMachineContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['Hash'] as String?,
    );

Map<String, dynamic> _$$_POSMachinesDataToJson(_$_POSMachinesData instance) =>
    <String, dynamic>{
      'POSMachineContainerDTOList': instance.posMachineContainerDTOList,
      'Hash': instance.hash,
    };
