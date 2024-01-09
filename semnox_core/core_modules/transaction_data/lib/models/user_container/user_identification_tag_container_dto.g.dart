// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_identification_tag_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserIdentificationTagContainerDTO
    _$$_UserIdentificationTagContainerDTOFromJson(Map<String, dynamic> json) =>
        _$_UserIdentificationTagContainerDTO(
          id: json['Id'] as int?,
          cardNumber: json['CardNumber'] as String?,
          cardId: json['CardId'] as int?,
          startDate: json['StartDate'] as String?,
          endDate: json['EndDate'] as String?,
          attendanceReaderTag: json['AttendanceReaderTag'] as bool?,
        );

Map<String, dynamic> _$$_UserIdentificationTagContainerDTOToJson(
        _$_UserIdentificationTagContainerDTO instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'CardNumber': instance.cardNumber,
      'CardId': instance.cardId,
      'StartDate': instance.startDate,
      'EndDate': instance.endDate,
      'AttendanceReaderTag': instance.attendanceReaderTag,
    };
