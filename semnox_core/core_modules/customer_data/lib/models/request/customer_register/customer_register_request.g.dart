// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerRegisterRequest _$$_CustomerRegisterRequestFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerRegisterRequest(
      id: json['Id'] as int,
      profileId: json['ProfileId'] as int,
      membershipId: json['MembershipId'] as int,
      masterEntityId: json['MasterEntityId'] as int,
      externalSystemReference: json['ExternalSystemReference'] as String?,
      channel: json['Channel'] as String?,
      profileDTO:
          ProfileDTO.fromJson(json['profileDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CustomerRegisterRequestToJson(
        _$_CustomerRegisterRequest instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'ProfileId': instance.profileId,
      'MembershipId': instance.membershipId,
      'MasterEntityId': instance.masterEntityId,
      'ExternalSystemReference': instance.externalSystemReference,
      'Channel': instance.channel,
      'profileDTO': instance.profileDTO,
    };
