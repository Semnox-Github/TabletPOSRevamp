// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_cash_drawer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_POSCashDrawerContainerDTO _$$_POSCashDrawerContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_POSCashDrawerContainerDTO(
      posCashdrawerId: json['POSCashdrawerId'] as int,
      posMachineId: json['POSMachineId'] as int,
      cashdrawerId: json['CashdrawerId'] as int,
      isActive: json['IsActive'] as bool,
    );

Map<String, dynamic> _$$_POSCashDrawerContainerDTOToJson(
        _$_POSCashDrawerContainerDTO instance) =>
    <String, dynamic>{
      'POSCashdrawerId': instance.posCashdrawerId,
      'POSMachineId': instance.posMachineId,
      'CashdrawerId': instance.cashdrawerId,
      'IsActive': instance.isActive,
    };
