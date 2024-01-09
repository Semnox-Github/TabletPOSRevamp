// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MemberShipData _$$_MemberShipDataFromJson(Map<String, dynamic> json) =>
    _$_MemberShipData(
      membershipContainerDTOList: (json['MembershipContainerDTOList']
              as List<dynamic>)
          .map(
              (e) => MembershipContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['Hash'] as String?,
    );

Map<String, dynamic> _$$_MemberShipDataToJson(_$_MemberShipData instance) =>
    <String, dynamic>{
      'MembershipContainerDTOList': instance.membershipContainerDTOList,
      'Hash': instance.hash,
    };
