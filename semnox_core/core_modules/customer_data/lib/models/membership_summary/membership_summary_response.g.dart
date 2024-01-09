// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MembershipSummaryResponse _$$_MembershipSummaryResponseFromJson(
        Map<String, dynamic> json) =>
    _$_MembershipSummaryResponse(
      exception: json['exception'] as String?,
      data: json['data'] == null
          ? null
          : MembershipSummaryData.fromJson(
              json['data'] as Map<String, dynamic>),
      totalNoOfPages: json['TotalNoOfPages'] as int?,
    );

Map<String, dynamic> _$$_MembershipSummaryResponseToJson(
        _$_MembershipSummaryResponse instance) =>
    <String, dynamic>{
      'exception': instance.exception,
      'data': instance.data,
      'TotalNoOfPages': instance.totalNoOfPages,
    };
