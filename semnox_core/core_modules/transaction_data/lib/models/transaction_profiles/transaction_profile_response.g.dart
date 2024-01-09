// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionProfileResponse _$$_TransactionProfileResponseFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionProfileResponse(
      data: json['data'] == null
          ? null
          : TransactionProfileData.fromJson(
              json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_TransactionProfileResponseToJson(
        _$_TransactionProfileResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
